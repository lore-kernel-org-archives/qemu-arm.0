Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp392127ejh;
        Thu, 1 Sep 2022 08:05:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qD7A5v8PT6tvFv6z+Igdlerv8+bky25gD+Z4vkfMYq5az1aqDv8GhgtlX1koIJrIDLnRt
X-Received: by 2002:a25:38ca:0:b0:696:69ea:d2d9 with SMTP id f193-20020a2538ca000000b0069669ead2d9mr19734884yba.370.1662044704859;
        Thu, 01 Sep 2022 08:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044704; cv=none;
        d=google.com; s=arc-20160816;
        b=G/743DHleh4pTkCFJoI3Ydx8Gb3ZoAoJ5qyk1wtsA7KZj0ZQ/lQdT6kVnS1OUnM2rQ
         9nwE7jtGn42j4ocmHjaFADvlcDdJUNXUGMCiBg7t5FJVGlJmfWgamEmXCW0xQtLmaQ1U
         XOfO3pB3boRl+B1ss0GG0R1DxCdwSgQGFxSQiH3+x4xOOao2bxNREh+D8Otr7hQvZfID
         R41a5aAV9tHg5/9F4TEcJWvu2i5WUWoraFlTJ6uEQe8NNvULPjv1tSSzkw27HYWtTfC4
         GYsjRMNVRYIOIXLi8s16peeTTkADJkMbY668WP1jfF17+LqylWZXJx2t10i45ke3xXRQ
         7WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YF+Mg3isX0cmFE8kubGGohFjw0/ZIrD04XqOFqTxa8s=;
        b=yORThYXXKe6JRm/6MfU8D9cvG7bOA5CmQ3PkjWGcTZgibRd9xsrtb8M8dl6uxMHphB
         h58NsYjsW17U/CEmU+uy3LS03WGBZqV8QlgtYI7T/lAna06RV7HmACuCKQvXJvJ/jcvG
         xJZhG7mFYNRRtyCmRvCHPOk+YQlu+CXwH03nWtT4LCd6CXNf0SxAghP3ogRI2d//h3bA
         9gH49+XWbrZQBRTxSB5D/x0qf54PuLrPayzN0tR63O9Ynsg242zVNIcZri7xcYPSovPp
         uP9Fw42jE/qEw+apMh9nTY7fQ4pugBAOha/W3CvQcd+ANnkUvg1Tzb/CzuRhZoM5oscV
         aSCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxap+hbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a252d49000000b006959f221826si8472012ybe.99.2022.09.01.08.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 08:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxap+hbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlke-00008j-2Y
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTljr-00004z-UI
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:04:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTljl-0004H4-E5
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 11:04:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id az27so22762022wrb.6
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YF+Mg3isX0cmFE8kubGGohFjw0/ZIrD04XqOFqTxa8s=;
 b=Kxap+hbkbIlFtRWGhlMx8DKVsrvcBF21AXSumILvJKtFpcsaf/uf2KoPEvsrEqwBTj
 FPtXZ/w3NCFNaE5RNMtnQ9bPzigF64DijwIlYjZEXCl2qX464wObFQLXrk78ecV8YiIR
 mnt7YKK0Tsasu8W3+NBiEEJSQXPu65Q+y+LoHNjLYENucGAmv/27X7Kexlns2gTg3w2I
 9+F3C3DwJUO6PUqIIfbSxyBRronX1ngddSHUxQ+jSmJSCknH8M3UP2b8mlcl7MVFdi/w
 eZzRYPxxpfGJmnoBrKDnPfp9H3saPLEZoiIRvGAiWc938StgT4WdoWQWqpy+qxdnGyOl
 69xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YF+Mg3isX0cmFE8kubGGohFjw0/ZIrD04XqOFqTxa8s=;
 b=0MbR5j5OFNKelBJHV2IWBeqmnwF/IiF3lV4fykg5ByAhNwN2BiuvP4Oz4DJLLjwFMP
 uRsi1+G061fQb/TreYIIsBKDgwSLCfNv5shjyC7hOUtBVYbkcZbkr9C2QYsrxZfQ1d0c
 KBLQYWyxbgPkYcIKuviUUoqXQA0XJN4KfCfrZd9mI57djBzBILJGKAZHdRYxexu0/rhz
 o11nAxs8zvoVOuTfvVm5NPBitVjgDAfeKVX/B27abHTIXPCEdKIEnb3GBkS/bOpJ7Gml
 ZPPu9NWensUh7JrzLxUgfqqEZKU/Fi9f5ulHekOCGUVkppVuoUIxwRmRRWbR2ozhfbKE
 vNxQ==
X-Gm-Message-State: ACgBeo1EM0Dw9xjoZ7VUqwsM1WnZtM49ZlX3au6AtJpVFhIAiMCxueAu
 k7iLCeVpvmV+FghChPioF6A5GA==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr14081897wrb.149.1662044647830; 
 Thu, 01 Sep 2022 08:04:07 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003a342933727sm6075783wmb.3.2022.09.01.08.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 08:04:07 -0700 (PDT)
Date: Thu, 1 Sep 2022 16:04:04 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 10/10] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Message-ID: <YxDJ5FE4zXSQW10p@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-11-jean-philippe@linaro.org>
 <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Uj66tYh/DcW

On Wed, Aug 24, 2022 at 08:51:18PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate and dtc throw a few warnings when parsing the virtio-iommu
> > node:
> >
> >   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
> >   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
> >   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
> >   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
> >   From schema: dtschema/schemas/pci/pci-bus.yaml
> >
> >   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
> >
> > The compatible property for a PCI child node should follow the rules
> > from "PCI Bus Binding to: IEEE Std 1275-1994". It should contain the
> > Vendor ID and Device ID (or class code).
> >
> > The unit-name should be "device,function".
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > Note that this doesn't follow
> > linux/Documentation/devicetree/bindings/virtio/iommu.txt, I'll update
> > that document when converting it to yaml, hopefully this Linux cycle.
> > The "virtio,pci-iommu" compatible string is not actually used by any
> > driver and only QEMU implements it, so we can get rid of it.
> 
> I'm not sure you can just change the compat string like that,
> unless you can guarantee that nobody anywhere has ever
> looked for it in a dtb. Also, "virtio,pci-iommu" is much
> clearer than "pci1af4,1057"...

I'm pretty sure nobody ever looked for it, but can't guarantee it. And yes
the PCI notation is hideous but that's what the standard requires. So I
think changing this to 'compatible = "virtio,pci-iommu", "pci1af4,1057"'
would be better.

Thanks,
Jean
