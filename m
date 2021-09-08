Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp281653lfb;
        Wed, 8 Sep 2021 02:54:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww1Za8IP5ISYHBq3raKf9qV5cqcvdmyNCW4BGaX3JGUcty1oL5Dkb9eSsCPOWqfGwPxr0T
X-Received: by 2002:a25:396:: with SMTP id 144mr3785806ybd.224.1631094865666;
        Wed, 08 Sep 2021 02:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631094865; cv=none;
        d=google.com; s=arc-20160816;
        b=fQ6wynzqkHipknc8+Y3Bhs34cUmO1j6f3EotLZs7x1xFmrGN4lRi7ILIuAbm/UZMet
         NVVQM9RgbTQ8HNREAe1q4Fq8bmSJNyjX2uBgmCQFdWVsQQZGTiu1j0h4jwVfbvIOE3RN
         gJX/r6HfgBV87XeW6JkpIULmQZA3GctV6Awre5zDoITFU9jWfxH3MgFveLyHduttEAYG
         XW2ALzO656Xo+dKI4tlil88etIcKtw7tg4eqaWvVZSf3oN4Ve0zhaI+WQf/3chbx1kkn
         5n3zdD3Yd+WU4WqKIHBF5uUv+oIHf2qYzjpc26/KexSnrj76aT+/eTJiDgKT/vWdiPyn
         +X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wzzhw97OUTWTTIo0WY8grZUE73egCuX1o0c+AaqUtZg=;
        b=ruY/Ql8Po38Yz9p3JJJbldL58ulnhYnZCaggN5JZJRoNL9aSyw2yCIoOiKZykQoCon
         HhfmoyZ7Tn/KxE3ygM8VzBUICORIdMTQnmv/S3ef9uqhhAMpAPgTjfIRVPucNQHP3NOB
         yZXK6vTsKW77jc2QH487NRXRssz7VO4q5W3xJAEygD7Z/0QhNih6+bjO19ThJp2YLLdX
         6aPAZ1NqE7oLK12zDUEfNOPpBgtso8IezMz75CbqmH5YTnCJ61tcwwmQJ6NixnPFCy+g
         WkoTW4R0SVEaei121Nx540PAavoisPx2PAEt4cFkraGq8uTmscQ7EKLsW69oFYr1wjFx
         jRcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GTRI3ss3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1918698ybq.437.2021.09.08.02.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 02:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GTRI3ss3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNuHh-0003VF-0W
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 05:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuFL-0000gO-VD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:52:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuFK-0000WH-2r
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:51:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u9so2331317wrg.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wzzhw97OUTWTTIo0WY8grZUE73egCuX1o0c+AaqUtZg=;
 b=GTRI3ss3obMncGq/1xWijxPFjY1fsfquIbSIWd1Gwl/6sid3n+WdmNJWiR/HhtQ41H
 UWr2W5iQsIxWwPdNPmhcSV6B98hbXUQnkbV/81DeU70iTRDq8sDhpPKXeDMS/9cSE1MX
 Pt4IAoKQtJQhPTlYwfOqhQqlhKtHFeGz4CpB6Ba8stsudN5HFpmomoESSY5DeViqQwSW
 9PNWT2IzAEzXlCiwy7uS4vS9bleH2a7RqOSl5Oq4thcwQBFqAfmCGVdJERjFh5kj0/UL
 tNMDmL21ryXYUQmYq7PUU6R2BNnSjL18ugJGAoZb3yfOc5mOzIQb0x6g7TLCuLrbhtQC
 ezyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wzzhw97OUTWTTIo0WY8grZUE73egCuX1o0c+AaqUtZg=;
 b=neCBNMi2Jiou5id5ek+cj5CcOC+jxPOhHeGzhrHf+0deHWr4kxHh9Agz6/6ngovViy
 RUYisdFnFBJxJ8Fzs9XIfEyzow07NizXVJeYPEaWtbvSisv8fIduZ0ZkiKAaoz1E2P1i
 wetUGqOQtuKljP67oF7p4J20hubEUYCmLlJ2Gopp0pP5Hy93QoKbPNp9zM/N/aOFsxMp
 mRXwMjNqtCSKa5U5/7RbDj3KiWycXwYsbAPwNZ4WEypvdMSSTwa1JqiPkk/JrwJkmPyc
 mRK2gOaQKfkiAbwOmC5QeLUh8K21MOQzL3Ewc8vV449IsZ42e8yaWCeEJmd6o9mbNpIW
 2YeQ==
X-Gm-Message-State: AOAM5318O07D8knfTFUZgFtJkcruysab3U1QkR4OxfNSExNzZD2K2QE9
 m2XiOCPyDsKU19IK+dB58wAt1A==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr2999930wru.395.1631094716354; 
 Wed, 08 Sep 2021 02:51:56 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id s7sm1646492wra.75.2021.09.08.02.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:51:55 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:54:06 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 7/8] pc: Allow instantiating a virtio-iommu device
Message-ID: <YTiIPrpDJ3RtrTMf@larix>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-8-jean-philippe@linaro.org>
 <9e656d29-9ead-c095-15b6-3038ac60127a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e656d29-9ead-c095-15b6-3038ac60127a@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4MDQVExtXOQp

On Mon, Sep 06, 2021 at 04:57:39PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > Add a hotplug handler for virtio-iommu on x86 and set the necessary
> > reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
> > region is reserved for MSIs. DMA transactions to this range either
> > trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
> s/bypasses/bypass.
> > Although virtio-iommu does not support IRQ remapping it must be informed
> > of the reserved region so that it can forward DMA transactions targeting
> > this region.
> 
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Feel free to remove my SoB. I have done much here.
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/i386/pc.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 694fc9ce07..c1e1cffe16 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -797,6 +797,11 @@ void pc_machine_done(Notifier *notifier, void *data)
> >                       "irqchip support.");
> >          exit(EXIT_FAILURE);
> >      }
> > +
> > +    if (pcms->virtio_iommu && x86_iommu_get_default()) {
> > +        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
> > +        exit(EXIT_FAILURE);
> > +    }
> >  }
> 
> I think you shall detect the case of dual instantiation of intel_iommu
> and virtio-iommu.

Those are handled by x86_iommu_set_default() and
pc_machine_device_plug_cb() (below) respectively. I considered factoring
it but I think it just adds complexity.

Thanks,
Jean

> Maybe pc_hotplug_allowed() can be used for that. Note
> that both devices can be refered to in either order.
> >  
> >  void pc_guest_info_init(PCMachineState *pcms)
> > @@ -1376,6 +1381,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> >                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> >          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> > +        /* Declare the reserved MSI region */
> > +        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
> > +                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
> > +
> > +        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> > +        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> > +        g_free(resv_prop_str);
> >      }
> >  }
> >  
> > @@ -1393,6 +1406,11 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> >          PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> >          PCIDevice *pdev = PCI_DEVICE(dev);
> >  
> > +        if (pcms->virtio_iommu) {
> > +            error_setg(errp,
> > +                       "QEMU does not support multiple vIOMMUs for x86 yet.");
> > +            return;
> > +        }
> >          pcms->virtio_iommu = true;
> >          pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
> >      }
> > @@ -1436,7 +1454,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> >          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
> >          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> > -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> > +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> > +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> >          return HOTPLUG_HANDLER(machine);
> >      }
> >  
> Thanks
> 
> Eric
> 
