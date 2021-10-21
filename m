Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp350324lfc;
        Thu, 21 Oct 2021 06:54:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBmg1w1vpGmmPn1711/n5VM1YMoYWOH2DuVvhpjr3t7IMVm5W25WqHXUkT7DLpNeYIqKzi
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr4196639oia.95.1634824454298;
        Thu, 21 Oct 2021 06:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634824454; cv=none;
        d=google.com; s=arc-20160816;
        b=WNNAE1GSAGLlBzv1wiUppNu0jySnSpkl3VU88HGzsKXbIM2/SFSG6hb8gBHV5g5IWJ
         GBKG5My2AQ49yvhL9Mo9aPIJAzvWvsf4i1oYKg+5avUNqPUdlMGbmFROeNd6cVuvJiFA
         /daa12UfNeVOLG8C0zNexs8o+6bO6v8PKXmkSRxzrgmSDjUwMf0THEOnUpGx7eQw3uod
         f5vS/B4MsDAguhf7A9H8gHyALnJoYNndFq4McZZeO8DRz+U4pjYh0X2WY1G+VGBdm6Xz
         I9sF6OdvgOvI8XT9TO6nbcdK6Ky5/dzHMHNBmmu/v8QBKBQkBJ6rN202rknsvUanymHY
         2y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=KKbyJTdxpEjK5nV0vqJvtMsg5+E7yquIbZbyhZcc8Y0=;
        b=Up297nDbY7xKYvDZAdz9qQAvkkrSubZtA1JrcxEpGYMXsfXeBrGdJ92isBjzcMZpEI
         GnpJpWHnkrqulNMLdGfSk7+R+lmUeEX6l8c9JGygo7Ao/YwnXN990Pz6eqT9NuEvvDqR
         9rxSlZ/j1SDuOZXod9ElxnpsiA0wX3rekABJDrU1wM9zgrY+9LpYxuJRxh4dFkhoupzg
         62KGcSRSdwjmkAlA7hM0M5LzjHniQOEP4TNLZQyktDKwOzhKMWCcJP8BGyWud69z/kZv
         kmjWK7ftXkdakwNBBF0cYHyGP9m+1NHDk3JT9ZJV685V0zmjkOeQ2w9SlNMOtr5seoPf
         XJeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aJ0psL6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l129si5429335oia.63.2021.10.21.06.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 06:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aJ0psL6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdYWL-0004oC-HH
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 09:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYVV-0003GM-31
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYVT-0006Ez-61
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKbyJTdxpEjK5nV0vqJvtMsg5+E7yquIbZbyhZcc8Y0=;
 b=aJ0psL6eKI1k5/v7crNjM+hzQ0DwjwBGfyR+j145k5CBbIvoaM6fDbtINlLhBssW3LPhQV
 z7ZBrbsyX5KrWLxPGq8MsypQP4NRtBMxzjiCPveKfCjUUoTicvUu3BKRyK2au7fuonDxE2
 UF17b/srefecoOb+0oeTtrbypFCzLV4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-oY1AtUeEM5aXmqfMEbc9aA-1; Thu, 21 Oct 2021 09:53:17 -0400
X-MC-Unique: oY1AtUeEM5aXmqfMEbc9aA-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so398226edi.12
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 06:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKbyJTdxpEjK5nV0vqJvtMsg5+E7yquIbZbyhZcc8Y0=;
 b=f+HpvUGKR9mi/QvdY7DhCLOvijTI5y5E9U8wnUad+MeeBIP2QSU3wCrHMkEb02tfTe
 wBniAz1Hh30rK4p2QEfHKkyncokUZq2fWjbRUAiB/7eVJbIQKr2FIqeknFrownmv4pu4
 +6rxhM9CuD46FXf0N8AN9OIGHaSbOvStz+04+4j3wEb98V7Zzm1Q851S4bSpa7Mw5yuq
 RV8jCU87JMTDcmJyxqAWPtwbcyM3FSBGuWZDsH3BpFFqv5ckRWR9Pvv27mhBzP0dthlC
 40WjQu/AL3GiOBdPp11CyghD8VwKbZ2k5JlmOYJ9B/OCL59zaLrhQ3OIHEp/9F6+BgYG
 N00A==
X-Gm-Message-State: AOAM531mwPm4r0L3c2WbLwpLktgaCjhPx2RegfcWuc2KjgQJnCehqPj5
 EThysKivyB//R9QQDVYOkmYcaGGFi41X+zLkbVZyoJK6D2KVc6ZPtinEu1hh9OFZ0zf3gBf3O/p
 dCsTHR5EK1MMV
X-Received: by 2002:a17:907:7e81:: with SMTP id
 qb1mr7382882ejc.65.1634824395928; 
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
X-Received: by 2002:a17:907:7e81:: with SMTP id
 qb1mr7382832ejc.65.1634824395718; 
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a13sm2545230ejx.39.2021.10.21.06.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:53:15 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:53:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 06/12] hw/arm/virt: Remove device tree restriction
 for virtio-iommu
Message-ID: <20211021155314.1ccd3999@redhat.com>
In-Reply-To: <20211020172745.620101-7-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-7-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aHAQoco2nA6X

On Wed, 20 Oct 2021 18:27:40 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c | 12 ++----------
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f7f456bf58..3da7a86e37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2561,16 +2561,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>  
>      if (device_is_dynamic_sysbus(mc, dev) ||
> -       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> -        VirtMachineState *vms = VIRT_MACHINE(machine);
> -
> -        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) {
> -            return HOTPLUG_HANDLER(machine);
> -        }
> -    }
>      return NULL;
>  }
>  
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 770c286be7..5c0b87316a 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,16 +48,8 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> -
> -        error_setg(errp,
> -                   "%s machine fails to create iommu-map device tree bindings",
> -                   mc->name);
> -        error_append_hint(errp,
> -                          "Check your machine implements a hotplug handler "
> -                          "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
> +        error_setg(errp, "Check your machine implements a hotplug handler "
> +                         "for the virtio-iommu-pci device");
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {

