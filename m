Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1581905lfb;
        Fri, 27 Aug 2021 06:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcmwtdaGokjrZcfcFXPyP3fjZQBMZkL7dW0vDieDD9qZhmoIkrkIVtDZL+oqrJMejlaxea
X-Received: by 2002:a17:906:ce24:: with SMTP id sd4mr9827130ejb.329.1630070693040;
        Fri, 27 Aug 2021 06:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630070693; cv=none;
        d=google.com; s=arc-20160816;
        b=f6/nqDPnW10dx+e4yDnCThyMmC4ncWL/WvuPZPc1+LG8SpdO9wojTB4hTjCnRQX/ON
         HXXREBtm9DHfTjg74J46miNRHrkbi+5asMzPXLfkZbpXwFGs42ZD7TXSMK5WwpUqEo3M
         ExuXRPNJVE+KeL3umoK0W2nDvZ55S7pW3UamAL3grk691yYgpdhn5+yarR3j6C5TvH5K
         Vpvquio0YN4zm7XvF34IK/rTkvs/a1/yLYV3IcFYluexcs0VvJH942FlmW01rCdqfCLJ
         Ol/ZavPSgxuWzPCW1ZwtMecYCgXNUAtiYSgPeQKKM9+w9vV3A11LwEvR5MYH/QVQbPVM
         0lAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=IL0IhZ89qP0aP4cEleW4k8GTKxNWY73C+es1+kPwk0A=;
        b=WLUjYHezmsXAyFg0GBxdu9LDJ7e4P2nL+0drm9l1neXpWc40u6q+JMLZzHvFgkJA9U
         /U3xv6rVBwhyY1IV5HWDWMZYXzJrx0hWkq38Jh27W3lebC62mY7Rkb+majZsC3npmqCd
         O7rWRn7uj8br4sa3kevDKuLMYVH9HaETwUImMOX3WaiIGP+GmL8eI8FJkgPDJoLqjUYs
         vFNHtwnkQ5sA1U2tqieAQoZsBk8XGvHJUOs5N+duzlP+nRVLs3/4PP7esKIFuckuEoqL
         PmhmscbqoYUM7alx5zJxBI79LmWu9yyF8oRgvjrySEJA4tRHOtMR0L+y5C7E0OQvNyK6
         vUYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PoyJzcgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si6112889edw.399.2021.08.27.06.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 06:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PoyJzcgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJbqm-0000kr-2B
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 09:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbqR-0000j7-S1
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:24:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbqM-0000qJ-L0
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:24:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so4394333wma.0
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IL0IhZ89qP0aP4cEleW4k8GTKxNWY73C+es1+kPwk0A=;
 b=PoyJzcgPrlJ87BcQi8swMmF7BlfJd844Apw3LR68kMm/Av1hDvUGraBPqYDCgo89+P
 +AVZ6lBRpUu3Wdvg6NM559tQ5QDJ4hHkYcMlTYde2UYiOqueXafwSXOvk4rbP/NNwTKC
 G0K9Szg+D1m/hhXVUHxvOZV/sCxNl41D3ZyYZCF6jRg/kg5zerLpNsKAgpddSkXdg6K6
 Ry/tQ+I0jPKpCwA73dU/T7k+EWSICRpvgsSZ108BtUbvKfPjmiddC49A1pDYFSzYcu+D
 4B2AbfBMLUt6BKbAbpb0AIyQIqL5waq04C44cTHG+DkNIFKNV+jDQPpf7/ESS7ENTWFi
 Y9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IL0IhZ89qP0aP4cEleW4k8GTKxNWY73C+es1+kPwk0A=;
 b=o7snW5etNCip1c5927GEut3Jk2xMaEeHx1w5FiffzbCIxw6IY8wt9TiKxRDexZpfIz
 2/TpkdkERP8zTDhOeOwxF9hR/WtWtCY464/2bY/xBAa/tmBo1jpMZCit6Nm2+Oo0NLRu
 ddNDzpdZ0jG3of5sCyI33iMj5GwSSJUERx28qlFuDi3v9crcXs8H3r7rw5fZEsnCzpii
 /deQSHA4bsJOFyAU6WWDqQutlZSJwpjkOtyLuvThqkHisBy161vPOsS2dDUrXonKRIMh
 GfVeRxuYcGPjZ4xwzWYviAjhD2AAclZ9kc1bY4hTCrzLiMo+EH/Hysam5fvSHB6mfQF5
 rQrQ==
X-Gm-Message-State: AOAM531TECbbp1KLX0lotD/dD8NCsKSIL/qUP9K6eIMp24+2UnaUTwna
 PBQE8nlzmKvMFIpvt8EjOR1StQ==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr8871274wmi.87.1630070663958;
 Fri, 27 Aug 2021 06:24:23 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id n8sm5331351wmq.18.2021.08.27.06.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:24:23 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:26:33 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
Message-ID: <YSjoCW5z1xbYL4Gp@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-7-jean-philippe@linaro.org>
 <41720de5-ce29-dd79-2911-d974408af544@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41720de5-ce29-dd79-2911-d974408af544@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3sr/R3w3jSI

On Tue, Aug 17, 2021 at 04:11:49PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > Add a hotplug handler for virtio-iommu on x86 and set the necessary
> > reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> > region is reserved for MSIs. DMA transactions to this range either
> > trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> >
> > Although virtio-iommu does not support IRQ remapping it must be informed
> > of the reserved region so that it can forward DMA transactions targeting
> > this region.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> I think we need to handle the case where the end-user gets lost with
> iommu options and use an invalid combination such as
> 
> -M q35,iommu=on,int_remap=on,kernel_irqchip=off -device -device virtio-iommu-pci

I guess that would be
"-M q35,kernel_irqchip=off -device intel-iommu,intremap=on -device virtio-iommu-pci"

I'll add the checks, similar to the one in x86_iommu_set_default().

> We may also document somewhere that the virtio-iommu-pci
> does not support irq remapping as this may be an important limitation on x86.

I'll mention it in the commit message, unless you had another place in
mind?

Thanks,
Jean
