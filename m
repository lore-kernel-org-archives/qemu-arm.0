Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp9886ejb;
        Fri, 21 Jul 2023 01:19:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE8QL7EB3OqzPJYAxmR/d3N0veMvLA72h/GPTN1zsV8YaIUrHPF9ocOF8/EYvc0DagAYOV/
X-Received: by 2002:a05:620a:4608:b0:765:5ba6:a5c0 with SMTP id br8-20020a05620a460800b007655ba6a5c0mr1127940qkb.14.1689927571037;
        Fri, 21 Jul 2023 01:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689927571; cv=none;
        d=google.com; s=arc-20160816;
        b=Yvj5i3VK0sWMBZ5JYLvQAVOTb+X/IFBy+irfXExadtYsRqwkfMTprZqDEuABLq2YK8
         +DbofeTtMwWyWs/NR7h/ia92/BY464Sfg824K5LVEjKEL/aISaVNhA6H/N3zwRDiS+n1
         81VLvCbPcKzWUcSMB6R64OQV1y/ZwFc3aD2axMV2f/9b8rVY54AYqDfgwWJIXk5gJ/PN
         PKmcf630B5kjCrLDC7gezJqeYBxVlAZYgKE42XJDDbFsBvwNsQn/qg2vKKY6pJF5F/hN
         puUPA1fBnStNBxwMV00n4lN+sBiE4kGoykDQpn0m4Rnty7l0DRzCTsU8o5zcAT19hhLg
         RiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pRJy7Tbp08IAiIaPCUWlUMndjI8xNFqSlJ0wmYaxmPo=;
        fh=8fCezNXtf0pzWwITHcRlc1G8GPazjEuloqWTvCHt7Hw=;
        b=i2QCJmiGuV1u6cGHyL9kg5o4VOaiwgazmDaJOvTJTzyme9AEM+4tD0fiYFaK215LSW
         w5dFiOf1G8Mj9DNByYUrb4/yXf8eYuqlAUHfd1NUoAEo8hNkU16s48zAUjmRusLJl8SG
         M4uiYRRkOybrBVOv8sgOw6FVTIvNewmLv+VCYqIgOy7p90ZZmkvsG1H7hNW7ESO7Nqal
         AOLiM7HsAQ2RDhFh4vYXBXIJpEQP051Q514NP6NsNZW7H1cnbQO/rxZAZMXsjVJGfxmX
         xE62N22r7i6FaMBYUDgdL7i0KR0Hdnogoty2zOl4+FdnVAyAHYCPv/mNm3b5I+B19M+1
         5qeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fM/RNXqQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs10-20020a05620a394a00b00767d5b81886si1101902qkn.458.2023.07.21.01.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2023 01:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fM/RNXqQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMlMF-0004q8-Tk; Fri, 21 Jul 2023 04:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qMlME-0004po-4l
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 04:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qMlM7-0003Wl-SJ
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 04:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689927559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRJy7Tbp08IAiIaPCUWlUMndjI8xNFqSlJ0wmYaxmPo=;
 b=fM/RNXqQ1D6MtrLwHgqk4fE2l2ZllyhiJV7VIP5ufrUdvyDQL+mk2hMIdno70Z8QxzmBAa
 oTNjxrlDmJzlj1nrOCi2Y5WwwfmnUA86tPX7qHqaPhlVM7a/4N3YhhUCwQq/LAsiL+K+pB
 CPM1PYrCa6nS/oCQEza2w+nQUuqJf8k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-BnTaY_PHOVC7zY5XwlKLuw-1; Fri, 21 Jul 2023 04:19:17 -0400
X-MC-Unique: BnTaY_PHOVC7zY5XwlKLuw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa979d0c32so9085665e9.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jul 2023 01:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689927555; x=1690532355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRJy7Tbp08IAiIaPCUWlUMndjI8xNFqSlJ0wmYaxmPo=;
 b=LyWM+4sIzoYIa9CzzmiZ6PgvLBYvWxC7CnP+2sZmTEeDfYRDKIjxz7bc12P9iFbfhc
 1XFme4S2aqkweK68iREUvtzONHngxProVtsacCZfulCaLxyA3l/YeFDrcQ9ffED83yO7
 +A0+E+PXs+FO4G+azT5dLwZDi6pf38RzxLuAC9mR2RHx/qif9X5Z85Jzhsdq8tjVhhVN
 CIAcgWOYfXFH8d7BXll36yiOI86R8jXrPuHZataPanKbOlps50QTfxrI+nJsZ8y+Pmnn
 xW325eavn1QMQLOTqpqLi4BHwbGnTowuA4YrQgFv6M/KqL265I05HdKYBLmRLXlx+NVI
 tsmg==
X-Gm-Message-State: ABy/qLbaNFL4VogeMdPR53jsGGdO9GqyZ/ILAqH4i2YwfcVWkzZt9lWm
 cWVf4RMRzvfG9cZ2ay8vqJQDAlZYzO9w9ZztOM120sYMacu9kehX+cuomZ3xaG/KCIg7BosDm4r
 UWO1+Jai8iifK
X-Received: by 2002:a7b:c40a:0:b0:3fc:5d2:1f47 with SMTP id
 k10-20020a7bc40a000000b003fc05d21f47mr809787wmi.20.1689927555242; 
 Fri, 21 Jul 2023 01:19:15 -0700 (PDT)
X-Received: by 2002:a7b:c40a:0:b0:3fc:5d2:1f47 with SMTP id
 k10-20020a7bc40a000000b003fc05d21f47mr809754wmi.20.1689927554832; 
 Fri, 21 Jul 2023 01:19:14 -0700 (PDT)
Received: from redhat.com ([2.52.16.41]) by smtp.gmail.com with ESMTPSA id
 a1-20020adfdd01000000b0031411e46af3sm3490086wrm.97.2023.07.21.01.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 01:19:14 -0700 (PDT)
