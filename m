Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5981892njd;
        Mon, 28 Apr 2025 06:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJbY34FwmzwogMSBFYr6AtjTanZc7NjOn/a7h6jpeVCxawrmMqoMU2HP3Bakuv+d0TPJ7rCdqmYdJJiw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsQmcm1zWq2aWn0lXiopXK0pSYJ1MmZknOt5CscfTPaKirHR60lBvj45BRbA6pxi1PQbEF
X-Received: by 2002:a05:620a:2585:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c966862ad7mr1330208985a.11.1745848309467;
        Mon, 28 Apr 2025 06:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745848309; cv=none;
        d=google.com; s=arc-20240605;
        b=gyDGvvD8kQZOej03SZWD8d1N4hrYmMOyIF532TfX6Fr0wTJETwCC4YKuKT7QGToZgU
         eqza0/PK2VZzi5u14JgBa3iDAvT14VluLSw2mSuHM+Z3BoRN3S+Ck44BGh3EBtYOD8IB
         0E+wd8OL/qmOmuNQeM3nZM36apMTUSXBr/zR4m+UxNGuvy7ZP4ipMAy1T09nJjNdx8FH
         3RUq/ttqk9q2Ozm0HLS3h6fetWUyLzBSf3qePCkoxR48I8onKUUxPTWneH9xtFi5SXGW
         pyttykPqtHPzdg40R1euw8mVdrM6PTpatixm1dM/esYb8lME4Ky2dYoHKkvYOWZpxOFI
         HTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=C8OA38AMOHIz8dK9oSIp/h5SBhlTfEGzzd3YljHnV8Y=;
        fh=5YDLLJgO7dHw3UrwgK3PqKzoqhNi0WRWyfs5b9Zwmpw=;
        b=UcDMrUmPrAQnKVwRBfu8+64i3EyJi+JEv3JD4bnZgwcczAX3UnYLTuJ0ukjR8BfYwE
         RFcVeWEU2DTzMl2hirC9sgR5HTBzHyn60BmpLZCpQYH/0Bzsxid7vyGWlXN29vKjfcYx
         PFt72xDLp65E0+I/cpe3pbxm1vnV+ZSYOWFCeXs++45irhjga9PUDjVDoWkIMtoB7FAi
         46dbeNqxivz3li7xQcymVFSxCq1yeTicCZ7KImQty5BF49N7pUMP2CFgoYQlPpj59G1P
         S8M8ByqQiil6885lqu5x5F9joPsZctBWFafd2h0aIjFnFrxnSFNT8Eur8WZmokoJ4SPo
         hbQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=afBJGxln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea0c3fsi987916685a.374.2025.04.28.06.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 06:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=afBJGxln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9OtU-0007uD-PG; Mon, 28 Apr 2025 09:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u9OtG-0007tE-W1; Mon, 28 Apr 2025 09:51:27 -0400
