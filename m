Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4820131lfp;
        Tue, 5 Oct 2021 04:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwFmnLfpZ/J4FhFr6UhwxTl78rjLQ4DnTjJt8SaWOjJtQJ1ACUB+0bfRK3jA92cq6Wen1p
X-Received: by 2002:a05:6102:22eb:: with SMTP id b11mr18317336vsh.36.1633435144183;
        Tue, 05 Oct 2021 04:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633435144; cv=none;
        d=google.com; s=arc-20160816;
        b=Kx1s8Zs5fFwvfa/RnYLPNSGEApIAy12AT0Idt2VBNLbxoi9KePcGA7l5Yi9h0N/avz
         jXH1rYtM6c2ZVd/qqxTJwHXrPFJTha9I2kJgo+SP/gXlsznWsOgCmTpq24bMiNZL74t6
         nnA+vtCmOJjG2P6Oe5j8ihBYB37hZ/VJz0yQiIoi9T8fV4380F9dCcK8RNlHRa9PAUj6
         wGqhs4fc+b9ky5yifI5V6qAGvdLE5U1sb7NeAv20rt1GK5elofJZNjHiyBr+oNw2SkPl
         XBVoKSgX1ynWPZ7RdcfqOSTYhQFssEG2ejdnTGy2BRtJ9KIXhiI+GXRNlyHKfdA48dhN
         FDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Gb+KQLmd6wMzwN61bPmcWoRFOQr1IXigS02ourGUEk4=;
        b=H40TInsSzQK8pmytT20CQjyXodBIbZCmU8bYX7rk0DauEAWIB4pDuw2cKRa6CeQ08c
         LiT/BmcU4z/ZTsYVhsZws4WIAcCA+YKsNmCycPRIvKSR1wNCv95HxnsmbltO1Sbslvd1
         z91/BOCMeVWs04t0Nxi/l3Ko/be+7pLH7WxThI5rZGIcDWM+cb7d25bTboIGbXu6G2Vh
         cnpFsLpwNpH3yWp/eex6lcO//h/XBl/YHtg1OhamtTGT55jXZx/ABFeXq99F4jLZ2rZA
         aYS9rjkA/9kBvZUA7Sen1Mfeivj5bd6nhFW4Tz/y4hnSktQX6k492RnuhtDTwldJiMah
         pt+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LRN6wWt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si7549644vsn.296.2021.10.05.04.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 04:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LRN6wWt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXj67-0006dm-Gc
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 07:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXj4r-00067j-Eh
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 07:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXj4n-0001tu-Ol
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 07:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633435060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gb+KQLmd6wMzwN61bPmcWoRFOQr1IXigS02ourGUEk4=;
 b=LRN6wWt2jSDcyCdz973XHLrIPZaZt7e1531yl9Emy+dmJMAH/3/ndTIm4cWAbKkW/3RzAz
 U9EN+ZPUxJpqDiibCiB1P8wQyGrMQ/ZsP1d1L/XtZ+UCZKjQSdFgKZ7VkcbmNTmGIyoLYq
 jrYX6x0s+t9jxhXnvgfU66z+oGDI2xM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-3EKJNTofN4GsvWDmL_sxUg-1; Tue, 05 Oct 2021 07:57:39 -0400
X-MC-Unique: 3EKJNTofN4GsvWDmL_sxUg-1
Received: by mail-wr1-f71.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so2663538wro.18
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 04:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Gb+KQLmd6wMzwN61bPmcWoRFOQr1IXigS02ourGUEk4=;
 b=JeCrZR0kZl3imGEKF+V7wdTcc67WJZ/bhZczHia1uxDVGNOcRKQV8xEWYsBM8CxqOF
 ymhUKyxVLluVqsj9w/DkaW/Qw9gocnR7A/7+pRUY8rR4xSOrGCdWYyisEGqZtu09VQQf
 M9XT0oQi277BayNkGU2tYXUFWr7Z/Lgd5aal87zOMS3pVT/374XOoxDfxG2RWvUNanDY
 R+jhWpjYiUBWWSkAOfqnAkdXIgE2HIQCc2Tfh2LSloGd11sAt6aJmio+ataPTV/5uvFX
 yyP90fJHWmKoHHa9QaPrP5DogUCHMUplgMAm2dDtpkPFjmZxQw8Xn1x5wOMnrqiTWlOb
 pmig==
X-Gm-Message-State: AOAM531UJVcaYQLlyWOT3rEUKJpAcahpijYElC+xKqKJj1tjceh905Zl
 rf0iV81VAzuOxwupwNLv1+nXj8p7lsPDkthVD5rjTUllm2RAQKc/YJsxUms6xieo46LBzkstObK
 yDAXRY+IO5G9dKbc3odN6CsML/DwEIcAYkPLUoW9nzXRa/YFKZUc82qWbXpSnP7frcJ0=
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr2938105wmq.153.1633435057598; 
 Tue, 05 Oct 2021 04:57:37 -0700 (PDT)
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr2938067wmq.153.1633435057294; 
 Tue, 05 Oct 2021 04:57:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z1sm13712555wrt.41.2021.10.05.04.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 04:57:36 -0700 (PDT)
Subject: Re: [PATCH v4 03/11] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
Date: Tue, 5 Oct 2021 13:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/ApZlNaBaXT

Hi Jean,

On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> virtio-iommu is now supported with ACPI VIOT as well as device tree.
> Remove the restriction that prevents from instantiating a virtio-iommu
> device under ACPI.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c                | 10 ++--------
>  hw/virtio/virtio-iommu-pci.c |  7 -------
>  2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1d59f0e59f..56e8fc7059 100644
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
actually this does not work. To add a hint you need the *errp to be set.
Otherwise when running through this path you will get

emu-system-x86_64: ../util/error.c:158: error_append_hint: Assertion
`err && errp != &error_abort && errp != &error_fatal' failed.

replace the error_append_hint with an error_setg (without the \n)

Thanks

Eric
>          error_append_hint(errp,
>                            "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
> -        error_append_hint(errp, "Check the guest is booted without FW or with "
> -                          "-no-acpi\n");
>          return;
>      }
>      for (int i = 0; i < s->nb_reserved_regions; i++) {

