Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp855772njb;
        Fri, 6 Dec 2024 05:49:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJuavaqc/u4ms20Rv2BphfjM12iw0PKOAlUW8Cmy4NLj8H2C9VJXCOWy6rO8VtzCZ/Pj7hr4eO1wTmyw==@linaro.org
X-Google-Smtp-Source: AGHT+IFceLDXyT4/VxulvUeCs0wolFxb2+HDRJ9FZuQ7352cXvvQM9PuM31H4BlVEZ9iuVWm5oy3
X-Received: by 2002:a05:622a:593:b0:466:a2c2:f372 with SMTP id d75a77b69052e-46734f877e2mr63104431cf.37.1733492961971;
        Fri, 06 Dec 2024 05:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733492961; cv=none;
        d=google.com; s=arc-20240605;
        b=AyWlw/Kyjzpe+2W6Fv5ADE0uAjur5ZDjxQBuD1OIyoGuTWxIyv5Xg5etgZp1zELtjs
         twKK7XFy/IPTN1RFVNgxiIoNW5eb2L4ATw7CNrRGVQEqlQ+fRI0PVGKVtZ1LLfO7YI40
         /xx6dU5FtqOoGSOKoakjES/C335m78vHyBObC062YY1+O0ud0wAv4vWHNZP32S+J4hRd
         Q2a1GNHHMfzsSHFe+CgeGfuOfI0TndrZ4taS7d781j6YaXTdFX8Bxt3LjLUfFCMJbckV
         Q8VqFmmxrW6/YrvyWVJL8x4tKk385AUB4hyuASJ88KTqtMV/9NzykToQgZpiGJFS4PlM
         55pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=+cU/zZcP5e/a3htaphQUpVI4UQ7/v644t4Ud/b6il8s=;
        fh=AWdPTsb0a25odO5/lP+nbaWeyTRU1DLH8QwdOSJsUp4=;
        b=cjMqgAdHZSHDwmeJdZBRDhsXYApcWjwx4eO3rU7ovBhBJUDxkQ8j96U0iNy4uBF/xT
         5Mvsp2lHnumdjnEQDwhIc6M7NWlIzSgk0q94uT9jwPYEN6P3XF5rxe6DfKVy6jQbsOu1
         nD1r2yL3qCGth72Ui+7Xy0CnmakwZbF2X8kpeFcRjQWrwNDUocebwiscV1jdDQ9E3C6N
         8rs1PooPcZD3nAO8I1uj5kQRC67y9N7l8KRGm0YxS5sJTVZbv1cnz1+ZMqzHmzgf6FCq
         qzJY+qlG4q3fD1+b6hFajmzdlSC8L7KB1cSACNH593CQ31wNi3k4UTL+PMUDPDhORRkS
         jGOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f52QaJ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729835a62si50939701cf.527.2024.12.06.05.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f52QaJ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYhl-0005Sf-15; Fri, 06 Dec 2024 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYhc-0005NA-S4
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYha-0007cb-Hx
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733492941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+cU/zZcP5e/a3htaphQUpVI4UQ7/v644t4Ud/b6il8s=;
 b=f52QaJ+jbGYAYhZn/+lpnQPC475IlAYgIJyh25n8UyNEcKYdgQfqantE5TZw2xTSM9Th8X
 /EhpGGzaPsnF8lqyrth5RcAvbzvseuf8WPquvny8KB7WSMx4bX4515+Ma+dj2pl/Ko8z05
 VcglSaVMpxgYif4Zqh2Da3BUkIaWbNk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-0Vis6OuwMhy-4s2WRokmrg-1; Fri, 06 Dec 2024 08:49:00 -0500
