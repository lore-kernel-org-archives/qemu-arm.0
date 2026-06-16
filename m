Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6DBCD98CF
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 09:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZPpb-0004Wy-CZ; Tue, 16 Jun 2026 05:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPpN-0004UR-Sq
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:11:29 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPpK-00057X-K7
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:11:25 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-662bf1dab83so267572d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 02:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781601081; cv=none;
 d=google.com; s=arc-20240605;
 b=IXkL3oGTs9HTdNHQT76bf7oiFEONybH3r/jmZfSZv61C7H9HO6IPQzEnmyBmSDsQk5
 w/IZvIOTCMRy/iyfQsEMa8G2KJB0F0lvixd1Sv84OBQhX9xV+Ek6r+di0srJtFGoVjSq
 pd8FUFXG3qqCTH01pl6eUIL1dez8N+haAatxxrE84uSx/saBzOXXWQR9uZjpwnbXCpTT
 C+Zrkh66II0w//IOhA8lKfQh+5UW8eulYUZIiR/RW/cSWHY7W0Ei9RAEks/wA38G2N8L
 TSCw9S6nnpnCnH67RFc24FCZIcNgqxhnr2mgaELsznF1WHVcEbFd+FwmQPULlKAVQ11Q
 naZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L0adLwwRq+XgATs97Jp6ZsqjH+7IFjtVVPKtKt1IDmM=;
 fh=rLw8cA9Z5nSFVuzbXN00Bc3QBS/tFPuiRMuCzRc1Cgg=;
 b=HL0Zc3h1U9DfcaIOOY9E09aRQpe8OPWSwVtEYWZeLhkD+R5/3fl6qfWXvHMyCDZyEM
 Gd2iOT+BqGtbqzDJ40EYuUAYionKFwkpvY3u6fvpz2Wcqm26qQmWqjRpSBFRW2FCtwHy
 wZdNtuWcL9EXEueY6ee3UG879/GcSdFlUrjTWa1Hm8FV7bPCMrPBelgo6Dba4n25nwit
 ygggTYHSpdJWTR9tqYJLB9ZIY4MRSQV2EeSW+wnpupRbbtQ5UrqIJ8/JStsxsRYVPUov
 btHXPlwsaK6uXOb4zXBJWSgHVPYJv9ZnNC/i81gBvm5wwLJRVxekR2W9XHWcbePMQD3Z
 fmRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781601081; x=1782205881; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L0adLwwRq+XgATs97Jp6ZsqjH+7IFjtVVPKtKt1IDmM=;
 b=MDjsG7Ju1DYfQMteU1qKVoMkQ3F1MpQKOyJC9pQ5VRO05fXt7YsFd/ReInsooxiX9d
 +1/Fed0oMLxRvTsRAcxrHdfvyjSLXgOUmY+216VISCYIqmV9oBafVS0glR9mW2HxDRsh
 umysa3x+7WaDGfU0C10YjK47+G5+LCOgv2UJM6er6cm3t8Ky5YOcOosljrUDQMGIXkKK
 XI+wyoDRs5d9w6H7lTTBbMq/oXkbvThZHdvIjLr4sH6dcBM5q8548pe7qhFmo6R0nA39
 H1RASKEQMs6lYBW5L1E4aHBCo6++QSQMGVHy+90eW3S7NPEjJwi/bZAEj/KCsr2RlwuN
 VbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781601081; x=1782205881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0adLwwRq+XgATs97Jp6ZsqjH+7IFjtVVPKtKt1IDmM=;
 b=MVipcIZowdqi8bUDBDbH1GMnCqXdS44gSMKbM87QOAvsx8WIt40IyKRIB/SaZgad+C
 5NQjwHVWKfdS09mBWte74EO+NktDCZjEJ0WvjZafQ90+Rg14CXEKJZhSEXnHzohh3EkX
 FSZ+/kvdxmD7y+bE+h1r5NdZls1ruVGn7p99lVWlqvKL3N0hLQwNeVuhBqvwkOE9OqCv
 12iKK5QcNlmzMQqbNrfyrXNUkPlaVGldw3bLV6UALYH+Z6GWvedn+jMFwX/INaHuFb/j
 Tu9PaESDitlKOrx+OZoVwNzdiEFBBd8OWI+cJ38zlA/jsZtEOthFHd6Alx/543bebjOs
 NB8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VZNOFvT8OVmkS3WXwbkv9+IhR6VMQI3DWOQAGKPWxb9CGzqOpsZOcYNgjk3guS8H5xmmAVn7/uA==@nongnu.org
