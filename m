Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2344741njc;
        Tue, 17 Jun 2025 00:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViEBA0etRuDoKFFmk3KJocQ/9ObT0wcoc/+Lwz5Er2pTTeEAfcAZkJJqUD7fTFoA/PWvwvpKchB40Nrw==@linaro.org
X-Google-Smtp-Source: AGHT+IGAY+6BmiO8T1e0TxoTqeNl+1X8isS1OQ5NsZQhhNWTObCuW+I1IR1vTYnvuTtub40v1ZkH
X-Received: by 2002:a05:620a:f13:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d3c6cf8464mr1816679485a.49.1750146611287;
        Tue, 17 Jun 2025 00:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750146611; cv=none;
        d=google.com; s=arc-20240605;
        b=eo9TX6wXnDAQBhJBuyrFzwaWmlZM4409JakUgW6p3Vk8HLSmUtavMxIPJWYdtGM5JZ
         ATh0oMwznZJbQtyaFkxWc39i9K3cJOIx29ALjLMjgC5spknb9JZGYyBKWGSU6vyr4SPT
         8vE5PujWwyQL/d8FiwWZJ1CiVHrK5nuCEMWZKFKDwsa38lKkNsCldIs9ETPr1VFs1hOt
         /pbNpB4YxVokUFY98eH16ytNkqOnhj2oSVZ9esIEU6Z04vKA0+a82AyT5B7SfD1M1ZKj
         HkD3kDuilPRmg68Xm7SBzODD4NyM7CXyRoJW8PAkfncUlI1XOpluy6ahbrQi8D+eA9lg
         kurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RMI/nkicUrh3VBJ2IJcpJuKkeLPcORCoa2mUd2yabwk=;
        fh=0aXygKty+RIhteIZPCVNi48yYt6nQiTqyxw8cPCdWY8=;
        b=USZGHeUxDFkNz3C+xYepH2FMJS/LD2GhVdbAiyyDB3EjxqZtG96gS3k4khRb5NkhA/
         secAz5/jfRghiT5QuJN65oMyuvYG8xlsRXB0BGxCTB2g9+IN1p6h46gpsgqBrq1w+yke
         SE1mbFSuoHlmTIfPPBsurtEVYKTT0+0C7wf+mkWfocymssOuL4S16wYbEhouhr3zj5UJ
         z+ZfCSK5f7sy/E4pl/90/y7nIYd9E5kJ+63sMRcOA3sAVPpYla7Kw5lxPnP6FK5HSfDs
         hrlolbTCM7fpX9qnS4CtSFlmHJUsNozzDQxfPDt/k7+0zzpzzG9zhdoebC+/6Ab/4kmg
         IFIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MeF3t/6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea4c10si1153593385a.234.2025.06.17.00.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 00:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MeF3t/6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRR54-0004i8-ED; Tue, 17 Jun 2025 03:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRR52-0004hb-GB
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 03:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRR4z-0003KP-AA
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 03:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750146600;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMI/nkicUrh3VBJ2IJcpJuKkeLPcORCoa2mUd2yabwk=;
 b=MeF3t/6tQPt/4kzHLFn2L0C0UWrZCFvT4HmTLX1YULuHHPIPNv7ymNeIYuWiUY6mSNL9cp
 wKO/VQCNerOpGoO70dy7bFueeUM/pW5p7Twhg/O5+t2mEEP+uO2wrITbFWfhNrMv8DuJCa
 tZ0W66nCjltEfw67sDvuvskYUiH5yek=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-RhSWinBEM3aX9wEfSgeL3A-1; Tue, 17 Jun 2025 03:49:59 -0400
X-MC-Unique: RhSWinBEM3aX9wEfSgeL3A-1
X-Mimecast-MFC-AGG-ID: RhSWinBEM3aX9wEfSgeL3A_1750146597
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a54a8a0122so2172666f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 00:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750146597; x=1750751397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMI/nkicUrh3VBJ2IJcpJuKkeLPcORCoa2mUd2yabwk=;
 b=vhnzs3/T5x5rNF8TvKu7OslVbdx6xWk4auZyJAg45M404v3hBuaVFkCtnRs4QHBx8f
 hvqi7o1aKPLqiO+MUMkLOwtXAemzV6sOZ1+uVMT2lo4GGzb9kGwfY0J8yGcA0OcmWnzV
 q/T9SrseGUuZgX3DCcPnwV0mc1jrYngLXCANu4nIWkSOgnUdLyABHPc9+ZSHg9kX0ucM
 JwzkD3xgnANiMoovu44KV31iAVRnHu+qUlnVJeFXy65alCrH8/qvgvfPU946HL+1hZQM
 GixhTWWmYWT+XIb9nw/gm/GeGdG9nYxBNgBSc4GraJboTlLwaUk1AY2SAvq0iz8wR2Pn
 CuxA==
