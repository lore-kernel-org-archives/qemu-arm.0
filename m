Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp844599lfq;
        Tue, 8 Sep 2020 11:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtk0yWzGbCVk/+/BvzSMh4hEdwtBz5ZWOSla24kfq25YjFBZ1bWWO9aGMFrQSmu9ZLAyE0
X-Received: by 2002:a25:880e:: with SMTP id c14mr306677ybl.181.1599590349411;
        Tue, 08 Sep 2020 11:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599590349; cv=none;
        d=google.com; s=arc-20160816;
        b=Zvn76hUc9ULvlm1dJkJLW88zwuAId149Iz3884OPZFXmctLsuPyHP2KNpnrjiDOuRi
         6iMD2OjTmgqkSayLRhbH8oRZAeWhxG/MhaSjiYTtD/rHln4+YS6XWMYWrTufqRsYOd6T
         B7tNUJqbRdP+ErYCJzbqDDPqH0RNlV79vEH5+V10ePVoQPIqiJ58AFW89v3N8UPgHiJj
         WfsnB8Flm8INgj/pEaB26c+Vb3FUsqbHwO2j9tRl0zshS/u437FLv+THjJoz3R1HdmfC
         blB3SYUDQ6uEpd4UaDl/U4E+baSUFPPfiCkzMTZizJWkBdMEGkupr51gAxo9fTgJy77U
         6hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=I7rfyGlmO5VERP8OoEzggs4HOmvdSvtI8eGGEykvY0s=;
        b=Buye1xIxI5KN0bpjUELUtF4guXRKsxzu0tV7GWh4pxHEUMLbiLUrWd9Kqtjblq8Nar
         dcwXV0njKHMtF4Klua6Wr2c1LP4PZRx6RILVIHtWtWk7FUVm8q/4HZr5q+F7ZCslIbQH
         dEP5/cnM2ZWKTPr76qfrfSIOI0Z9KZ2tjp7odJ0YYqhwTenAWmsiopJwwt8fCBibVVw9
         t77h4K+d9HatH2JwaSCXPynJN8RWGqSwC3FU8rVOJ21P0HwBSxnrq+Ra11chSb2pdyw8
         nJteMQnkLNCOf6i1yPYJOGh6uorcDbc0Ku0svvneXLrx3l95kgACa8xL3+aizWP7nKqM
         wd6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+izh5PF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si226072ybn.59.2020.09.08.11.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 11:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g+izh5PF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFiWK-0007CX-Q7
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 14:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiVv-0006fZ-G0
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:38:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42069
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFiVt-0001BM-IF
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 14:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599590320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I7rfyGlmO5VERP8OoEzggs4HOmvdSvtI8eGGEykvY0s=;
 b=g+izh5PF9XkJCWSkPWVT5VLHuEsBYQgana1tdvQRYrlrYUdid9uWt+3jWIsfoQxWsXmsTX
 NEU/UmyQDyF9gDS6QzUahubeUyzZrADhcGpNCDZMxnBJI4LzS0zGIvRXLSwNz2ytl/pH1M
 hnfn2Dn5alMx0GZW9hGe9ZLiQNmD03A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-jNQ2DqmaOXa47y4eLJPM6g-1; Tue, 08 Sep 2020 14:38:37 -0400
X-MC-Unique: jNQ2DqmaOXa47y4eLJPM6g-1
Received: by mail-wr1-f72.google.com with SMTP id l17so7214167wrw.11
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 11:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I7rfyGlmO5VERP8OoEzggs4HOmvdSvtI8eGGEykvY0s=;
 b=B2kACV7ISiCBNtZRei4Nuh/oHaKU2z317EfUUXFtcvgU+horYLUJkBX4Dem8Wcsxfv
 KcC0lv5rfne7wlUh0Mx5LbYNtJGEIs/6ruS9BSZmbjZhtM9RoavmfJLBAfrBOorMuJFR
 ETaGG8uoM3Q96I2ZtyIiiQuXu5cBxEk2A/zhLwbv/nTdDffwADR1ddGfouKrSsFvqAj3
 za2u0U1WHJK3sU33bpqMIf/Oc2lYEnopHleOfKecNtJgUv4SqNElcd+x0JS8X+KsqYls
 QfH7MShcegmv8u+eUXVvVB/y55yQsaxon+UjFxE21m3xPDDPPPVzR3a+fWSWFqNlHqr1
 eLaw==
