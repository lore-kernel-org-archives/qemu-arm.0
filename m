Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1646893lfy;
        Wed, 29 Jul 2020 07:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc4WPLxLd7xGp1tqCOt78zo6BreOO+87ITIqVye3Hu8eDKrcsA4O3Ou3KnOqHn/6mHLRlH
X-Received: by 2002:a25:248d:: with SMTP id k135mr26999108ybk.386.1596033669474;
        Wed, 29 Jul 2020 07:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596033669; cv=none;
        d=google.com; s=arc-20160816;
        b=OYOiuUdfBVuVLhEv5KUJulv04FkHenSZgA/9t6UVbmSvgJtbhS63p8smB7WQUjEV7z
         tt0EIlkpZI8PzN3a+N74b4U/VebTm7yJLU2VJN2ZJMuwx1J9VsNrA/Q3TxuKbo2iEd6j
         BLVFV3yL3P8i6edJY1KzLAGPvNIbYBT3HEO89UPbE+3FyHuq5h+4vkzUYkbBRYmRnOxS
         152Skf3QkD/AlKG2iLaI2oDPTdZHfgy3/g2I4CV9ArNxgsfKKC0A04SkwtxYLTFgi5C7
         C3jTF1CgdZx0XFYSnR9FYEDFWVSQuvM+yEiZhwFCQll8MD06iq9PA3ggsUONAMh4IDuU
         E8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=dldRjVj3WzIQ43MNWIxVC2TaFtT1MfQvTXgUszV2Xto=;
        b=IE0Q/2Jdj5stVGY5THWf1iVluN77N1uuQ5PPatmsNitgjdwrbu+EnpUTLCn4kHTqaJ
         dtuXFfW63VX1TQ/eScQMkd9FDCXCh/hy1/DkJJmKddElqA7CUIiGQ4vPh9b3ZtY9y8Pu
         co8LG6QupYxhESv/vWXUPItGY6v2r2F42AO/eKT1CM8oGEl/un/CVCBWSXcdHHvTJhmg
         7FN6eoXyhGWNyjLPr7prVMttWojKQdE7SO7nKdGPA+j0TEodewpsOACi0B0iOxSn0BUb
         mRU4OjZsnlaz8JBZkmeMlOl88RQmUEcqbxEo2PX1KT2A7V1X14xHcpccHSRw61w4fWAb
         CNnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dQH+ITw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si2384526ybp.406.2020.07.29.07.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 07:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dQH+ITw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0nGW-0001N2-Sm
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 10:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0nGO-0001M5-37
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:41:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29991
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0nGM-0003iD-Aw
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596033657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dldRjVj3WzIQ43MNWIxVC2TaFtT1MfQvTXgUszV2Xto=;
 b=dQH+ITw3iRgupTDlw99EMVWfVCSeQ9U3LNJZ07Ay9cJO3Tph0ExxrQq6L8RX6lA0Q7ZO50
 DwzGxcZLDxZocjtI/yy12958slY2iB0ypMkj8nyakKXQQnCY05gSTQY9Xms7nQ81nAKbtW
 JYAJHo5DJHpO+Wsf5XHuSOs6XrqipvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-r5NjES9UOICIwZqdHh-dYQ-1; Wed, 29 Jul 2020 10:40:55 -0400
X-MC-Unique: r5NjES9UOICIwZqdHh-dYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C41380183C;
 Wed, 29 Jul 2020 14:40:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 256895C1BD;
 Wed, 29 Jul 2020 14:40:52 +0000 (UTC)
Date: Wed, 29 Jul 2020 16:40:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] hw/arm/virt: Implement kvm-steal-time
Message-ID: <20200729144050.pzl4t3pnpt2zg36u@kamzik.brq.redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
 <20200711101033.47371-4-drjones@redhat.com>
 <CAFEAcA_GGVyjV_avxAfrRKnF72mxXEEf=J34aq-L8yMnLndigg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GGVyjV_avxAfrRKnF72mxXEEf=J34aq-L8yMnLndigg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qc7vK+T3W2qG

On Tue, Jul 21, 2020 at 11:46:12AM +0100, Peter Maydell wrote:
> > +    if (!probed) {
> > +        probed = true;
> > +        if (kvm_check_extension(kvm_state, KVM_CAP_VCPU_ATTRIBUTES)) {
> > +            if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
> > +                error_report("Failed to create scratch VCPU");
> > +                abort();
> > +            }
> > +
> > +            has_steal_time = kvm_device_check_attr(fdarray[2],
> > +                                                   KVM_ARM_VCPU_PVTIME_CTRL,
> > +                                                   KVM_ARM_VCPU_PVTIME_IPA);
> > +
> > +            kvm_arm_destroy_scratch_host_vcpu(fdarray);
> 
> I was a bit surprised that we create a scratch VCPU here, but
> it looks like we've opted for "create scratch VCPU, check specific
> detail, destroy VCPU" as the usual coding pattern rather than trying
> to coalesce into a single "create scratch VCPU once, cache all
> the info we might need for later". I guess if somebody (a) cares
> about startup performance and (b) finds through profiling that
> creation-and-destruction of the scratch VMs/VCPUs is a significant
> contributor they can write the refactoring themselves :-)

There's still a chance I'll be changing this to a KVM CAP if the KVM
maintainers accept the patch I proposed to add one.

> 
> > +        }
> > +    }
> > +
> > +    if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
> > +        if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > +            cpu->kvm_steal_time = ON_OFF_AUTO_OFF;
> > +        } else {
> > +            cpu->kvm_steal_time = ON_OFF_AUTO_ON;
> > +        }
> > +    } else if (cpu->kvm_steal_time == ON_OFF_AUTO_ON) {
> > +        if (!has_steal_time) {
> > +            error_setg(errp, "'kvm-steal-time' cannot be enabled "
> > +                             "on this host");
> > +            return;
> > +        } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > +            error_setg(errp, "'kvm-steal-time' cannot be enabled "
> > +                             "for AArch32 guests");
> 
> Why not? Unlike aarch32-host KVM, aarch32-guest KVM is
> still supported. What's the missing piece for kvm-steal-time
> to work in that setup?

The specification. DEN0057A chapter 2 says "This specification only covers
systems in which the Execution state of the hypervisor as well as EL1 of
virtual machines is AArch64.". And, to ensure that the smc/hvc calls are
only specified as smc64/hvc64. I find that a bit disappointing, since
there's nothing about steal-time that should be 64-bit specific, but
that's how this cookie is crumbling...

I'll add a comment to explain this error for v2.

> 
> > +            return;
> > +        }
> > +    }
> > +}
> > +
> >  bool kvm_arm_aarch32_supported(void)
> >  {
> >      return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
> 
> >  static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
> > +static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp) {}
> 
> Does this stub need to report an error to the caller via errp,
> or is it a "never called but needs to exist to avoid linker errors" ?

The second one, as we can't have kvm_enabled() and !defined(CONFIG_KVM).
Hmm, these types of stubs would be more robust to refactoring if we put
build bugs in them. I can try to analyze all the stubs in this #else to
see which ones should be returning false/error/nothing vs. build bugging.

Thanks,
drew

