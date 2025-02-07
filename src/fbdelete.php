<?php
header('Content-Type: application/json');

$url = "https://example.com";
$confirmation_code = "abc123";

$response = [
    "url" => $url,
    "confirmation_code" => $confirmation_code
];

echo json_encode($response, JSON_UNESCAPED_SLASHES);
?>
