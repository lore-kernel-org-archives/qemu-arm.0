Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1784714wro;
        Fri, 15 Mar 2019 01:59:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzv0Nqho0EKOYjztpjezvlLFT++G+d62dgIPOlN4dUL9lAW3vJCUsz0sp9I56MZeIR7FTTf
X-Received: by 2002:a37:a78b:: with SMTP id q133mr1910002qke.62.1552640395652;
        Fri, 15 Mar 2019 01:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552640395; cv=none;
        d=google.com; s=arc-20160816;
        b=rg91nf8FYj7DPwsLY8Oh7M9hwLaRDvrrKcD4h/3dgrfE1Sk7hlDFFwnrAC7X6k6P88
         MqjZJUCq44zPVoReVivZYVIvReF+sZvSOtP81CRqZCsZ0m7a+LI13TxkR8rdjzSJiOMm
         cZ2Q1CqzeAqdevBnL0J+ovYiRRA716LXQ7R7pve8R4+BmiZatoNd+WT4kRq76VX5RSnB
         0YVYDSLBu3E7PoRP5dIO5/BjuQakKLN4wYu5j5OB36diFj/rLS0kWc45URFevrlBpxwa
         8YLnevofW6JPI0e3IgXtIkRZrp9Rl6IJvHnSaIsBuvv21tfVkPeZwfiK5qarjlaZ0M0i
         NC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=Gmv82QWRJ1sJUWxBErViELLRDG49QuZTVopJjn8oWYc=;
        b=Lpgg9wEIzabsUVGFPqLs/AMcnIptBRdw+5Vzs7aiqWlR3s6bEYP8Yv+17cCmjHB/3F
         whuEseDA397H/VWfyy98wfDcTRuScWAeYbLX4A3fjfEwmHa8c5X01zp/ThVDc9YUIFEj
         ehRlNAKjZlaIulQ1I/psdVb0ymQuh010zbHXFwe7SBQXYjvyi9iI7Ja+CeHwIYkfrxvN
         3+qIlYvOV9p4wx5L5DrNgDWJGsoGs+lkCGZXvD1lKVbuW3ZrjzJvzaYAxGuLUfM5k+mk
         CmQCwdf7SyDdtOdReziO8RIgzekvuAYnIfXjxQSoK1k9VQqbTu8eb/IzdiElCR9FHqWX
         k1sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id s2si863742qts.59.2019.03.15.01.59.55;
        Fri, 15 Mar 2019 01:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2F7F34A452;
	Fri, 15 Mar 2019 04:59:55 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7AtfKvlS+0mL; Fri, 15 Mar 2019 04:59:54 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2FC484A44D;
	Fri, 15 Mar 2019 04:59:54 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C42FA4A44D
 for <kvmarm@lists.cs.columbia.edu>; Fri, 15 Mar 2019 04:59:52 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cjk8WPYLuytT for <kvmarm@lists.cs.columbia.edu>;
 Fri, 15 Mar 2019 04:59:51 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A444E4A431
 for <kvmarm@lists.cs.columbia.edu>; Fri, 15 Mar 2019 04:59:51 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 119E7A78;
 Fri, 15 Mar 2019 01:59:51 -0700 (PDT)
Received: from localhost (e113682-lin.copenhagen.arm.com [10.32.144.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D2A3F575;
 Fri, 15 Mar 2019 01:59:50 -0700 (PDT)
Date: Fri, 15 Mar 2019 09:59:48 +0100
From: Christoffer Dall <christoffer.dall@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
Message-ID: <20190315085948.GB10950@e113682-lin.lund.arm.com>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22f57e8a-bdb0-ffeb-ab78-3e9e41cac66b@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marc Zyngier <marc.zyngier@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, kvmarm@lists.cs.columbia.edu
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
X-TUID: wEQz5V2qZWBL

Hi Steve,

On Wed, Mar 13, 2019 at 10:11:30AM +0000, Steven Price wrote:
> 
> Personally I think what we need is:
> 
> * Either a patch like the one from Heyi Guo (save/restore CNTVCT_EL0) or
> alternatively hooking up KVM_KVMCLOCK_CTRL to prevent the watchdog
> firing when user space explicitly stops scheduling the guest for a while.

If we save/restore CNTVCT_EL0 and the warning goes away, does the guest
wall clock timekeeping get all confused and does it figure this out
automagically somehow?

Does KVM_KVMCLOCK_CTRL solve that problem?

> 
> * KVM itself saving/restoring CNTVCT_EL0 during suspend/resume so the
> guest doesn't see time pass during a suspend.

This smells like policy to me so I'd much prefer keeping as much
functionality in user space as possible.  If we already have the APIs we
need from KVM, let's use them.

> 
> * Something equivalent to MSR_KVM_WALL_CLOCK_NEW for arm which allows
> the guest to query the wall clock time from the host and provides an
> offset between CNTVCT_EL0 to wall clock time which the KVM can update
> during suspend/resume. This means that during a suspend/resume the guest
> can observe that wall clock time has passed, without having to be
> bothered about CNTVCT_EL0 jumping forwards.
> 

Isn't the proper Arm architectural solution for this to read the
physical counter for wall clock time keeping ?

(Yes that will require a trap on physical counter reads after migration
on current systems, but migration sucks in terms of timekeeping
already.)


Thanks,

    Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
