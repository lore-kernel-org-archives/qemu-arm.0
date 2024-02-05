Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1032636ejb;
        Mon, 5 Feb 2024 02:13:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE87NNZzUSq3LiH0MHdyL/hNILlg3fl/ijLsi0NA0EKaObcfirYj/hW0qCUR21UsOIkQYjk
X-Received: by 2002:a0d:ca8a:0:b0:5ff:bb43:2a69 with SMTP id m132-20020a0dca8a000000b005ffbb432a69mr12921201ywd.40.1707128032683;
        Mon, 05 Feb 2024 02:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707128032; cv=none;
        d=google.com; s=arc-20160816;
        b=X1VS+gQvo43xpkcpPq1vuGYJpk0KEVhl3FoJBHkp6vMWvYI0ybA237xbpoC5Ce0RGX
         G6UJGaEKmwLzC8RqeqP75REFnUgF600zMjBPrHWZPIfoIqRU41DuaYeEQdA9b+21oflW
         iQj4haanpXt04Cti5XlZ7392wWNexv3VYHY+rT4c1wO6oGaCFOuNrlxYKH4HrgVhAvfu
         NHrdpQAl39zu9eOMjixuQt9ceeoBQQjzldx9132a2KPO1P//ulBgm4mgZU1flvKDeLyr
         j4A9mIfSUIwd3UmpClG4Jf7E7RFhhuYTT9KMD+Q2hToGeBOKc2+OO9NCuZw5/HfFZiIc
         XwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lJgt+rIcf8cWWUzO6QfRYxI8XlavmPnLi44SsOqg38k=;
        fh=SW71O01W853Nv1k45PeuFDT9B40M7GiNrnjSVQ/xDnw=;
        b=ydTuFlqnldnVT3oNn8OC+e/N93M06aaMyCTRX36j3SWgl8+yZq4Q54isdpN9rL2ljF
         wrqY1r0kidV5BNpaQfuAehCeqro5qlW3FUBwnNwVOQie7Fjik81ZRCvYaH7fcix0Fa3u
         CDvqmaXHzJabO/jI7gYIKsQfiN2TvE72lNohd+8dOLHQlV+2vcV7UlnnGNWbLo9irL6A
         UKkmlMLcno7BnN/Av20onrglTN287O+NCrNxTjDi0phipIZaw+III0BoT77+z4/wgpMa
         r/SdpzZ5KRRrvgLpAMMN6X/JzbDdrQxM4cNhAWjIBL/G3t8USy3rHsTWCULeUYTNuWZg
         MZ2w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IMNg5l/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVFB+EPrEfwus4LIPbMUEhqBHhr0cFLmRc9bHV4w5ZihvNJfYRD2HXK8mqX6F7u5MEPVKwiIsJeeD6vbrtaOdTFSj5cHXzB
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05620a164a00b007856e668245si4278906qko.474.2024.02.05.02.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 02:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IMNg5l/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWvyn-0001J0-2u; Mon, 05 Feb 2024 05:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rWvyl-0001IZ-Gx
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 05:13:31 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rWvyj-0002Wo-Pk
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 05:13:31 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5101cd91017so5445878e87.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707128008; x=1707732808; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lJgt+rIcf8cWWUzO6QfRYxI8XlavmPnLi44SsOqg38k=;
 b=IMNg5l/KI2VAr9tcM/MTFcb6ekGnExk7kKBSxzpiSvW/wWV6m28KTpJ18qNthzZb3F
 GABePjswG7EoESIyKoQXy/VFA3YXs7jBmADkCQSN48/Aa8soOI38CoTChlR8+pj84cnu
 SCcL/UqmSzsDbP9TKNVZEG2htYHc1mEwO3ptVLFQD/QyRCO5dFTZ8iVgkBGaqHnGeHpk
 j1VHsTOuevJpBGQKB8QXMYGMxGTb9ALj5Pqbz449OeUovS3i+8wm32d6meL4bALdYNvH
 /upsqd8sNLWtyiPa/bSoJjJvllOhp2Jbvgaxhm/gVPQHNfovZC3Z2eF/LVy1wXzIaaco
 kAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128008; x=1707732808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJgt+rIcf8cWWUzO6QfRYxI8XlavmPnLi44SsOqg38k=;
 b=Rwr27fbDE/QcS7MPAOSU2CvXxoqFKopDP9Mtmt0XNlQHX3WrWGsjBECU/dysqfmgng
 Hzl0YhaeYPdcT6uiQEPFSkcUBMpG8J5I88GdJ28J+4DAO+cxOmaeZypPqg+GUKB6sX0I
 v4tLcnJCA/TEknWx4rdYZrnZI196CgQjutZT96j5bvgP2k2dWVtVNgZ70oAWYZrHfJFY
 BAbjS8q1bfEwBcHuBv0CNx8a6eCW1Ux2VBm1ZrrstHpqNRDViqP0PRGJH7tDwI4EsFBz
 nZdINqt7CDJyDJJ0e8waWT8orMag8zJNzJF7/drqpKdKPuPXQFDpBzbi9PDFmvPWyrsR
 4Riw==
