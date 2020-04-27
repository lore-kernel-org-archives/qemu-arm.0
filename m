Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3741236lfm;
        Sun, 26 Apr 2020 23:18:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+3LOTAvx0af8zk84/g6StpiAzN6AE87atuutcdcWsabxWoiySeervn87f8uewR8/BCOrd
X-Received: by 2002:a37:9c9:: with SMTP id 192mr20795224qkj.149.1587968320310;
        Sun, 26 Apr 2020 23:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587968320; cv=none;
        d=google.com; s=arc-20160816;
        b=HcnCpU3oMP6uQdaydDIpVfQNtzNArPU+oTxzjkupO4Yuwrd4isY0Glg2wsYaMJcuw3
         DnYPTNoBTOM81jB+TFpIUnQAqIePft5qVWrqgS+0Zh1SOUoGIpk8jDL0AMi0wSBUu6Qk
         ZifNVFUXEEsO4OyHQTOfCQVUisFo9A2c7PXW1K76czf2W5KNJ11A68WSWtjXD9B0V71x
         x3ivUVpsNRIpKm6/ik2jqbzYlE0i1ugyDQYh+or/30wU3nLpCrYbdD4nmlp0KXNfrIDq
         LEyByczAxv0ccnDWbxV+L7zTtk7oZXtLm/1mLvnPOhfgISg8ECxPr6Uxt9lZSGafeFoq
         +cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=j91YErI5Q52hgxy0U1pEqh20968RVHLPTRn/w86YQ5w=;
        b=Mz/Uegeyq9DhC4um0RUzbxU/5uw7Ur5a53uVHIB1tbmkNAbQg1FmxGwUHSTBIkNxQm
         RMwFXKyki8rK+kFeUlPOjp8l3JNZHsKx8Euvgv/q9R8u/5h8NbTzccqVGu1+lnZIUG5Y
         BrYyau+/WfQAnFg/nBnKJMbFDVGw+gcP6vn8zasyvWxX3xdglRYnicVOj7LWcf/+OCs3
         fQQ2GlhRIETkXrzrfpIoLJDFvensXC8E5H3y6f4FOSHEb7b/VcnNlsc62Gcifx75oM9F
         XyuQVQ0tT4IJ/xoKSDAx0Z6K4woLSConGGSGnzI6TNLBO+ZJk92D50HOmYvmw1YKQ4n7
         yntA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=ZNF4P+U8;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q11si7664374qtb.62.2020.04.26.23.18.40;
        Sun, 26 Apr 2020 23:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=ZNF4P+U8;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E8F6B4B18A;
	Mon, 27 Apr 2020 02:18:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMKopKw3GmBK; Mon, 27 Apr 2020 02:18:38 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E28E14B138;
	Mon, 27 Apr 2020 02:18:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BE3F64B134
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Apr 2020 02:18:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KnxB-wwPkF9 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 27 Apr 2020 02:18:36 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A63DC4B132
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Apr 2020 02:18:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587968316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9GxT9ibmzxXP3rSVkXz4GcBHwjbM4n+aVHQx3+API8=;
 b=ZNF4P+U8jVK5XhD6K7yBCy8ZjtLa0sjUKloKIRBjc7P9DNjN4Kd5TH4r3rd1RpihuTk742
 MoJxn5Okj9FALJ66kl/5bpJT45rLj6RHuFMzOF/g/s1xH/peZ5udSYwMh3lUAlBF71i1zb
 zTYBemCYEFLPGNShEAH7jwbWp8AjSqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-48T284WyPxiX5ZkcYYpzVw-1; Mon, 27 Apr 2020 02:18:34 -0400
X-MC-Unique: 48T284WyPxiX5ZkcYYpzVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB157464;
 Mon, 27 Apr 2020 06:18:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB5A60C80;
 Mon, 27 Apr 2020 06:18:30 +0000 (UTC)
Date: Mon, 27 Apr 2020 08:18:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 1/2] target/arm: kvm: Handle DABT with no valid ISS
Message-ID: <20200427061827.s3fcyvdu3r3bfijj@kamzik.brq.redhat.com>
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-2-beata.michalska@linaro.org>
 <CAFEAcA_uWS+cVRk=BKra8AhsD+B1syVzhXeCMttSKwQDdo=j3w@mail.gmail.com>
 <20200417131032.lcyunbjwofsn2nzz@kamzik.brq.redhat.com>
 <20200424121633.GF3106@work-vm>
 <d6f4b17c-1202-3aef-320a-247dc0295277@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d6f4b17c-1202-3aef-320a-247dc0295277@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: quintela@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, kvmarm@lists.cs.columbia.edu,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
X-TUID: 3DCDpfAeInkp

On Sat, Apr 25, 2020 at 11:24:14AM +0200, Paolo Bonzini wrote:
> On 24/04/20 14:16, Dr. David Alan Gilbert wrote:
> >>> I was trying to work out whether we need to migrate this state,
> >>> and I'm not sure. Andrew, do you know? I think this comes down
> >>> to "at what points in QEMU's kvm run loop can migration kick in",
> >>> and specifically if we get a KVM_EXIT_ARM_NISV do we definitely
> >>> go round the loop and KVM_RUN again without ever checking
> >>> to see if we should do a migration ?
> >>>
> >> I'd prefer a migration expert confirm this, so I've CC'ed David and Juan,
> >> but afaict there's no way to break out of the KVM_RUN loop after a
> >> successful (ret=0) call to kvm_arch_handle_exit() until after the next
> >> KVM_RUN ioctl. This is because even if migration kicks the vcpus between
> >> kvm_arch_handle_exit() and the next run, the signal won't do anything
> >> other than prepare the vcpu for an immediate exit.
> 
> As far as QEMU is concerned, this should be enough for Beata's patch to
> be safe.  If the signal causes KVM to exit before KVM_EXIT_ARM_NISV,
> it's of course okay.  If you get a KVM_EXIT_ARM_NISV, however, KVM_RUN
> will exit with return code 0 and kvm_cpu_exec will:
> 
> - set env->ext_dabt_pending
> 
> - go round the loop again
> 
> - notice cpu->exit_request and schedule an immediate exit
> 
> - call kvm_arch_put_registers
> 
> - call KVM_RUN again, which will exit with -EINTR
> 
> - exit the loop and allow migration to proceed

This was my understanding as well. Thanks for the confirmation.

> 
> However, I'm not sure that it's a good idea to
> 
> +        /* Clear instantly if the call was successful */
> +        env->ext_dabt_pending = 0;
> 
> Rather, this should be done by the next kvm_arch_get_registers when it
> calls KVM_GET_VCPU_EVENTS.  It's also possible to add an assertion in
> kvm_get_vcpu_events that it you always get zero, to justify that the
> field is not migrated.

I like the idea of a balanced API; keeping the 'set' abort pending
until the next 'get', but this event doesn't work that way.
Documentation/virt/kvm/api.rst states:

  It is not possible to read back a pending external abort (injected via
  KVM_SET_VCPU_EVENTS or otherwise) because such an exception is always
  delivered directly to the virtual CPU).

I think clearing the userspace copy instantly after a successful
KVM_SET_VCPU_EVENTS implements that correctly.

Thanks,
drew

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
