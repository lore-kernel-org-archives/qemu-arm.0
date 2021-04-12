Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4117065lfr;
        Mon, 12 Apr 2021 10:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTZHLCqK+qDtGIyjq4GN+YU2CJ9gVZFZvDYLSr3w4Ksb6Eroz53II08vWooHDksk7qnBOk
X-Received: by 2002:a05:6602:1612:: with SMTP id x18mr5140917iow.139.1618249220303;
        Mon, 12 Apr 2021 10:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618249220; cv=none;
        d=google.com; s=arc-20160816;
        b=yF+kY+X8FaGalaG0l6s1V6Oa/7QscJuP1AiydnqHNHcBEuhKpC8dchZ1nkDX9Uziah
         ALyIV8kovcfH2uOJlUsxDFJh198FubcHyXI73EhEfmzqtYaYiGGZmmuqwQw94gt78pwX
         NMhtM71Xnd9WJp1yYKWL65RS0KzHtabutBkg9F1xLT60u4E1IpnZ+CpKSa1gd1BEYY2o
         CGcvIG2EsFsFpPs9iUBIydDjGhtDHB6Zf4mWVM61MuQB6zY3ePBvjgeEtesFkVecuO0E
         bdBjeHvN09q6/gU4bjj3ul+M2ktaAv8W25u2yoUCqELG0dDBJu3H+BwEtI4+GRUEJnV9
         DzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4+N+7OwhljdlDmpJLpWgAJJQkdbv/M0MBl40nREhMYU=;
        b=bKeNpK3+3grIfKdoxx0j7tHiOcrsOlD+PZ8VulD5W/XjH42SnxdFi7oFIAvBHRDu/8
         Y5FKBRO4M44wXjfc5/j3UGZzKQVMo6wIXecXh3Ecbz8lhDBGKyrCxkFZ8rIFpFi7VTkb
         p8ut/DDV6TkgX+YZlbW2lFyoiE2Q6cr76i6BnPtpdWoJBS1sOO0a6bB+w/lwdeDX8im8
         Jdw/8d1Yaat9rZMlEz3TjxzxF34xg5HY8+l3UsDtZz0kUZ2gB4nrH2ahfi9rWN43G/BX
         SYB63ujjfXggz8dXD45f25lozfYi6G1CJ91/ao1F24lqkn9d7taaEE4d6Wla4168tlHA
         f6Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KqXBdl+M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si9669554ilg.18.2021.04.12.10.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 10:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KqXBdl+M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW0Xr-000774-JY
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 13:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lW0Uu-0006AM-A1
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lW0Uq-0005vG-5W
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618249031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+N+7OwhljdlDmpJLpWgAJJQkdbv/M0MBl40nREhMYU=;
 b=KqXBdl+MpxNfhTufexmOtQSxMCszXJei2o2VpjALEN+IMNCKUCg7u82xxoRczF1oBk2huJ
 Lfi02NiLvv6gJATOXiMZSMkrdLjOWqFHhKsJ2KES4/leE1yj3nvZ2afG8NjBiaRLg+XMEc
 R1EMa0RCPBZ97auI9T67NDDM47sAJ2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-AYNEShb9MNCiKPxJlu_Trg-1; Mon, 12 Apr 2021 13:37:07 -0400
X-MC-Unique: AYNEShb9MNCiKPxJlu_Trg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67CF18766D4;
 Mon, 12 Apr 2021 17:37:05 +0000 (UTC)
Received: from [10.36.113.253] (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B8E5D719;
 Mon, 12 Apr 2021 17:36:58 +0000 (UTC)
Subject: Re: [PATCH RFC RESEND v2 1/6] hw/pci/pci_host: Add iommu property for
 pci host
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-2-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6e6a276f-86b2-2f32-f3e0-9552f3d28a21@redhat.com>
Date: Mon, 12 Apr 2021 19:36:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616656965-23328-2-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AnRB1u1k39Il

Hi Wang,

On 3/25/21 8:22 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> The pci host iommu property is useful to check whether
> the iommu is enabled on the pci root bus.
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci/pci.c              | 18 +++++++++++++++++-
>  hw/pci/pci_host.c         |  2 ++
>  include/hw/pci/pci.h      |  1 +
>  include/hw/pci/pci_host.h |  1 +
>  4 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index ac9a24889c..e17aa9075f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -417,6 +417,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
>      return rootbus->qbus.name;
>  }
>  
> +bool pci_root_bus_has_iommu(PCIBus *bus)
"has_iommu" is misleading as it does not mean an IOMMU is actually
instantiated but rather that if there is any, it will translate
transactions coming from this primary bus

I would rather inverse the logic and have a

"bypass_iommu" property defaulting to false

and this function dubbed something like pci_root_bus_bypass_iommu
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
> +    return host_bridge->iommu;
> +}
> +
>  static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
>                                MemoryRegion *address_space_mem,
>                                MemoryRegion *address_space_io,
> @@ -2716,7 +2732,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>  
>          iommu_bus = parent_bus;
>      }
> -    if (iommu_bus && iommu_bus->iommu_fn) {
> +    if (pci_root_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>          return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>      }
>      return &address_space_memory;
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 8ca5fadcbd..92ce213b18 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
>  static Property pci_host_properties_common[] = {
>      DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
>                       mig_enabled, true),
> +    DEFINE_PROP_BOOL("pci-host-iommu-enabled", PCIHostState,
> +                     iommu, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6be4e0c460..718b5a454a 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
>  
>  PCIBus *pci_device_root_bus(const PCIDevice *d);
>  const char *pci_root_bus_path(PCIDevice *dev);
> +bool pci_root_bus_has_iommu(PCIBus *bus);
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
>  int pci_qdev_find_device(const char *id, PCIDevice **pdev);
>  void pci_bus_get_w64_range(PCIBus *bus, Range *range);
> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
> index 52e038c019..64128e3a19 100644
> --- a/include/hw/pci/pci_host.h
> +++ b/include/hw/pci/pci_host.h
> @@ -43,6 +43,7 @@ struct PCIHostState {
>      uint32_t config_reg;
>      bool mig_enabled;
>      PCIBus *bus;
> +    bool iommu;
>  
>      QLIST_ENTRY(PCIHostState) next;
>  };
> 
Thanks

Eric

