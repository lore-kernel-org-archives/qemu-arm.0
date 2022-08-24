Received: by 2002:a05:7108:4017:0:0:0:0 with SMTP id a23csp3885792gdh;
        Wed, 24 Aug 2022 12:52:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zJC+E+1uB610QwXwLWO7Cn0iVFWsYLdJeK/hdSJnsg7VDkKKVPaUPdM6ony3rDMfTBYJp
X-Received: by 2002:a05:620a:1908:b0:6bc:4fc3:6a3b with SMTP id bj8-20020a05620a190800b006bc4fc36a3bmr668242qkb.633.1661370732405;
        Wed, 24 Aug 2022 12:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661370732; cv=none;
        d=google.com; s=arc-20160816;
        b=opEurnC2MgyBp7PGsEOoEPiB+d4zItgthKovWhVv1llZYw3fsejJ6qOdDqbDQQa8M+
         f16pTNaImeDP0AH60qi/T5VB9CY88NXVkifTM1Dd1CZOTbu9Cj6s3pD5z3R9ANUWB2D3
         Eh6qo1K3sf6FlXZappa0qIjersJgSHx3AFqlwu/lwLIvMjc8R4SHqAUh+x6XkbJrYyaK
         b8jJzTGHzCD0cUnDGkYIa199eMbrz8/q9/PDYYRA+/0LnhWGCsEbEzrGWMm0mqwTadc7
         n+3VVRGVXeS1lAoUcjYm1a+qCZlmRhZhz0D52h1vpjdAIPptdYQ7QZXSlnOWn13SfjzV
         rMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nNCyu14NpOf2lBSi6vrSm4gSsJKhALhPi0MXBNs/ELo=;
        b=oGDva/HqBN/fqhmfO6DCxROAWmOF1JmD3xxFWFysdzpa3+zhYzujGQviW46duz9Msb
         V3eSl+x7Ao4NKaDux23GwlxgMQKGHgLdPpDEUnxgZ3kRQpww5eBaJs7G5L+sV7F9Sihi
         I383984n4bgSi506AcCsJUFUoFWZBK+fKlC88O/u5m6azboWDZF8ZOXw2OXkdyIBY9/n
         FBjDCGN2ScfYPA8nsAIKjILbJj1xa7kkSn8mQe9PUdO0EbzJ8bVJA3O0++40wd8VWZeY
         PmaOtPwZgsFVp4VLMRGJpwDUSLpsdS93uOs9i3r0NL6yTrOR0oF0OcYJal01pFie2FHl
         7I2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlNcTlTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a05620a084500b006b94136f3a7si7664413qku.356.2022.08.24.12.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlNcTlTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQwQ8-0000RC-1x
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwPy-0000PQ-TK
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:52:02 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwPx-0000w7-DT
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:52:02 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-333a4a5d495so487548917b3.10
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nNCyu14NpOf2lBSi6vrSm4gSsJKhALhPi0MXBNs/ELo=;
 b=hlNcTlToAmkhKfWnPy4eqtij7Tbx0jaIgWb9ZbI70kQJWMUHwBAYXZ/87qaGbOHqou
 EC2S4NSqee6XWq5QL3/MnHc7X8zuES6XBrjbEgjxrwnB06Z9kVWwbpeArcUce2BGeQS/
 nZpS/38MP2IhbgfF2EhNFS2hbJ9DRHrRlmduPmcrfsG8IngIR1UVcOODzrk0Ki/lqj0h
 kD4/X20f7ZFdoSg9t0mJzNzKJkt6qmOXbInjWCPabhQw7dU83iv3iCkjGlorFc5cZiWv
 qCtPN3gMHsY7g/50DWTwHsyfhMLE0IydttrHeY6vyV9QErLi6r6TBnvjVUyy05ozTw5V
 X4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nNCyu14NpOf2lBSi6vrSm4gSsJKhALhPi0MXBNs/ELo=;
 b=em5HQR8uo/STbDDsk1UQnshgHV+90U4iHfh/5CnQtFUWrwSQwWLNluuHiENJ7fM2Q7
 tSwrBF3fWAfwJWt0BKUbrxz5Db1mWjxXsBGZAB7BU2RB+2P1ScdDxwj/VY1yCZGhLM3G
 +f2WrAG1yKukbZ4zNDaoYVb156x90otnHOK7RaYcScnQ5rEEkwpW1gJXdQ8Hqc9Vz7x4
 gIoKMJ8nY5QGXAuhbRRjp0HM+pVxrg8Tv6FmObVZBjnBwcZg6GF5Tv407tDE10Z0UqEd
 +wLh8EIFJWtK1MCetLhvm9mkfNFY7czfGI8rR4hbFekyb/lFlv8TVD3lg4ZbMY5MWsfQ
 aOvA==
X-Gm-Message-State: ACgBeo3A3YTvJJExmV7x7IjR3a/QQrLfRi1CkQqkJmXO6iEFk96z9cf3
 /oR1cqn3uyyU2DL7ueU6tLHzgQY3E6LAtT5/+90FNw==
X-Received: by 2002:a5b:711:0:b0:696:dab:3efa with SMTP id
 g17-20020a5b0711000000b006960dab3efamr740755ybq.193.1661370720376; 
 Wed, 24 Aug 2022 12:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-11-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-11-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:51:18 +0100
Message-ID: <CAFEAcA-Kv16weckhxM-mQrwiPZa5JMY4YkXcD5UfCzDKr4xGtQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7ciCKWgJEaW

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> dt-validate and dtc throw a few warnings when parsing the virtio-iommu
> node:
>
>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
>   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>   From schema: dtschema/schemas/pci/pci-bus.yaml
>
>   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
>
> The compatible property for a PCI child node should follow the rules
> from "PCI Bus Binding to: IEEE Std 1275-1994". It should contain the
> Vendor ID and Device ID (or class code).
>
> The unit-name should be "device,function".
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Note that this doesn't follow
> linux/Documentation/devicetree/bindings/virtio/iommu.txt, I'll update
> that document when converting it to yaml, hopefully this Linux cycle.
> The "virtio,pci-iommu" compatible string is not actually used by any
> driver and only QEMU implements it, so we can get rid of it.

I'm not sure you can just change the compat string like that,
unless you can guarantee that nobody anywhere has ever
looked for it in a dtb. Also, "virtio,pci-iommu" is much
clearer than "pci1af4,1057"...

-- PMM
