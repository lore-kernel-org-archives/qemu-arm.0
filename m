Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp535208lfg;
        Tue, 17 Aug 2021 06:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzX/o8wGSm3TDwT7acv48/fDA/EJcqPFMYbMmZskkCxsYC7498t+AMtZs5dC14mBzH3jqG
X-Received: by 2002:a67:6d84:: with SMTP id i126mr2962029vsc.2.1629207767581;
        Tue, 17 Aug 2021 06:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629207767; cv=none;
        d=google.com; s=arc-20160816;
        b=RrsoO/wfpxEsdttloIuECa2bzsGnGg9qqAjr+NTJ3geaHXatn0/ZM707r1JF2SLAZ9
         68uYbnczP2inbV652MsH88pR2vwUaCbst7FJtCfoadMlvVkLuMsx7iiOV451efyrNbsq
         5gJNo7EVkZHO6oCWdV/boQnYEwRitf5zuZbnY5wT2b09/mXy0Pt2/F1aainjXf6x+RX9
         3CMOH0rYBxdUWML1ZxLhMiQp0AA7dHawAyiMYhENOuIawMywE02l2qe5T8QcmhL/NksI
         xGoSsZSqmg/sJDNwHSxwaPYQ5XSrP5452/HmZUatdVeZ29TWxrU9CjSox8QGRrU+3pcn
         vTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oDqNSsdnUHRPHHMpK2HTyaEYbQzH/yLDOUFEq8H+JjU=;
        b=p9fJWhyU6wQIEz0BUsAD/u/kN4Y721fs0uTynLVxAbUNNtD+nF5qOruEOSXV04VEpD
         mJxqe6QHHMPGcaRZx/i3Lce5oQqiHJi/feTpNedur2hxXk0ZvYISawMiPPOELBD8eubS
         F/wLtbj3kbKO8PAr3ICqGBnX42hcEKeHKZDwQ6FFzQb1t7Juz+5j3+8n+aOFgrLrms+d
         MbEGl67hKshVc1HX32uOZcSOvdL9yDmg5jz8Q6Zatwr0S/YAYOh8ptmv0+5gGgHcIUyi
         wLCjzBXGroslrdh1pd9YPXLTuOjNdAZg7oGizUZ/jF9fV9vK+z963THRq9Di7//E1kIj
         mzpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z1Neipaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si1253696vsr.66.2021.08.17.06.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 06:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z1Neipaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFzMc-0006HX-Le
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 09:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzMR-0006EG-6g
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 09:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mFzMN-00085e-5P
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 09:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629207748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDqNSsdnUHRPHHMpK2HTyaEYbQzH/yLDOUFEq8H+JjU=;
 b=Z1Neipaa09dqdwhinEco5lXPZzr8ilx8/zZBgKBhRbLM3vxlUP2sCS+k92Nf0XEYGX7hip
 sfMX82GewM1pcjl1WgPZn9o32lSZgGZ26MWeLAHl/zvRhMIeXLZm5Yt+CfTJB9lOqO048T
 kSaWlLsYS/7wRfv7W/IjqhOq/jHG13U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-snb-CHoWOk-hhyNomeNpeA-1; Tue, 17 Aug 2021 09:42:28 -0400
X-MC-Unique: snb-CHoWOk-hhyNomeNpeA-1
Received: by mail-ed1-f70.google.com with SMTP id
 ec47-20020a0564020d6fb02903be5e0a8cd2so10620303edb.0
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 06:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oDqNSsdnUHRPHHMpK2HTyaEYbQzH/yLDOUFEq8H+JjU=;
 b=OUkt6jE4IJyLYKjlVPPpoEas/pdMfgma4zzhdyCqyYi5VLYeF15v6I+eLz/DTgAMY7
 uSrG5d+TQ+bxEtdtVCU2a78SxQRjZSi7mG3VP2jhbAB1XBfjh7W8mg9CjAcsPLtaxA0E
 z5Dwz2EUkgjfWFvZDL6yW9mmvEbSTIabZOORjOFkDVbTMacjyJ/tyzo5/3yQ4KXXXLXX
 Bha7jEl9q8dmWAUZFo1EE1Uat1kypKfhrrX6rCvGzJ/m/f58MQop5M59wSDTZLUwc+NV
 KpJGWF6ccvyEblnBJZIC0/ll0kIrA+k6hS3Izq/uUglKPL35BiZlPMkP0/Qk5yCEeS4L
 vLSQ==
X-Gm-Message-State: AOAM5303yxwc1kIHutRZj4rG52C/LydfrfVbUA2VvoJoPWQToS9zqDiK
 sKO97Gm/q9RHOeSHAS0cxFwnLTlCKV4WaGMDxaOcVyENoEbtyhzHxy5Qt66F09pw6AhDJh4SI92
 yl9HZ5Hwd5FgFPGR8F6Q++iiJh4WBxEly7vDUsueMKlW1aUBXVEDdr51cLi2hk9fZlik=
X-Received: by 2002:a17:906:378e:: with SMTP id
 n14mr3979162ejc.12.1629207746100; 
 Tue, 17 Aug 2021 06:42:26 -0700 (PDT)
X-Received: by 2002:a17:906:378e:: with SMTP id
 n14mr3979124ejc.12.1629207745786; 
 Tue, 17 Aug 2021 06:42:25 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.36.144])
 by smtp.gmail.com with ESMTPSA id d16sm1096150edu.8.2021.08.17.06.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 06:42:25 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
Date: Tue, 17 Aug 2021 15:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810084505.2257983-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVYi9v00RvKi

Hi Jean,

On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c |  7 -------
>  2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..b4598d3fe6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2551,16 +2551,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
> index 770c286be7..f30eb16cbf 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> -
> -        error_setg(errp,
> -                   "%s machine fails to create iommu-map device tree bindings",
> -                   mc->name);
>          error_append_hint(errp,
>                            "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
We may check the vms->iommu is not already set to something else (to
VIRT_IOMMU_SMMUV3 for instance).

Thanks

Eric
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {

