Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2924727lfk;
        Tue, 25 Jan 2022 14:11:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/iWNFEbszO1WXgKFZEh47Kt76m4DVrBmwULYYI3NhnAF7t/gp5ELstr9oCM2mh6kMTrIF
X-Received: by 2002:a05:6e02:17c5:: with SMTP id z5mr12457053ilu.73.1643148661811;
        Tue, 25 Jan 2022 14:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643148661; cv=none;
        d=google.com; s=arc-20160816;
        b=TeOZex35udo8rZwpSWJAtNCGvvQibHp56M+ls/ZQ/EAzmE13uY1ois7rx35lUfAP1u
         Es+gPAIl9G5PpkSrbKXQQknjQz+vzBhLdJZMr46Js/unQ7VxhUvNZ29qMfgDMjLkXG4y
         pMK+2MXMt4jb2nLW2J669gVZUC/X+rNPYQIJhmmVkEP7JumuM0o5Kv4L9YS6NyOa2bbP
         DCKLA/0NRCe391hzDqRHkWa00u7lqa1pigupB8B8qscIpayy+wyLKSQ042/E8ZocEIZt
         DAXILsF0JElqgqVdRqhRc2KoFg5qt0yD/iwel3I1jP2pxGHUV+kaQqJUokTL/WDk9XLG
         JIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aaFZk1AWrpdiuRPQKKFUP3xQ/myqOYoLTGhWgDXhju0=;
        b=XhBLd4TCy5Iq7aSJG77YerYn3JLEpk3xyeXxTO1Mpz6N729L2zpOo+Fj/BCWQQnYna
         NIaDcz1RmwXKJQEQ4W0A506ssjlpCGMcR6GPeXrahBzJhJtG+PbWEwmHulVSpjmU6Kux
         a0ou1cmI1E0CY4hw4mv0aTtJIH5yoAGlom/XmACbEstlIuBt752x1pblZTvmAYrrjj8j
         aEGEP68qiM+Ly8dmLVoiaATtqgVS8H/EeDKu5JvmcNDADtKfYZ5OGRIC2Q8RNb9CPTYh
         RoQmVQN9ScRPy9gZWW9W9K5iXlB7MgosceYFcxNaW4QNL7GGWBW15nWswK9p6tjG1KA9
         Npvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izS6wbVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si9338581jaj.84.2022.01.25.14.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 14:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izS6wbVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCU1k-0007JW-QV
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 17:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTzO-0004xg-Pq
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 17:08:34 -0500
Received: from [2607:f8b0:4864:20::42d] (port=44629
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTzM-000413-Vk
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 17:08:34 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n32so11915288pfv.11
 for <qemu-arm@nongnu.org>; Tue, 25 Jan 2022 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aaFZk1AWrpdiuRPQKKFUP3xQ/myqOYoLTGhWgDXhju0=;
 b=izS6wbVEw3lFPf6hbSeUEb7tYhM4ug3FLW+Jz0JZnma1B+E2D3sc4nt6k/BooSNFeA
 cU82M6Zv0loPJJQXOegA30TQMPdQf61/HdC8wUscyQUiyv00A3/rBRGdQbSQYfm3Rdum
 vQss2gjvGxffyo/tjc7ebleSv1CWBFVIZIWAVWW6Jhv68hKKddjdtGnpzeg+FCH/nRHn
 DSyiQUy2cgUvPVAaV90dTNMXkCZea8YUt/rRo4R1O9b7twrYcCPs2u8+lrqDg5MOB2Rm
 ylXLllLV25PnFljoEIlpZgNnUTGSFGpx8+K5QKHcmQg55AL9JYaxWTfNCVw1PQXDpMYL
 OegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aaFZk1AWrpdiuRPQKKFUP3xQ/myqOYoLTGhWgDXhju0=;
 b=SvY3olJtQ3/Si5F2Lqp3E/dWm3HCf4nFORqNDBmqui8aKdBOCTS2z6mKlUB4bI13ni
 JGt6RtpHSTsjTlVwDHDHqKLTsxIsuVcueqRAn/0DHP4tcDRkOcVtUr7xV5vgYgvMEoZH
 Ioc6Jsn4cogjDdmNG4YBVmbGpPj68zdBiwJlkVxzL5utyGQhIsN0ej10wuWkX+NJShGC
 q3VO90N/KmO/kZJwu88to9mfxhLilr7g1e6pp+u27FSqwDvYCkOw5yGuXpgEwRuYDAAy
 aOwcolCefHhRPzNgfQEoRJjf5Wz880oIbUV2tCpZZc1IA/tSSCMPKKqkcRhrWTUPKdgs
 U5RA==
X-Gm-Message-State: AOAM532Jt+LyKwNFH5Il9Mb7qk4yRSKFEJOW03OtGlV0ZKRZzVP8nRIt
 866yQ4QxswmPwa0PTy+laEm9Yg==
X-Received: by 2002:a65:460d:: with SMTP id v13mr16689546pgq.373.1643148509256; 
 Tue, 25 Jan 2022 14:08:29 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y42sm24942pfa.5.2022.01.25.14.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 14:08:28 -0800 (PST)
Subject: Re: [Q] arm: SVE accesses at EL0 is broken with E2H+TGE?
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <138138f3-3fd3-b685-1492-060eda777f91@linaro.org>
Date: Wed, 26 Jan 2022 09:08:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kernel.yuz@gmail.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjQIGO9oe0+z

On 1/13/22 2:03 PM, Zenghui Yu wrote:
> Hi,
> 
> I've just exercised the SVE emulation in QEMU with
> 
> | `qemu-system-aarch64 -M virt,virtualization=on,gic-version=3 \
> |  -cpu max -accel tcg [...]`
> 
> Since QEMU sets ID_AA64MMFR1_EL1.VH for -cpu max, the Linux guest I use
> was booting with VHE enabled and running with E2H+TGE. But I've then
> seen the Linux sve-probe-vls selftest [1] failure in guest which runs at
> EL0 and can be described as:
> 
> 1) Call prctl(PR_SVE_SET_VL, vl == 64) to set the vector length.
> 2) Emit RDVL instruction **but** get vl == 16. Emmm..
> 
> Looking a bit further at the way we emulate SVE in QEMU, there might be
> some issues need to be addressed.
> 
> * sve_zcr_len_for_el() implementation
> 
> Per DDI 0584 B.a, when HCR_EL2.{E2H,TGE} == {1,1} and EL2 is enabled in
> the current Security state, ZCR_EL1 has no effect on execution at EL0.
> We should use ZCR_EL2 instead for E2H+TGE.
> 
> * CPTR_EL2 register accessors
> 
> CPTR_EL2 has diffrent layout with or without VHE, but looks like we only
> take the nVHE one into account. Take sve_exception_el(env, el == 0) as
> an example, we don't check CPTR_EL2.ZEN for EL0 SVE accesses and we will
> never generate an exception even if needed...
> 
> ... whilst Linux kernel indeed relies on a trap to EL2 to restore SVE
> context appropriately for userland. SVE accesses at EL0 is broken in
> that case, I guess?

Correct on both.  Thanks for the detailed report.


r~
