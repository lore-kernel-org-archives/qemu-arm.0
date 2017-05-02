Received: by 10.25.0.198 with SMTP id 189csp363171lfa;
        Tue, 2 May 2017 08:29:40 -0700 (PDT)
X-Received: by 10.55.108.131 with SMTP id h125mr24788548qkc.199.1493738980312;
        Tue, 02 May 2017 08:29:40 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a36si16973650qtb.14.2017.05.02.08.29.40;
        Tue, 02 May 2017 08:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 07F3E40B5B;
	Tue,  2 May 2017 11:26:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZVSjngSbeB2; Tue,  2 May 2017 11:26:35 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D3A0B40BBC;
	Tue,  2 May 2017 11:26:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 76CFB40B5E
 for <kvmarm@lists.cs.columbia.edu>; Tue,  2 May 2017 11:26:34 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXpeXN-n7VVX for <kvmarm@lists.cs.columbia.edu>;
 Tue,  2 May 2017 11:26:33 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4325140B5B
 for <kvmarm@lists.cs.columbia.edu>; Tue,  2 May 2017 11:26:33 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3982B;
 Tue,  2 May 2017 08:29:35 -0700 (PDT)
Received: from [10.1.207.55] (melchizedek.cambridge.arm.com [10.1.207.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87E473F41F;
 Tue,  2 May 2017 08:29:31 -0700 (PDT)
Message-ID: <5908A5BC.1060202@arm.com>
Date: Tue, 02 May 2017 16:29:00 +0100
From: James Morse <james.morse@arm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Dongjiu Geng <gengdongjiu@huawei.com>
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS extension
 feature
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
Cc: mtsirkin@redhat.com, kvm@vger.kernel.org, tbaicar@codeaurora.org,
 qemu-devel@nongnu.org, wangxiongfeng2@huawei.com, ben@skyportsystems.com,
 linux@armlinux.org.uk, kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
 lersek@redhat.com, songwenjun@huawei.com, wuquanming@huawei.com,
 marc.zyngier@arm.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 linux-arm-kernel@lists.infradead.org, ard.biesheuvel@linaro.org,
 pbonzini@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: RidwDtExNHzB

Hi Dongjiu Geng,

On 30/04/17 06:37, Dongjiu Geng wrote:
> Handle kvmtool's detection for RAS extension, because sometimes
> the APP needs to know the CPU's capacity

> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index d9e9697..1004039 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -64,6 +64,14 @@ static bool cpu_has_32bit_el1(void)
>  	return !!(pfr0 & 0x20);
>  }
>  
> +static bool kvm_arm_support_ras_extension(void)
> +{
> +	u64 pfr0;
> +
> +	pfr0 = read_system_reg(SYS_ID_AA64PFR0_EL1);
> +	return !!(pfr0 & 0x10000000);
> +}

Why are we telling user-space that the CPU has RAS extensions? EL0 can't do
anything with this and the guest EL1 can detect it from the id registers.


Are you using this to decide whether or not to generate a HEST for the guest?

If Qemu/kvmtool supports handling memory-failure notifications from signals you
should always generate a HEST. The GHES notification method could be anything
Qemu can deliver to the guest using the KVM APIs. Notifications from Qemu to the
guest don't depend on the RAS extensions. KVM has APIs for IRQ and SEA (you can
use KVM_SET_ONE_REG).


I think we need a new API for injecting SError for SEI from Qemu/kvmtool, but it
shouldn't be related to the RAS extensions. All v8.0 CPUs have HCR_EL2.VSE, so
we need to know KVM supports this API.

Your later patch adds code to set VSESR to make virtual RAS SErrors work, I
think we need to expose that to user-space.


Thanks,

James
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
