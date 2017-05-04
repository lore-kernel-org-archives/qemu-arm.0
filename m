Received: by 10.25.0.198 with SMTP id 189csp646851lfa;
        Thu, 4 May 2017 08:49:48 -0700 (PDT)
X-Received: by 10.55.77.209 with SMTP id a200mr8893018qkb.11.1493912988246;
        Thu, 04 May 2017 08:49:48 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id w202si2129664qka.93.2017.05.04.08.49.47;
        Thu, 04 May 2017 08:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7EFB040C21;
	Thu,  4 May 2017 11:46:40 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3vSwsBglRIe; Thu,  4 May 2017 11:46:39 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5EE4140B5E;
	Thu,  4 May 2017 11:46:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1DBF240992
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 May 2017 11:46:38 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auCWhHbfcEnS for <kvmarm@lists.cs.columbia.edu>;
 Thu,  4 May 2017 11:46:37 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0C12040296
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 May 2017 11:46:36 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B41FB2B;
 Thu,  4 May 2017 08:49:42 -0700 (PDT)
Received: from [10.1.207.55] (melchizedek.cambridge.arm.com [10.1.207.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1612C3F23B;
 Thu,  4 May 2017 08:49:38 -0700 (PDT)
Message-ID: <590B4D73.60000@arm.com>
Date: Thu, 04 May 2017 16:49:07 +0100
From: James Morse <james.morse@arm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Dongjiu Geng <gengdongjiu@huawei.com>
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS extension
 feature
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <5908A5BC.1060202@arm.com>
In-Reply-To: <5908A5BC.1060202@arm.com>
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
X-TUID: lA5mMDRcv/je

Hi Dongjiu Geng,

On 02/05/17 16:29, James Morse wrote:
> I think we need a new API for injecting SError for SEI from Qemu/kvmtool, but it
> shouldn't be related to the RAS extensions. All v8.0 CPUs have HCR_EL2.VSE, so
> we need to know KVM supports this API.

Thinking about this some more, it is slightly more nuanced, KVM can always
provide an API to inject SError, but it can only set the VSESR if the CPU has
the RAS Extensions.

Only offering the inject-SError API call if we can also set the VSESR looks a
bit funny, but no-one has needed the no-ESR version so far.

I still don't think we should let user-space make the 'RAS Extensions means
VSESR' logical step.

So my comments on this patch become:
Don't read id registers directly, use cpus_have_cap() which handles features
that differ across CPUs or were turned off at compile time.

Please don't call this 'KVM_CAP_ARM_RAS_EXTENSION', if we are building an API to
inject SError, call it that instead.


Thanks,

James
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
