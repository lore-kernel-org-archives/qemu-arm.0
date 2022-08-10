Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3777590ejf;
        Wed, 10 Aug 2022 06:40:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4OAKcp+U8Ipgkp0aXHMCLxQgNvgRKYKGZnhrxq1itCpxykojumk/JDmifv4AkcBqq8IGv8
X-Received: by 2002:a05:6214:21cc:b0:474:86ae:bb91 with SMTP id d12-20020a05621421cc00b0047486aebb91mr23365594qvh.110.1660138846113;
        Wed, 10 Aug 2022 06:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660138846; cv=none;
        d=google.com; s=arc-20160816;
        b=JCSeYqIU6/m16rySzCpg2FOwUkozvsY0ltZGj6viyovGwjSig3QFA1OM9OjtaoFA8i
         wLjsp3x/EN6n43/hvyraKOUY+QBp1n1WlIjV23DXL+kXOJm4O7g2utbGO6GjVPVKzkNn
         jRrbxI+ZgrtJxdvYTvkYMCxy1FsW7h/ihF1z/eIE2zLjs8KMZhLc1IoBV/qWTJjB5Ueb
         G5ysi2Iet6w+5QcU3QlcHp7McKbpVU7CGxjGr0+JO5yDlWpvySyos/0hFPhaEeEaQi2r
         gtKwbpmQuHCs7pQuG+4R60wPjD6/T7O9q+3pJzf3+rnEHvbm8iyvfa8gqMj4HSOSfrsq
         iTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=50PMH3gLkuHREUWdjRITMpEviNLIJVqMWWnjONDsyM8=;
        b=Lx4QRVltfyJOaopmku6n22BopyBWUtksEImE/9fdQgMgU3yOQ/0rBR0tV/7Gc7Rytm
         W3ddNl7/IrDI4uw8OZLL/BeJhicLIpvbrZdWKTIMVvq/8UkjpzTMvLYVyXlEeN0UFH0K
         ZI1uXdlmd43BP93c3BV+pyK/uIsrFiA0zVEs+MVjdinevGAVQMXGuS41GnJ01thSWBiJ
         SQ41EDdcahrWyBc5Lk67WNzyhk8T6xze7opE6a3hCgToedcqVo7b3DUI6xmSkp1LViNb
         uC1JHc/dNFRiMZOjh3+V/bPNsWk+7vgDeIjdrtPYZCZaCRTu1yCNe/ZCP/vqA2Qcl9+b
         MdrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac84b4b000000b0034216c65bfasi676949qts.232.2022.08.10.06.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 06:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLlwz-0005rZ-Kj
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 09:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oLlWJ-0006Nu-Gc; Wed, 10 Aug 2022 09:13:11 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oLlWF-0003Cn-A4; Wed, 10 Aug 2022 09:13:10 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M2r1G50hTzGpHW;
 Wed, 10 Aug 2022 21:11:30 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 10 Aug 2022 21:12:55 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 10 Aug 2022 21:12:55 +0800
Subject: Re: [PATCH v6 24/24] target/arm: Define neoverse-n1
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
 <20220506180242.216785-25-richard.henderson@linaro.org>
Message-ID: <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
Date: Wed, 10 Aug 2022 21:12:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220506180242.216785-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=yuzenghui@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
X-TUID: dviQeruM4+h5

On 2022/5/7 2:02, Richard Henderson wrote:

> +static void aarch64_neoverse_n1_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,neoverse-n1";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +
> +    /* Ordered by B2.4 AArch64 registers by functional group */
> +    cpu->clidr = 0x82000023;
> +    cpu->ctr = 0x8444c004;
> +    cpu->dcz_blocksize = 4;
> +    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;

The r4p1 TRM says that the Neoverse N1 core supports SPE (the value
of ID_AA64DFR0.PMSVer is 0b0001) but do we really support SPE
emulation in QEMU?

The guest immediately received an unexpected exception (with EC==0,
at EFI stage) when I tried to boot it using something like:

/path/to/qemu-system-aarch64 \
-M virt,gic-version=3,virtualization=on \
-cpu neoverse-n1 -accel tcg \
-bios QEMU_EFI.fd [...]

and QEMU shouted that "read access to unsupported AArch64 system
register op0:3 op1:0 crn:9 crm:10 op2:7", which told us that the
guest attempted to read the PMBIDR_EL1 register.

Zenghui
