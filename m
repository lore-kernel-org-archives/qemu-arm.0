Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp585973lfb;
        Wed, 20 May 2020 06:35:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWYiMmJjB2nSv1K9C4bFOniDMW/h/EKJ+IVyZllVFk9Bpk2Ve/adVWuIaYaPDZZch4tSFc
X-Received: by 2002:aed:2441:: with SMTP id s1mr5336523qtc.304.1589981707358;
        Wed, 20 May 2020 06:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981707; cv=none;
        d=google.com; s=arc-20160816;
        b=duPL6+kEDASQmxkUgN/THeW1lmEOm6DPMFebasPXz3DsLWxDZTmbpXtspAdrpxV0dQ
         DWEzsio9bAUc3/sVUilKBEuMD8Sj0Dil4zx6TZb7JNWC1W+JNF5Zkvg+McCWfMNVrX5L
         zeFT8gPtXK3zlXmj2bvIOt/EJ9doom42cXsL7OWj4Rxso8R+XY2msx/G//L5WMQzvoj6
         gPrR8r66FqJrwy3T9u7wmdDoHNaiFFUtkgXzQzZwlXnhTpVMVmeTMepfjS3UHejSBP6t
         OqIGL2FtCYITOroBoHMum0klISBe9bOUTo3hOCzrMcEVVflFUIoOGoxbfvx38Y2K8czy
         D3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+/ZKLsj99u02rgMhqtwFWQu7Na4B+yLIprFNYclwbsE=;
        b=W/41L3SFyNW3lMlZCFHQtgJXf3VTUo9q3FPXn2QWuOsMKT5SXECfxRCwxMIeisvPWV
         CaZrYywWbh/PZ6Js171JUh+WHMaYEUV0hdgjbnMTshNtClxRQ8UMQ+nCymtCNCualwuy
         q2xvRDD/YAgWR/lssyGf1b6CXZoEmGxyfdtXs05Z4M341lhsfi+a/Njd+jSDgvf4qO1T
         EDDLPAynk1HGyxfl6/NOlFg7u7MPSfkLT4gCUeb4Xg2pbYT2gbw7IXBZ9c21n3DdlP7+
         JUsaBG4xsLO9JtwF4wDKYFyedls0PhIIc35T/z5+8SB75TegBAk3bWeyfhGkPPnxKCpE
         1Juw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BrELYa8N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si1418588qtb.191.2020.05.20.06.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BrELYa8N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOsE-0007G8-Py
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOqL-0003YL-ID
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:33:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOqK-000374-5W
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/ZKLsj99u02rgMhqtwFWQu7Na4B+yLIprFNYclwbsE=;
 b=BrELYa8Nlt+7JfVxqKekM8leQX7km1bKNEQvGB3s62ItZyPjCh8vThfyNgeeJoYCBr9FVl
 8tdPkQnwXP6U2iKGfibSBY9LYSxkJ1c05qVf4Tdip1eV19hd1TXChEFNju4FFJUVmfRnXr
 nRvGWJ56hzysW3/dyG63iFapa27ctXg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-b-cTKWM5PN-KbNEct70iSQ-1; Wed, 20 May 2020 09:33:05 -0400
X-MC-Unique: b-cTKWM5PN-KbNEct70iSQ-1
Received: by mail-wr1-f72.google.com with SMTP id 90so1402317wrg.23
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 06:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/ZKLsj99u02rgMhqtwFWQu7Na4B+yLIprFNYclwbsE=;
 b=MiB2yCc0FKbxIvfjbo6vaIWmh1NsLFriAWoc0NOPyv7GLbBn+yX5Q9B/rW1LD5KobH
 If+IY04y+gK4psB9uJ0FdPubTThKk4fAw8prNn1xGFPPSnwyNu1Ccdc5H6Q79xtoZVBd
 MvNwsPiiuoMfHBl6fnG8VflZCQI1BAtzxaABfryDOnafwVMXTFvJy7eINwB0FNV1MBxs
 CzA9lJVCF94MBa3u1amaVqb3qDg+v0/IzJGwdnyPey1/l6sYgcKXTL8kKxj8ZYs6Mw52
 T8awEhxtY9UCdgYt5VjI6a+diRbCCzbirq2eXMOsWWg2IEUMQxL1zTHkZPmvtrbZIYtC
 agag==
X-Gm-Message-State: AOAM532DKsbvgO9NsWQPBEBDI9RG0IGk2uiOZbw8Kur5Ztp/ZEJUvcVw
 U9xEJhygarEPdi+bFbBsROujrLVJO5xOi5ysDiTq+GDR+CWmF149xzDpiWxqu2zM9QKI5LuA7QG
 zoVhPmYfdOWDj
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4916722wmi.131.1589981584405; 
 Wed, 20 May 2020 06:33:04 -0700 (PDT)
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4916696wmi.131.1589981584107; 
 Wed, 20 May 2020 06:33:04 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b7sm3008486wmj.29.2020.05.20.06.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:33:03 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] acpi: ged: rename event memory region
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9adbb53-4b3c-dec6-5738-ea972710665d@redhat.com>
Date: Wed, 20 May 2020 15:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-10-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: anUEQdL0TaBW

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> Rename memory region and callbacks and ops to carry "evt" in the name
> because a second region will be added shortly.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/hw/acpi/generic_event_device.h |  2 +-
>   hw/acpi/generic_event_device.c         | 16 ++++++++--------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 83917de02425..90a9180db572 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -86,7 +86,7 @@
>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>   
>   typedef struct GEDState {
> -    MemoryRegion io;
> +    MemoryRegion evt;
>       uint32_t     sel;
>   } GEDState;
>   
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b1cbdd86b66c..1cb34111e59a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -142,7 +142,7 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>   }
>   
>   /* Memory read by the GED _EVT AML dynamic method */
> -static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
> +static uint64_t ged_evt_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       uint64_t val = 0;
>       GEDState *ged_st = opaque;
> @@ -161,14 +161,14 @@ static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
>   }
>   
>   /* Nothing is expected to be written to the GED memory region */
> -static void ged_write(void *opaque, hwaddr addr, uint64_t data,
> -                      unsigned int size)
> +static void ged_evt_write(void *opaque, hwaddr addr, uint64_t data,
> +                          unsigned int size)
>   {
>   }
>   
> -static const MemoryRegionOps ged_ops = {
> -    .read = ged_read,
> -    .write = ged_write,
> +static const MemoryRegionOps ged_evt_ops = {
> +    .read = ged_evt_read,
> +    .write = ged_evt_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
> @@ -287,9 +287,9 @@ static void acpi_ged_initfn(Object *obj)
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>       GEDState *ged_st = &s->ged_state;
>   
> -    memory_region_init_io(&ged_st->io, obj, &ged_ops, ged_st,
> +    memory_region_init_io(&ged_st->evt, obj, &ged_evt_ops, ged_st,
>                             TYPE_ACPI_GED, ACPI_GED_EVT_SEL_LEN);
> -    sysbus_init_mmio(sbd, &ged_st->io);
> +    sysbus_init_mmio(sbd, &ged_st->evt);
>   
>       sysbus_init_irq(sbd, &s->irq);
>   
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