Date: Fri, 21 Jul 2023 04:19:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH] hw: Add compat machines for 8.2
Message-ID: <20230721041901-mutt-send-email-mst@kernel.org>
References: <20230718142235.135319-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230718142235.135319-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2K3CKoVJLsQt

On Tue, Jul 18, 2023 at 04:22:35PM +0200, Cornelia Huck wrote:
> Add 8.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 16 +++++++++++++---
>  hw/i386/pc_q35.c           | 14 ++++++++++++--
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 79 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc26633a..2a560271b5fc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3170,10 +3170,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_8_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(8, 2)
> +
>  static void virt_machine_8_1_options(MachineClass *mc)
>  {
> +    virt_machine_8_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(8, 1)
> +DEFINE_VIRT_MACHINE(8, 1)
>  
>  static void virt_machine_8_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f0d35c640184..da699cf4e147 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> +GlobalProperty hw_compat_8_1[] = {};
> +const size_t hw_compat_8_1_len = G_N_ELEMENTS(hw_compat_8_1);
> +
>  GlobalProperty hw_compat_8_0[] = {
>      { "migration", "multifd-flush-after-each-section", "on"},
>      { TYPE_PCI_DEVICE, "x-pcie-ari-nextfn-1", "on" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 3109d5e0e035..54838c0c411d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -114,6 +114,9 @@
>      { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>      { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>  
> +GlobalProperty pc_compat_8_1[] = {};
> +const size_t pc_compat_8_1_len = G_N_ELEMENTS(pc_compat_8_1);
> +
>  GlobalProperty pc_compat_8_0[] = {
>      { "virtio-mem", "unplugged-inaccessible", "auto" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ac72e8f5bee1..ce1ac9527493 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -504,13 +504,25 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_8_1_machine_options(MachineClass *m)
> +static void pc_i440fx_8_2_machine_options(MachineClass *m)
>  {
>      pc_i440fx_machine_options(m);
>      m->alias = "pc";
>      m->is_default = true;
>  }
>  
> +DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
> +                      pc_i440fx_8_2_machine_options);
> +
> +static void pc_i440fx_8_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_8_2_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_8_1, hw_compat_8_1_len);
> +    compat_props_add(m->compat_props, pc_compat_8_1, pc_compat_8_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v8_1, "pc-i440fx-8.1", NULL,
>                        pc_i440fx_8_1_machine_options);
>  
> @@ -519,8 +531,6 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>  
>      pc_i440fx_8_1_machine_options(m);
> -    m->alias = NULL;
> -    m->is_default = false;
>      compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>      compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index dc27a9e223a2..37c4814bedf2 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -379,12 +379,23 @@ static void pc_q35_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_q35_8_1_machine_options(MachineClass *m)
> +static void pc_q35_8_2_machine_options(MachineClass *m)
>  {
>      pc_q35_machine_options(m);
>      m->alias = "q35";
>  }
>  
> +DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
> +                   pc_q35_8_2_machine_options);
> +
> +static void pc_q35_8_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_8_2_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_8_1, hw_compat_8_1_len);
> +    compat_props_add(m->compat_props, pc_compat_8_1, pc_compat_8_1_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v8_1, "pc-q35-8.1", NULL,
>                     pc_q35_8_1_machine_options);
>  
> @@ -393,7 +404,6 @@ static void pc_q35_8_0_machine_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>  
>      pc_q35_8_1_machine_options(m);
> -    m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>      compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
>  
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 731205b215b2..a0813f75c060 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -347,10 +347,17 @@ type_init(virt_machine_register_types)
>      } \
>      type_init(machvirt_machine_##major##_##minor##_init);
>  
> +static void virt_machine_8_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(8, 2, true)
> +
>  static void virt_machine_8_1_options(MachineClass *mc)
>  {
> +    virt_machine_8_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
>  }
> -DEFINE_VIRT_MACHINE(8, 1, true)
> +DEFINE_VIRT_MACHINE(8, 1, false)
>  
>  static void virt_machine_8_0_options(MachineClass *mc)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 1c8b8d57a70a..622fea825605 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4752,15 +4752,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-8.2
> + */
> +static void spapr_machine_8_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(8_2, "8.2", true);
> +
>  /*
>   * pseries-8.1
>   */
>  static void spapr_machine_8_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_8_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(8_1, "8.1", true);
> +DEFINE_SPAPR_MACHINE(8_1, "8.1", false);
>  
>  /*
>   * pseries-8.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4516d73ff5fc..c52a1fcf6700 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -828,14 +828,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_8_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_8_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(8_2, "8.2", true);
> +
>  static void ccw_machine_8_1_instance_options(MachineState *machine)
>  {
> +    ccw_machine_8_2_instance_options(machine);
>  }
>  
>  static void ccw_machine_8_1_class_options(MachineClass *mc)
>  {
> +    ccw_machine_8_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
>  }
> -DEFINE_CCW_MACHINE(8_1, "8.1", true);
> +DEFINE_CCW_MACHINE(8_1, "8.1", false);
>  
>  static void ccw_machine_8_0_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index ed8336019801..3b541ffd2472 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -390,6 +390,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_8_1[];
> +extern const size_t hw_compat_8_1_len;
> +
>  extern GlobalProperty hw_compat_8_0[];
>  extern const size_t hw_compat_8_0_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index d54e8b1101e4..0fabece236cf 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -200,6 +200,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>  
> +extern GlobalProperty pc_compat_8_1[];
> +extern const size_t pc_compat_8_1_len;
> +
>  extern GlobalProperty pc_compat_8_0[];
>  extern const size_t pc_compat_8_0_len;
>  
> -- 
> 2.41.0

