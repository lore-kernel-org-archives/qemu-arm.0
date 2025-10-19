Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D375CCD184
	for <qemu-arm@archiver.kernel.org>; Sun, 19 Oct 2025 16:47:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAWZ9-0000tX-4w; Sun, 19 Oct 2025 12:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAWZ7-0000sl-Ig
 for qemu-arm@nongnu.org; Sun, 19 Oct 2025 12:47:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAWZ6-000547-08
 for qemu-arm@nongnu.org; Sun, 19 Oct 2025 12:47:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4282fba734bso582709f8f.0
 for <qemu-arm@nongnu.org>; Sun, 19 Oct 2025 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760892446; x=1761497246; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1UZJHhcHmf8i0TDy9eoofpqvfOwudqitX7puce+GQaA=;
 b=XN+jSGp/6kD9qNQylrl5qREXg7V+q48fncJVou2GvCFJNX9Atj5kBBUFfX/cDUkpaa
 W+PL4/f04C4ammjGpxNzi12S5NnsPbF0nD1KHoxjPjJNjN9XqabRAzaApYs2LJ4X2cWe
 jiRhGapW3c6+1mbWQHrG+liAdbAnK1tSDZNXuYB5AiqQhbiRnEv0DZb9AQqvwUXpwYxE
 6uJsSzljLrwWKmDbRHzUKu4qwTIwU7KnOn+IIKTTymwUEwEPUmRmhKn/nhjzS1+zpK1A
 jGC66dwolZN1/5Nri29CSi3b8YW3vtw9eyXAOMel7YoTtUy0pmxbPlDOANIQKB2Ji61S
 /hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760892446; x=1761497246;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UZJHhcHmf8i0TDy9eoofpqvfOwudqitX7puce+GQaA=;
 b=aTTvouEQPX0c+7emQMt3j0/c8IXN73qqr/3B7cmRP102888D4P7utFlFqXT2Y2TOGZ
 UoLjSJuSlfuhXGU6oIAG4/rOrGZCj+ZEieVt9Kb9DEONmxEsHXWN9JrcvoJHfUKxFmGZ
 f1eFyZogjhY4wHsmhNsHwuD1xWajKUQk2foe822ymGIKJbrPRb5172rwbh+awINIBNZZ
 8kJlTgFw3DcrwM3DxcPPtLETKQ2Ulhhf0uZDGgvBEQQwj4CkgN/mBcuM4locklj+ArQ4
 mA0Cls1oQLCH8Ap4d+DUmST8C+Q5ipEAObhYHcG3vRX5+5uLFx+rOuWLolNKxQSl7MIS
 MH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSB/W4dFXULf4B7yS4dVyVkbznb1bzq1Y8NBp/0eYXTvpyvvJPuzIlG5EnT+fndmNZgy0cDJVr/g==@nongnu.org
X-Gm-Message-State: AOJu0Yy9QOnicP5qq7T2DDe+8MpQctEQDvqL6wAPeCXinyZhoydESV94
 alM/Mvo8DooeKSJA7R94tXWhFT6H/QU7h0uw0i9r9Z/tL6U/BDToYuBpJlL05ZqiyOY=
X-Gm-Gg: ASbGncu8RgbsBbOVb+us4l/bGsS6yIVbCx/YFGOA3m0t9AArR4idJYZKNzO8cJyhobP
 dMwCzwDkrZQ9wgWp81isMP6AMpQzOc2ZEZg0qQJjWEk1PYE6gh3veHxSqEGm0Vx2qIQ8PZlH0hI
 RZqmYCwDdn3UFGtfjzOUL30jykoCidUUxw7AWcry8kh6czlOH4GW2LTdTDZGtyx9ukm0d8t5kIn
 s3oODIvPdPpDJejhUX/oYE8ewyjFAMvBhQRKUtoJQ8tEf4xXffvsxusEriI9SY9/SRmA3fAwVyW
 mY/S17RCbAwTqNKm2WfGyRn4CIu9HRxa4Dh/wQPJDPR9gOUsXcaGhlRGUhaPV7SV8YRvBEsj72k
 DEh2g4SsL4JiKewuudGxMBRO+pjbAQuEjn2u8SQqOEHMtPWTi7RXE0hrGfxnhgC8i2gdeK78wzq
 /I9RCo1SJz+X6QxkUioKjl9IKr9iv/W0PAJ5c+IrMjdtU=
X-Google-Smtp-Source: AGHT+IFyB91R2fbTZWYgyMGPgyBVYAgxYvcn7QT2lzIDOyZ653E/MCXG9g2TfIaeGa5F2H/5+XzMfg==
X-Received: by 2002:a05:6000:4285:b0:425:7329:e1d2 with SMTP id
 ffacd0b85a97d-42704d75170mr7228996f8f.16.1760892445888; 
 Sun, 19 Oct 2025 09:47:25 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce08asm10950863f8f.44.2025.10.19.09.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 09:47:25 -0700 (PDT)
Message-ID: <08d12d1e-aba6-4829-a74c-c59fa9846261@linaro.org>
Date: Sun, 19 Oct 2025 18:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Claim the Arm XML in gdb-xml
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251017154244.971608-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251017154244.971608-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17/10/25 17:42, Peter Maydell wrote:
> Add F: entries to the Arm CPU section to claim the Arm related
> XML files in gdb-xml.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I happened to notice while doing the SME2 gdbstub handling
> that we didn't have an entry in MAINTAINERS making the
> Arm gdb xml files fall under the right section.
> 
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


