Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp369131njc;
        Wed, 12 Mar 2025 09:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBVTEyU1C/dCn3neWD524rSNnTwS7lBdxHHGJosWLbYFmUKAdZ7qpMLxSGmB0yr0CNyA+hbaurcO+F+w==@linaro.org
X-Google-Smtp-Source: AGHT+IEkswbfrwu8a4HAFT206Pkj7e5QF/LN3KyAKB1DrCTvMpOkvZVNsUaXTRFAffCbGhuAI4wI
X-Received: by 2002:a05:6122:54b:b0:520:51a4:b819 with SMTP id 71dfb90a1353d-523e3ff3531mr13825770e0c.1.1741795704894;
        Wed, 12 Mar 2025 09:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741795704; cv=none;
        d=google.com; s=arc-20240605;
        b=iunlHA6Y/1uHR9Ion/FIFZD/L3Av0GAkpV3zEBLZzhtZvfm3z1TktcLzKk/FMsbtxR
         Ui+aP4XxxTyvNp+N2ZqVpBmksYr64uAa0hT8MPJtaMWzWmXY4UMWQNRzS7l7DYG3rjmV
         SVhZCrUXGSHshQdFCBExVt5rMcT+m3VYs3X6Sl0//tSIOKPErM1IB4psg1Z3I08VD77h
         5HO40agHi9bqpuwUUAPXPaUwZpWiizFSR7WPVbw05Yvd98HLnALKr84jgbS4QgkgVlR2
         Dhkl5T/hzx+L0urVL9PD9MUCCbXM7wQQORZnYcPwK4yZvUfNRqtrRnhXCGiitWZ6Cb2U
         LGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=N1SBYqX0kE3/4QZuDXZSGhhQS3YjWMXj8gtvzLqz968=;
        fh=qVUkgNdPb/utxGnGvS/g2SeoBHmJnP9NZiymwHlSYus=;
        b=lhafh5vGQnPGXWy54pSIHIO95DLe66IEiwUKprXhMDyQ3OYvCSbFrUznaXA+YlSaRG
         nlSJFck8XNvgDO7qqWu8ytagDSQsglJWOMuyDtTEF9I2gRJIQ4UsVPWI9CRCnOlbg1gz
         r5EnColWGSIqe2jrgarPIpVkPGTVDLTk1BNrWR1YCH27NiWBxj5ZpXiVoQCA0uLjojYT
         QxhpLapEtZZNXZK0dkkGC+XhxKokMTG8YvNQZYkESPFO2Vo2/ZnERn99KgxDQhynYlRe
         WRg9Wgk4le7aeTXLsNir82WsnKMiZA7boesBy1GOjw/Yut9tC9dc4a7/o6Y1wwADJeX+
         yCIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELvpf59A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-523d8a852a3si3121050e0c.17.2025.03.12.09.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 09:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELvpf59A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsOcu-0001JI-27; Wed, 12 Mar 2025 12:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOcg-00019Q-Gj
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tsOce-00086A-Ae
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 12:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741795673;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1SBYqX0kE3/4QZuDXZSGhhQS3YjWMXj8gtvzLqz968=;
 b=ELvpf59A1Gv64lVMuuMRNkTHTocV0dHc80FwueiqNfdGCBbVNZHFFVVasTgu9pf2WAV+gR
 WwwCPY7TROAO5H1ncX9J9Ioq1T9y//zsQAWJjgCHOmAdH84tADyOSmTLNbW5LomSVAwTaU
 az3r7AKVY5ZOiamlfCBZwaZd8XlUhUo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-EtYc-_faMT21Hkc_X0Czwg-1; Wed, 12 Mar 2025 12:07:51 -0400
X-MC-Unique: EtYc-_faMT21Hkc_X0Czwg-1
X-Mimecast-MFC-AGG-ID: EtYc-_faMT21Hkc_X0Czwg_1741795671
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3b6450ed8so1244323185a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 09:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741795671; x=1742400471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1SBYqX0kE3/4QZuDXZSGhhQS3YjWMXj8gtvzLqz968=;
 b=Y+V5X6hE0YGMNymeDoL2mAZ7Y++lJugPj6Cc1plguF2p4FkJE2XGPXGBI5t6ZqCctS
 0OP+wyIIGC0XimrbfY1HEFWlx4nr/xDkrHYxAsIbtQxe++GfQi5qNGr5DgSBcPLs63vf
 TTVF29+ZHL2C1GC3uMpQ89XEibY2DfnS6ZaDyDJzl9MhBma2vk6Gu95p3rxw2csu+cfK
 M/a/Byw7jA034ISmUjZw58pVXYQTqMwK+TdEohZkpsI0D0cVl7D9gwI5vXP0kQCyqrJG
 BLLqUF350f1mCinXSvPJHDQQuBw/SaYF/SlPfDRoisGPZLeEnb976dubjKd++28yW+Zo
 0Hlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmmz+8Xlg53zC1aB6nKQtl3aq2rZp3UBOR9kvAO7x9w+WDQxo93rYtgOe5Wdj5iQfGVetZDX/FFQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxx6YN5zu+XFENI4P8HlyS2Ep4U0lhsz+9cGYQ5USXFBJ3z4UnK
 RXA+FqLWhIpZj+1JkKedI7g0ss/MmuvNErlxRi39g4GxgP0WJk4nTMHCETdoD6OGCAzBw0Dghqh
 sak6b8zm0ED4Pm0qyIAX3wJej2mNt3oWy3IqRwadT4BIXpSFMWA==
