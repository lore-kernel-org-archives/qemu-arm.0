Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp7898778njk;
        Mon, 30 Dec 2024 07:17:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUC53bPb3pntnz5iyt2zKyrgxzK7Kwq5Ku6eoFKhQPKaX6Li1krNyydzdgucngef3WKzaXW14y3Y7gC/A==@linaro.org
X-Received: by 2002:a05:6000:2a1:b0:388:caf4:e909 with SMTP id ffacd0b85a97d-38a221fffe4mr29804488f8f.25.1735571835355;
        Mon, 30 Dec 2024 07:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735571835; cv=none;
        d=google.com; s=arc-20240605;
        b=PAXO7T7ZVr1IuatwZDgWiTx1y2+lwWCPdiaJvLkp/cR2Ku6lf6+g0ExX5agcAt9+le
         hIrOANjb7vTdttSvZ1YjgCChwfDQXQSyWz71CnKwO5KH0gDBmfZqzEZpKw/ZcYi00bYN
         FTcSk8409WzOlEepVffbp52csh+o6FVJzFprTz2/iPxFS9wh1McpjIw8sKarua09UlZ6
         HMb4gn4PW3vgp32U03uhiEy+KB10Nfe5Caq/gR3+vRlAf10/+yuc0N3XhlrFudUo6SOM
         tI9N6rVELJiYGIM92JmiX3fhe8J6kZ4PLz2W0Ha7A/47Dklu7Vd+Eb9woW5g8dt8XxtR
         aOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TgEaK9IIv9JgU+XsTIrVRbeP3BFI31d39ksXkKneY5k=;
        fh=RSgR446Z1ZHYXNaBnStAf4gXhjTQdCxTSn+OvU1L8K0=;
        b=cCk0D/93jlOhcXkvZ0XwQy0LaPK9YmsOAVKkthGm+8iLFV5Qk7Ur3EN+njTAVgjxSu
         toF/Ey0f/zDKlPnodkmBiOoWMJtMOVWB/5Zmt2QzHkXS56I8YF2ZPKxLSlMfjdAeU5Bm
         zGFpP6zy6KWDQ4U0vmHVkWsv6C9PHAKGDStRGCy2D462/OaN8MaygdLQeVVHT6UaC952
         0Cw63xKceS9H+HQgudvD6VtbAZB8ltxs8lffbcAp8lpbMtia+O8Jwy6nx+wbkB/Q0beU
         HmpMH7Md6M1H28iPrkJ0WN5SjHgs/FFiOkvd4eDHryBRX2qKn+92tDQPpSy8U+kZBfi9
         Me9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrZA0FiJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c6acc3asor5979496f8f.0.2024.12.30.07.17.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Dec 2024 07:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JrZA0FiJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735571835; x=1736176635; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgEaK9IIv9JgU+XsTIrVRbeP3BFI31d39ksXkKneY5k=;
        b=JrZA0FiJa91O6KC5KUzcvJjW08TjbpI8LgTzQeDOCC2Ge10SDlXK48mimMT9jS0DXl
         1wpy5uHSU0ttoJaz8H1GJ66xEum9M6SQPD5ScgpSF6HDlhGoxbIVtgrkfmxD6n3HGmMs
         YC9SvlaBtCS+bzCirQEQi0xSXmidTO4dTzcI9KFF1jG6Rtc6iSl98kFLAuFzDSLNso1h
         3mTzOL/2wYi1keA8Z3eXcDfdIXWUnR7X3RRNRdBePvSDQVVr9L96IUhiqLlXy9Pchi2L
         lQgIQqDIR8x6OMixMGO6sMrA2Z3F8Lx3nRjAiVWehsWn7NOw3Xed4vxRyzwFbcycLGIc
         +SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735571835; x=1736176635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgEaK9IIv9JgU+XsTIrVRbeP3BFI31d39ksXkKneY5k=;
        b=EOMn6yhqQb0dnL8Y0APwvwBbqxZCc6pyxWT7Ex2KO75wYHvDAVYfcMlMYKRUHdRCTM
         cLTh1bGZ/K/B9kqDOzUNWjVg01x/PICDUdirx3PLhcYBsVeMRZ/+kfbllLkTEl9pgMqw
         wOYsBE/JpkT3x7zAVRdZ8misRoLtI6W1FPEUWOom56FI7eI30atXQ/bbrM1ckM45tIVh
         OH+JMyYidwzOMZjNMjFqamjaW15x5DR9lQBqUCXQ5THGewOjnoxl+jhJzBlBQm4DzhCO
         W90wl4IRfSJIlV0S/6LgMVhDGdg7KH23MVrl8BdYtNgAE6zJWevxlqIz7pAvc+tMV7El
         HXug==
X-Forwarded-Encrypted: i=1; AJvYcCW8M+V/Yq+5C6gdZzYUdBDf0Tg/NfwbDX1DC3pOxYyDTlw7aKLO7HlWcG/xRz1kWdkfmfT+3IY0cdJUYg==@linaro.org
X-Gm-Message-State: AOJu0YwrQq/fTGsfZc+IfXuPbLKFk/hNhaBax7ecxnPN7sxCFSYMJW02
	3POj6UtB/1FQQMYikz61U288szE2YPWTLI6Q6RsPQtJv5VrLOl3CngSVVZuxXIAFEw==
X-Gm-Gg: ASbGncvxmnDhEhj6wb8p9RvjyHLR4T7PwIbXmjd4i1zmSmVuCEBFQsnEFfpx5aYIMYw
	SXLl+9jGDWoess4J67yFzM6tRGYKAXLppHyg50C7t2s2oTDPpxED5zZqWA/fimohu5syek1ZLwz
	fSy5vAFA/u7BEofN1VXQPevYMCpdnGUqHy7OFOwZ9SHWXFWnokYkehc3Rx1phu4mHQd5tuqZ/zV
	nf1oq/gidN50yfQZHIJ+en2fiZ+T4CVR8/tBdpEShd8ppoSUDexuCsyrylA5VjzSEf/JpMtUQ91
	z19wW+P5WPYPyKuunADuIWrG
X-Google-Smtp-Source: AGHT+IHyV7U8iMyEh1uJzuCBhfDtgFD7zDM23Hhl/a1J+Qp7Qu4pUQsLRD3WA/h0LsBWKljj9iswrQ==
X-Received: by 2002:a05:6000:4029:b0:386:41bd:53a3 with SMTP id ffacd0b85a97d-38a224083afmr29857472f8f.50.1735571834838;
        Mon, 30 Dec 2024 07:17:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea4a7sm356850475e9.3.2024.12.30.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:17:14 -0800 (PST)
Message-ID: <626e4b64-bf09-4dec-b353-b9239ee6d7d3@linaro.org>
Date: Mon, 30 Dec 2024 16:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] tests/qtest: Update tests using PL011 UART
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
 <20240719181041.49545-10-philmd@linaro.org>
 <CAFEAcA9QA3Kn3h_bwMSoht7KZa8DOpMXFDUWon1kc+iHy59-EQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9QA3Kn3h_bwMSoht7KZa8DOpMXFDUWon1kc+iHy59-EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lIvSaM0pMfXp

On 29/7/24 17:47, Peter Maydell wrote:
> On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> We weren't enabling the PL011 TX UART before using it
>> on the raspi and virt machines. Update the ASM code
>> prefixing:
>>
>>    *UART_CTRL = UART_ENABLE | TX_ENABLE;
>>
>> to:
>>
>>    while (true) {
>>        *UART_DATA = 'T';
>>    }
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/boot-serial-test.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>> index 3b92fa5d50..5cb309ccf0 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -70,18 +70,23 @@ static const uint8_t kernel_plml605[] = {
>>   };
>>
>>   static const uint8_t bios_raspi2[] = {
>> -    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
>> +    0x10, 0x30, 0x9f, 0xe5,                 /* ldr     r3,[pc,#8]    Get base */
> 
> The instruction bytes have changed but the disassembly comment has not...
> 
>> +    0x10, 0x20, 0x9f, 0xe5,                 /* ldr     r2,[pc,#8]    Get CR */
>> +    0xb0, 0x23, 0xc3, 0xe1,                 /* strh    r2,[r3, #48]  Set CR */
>>       0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
>> -    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
>> -    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
>> +    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3]       loop: */
> 
> This placement of the "loop:" label is odd -- usually the label
> goes before the instruction that a branch to the label will
> start executing at.
> 
>> +    0xfd, 0xff, 0xff, 0xea,                 /* b       loop */
> 
> Here also the bytes changed but not the disassembly. Since
> 'b' is a relative branch, why does the offset change?

It felt simpler while single-stepping to just fill the TXDATA register
with the byte to send, and not reset the other registers with unchanged
values. Anyway you are right, I'll split the changes for clarity.

> 
>>       0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
>> +    0x01, 0x01, 0x00, 0x00,                 /* 0x101      = CR UARTEN|TXE */
>>   };
>>
>>   static const uint8_t kernel_aarch64[] = {
>> -    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
>>       0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
>> +    0x21, 0x20, 0x80, 0x52,                 /* mov     w1, #0x101 */
>> +    0x41, 0x60, 0x00, 0x79,                 /* strh    w1, [x2, #48] */
>> +    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
>>       0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
>> -    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
>> +    0xff, 0xff, 0xff, 0x17,                 /* b       -4 (loop) */
> 
> Another unexplained offset change here.
> 
>>   };
>>
>>   static const uint8_t kernel_nrf51[] = {
>> --
>> 2.41.0
> 
> thanks
> -- PMM