Received: from mgamail.intel.com ([192.198.163.9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u9OtD-0003Bk-VE; Mon, 28 Apr 2025 09:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745848280; x=1777384280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VsHmrNXKviIE8IQ9R1HhlyLdam+mB76jNTS9v/imXWs=;
 b=afBJGxlnOygstodwxP54aaFlIZ3eTk0lr/YevradvLsAnXAYODv1IFua
 zjXAVv0GZEk2Hg9elHoi1nv9mvBDr8Orh7BRnYm1qOvoIA6zBY7RA8HB3
 U19BC7HAbYaMyQNAu94NNY5nr5OHjaniDFmWg2VLzVZVvtaRmwymtWuLS
 CjEWZN6orvJ1XqIhjOltEUf0IJqYn4ZpTfXYVldVhFLmrs7o7Zpnb9Eiv
 zAmtCOBJvNeGWRYWuw3HVu5PIYR7P2CrdsKjr7BRPeTIqHcN8llBQx1cU
 ym7WzcTGgsZc+l8aaU13xW6vVGkBtVYDU+6pitS4hvUyGFC3RYQN3PcCW A==;
X-CSE-ConnectionGUID: ++y8CVQiTomQGISsRyufGw==
X-CSE-MsgGUID: hOnViCjORTiYDAyCkld9mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58085736"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58085736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 06:51:14 -0700
X-CSE-ConnectionGUID: 9rsWKEuKTXSkzsns7eGPDg==
X-CSE-MsgGUID: mHZMTY5nS4exFTHFKWI5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="164487636"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 06:51:09 -0700
Date: Mon, 28 Apr 2025 22:12:06 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
Subject: Re: [PATCH 2/5] i386/kvm: Support basic KVM PMU filter
Message-ID: <aA+MttdYlZKPAwqT@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-3-zhao1.liu@intel.com>
 <878qnoha3j.fsf@pond.sub.org> <aA3sLRzZj2270cSs@intel.com>
 <87r01c3jd2.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r01c3jd2.fsf@pond.sub.org>
Received-SPF: pass client-ip=192.198.163.9; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.484,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kN/Sfla7uqsg

On Mon, Apr 28, 2025 at 08:12:09AM +0200, Markus Armbruster wrote:
> Date: Mon, 28 Apr 2025 08:12:09 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 2/5] i386/kvm: Support basic KVM PMU filter
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > ...
> >
> >> > diff --git a/qemu-options.hx b/qemu-options.hx
> >> > index dc694a99a30a..51a7c61ce0b0 100644
> >> > --- a/qemu-options.hx
> >> > +++ b/qemu-options.hx
> >> > @@ -232,7 +232,8 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
> >> >      "                eager-split-size=n (KVM Eager Page Split chunk size, default 0, disabled. ARM only)\n"
> >> >      "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
> >> >      "                thread=single|multi (enable multi-threaded TCG)\n"
> >> > -    "                device=path (KVM device path, default /dev/kvm)\n", QEMU_ARCH_ALL)
> >> > +    "                device=path (KVM device path, default /dev/kvm)\n"
> >> > +    "                pmu-filter=id (configure KVM PMU filter)\n", QEMU_ARCH_ALL)
> >> 
> >> As we'll see below, this property is actually available only for i386.
> >> Other target-specific properties document this like "x86 only".  Please
> >> do that for this one, too.
> >
> > Thanks! I'll change QEMU_ARCH_ALL to QEMU_ARCH_I386.
> 
> That would be wrong :)
> 
> QEMU_ARCH_ALL is the last argument passed to macro DEF().  It applies to
> the entire option, in this case -accel.

Thank you for correction! I didn't realize this point :-(.

> I'd like you to mark the option parameter as "(x86 only)", like
> notify-vmexit right above, and several more elsewhere.

Sure, I see. This option has already provided good example for me.

> >> As far as I can tell, the kvm-pmu-filter object needs to be activated
> >> with -accel pmu-filter=... to do anything.  Correct?
> >
> > Yes,
> >
> >> You can create any number of kvm-pmu-filter objects, but only one of
> >> them can be active.  Correct?
> >
> > Yes! I'll try to report error when user repeats to set this object, or
> > mention this rule in doc.
> 
> Creating kvm-pmu-filter objects without using them should be harmless,
> shouldn't it?  I think users can already create other kinds of unused
> objects.

I think I understand now. Indeed, creating an object should be allowed
regardless of whether it's used, as this helps decouple "-object" from
other options.

I can add something that:

the kvm-pmu-filter object needs to be activated with "-accel pmu-filter=id",
and only when it is activated, its filter policy can be passed to KVM.

(A single sentence is just an example; I think it needs to be carefully
refined within the context of the entire paragraph :-).)

> >> > +
> >> > +static int kvm_install_pmu_event_filter(KVMState *s)
> >> > +{
> >> > +    struct kvm_pmu_event_filter *kvm_filter;
> >> > +    KVMPMUFilter *filter = s->pmu_filter;
> >> > +    int ret;
> >> > +
> >> > +    kvm_filter = g_malloc0(sizeof(struct kvm_pmu_event_filter) +
> >> > +                           filter->nevents * sizeof(uint64_t));
> >> 
> >> Should we use sizeof(filter->events[0])?
> >
> > No, here I'm trying to constructing the memory accepted in kvm interface
> > (with the specific layout), which is not the same as the KVMPMUFilter
> > object.
> 
> You're right.  What about sizeof(kvm_filter->events[0])?

I get your point now! Yes, I should do in this way.

Thanks,
Zhao

