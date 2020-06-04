Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1448063lfc;
        Thu, 4 Jun 2020 06:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO9Cpq/Czoev5CAwj+aTnsJNJYt5abKs3uN9IG2z/HXFW+7JTQv8cMyjlmFcY34qAvfDTA
X-Received: by 2002:a5b:4c2:: with SMTP id u2mr8471157ybp.100.1591276816372;
        Thu, 04 Jun 2020 06:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591276816; cv=none;
        d=google.com; s=arc-20160816;
        b=ynr5R71hO909ftJIPfO+b0vd8jWr7VXOwjy8uQh49UvJvpdm39GaMDFampCa4pY8Tv
         J13cxV0MVtfN8BWaphsOI/iKOd8oVhtOSRZ3ws5l3RY8kyS3TyC5Uair+GRkvzC+Rhh9
         +bHLgiYHLiLaC8a3IF5Pj1oVEjGpilVGdZ5uuLI2rQnn3oBWRfqh8jtmAxQTOpCPR1SD
         Xdxgo/GwnU7NSXslppx7Wz1zaje1nfVozgeFGXyfvbNV+l6O/gEREu/yEWGudte06kNZ
         XnoV1FaDZXglnQrMAZTUR/3FIUPPwh4v3cLv2GwNfkOsnp3lTN1BqSuEDM5i+7KbTY1B
         MAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5OO84Zk9/39gLXAr4u/jE+x4haOtgHqFI0yJva+EN5U=;
        b=C6QsARkQ24eIcLHPKQYGQNvEIUeGx2Oy9/R2jyvUATRH9djtBELO1uByKFMWgbL6RA
         5+gJkqpVG8gGGMOXRhDJpgllzaSA23dzLOAEmX084WS12Af2hTij1dXlRQ9in1+IYEBY
         GGQOLyZV7mxFM88nKJXPcdIdJHE/57Ywwxx2n3Sc41yfnz6GHCNJysDnzn4E9O4RHlXk
         6mbUrumbApmkyXO6fk2e+mLYTrFXAzCY2SfJW4RYuOqn/SwGX+MMLRg2UNlSeOs9ynYA
         asphrV3y/xvKZDbHEWbZvihpg96zEbLS6OgysdcgEMTNjy8OUcYUd90qmwp/a2jzN7LZ
         JYkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P3Or8R9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n199si4350324ybg.6.2020.06.04.06.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 06:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P3Or8R9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgpn5-00066w-Ox
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 09:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgpl6-0002E3-DN
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 09:18:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgpl5-0002G9-EP
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 09:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591276690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5OO84Zk9/39gLXAr4u/jE+x4haOtgHqFI0yJva+EN5U=;
 b=P3Or8R9Rp0OzLDcq+ds9pCj7BDELFPBMTg6f7ojKausCGrJuqcP4PIdiqV1iYXD6IwmlAE
 CKqQz6AMv3KskX3Z5rtKoaGK7H3+WiBLkM/ukzogMqOtMyJ373xnLLdmL8Sru+tpmTerO8
 HiQvE4BflUwhlQsnN+0u2cTItwFaojQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-5_3XzSYxO7Si3ilUbxh6sg-1; Thu, 04 Jun 2020 09:18:08 -0400
X-MC-Unique: 5_3XzSYxO7Si3ilUbxh6sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5B83107ACF7;
 Thu,  4 Jun 2020 13:18:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 509FA60BF4;
 Thu,  4 Jun 2020 13:18:05 +0000 (UTC)
Date: Thu, 4 Jun 2020 15:18:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Leif Lindholm <leif@nuviainc.com>
Subject: Re: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
Message-ID: <20200604131802.7w4hncgq2gopbw6z@kamzik.brq.redhat.com>
References: <20200604125544.GW28566@vanye>
MIME-Version: 1.0
In-Reply-To: <20200604125544.GW28566@vanye>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:12:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DKyjHmqSR0oR

On Thu, Jun 04, 2020 at 01:55:44PM +0100, Leif Lindholm wrote:
> Hi there,
> 
> (all this done on current HEAD: 66234fee9c)
> 
> I was looking through the definition of the aarch64 "max" cpu, and
> noticed it invokes aarch64_a57_initfn as a template, followed by
> overriding some feature and ID fields to enable additional
> functionality.
> 
> I then noticed it does not override kvm_target, which hence remains
> set as QEMU_KVM_ARM_TARGET_CORTEX_A57. Of course, this only happens on
> the else side of the if (kvm_enabled()) branch, so doesn't affect it.
> 
> However, while looking at this, I noticed aarch64_a72_initfn doesn't
> initialise kvm_target at all.
> 
> Then I looked at the definition of QEMU_KVM_ARM_TARGET_CORTEX_A57,
> found there was also a KVM_ARM_TARGET_CORTEX_A57, and then I noticed
> there exists a KVM_ARM_TARGET_CORTEX_A57 (in
> linux-headers/asm-arm64/kvm.h), and *then* I noticed there exists a
> KVM_ARM_TARGET_GENERIC_V8 definition there as well - plus a comment
> saying "please don't add any more targets unless you really need to".
> Then I noticed there isn't a corresponding
> QEMU_KVM_ARM_TARGET_GENERIC_V8 in target/arm/kvm-consts.h.
> 
> So, then I decided to actually test things, and found that
> (with -enable-kvm):
> - on Cortex-A53 hardware
>   - "max" kvm_target gets initialized to 4 (KVM_ARM_TARGET_CORTEX_A53)
>     by kvm_arm_get_host_cpu_features (as returned from the kernel for
>     vm_arm_create_scratch_host_vcpu)
>   - cortex-A72 fails to start with "KVM is not supported for this guest
>     CPU type"
>   (fair enough, it's later than A53)
> - on Cortex-A72 hardware
>   - "max" kvm_target gets initialized to 5 (KVM_ARM_TARGET_GENERIC_V8)
>     by kvm_arm_get_host_cpu_features
>   - "cortex-A72" fails to start (umm...)
> 
> However ... if I haven't managed to confuse myself somewhere in here
> (which is completely possible), would it be OK if I submitted a set of
> patches that:
> - add a QEMU_KVM_ARM_TARGET_GENERIC_V8 to match the kernel one
> - set kvm_target for Cortex-A72 to QEMU_KVM_ARM_TARGET_GENERIC_V8

I'd rather not do that. AArch64 KVM doesn't support CPU models, so we
shouldn't try to fake it by allowing '-cpu cortex-a72' to work, even when
using it on a host with Cortex-A72 CPUs. I'd rather all AArch64 KVM users
use 'host' or 'max' (which is the same as 'host' when used with KVM) until
CPU models truly work.

>   - alternatively drop the explicit settings for A57/A53

The A57 and A53 KVM targets would have to be exactly the same as the
KVM generic target in order to do that. And, even then we can't remove
them from KVM, as they're API, so it doesn't help much to change them
in QEMU.

> - drop the call from aarch64_max_initfn to aarch64_a57_initfn, and
>   copy the relevant bits into the former for the !kvm case

I don't have a strong preference here, but if the naming is what's
troublesome, then I'd think we're better off creating something like
an aarch64_aXX_initfn() function and then calling it from both a57
and max, and anywhere else it fits.

Thanks,
drew

