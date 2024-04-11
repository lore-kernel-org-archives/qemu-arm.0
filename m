Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp146320ejv;
        Thu, 11 Apr 2024 12:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSu9oyyHEQllevB/WFEmU2OhU4xeALmkNa0wlDlWASGggLgVeaM1hx6C98rsnLw28TChXylp1pkOAkUYVNDDaZNVz9uPV3
X-Google-Smtp-Source: AGHT+IHKbxyWhfhVNLlyz+XKgWfLWk7YG6v9nEf3FNDpejH86wxP6gEIfhwe8mWrqtg2rpATOAWN
X-Received: by 2002:a05:6870:315:b0:22e:8539:60a0 with SMTP id m21-20020a056870031500b0022e853960a0mr431540oaf.46.1712864549199;
        Thu, 11 Apr 2024 12:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712864549; cv=none;
        d=google.com; s=arc-20160816;
        b=coNP4qO+72DRwRx0mCawmSZaIPn/Z8m7GGThDLrhANPvQxThC3ePNmu+yUz0YRV4jC
         Vr/KXh7/gDYkaqpVsWRO3P3fi7V/KBefjFRIzefTPYVblUuOG9EFQHRgTm827/lal9PV
         cs64C/kRE1f4SU2BkcfBU3jOHGR/sbNDDPDM766gi0UerxyXZT/Nu2Nedj0Js3427haI
         o1hPdGA2CyhiWzHGz87s5qm3TSmxgpeemXCvDUQVR3VMDngPOnjoxjZmAJfMGlfSxEH2
         P6X3ehe0Q3N1n7oD3CPaMNk3UnPpH0xyrLOBUBKk95pEFoIN7yv3cXqvS7XB3CD+ySiY
         JF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AWHpk2kciW6Yn6UO7nRjO/nw0NOEfCY/14936J671PE=;
        fh=egm2G0gdZaWd98EpG7wMmSkMbtWdeaWPfyBnOMZKeBY=;
        b=f7n/51J1MUNuvTGi6F+IPPK2MYDU38emdlkaJVoiDC3J+K7GFAiMICVap4JmdCxKOS
         ZaZOWOqwXbO0OYPT1jVaXdhG2cUCeYeNG7+Yq0VZ49N1dBde6ntK34EXhGlndz/QMunv
         RMPEUeKj9vOxoftbNRHmC08bAtTkGxV8X4E4ritkOp8rsOLVD8GlxjQvmbTGLNpci52h
         ru/ffnIdOaY7rDd4dUu3D8wNYV0XDeOIrnxULCW4MJpdCAsToTaFcVDspx1T2czDBDTX
         iMYHy+tm+/1aFoGD3XIWXGtvI84VIahC+AvzdOazVjWMNMBvrI+3Dj56dFvLaLNPIV38
         Ht2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sURWW42R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05622a000c00b00434cb18aadbsi2057347qtw.562.2024.04.11.12.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 12:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sURWW42R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv0JM-0005m3-0l; Thu, 11 Apr 2024 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0JD-0005fj-D2
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:42:08 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv0JB-0002YL-0u
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 15:42:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1e5715a9ebdso1984935ad.2
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712864523; x=1713469323; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AWHpk2kciW6Yn6UO7nRjO/nw0NOEfCY/14936J671PE=;
 b=sURWW42R+D7DBheT64ztgrLB2OEo2TejKZeLJT8wkXRi2jdJAnqGwCPT9vTLFh3erN
 b4Rk72KRBSk9mf8kJNJrdjWqxKNiYDZkyNtTwsMeUuPxZ8h9tO1f6sf0uoLZ4N+keddm
 2xCRQSAa6EOZcoKHJI3aQWnkgbJlhspncC/krUjo12f+fHAr73oMkqBXka8irlDEW308
 kn9f1iqHg5Tp/yxZs2AYlE7xLH7AiNJBTJg2bumECftchirDvpwbRsQSZf42e/dP/d1g
 NybOI4ADmOHI80HZbdN0oCuDqz5Dkt94n3+e6RoI0MELXA9LPBLTPHIF4Camgzkjo6rF
 YRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712864523; x=1713469323;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AWHpk2kciW6Yn6UO7nRjO/nw0NOEfCY/14936J671PE=;
 b=jO6Ih4dkUWzo5Bk8UsLa5nJZu/vsWdWrbQz+oBzcalAHp3o6go4YvWY1TqrqEwYjI6
 ACxFFESPeEAlbZFzyxYlR11CKwSwRjpua2lB5ziZM+2digfestNu1dTyJjcEWPs5y5Op
 CieywvrjFTPhkIG8X9j6nBmKL+VR1XSIiJfgt9ZSED4N4CnRf/1kbc8XYu4l2VjLsvA2
 wR60BkTTyXpNYktsdKuYMnIeD59NpQ5wTOpxPVWcOdTSGa01qpuTFIjsk+ID/OwDbO96
 ltnxoOe8xEsLKvuqUwJF8ppqcYiYgsz/tZ4EE3ILm7NwXb9M34ZMcumkWBcEPpSKcZO4
 +khQ==
X-Gm-Message-State: AOJu0Yx1ezJg/ugi93FPEJTsbH712czninoqWii7GIL2J7h42asvfvGU
 SXDC8tHonlVTm0nbdbLHFrnZs9nVMQ+6Gpu0oMWBZgqgokW9hORUEQLNuHlY0fY=
X-Received: by 2002:a17:902:d492:b0:1e0:f522:2cde with SMTP id
 c18-20020a170902d49200b001e0f5222cdemr525009plg.14.1712864523503; 
 Thu, 11 Apr 2024 12:42:03 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 im23-20020a170902bb1700b001e2936705b4sm1565198plb.243.2024.04.11.12.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:42:03 -0700 (PDT)
Message-ID: <c56a34d8-49e1-41d4-ab1d-f9b91cb01725@linaro.org>
Date: Thu, 11 Apr 2024 12:42:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] hw/vfio/pci: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: aZd3+3NYHZuu

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/vfio/pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