X-MC-Unique: 0Vis6OuwMhy-4s2WRokmrg-1
X-Mimecast-MFC-AGG-ID: 0Vis6OuwMhy-4s2WRokmrg
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434a27c9044so12706925e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733492939; x=1734097739;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+cU/zZcP5e/a3htaphQUpVI4UQ7/v644t4Ud/b6il8s=;
 b=CCdvwSjT4/BV2m9RD7jcWzIGaexaSW/jY+pTiQQKSeN2mtkoVpDqByT/FDfZ6eIZ+T
 H1/Nkm+7ydRMupnz8PswgffQ2lmgs3VAHvhpO+lXbx0WPAauQReqVyQR7Y8u0xKKLTDW
 WK/fsoQ4G0XMb5n0fp8xQwraloYhNrBtHllW/+5WFhIKJa0uIh0Qp1P8s7CiMmpBe33P
 9Y6zKl93wjYFunM53GFXu8FwS8QyWclv8zvYDBxTzwYOvrbJZLVTCAQ6B9WIbZKAzcKj
 Xz4n3P/n3PB0zN3VRga8I+O7Fqr6yqS0crST6gcJQRJFrVuyNWWA+Iv5Bfrc26V/+NH5
 MFWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWasRwI01Uc7rHqtC39EJChy+W5z2aOBCGqh8EmaGFIyQSKxXOcA/WS3IiogY4Q9PBqlc15hojDYg==@nongnu.org
X-Gm-Message-State: AOJu0YwJW2ReKW7xBUEENBhl1xbHv0+rfvD56iOiZqzHSQ3J2ufsj/GT
 0wMj0jOQgwbZZJm909XV2hG1X25GkSR+FSWBaipoyfHh/N4x87Sm7Q64znO2AuZlkjTWS2H8twV
 +yXXRGrFIxNdIE3eYrDojLwgPBIWlMudYFaUoDZUYFti6PqL56A==
X-Gm-Gg: ASbGnctIET2KMCyDLtam3+ze+aoFBszFh9J9UE3aMKnv9gyZDXd3wrUIpRwJwYO7hUH
 kdl6GlHnmAa8Phg+rYXVe138FRBXq9qoCgHksVl1XkoccGBKLu5eb0l9E7vRuRo3qoUsdhQR5Co
 /GiLCvbgNPfI9kXgQ5cl3RHRg9LkGir/PBx7gBVyp7aqggQGJ5lHEL63Q/ccJW8LQ4/fHD9HZoK
 J40jE7MGMiTdsYhHNDIuCYg+znrU1/20E+FmWnB32qJ2mhlGt8B8ckPJssmiIQGV7Odb9ekgP1x
 iBNRew==
X-Received: by 2002:a05:6000:2a1:b0:385:e303:8dc6 with SMTP id
 ffacd0b85a97d-3862b37801bmr2303997f8f.26.1733492938905; 
 Fri, 06 Dec 2024 05:48:58 -0800 (PST)
X-Received: by 2002:a05:6000:2a1:b0:385:e303:8dc6 with SMTP id
 ffacd0b85a97d-3862b37801bmr2303978f8f.26.1733492938505; 
 Fri, 06 Dec 2024 05:48:58 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-244.web.vodafone.de.
 [109.42.48.244]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386321be911sm135095f8f.49.2024.12.06.05.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 05:48:58 -0800 (PST)
Message-ID: <743c8876-91eb-46ae-a3ea-4bee0ddb4e89@redhat.com>
Date: Fri, 6 Dec 2024 14:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/functional: Introduce a specific test for
 ast1030 SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241206131132.520911-1-clg@redhat.com>
 <20241206131132.520911-2-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206131132.520911-2-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v9lLZivS2--QDHoYeySNMRFMVgVqAGhPyW1mHa3bESg_1733492939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3QlaMAKjCpAY

On 06/12/2024 14.11, Cédric Le Goater wrote:
> This simply moves the ast1030 tests to a new test file. No changes.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/meson.build                |  2 +
>   tests/functional/test_arm_aspeed.py         | 64 ----------------
>   tests/functional/test_arm_aspeed_ast1030.py | 81 +++++++++++++++++++++
>   3 files changed, 83 insertions(+), 64 deletions(-)
>   create mode 100644 tests/functional/test_arm_aspeed_ast1030.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index d6d2c0196c76..ef593d4b9928 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -18,6 +18,7 @@ test_timeouts = {
>     'aarch64_tuxrun' : 240,
>     'aarch64_virt' : 720,
>     'acpi_bits' : 420,
> +  'arm_aspeed_ast1030' : 10,

We've got a default timeout of 90 seconds (see the end of meson.build) ... 
no need to set a smaller one, so I think you could simply drop this line.

With that line removed:
Reviewed-by: Thomas Huth <thuth@redhat.com>

