Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4811450lfp;
        Tue, 5 Oct 2021 04:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKEAHDG3sNKI0s12jUYF96yG39yExN91QrYAZe6hCeRtFJZAMO+vrFB8ZepPkzFJYXTDk8
X-Received: by 2002:a25:5056:: with SMTP id e83mr3743984ybb.397.1633434446132;
        Tue, 05 Oct 2021 04:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633434446; cv=none;
        d=google.com; s=arc-20160816;
        b=DAVAw2xbTjPu4bFTVo9bSw3hrsqoBzU7y9wZyBrsTf1QR+i0FazimUMRx5UxGFY3jy
         GmBdAgVIVCH91a2dwN8D6X17OY6vP56o8LdE7WkzBoBkDboZDQ09LZSyx7ZMpOvZaYq4
         scmIRnGe+18ap2G9jpD3EkToDnu0F5Bk78C4aIQEYEiR26+bG+vIa8MhBny29PjRbV9s
         bu/s6M4r2byOSs7a1ixTky1Z0g/aRLYbzMqG7u3BPOzNRt72qGOv8swdM/5DXnoh2Hyg
         1J8obI6c8fE3DkmfdsYNFZFiDbtX/4TNRKGFqnnc2mMEcGi4lvc7N20ZVjYUn+TagDA8
         HEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TXwwkGgMjylpXN9pMhxDWMzWkSi9fP1askxYcjXc23s=;
        b=bbNLAObkcj9eBr22v5JZicNgHVQHrypS8vJHmIIa27oz+s7B522cxnp9Q7wwk7SFBH
         OxXKhldlV6mEitLAEZzXRo453oqOGb8SVJB0HBClhEdHKONAUqAa0jUzoTA5VdoA+TWd
         felg0ie+dq0ioH/Pxj7DaV8VsqB9wi5h5b5y2shDoR5cQMzzOExWP45+ZmEPZOPB2Nn3
         +8IsTZ4+8mpqtnkLyGhn+x7d7UJKWqnNc+lcDy+PZju3TY0LZpAsITkJNMIN/I8Y7Pea
         DtCrSmY7pxokouHj+7Xrv/xmuTTCePs02kSzq2BSG0mGl3zuCQuknhIEfTqKm22MvCOJ
         N8jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="a/oVWuyt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h63si25112183yba.260.2021.10.05.04.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 04:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="a/oVWuyt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXiun-0000IS-66
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 07:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXip5-0005CW-2R
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 07:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXip3-00036f-MT
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 07:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633434084;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXwwkGgMjylpXN9pMhxDWMzWkSi9fP1askxYcjXc23s=;
 b=a/oVWuyt8OQQQHNUqLLvYF0kNcqXJa5AI+5NPF42Nooz3N3HtjTcYkJJ7+zpEc5siJPwQI
 KrSTk50333qkfRKa386+GRLUVlZWawleRAJtC3Ih+fJdcV1tPm7+a2zv4D929WvInxLmR6
 ohfTu/z5limNc8RIax4CFwqVAKJ40mc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-9IA-vfFNNXiQECwXTkvz6g-1; Tue, 05 Oct 2021 07:41:23 -0400
X-MC-Unique: 9IA-vfFNNXiQECwXTkvz6g-1
Received: by mail-wr1-f72.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so5607750wrv.6
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 04:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TXwwkGgMjylpXN9pMhxDWMzWkSi9fP1askxYcjXc23s=;
 b=h4QT20k5YErVQF0GSIZn+sTTsQfd6b+gKHk8USnOeDpVwJY1xwyGtCDrBPZKUU1dKt
 TcpiZBrS4oeI0yCAL3SISKIIV1hP5GkDUZgb9ZTKZUxeZYcAPer5s6w1gHO+XTr2CHvH
 tti+qNYJWDAjKIDrUcAiW6B+u6ErT81vn5Vc3umVxv0hZrjh+KX2ERy82UIxve2zXOSH
 /7EBzGh9nEHGyyQ1zZurZ3bL4VAU7NavZle5tDyUm4Qy4fTjXFnybBrBNue89WlXOzVj
 S21YVf1v852t7nmoKPY2QdwZI+c7NYkVZqTVB8y98oOgInrq/hlz71Xt4y6nhk2jdwQk
 lR9g==
X-Gm-Message-State: AOAM533xFuwObYAnIBt4s+ZzAygTgNKAHo/G3IslxW+XCkE5F7DaJ2FS
 jTVVIENpsembVJqZJF5mu1b9Lzu6niiWntrvDuulwIDskxrHqpVH7i8J1Sxzd9soGqu8t+pxrSr
 IipGGPMBqE5DmyPyhqz2bVcyJlTCt7mUYNfvEb4WUGmK2d9RNBWmS0rOzll1QaQtH4hU=
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr21051652wrt.293.1633434082006; 
 Tue, 05 Oct 2021 04:41:22 -0700 (PDT)
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr21051614wrt.293.1633434081733; 
 Tue, 05 Oct 2021 04:41:21 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id w1sm1586797wmc.19.2021.10.05.04.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 04:41:21 -0700 (PDT)
Subject: Re: [PATCH v4 06/11] hw/i386: Move vIOMMU uniqueness check into pc.c
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <5caaee59-a39f-163f-6741-413d49392d04@redhat.com>
Date: Tue, 5 Oct 2021 13:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-7-jean-philippe@linaro.org>
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
X-TUID: iy8Fwq6jIVrx

Hi jean,

On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> We're about to need this check for a third vIOMMU, virtio-iommu, which
> doesn't inherit X86IOMMUState as it doesn't support IRQ remapping and is
> a virtio device. Move the check into the pre_plug callback to be shared
> by all three vIOMMUs.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/i386/pc.c        | 10 +++++++++-
>  hw/i386/x86-iommu.c |  6 ------
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 557d49c9f8..789ccb6ef4 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1367,6 +1367,13 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
>  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> +        x86_iommu_get_default()) {
> +        error_setg(errp, "QEMU does not support multiple vIOMMUs "
> +                   "for x86 yet.");
> +        return;
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          pc_memory_pre_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> @@ -1428,7 +1435,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..550e551993 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -84,12 +84,6 @@ static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
>  {
>      assert(x86_iommu);
>  
> -    if (x86_iommu_default) {
> -        error_report("QEMU does not support multiple vIOMMUs "
> -                     "for x86 yet.");
> -        exit(1);
> -    }
> -
>      x86_iommu_default = x86_iommu;
>  }
>  