X-Gm-Message-State: AOJu0YwezwwaG91rAH8O22G0JXST4V54JZG56ya34KGLmtmhCCpOocy0
 VCTPcHCpoUjWSO8tyfIkpwKPqgyPfEBrMmKStCCnDM0I918vWQc0k5pUsk7KXVw=
X-Received: by 2002:a05:6512:292:b0:511:4a3c:bc67 with SMTP id
 j18-20020a056512029200b005114a3cbc67mr2830078lfp.9.1707128007718; 
 Mon, 05 Feb 2024 02:13:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXJLQoDNi2Q2qdYX/U6PiMl9OFuceQBj+ZoVnehK6ZdPRkztc9BWnHpIaAJo2xn5XxbatbtAvXF+1qnuNLsiQ5oE0J/xt4h6/E1YvJjhbSzgzDoPQKykT5m4zC/OtwCh+MXGtC80JDctgE/Oegsj8OY8yzYnISMBHNqUB6y/nPyDFbX01oTnG/9O5+Pi72tcYIIn7A0iDopB7UlN+Vd2srdv/AfIoQwvWe1qbjpDHQC30YEreb+3qXu8HhHWfcaPrJu+4smUHnqcNp+YOCj1u0Lp82TE29mISyw0uBNXEv5R1S0UuJ3DKY0/ph8XsgcQeOkg+7X
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 dw14-20020a0560000dce00b0033b26de0073sm6303131wrb.97.2024.02.05.02.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:13:27 -0800 (PST)
Date: Mon, 5 Feb 2024 10:13:22 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, yanghliu@redhat.com, mst@redhat.com,
 clg@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v2 1/3] virtio-iommu: Add an option to define the input
 range width
Message-ID: <20240205101322.GA2086490@myrica>
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201163324.564525-2-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: iP5PUlz/P92S

Hi Eric,

On Thu, Feb 01, 2024 at 05:32:22PM +0100, Eric Auger wrote:
> aw-bits is a new option that allows to set the bit width of
> the input address range. This value will be used as a default for
> the device config input_range.end. By default it is set to 64 bits
> which is the current value.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Check the aw-bits value is within [32,64]
> ---
>  include/hw/virtio/virtio-iommu.h | 1 +
>  hw/virtio/virtio-iommu.c         | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 781ebaea8f..5fbe4677c2 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -66,6 +66,7 @@ struct VirtIOIOMMU {
>      bool boot_bypass;
>      Notifier machine_done;
>      bool granule_frozen;
> +    uint8_t aw_bits;
>  };
>  
>  #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index ec2ba11d1d..7870bdbeee 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1314,7 +1314,11 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>       */
>      s->config.bypass = s->boot_bypass;
>      s->config.page_size_mask = qemu_real_host_page_mask();
> -    s->config.input_range.end = UINT64_MAX;
> +    if (s->aw_bits < 32 || s->aw_bits > 64) {

I'm wondering if we should lower this to 16 bits, just to support all
possible host SMMU configurations (the smallest address space configurable
with T0SZ is 25-bit, or 16-bit with the STT extension).

Thanks,
Jean

> +        error_setg(errp, "aw-bits must be within [32,64]");
> +    }
> +    s->config.input_range.end =
> +        s->aw_bits == 64 ? UINT64_MAX : BIT_ULL(s->aw_bits) - 1;
>      s->config.domain_range.end = UINT32_MAX;
>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>  
> @@ -1525,6 +1529,7 @@ static Property virtio_iommu_properties[] = {
>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -- 
> 2.41.0
> 
