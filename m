Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2239972njb;
        Mon, 10 Feb 2025 13:56:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFy5qqUDK3n6ayrkbVhx7I4tl71v8Tp5AKUI2viRGL7h2eCsncEGfOR6VzJDfz2ICVvs2W/grPc0mV+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEM78zd3isIx9A8CyG1XZGqZ0HzhERZm6wD+qntV7lY7fFCrtqewk/EKy8Q/rdhKS/he/l6
X-Received: by 2002:a05:620a:408d:b0:7c0:69ad:bf41 with SMTP id af79cd13be357-7c069adc11emr69546185a.7.1739224585815;
        Mon, 10 Feb 2025 13:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739224585; cv=none;
        d=google.com; s=arc-20240605;
        b=fYjJZtjkZy+hqUgqJMBqUKj9u3bzQbJ/NVpD/RPevfG0uIobjphC7Mz7F5bwEK+hBN
         p0bygoee9I0STPJizJomCF6z+WXoIxNp9RnXCN4II9s6+NKLcDUAinebwaopUuVfBz7R
         sd6aXqda4Ca9IkFL/MQWEnHastl512M5BGbmyPus8z0CElKIXX+4u0hb7uVxT1eFKNEa
         yV2JyW5Kzlp2bSV5F8TiIkL1U5iiPh2HHpGE4yTL5gM9iLkzqJC5vMGSqpnFcdwriVGN
         A0CKUKRSnjwTwZRHaWan9Elxe8PzS3NhNAgFY4QTVuXRpu/DVsPHZvlbqPXlm1TMACs6
         ewXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EB8wNvdrHW8cKwkJWprogzd09c1jUUh+Kcirc2bmyrI=;
        fh=EV/GcMPYgJK159x5kNHFjbDgoZKP0oABfXaoubclm7c=;
        b=X2bRFUVm4kLiOPx2WAtSivR0/KeqOm2y384mXzUEB99rMMMg5Hmo/T24nJ2ffvmjWA
         S08YEVGbveufgaQn9+ShDC1agr64RnfjfE0RbQIgeWa0guNbYf0gKK2kB3CcWbR7Updp
         hx4bwlwZSbJACdgT5UL4jmLnjfvsHFcgTS6tiy2BeNqiGVdpQQRTnnbkkVaqdJMn9AFN
         B1/w75KR5ZKKd2zvEcgvyfzV6jtFiDXnOAJQtqnHmwE+cb0YXMWVfLHU9YDIsc+9Jwe4
         QuKMOkLe9kgAb0b8K9Q4hW2apJV2ziZU8B+0l4ebT+D8kRxjH03LO9uZ2VAOkgiDe0Ri
         VKdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vsw5Zq+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4719f7be2basi8253541cf.158.2025.02.10.13.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:56:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vsw5Zq+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbky-0003EF-3g; Mon, 10 Feb 2025 16:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbkq-0003BR-TV
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:55:49 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbkn-0006ZO-71
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:55:47 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21f573ff39bso67861545ad.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739224542; x=1739829342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EB8wNvdrHW8cKwkJWprogzd09c1jUUh+Kcirc2bmyrI=;
 b=Vsw5Zq+2hpeLaWpq3zeXr68RFV1bbiwfzNkfLKYJQaiSKHFYLMhJ2wFalnOICRcJ8V
 NUT8TJ97ud7mYRFXNBXig+eP8PlFfCl7h99clJY2o2uHt9Rs9IyEplIVWpOJSprDUUHX
 rbptASNTDT1xJoB1j3QFyIwy5Wp73tybcyaXQgRr/s3kf6gqnV+8TOn9eXo24Yirb4Q8
 8D+uRwhUlQRa/r2ns+YC/mkV9wwkkGyg+BDvsd6kJRzl19Cu6aIsWtEUEnD5fPO4JzSf
 XTLyx3cpctE0MVX9Mx2FTxuBz8XXYdnTz5j9yJEFrcaIxAwNAti1p2Nbw3niEk5iGTOn
 aa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739224542; x=1739829342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EB8wNvdrHW8cKwkJWprogzd09c1jUUh+Kcirc2bmyrI=;
 b=FDeUHurwCwKqQglvFwYFCbjl53LKb7Zf+/FubRLfLbny/feUZ+tHYIfrhX5sHcnOVg
 3oHH5N1e45lYGKjcYau+j0hoIGEpb1pFOLzeVDJZ06lSRq3mmutAEbsmiFDEbplHypbe
 GGr99CivpO83aj8mEAv2f4Bo1AboE3quzpmsh1imNSjjd88RzyUvBV66PHY5ZoetAESs
 FHP+wzgV8REI/Bqf0hIsWJATUyV8YmcaoUYb8EAUprbee9GmOx7hX/+XcRAT00o1ar9o
 +ofqJPX3R9abdAOPHdKx7Swu094Mfb6EYyPV3A0WK0i9NP3C7+oXcdaluIXTrXTYNqEz
 W8lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqpQwCn2FeUbxRgsPmgyoYgLh4NwhSbPczwFXJhCv3TZGQDgk/TwfYrEJ1sTzz0zfueaU77NSpSA==@nongnu.org
X-Gm-Message-State: AOJu0YyJdT15MLkigY9B3OCq1JoH8sSTZTLAV3ucLhKC+GAFFCxbvydE
 Bk1hAngFhl8m+kcEGgNldcLd25gNhcEP5TydwzZ7BwuUX13k1OXiT1/zdk5jPcM=
X-Gm-Gg: ASbGncttPAdc7mA3YWHmS2ZqIJyKW/ektVNZe05vI5a7N+pBMt2wm1qBDVPr7ofKTNK
 UowFCOeEUYtcO1Azvz+u8NKYcFAH7RnN4NgZUE0vPtGMQtjgIVJ6ILz3CffMBfB47UIhmHD6gXS
 2a2g1ADru9vOTIoVtCTzK8TfaQkZBdgYavscSCQDEXo33lp3P40mGZ1FkPVmTpMVnS1BAO8H90B
 duFMaIW41qA94ScT3d7yhvwb8Z71fetamEWMUpkWYU2irdXfipSk8EwqMpyftbIpqaVithcNmI/
 9/oGxtFTRuVmGcgoHCTzNz2uc7K6744afjyJxmsf3OIppy5e3tFjhfc=
X-Received: by 2002:a17:902:e945:b0:21f:b483:2ad5 with SMTP id
 d9443c01a7336-21fb4832b7dmr24393175ad.20.1739224542418; 
 Mon, 10 Feb 2025 13:55:42 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36561397sm83910685ad.89.2025.02.10.13.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:55:42 -0800 (PST)
Message-ID: <51fc4c66-43b4-4b19-8241-ec0af2d78355@linaro.org>
Date: Mon, 10 Feb 2025 13:55:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] target: Set disassemble_info::endian value for
 big-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uNC37Z/gb7dC

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have theCPUClass::disas_set_info() callback set the
> disassemble_info::endian field for big-endian targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/hppa/cpu.c     | 1 +
>   target/m68k/cpu.c     | 1 +
>   target/openrisc/cpu.c | 1 +
>   target/s390x/cpu.c    | 1 +
>   target/sparc/cpu.c    | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
