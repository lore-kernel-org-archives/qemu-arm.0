Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4065995wrv;
        Mon, 5 Aug 2019 07:41:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxciVkEgSUBQe5KnTNOAVNGmD2HkpMePRnZ1zsBXFOc600j4W8oMvVhPdrPblO82nwIEVmQ
X-Received: by 2002:a37:bf42:: with SMTP id p63mr50144820qkf.437.1565016109090;
        Mon, 05 Aug 2019 07:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565016109; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeTLzp9NL92GEWIuWCtNENKlL2A6u99fLmjxHUKwnD7FQIlTunFktb48MxuIcHDmHz
         pMbqLGLCPVWClmTGD9nphhWfR4e53uGtqeBFLuSOHsCu83w5h/g7VrYkAU3hYm2M+t4S
         NRu+NEV1F0Jz/6eiXXiXHZVJv3auTU81it0dfy/EGZNBw88LYMI1y0TYbm5wOWgoB/RN
         H2dQu6j2GROep4Lth7S5n6YwKSep4sbhpfwEqyMf4mnPmZcW/zjSVsr1TACcCPfYTc0a
         Dzee6z05BZ/lbuxJ6yoKqrxLwJeE5bc/dGBGabR77WMsGRU/ZVXZTeY7VaBDwt/nqn9H
         GcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUOYRM1EOhdMiSMBt/ZvivXhL3kt1XZhGVCOp5W+Bk0=;
        b=sP7p3SDWvefGkRLh/x1E65cAR6+H757ecr275e7gBrUPMN4U/qKA+/JAR2mlz3KO4e
         1SxN+/rEgSSTsFImpp33g9lct8wzdLHhit6QwG9bCfHZ2jYF+rnDliAB8ycrQVOJah6e
         PdXAeIglYsXaGJeyOwF0zTMABDUf0hH5eC8TClLhZngEs/UlWgJ4LGwV2yYEpVusG/Od
         3OmJAUaYKEw+6T9kFn/q8XXW7efueH7V8Zk03VYbsEPDg6APseMc+sysyGP+DAemujiB
         Po1B6fhxMa0wE4CV+9pAw/yE7OeUEbTOBsOB3LCjA839F0LgffR0wqvSQWgej2eMpYYM
         4drQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vjk6tF00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23si50053022qve.127.2019.08.05.07.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 07:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vjk6tF00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hueBI-00076D-Nc
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 10:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39543)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hueBE-00075p-4y
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hueBD-0002Yp-7c
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:41:44 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hueBC-0002YV-Vc
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:41:43 -0400
Received: by mail-ot1-x343.google.com with SMTP id s20so19996465otp.4
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUOYRM1EOhdMiSMBt/ZvivXhL3kt1XZhGVCOp5W+Bk0=;
 b=vjk6tF00pSzrwmPLNOxLjRHejSjVpHk4nnPqrziQ+UEmMaHDt5XRVRGv0qYPplpRGo
 P8k2+f8Z5LDIWgW9uIcrkcC0w6h+I655eqFbQc+iooYaEkHuND9o0/c/kZYn99L5rjRQ
 HXE/s1MRLKY4HQbdNpPr3ljeB5s5NqVZJaVTHrok11OKESah/96N/AycMEo/iqbZQ7Mj
 5O274lHSoMDO15moPWQscSnYhGEuiIs/s7/EYlW8lNn1iQLeOBt2nQx/M86lUeEhDkr0
 PGiHi152RWuH4CeOf8GvZeQ1ehmvY3Au4jeB34f4286xJuR8Rg5jtUFxftvZFyW9mDLb
 DcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUOYRM1EOhdMiSMBt/ZvivXhL3kt1XZhGVCOp5W+Bk0=;
 b=RZuydU75ZZpBmKHixXO8O/bwWdY1/GaXjVMpri6RpwHkIGYuM5m4u4rVUmbjyWtq9P
 JfNv+sVjT9PwdsBtVqlNz9JllXCWpCBJL5OFethRD8bBxr8D8kDJo6/F8Lw9GlZ5vxYA
 EZFObT2OEXVNF2R7jQuyVeUfseQmNq2lxZLwz2sNVxtY/iTjgNIxjYIBi6wwQ68UgqW3
 g/M6f/xUOWPXg96P7CrtG8FrjooVDgksjZgfd13V/sQ04akWmy0AhfCkffpGsV0LMPK7
 /tmD77AMPEzoqCL7LanzmpJihiZswcmg3zRyrjmtHkxecilEp7XgKfdAS2o2Ljd0NNSH
 JvUQ==
X-Gm-Message-State: APjAAAUN6d0eH8/EoNlrrqoSnCbsV9RgjgAc8LnFOtYuJPxumg6OXQGR
 Y3FPMn0KAnG0ykkgGv0L37UgBjtts5dbzVkPUHyxMg==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr85032806otn.135.1565016102060; 
 Mon, 05 Aug 2019 07:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190711061857.13086-1-eric.auger@redhat.com>
 <20190711061857.13086-4-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 15:41:31 +0100
Message-ID: <CAFEAcA_=Rz5f8RvZU7kjKXhM5sHKFDujoMRTuzanrauP3ChPVA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v3 3/5] hw/vfio/common: Assert in
 case of nested mode
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wbh0dykP4BHT

On Thu, 11 Jul 2019 at 07:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> As of today, VFIO only works along with vIOMMU supporting
> caching mode. The SMMUv3 does not support this mode and
> requires HW nested paging to work properly with VFIO.
>
> So any attempt to run a VFIO device protected by such IOMMU
> would prevent the assigned device from working and at the
> moment the guest does not even boot as the default
> memory_region_iommu_replay() implementation attempts to
> translate the whole address space and completely stalls
> the execution.
>
> So let's assert if we recognize nested mode case.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a859298fda..d622191fe6 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -604,9 +604,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      if (memory_region_is_iommu(section->mr)) {
>          VFIOGuestIOMMU *giommu;
>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +        bool nested;
>          int iommu_idx;
>
>          trace_vfio_listener_region_add_iommu(iova, end);
> +
> +        if (!memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
> +                                          (void *)&nested) && nested) {
> +            error_report("VFIO/vIOMMU integration based on HW nested paging "
> +                         "is not yet supported");
> +            abort();
> +        }
>          /*
>           * FIXME: For VFIO iommu types which have KVM acceleration to
>           * avoid bouncing all map/unmaps through qemu this way, this

Other failure paths in this function mostly seem to do an
error_report() and return (apart from the one call to hw_error()
at the bottom of the function). Is an abort() OK here?

thanks
-- PMM
