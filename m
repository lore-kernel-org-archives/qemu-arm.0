Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8475163wrp;
        Tue, 1 Oct 2019 10:19:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqze/0+xG5mOP82Qbel+EKuSQx83pdWiGMxMxMqX6ShsZKzwzIKTzBVH5pL6MDMsintSMqM+
X-Received: by 2002:a37:591:: with SMTP id 139mr7202887qkf.162.1569950385535;
        Tue, 01 Oct 2019 10:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569950385; cv=none;
        d=google.com; s=arc-20160816;
        b=VijHcCMN4Udb98cqrAhPtbd7DOGO6+jj93Ey2zKUdwLDn7c85hTB2YUoDu0MoWPKSm
         wRV0FRNrYSmpuA6Y3Jn9HRBQtdvgUeyMUH5+nKZBb1xjPnd6nDH8bRlr8xi+53wKHhyi
         yWPdiHnkQYZKfz2Qn68NxI1Igb/xycfdYNmfzBI0ApBYPVT3vnc72NQ2mxuUvQ40qasD
         qRBnn6+/4WyewxWst4yw0QMg7L+MMVSffbLlwrakpW8PM0LAgau1ZIBjrIQpMrzKQvi0
         Zv75Uyda/pT/Ql2Ey16WfN/7adPKfj2JXYRRTuVmO4nTpoGZo1IIKW3shMCZI8ZSLR4i
         IK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=b9f95PGhw6QDqaAq8I6zti1E1Gas/qaHPpWeR7kXmo0=;
        b=A+XG5jb4URsummQb5ly5zy1aKPxHDpHHWEUdpptVND3xnylewFD5bw0RDOAa5q40SG
         C1sJEGjHMJBd6KF2AE5qmyGzNVgSMnlO8QyILMmdJ53BS83MCGDKQ1PbDDEEtQKbmF09
         NqZ6vVj7ncZR062IXOoJvQ6vlrOZocjZrOJCz7HwM2COCbi5xk0ElrVpWyjd/RagMPkJ
         4krYGMXCNAQCfnrY50FwgS/lCgyKvBVNh7w7nUgfcTe8lDkCVptkp4TGFdNXOPWNQGCg
         u4v2Q3O8WLRoxHfqkL71ocTPVB67mvL6gc1ioMuNjNW21mNNqTd/Vj+eCSDw02oy7lEh
         9f/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 1si13756472qke.327.2019.10.01.10.19.45;
        Tue, 01 Oct 2019 10:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 003004A6D5;
	Tue,  1 Oct 2019 13:19:45 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0PCHPqfZtNk; Tue,  1 Oct 2019 13:19:43 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C496F4A65C;
	Tue,  1 Oct 2019 13:19:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 868F54A676
 for <kvmarm@lists.cs.columbia.edu>; Tue,  1 Oct 2019 13:19:42 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhcmtQyJ4a6d for <kvmarm@lists.cs.columbia.edu>;
 Tue,  1 Oct 2019 13:19:41 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 409014A65A
 for <kvmarm@lists.cs.columbia.edu>; Tue,  1 Oct 2019 13:19:41 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 970E0337;
 Tue,  1 Oct 2019 10:19:40 -0700 (PDT)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AD233F706;
 Tue,  1 Oct 2019 10:19:32 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] kvm/arm: add capability to forward hypercall to
 user space
To: Heyi Guo <guoheyi@huawei.com>
References: <1569338454-26202-1-git-send-email-guoheyi@huawei.com>
 <1569338454-26202-2-git-send-email-guoheyi@huawei.com>
From: James Morse <james.morse@arm.com>
Message-ID: <e097fb69-1e68-4082-d310-e7666e30b5d6@arm.com>
Date: Tue, 1 Oct 2019 18:19:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1569338454-26202-2-git-send-email-guoheyi@huawei.com>
Content-Language: en-GB
Cc: kvm@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, qemu-arm@nongnu.org,
 kvmarm@lists.cs.columbia.edu, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org
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
X-TUID: 3NfNg435gOqf

Hi Heyi,

On 24/09/2019 16:20, Heyi Guo wrote:
> As more SMC/HVC usages emerge on arm64 platforms, like SDEI, it makes
> sense for kvm to have the capability of forwarding such calls to user
> space for further emulation.

(what do you mean by further? Doesn't user-space have to do all of it?)


> We reuse the existing term "hypercall" for SMC/HVC, as well as the
> hypercall structure in kvm_run to exchange arguments and return
> values. The definition on arm64 is as below:
> 
> exit_reason: KVM_EXIT_HYPERCALL
> 
> Input:
>   nr: the immediate value of SMC/HVC calls; not really used today.

>   args[6]: x0..x5 (This is not fully conform with SMCCC which requires
>            x6 as argument as well, but use space can use GET_ONE_REG
>            ioctl for such rare case).

If this structure isn't right for us, we could define a different one for arm/arm64.
(we did this for kvm_vcpu_events)


> Return:
>   args[0..3]: x0..x3 as defined in SMCCC. We need to extract
>               args[0..3] and write them to x0..x3 when hypercall exit
>               returns.

Are we saying that KVM_EXIT_HYPERCALL expects to be used with SMC-CC?
(if so, we should state that).

I'm not certain we should tie this to SMC-CC.

If we don't tie it to SMC-CC this selection of in/out registers looks odd, there is
nothing about HVC/SMC that uses these registers, its just the SMC convention.


> Flag hypercall_forward is added to turn on/off hypercall forwarding
> and the default is false. Another flag hypercall_excl_psci is to
> exclude PSCI from forwarding for backward compatible, and it only
> makes sense to check its value when hypercall_forward is enabled.

Calling out PSCI like this is something we shouldn't do. There will be, (are!) other
SMC-CC calls that the kernel provides emulation for, we can't easily add to this list.

I think the best way to avoid this, is to say the hypercall mechanism forwards 'unhandled
SMC/HVC' to user-space. Which things the kernel chooses to handle can change.

We need a way for user-space to know which SMC/HVC calls the kernel will handle, and will
not forward. A suggestion is to add a co-processor that lists these by #imm and r0/x0
value. User-space can then query any call to find out if it would be exported if the guest
made that call. Something like kvm_arm_get_fw_reg().

I agree it should be possible to export the PSCI range to user-space, so that user-space
can provide a newer/better version than the kernel emulates, or prevent secondary cores
coming online. (we should check how gracefully the kernel handles that... it doesn't
happen on real systems)
This could be done with something like kvm_vm_ioctl_enable_cap(), one option is to use the
args to toggle the on/off value, but it may be simpler to expose a
KVM_CAP_ARM_PSCI_TO_USER that can be enabled.


Please update Documentation/virt/kvm/api.txt as part of the patches that make user-visible
changes.

For 32bit, are we going to export SMC/HVC calls that failed their condition-code checks?

The hypercall structure should probably indicate whether the SMC/HVC call came from
aarch32 or aarch64, as the behaviour may be different.


Thanks,

James
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
