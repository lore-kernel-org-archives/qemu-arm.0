Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp952510njk;
        Fri, 24 Jan 2025 09:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWut0voyzoO5RQpRAm3oFgfDxZlsHgJidJwuJ3/s8qc5WZ8l2zP2Vx1IYG0tLWyW4j3OckFUTOitk2c6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEDdEtmhvlmTXoNHaAT7RPzc9S2OnSwjot2XXV6KHFF6HcXfGJjg6LyxmdGpA/Hw41xD34L
X-Received: by 2002:a05:6214:5b81:b0:6d8:8874:2126 with SMTP id 6a1803df08f44-6e1b21793a0mr415810486d6.11.1737738473225;
        Fri, 24 Jan 2025 09:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738473; cv=none;
        d=google.com; s=arc-20240605;
        b=ewlQRU4jbCYsUsd0fBcaBh4Tygd6Bs7C5LeZDoHTq5p+pTMQB0zjXMccBFZjZk1h+8
         IdM/cUFkV3LpkYNALt3tipbTfPPF+OeYJna0A+pbWR0GnjPe/yBrK5e4k5GJ3thXG0Hv
         W8h8mndTsDPko6nCt5sJ420nYBsvNHp0OeleswhIstkWjW/IjPoQZMMruoN6kUeKeaCM
         TssTAcBNIvOkKly8iV+uOXMY61YSOdXIT3i0r3DnuKer+J6B5E5upZM3P2eC4C9xvExY
         wHMWAkMIUvMdzPg3SlcF0UgL4gt10i9rLlV++2suBWs0zgR8RnwY14tsnhdWMaxLpAtf
         UjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Dd+aG1twDpqirL1tKMkyzk/bBXE6Ersc67qRFYrHKAg=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=igAbMH7Joj0aQG5nH5XYHhGe2u8hTloQQD2RsRX1AjTAUhKAaib/y/V8HTdBvPynpA
         aLQ/+XSxi8KKJGUPRyq/jGqUztcMRbzen+CNBlfZFqTYpkvD3LODlhHW1wrypUgWGjLc
         /LUM01BPdLFBvetAfOUowX1EvMZN8ZIiLXLi65Zf4Mel5MrI9quusVmkxk0E+8YjhOWF
         SGoVo4tSYvDES15tp2LiZyb2HMCcvc8GsdrOR2cnBeHGfcJtsCNxC/WxFSYQBDtZTZ3P
         AT+iCKKxuNXQgM2ps9STQm8BfMah39pegCsA/AlyzSJzpLXEvsy/5iI0fP542Xm6Wi4W
         ln0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u4GEGrtu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525c2bbsi31140626d6.84.2025.01.24.09.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:07:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u4GEGrtu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbN7v-0003Wq-Ja; Fri, 24 Jan 2025 12:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN7m-0003Tc-EA
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:05:49 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN7k-0004fj-Cs
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:05:42 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-215770613dbso30578645ad.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738338; x=1738343138; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dd+aG1twDpqirL1tKMkyzk/bBXE6Ersc67qRFYrHKAg=;
 b=u4GEGrtuPKzKL0sfuZo2LCQc6OcwbTPVco2SVQ9cy/LlFopc79kJ8VbhetRGjJtYwD
 zKRXS6E08Y/9PPqiqRRBK3DdNNt/qKILH7K4im2SC9hj7aVFBAZn4ekw9w9of19i1c8P
 YnpL0FRqkEJYQqlDxcVwnnojnZH3uCJAoDSmMyOcsUusTGERnsePH88CgNWO3VZt/nWv
 0moYe9LH7LA9BmoE6xbO0sbkKwDLCvVnz17avikBbFaxgmj1p3Ao37PjqU/cziEjz9yc
 uopUFJ29jjfSaZ/JuUC+sDH1S/LePJiPy8fD+PoIOL1Yik+szZk7rPwmzuDK1rZZs+F8
 Mmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738338; x=1738343138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd+aG1twDpqirL1tKMkyzk/bBXE6Ersc67qRFYrHKAg=;
 b=Tmek7hhsZUMoqH3Tmu0CFhvcOgTgq2PGU52DaP/2Y/F0hclABXZXH1nL7D+2zYrOr9
 aNAIZ88OMY3YADAZhMbkHFPc2CFgJuQ8y8jH7SiqUcDD9yKsML9UKmUQkEMQ0RZM6EYw
 AWdvPLmeKTNiZGXtbODw032DvuMskvSzivMa6opDfTTglHZX/e/RLdO1OvV5/VpmjAcw
 Rl3KjsKScJW3w29XfDlAxPmOw10/63mhf43tG+eRGhLz9xPMURY2kPmGTjowo/sAqB4E
 NMi3OkdJhLhsLbRi8HXehHsZ3+MLdGiOoRKfC17CXOVNsJIzEp0MHLObIr4+m/NcrNDv
 MqDw==
X-Gm-Message-State: AOJu0Yzwm+rvps+ChCM6Wad9Ulmcziqe8+gMTiD/TezyC+kLGrOf9N1I
 irRrRXAV3P4xrzp/k+60tN4uGk3L0FXeS6XW4rvZ3L0QCj3O1mySKKU2CHs3TwI=
X-Gm-Gg: ASbGnctH7OJfelSakEL3NX0GpwEbuPZY2bpfjuCssOF4TI0JlcrwLZa77e/UZiGyPaO
 PDA08k4sumgKLBD/3KU2+tlWk53nU5nB/4XX4mzTgdlbqpC4hgL2ALypsjzaZOEwmwbfSI0Gr69
 sCjIXlB/ctHdbuBkCSrnhnCdIfK93ZlV6907xcnSiEDginAdpPFiE7tDK/VqdNr3RfXWglpkHB1
 hZb+Rsdm6kEvxg0+PAYhUaTbHw0ASCPGDOuS3/cMV1T3/nyG3KcuF0MyDxf3wTUzCRKSPo12OwQ
 5+rnc8SFxMHDP/ZukXo792L3
X-Received: by 2002:a17:903:2381:b0:21a:8dec:e596 with SMTP id
 d9443c01a7336-21c355b54e7mr517678395ad.35.1737738337888; 
 Fri, 24 Jan 2025 09:05:37 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da424aee6sm18487735ad.215.2025.01.24.09.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:05:37 -0800 (PST)
Message-ID: <44625264-685d-4e99-b837-56879e199af7@linaro.org>
Date: Fri, 24 Jan 2025 09:05:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/28] cpus: Introduce SysemuCPUOps::has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: 3E7+C0bw/zYd

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> SysemuCPUOps::has_work() is similar to CPUClass::has_work(),
> but only exposed on system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/sysemu-cpu-ops.h | 4 ++++
>   hw/core/cpu-system.c             | 4 ++++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
