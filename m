Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2041786ejb;
        Mon, 29 Apr 2024 01:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxepRMcOMvxQQTpHSjPyicUTXqjtlXkRCC79WtqBNYqqilwpyxL+IqPflk8L1BQEEYdkPZWcFUDj1uSxU4dNQF8G93roNV
X-Google-Smtp-Source: AGHT+IEl8acGVrMzg8Gv3EvAse+L9eStC3WN57xuuo6i+mVxTGgG61cw1ByqSqWFnb6eVl0emuvI
X-Received: by 2002:a05:622a:84:b0:43a:bd92:6ad4 with SMTP id o4-20020a05622a008400b0043abd926ad4mr4770538qtw.46.1714378723837;
        Mon, 29 Apr 2024 01:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714378723; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKDK4upU7JDou5q3vkVOm/uzvY9X5kB/biBFDG/uOOeAP4Yq62AKzDYB80dBJiKvTN
         buLV35wAz+FIg07I5rGTECB4dRY9XaxHe/ARTCioNQ3pZNVdOSfzP/UxoeLGH8Se84yP
         Hr+xoxdBBlSEkrI8tiIQjObE7WW+z5Uk+ISk5YLEN/PzVVxfRNaooQpMGRrnUnKJeQqB
         r3PX0k299rbWOx//GSP3DvwDGJC3ChLRHgukxLOk8rn+v8BrAGr2SI5fjaUdRdYTkumf
         FapgSwnDiRq8IFEkkc7fkeAlrzethpKNklcBtoXEJlCrRK12Yf526boiIwCBMxMJDKyS
         agTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+jYjJeRfh2Sv+cRuiHXrA7VNex+0fAJJdEjw1BQ35cw=;
        fh=wYAe34MjOFcSkOaoaGz+mB5l8atiFt5i7wxp4VENG5M=;
        b=g23QWcEL1K7TaMpzyoeRMkSZSgWu2cWxyXeCd/vbNp01ZAAtj5BgvUojGoTShP30R1
         wiZICaGucPsYo2RBbhaL73vzdZUce5XIJ/NKtX3NY9YQ+Yj9fi1ObNPbCB+rcrgwS13Q
         PVQXFn68FxrhhLl2QLvZEC5uDZCKh9ceuqzUollQGGQ/cXv3NI/NVJSYgjybUcYM8tte
         sJaAn/cOjg1vLuy1JXb8oymJjGOBCdORW6juulN+Lj0cnbhBIOwCD6fWw/CCXMru/Q8u
         EL7QctF2C7Fg1FH8A+2Wdp18tRkwlzqMkOVHx9LjUdx4kg4xiDJs02HhYVLm2axTiBnB
         jgmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTbkUVDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb17-20020a05622a1b1100b0043aee30696csi1670215qtb.404.2024.04.29.01.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2024 01:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTbkUVDp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1MDW-0007Xt-Uv; Mon, 29 Apr 2024 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1MDO-0007Sr-K0
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 04:18:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1MDK-0007vS-Gj
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 04:18:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34cdb750bb3so490543f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Apr 2024 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714378697; x=1714983497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jYjJeRfh2Sv+cRuiHXrA7VNex+0fAJJdEjw1BQ35cw=;
 b=fTbkUVDpcLTA90F7rA3oNj/MTfHt1eZEUdjevTZP2PC0wBdN7NjdFLrN2ONqY8b4/F
 L/vlAb4cwSfQkogY48wQzPDQF57Te1LqmzNdDwEdyCjywpvJbuVVueXH/q3qlrCPk5Hm
 d/xkJR9LcheIv6IbrVei4c547IPjGrxPa6FLtIvYdoyUEJDJXweGxWaZT4jgiD5zSt1Y
 nYa9cE/FUp1388iUi5QqSdyBBRpD2QBwwzcC/7Uv7t13ye/y3QHVd4fuhHEjWDx1o9rR
 B3rF0gLf3bCdjNaE28P0D789irXh3cV8MdyKIGwbRsl6fLdKn/zlTTdVXxkaXGYYkF/f
 otog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714378697; x=1714983497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jYjJeRfh2Sv+cRuiHXrA7VNex+0fAJJdEjw1BQ35cw=;
 b=v45GQ6XIB1FM7I8xMUMqFBo01P1pgjHjLX80rLUoYCXoHGTCUBdQEAuts9hPJVXVo3
 uSbCoJ77xoAdKMfFNE+G4RBAoaFIlMmItUVjg+khSA9F8SNYbwBLGRlzSbnAVIPJUjtJ
 cEXPgNM5uznrYboF/xq9jm/IengT4x+VSjyPairC2Dll7jTjdmAEUK4/KlnBfLYQS+Jb
 t/kKCrxR0lIPSR8Xlp/d0P9+29pBz1tpq7f76vANBu+FZ69Xa+60Y8ThAgL4VGIxdx3g
 teIpVP6GOrRrX7NY4KDtCjZJ28Zg6oZlD/O4BQXqFwbFDw1gfIUcOcZUpIv+LwTUZXkd
 oVAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxKSY3cC83joQnrGbvS907nt9TaT+BNQHa04nZJyt9KT9tPsTv5AhCaPM49MNv8R0MnzkAvi8QUX9zzc3cEg+awVl
X-Gm-Message-State: AOJu0Yz2M65blPeR7dBnulVmZgGTD/03StC4YvjR9kOxzs/x54Epk4xz
 tx4xMB0n8qacnQCxROPnreYV1Ld0ZdCZ8HJ1RqagFa2rIzNbCznpaV0BdQXHyao=
X-Received: by 2002:adf:f34d:0:b0:34c:600b:b016 with SMTP id
 e13-20020adff34d000000b0034c600bb016mr7554749wrp.27.1714378696904; 
 Mon, 29 Apr 2024 01:18:16 -0700 (PDT)
Received: from [192.168.69.100] (bny92-h02-176-184-44-142.dsl.sta.abo.bbox.fr.
 [176.184.44.142]) by smtp.gmail.com with ESMTPSA id
 r30-20020adfb1de000000b00343e392829dsm29080304wra.97.2024.04.29.01.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 01:18:16 -0700 (PDT)
Message-ID: <db6a1901-6264-48ec-833e-863f8d54e680@linaro.org>
Date: Mon, 29 Apr 2024 10:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/stm32l4x5_usart: Fix memory corruption by adding
 correct class_size
To: Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20240429075908.36302-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240429075908.36302-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 87uJLYpSOQBm

On 29/4/24 09:59, Thomas Huth wrote:
> "make check-qtest-aarch64" recently started failing on FreeBSD builds,
> and valgrind on Linux also detected that there is something fishy with
> the new stm32l4x5-usart: The code forgot to set the correct class_size
> here, so the various class_init functions in this file wrote beyond
> the allocated buffer when setting the subc->type field.
> 
> Fixes: 4fb37aea7e ("hw/char: Implement STM32L4x5 USART skeleton")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/char/stm32l4x5_usart.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

