Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1035830njj;
        Fri, 2 May 2025 11:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFB7WMDOJ219MsRyHot9au1ncUi3d/6XJL3Yb1GHEA14TjG+akSg41a7G+z/t//oQeYUHnmmbJItSo0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHm/Yb7oLUiWlxdx/TKJHuSihpcNken9GdlWV6JZeBJXlGdsBCny14YaxywRhecIxfxZUrZ
X-Received: by 2002:ad4:5765:0:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6f5155e823bmr76059896d6.36.1746209973168;
        Fri, 02 May 2025 11:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746209973; cv=none;
        d=google.com; s=arc-20240605;
        b=gixe91aaO70mKWtsvNJT3b3r0z4596Yq7tQy3YIJtb2YjDhaoZcJWWRf2L2RiG8KQ5
         x8C1fSfrfAddAtTOvSbQKIrVIn2zEzU7mETTBzeIsXOVbT7jhRE0fvDEttnFC0tVwd4l
         akObish9If+nJbiXE9n+slFAKPXM7JmjecpeuU8Op2qK3yhm7GYKlTFQRGr/GShoJGlL
         xyniaRqd3DgzIhe7CXn3dzChDGvMED3D4IfFyfxwTErvJ6Swj7ha0X10HdP/PXrs8sAv
         FjJFBcfCwx14GmlQKA3kLSmZvNROMyeAlvDAEDIkVmAyNdioqoo+kGwn8aFVycmw1E0P
         WhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vDjWZPuYAZ6fL/XWlHDIG5yQLFlDguF16OfoRgLLhtQ=;
        fh=vpghebvaf5JuqEo+BGsylw/3tvfmQz/ecYy3mmShfZ4=;
        b=QsIX4kyZ4efrVNqebwYMw/Tfl1bcvxbgpoTuIxNAPzerBsAP1qDDntlyrewEzCymkb
         TxvWb/3MENQwVbXyhrevDLV99jJGU1x2BXLc3d/3gV+aSbtvYT87qI7PErfqFnJ7+Ba4
         N1PhrhjgB237Zwx3eQ/9R881ZvXZOXdPnYGECD0owlonx586DJXiQC1HC4G4GVjBAMv/
         0V5t67mOFoeaFRfLR/wlyxAqIfMo4+BuKMipbSb/V/Dl5EQ+HM8SM+hd6wtOC7AFreGx
         buLvsHAgCQ3/PwwGS2pSAHRw5sy7iGmcRFjiHXLYSXJk2UfHmb9p9Ox+ZB2ZsqMZgKuJ
         z8Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SQ/HwZiX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f3a9273si36404936d6.4.2025.05.02.11.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 11:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SQ/HwZiX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAuyb-00073t-SL; Fri, 02 May 2025 14:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uAuyT-00072R-ML
 for qemu-arm@nongnu.org; Fri, 02 May 2025 14:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uAuyP-0007dg-UM
 for qemu-arm@nongnu.org; Fri, 02 May 2025 14:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746209936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDjWZPuYAZ6fL/XWlHDIG5yQLFlDguF16OfoRgLLhtQ=;
 b=SQ/HwZiXtKpYyuteZRo+aYaPDyUc3kJgtS9VmwmAiKiwsFhoANtKALDkKI7A3bs4MDc6Nn
 Rk3ghoD/R5xiiwDGqFAemZXW5SdAbwQbRzSA/C5fOPp1cSXZ7sOFClyOXOGpF/ygRL3kct
 mvYb4AvGOV3jV31xf45kxn/FfM1WXrA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-NP1MTDJCMPGVJ-G2x2wbrg-1; Fri, 02 May 2025 14:18:54 -0400
X-MC-Unique: NP1MTDJCMPGVJ-G2x2wbrg-1
X-Mimecast-MFC-AGG-ID: NP1MTDJCMPGVJ-G2x2wbrg_1746209934
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476664bffbeso44149561cf.3
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 11:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746209934; x=1746814734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDjWZPuYAZ6fL/XWlHDIG5yQLFlDguF16OfoRgLLhtQ=;
 b=K9n26SPX1a8/dLMaZnetIFOPQQjIxAtwVhfCdDM3iOEIeFyY1B4qMFpVd8uvObXYTM
 a0N+XHjfgLbX7rfRj3HTgmu3Q4BeFkPXgbsAl0b7ifaXeU8RN9jSQzIWGzz6hawH1BQQ
 nOLIQGKoVGbcLXT+hh724/OQ8dFH2hWxsqGmmNcufqZtXF3C1+QLXvwZpAyfg2QPe9pc
 hKbvt4eYwM76Ojkq5MZehIuhg+ZRnl1mhrRTwaGss9flqVkxA2npy+YsVtPKx6i6siVW
 IkYeYlQineZ26OXdX7MS+i9uKatmoOZVhAXHTkSyVjbWsu70v4yvninmYr81qrWt0oRt
 lxTQ==
