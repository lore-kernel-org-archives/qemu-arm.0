Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36624njj;
        Mon, 28 Oct 2024 23:10:40 -0700 (PDT)
X-Received: by 2002:adf:8b5c:0:b0:37d:5130:b380 with SMTP id ffacd0b85a97d-380611a1430mr10030864f8f.23.1730182239965;
        Mon, 28 Oct 2024 23:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182239; cv=none;
        d=google.com; s=arc-20240605;
        b=MQHJKEFiySwSNR9HjYX7Xwtj79PZ6EMxbC+7SLgrCn0YS2/6kvFz2ZmXfEavE0ySax
         O3DYluh9vhYK/iwz66lo/g69o0vUatyR7qnusBVfjgTGLnRdXvnMrgC73zjFvOPOYgTe
         a9g++o20ORKXKRujfdp70CxToc64Hv8qBd6GA9F6dYXQzl9tWl0yIv6kez76UoAJ2kh1
         eL5YnjvvTVBnlyltVE4sMuCj2nuWK7uFEKX27th8vFJbUmjcafskDP0lSHAB4BqTd0ll
         5FKkMO1Mv+4mzdBTiZVAt/Q8MwbNdU75ovblDjVb9yDvL5KdHgCtrNHBtqoKL9S2CvMl
         il3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VwVAuBf8U+gHdAUZVPEbAcLW9jc18uU0VthPzBGJ82k=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=Z1CN3EvzkTxpl31xVAhVSI1tejcFsvJbOhMSsDYdbfI+3M70ttVEBw8FoI4cfcBDpP
         9uLlRd4dMC7j1hpMxz+lNMeYak1HHxu5ez4fFVvRj1CiM5EvhXz/HxZYO6tQUi9qm0To
         65Be/ZSrXnijlFtODk+3MwbdAfzSgcwXHMBBYga/nJHAVZVfrsVjo02RZYbBRQid0NkW
         eALvPb9i6HD1f/qOJDRz9NlAvUFL29aNk2Z65SG/XvoZOAQ9FRPzPL8tZ4euHhLRbkbX
         a9FQJf2FGT1HdfAXBgHExJn2Yj4TyuztaBb6PsQhgFCRnQ/9J97cQKBCZhXCY+tDlXey
         dkVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2QUOr0L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38058bc24b8sor3448759f8f.7.2024.10.28.23.10.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2QUOr0L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182239; x=1730787039; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwVAuBf8U+gHdAUZVPEbAcLW9jc18uU0VthPzBGJ82k=;
        b=X2QUOr0L5KW4XQAFbnghWdxfiMAMyadO9L0T+pmUbsRX9ot8WP0pPjitLNJn2GxSvE
         kVFAkCHBJGHB+Dr+RBvPqiB3+jjicHpibnp2VywMOYLKuKa1PinQw3+I6zD/61GgOb6j
         YjjiICmmVOBbBt/TDhZLCKsP02TqfQjib1Bkohwfb9vdpYiFm5rUF/r9QAgS3f1uVMFw
         fN+L5W/Jwg90/8774l5XFjIAnNhBRUVr2wmKaC0NcIJWc0dy4FoYHYUyc+E/170NQoG7
         qGENglOTTx90IhGy4pSiZhNxOWI0QIRdgILc9+8MGDBJavQgDdtMjchDS3SQuYtzkQTK
         SVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182239; x=1730787039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwVAuBf8U+gHdAUZVPEbAcLW9jc18uU0VthPzBGJ82k=;
        b=g1APwaqe+fGViZHQHK1WVvqg+xuZCe87mI7ySUNQVp5FLJbG1GRkcuqRHMLhGiH33E
         2/Pl26msh4BL1C3GiScqGPyYttzIFYELXQwhrHTtSkpv//GXATdHRsVSoNUTqxaZ1Rq0
         NpiANu97QEQsG14yDWMe9AhDlk1V4sjyEv4vb8lxmRF/SJLPtb4KOvOxT0if0i61pfx0
         dEAfDF75e37CsJSOzlIdD3Q0YpNXNZ3onOCHEQaL12h6J6o3+4E7PlwsGnLFI1X2D5dx
         RyEG6Q/MSv2dHtq/2Hdbt3yradmDk4vRekL+XN1X/HCc2DuBSezdTJocSXSNjT80kqKI
         LvJQ==
X-Gm-Message-State: AOJu0Yye3lUIg+U81MA7h2JQdcTVHFO4xAsGZ0e5iY043HxSzzwxeeyi
	dToTdF0EKR9b8T50q58jVU9A0SRhiyDgTe/tFjPK1F/rFq6POMaZvHCo9JFoqInJ4BFer4sQzPK
	oh2NCcA==
X-Google-Smtp-Source: AGHT+IHyoNMpwWyaBAd5buO+1ZpTcIcOE1Ut2ytCRwDQwzvns7/Up3tAdU+mu5lbCC5HdOlahNc/CA==
X-Received: by 2002:a5d:4a43:0:b0:37d:5318:bf0a with SMTP id ffacd0b85a97d-380611416e1mr9671606f8f.1.1730182239347;
        Mon, 28 Oct 2024 23:10:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm11560253f8f.70.2024.10.28.23.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:38 -0700 (PDT)
Message-ID: <dc7c4578-aa3d-49ac-b9e9-16922e3def97@linaro.org>
Date: Mon, 28 Oct 2024 12:15:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] target/s390x: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-8-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mqHSqhtzwiJI

On 10/25/24 15:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in env->fpu_status.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/s390x/cpu.c             | 1 +
>   fpu/softfloat-specialize.c.inc | 5 ++---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
