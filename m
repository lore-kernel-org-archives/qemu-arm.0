Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp245106lfa;
        Wed, 2 Jun 2021 05:18:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYlcgiaugDLp4y1zjhgwI7WCZ6amxzcxuF1JG2QNNjpRf9DF7By0bNVmnyvvxpZbJBLlXw
X-Received: by 2002:a05:6402:3488:: with SMTP id v8mr2652677edc.124.1622636332012;
        Wed, 02 Jun 2021 05:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622636332; cv=none;
        d=google.com; s=arc-20160816;
        b=DuwpEKxTPzq6is/vRZqg0K3lOk+HfqQgMKlFaf/PLyQL0tMXOQbtGj8RX05OXWIsUr
         xA8fvK3lgUhpZQHoNPePXFGtpEDs53do9uZF+kE82IQExLqHp3oEppYY6b7mXWTWhKDf
         KkdXImMK7IykZAiim2zlS1MDDxB0mfNQYP9oD/XhQaQd1CGd3Q1VpfMqkq0dCrS385aW
         VQR1GGcvX/xwN9clqPD88VKAp66D5rHqUmjLbIEnrKxxDzLF1Vh576bRAyXSqGSvUTV2
         WDikHlQiNlLOVNtzXnNHD8QZBF5vGYyEpOgSr+ZsemLq0rHqn153xVRUXdiUTTtOxK1p
         G2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from:dkim-signature;
        bh=XsTzgwSfJ12II6PARQ4srbEiUlQ/OEvvSlUQ0SnylPk=;
        b=dkuE8rxfFyAz9nW/QpczWE7lr8+JYZlDPYVSiRs/NfkgtLJptaGgFtnlnmVS/h8PWP
         +BtWZLBWmOor8PKkrRr2LOvBXDchJ7RX6I0iS6SBSTaWjKlA6lmsEje13ZGZVaYXKZdG
         VCXAkbC2drZlpRnJD70S+pQoqkQ0gGtwYF4Ud+yeGxqfAZYJLxFa8z4dvxotzqKPejMM
         kv5jYA/xye9HolSK6DVQN1UyVjQFc+3srjIPqG0sm0LnZlO5CWwQb8cUXzMnqQNbY7pq
         E9G2Qsa9CYMznrBrx7k7qKbim1eKVXISAzoh68qbMgo3C3YqTL85Wo/stGLWWVuvecju
         7/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="U4yMX/XL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hd11si7166921ejc.83.2021.06.02.05.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 05:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="U4yMX/XL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loPpi-0001CF-WC
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 08:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpY-000178-BG
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpV-0004fF-DZ
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsTzgwSfJ12II6PARQ4srbEiUlQ/OEvvSlUQ0SnylPk=;
 b=U4yMX/XLIkzQyKPKhZ/XP7fNvqyhk5bTOCLNMLjLBjD/ZpQwawPLgzgdcjAaYpp3sgNqtv
 tViuNRQ3FbHXl+AAvkk0f6wrj4y135s1+QPeK8jPc7UlcTWPrmbABvnN0oLWqYKWiVckIz
 zjAurN+4EbFr92NzzQPmAVQQMCdxLmQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-aeXhvH3YP8u3-cX3XAZ4UQ-1; Wed, 02 Jun 2021 08:18:33 -0400
X-MC-Unique: aeXhvH3YP8u3-cX3XAZ4UQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so2124274wmj.4
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 05:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XsTzgwSfJ12II6PARQ4srbEiUlQ/OEvvSlUQ0SnylPk=;
 b=JPK7TIoDtUPms1q7e58gA/MKmpi2bE70Zr6D5COT7kk90rBloDn8GatoJcCm4Sv2Kv
 CzAcVhu+rvUcgk3ob/mYV+8fC1np15PmtsYmRIdaCURtdd4pnnMBXJfHP/SISzbfaUDb
 bL5m4XPZo7JEg2dQ6CuxQRDLN1KRO/jjlnMzTfLrUXyRmnb2k2Dl42fx4CKJWA6BfKtr
 MI2UG1ykBilFiSW2oEVr3a0XwAK9VO+S0xjhiajrFLkh49GBsdJEdJ9CEg+wr4KzmGMB
 Um7vwfpXVNaZWnRxiem8LyU3WpWVFt7cZICJmIx+8EFXIswNt5mFOXnYl9hAUJzpvLup
 lRCA==
