Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5285868njd;
        Sat, 26 Apr 2025 23:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWc4p6ViM0/+fmhILNwPuyGZNAXIe0cy6wlEYMDIIZRgerMaRlwwB2wynbqYHAfB9YEmqIEoCW+lopUuw==@linaro.org
X-Google-Smtp-Source: AGHT+IFEfjlKVpUcf4ECRxSDKp4VaJ2R7DL8Z8qGAEwrdHkXTxl8+l45CgDYi7qsqesXBTtP/h7c
X-Received: by 2002:a05:622a:653:b0:477:db8:e15b with SMTP id d75a77b69052e-4813122783bmr59912031cf.9.1745735338930;
        Sat, 26 Apr 2025 23:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745735338; cv=none;
        d=google.com; s=arc-20240605;
        b=hG6uc7UedGc9M4qv9SFRYrguhLp64KWTXMDVDQt1WuZm242luOA9inRh5N7IL5I1da
         Gw3DcW9B467n9750ojcvuWIVTGcK08yYIvB25rH4bYa91VLXGnyZOydw/ePpxH2Pm/uc
         FkQXV186uWsQeWPa6cvnVVDPr6EyIWFBTo8T0zhr6Ud8YEOHwXeI8FhYJrcoT8c10Hzu
         RBXLIi+ngsy7L94tNm69cYueyymId7XRugXVofJpbw6/Ww1WgRHxC9z5KqRwryseDruq
         +GTWgS1aaMtP3dWiLn/GpdZ9mm1Q++KS4OAU3t+vfQRheZibAi79LtyWFb7ZzmDGVVdD
         /54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cvkEnBRv55jA0661P2gC/fwLAO8YNfiGX+jgyCQW+fo=;
        fh=5YDLLJgO7dHw3UrwgK3PqKzoqhNi0WRWyfs5b9Zwmpw=;
        b=VCIjQGt7z4k94PxC/zNd0CkQEgaUONbJt0x5S+zZ/PmIXl/gA8xBunLmZItoDfYUH+
         Y1Hoa8pLkSFThhtMGUG5BXS+NA6w5AjXUH5di0953BoQsfvZbnsyA3aoVTgqw2y1KMu5
         Zm2n7O0o00YHWssmh5t0sIBF/ixclFXnjoK5YelxDQlw7x/TO6HMLr0XXjWmk8NUcaO1
         zN9hMctZUe6ShyNG+JZIssYiWV8IGWiVJJ+9nUktmKC4mILRqmHnSfjS9nPosC/Er0jW
         ENPai1TUrQsa78KkpUTrQ1wSDj7H6S/gR0GYD23aEjekxU/6KEBZyB74kRjJOOFASiY5
         aGaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AFav72zj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9fa9717esi80829591cf.155.2025.04.26.23.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Apr 2025 23:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AFav72zj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8vVP-0000K2-58; Sun, 27 Apr 2025 02:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8vVN-0000H7-HV; Sun, 27 Apr 2025 02:28:45 -0400
