Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3186112ejc;
        Mon, 28 Aug 2023 11:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Howa3YUIqapCo/Q3YlK940/IoQDQQEYHDknbDx5pxkHjBVPuGxvvvt/VJkMXbjaFHrNE
X-Received: by 2002:ac8:59d6:0:b0:410:8b52:a496 with SMTP id f22-20020ac859d6000000b004108b52a496mr32697619qtf.43.1693247887434;
        Mon, 28 Aug 2023 11:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693247887; cv=none;
        d=google.com; s=arc-20160816;
        b=Xwjoj5r1JeAzL+yFq6yQUOKC8c2Co61EOD+4MMLSshUVjSBk3CGsj6PIamN7Yw6WUs
         DyQf0vwMC/40cNjjaXIKeDzk2WyQTrTHt2kA1pZzRsEj1VSzI8DtRbxNEqcU8ScbWvLD
         b6kJuRKm4S0PIuHE6YHQ47d32eDLgY0F4TAbHTzWfp6D24+RT8l8L4z4DZaW7l6stwqR
         C+yT1+ndTCNbAuhBEdbbveeZawWB7biJD88HPu9ZkpdD5Yp90YYvv7e0rffv1Ilkraoh
         uwpYQFO9OS7ylEUkANp/IxDX9ptPrbG+uYwL2ryK1LLj1YYqekZh1Xx7Xb/VoCCW03pN
         unLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W7pZrvp9fbXrVNM1HtEc7pE/SbfGUo9CUnGlwN+3xqc=;
        fh=vc+nqmKDbTj+9KCVcVasbHFTqitsy/RlC8F/3ZcIIWE=;
        b=pcBufTwVj8rtNtoNhB4gFg/3tKk8SEi7SJTY0+Zvgs1gU46xI+gOaeMa6vQkhyAs3+
         upoD6AFxGjxDmWtBfVx9J0ldSMYvxVySek0LuxfhhGSgPPJ2tFWNN6ZG3Zv+RThfooK0
         bJE8o7zKWP5GNALAvq+N+/31BPElIJ/Z0iVTl+7VHr72ge3xnr7mwyMKIPEA+kLADk04
         +i9dhKmuCkb00Y/AHZHOBlqndT7CI4+G8WLdokABM1lN6fALJKZtgctZfLFIQqpFROi5
         ucbVufIRvrPQl5VYk9zPfPLcDUoY4nc0Bw/HV1p+iU6MvyhduUCcC5iDE5ZhUKRtjSva
         oM7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hm0QGH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020a05622a030300b00403b02b64dbsi5211065qtw.354.2023.08.28.11.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 11:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hm0QGH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qah7X-0002lp-Bc; Mon, 28 Aug 2023 14:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah7C-0002VF-0C
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:37:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah77-0007Eo-P4
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:37:29 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so9687145ad.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247844; x=1693852644;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7pZrvp9fbXrVNM1HtEc7pE/SbfGUo9CUnGlwN+3xqc=;
 b=hm0QGH4+0gMsfcT/HaYb4hW04S9fIVU4cMWHARJB3Q+fqPkXrv1cZ0MH4tXePdh16s
 Ssmsu/5ShTvRD+U88PFV/7FmB5P7KCZd5/Ap2WiG6n3EJI+1mX0h7s0sxsAwVM6fpyGV
 NuorElxl3OdZ2fQqWs5YdYcYPM10f4aeC7ZJCgKUlAa1AQH1zIrlZVoPOqFOj3fyUQrd
 gadlaSyxGRjqAY5BNMSY+istnoHdcjH/DpA0N+XmI/ZZmZjzx/vX79+Hpbm//G+CHyai
 ei5J16YBauXa2LAvzrlWe8vYsQ8pMd4Wj453YJV2+vTs7HG6PPQDZn0muLtoOLqyqOIL
 RvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247844; x=1693852644;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7pZrvp9fbXrVNM1HtEc7pE/SbfGUo9CUnGlwN+3xqc=;
 b=YDksF9uobzJHK/uzinRcNs0yvy6JIlotm2tU5TkayxCFBBl8q+ksO3RbOAp4qgTfy7
 D6z1aotWul6z2gTeR26GryAw2xq7gAhZIttZdhSFcTVvQSic1Kv1Ryt3xrQnPvTlKime
 2lyqwD6uBhsppy7AsxNkDR1EEqFZ8pVE2ZEuc6+ESjvWFGZ4wgo7RU4sMwolA8n7IoJu
 yW34iHBmKZVoYS21mQO6ma58b8LXCmUZs9KpXBOKvq7C32ud4hdjHvHGjzf0EL2g0+RA
 H3+exF5f9OSwnvqHwcPjE7sndPtABTGDV6ww1UZTTZXL1WjB269A9TFaLxNL92g7vGFO
 uQvw==
X-Gm-Message-State: AOJu0YyBZTQD0Z+V/Si/A8Yj7AuGmEWETUy2RHTY0bWBnDLM1kula2yv
 eAon9b+MhD2at/CDKYtNPD9NEA==
X-Received: by 2002:a17:903:244d:b0:1bc:10cf:50d8 with SMTP id
 l13-20020a170903244d00b001bc10cf50d8mr29434965pls.23.1693247844503; 
 Mon, 28 Aug 2023 11:37:24 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a1709027c8b00b001b80d399730sm7699024pll.242.2023.08.28.11.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:37:24 -0700 (PDT)
Message-ID: <ed021682-946f-29e4-e445-a096de453daf@linaro.org>
Date: Mon, 28 Aug 2023 11:37:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: n/YyiJY0BJFy

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> Only handle_sigsegv_accerr_write(), declared with user
> emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
> typedef).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/exec-all.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
