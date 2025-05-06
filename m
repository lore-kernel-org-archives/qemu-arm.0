Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2969647njj;
        Tue, 6 May 2025 01:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3KqDqI5XOddzyeyOvWF1WmO6/wnVLmj54MhFtDUgQQuN3B3wH+el7MhKkmCjwj+xZHQYRkDe4602m3g==@linaro.org
X-Google-Smtp-Source: AGHT+IEL98Fhj/DWSECm03kspVTWVMh+OinCXB5fn61CLnUt9PYygutdp1Awd6m1u6Ozk5GW8Wcg
X-Received: by 2002:ad4:5aa7:0:b0:6ed:cea:f63c with SMTP id 6a1803df08f44-6f528c39931mr154917936d6.6.1746520985431;
        Tue, 06 May 2025 01:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746520985; cv=none;
        d=google.com; s=arc-20240605;
        b=Rhcr4mVP60+9x1QKGyO/rpo8k6p3Uq93rgF/5V+TCdKVTcQa7NDCvjdL9cMxbwCyzB
         TiJXM7P57+4X2BOmz91WHLvYGTXLmkgkQ/KczFPIs0hlHoATyCxxe6ccARKJcVaXvA0J
         lbwaJfBK4SBFn9ekXIlcmrnIgOZPW0z1ERYSUTyFdkWUF+CLA6NuFSSUUl6x0jJSh1zJ
         LU3u2Vf7BXxhERmeqewkIhp93is0vKo6uXNIlIYulCU9z9ZIMKTZM0NehPt9KDOqUs3Q
         05dHXezzFmBfcqLYzrS2/fsRVgWD8lw6uZh15nsdQuX3k1gVbZ/OQo42H1vewqM8VoDO
         4oHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VBFAHntS4UWdCABIPpBynhyDjXD83ntgx9qwo28tG1I=;
        fh=D6Z0k1JHPqotHAqK9x3BH6TjLvc3S2eVo+lutl6+D94=;
        b=GgIyTnTZrmAiw9JyAL4EkBOqq3FmCS7eISbuhOobMduge9rz4qyg6qtvWuU0pfyuks
         GMIaml4jMwCoTS7xmrTMlmeFy5xaRxB67T9I8VfmZJesgIVRmvbzGh/BQEEdsXn9NJ77
         q3uMNnQhIPDw+Wl8JfllrrHa430rNmlGq55uBkRnS8T5ZZnzJuaSVw2o3GF+5+gqFls0
         HYkfdmOujV52H5Ir4cASGh/+fsHjyH3aj0qSTTKJJq0IRZ2qKEZw/+Op90jz1Q3q2eTw
         E2CwYh5l8HXu5z5DZPRZNSFYcva8VEchyvRHlblvUgfZEJEwNSmcw/baf7+8bo1RtKkb
         Gcpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LMObZqms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f3a9273si110493996d6.4.2025.05.06.01.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 01:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LMObZqms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCDtF-000333-HD; Tue, 06 May 2025 04:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uCDtD-00032f-N2
 for qemu-arm@nongnu.org; Tue, 06 May 2025 04:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uCDtA-0006BZ-NT
 for qemu-arm@nongnu.org; Tue, 06 May 2025 04:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746520973;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBFAHntS4UWdCABIPpBynhyDjXD83ntgx9qwo28tG1I=;
 b=LMObZqmsk5tJtzeo3tStGE32cyUORbaOD3CQeXWa9x5tafapFrtbACsFG11+FNXmK2xtBC
 3zInJcLMcJ1uI6EfsIsZtr60IjLX+0JH+c4Pk0KCIGIg05AkCj5AhkPKpq+IMWjy4VZiu7
 14swWUz/Rqxq4gPlhzlgaIWdSEeUyZQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-RO7bAqvZP72evxTNU1nOig-1; Tue, 06 May 2025 04:42:52 -0400
X-MC-Unique: RO7bAqvZP72evxTNU1nOig-1
X-Mimecast-MFC-AGG-ID: RO7bAqvZP72evxTNU1nOig_1746520972
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43e9a3d2977so39152865e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 01:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746520970; x=1747125770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBFAHntS4UWdCABIPpBynhyDjXD83ntgx9qwo28tG1I=;
 b=MeUwxG85dvAKHKWR139uvqBekRyfijkBiomJN7Sc+PynxQ83j97VvMX1wHsPfx0t/X
 tT7ew9/jOYr5wAhTbXWne8+3XaJYH8Lf7BW63XWtBZxA7G6zPw63OsGMzqGUlE7Eoj95
 nparz0I/0VjyKX2ehlIrnd2nwknTFYmq5Bzw+/WrmDFUe59jc4IitDOoi55RVSalNHv2
 zfhdWQLhDzaO6NVuPaW4dDV5DOXNJbAd5yChz5bMEeguIGNgF2D4GUxioAr1sykhCUBn
 /arWzfS4H4Szxjrsz2pLNfQP0hXFw22zjOnlj1TFBQa1LHpcRJgqdtwyKQcRvpJCXBMJ
 SI0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzk1CUjPcNrl/Z3ob4nJ869lacojFIzmgnXwAGFupgjwYOa02n+w9aQKugqrk3lpLjcHC/lOEJog==@nongnu.org
