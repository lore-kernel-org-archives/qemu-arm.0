Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2654588ejb;
        Tue, 28 Mar 2023 06:33:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350YEVl1J6SluGboQXWYSiDA6DYj1ywXY/J4jVd6G1hzVnaH2Uf9pVnUu4hSHA2c5I1s8vhSK
X-Received: by 2002:a05:6214:1250:b0:5a3:44a1:788d with SMTP id r16-20020a056214125000b005a344a1788dmr26839753qvv.29.1680010411664;
        Tue, 28 Mar 2023 06:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680010411; cv=none;
        d=google.com; s=arc-20160816;
        b=HJz9VRFo4T8woErcvW+fgUotIEKe1dhbBt/WZsp/4XI4Kw7tyfnpOIB0t72QLJ8hYD
         qcK39pR/agpuUGYB23KZUwLsZ8LJtRvVm4OlT7CAouq95eEvV+19TyDwY33AHjecXR21
         FDovMXEDyb4IS3GUVJ66Lw1blbmRyHawklyAsPqPayur1y61UwzfaKuYRzmWFAujgUqU
         ERGY8h6CpSy8tp2UxFf/4Es8Zmk7JnCNsztxkYyKjPCLTa5+qTg9Zq07mKG27AZD+D5r
         LFmW/dmMIcpg/EJQ/bIiqvX5b2Xs7xG2Bjg0B9lbDKbwr1o4ZHcRXOCxadBwCdMQpWRH
         cZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=h5ikHw9oQeGXvYWIgvfLco77jNX5liK4WDNFDFQGFdM=;
        b=fVKpbv844T18VAVyDVDvMBtn/jATjUxUTjYDygjSyTFhkoMlhgMrg/G9HTGrJl8hzs
         E+fKbiqv5+RiNhlkQ7qSbOqfWrI0QuwFmxusvcSXInCkqW9pvtR8fxB4AB2ARQMP8Lt9
         nCpyclsbemviYaModXNU9njJ70wEeGi7lef6fMzJf8Pww3cVaGkLcpG3ZYaKc1vbzJms
         o2fkutt2cx226pw81Xz57sOaaei9LQ+p8zCaJIKobAQ9eoW90oUjnOOJGGooaU4drwKM
         1IHZbr7SYo4yBgVrcMnm0KE7+M18ogf80aVicsV/woXkFWLt+qYzkaNdlwdmukubuGt8
         VuYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKOoqLsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy20-20020ad44e94000000b005ab3524dde9si20507283qvb.150.2023.03.28.06.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 06:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKOoqLsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ph9S5-00037m-G8; Tue, 28 Mar 2023 09:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9S1-00037C-P1
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 09:33:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Rx-0006S0-NL
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 09:33:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id o32so6961888wms.1
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010400;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h5ikHw9oQeGXvYWIgvfLco77jNX5liK4WDNFDFQGFdM=;
 b=YKOoqLsONv7TvbsBNkqnKMDJzIFU3fPljIlfFcchML34r87mTAYmF0THCxhpWuEJg7
 lercR40TbGeEwFAeYWvYx5z8zsvUyBefivkbmX9Fx46uhIh3nbnrNTQNduvOqfXSbmZJ
 T9E4tEY/cBO35wG0gQuzuMzV+3PKUliT2GbqE/4JaatANChK/UsJZYPUFNl/+Q3Ph4og
 e70ZSnC83/whk0rbamwNJYL6ZhIDnJ07zZo8bMsDs8pIXrqd3Xb+7I3gP1PUfZ4a0RfZ
 4690rilpbJRXejXyjQcICfg56gAstI7Kayl7+30r93LXFkx8HA5S+957qFKxi/mXq4yJ
 XOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010400;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h5ikHw9oQeGXvYWIgvfLco77jNX5liK4WDNFDFQGFdM=;
 b=Hh4cyvSZv9Ic1Z+7Z8V7wO+2LI9Z0qrw7sR6FFcxYJFuynQ4O6PAPcRO5riY+5YrrA
 QAGoMG9mIbIqVN0VtkFAm6Ps6t4wewTQldCVZ0bBDnY6lrHB6rLTflvXH4ok5EwetFGM
 KSlxQq+6XWQRLyW6uWRGg8c8i91sFKi6DjrR6D4DUbPDl6M3/+X/O92gAvtT4UBIMWvq
 UIc73/2Fq5x0+sq1FEbHV3AaLCxL64A2J6wcXhBZim50bmVJIWB+xM7LugOXOhI8OCIY
 VdXVJCOLibqRffwzHdbg3XQHFKptF/5v0v0pZikVxwZNakASFY5ZerONZ4PJfVvrNb/1
 t8rQ==
X-Gm-Message-State: AO0yUKWMPE0bgDfO3a5KzblrJ7ha4Xr/+m+KvDbvpny/6bchfejMCZNB
 HCMZAlTCjf2Q7jw2Aj2dDMQEhg==
X-Received: by 2002:a7b:c38a:0:b0:3ed:276d:81a4 with SMTP id
 s10-20020a7bc38a000000b003ed276d81a4mr12607295wmj.32.1680010400035; 
 Tue, 28 Mar 2023 06:33:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003ee6aa4e6a9sm12807685wmp.5.2023.03.28.06.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 06:33:19 -0700 (PDT)
Message-ID: <29d10da0-821d-07c4-16c5-a1f5e2384d3d@linaro.org>
Date: Tue, 28 Mar 2023 15:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <CAFEAcA9-+bfGxN3+3sCpA3XB8T8f=RKPC7LUwdK8-pPj-h8xig@mail.gmail.com>
 <958c4810-e351-04e4-42f4-d1bc86d303ad@linaro.org>
In-Reply-To: <958c4810-e351-04e4-42f4-d1bc86d303ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: RrG6QHOSt1JN

On 28/3/23 15:20, Philippe Mathieu-Daudé wrote:
> On 28/3/23 11:54, Peter Maydell wrote:
>> On Wed, 22 Mar 2023 at 14:29, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> Fix when building QEMU configured with --disable-tcg:
>>>
>>>    Undefined symbols for architecture arm64:
>>>      "_arm_v7m_get_sp_ptr", referenced from:
>>>          _m_sysreg_get in target_arm_gdbstub.c.o
>>>      "_arm_v7m_mrs_control", referenced from:
>>>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>>>      "_pauth_ptr_mask", referenced from:
>>>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>>>    ld: symbol(s) not found for architecture arm64
>>>    clang: error: linker command failed with exit code 1 (use -v to 
>>> see invocation)
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    target/arm/gdbstub: Restrict aarch64_gdb_get_pauth_reg() to 
>>> CONFIG_TCG
>>>    target/arm/gdbstub: Only advertise M-profile features if TCG 
>>> available
>>
>> I've applied patch 2 to target-arm.next; thanks.
> 
> If you only take #2, then you need to squash this from #1:
> 
> -- >8 --
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> @@ -21,6 +21,7 @@
>   #include "cpu.h"
>   #include "exec/gdbstub.h"
>   #include "gdbstub/helpers.h"
> +#include "sysemu/tcg.h"
>   #include "internals.h"
>   #include "cpregs.h"
> ---
> 
> I can respin if it eases your workflow.

Posted as:
https://lore.kernel.org/qemu-devel/20230328133054.6553-2-philmd@linaro.org/

Along with rth's suggestion as another patch.