X-Gm-Message-State: AOAM532TfvvU4bPgykLPT5zT2XEXCyWt13K/LX0mkguS8D/R7i5fcDHR
 CtqPfT/dqnLDle/EmJtMLVVYFpvCDEoZxCU66hptvbrShucMetO5oMHEfU9MO+SDJ0mJuOaA9zj
 Uz0kLpXUfa5EY
X-Received: by 2002:adf:e711:: with SMTP id c17mr951750wrm.359.1599590316631; 
 Tue, 08 Sep 2020 11:38:36 -0700 (PDT)
X-Received: by 2002:adf:e711:: with SMTP id c17mr951733wrm.359.1599590316429; 
 Tue, 08 Sep 2020 11:38:36 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id o9sm407298wrw.58.2020.09.08.11.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 11:38:35 -0700 (PDT)
Subject: Re: [PATCH 5/5] hw/i386: expose a "smbios_ep" PC machine property
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-6-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <0d8950d0-b317-0418-cc1e-3d3d412aa2c0@redhat.com>
Date: Tue, 8 Sep 2020 20:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFTNY+clZCRc

On 9/8/20 6:54 PM, Daniel P. Berrangé wrote:
> The i440fx and Q35 machine types are both hardcoded to use the legacy
> SMBIOS 2.1 entry point. This is a sensible conservative choice because
> SeaBIOS only supports SMBIOS 2.1
> 
> EDK2, however, can also support SMBIOS 3.0 and QEMU already uses this on
> the ARM virt machine type.
> 
> This adds a property to allow the choice of SMBIOS entry point versions
> For example to opt in to version 3.0
> 
>    $QEMU -machine q35,smbios_ep=3_0
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  include/hw/i386/pc.h |  3 +++
>  4 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d11daacc23..cfce279eed 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -81,6 +81,7 @@
>  #include "hw/mem/nvdimm.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-machine.h"
>  #include "qapi/visitor.h"
>  #include "hw/core/cpu.h"
>  #include "hw/usb.h"
> @@ -1834,6 +1835,23 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
>      pcms->pit_enabled = value;
>  }
>  
> +static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    SmbiosEntryPointType smbios_ep = pcms->smbios_ep;
> +
> +    visit_type_SmbiosEntryPointType(v, name, &smbios_ep, errp);
> +}
> +
> +static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_ep, errp);
> +}
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
> @@ -1879,6 +1897,8 @@ static void pc_machine_initfn(Object *obj)
>      pcms->vmport = ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
>      pcms->max_ram_below_4g = 0; /* use default */
> +    pcms->smbios_ep = SMBIOS_ENTRY_POINT_TYPE_2_1;
> +
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> @@ -2004,6 +2024,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>  
>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>          pc_machine_get_pit, pc_machine_set_pit);
> +
> +    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
> +        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
> +        "SMBIOS Entry Point version [v2_1, v3_0]");
>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1c5bc6ae6e..3626e5425f 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
>          smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
>  
>      /* allocate ram and load rom/bios */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index cc202407c7..7cf08fa364 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -204,7 +204,7 @@ static void pc_q35_init(MachineState *machine)
>          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
>  
>      /* allocate ram and load rom/bios */
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index fe52e165b2..f5d2ebcb49 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -10,6 +10,7 @@
>  
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
> +#include "hw/firmware/smbios.h"
>  
>  #define HPET_INTCAP "hpet-intcap"
>  
> @@ -38,6 +39,7 @@ struct PCMachineState {
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
> +    SmbiosEntryPointType smbios_ep;
>  
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> @@ -59,6 +61,7 @@ struct PCMachineState {
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
> +#define PC_MACHINE_SMBIOS_EP        "smbios-ep"
>  
>  /**
>   * PCMachineClass:
> 

