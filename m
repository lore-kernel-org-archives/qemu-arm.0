Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp518492ejq;
        Thu, 18 May 2023 07:16:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5S6rxEigKcde/mPsdnbU5+z3pT5FG3+jSmbvs72bECYJHQPnrBqCAuaQoRHa3HdKr5aesJ
X-Received: by 2002:ad4:5dec:0:b0:623:6d96:c8ca with SMTP id jn12-20020ad45dec000000b006236d96c8camr4719412qvb.33.1684419403820;
        Thu, 18 May 2023 07:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684419403; cv=none;
        d=google.com; s=arc-20160816;
        b=TlVWIcMoengZW8dpsJI9dZT9MSZTMnD6iHWiyDU2RQRcWM6ODabuV0i3rXPrGwu49T
         al/xGP6YB1n9vjqfppWnWWxywHv9ROE2oxUq2VMLWreg71VmIRzCI/mbxctRJG4JzDc0
         0+Q5g6fcsqGDUdybmDhOtVwOIDyqOacTsxXMLAsOXYkL5LYFNA7AMNWPEpl4soU363Bv
         m8/OzXNl3U6GLZZtofOPmRdW1m5FmlMZ7+dVrEqIxzfyqD71HB2kzGgu5Yrg4C/BN53U
         mcBlln/qD1BYAjkTBhu8Iifo89TJNFCcs6E86iGxiQv+TuNK+37MDpsmPiE2mzqGMWjy
         nzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=LrPS4Jcq2k7c1X7Z4RkhbBE75ptSnxYSyIL+Gdeh1QQ=;
        b=Qm6UBycohikLzWJvP0P+VzNOdwiK7eLuEtAhHFONclaCNgNSn39YT5IELQuKVwopNY
         CCmHNzOnopq/TwJNktg9uBwjHaOVY+Bwn2TmuH/uYXXGYu0XZnX0Zt6tzst8FmTeAofn
         66DhO0D9KRziD6get1SyskR3hTmZ6tmgT+XP+u+uujjLpwrt55Lb3exSIlsejcJLPI6t
         SHLMCl4NiTu9c/svK1fk1Jiqf8t5pvNfDdf8qOQ4lgTixJQ/Nlutr4LIvPe1wusYmqEH
         HtFiVzOfcn+Op/aSOih/nDmLcHcE8qJRW23U5rPcI/0MZmvne+3+C7BnH8LYiKpFrO8P
         Vz7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MEgMSMMF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu2-20020a056214234200b005e8d8daefb0si1157694qvb.537.2023.05.18.07.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 May 2023 07:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MEgMSMMF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzeQo-0000fV-NI; Thu, 18 May 2023 10:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pzeQm-0000do-KW
 for qemu-arm@nongnu.org; Thu, 18 May 2023 10:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pzeQh-0006Lr-2B
 for qemu-arm@nongnu.org; Thu, 18 May 2023 10:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684419389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LrPS4Jcq2k7c1X7Z4RkhbBE75ptSnxYSyIL+Gdeh1QQ=;
 b=MEgMSMMFs+yFi7lHi7qfXEBhcKA5VIlnfFhoy+D1FwUUfM0OHUFfiYBDYO2P6aGbFghq1k
 Je180rH8KhD/SmuoQ1Wl5eCX2pugMYVI7vgDuOgB+98O9hi7y/a16cBG77x9xlPTb+FsCw
 pxXiL2JxWVaDCDfmOI21xUj/EGLZ140=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-MLJeQ8BfNTucRSMfzNJEYg-1; Thu, 18 May 2023 10:16:28 -0400
X-MC-Unique: MLJeQ8BfNTucRSMfzNJEYg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-61a3c7657aeso1973776d6.0
 for <qemu-arm@nongnu.org>; Thu, 18 May 2023 07:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684419388; x=1687011388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LrPS4Jcq2k7c1X7Z4RkhbBE75ptSnxYSyIL+Gdeh1QQ=;
 b=gJsMyhNmf6Y+F1V/FjMhBHi0Qo1k5pO3w/ZlAqZ/cUYpAXzJY/p1WEJ/y2FD6iF9FU
 prPX9U2gC+GU0SB944sfgVW+msmmhsV6TAqHJ5ge59IgTB01ML+Bfebyb2XT24rS2PAl
 x70qsuLkmmuctCOVwWH3/xJ2yrGW0uXVx9yXTa60T9kSQwsJUE9q3OiHxu5ogXIj0l6I
 7+B5Fz1m8EDcfQvEB87wavo6CStKeT1hdKgtz4pdb9fwpQG6iDIb80GsnCQk5ExIFrTT
 VCoSFPfX29NSZFno/NA6S+aS5irDoqn3piD/NFnMS1sp883oC3xMxubT6TL/orv14b5x
 xJCA==
X-Gm-Message-State: AC+VfDyO7lEXl5fiy0d4g1sXwDy8TCjp8fvvkZ7Hhg/jZ6OiGfgXP0Nf
 UeYI2WxCy1LlYQENZhvvjEhysu1hQ0o0lylkKRXmzNZRR4VX9NsSXNgXsgUOHJPufs/GSYO4Xog
 PyB201EiI78Fv
X-Received: by 2002:a05:6214:2126:b0:5ed:c96e:ca4a with SMTP id
 r6-20020a056214212600b005edc96eca4amr11483504qvc.1.1684419388089; 
 Thu, 18 May 2023 07:16:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2126:b0:5ed:c96e:ca4a with SMTP id
 r6-20020a056214212600b005edc96eca4amr11483469qvc.1.1684419387764; 
 Thu, 18 May 2023 07:16:27 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-62-70-24-86-62.dsl.bell.ca.
 [70.24.86.62]) by smtp.gmail.com with ESMTPSA id
 r15-20020a0cf60f000000b006166b169573sm542330qvm.66.2023.05.18.07.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 07:16:25 -0700 (PDT)
Date: Thu, 18 May 2023 10:16:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jgg@nvidia.com,
 yi.l.liu@intel.com, kevin.tian@intel.com
Subject: Re: Multiple vIOMMU instance support in QEMU?
Message-ID: <ZGYzOEhdTA6sWKjP@x1n>
References: <ZEcT/7erkhHDaNvD@Asurada-Nvidia> <ZGWaCKQqK5hVqbvM@Asurada-Nvidia>
 <0defbf3f-a8be-7f1b-3683-e3e3ece295fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0defbf3f-a8be-7f1b-3683-e3e3ece295fc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uhGq4XbQF0gr

On Thu, May 18, 2023 at 11:06:50AM +0200, Eric Auger wrote:
> Hi Nicolin,
> 
> On 5/18/23 05:22, Nicolin Chen wrote:
> > Hi Peter,
> >
> > Eric previously mentioned that you might not like the idea.
> > Before we start this big effort, would it possible for you
> > to comment a word or two on this topic?
> >
> > Thanks!
> >
> > On Mon, Apr 24, 2023 at 04:42:57PM -0700, Nicolin Chen wrote:
> >> Hi all,
> >>
> >> (Please feel free to include related folks into this thread.)
> >>
> >> In light of an ongoing nested-IOMMU support effort via IOMMUFD, we
> >> would likely have a need of a multi-vIOMMU support in QEMU, or more
> >> specificly a multi-vSMMU support for an underlying HW that has multi
> >> physical SMMUs. This would be used in the following use cases.
> >>  1) Multiple physical SMMUs with different feature bits so that one
> >>     vSMMU enabling a nesting configuration cannot reflect properly.
> >>  2) NVIDIA Grace CPU has a VCMDQ HW extension for SMMU CMDQ. Every
> >>     VCMDQ HW has an MMIO region (CONS and PROD indexes) that should
> >>     be exposed to a VM, so that a hypervisor can avoid trappings by
> >>     using this HW accelerator for performance. However, one single
> >>     vSMMU cannot mmap multiple MMIO regions from multiple pSMMUs.
> >>  3) With the latest iommufd design, a single vIOMMU model shares the
> >>     same stage-2 HW pagetable across all physical SMMUs with a shared
> >>     VMID. Then a stage-1 pagetable invalidation (for one device) at
> >>     the vSMMU would have to be broadcasted to all the SMMU instances,
> >>     which would hurt the overall performance.
> Well if there is a real production use case behind the requirement of
> having mutliple vSMMUs (and more generally vIOMMUs) sure you can go
> ahead. I just wanted to warn you that as far as I know multiple vIOMMUS
> are not supported even on Intel iommu and virtio-iommu. Let's add Peter
> Xu in CC. I foresee added complexicity with regard to how you define the
> RID scope of each vIOMMU, ACPI table generation, impact on arm-virt
> machine options, how you pass the feature associated to each instance,
> notifier propagation impact? And I don't evoke the VCMDQ feat addition.
> We are still far from having a singleton QEMU nested stage SMMU
> implementation at the moment but I understand you may want to feed the
> pipeline to pave the way for enhanced use cases.

I agree with Eric that we're still lacking quite a few things for >1
vIOMMUs support, afaik.

What you mentioned above makes sense to me from the POV that 1 vIOMMU may
not suffice, but that's at least totally new area to me because I never
used >1 IOMMUs even bare metal (excluding the case where I'm aware that
e.g. a GPU could have its own IOMMU-like dma translator).

What's the system layout of your multi-vIOMMU world?  Is there still a
centric vIOMMU, or multi-vIOMMUs can run fully in parallel, so that e.g. we
can have DEV1,DEV2 under vIOMMU1 and DEV3,DEV4 under vIOMMU2?  Can vIOMMU
get involved in any plug/unplug dynamically in any form?  What else can be
different from that regard?

Is it a common hardware layout or nVidia specific?

Thanks,

> 
> Thanks
> 
> Eric
> >>
> >> I previously discussed with Eric this topic in a private email. Eric
> >> felt the difficulty of implementing this in the current QEMU system,
> >> as it would touch different subsystems like IORT and platform device,
> >> since the passthrough devices would be attached to different vIOMMUs.
> >>
> >> Yet, given the situations above, it's likely the best by duplicating
> >> the vIOMMU instance corresponding to the number of the physical SMMU
> >> instances.
> >>
> >> So, I am sending this email to collect opinions on this and see what
> >> would be a potential TODO list if we decide to go on this path.

-- 
Peter Xu