Received: from mgamail.intel.com ([192.198.163.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1u8vVK-0000IL-Mt; Sun, 27 Apr 2025 02:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745735323; x=1777271323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mnGbRICatNcyoPrI5GrAe65yEryXZhpnLlqHMQGHYqQ=;
 b=AFav72zjWXBQeavK2IzbgMOK26l5x0acTwx3Gw4CmxGE/RQUkT4UzKpo
 ZdgF8rn+eMi+cORYSTEAPvBq7YbpZ1a86uNuvIx60xx5MC5U4Vo8usOxD
 RB4G9YbNUZ1OYERnEjVKK04T4DzcfFwXyV3ktXhwVwZRkSBsvt4dS1jG9
 vURx9KwgjDTUAGZuH31H4KuyxE6EaX2ZKIGkK0NOe74EqKaFAqV3Uva4M
 /yXfkFGPoWeDLAMTufXpFJhPfAXlfnxuU2lkPYrvrptQm04/RDvTAEXO/
 73dgwOkDxiRLFPh+R2d9VAb1Y3MhFT7Z39uW1WErkWeQSgz4X6MLs+UNr w==;
X-CSE-ConnectionGUID: DhJQYWq4QF67gBhfqf9ImA==
X-CSE-MsgGUID: SgAfAPPSRtarCkRnruvcYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="49995862"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; d="scan'208";a="49995862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 23:28:37 -0700
X-CSE-ConnectionGUID: iO0zR2YdQPuksNBrc7RPBg==
X-CSE-MsgGUID: H4em+WpuSHWky0kg4kKVEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; d="scan'208";a="133216649"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2025 23:28:32 -0700
Date: Sun, 27 Apr 2025 14:49:29 +0800
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
Subject: Re: [PATCH 3/5] i386/kvm: Support event with select & umask format
 in KVM PMU filter
Message-ID: <aA3TeaYG9mNMdEiW@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-4-zhao1.liu@intel.com>
 <87frhwfuv1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frhwfuv1.fsf@pond.sub.org>
Received-SPF: pass client-ip=192.198.163.13; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.738,
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
X-TUID: m5MqCYNX+n/t

Hi Markus,

> > +        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK: {
> > +            if (event->u.x86_select_umask.select > UINT12_MAX) {
> > +                error_setg(errp,
> > +                           "Parameter 'select' out of range (%d).",
> > +                           UINT12_MAX);
> > +                goto fail;
> > +            }
> > +
> > +            /* No need to check the range of umask since it's uint8_t. */
> > +            break;
> > +        }
> 
> As we'll see below, the new x86-specific format is defined in the QAPI
> schema regardless of target.
> 
> It is accepted here also regardless of target.  Doesn't matter much
> right now, as the object is effectively useless for targets other than
> x86, but I understand that will change.
> 
> Should we reject it unless the target is x86?

I previously supposed that different architectures should implement
their own kvm_arch_check_pmu_filter(), which is the `check` hook of
object_class_property_add_link():

    object_class_property_add_link(oc, "pmu-filter",
                                   TYPE_KVM_PMU_FILTER,
                                   offsetof(KVMState, pmu_filter),
                                   kvm_arch_check_pmu_filter,
                                   OBJ_PROP_LINK_STRONG);

For x86, I implemented kvm_arch_check_pmu_filter() in target/i386/kvm/
kvm.c and checked the supported formats (I also supposed arch-specific
PMU filter could reject the unsupported format in
kvm_arch_check_pmu_filter().)

But I think your idea is better, i.e., rejecting unsupported format
early in pmu-filter parsing.

Well, IIUC, there is no way to specify in QAPI that certain enumerations
are generic and certain enumerations are arch-specific, so rejecting
unsupported format can only happen in parsing code. For example, wrap
the above code in "#if defined(TARGET_I386)":

    for (node = head; node; node = node->next) {
        KvmPmuFilterEvent *event = node->value;

        switch (event->format) {
        case KVM_PMU_EVENT_FORMAT_RAW:
            break;
#if defined(TARGET_I386)
        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK: {
            ...
            break;
        }
        case KVM_PMU_EVENT_FORMAT_X86_MASKED_ENTRY: {
            ...
	    break;
        }
#endif
        default:
	    error_setg(errp,
                       "Unsupported format.");
            goto fail;
        }

        ...
    }

EMM, do you like this idea?

> If not, I feel the behavior should be noted in the commit message.

With the above change, I think it's possible to reject x86-specific
format on non-x86 arch. And I can also note this behavior in commit
message.

> >          default:
> >              g_assert_not_reached();
> >          }
> > @@ -67,6 +82,9 @@ static void kvm_pmu_filter_set_event(Object *obj, Visitor *v, const char *name,
> >      filter->events = head;
> >      qapi_free_KvmPmuFilterEventList(old_head);
> >      return;
> > +
> > +fail:
> > +    qapi_free_KvmPmuFilterEventList(head);
> >  }
> >  
> >  static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)

...

> >  ##
> >  # @KvmPmuFilterEvent:
> >  #
> > @@ -66,7 +82,8 @@
> >  { 'union': 'KvmPmuFilterEvent',
> >    'base': { 'format': 'KvmPmuEventFormat' },
> >    'discriminator': 'format',
> > -  'data': { 'raw': 'KvmPmuRawEvent' } }
> > +  'data': { 'raw': 'KvmPmuRawEvent',
> > +            'x86-select-umask': 'KvmPmuX86SelectUmaskEvent' } }
> >  
> >  ##
> >  # @KvmPmuFilterProperties:
> 
> Documentation could perhaps be more explicit about this making sense
> only for x86.

What about the following doc?

##
# @KvmPmuFilterProperties:
#
# Properties of KVM PMU Filter (only for x86).

> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 51a7c61ce0b0..5dcce067d8dd 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -6180,6 +6180,9 @@ SRST
> >               ((select) & 0xff) | \
> >               ((umask) & 0xff) << 8)
> >  
> > +        ``{"format":"x86-select-umask","select":event_select,"umask":event_umask}``
> > +            Specify the single x86 PMU event with select and umask fields.
> > +
> >          An example KVM PMU filter object would look like:
> >  
> >          .. parsed-literal::
> > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > index fa3a696654cb..0d36ccf250ed 100644
> > --- a/target/i386/kvm/kvm.c
> > +++ b/target/i386/kvm/kvm.c
> > @@ -5974,6 +5974,10 @@ static bool kvm_config_pmu_event(KVMPMUFilter *filter,
> >          case KVM_PMU_EVENT_FORMAT_RAW:
> >              code = event->u.raw.code;
> >              break;
> > +        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK:
> > +            code = X86_PMU_RAW_EVENT(event->u.x86_select_umask.select,
> > +                                     event->u.x86_select_umask.umask);
> > +            break;
> >          default:
> >              g_assert_not_reached();
> >          }
> > @@ -6644,6 +6648,7 @@ static void kvm_arch_check_pmu_filter(const Object *obj, const char *name,
> >  
> >          switch (event->format) {
> >          case KVM_PMU_EVENT_FORMAT_RAW:
> > +        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK:

Here's the current format check I mentioned above. But I agree your idea
and will check in the parsing of pmu-filter object.

> >              break;
> >          default:
> >              error_setg(errp,
> 
