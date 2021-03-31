Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp291468lfg;
        Wed, 31 Mar 2021 02:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLOwCzTbabpyk5oDbm9ReDSrggOhDzpZ2EQVfB2jzKKxHe+INzi7RTM15WS4ZVo/wEvf+K
X-Received: by 2002:ae9:e80b:: with SMTP id a11mr2049155qkg.65.1617181203854;
        Wed, 31 Mar 2021 02:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617181203; cv=none;
        d=google.com; s=arc-20160816;
        b=Tu4TCx+kf8qbc/oZu3Wk/AhWb6pu0EIruxkEHf27LhG9GpK/gdlrLjb4hDj94bRgh0
         tE0KoKLmLL2oPDtBXhceIsjnAG8xD6PE6lfHLiAhBKK9AexT/SIculj5IYJ5THDOsYP2
         oBYeIrrBsRnTaLZ5gzAo9l+LmreWHCK+AiOB0I5I5BjSozGoPRe8g3h4hyVp0/QqmFjZ
         hXjArowadEk/k5BeyegZCBMvDPZxx2+662noK++fnWPhZnLJuZIDnmnqksI13gCJG7oG
         TWpKXhBvuVAJ4zCINzEbu/OLooZ7H6vkYMNagYtI7V5fSyWta675hOqaSzi3oFYWdwu3
         x9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xkDd8jSLSe+iXsib8GllO79xYYLw2/QWO+Cegj1odKA=;
        b=Nl7pYjSHuaGf+M1VYBozBHC1Tw/r0TiP3jTQ2nVNBxgBDQsHJu5CRJrGF11AcihfZ7
         YnSKc8+27/4cNR+Sw2Z1kg81RoqVxMlH3jhtzIpHJMt2l/pzfg2iQCwJoVitgjMJgbxI
         zcUTmSv4vdOK49Dw7TeK9RNSDXfT4GzZFXXYyE8W/FgyAWY/sUCItA3JbnRFi2fsxlUj
         ykcYA8AxMz/9wVuMX/8bs29FLI63tcmcoQM7xiUw+hdfT93t9Y4qz+Kf4LXjmVVXYLeG
         yqgACt7WlZr+DFtiHlgsAFEnjMw5BtUDm1fbTi+p+SED7fBqnlatojeJJ9zkUt+APMui
         OYog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id i1si1040250qko.79.2021.03.31.02.00.03;
        Wed, 31 Mar 2021 02:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 3B9074B3E7;
	Wed, 31 Mar 2021 05:00:03 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tThjXQO1Fi5d; Wed, 31 Mar 2021 05:00:02 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 04D5D4B3EB;
	Wed, 31 Mar 2021 05:00:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2FAA24B3E6
 for <kvmarm@lists.cs.columbia.edu>; Wed, 31 Mar 2021 05:00:00 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teJuAlyxlgq5 for <kvmarm@lists.cs.columbia.edu>;
 Wed, 31 Mar 2021 04:59:58 -0400 (EDT)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id CFA614B3E5
 for <kvmarm@lists.cs.columbia.edu>; Wed, 31 Mar 2021 04:59:57 -0400 (EDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9Kvx2qMjzyNL0;
 Wed, 31 Mar 2021 16:57:49 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:59:44 +0800
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
Date: Wed, 31 Mar 2021 16:59:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Leif Lindholm <leif@nuviainc.com>,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: INs2bnbr0PBz

[+kvmarm, Marc]

On 2021/3/12 0:59, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters for Cortex-A53, A57, A72,
> A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
> Cortex-R5 goes down to 3.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.

So I've tested it with kvm and I get the following error before
VM startup:

   "qemu-system-aarch64: Failed to retrieve host CPU features"

> ---
>   target/arm/cpu.h     |  1 +
>   target/arm/cpu64.c   |  3 +++
>   target/arm/cpu_tcg.c |  5 +++++
>   target/arm/helper.c  | 29 +++++++++++++++++------------
>   target/arm/kvm64.c   |  2 ++
>   5 files changed, 28 insertions(+), 12 deletions(-)

[...]

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db94..581335e49d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                 ARM64_SYS_REG(3, 0, 0, 7, 1));
>           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                 ARM64_SYS_REG(3, 0, 0, 7, 2));
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> +                              ARM64_SYS_REG(3, 3, 9, 12, 0));

Looks like we tried to access PMCR_EL0 *before* telling kvm that
KVM_ARM_VCPU_PMU_V3 feature should be supported, which is now
refused by kvm [*].

[*] https://git.kernel.org/torvalds/c/11663111cd49
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