X-Gm-Message-State: AOJu0YwvfpCE+yzsDdP5xhBdb7sQXBHRRMdB1asHxvos3n0NATNZsXhS
 +1BKxcGOd2mL87ZEaRPauTsQpBKzacPiT6uLFmIwQzhKPstYF1rnmJHO/gMHUNDkikd/hW/I5pm
 /WuPhuvCMLAViq60XX5/VTxL0RydRTgshUGdoeflpUMz19okwWg==
X-Gm-Gg: ASbGnctOjckNYvcSuhnqRM04H3Q3XKo65JTuF2jcHY9o6JJrRjvVRm/1vyif41vNLZv
 dY6FY5/yLBIT779vtHYKE2fN1l1PeifAIMd4PxquvHuI6Jn1Kgz1RIZBxCE0qheBco7b0qCMWte
 P5DNfq9XELaCvGzx2DKpupe9Klvk7doK3yzcS+ecSy5MDhCS1LK7Yd3DyMPgPUavD1IX1CxI0AW
 mjHNI6typ6duaa/XIU3A7HXksmtDLVzUfUe0B4QZW8rn2NRP1TqzlRfyRbutE16GeoxmUGnMTQM
 jTzGxJ1Pty2n
X-Received: by 2002:a05:622a:2444:b0:476:8825:99ba with SMTP id
 d75a77b69052e-48c31353328mr56499711cf.12.1746209934094; 
 Fri, 02 May 2025 11:18:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2444:b0:476:8825:99ba with SMTP id
 d75a77b69052e-48c31353328mr56499381cf.12.1746209933799; 
 Fri, 02 May 2025 11:18:53 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-48b98d0fb2dsm20974591cf.77.2025.05.02.11.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 11:18:53 -0700 (PDT)
Message-ID: <29e1775b-b35d-4510-a3a6-d49af81cca06@redhat.com>
Date: Fri, 2 May 2025 14:18:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, jgg@nvidia.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-3-shameerali.kolothum.thodi@huawei.com>
 <aBT9S25tQTVGKkii@Asurada-Nvidia>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <aBT9S25tQTVGKkii@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5_1g99jRLVisjqPb_ihW5n6iXm_vHEUVwSj13IHIvD4_1746209934
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bzawpcq+6b10



On 5/2/25 1:13 PM, Nicolin Chen wrote:
> On Fri, May 02, 2025 at 11:27:03AM +0100, Shameer Kolothum wrote:
>> @@ -43,6 +43,7 @@
>>   #include "hw/acpi/generic_event_device.h"
>>   #include "hw/acpi/tpm.h"
>>   #include "hw/acpi/hmat.h"
>> +#include "hw/arm/smmuv3.h"
>>   #include "hw/pci/pcie_host.h"
>>   #include "hw/pci/pci.h"
>>   #include "hw/pci/pci_bus.h"
>> @@ -266,6 +267,75 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>>       return idmap_a->input_base - idmap_b->input_base;
>>   }
>>   
>> +struct SMMUv3Device {
>> +    int irq;
>> +    hwaddr base;
>> +    GArray *smmu_idmaps;
>> +    size_t offset;
>> +};
>> +typedef struct SMMUv3Device SMMUv3Device;
> 
> "SMMUv3Device" sounds too general, like coming from smmuv3.h :-/
> 
> Given this describes SMMUv3's IORT node, I still think we should
> name it something like "IortSMMUv3Node" or so.
> 
+1.. the more generic name had me thinking it was broader than IORT..
the IORT-related naming is an improvement.

>> +static int smmuv3_dev_idmap_compare(gconstpointer a, gconstpointer b)
>> +{
>> +    SMMUv3Device *sdev_a = (SMMUv3Device *)a;
>> +    SMMUv3Device *sdev_b = (SMMUv3Device *)b;
>> +    AcpiIortIdMapping *map_a = &g_array_index(sdev_a->smmu_idmaps,
>> +                                              AcpiIortIdMapping, 0);
>> +    AcpiIortIdMapping *map_b = &g_array_index(sdev_b->smmu_idmaps,
>> +                                              AcpiIortIdMapping, 0);
>> +    return map_a->input_base - map_b->input_base;
>> +}
>> +
>> +static void
>> +get_smmuv3_legacy_dev(VirtMachineState *vms, GArray * smmuv3_devices)
> 
> GArray *smmuv3_devices
> 
> Or maybe align with the non-legacy path, i.e. "sdev_blob"? Or the
> other way around.
> 
> Otherwise, lgtm
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 

