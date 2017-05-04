Received: by 10.25.0.198 with SMTP id 189csp464768lfa;
        Thu, 4 May 2017 01:20:02 -0700 (PDT)
X-Received: by 10.237.41.101 with SMTP id s92mr34879812qtd.175.1493886002812;
        Thu, 04 May 2017 01:20:02 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id w202si1317632qka.93.2017.05.04.01.20.02;
        Thu, 04 May 2017 01:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5F9CE40C21;
	Thu,  4 May 2017 04:16:56 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbXArFex-YfX; Thu,  4 May 2017 04:16:55 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 42FFB408EB;
	Thu,  4 May 2017 04:16:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5E73040296
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 May 2017 04:16:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9v7ooLSVGiNb for <kvmarm@lists.cs.columbia.edu>;
 Thu,  4 May 2017 04:16:53 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 26DB340190
 for <kvmarm@lists.cs.columbia.edu>; Thu,  4 May 2017 04:16:52 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4955F2B;
 Thu,  4 May 2017 01:19:58 -0700 (PDT)
Received: from [10.1.207.55] (melchizedek.cambridge.arm.com [10.1.207.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 792863F3E1;
 Thu,  4 May 2017 01:19:54 -0700 (PDT)
Message-ID: <590AE40B.7060002@arm.com>
Date: Thu, 04 May 2017 09:19:23 +0100
From: James Morse <james.morse@arm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS extension
 feature
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <20170502075631.GE16940@cbox>
 <8d443da4-d17f-2487-10d5-b6c9639dc5a4@redhat.com>
In-Reply-To: <8d443da4-d17f-2487-10d5-b6c9639dc5a4@redhat.com>
Cc: mtsirkin@redhat.com, kvm@vger.kernel.org, tbaicar@codeaurora.org,
 qemu-devel@nongnu.org, wangxiongfeng2@huawei.com,
 Christoffer Dall <cdall@linaro.org>, ben@skyportsystems.com,
 linux@armlinux.org.uk, Dongjiu Geng <gengdongjiu@huawei.com>,
 kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com, lersek@redhat.com,
 songwenjun@huawei.com, wuquanming@huawei.com, marc.zyngier@arm.com,
 qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
 ard.biesheuvel@linaro.org, imammedo@redhat.com
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
X-TUID: iFCuyOyE6NmJ

Hi Paolo,

On 02/05/17 16:48, Paolo Bonzini wrote:
> On 02/05/2017 09:56, Christoffer Dall wrote:
>> The subject and description of these patches are also misleading.
>> Hopefully this is in no way tied to kvmtool, but to userspace
>> generically, for example also to be used by QEMU?
> 
> Yes, QEMU already has a similar capability on x86.
> 
> Does ARM support background scrubbing of memory to detect errors? 

As part of RAS support, yes. A way for firmware to notify the OS about these
events was recently added to the ACPI specification.
We are aiming to turn on ARCH_SUPPORTS_MEMORY_FAILURE which does the Linux end
of things. Punit has a series here:
https://www.spinics.net/lists/arm-kernel/msg575944.html


> If
> so, are there any plans to support action-optional SIGBUS on ARM?

It looks like ARCH_SUPPORTS_MEMORY_FAILURE will bring that in, so yes.



Thanks,

James
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