X-Gm-Message-State: AOAM530JSRvQhb0Az3oV70Z6MDLZtywWQjcURhX8ZblCoQTV4AulDYV5
 idc8/6eMCTy4U9MlJfJMgoQe/Tq3KdBlH463CcRZEjIg+UGA+JHTjcThzBYbvlWG1eX+pgnnr3F
 JzkHFhZKFUeNn
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4920237wmk.3.1622636311868;
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4920219wmk.3.1622636311671;
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id g10sm6484279wrq.12.2021.06.02.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:18:31 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/8] hw/pci/pci_host: Allow bypass iommu for pci host
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-2-git-send-email-wangxingang5@huawei.com>
Message-ID: <4fed8139-c5f0-8b96-4b98-69374d31c10e@redhat.com>
Date: Wed, 2 Jun 2021 14:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-2-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: K0DUeqffNGLj

Hi Xingang,

On 5/25/21 5:49 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu property for pci host, which indicates
> whether devices attached to the pci root bus will bypass iommu.
> In pci_device_iommu_address_space(), add a bypass_iommu check
> to avoid getting iommu address space for devices bypass iommu.
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/pci/pci.c              | 18 +++++++++++++++++-
>  hw/pci/pci_host.c         |  2 ++
>  include/hw/pci/pci.h      |  1 +
>  include/hw/pci/pci_host.h |  1 +
>  4 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 377084f1a8..27d588e268 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
>      return rootbus->qbus.name;
>  }
>  
> +bool pci_bus_bypass_iommu(PCIBus *bus)
> +{
> +    PCIBus *rootbus = bus;
> +    PCIHostState *host_bridge;
> +
> +    if (!pci_bus_is_root(bus)) {
> +        rootbus = pci_device_root_bus(bus->parent_dev);
> +    }
> +
> +    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
> +
> +    assert(host_bridge->bus == rootbus);
> +
> +    return host_bridge->bypass_iommu;
> +}
> +
>  static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
>                                MemoryRegion *address_space_mem,
>                                MemoryRegion *address_space_io,
> @@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  
>          iommu_bus = parent_bus;
>      }
> -    if (iommu_bus && iommu_bus->iommu_fn) {
> +    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
>      return &address_space_memory;
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 8ca5fadcbd..2768db53e6 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
>  static Property pci_host_properties_common[] = {
>      DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
>                       mig_enabled, true),
> +    DEFINE_PROP_BOOL("pci-host-bypass-iommu", PCIHostState,
> +                     bypass_iommu, false),
"bypass-iommu" may be sufficient.

Besides:

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric

>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6be4e0c460..f4d51b672b 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
>  
>  PCIBus *pci_device_root_bus(const PCIDevice *d);
>  const char *pci_root_bus_path(PCIDevice *dev);
> +bool pci_bus_bypass_iommu(PCIBus *bus);
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
>  int pci_qdev_find_device(const char *id, PCIDevice **pdev);
>  void pci_bus_get_w64_range(PCIBus *bus, Range *range);
> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
> index 52e038c019..c6f4eb4585 100644
> --- a/include/hw/pci/pci_host.h
> +++ b/include/hw/pci/pci_host.h
> @@ -43,6 +43,7 @@ struct PCIHostState {
>      uint32_t config_reg;
>      bool mig_enabled;
>      PCIBus *bus;
> +    bool bypass_iommu;
>  
>      QLIST_ENTRY(PCIHostState) next;
>  };

