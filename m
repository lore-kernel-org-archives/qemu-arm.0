Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4071393wrv;
        Mon, 5 Aug 2019 07:47:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwahoY0su4DOdGBmVqGgM4D5klTy5G/ZZsva0CmoYrZxzG/qphI6WRyJ/oJbGEK5cCyqhoA
X-Received: by 2002:ac8:21b7:: with SMTP id 52mr104468188qty.59.1565016459949;
        Mon, 05 Aug 2019 07:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565016459; cv=none;
        d=google.com; s=arc-20160816;
        b=arOtxywjObRWEu+l+QgGEZxLM6X22qBuA5BNEfjbBlGMioxaPlinZO8c+w6EuG9KcQ
         W9c0LZZ4knuNsuTnot/Bv7ofECS0cVwVouMmjxfvbruP6TCJGoWbuwcFOWuryBk31vRa
         vFjeaQfW0RpvUifBWJGynVYBiO5Ucz+GUjRSKGBfSpFzoRe/T3sFl9OaW3v+IRRadXz2
         5Ns3km0bOFM9bNlWFb49xelX8iSF3iIEQgDKzF5LOxyK0/9PcoTmtJbEwmhkNJs7MJO4
         WrfTr6lSfAWtIFYrlLR2Tjg/riiT0B3ENie4HKdJcxRGYBq7k6DSrYFPkgUNoNvQSONO
         GZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nl/WkNbFtK4oDCY/sJp5HyAz2vVgFv/Gwuty8xGzHY=;
        b=PSoMLS9/khI5I72zpEeqR3cKwn6stz95NEMGKU8kOmT2Dyd3nysr4vfg3LLIFOkj8i
         UgN6ryqHvKEgtNLQHsm8C7w8JaSMdU8reX/nIIeJROo541nqe78oxSvU4Ac6Z6w5TJYz
         3fhcsYw/3q7HN3aFGWiSKS0QsHhkd+PVea3qUDA/VSyRLXvUZkA76DXI0aOXfbN8Ph9v
         MFbyAUjjmAxSAqwPGew6/I1tGDBLgs/NWdSqV4vpKHCLJ0ojuCrkeTLOPp7VHJyKuup9
         X9W2x0JKN/jX5NL6j6TbI5AjzSR6FXYbHgNea9xJhl3MM2VE+AOOiMMWS749b+ewKlNq
         qTHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EnbEhUTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si50947233qtj.247.2019.08.05.07.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 07:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EnbEhUTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hueGx-0000Ey-H0
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 10:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40349)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hueGj-0000DX-8V
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hueGi-0006HC-7N
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:47:25 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hueGi-0006GL-0z
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:47:24 -0400
Received: by mail-oi1-x244.google.com with SMTP id g7so62197307oia.8
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nl/WkNbFtK4oDCY/sJp5HyAz2vVgFv/Gwuty8xGzHY=;
 b=EnbEhUTDqCi8p0Nut56C0/rgXFX7fkBRWcGNTU030BH1SlZOksuP4GaE0UYH1D3Psj
 WCfbXv6uHxK3ibfuTojMz7BVwqSA6I66nznYxzNgclrk87GmvJAkw6MFBKQgR1Mh7lj4
 UKSB0xXymGUD7UegNjEwcfp/xgRJAq37fcvU4+v4z77BoeoyAqmkmgs+DoGu5NBgoqYz
 dRSCxqWzvUyMtlccBSzE2jRloBXCqH60RgwpTnXbf19pcm1K93TFyoU3w4benEP5A815
 O0Rhi6CryF4NBY3Vt1AWpPNBe7I95za/7yFgdcWu7MvrZuMEwlP2Nw/AyCIYqK2tzUdW
 Ibkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nl/WkNbFtK4oDCY/sJp5HyAz2vVgFv/Gwuty8xGzHY=;
 b=NuAhFMlab7boVrdYev75N0Y4mdMrjeFxbeWdMqcETG7sju72eLrvgHoSzG1HqwaQ55
 Q7DYfFPRYWmq6kIwwhq0M2x1Eji0XssNkY4lw0SFUUdep+iSmgRoZPOBazfMSHPvRFlF
 3wnAsyaButvVcntJZfv/Q8iF3v4B0/c8mcBS/STGphBCjN0RGTKeR1umcIEE1ed+3+AE
 Fr/7g0Ss/7C+gNyPMw3YbUO9qwMwsiPq9j340XKRz6/ngIqBTPEs2n0C4hWbXWt61ecO
 0AkujPW7EYDRAXdClG+1W4O/JSyh+clLz1teFr75Hw5+nA3Hae6hXAch9IkBVaLAdA4G
 vH6A==
X-Gm-Message-State: APjAAAUh1tq3tqDj2cUhQYXC0G0t6MYPPhmOnJB+hPm6jQRt+K+vlrp3
 ieYWqaSwVESLK2TgCAW1mbMd2m2q8I5pktoozykYeQ==
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr11142438oij.98.1565016443077; 
 Mon, 05 Aug 2019 07:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190711061857.13086-1-eric.auger@redhat.com>
 <20190711061857.13086-3-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 15:47:12 +0100
Message-ID: <CAFEAcA_UvvCydihGLhGy8Y_gk6Qh3UDGm1tC4xb3g4-UCbM1zg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v3 2/5] memory: Add
 IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
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
X-TUID: qRwS4YtXId9x

On Thu, 11 Jul 2019 at 07:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> We introduce a new IOMMU Memory Region attribute,
> IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
> requires HW nested paging for VFIO integration.
>
> Current Intel virtual IOMMU device supports "Caching
> Mode" and does not require 2 stages at physical level to be
> integrated with VFIO. However SMMUv3 does not implement such
> "caching mode" and requires to use HW nested paging.
>
> As such SMMUv3 is the first IOMMU device to advertise this
> attribute.

I'm not sure the name of the attribute really captures
the intention here, though I don't have any better
suggestions. Maybe IOMMU_ATTR_VFIO_NEEDS_HW_NESTED_PAGING ?

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c       | 12 ++++++++++++
>  include/exec/memory.h |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e96d5beb9a..384c02cb91 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1490,6 +1490,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      }
>  }
>
> +static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
> +                           enum IOMMUMemoryRegionAttr attr,
> +                           void *data)
> +{
> +    if (attr == IOMMU_ATTR_VFIO_NESTED) {
> +        *(bool *) data = true;

I'm surprised checkpatch doesn't warn about the space after
the cast here.

> +        return 0;
> +    }
> +    return -EINVAL;
> +}
> +
>  static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>                                                    void *data)
>  {
> @@ -1497,6 +1508,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>
>      imrc->translate = smmuv3_translate;
>      imrc->notify_flag_changed = smmuv3_notify_flag_changed;
> +    imrc->get_attr = smmuv3_get_attr;
>  }
>
>  static const TypeInfo smmuv3_type_info = {
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index a078cd033f..e477a630a8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -204,7 +204,8 @@ struct MemoryRegionOps {
>  };
>
>  enum IOMMUMemoryRegionAttr {
> -    IOMMU_ATTR_SPAPR_TCE_FD
> +    IOMMU_ATTR_SPAPR_TCE_FD,
> +    IOMMU_ATTR_VFIO_NESTED,
>  };

Could we have a comment documenting what the attribute's meaning
and semantics are, please? (including what the type is that the
data pointer is expected to point to, ie 'bool'.)

(We ought also to document the spapr-specific attribute...)

thanks
-- PMM
