Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3853394lfb;
        Mon, 6 Sep 2021 07:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8ecxQ5E6VqUc+bzbPkisdrgJT0vsPusfPHuCW01qEY9LqhIxiRTTFmvvi6Fw7gSkJG8mI
X-Received: by 2002:a92:c248:: with SMTP id k8mr6905651ilo.78.1630939158456;
        Mon, 06 Sep 2021 07:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630939158; cv=none;
        d=google.com; s=arc-20160816;
        b=O08T6PveDqKKOL9nvHFsSblXX7R1ucOXAx62VdKATc4RCyfeg9RZxIl+OJk8rIvDQn
         y7o2fjFzrY4YbSVHTl7Fks6/O5WNoNSinHaY1lVLU0byw+mR/BTDask18GqDGppsneJr
         HHNhR01a4hNurSOlrLqit84mLLoHkSXS/6kF8Kpq5CtWckBz/R62HVWYdR3ro8BW08an
         sKCA1/4oj01PmelufyhFlD8Us824mOLshL3NgBsHOUjzwp1+S3a2e74zVphwfO856/1K
         D89mb+6CHFnJS/PJR8dZFBvmAix/5g9+zxLEOdniimDnpArAotH5FiQDLKIoSLDJG3T8
         yntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hD2DgVkuL0eKnO1s63CcIuBdztRtwDhIrROJ2rKhexM=;
        b=VHOoDceiIPNToZwlttKonQELeAwEkrAJjXOS7jqhPVujmIv2pRrzeFmC/Sr90CwEa8
         UqQneT8pywFCQQGaWpZpUpK8Q49IkH6c+TKMu7DbJT4IsnveMKkC7YtWHCdcRjHPKJmy
         nvWotYARrk1ag/OV6n2/IoDlhPui0c/DVJLu0SERjq8NfV1Qa4NeJUXoNecP/xnRufrw
         cTzU0bkzH6qhWVn6HZx2Jrdd8NxG9uXA0lriv755sTLpwACoPPlZYm0AyYzHXYhdWuO+
         HYjY/PiKVr+B+5XjeOEQQ6ieLMFQibdT3o2YwQowS93rFFaY8FXVsqw1R7Lbp9MQ+110
         gAfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NMS2uKhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28si6857444iov.1.2021.09.06.07.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 07:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NMS2uKhO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNFmH-0004fn-QR
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFm5-0004fU-0d
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFm3-0006uz-Eu
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630939142;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hD2DgVkuL0eKnO1s63CcIuBdztRtwDhIrROJ2rKhexM=;
 b=NMS2uKhOIzdffIhnWfZyuHxfFlnuko9ZI3wLNihTw+lgsPUTFZUfCfW/ipiYc+qf78Z9Uy
 wPiL+zO+jcsdT1ItxPqD98g8eflw2uTUY2fWLutIV//pM7bOpD6CR4uVWFDkCUs23rmrqs
 Edi67+DWvUivZhEEYIP1avVIzGAtqck=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-YFzxlEeeN5yrrbbJk8cj-A-1; Mon, 06 Sep 2021 10:39:01 -0400
X-MC-Unique: YFzxlEeeN5yrrbbJk8cj-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so2408831wmc.3
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 07:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hD2DgVkuL0eKnO1s63CcIuBdztRtwDhIrROJ2rKhexM=;
 b=CV2/+LW8kZHibCmbM/gfwiY1pRrb1xkn042qyN8BAPRpoyaXwKtWeqxK0zPIhWZXYn
 fV48H5lZJixHI7A9xCL8l6CnpnxYX/z7bPiRuWuuW2gQZR9OvNBO5kcH5F2MbbLzvRFw
 2C+o/4aJxISbV8wZIAK5H4B8qRKu2gCatc0FBzkEWgUo8x5e27SSyCZjenF7wQYGIpLD
 2phMJ3YQ2Q1K+HF3iKc0e9m6DVyPwMOM7NTYkiMBYMr0IcoUTnMpK5oQaeWu80gyLe9B
 7pDGz3cOVA9JCubMbGf1R/UwRjtdtbrCGWrAKW9zL7c2qc3qxmNARzNB98BzlD5iaJyQ
 SYIw==
X-Gm-Message-State: AOAM531BgG7gDK7ydycowWv6tRIcPkk1E87ORtyXJi4olstSs52/7VWJ
 IasmI0/zmXe9A/U6zL6jzCnIyl+2DaZWPVo3r2u8cRpoodiolgttlg/VLWv2i8pecRKE66+Yd8x
 H3PDN2fA0BKVdHXnUMH/crKhNvU70RfJSoBpbcbl7MaUTG1zRrua0M58m6r9xzZQ36Sk=
X-Received: by 2002:a5d:548e:: with SMTP id h14mr13914088wrv.7.1630939140137; 
 Mon, 06 Sep 2021 07:39:00 -0700 (PDT)
X-Received: by 2002:a5d:548e:: with SMTP id h14mr13914052wrv.7.1630939139878; 
 Mon, 06 Sep 2021 07:38:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id h8sm7351319wmb.35.2021.09.06.07.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:38:59 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <79d2016a-7736-c680-0c60-074dc8e37e52@redhat.com>
Date: Mon, 6 Sep 2021 16:38:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: qlf8A1NpC/6K

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

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
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {

