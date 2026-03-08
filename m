Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A49FEA8543
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 21:55:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzM5y-0006NT-BD; Sun, 08 Mar 2026 17:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzM5x-0006ND-G1
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 17:55:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzM5v-0006J0-Vv
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 17:55:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-485392de558so2065265e9.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773006926; x=1773611726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=brHmvF8C8Vpmx/AM9QBAe/Pi3n+cQyjXbHdFnAx+i/M=;
 b=nIzl4s6HcnMuQ3v/v3jUxJv/WYEGOs53pYSdQH6o2a/m0Fb2hbFf2qP0NaJezO9srU
 WdKquUhZ5DKTHK0YXCRIy2c6rLXWsvoprobLZiLos1JLhozAAPcf/pHApVdfGrbQnxdJ
 JymbE2F8/kP9PdNdZIYbHBieCpKrUSzzDuP7blHSX3g0aUp7ToqMveiczlJ7fpIG+wfv
 wsntmS+PErULgq3cxfVpeE8t5wXqptrwd3py4BLIBsbCWmEwdr0yhb3bY8WiUxNdbzSk
 l39hkBNYcZKC5TQQLjIGka/Ds4pr7vp6JwW6WKepCWZ1Y5jp1+AZwreqjaVvJB1Qm8A0
 m8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773006926; x=1773611726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=brHmvF8C8Vpmx/AM9QBAe/Pi3n+cQyjXbHdFnAx+i/M=;
 b=rOUm03m0ZbtJ3FYL2RaCCQdN7KZk09+aoCOwXB4+Kw4PQPD+JbK4IxN3LF4NSGFOSE
 GrxCvbfS+IcgELLn9RlQ/9n6uZ7kI60zYLFE1cpWMOQ1ucuH1+8PElnwV6qi8uGzVbDn
 rAnl2nS/BlG1ZhVjn9nM0cTwJRmi625Xd4tpo02mBCr76fC538hiCANkk9T5h7//b4GO
 K5hKMsS/voXpkjj/fFJydpG3ALxG8TdVT1FvWOD0ghPBUwpR3Mr66DMXr5q0y78JoTW2
 z6xxfcKjGBbErm2PW9Yy9J3dhG9NSzs/dnYVohKZIMm1nlYb9AXk3qOupjr5YZyYQxuX
 i1YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmagj7kUdfrY4q94z4ShmvG64W1VLK9d6P4k2FWNl7tcrvcYXdcZl7fAlPy3eX2ZTv6gEflDDHww==@nongnu.org
X-Gm-Message-State: AOJu0YysFQUkwsa6lrf9BaYTLHruoEV6jCieyg4IA1U4vQYQZJi0XVly
 K5rmcrfz8y/8CVdHhVT9+r4GyTudsC66IEXXv7ZwLpHPKZPqZKUvYj8m46JYsVoP/lM=
X-Gm-Gg: ATEYQzx/mydWLEhybfX3YhsYyJwON54CGGL7SvJpq9MxMu9R/OdDE+UQaIeiQH/NfRL
 I+4HSmWZCQv7kVr2TtuOcBSsdkZmFXaInO6vA+HshmOlKf+SW75vFJ1oEiJfH/o5pUErfQ203FS
 Umbbg687tVmHfBSRBkVj6eoRDDKNd2osbIzfTTiXiWWqWVRGVZ3LgeeK6wTzOruRaPcBiJG/Rd2
 90CBYm6Gncasg5SIvs7kC7k1ulXv2Phiopd+WFjmxfJbsxiX+9oBLMriWTb0h5T0E1v0snJzyM5
 sKj5e7jQMRQM8kbTw/ZunVFmfQDfo+OjdmKxTCNgeyF3TT5lPl3q9SAR+B+656EmZ4R8KJu6p5e
 QqroAQ72oOgGn67WPLo5dgKsq3sfMv4vtTWbR8qDnb4cS4/f8a7LkoDV5lBWDcjewafQCbC7o86
 Alq5dVHSWqMwaHOo4gNIUcGWdjQhdAvitzQ+iYsivYtNw6GF9MrMEMKds0FOQ87rEABg==
X-Received: by 2002:a05:600c:c4a3:b0:485:39b2:a47c with SMTP id
 5b1f17b1804b1-48539b2a60dmr40326515e9.25.1773006926315; 
 Sun, 08 Mar 2026 14:55:26 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae538bsm359063435e9.7.2026.03.08.14.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 14:55:25 -0700 (PDT)
Message-ID: <5a2fa521-1575-4237-b91e-c19bf8b04ee3@linaro.org>
Date: Sun, 8 Mar 2026 22:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] hw/char/serial: Add constants for Line Control
 Register
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260305220911.131508-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/3/26 23:09, Bernhard Beschow wrote:
> Substitute some magic numbers by named constants for slightly improved
> readability.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/serial.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)


> @@ -153,23 +158,23 @@ static void serial_update_parameters(SerialState *s)
>   
>       /* Start bit. */
>       frame_size = 1;
> -    if (s->lcr & 0x08) {
> +    if (s->lcr & UART_LCR_PEN) {
>           /* Parity bit. */
>           frame_size++;
> -        if (s->lcr & 0x10)
> +        if (s->lcr & UART_LCR_EPS)

FYI checkpatch is complaining because you are changing code
that doesn't follow our coding style:

ERROR: braces {} are necessary for all arms of this statement
#42: FILE: hw/char/serial.c:164:
+        if (s->lcr & UART_LCR_EPS)
[...]
          else
[...]

Next time better use a preliminary commit addressing style.

>               parity = 'E';
>           else
>               parity = 'O';
>       } else {
>               parity = 'N';
>       }
> -    if (s->lcr & 0x04) {
> +    if (s->lcr & UART_LCR_NSTB) {
>           stop_bits = 2;
>       } else {
>           stop_bits = 1;
>       }

