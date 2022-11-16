Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp529379ejx;
        Wed, 16 Nov 2022 07:35:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jK2wa+jtWnImFjptN+0GU1xoEBGjEanErsgM2+GtU5nPhjhc63VRTloWuYhpkTSleTdPk
X-Received: by 2002:a0c:fa0f:0:b0:4b4:7ac1:aa38 with SMTP id q15-20020a0cfa0f000000b004b47ac1aa38mr21560785qvn.84.1668612929550;
        Wed, 16 Nov 2022 07:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668612929; cv=none;
        d=google.com; s=arc-20160816;
        b=dsWQ3Qu7yCEbRKiZgpIptGYPG1jGXih7Yvs4rNGZWO2/Q550fE5TcyXBr50jqc3dUk
         b9xNy2zdsnTjVhoUPDqwiT0VWd8DxTmMkyIp0rdf67NiBTp0RBTG+E4Fpsm5RzTTUBeY
         uxwQKqmVxuTm5OkWpngmRNfW/EFLMds7j56BOUYnwRhwkmzMjtsTOydfE8O8RD6VDS3F
         1LCm/wUt/nR+rtKINzMWkbHt7K/2qF90kc0lmZK0ysWmvzYvirc+uyPSvUNMci6dsyHK
         h0VFoEI8XJ3z7B7Ti3HmOH1aDdM09xaLEcU/droLbhqQQdNNJIIYnw1B7CRebVgwR0Nw
         CcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=j9i9Cxxmb674dr89ttZ5gU8/VkxeXeHN928+IK9XUhA=;
        b=ysbItvrusAnrZSv/0RbuDTBuAnTsJmSM071QQRX6srhuHpXQOU9mRhOkm9N3G2LX+u
         1v9tgPb15rsEetx/2qr2tfDd4XcZcVyEHjCAEx3zdHCBVXwojsZ0Ig+4fphTbYlBFJRF
         wPPu+oqyVm/0reMwX01LQrflStHlr7aoWmeHsGgG3MzjDC/YLyLDBol8VrzyO68Cx9Ls
         x/cUgViHpQcA1EJrrZKncDzUmzyfRWxxsLICOn4PW4KfenBjkdiNo/oyx0W2x2tbfL7Z
         rmHQwZmNsBay7+4hI3OoPrAMfpPsyzp+SglWm/MOaN92ACO/3T2NPlCUmhjNOd+OoGHl
         AuUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQyPJZ59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a146d00b006f981898519si8065874qkl.50.2022.11.16.07.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 07:35:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQyPJZ59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovKRZ-0004NK-Tb; Wed, 16 Nov 2022 10:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKRY-0004Lu-HC
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:35:16 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKRW-0005y3-Po
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:35:16 -0500
Received: by mail-ej1-x629.google.com with SMTP id gv23so12263561ejb.3
 for <qemu-arm@nongnu.org>; Wed, 16 Nov 2022 07:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j9i9Cxxmb674dr89ttZ5gU8/VkxeXeHN928+IK9XUhA=;
 b=sQyPJZ59Tkb3+DuwPdhxl+U+4U97KF5YuTSihpfAo0Vii2u/hgRWHyjdUcbq+B3ktY
 xY4Pmy8qWUpvx5mLV3q5kE5wwqDKOIiD5Ai3L9/lkqpxDpFFgYGgtwr3+N/dGbYFN/zc
 Km4yR08Qygs+DXp2PxpF8EVINM67ity3PUMIuvjK1V4rDHjKWUjDLsRo6Icrkzs0weKQ
 pV99aff5wfQuXx+67yWRLGVELQtevV/FTXTFjRwaJrzCpU9a9EC/hMNeWu4CjE4QPrmq
 RGhxeGNyeF6AwcpKE4lTGnmnG/KpV/TpWQO/R2Uspcvi8sG9Vm91qRfZt75fpxZgnMmT
 UZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j9i9Cxxmb674dr89ttZ5gU8/VkxeXeHN928+IK9XUhA=;
 b=m1jETTzbg35VOiAn1tiAI0ue/Zb2AsXxbSkdhE0XUseWh1KjgwuJmI2asG5fdrWagh
 1sZLvelAzLNOVx7jq0XfoTCNgKvrpq52YI03HQDUWRqDrEggZ/6geSU5jaIiiZFybBqL
 SL/VsfBrEIt4ErnQ8OVUUDtsQgKBfyNLnpP+lcyWTLMpvWLl2/UbIiDoreIUCv7s6gFA
 Spe1VxVaIs6PFOREzTaPSywjIAnE8squhA2oEhCJKR85KR/2hkCCSe4BWkaPSz22AxG8
 gbLpG4kNbOy31wnKLhh2VR3KJOYuz5VYRi2XcKc5dSOeESOo26jeCcSPJi50I3Z8RRwR
 YnEw==
X-Gm-Message-State: ANoB5plCr4P9EJM4NIzO7tbHYc7stzsrSorw6xwN24E33wKJxKMpvQ5t
 la0nwzJ4zdw0UjI0mBVZ6z46mw==
X-Received: by 2002:a17:906:5ac6:b0:7ad:ab0e:76aa with SMTP id
 x6-20020a1709065ac600b007adab0e76aamr17679736ejs.435.1668612913335; 
 Wed, 16 Nov 2022 07:35:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b00731582babcasm7054385ejo.71.2022.11.16.07.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:35:12 -0800 (PST)
Message-ID: <894b767d-b071-a37a-db61-9538d63e00dc@linaro.org>
Date: Wed, 16 Nov 2022 16:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] pci: drop redundant PCIDeviceClass::is_bridge field
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-3-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116152730.3691347-3-imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: eL6rfB6LsZId

On 16/11/22 16:27, Igor Mammedov wrote:
> and use cast to TYPE_PCI_BRIDGE instead.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   include/hw/pci/pci.h               | 11 +----------
>   include/hw/pci/pci_bridge.h        |  1 +
>   hw/acpi/pcihp.c                    |  3 +--
>   hw/i386/acpi-build.c               |  5 ++---
>   hw/pci-bridge/cxl_downstream.c     |  1 -
>   hw/pci-bridge/cxl_upstream.c       |  1 -
>   hw/pci-bridge/i82801b11.c          |  1 -
>   hw/pci-bridge/pci_bridge_dev.c     |  1 -
>   hw/pci-bridge/pcie_pci_bridge.c    |  1 -
>   hw/pci-bridge/pcie_root_port.c     |  1 -
>   hw/pci-bridge/simba.c              |  1 -
>   hw/pci-bridge/xio3130_downstream.c |  1 -
>   hw/pci-bridge/xio3130_upstream.c   |  1 -
>   hw/pci-host/designware.c           |  1 -
>   hw/pci-host/xilinx-pcie.c          |  1 -
>   hw/pci/pci.c                       | 20 +++++++++-----------
>   hw/ppc/spapr_pci.c                 | 15 +++++----------
>   17 files changed, 19 insertions(+), 47 deletions(-)

> @@ -1090,9 +1088,10 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>       Error *local_err = NULL;
>       DeviceState *dev = DEVICE(pci_dev);
>       PCIBus *bus = pci_get_bus(pci_dev);
> +    bool is_bridge = IS_PCI_BRIDGE(pci_dev);
>   
>       /* Only pci bridges can be attached to extra PCI root buses */
> -    if (pci_bus_is_root(bus) && bus->parent_dev && !pc->is_bridge) {
> +    if (pci_bus_is_root(bus) && bus->parent_dev && !IS_PCI_BRIDGE(pci_dev)) {

Can we use the recently assigned 'is_bridge' variable?

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

