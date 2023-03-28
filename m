Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2645463ejb;
        Tue, 28 Mar 2023 06:21:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9ONLIv1qFHDgGzKSJO5LqS+PkvJpM9yvVsBAYlD/2bUD4cSKT58H74KzZPNAieWp125Pe
X-Received: by 2002:a05:622a:152:b0:3e4:e2bb:3297 with SMTP id v18-20020a05622a015200b003e4e2bb3297mr16535625qtw.31.1680009666258;
        Tue, 28 Mar 2023 06:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680009666; cv=none;
        d=google.com; s=arc-20160816;
        b=hV40s+/IhXIKQTy7o6AvzZhtef34pwTI3iHojZElsfxb1wDona8U7T6G/q8XpQcw1A
         EgPRI2ocrW+jsK+4T7rAny2ejqV4gesBDxXbsJiOT1WNytw8AFsGTGvBY5/r/5x0R6Rj
         R3/vky9AU3mf07knRJnmz+JtbAWG4+i1gECi7ViFCUopIxVt7kKH05MbQ/l3lesUB8Vi
         zekAJFCZjYXm8XK3P/iTcFP7/LYxntvD27btt/IrKc2ls8IO64kGrgPgyH3TzcqUsCFe
         WaBc0XoaF08VIf0XhMx2QKcSnAx1Ef1QEiWCy7p05B9cKp5YtLD52KZ+InskGFn/EGsQ
         Ikvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dfSC/M0BU/ZV4g7hKlLFq19MVV6PyWXdVSz7CJwUwwo=;
        b=AQ/DqdH2Y0Azi52975O+9h2b0jk1IE7k2liwFUF8VibQgQI+xtJdX2R5Ygd1QRxO5A
         rDy50JgaHixaDQdpCAzBPCl3NlEmbe8vEdLa+Pwx/DuK688Ff0MgOPBGUMhLrr+MpZKI
         WGdiBj/RfK8+gzJFpDZbBWv4hzbrJAmXAC6MU9mBwwLjPNqUorMCTOXEwdXkE796SG95
         sGnVnwDpA3yKtZ3ETp4IeQSJ2C11eLCwjG54sbkz/0gOEQ8tBqA4Ra86rg4DxYETLsfx
         zIhV9YVy4LI4hS49rEibdSNNAlwDDLGWcncpHKaVRYDnbimaY2HwlrE+zaC29YzsYbNx
         ntnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0XQQCd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a050700b003def707dfc7si17552478qtx.525.2023.03.28.06.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 06:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0XQQCd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ph9FZ-0004S7-Eo; Tue, 28 Mar 2023 09:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9FY-0004RV-8u
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 09:20:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9FV-0004iB-Hk
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 09:20:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id m2so12189875wrh.6
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680009628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dfSC/M0BU/ZV4g7hKlLFq19MVV6PyWXdVSz7CJwUwwo=;
 b=c0XQQCd6LdnKYn6ZniQisv5aLYDsqWV54iA8UjD+BDSjxjAw2cg+vDoqmcs2+4g7MJ
 6AAjC49PSK1RyxR0YMeSPTKMty2fAcMe/WntGxh/K7Si03XSofBmuTr+K5gOKXIVN5Ch
 1DHUiX6jjs5D6WDykZEuNLVd+XeXCil2M6rEsN70XhSQ+bjEO4es96EYAFnT5AhsYEK/
 vpQc3gemVswonnFfpOHB9l8EtyIfsDAfVdrv8UVlC+ct4/qd9esOrgqWvABGR7KOk1KC
 qXIPhJ0716TjS77U6X4eTcki0EgjLFyzglpRhrNpiNgkcBdeBn7WdG71jGncmB/p/Edh
 ndBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680009628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfSC/M0BU/ZV4g7hKlLFq19MVV6PyWXdVSz7CJwUwwo=;
 b=bW9eu8F0RNvQMIJg1q1UruZxbOGAc4eOZkqABOM8/tzIM6hLXJRoeMmyMV3HeKlfIi
 TS5P4k4YhRFaRnECAl+EuAv65GrjBK6yQtgtgqJQe5cVDnWlmsqPvrbLWM+IYPldwMHO
 A865+mZPgqlYkzx1cYFbaiJI3IGWRvOMLyRTRFM5f4ffSycPR4wt7Ma9sL3Xi10O1DPG
 wttm2fmWvHeelQ6KuHJFOxgEAobpV2ei3m/rJiUiLtmHo/TKF1O26MG7m33y+bTb4ka0
 AFUBLltOkZz8kVRbxwJIC0paU0+xFtCaofWLtoWUnuiDmWTfzxRcDz1+Ch8yYWl20Bqd
 KHzA==
X-Gm-Message-State: AAQBX9fRQvgT1WORWHaldKWSodgJftBckIrwmYr5I8rD5qojMlgbcUhm
 4w+778gvnSgzYCV4KYbEKeCEmg==
X-Received: by 2002:adf:e309:0:b0:2c7:f56:285b with SMTP id
 b9-20020adfe309000000b002c70f56285bmr12083247wrj.63.1680009627641; 
 Tue, 28 Mar 2023 06:20:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a5d6a8f000000b002d743eeab39sm20871374wru.58.2023.03.28.06.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:20:27 -0700 (PDT)
Message-ID: <958c4810-e351-04e4-42f4-d1bc86d303ad@linaro.org>
Date: Tue, 28 Mar 2023 15:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <CAFEAcA9-+bfGxN3+3sCpA3XB8T8f=RKPC7LUwdK8-pPj-h8xig@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9-+bfGxN3+3sCpA3XB8T8f=RKPC7LUwdK8-pPj-h8xig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: G9WvBa0vJ8sz

On 28/3/23 11:54, Peter Maydell wrote:
> On Wed, 22 Mar 2023 at 14:29, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Fix when building QEMU configured with --disable-tcg:
>>
>>    Undefined symbols for architecture arm64:
>>      "_arm_v7m_get_sp_ptr", referenced from:
>>          _m_sysreg_get in target_arm_gdbstub.c.o
>>      "_arm_v7m_mrs_control", referenced from:
>>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>>      "_pauth_ptr_mask", referenced from:
>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>    ld: symbol(s) not found for architecture arm64
>>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
>>
>> Philippe Mathieu-Daudé (2):
>>    target/arm/gdbstub: Restrict aarch64_gdb_get_pauth_reg() to CONFIG_TCG
>>    target/arm/gdbstub: Only advertise M-profile features if TCG available
> 
> I've applied patch 2 to target-arm.next; thanks.

If you only take #2, then you need to squash this from #1:

-- >8 --
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
@@ -21,6 +21,7 @@
  #include "cpu.h"
  #include "exec/gdbstub.h"
  #include "gdbstub/helpers.h"
+#include "sysemu/tcg.h"
  #include "internals.h"
  #include "cpregs.h"
---

I can respin if it eases your workflow.

Thanks,

Phil.