X-Gm-Message-State: AOJu0YxGCxcnz8BaFpzOFm6GL/eYbKsUpD+XTMdszBKOHs3799yvYS+g
 6eZbVDG9ftbY2ZUNMBhDXvxBv/zE1rRmxXxAu1Lim9kbJXMRXfeTpUuV0so7XMYgzEId+WIRawB
 Olf4Z1Nn5r+OXI+0g2oINqlwGkRO/iias/A4PYaBZcDDdllRDlQ==
X-Gm-Gg: ASbGncsGI799yivD8Zdc5HtLYt95FACTZEQd9EqZw60VLpHc8UF8HhXLkVLhG4SI26M
 n8YTvw1GUWevmCrmyhyj2XZVzhOdrGRSgVKgVMRjYtxSy1uH5hefph9BUmmLvf+2/q2YHz298bI
 oHhG65HQrnUrsb4WnxQyH9bycLFVxqb9/whsXS/FTUVY2j4L0FDLt+0rPXEwOuYmJNolfxwK6wT
 qBK/k34oBCI8xEgi3epbUra0MNO+yAxrhFOGlkoj/GM6UtsKRLDIHihmI7qK18wk4x7XPSzoETD
 yrYDdluzq6Nz6IPH7CDR68bH/BtKIi4So/KuNAoFdpnxOcvBFEQ+Wv4ZCRM=
X-Received: by 2002:a05:600c:4e42:b0:43c:ea1a:720c with SMTP id
 5b1f17b1804b1-441c48dc0bdmr83725015e9.18.1746520970705; 
 Tue, 06 May 2025 01:42:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4e42:b0:43c:ea1a:720c with SMTP id
 5b1f17b1804b1-441c48dc0bdmr83724685e9.18.1746520970339; 
 Tue, 06 May 2025 01:42:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2af32a0sm209759555e9.23.2025.05.06.01.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 01:42:48 -0700 (PDT)
Message-ID: <6708dd99-eda0-4b1f-99e6-46a7cdea36fd@redhat.com>
Date: Tue, 6 May 2025 10:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/24] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
 acpi_dsdt_add_pci_osc
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-8-eric.auger@redhat.com>
 <4bd4aa37-1edf-4660-b415-2b2c3c184e30@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <4bd4aa37-1edf-4660-b415-2b2c3c184e30@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cpMRebABfI5aVaCaRIGE6rk1bBhHbSEywS8PYxClIyE_1746520972
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 18uPCelphBbZ



On 5/6/25 2:13 AM, Gustavo Romero wrote:
> Hi Eric,
>
> On 4/28/25 07:25, Eric Auger wrote:
>> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
>> native pci hotplug.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/pci-host/gpex-acpi.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index e8b4c64c5f..4016089893 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev,
>> uint32_t irq,
>>       }
>>   }
>>   -static void acpi_dsdt_add_pci_osc(Aml *dev)
>> +static void acpi_dsdt_add_pci_osc(Aml *dev, bool
>> enable_native_pcie_hotplug)
>>   {
>>       Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
>>   @@ -80,8 +80,9 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>        * Allow OS control for all 5 features:
>>        * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
>
> This comment is no longer true for PCIeHotplug, which now can be
> controlled by the platform, and so needs to be updated, although
> it's going to go away in the series.

Sure, replaced by

+     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
+     * and PCIeHotplug depending on enable_native_pcie_hotplug

>  
> Otherwise:
>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
thanks!

Eric
>
>
> Cheers,
> Gustavo
>
>>        */
>> -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
>> -                              aml_name("CTRL")));
>> +    aml_append(ifctx, aml_and(aml_name("CTRL"),
>> +               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 :
>> 0x0)),
>> +               aml_name("CTRL")));
>>         ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>>       aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>> @@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>> GPEXConfig *cfg)
>>               if (is_cxl) {
>>                   build_cxl_osc_method(dev);
>>               } else {
>> -                acpi_dsdt_add_pci_osc(dev);
>> +                acpi_dsdt_add_pci_osc(dev, true);
>>               }
>>                 aml_append(scope, dev);
>> @@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>> GPEXConfig *cfg)
>>       }
>>       aml_append(dev, aml_name_decl("_CRS", rbuf));
>>   -    acpi_dsdt_add_pci_osc(dev);
>> +    acpi_dsdt_add_pci_osc(dev, true);
>>         Aml *dev_res0 = aml_device("%s", "RES0");
>>       aml_append(dev_res0, aml_name_decl("_HID",
>> aml_string("PNP0C02")));
>