X-Gm-Gg: ASbGncu3Ng4Mv3Amh0GjJ1xfU/6RnxXRq3dT/i41W9TXFULZ2IxA5KIWIb4ee30SNo9
 tDpcbBxphqZf6T9rsfdweHjleM3AAqJYshREszcYM6LBcoNOUWPg7p6t3h9039gxcE1MzkfWveO
 xgiVUtqnz52JWVEL8ou0mk/bMzPJ64910PtMX5a7GxxPJ29PG89R9/YujTxzgmmVwVnBpq3ThZN
 Xbjzr+q0kYfI4lb+yzBoVJW93KKFIAYja9Qn1Q2b2XWCFOSV03m18JDFKNhKoLlNKn7Oo9/5hwV
 eU/MhRjGg5Acos7YZ7Sw4uGkEf15iP/tothXWXeP8IZLXO59v2mbLu6dP43CIhI=
X-Received: by 2002:a05:620a:488c:b0:7c5:3b8d:9f29 with SMTP id
 af79cd13be357-7c53b8d9f66mr3110150385a.21.1741795670754; 
 Wed, 12 Mar 2025 09:07:50 -0700 (PDT)
X-Received: by 2002:a05:620a:488c:b0:7c5:3b8d:9f29 with SMTP id
 af79cd13be357-7c53b8d9f66mr3110147085a.21.1741795670455; 
 Wed, 12 Mar 2025 09:07:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c53df21c89sm706935085a.38.2025.03.12.09.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 09:07:49 -0700 (PDT)
Message-ID: <79bcc36c-1a12-4b18-a54c-afe734d6bef0@redhat.com>
Date: Wed, 12 Mar 2025 17:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hjEYF-qC2HJcuIQCWQRJVd7KT4HhBy-2adREZ8AtrBc_1741795671
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: p83tP6YQLgmc

Hi Shameer,


On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> User must associate a pxb-pcie root bus to smmuv3-accel
> and that is set as the primary-bus for the smmu dev.
why do we require a pxb-pcie root bus? why can't pci.0 root bus be used
for simpler use cases (ie. I just want to passthough a NIC in
accelerated mode). Or may pci.0 is also called a pax-pcie root bus?

Besides, why do we put the constraint to plug on a root bus. I know that
at this point we always plug to pci.0 but with the new -device option it
would be possible to plug it anywhere in the pcie hierarchy. At SOC
level can't an SMMU be plugged anywhere protecting just a few RIDs?
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c327661636..1471b65374 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -9,6 +9,21 @@
>  #include "qemu/osdep.h"
>  
>  #include "hw/arm/smmuv3-accel.h"
> +#include "hw/pci/pci_bridge.h"
> +
> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +
> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
> +            object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                     &error_abort);
if you want to stop the recursive search I think you need to return
something != 0 here.

I don't really understand why we don't simply set the primary-bus to
<bus> where -device arm-smmuv3-accel, bus=<bus>? or maybe enforce that
this bus is an actual root bus if we really need that?
> +        }
> +    }
> +    return 0;
> +}
>  
>  static void smmu_accel_realize(DeviceState *d, Error **errp)
>  {
> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
>  
> +    object_child_foreach_recursive(object_get_root(),
> +                                   smmuv3_accel_pxb_pcie_bus, d);
> +
>      object_property_set_bool(OBJECT(dev), "accel", true, &error_abort);
>      c->parent_realize(d, &local_err);
>      if (local_err) {
> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_realize(dc, smmu_accel_realize,
>                                      &c->parent_realize);
>      dc->hotpluggable = false;
> +    dc->bus_type = TYPE_PCIE_BUS;
shouldn't it below to 3/20? It is not really related to primary_bus
setting? Thanks Eric
>  }
>  
>  static const TypeInfo smmuv3_accel_type_info = {

