<?php
header('Content-Type: application/json');

// Leer datos POST
$signed_request = $_POST['signed_request'] ?? null;

if (!$signed_request) {
    http_response_code(400);
    echo json_encode(["error" => "signed_request is missing"]);
    exit;
}

$data = parse_signed_request($signed_request);

if (!$data) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid signed request"]);
    exit;
}

$user_id = $data['user_id']; // Ahora estamos seguros de que existe

// Start data deletion
$status_url = 'https://thepond.howtohockey.com/?id=123';
$confirmation_code = 'abc123';

$response = array(
  'url' => $status_url,
  'confirmation_code' => $confirmation_code
);
echo json_encode($response);

function parse_signed_request($signed_request) {
    list($encoded_sig, $payload) = explode('.', $signed_request, 2);

    $secret = "e8d727a96f00fb94d751e9433ca81ef1"; // Usar tu app secret

    // Decodificar los datos
    $sig = base64_url_decode($encoded_sig);
    $data = json_decode(base64_url_decode($payload), true);

    // Confirmar la firma
    $expected_sig = hash_hmac('sha256', $payload, $secret, true);
    if (!hash_equals($sig, $expected_sig)) { // Comparación segura
        error_log('Bad Signed JSON signature!');
        return null;
    }

    return $data;
}

function base64_url_decode($input) {
    $remainder = strlen($input) % 4;
    if ($remainder) {
        $input .= str_repeat('=', 4 - $remainder); // Padding si es necesario
    }
    return base64_decode(strtr($input, '-_', '+/'));
}
?>
