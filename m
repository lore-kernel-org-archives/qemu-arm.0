Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp285216ejb;
        Sat, 21 Oct 2023 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIPKD4xdCHhsQLhX+R2sfWLTPPz5cRbUI+alol00CD0GyGFaJRYKMLKFKvXzhDVp83Cjbx
X-Received: by 2002:a0c:cb14:0:b0:66d:968b:40ed with SMTP id o20-20020a0ccb14000000b0066d968b40edmr3899663qvk.41.1697891452611;
        Sat, 21 Oct 2023 05:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697891452; cv=none;
        d=google.com; s=arc-20160816;
        b=Mgkw8xof2fU81k9lpBPB45AUPPSf7Io+bxgWGTF7ebT7nVJM5Pt0G/T0i7EZKFvIvy
         OA6o5K/bS7Nkdt/BZC8igN2tRKoDuMMcmZUjmOZGNfxKj6UF+H/KI5rIal6zryzFfkx1
         IubN+4BDlVpaCIT18Wi/9TDpDxFPQuWqYQi8x6+PmcGi3YKy/3EUEmOBjxu0j6QHtwGL
         0sB8pxCtgqu1+pk2/1kCpTnlD14NKVfW44TPUQWhiXtYr71bp2FYvQRsiXLY52+CjJUW
         ZY1hutwLPzdnysDagxl/nnS6srLKjQX+kAdkI6uVVV88jzRj9pREkr6nGu9a/pWCXZMU
         poEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ZNKXtdfbsCqHLvA+TddCHHDSAicrNyJhlhEBPtCNk2A=;
        fh=sAQJpGVJG1mLXWPrSbdanoBjyOFHDL8L0t7SqPoHAT4=;
        b=tiO3uXvfxejysCrevuitaUT0f7BS8XdPvm2Ltlbkb/x+wSMvdu4i0BpCohSKmwU8VH
         PLHehRF9mrsAIo1/VwjRh04MiTVrbz9VFxhV/DeNxoYPe1f7pQy23cM2tN7D7sX859s7
         GT0KnZY+k71v5pZxjAW9/AVlY96iutCHkyNGmfTHRt4AlHTrDNvL0dZNe4I7T14TJ4PZ
         yPP9ULLCumS8U31EUNuObHVBW3DEFSkeKb0wLO/2Tk1j4IwP+ejVbq/YC/yg3LKpKnBs
         wB2UCQQUwPUx4CXHditKCqawGKcOGQB4rOD2NCVgLtyaUM4ghIhwmvHoj+obvAp5xnfb
         nYeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oj13-20020a056214440d00b0065d07ee1d00si3011683qvb.54.2023.10.21.05.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 05:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quB7Z-0001nu-OV; Sat, 21 Oct 2023 08:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quB7X-0001gP-Uz; Sat, 21 Oct 2023 08:30:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1quB7U-0007Ol-Vv; Sat, 21 Oct 2023 08:30:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 444982C369;
 Sat, 21 Oct 2023 15:30:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2F4E930693;
 Sat, 21 Oct 2023 15:30:15 +0300 (MSK)
Message-ID: <779fbc42-c397-44e0-8682-9a330cd1ec4f@tls.msk.ru>
Date: Sat, 21 Oct 2023 15:30:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/boot: Set SCR_EL3.FGTEn when booting kernel
Content-Language: en-US
To: Fabian Vogt <fvogt@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>
References: <4831384.GXAFRqVoOG@linux-e202.suse.de>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <4831384.GXAFRqVoOG@linux-e202.suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-TUID: npjJj56CO7+E

13.09.2023 14:57, Fabian Vogt :
> Just like d7ef5e16a17c sets SCR_EL3.HXEn for FEAT_HCX, this commit
> handles SCR_EL3.FGTEn for FEAT_FGT:
> 
> When we direct boot a kernel on a CPU which emulates EL3, we need to
> set up the EL3 system registers as the Linux kernel documentation
> specifies:
>      https://www.kernel.org/doc/Documentation/arm64/booting.rst
> 
>> For CPUs with the Fine Grained Traps (FEAT_FGT) extension present:
>> - If EL3 is present and the kernel is entered at EL2:
>>    - SCR_EL3.FGTEn (bit 27) must be initialised to 0b1.

Am I right assuming this makes no sense to pick up for stable-7.2 since
it doesn't even have aa64_fgt definitions (commit 15126d9ce2
"target/arm: Define the FEAT_FGT registers"), or should this commit
be picked up too?

This and subsequent change in this area, "target/arm: Fix CNTPCT_EL0
trapping from EL0 when HCR_EL2.E2H is 0"

Thanks,

/mjt
