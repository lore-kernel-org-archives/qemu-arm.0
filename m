Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp444692lfm;
        Fri, 19 Jun 2020 03:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlXIhpHjy9YiU6OXi++r0qhDMQMwXznEC/cOHhi3qkxVG751aWIbQ85a3WaOhVr4h1bMIm
X-Received: by 2002:a17:907:435f:: with SMTP id oc23mr3043398ejb.426.1592562193889;
        Fri, 19 Jun 2020 03:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592562193; cv=none;
        d=google.com; s=arc-20160816;
        b=adRr4OtfzLlngG4m/fGZ4SrKHGO12Dapl09N85CcL7bR61xd38EqqIywQECZFWH6yD
         wyGAtAN9oeMmcaoCPhiTJ02K2GCjEVDmn3hDOd+73i/nlmA4K1csF9EZDe9BNx76DOiV
         22UAjiHDB4QtXIocrGKR8tHpTXyFDS5dO9VNPdEUsg5kKijzHdm6xMGeLNdpkT8cwNYV
         rZeTFa9LMSxueu0B9OUIkIRufgyt1gt0vISug7Cnuxjw9qKKJP693Go59pd4SUBd9mdT
         7OX9Ltk+F3NctZtdKVPlPTkzZ/HJNnTJ6mbkPtTE3PJJl+jHcYpDAKQOZG7J7HvoSZ1K
         QMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=uP2JQ6XlvCFhDymr1AOZy3sBbLehN2SUqGDGk45wDCs=;
        b=wcuEC/2BHyeH+ETma10wPEBgSDSZZo0FVbiGHSc2wuMwcHlfUODHbuC9GW6iNE7sF/
         SttGM+u8g9K9TIFDbKo9iS2QuJx5wS5eJhKGAwkjzjCTPLINP24Ian6rzr67yQigoRbl
         KZtVtkYPljAq/8wcJlMBgu5paDyoV31M/W1h40aa39ukacL2u1D73KlmdpB8J6E8/xcN
         6yJ1ePnAUvE4p91U97AEi6OtNZfYrsOIiTlZxSU+nbdIHUZz8utIOOwh25sYkeBBgZdA
         mb0fl38SJxYqIZsFSVVxc/WZz1MrL5DdIMwXtVRNrl7HSf9OFba7Q1MkCxO0arihc921
         5Ilg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JnV5zh8l;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id i2si3526139ejr.278.2020.06.19.03.23.13;
        Fri, 19 Jun 2020 03:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JnV5zh8l;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732260AbgFSKXM (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 19 Jun 2020 06:23:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60422 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729195AbgFSKXK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 19 Jun 2020 06:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592562188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uP2JQ6XlvCFhDymr1AOZy3sBbLehN2SUqGDGk45wDCs=;
        b=JnV5zh8lVbon5qtLeMJ/SX0bOeBsntea1mAz+YsX+Ojn3Sn4qIavLbHbYucNdjFooh1h1t
        i7mCE7k7KHmwZCfNLMrfFKpBRC9c3rr9WkZwRsSxMKF21mPVtqNP9dL8VgdU4mW35WlQhn
        cYUpp9ye860pHEhA3fJ06VJ+Co8g8rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-tWFRFku5NPCVIfjPPnq5VQ-1; Fri, 19 Jun 2020 06:23:06 -0400
X-MC-Unique: tWFRFku5NPCVIfjPPnq5VQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2C8310059A0;
        Fri, 19 Jun 2020 10:23:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.110])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A05AF5BAD9;
        Fri, 19 Jun 2020 10:23:03 +0000 (UTC)
Date:   Fri, 19 Jun 2020 12:23:00 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Haibo Xu <haibo.xu@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] target/arm: Check supported KVM features globally
 (not per vCPU)
Message-ID: <20200619102300.2mzawwpj4gkglco3@kamzik.brq.redhat.com>
References: <20200619095542.2095-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200619095542.2095-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: abFJ5DLmlYOM