X-Gm-Message-State: AOJu0Yzz+9jpefa4wwvX7z2+tzebSuSAFRcuOom16D4TKOcb2+3PR/Qe
 gj94y5u2FEppuNKgopvGtR4VZ5dzaSLtkcBr9N7CHnF7rhdMhW2wL+SsmNjbnzjMUJqQdWTaea3
 SRUmZ91yq6JO1jYVgYXyjgscpii75bL3dGHn8MYGyk7HnAG9G17St
X-Gm-Gg: Acq92OFi2mYYBCLX0aL6jfZGNPahRUiKdulb+z/ayUCq6W8ky5sw6AjQFWMILC+kiuW
 JMx7EiZaJZLLgAoRDzjtq0tav3a+PkBRibXWPVSHbVQ5fcM9gFR8pabo5zjKSuLlLJ7LwAmxiO3
 x21cVgfR05fnRmHZWpw9rWvfZGV74X1Ffc28DAanj9NcITQDTUl7Ta21MR/ciimhxN28R0bcslr
 saHWJ56QCUzk3mKxhpGDUisfDRKnlKiAgvbrJNgf4ypfCFRGQ+zAkwoILpWpZV37QBMsH4kzqxS
 2k9gnemq3anWuz4rZtfYulcR23xCzNuXSaYiVfL66Uh6cChnX4Qehl+pOW2zPY4nu64=
X-Received: by 2002:a05:690e:4384:b0:660:6441:d041 with SMTP id
 956f58d0204a3-662850c23camr10544400d50.39.1781601081395; Tue, 16 Jun 2026
 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260609112552.378999-1-skolothumtho@nvidia.com>
 <79e43ff2-00fb-4cab-ae8a-21e5fb23d8e7@redhat.com>
In-Reply-To: <79e43ff2-00fb-4cab-ae8a-21e5fb23d8e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 10:11:08 +0100
X-Gm-Features: AVVi8CcEKc8eksUBKud53I6Ko-HiYZy8MP2zfij8wAvv6o1FaUgi-aDX7-uCQY4
Message-ID: <CAFEAcA8F-0Rj-=uhfpdkP=K6yO-++uVDzB0zwWBbYeagDgWcyQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/31] hw/arm/virt: Introduce Tegra241 CMDQV support
 for accelerated SMMUv3
To: eric.auger@redhat.com
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 clg@redhat.com, alex@shazbot.org, nicolinc@nvidia.com, nathanc@nvidia.com, 
 mochs@nvidia.com, jan@nvidia.com, jgg@nvidia.com, zhenzhong.duan@intel.com, 
 kjaju@nvidia.com, phrdina@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 11 Jun 2026 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Shameer, Peter,
>
> On 6/9/26 1:25 PM, Shameer Kolothum wrote:
> > Hi,
> >
> > Changes from v6:
> >  https://lore.kernel.org/qemu-devel/20260601114221.457995-1-skolothumtho@nvidia.com/
> >
> >  - Addressed v6 feedback and picked up R-by/T-by tags. Thanks!
> >  - mmap the host VINTF Page0 at IOMMU_VIOMMU_ALLOC instead of on VINTF
> >    enable (patch #14)
> >  - Reset the per-VCMDQ Page0 cache when a queue is freed (patch #19)
> >  - Distributed the reset teardown into the patches that introduce each
> >    resource (patches #18, #21)
> >  - Added a VCMDQ readiness helper and renamed the Page0 backing-pointer
> >    helper to vintf_lvcmdq_ptr() (patches #18, #19)
> >  - Trace the VCMDQ Page0 backing, hw vs cache (patch #19)
> >  - Renamed patch #24 to reflect the changes accurately
> >  - Updated the design and lifecycle documentation (patch #30)
> >  - Based on top of Nathan's "Resolve AUTO properties" v6 series [0].
> >
> > Please find the complete branch here:
> >  https://github.com/shamiali2008/qemu-master/tree/master-vcmdq-v7-ext
> >
> > Sanity tested on NVIDIA Grace. Further testing in progress.
>
> Successfully tested on Grace-Hopper. Feel free to take my T-b:
>
> Tested-by: Eric Auger <eric.auger@redhat.com>
>
> All patches are now reviewed. Peter, please consider pulling this if you
> are satisfied with it, in addition to
>
> [PATCH v6 0/9] hw/arm/smmuv3-accel: Resolve AUTO properties <https://lore.kernel.org/all/20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com/#r>
> [PATCH v2] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is called only
> once per bus

Thanks for doing the testing and review; I've applied this to
target-arm.next (after those two other patches).

-- PMM