X-Gm-Message-State: AOJu0YxAj69wG1LjpaSHO1Po2LYJi0/cgUbQKHlsAuqBd7SVLEhIhVUp
 BbA+08kChWRQ1HbNiMZ4UEg0YJg/dTkv/bh+qFTBJLSTax5Wt6TH0vTPmLC8o6m87rvlsad2SIY
 cdnwrV1f7YXmoq6RQwLrhURCVitqzuu9ffG06+sJY+irgRWmdnOQHiQ==
X-Gm-Gg: ASbGncsbDowXqKIP0RhOic9Pp9I83rww6DdEw2Yc26jcK3zMIiYQjVzLgsLLdsDbaig
 0xbVt0hLl9Adw+ReaITbiPxPkaNz1fU2/IyQAAa/beGRMpE9U5qIrWd035X5Our5BXzUBR1BjM8
 XlXySMzvHR9NIHCSCx3otT69chJYg8A3pEGStMf27Cn5gaYa7kMDdAKT1DE1sZHsx93lVYavoEs
 XS1hjKqD9hGohufoXt7Eb/JGZTCDoWXw3hJ1OiZ/A6tPvu6rBM/SFFQmaCuJux0N/4Ft9/bc+L5
 x0AOXAWKXir3TQB5i+hQPjiKtCBeds/IPm4GOyuKThW4YgvL3YJoxwRD4r6QuWvwcu8z5w==
X-Received: by 2002:adf:9c83:0:b0:3a5:7944:c9b with SMTP id
 ffacd0b85a97d-3a579440d3cmr7255448f8f.16.1750146597170; 
 Tue, 17 Jun 2025 00:49:57 -0700 (PDT)
X-Received: by 2002:adf:9c83:0:b0:3a5:7944:c9b with SMTP id
 ffacd0b85a97d-3a579440d3cmr7255437f8f.16.1750146596770; 
 Tue, 17 Jun 2025 00:49:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54a63sm13290135f8f.11.2025.06.17.00.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 00:49:55 -0700 (PDT)
Message-ID: <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
Date: Tue, 17 Jun 2025 09:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, linuxarm@huawei.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com,
 berrange@redhat.com, imammedo@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, zhangfei.gao@linaro.org
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616112019.00003bce@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dTvIf2yxt4PtYh4usPlm16hsSMtUgEFHTBY2XwI5lAA_1750146597
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: W0DG7V/uXXIP



On 6/16/25 12:20 PM, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 15:44:43 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>
>> Although this change does not affect functionality at present, it is
> Patch title says PCIe.  This check is vs PCI host bridge.
>
> No idea which one you wanted, but if it is PCIe needs to be
> TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
> I think.
I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb

pci-bridge/pci_expander_bridge.c:    .parent        = TYPE_PCI_HOST_BRIDGE,

Besides the commit title/desc suggested by Jonathan you may also refine
the error msg which can stem now from 2 different causes

Thanks

Eric
>
>> required when we add support for user-creatable SMMUv3 devices in
>> future patches.
>>
>> Tested-by: Nathan Chen <nathanc@nvidia.com>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/smmu-common.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index f39b99e526..7890aa12c1 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -20,6 +20,7 @@
>>  #include "trace.h"
>>  #include "exec/target_page.h"
>>  #include "hw/core/cpu.h"
>> +#include "hw/pci/pci_bridge.h"
>>  #include "hw/qdev-properties.h"
>>  #include "qapi/error.h"
>>  #include "qemu/jhash.h"
>> @@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>>                                       g_free, g_free);
>>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>>  
>> -    if (s->primary_bus) {
>> +    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)->parent,
>> +                                              TYPE_PCI_HOST_BRIDGE)) {
>>          pci_setup_iommu(s->primary_bus, &smmu_ops, s);
>>      } else {
>>          error_setg(errp, "SMMU is not attached to any PCI bus!");

