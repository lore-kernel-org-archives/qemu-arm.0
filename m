Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp956776njk;
        Fri, 24 Jan 2025 09:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6OnQ8DS2PjzcJq3RzDjx8d3OsbD3wm/6spokqinGWNCB3tUHvSGAXW7Jwpz5fDrsErrwwHzOsM34mAw==@linaro.org
X-Google-Smtp-Source: AGHT+IG6ejotMhkiw8m/7hydt6Usj/Rs84HJPYXvKhfqqi2g8gIG/e1Gw4dZRJZMO3lxUT+AfGTP
X-Received: by 2002:a05:6214:3197:b0:6d8:8a01:64e2 with SMTP id 6a1803df08f44-6e1b21e2e0emr406504786d6.43.1737738808209;
        Fri, 24 Jan 2025 09:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738808; cv=none;
        d=google.com; s=arc-20240605;
        b=MPGj7hwWk0pboPsctnHiD0RQJfaf67naSgje3Uid1nZHiTOs2KSxLRqhozDz/uhAnM
         puG8ejR2HQioGs7Q2alX6wnLYpn3wXkMgG6hmfv6cjs770gerIe7xTP4FZKftCVWMCJr
         9IVyohUp3ID4hqXT5WkKsgcQbZjrJsGwvvRtyOfmhsDiRggv7KnJrPtF2TMgpgi4jxHz
         JeJTpRmtYwIrU3syxZc3DsRGzTkkkMg4W4+dj7iNHVCn1tbVxYWnBYQaIggCuCS3F7a4
         zl8tSid8o4PaCNTvNl757fUXQ7W1nSNu0o20+nZ0b9rdmiQVMevEHBbPoo4VCB3J4Jrl
         pBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a3See8692uOXsgoD4hTZPnV+EDiPYKbGbZx4LsYaVUY=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=h5c6TvECp5YWyJe49LE2ZPzYtj2qA1jVVip6Vo37ghDnQ3Y+9SNVEOoxXE10dT0ZLg
         x3dvslaZejYkgYxdcc20KCzc6BPojLs0X24Qcre+an7DUJEuXcWCPqTynGyFQ2o+A4DC
         6v3Y2woTsOuvAvE3YizrGd9QCcRlPXRM7654P04keMMpr76FmTDLaMTMBRTVqdeXsD0H
         /HHJ2JbWeKOwlYkCnrx6jH4sceZCAu31Ec0F5JF8nlvwuE/sGQrh91o7192aJXaWr32K
         3vjDLAs4YCIEwSc4CVuA2sEiOm1wzojHPb97ry+15nSZ8dUSFuvb4M81aTI9TRFytPTL
         SzTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjZ9JoOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f025b7si29255736d6.335.2025.01.24.09.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjZ9JoOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNEu-0000NE-FW; Fri, 24 Jan 2025 12:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNEt-0000K9-9q
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:13:03 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNEr-0006DB-S8
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:13:03 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21a7ed0155cso41352355ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738780; x=1738343580; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a3See8692uOXsgoD4hTZPnV+EDiPYKbGbZx4LsYaVUY=;
 b=yjZ9JoOEME8VBFD4IZ12nbdDRROuKt682FPeJhjJw6Xh4+iincpvOGzlImQOYYPACO
 JvfmNEkcE+6xpp7MmDi6QzLgflsrDMU4JwJx6VF5jBC5+BAt2apYsf7WaTgq1G00BiLd
 rT/0SpxuhY+uxy3udzeuMxh9uI3rAa8e+/GhtXT1MUcUdaTUo4SeMCncJxpi9984qSv0
 u32Y8pkWkSRxoa6LWxzoBFOwqKeZC0n3ef5BT8ZxuITehQqJq5rLQMrT7yYCo2j2hYPJ
 rvzFOFhvNSb2Jzh1JrxQyxQbe8AW+XHOIFYdMI7eM1D1xgP6CHB8cnVYZ/lBXx9d3NMM
 5DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738780; x=1738343580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3See8692uOXsgoD4hTZPnV+EDiPYKbGbZx4LsYaVUY=;
 b=vZImCHjlm203kv2KQyEdNxV21mhyXBXq25DORbxaw5JX36VOMxFSiqYzFlQ9LM81vf
 BHUH4FV2G0P8nV1ipqBaoDxsxI8M2MEZZ7fNg3ZKQWyAhf6Ldt2Ks20iN673epGZ/Rpr
 usND7iFRsW8Tn/uywcKGq0lQtFQ7pQpN0i4ZC6/wfpY94gZr+R0Ybs1luMDY3zYL1JQL
 OoxfmNvsCGshW6+CyRHHjlCGHp07x4PLNI40dd24ppGvUCxqJa+IMyCOILMBrnq49n7b
 hdDbShl4ImSz720yh/WOvb6MvjOEbJo3htzpL6Naff7csPcsrTT0zSnp8BsOTPtbH671
 x5yQ==
X-Gm-Message-State: AOJu0Yz9feKYAMUpHil67F7N+NCtiYOlrnbfcM4HL65R7yqMWhjayAIk
 YxEzp9OTVaVlGstUwp6jyTHefR/b56uDScVhPIrYwYwsoEKg1G7R0xWdiyYcGks=
X-Gm-Gg: ASbGnctwGqRsrjKvQjhtuKnDOWUgQS+kmTt+8XT0KEBj4ksNQ2ZQ/L81IwBtP6mcaAT
 IqnW+txGwVUAU3MFOEUsb1WSO4sCzFOFrN0IiSyQ1TTKUEhi4+m/CdWbdL/vL+PkZhfDl8IAofu
 qLCaDJCbX+OW1KrN1rMClG5xlvH71rJAVg84Kych8RuzZMbX74ltWW2KrCEv3giDVyIq3YeydnI
 XY8aOh72TaDgyFVaTXsgabU4EgzOdL3A4xELkVXlX24ILx/3e46blyw4vQ3FmvnRwc0MJ/+CGpg
 WiW9Mgv3l9t9UKGV/NkW2u4l
X-Received: by 2002:a05:6a00:4615:b0:725:f1b1:cb9f with SMTP id
 d2e1a72fcca58-72dafad530bmr44733377b3a.20.1737738780438; 
 Fri, 24 Jan 2025 09:13:00 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b324bsm2194511b3a.62.2025.01.24.09.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:13:00 -0800 (PST)
Message-ID: <27a14c26-8afa-4ad2-8ce7-7696adcb4537@linaro.org>
Date: Fri, 24 Jan 2025 09:12:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/28] target/mips: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-18-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: stG88RV2CcUM

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Move has_work() from CPUClass to SysemuCPUOps and
> cpu_mips_hw_interrupts_enabled() to system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/mips/internal.h | 4 ++--
>   target/mips/cpu.c      | 4 +++-
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