On Fri, Jun 19, 2020 at 11:55:42AM +0200, Philippe Mathieu-Daudé wrote:
> Since commit d70c996df23f, when enabling the PMU we get:
> 
>   $ qemu-system-aarch64 -cpu host,pmu=on -M virt,accel=kvm,gic-version=3
>   Segmentation fault (core dumped)
> 
>   Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
>   0x0000aaaaaae356d0 in kvm_ioctl (s=0x0, type=44547) at accel/kvm/kvm-all.c:2588
>   2588        ret = ioctl(s->fd, type, arg);
>   (gdb) bt
>   #0  0x0000aaaaaae356d0 in kvm_ioctl (s=0x0, type=44547) at accel/kvm/kvm-all.c:2588
>   #1  0x0000aaaaaae31568 in kvm_check_extension (s=0x0, extension=126) at accel/kvm/kvm-all.c:916
>   #2  0x0000aaaaaafce254 in kvm_arm_pmu_supported (cpu=0xaaaaac214ab0) at target/arm/kvm.c:213
>   #3  0x0000aaaaaafc0f94 in arm_set_pmu (obj=0xaaaaac214ab0, value=true, errp=0xffffffffe438) at target/arm/cpu.c:1111
>   #4  0x0000aaaaab5533ac in property_set_bool (obj=0xaaaaac214ab0, v=0xaaaaac223a80, name=0xaaaaac11a970 "pmu", opaque=0xaaaaac222730, errp=0xffffffffe438) at qom/object.c:2170
>   #5  0x0000aaaaab5512f0 in object_property_set (obj=0xaaaaac214ab0, v=0xaaaaac223a80, name=0xaaaaac11a970 "pmu", errp=0xffffffffe438) at qom/object.c:1328
>   #6  0x0000aaaaab551e10 in object_property_parse (obj=0xaaaaac214ab0, string=0xaaaaac11b4c0 "on", name=0xaaaaac11a970 "pmu", errp=0xffffffffe438) at qom/object.c:1561
>   #7  0x0000aaaaab54ee8c in object_apply_global_props (obj=0xaaaaac214ab0, props=0xaaaaac018e20, errp=0xaaaaabd6fd88 <error_fatal>) at qom/object.c:407
>   #8  0x0000aaaaab1dd5a4 in qdev_prop_set_globals (dev=0xaaaaac214ab0) at hw/core/qdev-properties.c:1218
>   #9  0x0000aaaaab1d9fac in device_post_init (obj=0xaaaaac214ab0) at hw/core/qdev.c:1050
>   ...
>   #15 0x0000aaaaab54f310 in object_initialize_with_type (obj=0xaaaaac214ab0, size=52208, type=0xaaaaabe237f0) at qom/object.c:512
>   #16 0x0000aaaaab54fa24 in object_new_with_type (type=0xaaaaabe237f0) at qom/object.c:687
>   #17 0x0000aaaaab54fa80 in object_new (typename=0xaaaaabe23970 "host-arm-cpu") at qom/object.c:702
>   #18 0x0000aaaaaaf04a74 in machvirt_init (machine=0xaaaaac0a8550) at hw/arm/virt.c:1770
>   #19 0x0000aaaaab1e8720 in machine_run_board_init (machine=0xaaaaac0a8550) at hw/core/machine.c:1138
>   #20 0x0000aaaaaaf95394 in qemu_init (argc=5, argv=0xffffffffea58, envp=0xffffffffea88) at softmmu/vl.c:4348
>   #21 0x0000aaaaaada3f74 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at softmmu/main.c:48
> 
> This is because in frame #2, cpu->kvm_state is still NULL
> (the vCPU is not yet realized).
> 
> KVM has a hard requirement of all cores supporting the same
> feature set. We only need to check if the accelerator supports
> a feature, not each vCPU individually.
> 
> Fix by kvm_arm_<FEATURE>_supported() functions take a AccelState
> argument (already realized/valid at this point) instead of a
> CPUState argument.

This is no longer what's being done.

> 
> Reported-by: Haibo Xu <haibo.xu@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: d70c996df23f ("target/arm/kvm: Use CPUState::kvm_state in
kvm_arm_pmu_supported()")
Analyzed-by: Andrew Jones <drjones@redhat.com>

> ---
> v2: Use global kvm_state (bonzini)
> 
> Paolo, does this break migration of encrypted memory assumptions?
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Supersedes: <20200617130800.26355-1-philmd@redhat.com>
> ---
>  target/arm/kvm_arm.h | 21 +++++++++------------
>  target/arm/cpu.c     |  2 +-
>  target/arm/cpu64.c   | 10 +++++-----
>  target/arm/kvm.c     |  4 ++--
>  target/arm/kvm64.c   | 14 +++++---------
>  5 files changed, 22 insertions(+), 29 deletions(-)

With the above

Reviewed-by: Andrew Jones <drjones@redhat.com>
