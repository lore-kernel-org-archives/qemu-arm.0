Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp279246lfa;
        Wed, 2 Jun 2021 06:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLI/+UjSMvTKbh7sD+5T/+SWlWYZCR8Ph+wK8Fg78rnwD2fEfkcG2acks0N8CQTxfEFMHZ
X-Received: by 2002:a17:906:7fc5:: with SMTP id r5mr16750243ejs.474.1622639010340;
        Wed, 02 Jun 2021 06:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622639010; cv=none;
        d=google.com; s=arc-20160816;
        b=vTJhJqJuo19doZkuhrtwlJlArwYg99oSqxM771LhHGy1+RAr/NR9O8OjkvGKY5OzNS
         K15lExhQ43/hvC5tUP0b//LllZMO3N9HHkMnVpJsjFFM0I8iDss9VpGa3Z1vLdRyyAXl
         OzE7DitDC06iK3gIVwNSF7k8dlEi1DCu/MLmvVNbr4w6EGZ46PeBw4nnyRPSR12eg5c8
         YaQWK7FamSJ7U4579M+QFaHF1RiDJlT1wfxHpRMe/I+vRtXiq9DKQEOdPKgcqrc3IkHF
         MDA0+zubmn17P0jQm35eT+kk/eL49+MA9RmBA4nEn2YRJIwOuYoTv1ocVAdrgC9euF/B
         BP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gknU4n/A3Gn4WaJU0OiXa0O+9VSIyIia9iAzgmbs+HY=;
        b=qaezwU43BVM7r6nhrHPp9z7zAsq6Vw3fTD2FrQFIXBVzuMf4+Cmu6ak6cV03MACEJ3
         WYBVlojBpBzY0Etufe0CHKNHjqfxPBYg0YguuwIvcGn40yZZNm6wUCwlBD8Nuzih+9yS
         kVJ/uRKI2zatn4Rcz4496VBgo2qeXZZGxWBnmiN9lywjr0igVZ6WRquAK9GsWzgYV17k
         GNtwywxSWZNcNNWvUluBaT6sWBbZy3h9KtwBFma5/pwcq7jl/qrWEWZPGq0g5d4eqfto
         7vlkr8NhFaPevJbEGvlmXv5nhc9/4EKxWDqyowZfOltDL6vpfB0dWAlCK7LZWVGgdNZt
         lXgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eVJZC4fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si2321324edb.271.2021.06.02.06.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 06:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eVJZC4fA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loQWv-0001ul-FT
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 09:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loQWk-0001ry-D8
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 09:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loQWh-00061g-Vf
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 09:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622638995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gknU4n/A3Gn4WaJU0OiXa0O+9VSIyIia9iAzgmbs+HY=;
 b=eVJZC4fAiQBayS3UqT8Y/FnGvK8p3kXgaKTiz15g2W+1UCyD4gOQtB2X44k5F1gSTB6l9X
 Ti/TDuML/xwipi/XoD4hofOH/MUX7HhMeaivEYY+zBcrnZ2/0JVZ1QSFq0vhLl2Kcd5LNl
 w3702zS323ongFW7iW7toS+PYv0O+mo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-sMKNcwRkOyWCYRFDQr8fpA-1; Wed, 02 Jun 2021 09:03:04 -0400
X-MC-Unique: sMKNcwRkOyWCYRFDQr8fpA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so981871wru.13
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 06:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gknU4n/A3Gn4WaJU0OiXa0O+9VSIyIia9iAzgmbs+HY=;
 b=jl/8mjS+ag5ndIGEpT2r+Uxswz0HerohSrYshoNFshl/g1VVsiGk8QdM7IcKzasmEJ
 cpE9wi1QFOVV0gZTdUlYl9N3pasbHqwhqasDZ8VM7ChuQewE/MaWQGI5Re4VcDSkXc+s
 bmi1+/bFnDgcSxZtuk814vO7ctRwon6delEqw2UZaB6hd9wZfDfqub+F5VaQ7XJotXKv
 tQhfc6fJOG10gO0ZyPxq4EIc1fCT8H/7qP8NnZ8Hq90Oe8QjQ5s1sEVwkorihfEHsgqX
 9CCOFJz0X6FoUJDfx08eXdGaCI/NdFErhyAlzit+DIQHFGB9R0LA+s7SKdrJIp1Mc9Id
 GGyw==
X-Gm-Message-State: AOAM5314LIzEZvbVeHWeTWtjhhMoQIOPgikwul8drdrGPHl3yMZ2c7cj
 BkDRl2jPZi5A8P5HJZ7D7yLXQutQR/4RwI7Dvqqo+xWpubgMt2VBBTMzkMzmhZ1xxp3Mkg9rttU
 oZbKbKrtfh7PB
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr5263383wmq.112.1622638983491; 
 Wed, 02 Jun 2021 06:03:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr5263349wmq.112.1622638983268; 
 Wed, 02 Jun 2021 06:03:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id a12sm2608336wmj.36.2021.06.02.06.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 06:03:02 -0700 (PDT)
Subject: Re: [PATCH v4 5/8] hw/pci: Add pci_bus_range to get bus number range
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <edcf80ec-7f91-b986-047c-a87c8cc7d669@redhat.com>
Date: Wed, 2 Jun 2021 15:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-6-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: xieyingtai@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QitQRYfPBqpM

Hi Xingang,

On 5/25/21 5:50 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This helps to get the bus number range of a pci bridge hierarchy.
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/pci/pci.c         | 15 +++++++++++++++
>  include/hw/pci/pci.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 27d588e268..7f18ea5ef5 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -537,6 +537,21 @@ int pci_bus_num(PCIBus *s)
>      return PCI_BUS_GET_CLASS(s)->bus_num(s);
>  }
>  
Add a doc comment such as "returns the min and max bus numbers of a root
bus"?

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
 
> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus)
> +{
> +    int i;
> +    *min_bus = *max_bus = pci_bus_num(bus);
> +
> +    for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
> +        PCIDevice *dev = bus->devices[i];
> +
> +        if (dev && PCI_DEVICE_GET_CLASS(dev)->is_bridge) {
> +            *min_bus = MIN(*min_bus, dev->config[PCI_SECONDARY_BUS]);
> +            *max_bus = MAX(*max_bus, dev->config[PCI_SUBORDINATE_BUS]);
> +        }
> +    }
> +}
> +
>  int pci_bus_numa_node(PCIBus *bus)
>  {
>      return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index f4d51b672b..d0f4266e37 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -450,6 +450,7 @@ static inline PCIBus *pci_get_bus(const PCIDevice *dev)
>      return PCI_BUS(qdev_get_parent_bus(DEVICE(dev)));
>  }
>  int pci_bus_num(PCIBus *s);
> +void pci_bus_range(PCIBus *bus, int *min_bus, int *max_bus);
>  static inline int pci_dev_bus_num(const PCIDevice *dev)
>  {
>      return pci_bus_num(pci_get_bus(dev));

