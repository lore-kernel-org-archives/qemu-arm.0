Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp153301njc;
        Thu, 5 Jun 2025 03:56:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8qJIp2xZHVE2N4O3OPTrvCwngzVSx5A0iDtveD4KJcJuWBLw4ERZNfuqJ/FybCBL4zB2CymU81EZtOA==@linaro.org
X-Google-Smtp-Source: AGHT+IGWbIqgC9ry3IVSxsGgHktBGlZRaFPXiy2yDxGbR0AXxXI7AnfqH90A4a8rJ/EwlI8LFRlU
X-Received: by 2002:a05:622a:1249:b0:494:b2ac:781a with SMTP id d75a77b69052e-4a5a5765179mr102870781cf.2.1749120963712;
        Thu, 05 Jun 2025 03:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749120963; cv=none;
        d=google.com; s=arc-20240605;
        b=eyGQ6mpuokFCPSk3wU+BRSs0WmrIlKd+SVfOjukvFXh5IXCM23amJRocvXNwQWxs7j
         zR4o0c3TeIsLuo1Qo/cSjjOzNLAluaEOLiPjs5OEjv+LGmCJKU/ZsmJ+wmeG+AwnIbay
         sLCbJ+kNJaTnJAVELAykWd3EIqoaqUpd1Y9g6bZA7XfaRKa0pU7Lvn0NIBVytAcXdAw8
         iOVOGaFbGHAUqg7W1//0tjwWAvRxfNdQ8kwSPFgi3L22G7tn3JqWNaMeBne3FFBkoVvt
         ixARlYxuYD7O/dShcdLH0OpX78XejbchjFLGnMe+mWb27ojnlc9IiKT4IvPGoRfOcQm3
         n7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=sWe/II1jYF8dDFyyN4/C5OjrhZ31snk7yFE94qDZKKw=;
        fh=uQC/EhY4ok3Wg543Qyp6LdsK7XbMr7lSAnH6l83WZcM=;
        b=A48ueJt/sAxsU5N5G/SWwqUOkt5wfNODvHGW6ReGUf36ng7RhbdEeuVWLtmlMiyCZa
         jFcRmjFEfYFO4CHzYRYxg/DsWuyyLPkepQz3hnl3kBpqZKs2ChYN0nB2/UXV0RbC0WEC
         5fAuObli8hkIgfr2h1s3S4ziqr7HEYvqP4U3PBipWT4+o/1gZRfFelVmr1sLZFi+Lku6
         eDmOx95RONG+QCwqlpTs0JViSodLKCUEXgaiTDB3aANORJ1Ifn/NsOZqy/jgydKZICYs
         ZErPePydcf9VqmO/Tm3RmgyHdwbyFrNXwWMo52MN1EGX1O7FdCgCWXsD6ueKqP8advGa
         7bjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAFrb1B6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4359fb3f0si176553261cf.326.2025.06.05.03.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 03:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAFrb1B6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uN8G0-00053W-G7; Thu, 05 Jun 2025 06:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uN8Fs-000533-59
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 06:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uN8Fq-0005KY-Hc
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 06:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749120924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWe/II1jYF8dDFyyN4/C5OjrhZ31snk7yFE94qDZKKw=;
 b=iAFrb1B6HM5MSKw8oQADKLBhOtWcM+V135xdQr/pIqj5ye3045U5SzqQjfvHQusoa5y9AO
 BSSrez2eSKr7wF212VWIG/ugMpxOhc4PgquC1ssOemOhp2MZbq25gIdZ9x08rcyNZ7ro43
 UTYskbxy1TjdLNn7kzfi++cPj79daGE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-RqE8M95PO2ieMhApf4vzeQ-1; Thu, 05 Jun 2025 06:55:23 -0400
X-MC-Unique: RqE8M95PO2ieMhApf4vzeQ-1
X-Mimecast-MFC-AGG-ID: RqE8M95PO2ieMhApf4vzeQ_1749120922
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso530734f8f.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jun 2025 03:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749120922; x=1749725722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWe/II1jYF8dDFyyN4/C5OjrhZ31snk7yFE94qDZKKw=;
 b=mxVZBQY59UYE1OZKq0OTb7rqooTNVg4HgT/pDfke+QRDPhQcO7aMeTkfxsrQxYs7/E
 n+ceg29rBFqemekLFZDiOvNNx6jgtoKKQ9/qYnOAYGYZwXUTZhEMIRuF2Rr1DUm7i5tP
 7mPhZ5uQT4YkiaeW8wkexZ+FlWNnrw3RWQ+tnpXUTbtSMgCLXmMKO+GakCkYuKmMyz2x
 V4Ozg9Dpk1ZgebdRziGz0EydHpx4kmgOIny2GFZlQlIVAMnoD7Nq0dziUPczyLLHvhtB
 7zhEjrj1yzwcdErLaoDFK6QB9j7oDHhltFShpqnoikhPCjhO6oiBkAdzeMqW400wRABe
 P8Qw==
X-Gm-Message-State: AOJu0Yztn7FZNPRv1i8y9RgEYIOFpfe8WkeguvfVO1gJBjTnrhx123Dx
 DqEmHgSkiiyHJ/we0OaJK1NS5OcOQIZYR3T7YyQia2zYB/7PPeX5ehcHnm7837U3yVsSItIPQAe
 6Brn/1Rtpa+p7Ym2IDOLMEhthPgYiQyYCgKQoqVFtpzbkVZy3t4xA69mJ49m2GWUY62jGbNHFX9
 PIZWEdzR4y0pQQnWZAxQe/Ze8Qtjxsq5ebpaPzgYekKOs=
X-Gm-Gg: ASbGnctLpUdzqX8A935mGlMgnEMPq+yHCbtKKTzCrpvDmb62fdbhg2o/C0rY8yasWW/
 gS8NUACUuV50Z3dNgOOwlCVced+uB+G+NSh8DtlXwtC4kQf3mBaLFW8g/0c2dojzmEbHnsscIXl
 s1nm2Rk+kUtNw+Xje2vDq7dqNELh99vqL3nVtD+vdmz2lY33CEy8zTvUQ7B4DW+96HR0xfQa4pL
 0hlOsgm9rdsNtxj9jrWgFVWGjyf/x8bVn4JcAr5kQumnUIgR6fQ9uh6PouU0GTZ/3BdQW0a9Ot1
 4s60dwyESvQSN0yMMXb5vXljipD73CJ3
X-Received: by 2002:a05:6000:240b:b0:3a4:fc75:d017 with SMTP id
 ffacd0b85a97d-3a51d92fd37mr5504314f8f.26.1749120921866; 
 Thu, 05 Jun 2025 03:55:21 -0700 (PDT)
X-Received: by 2002:a05:6000:240b:b0:3a4:fc75:d017 with SMTP id
 ffacd0b85a97d-3a51d92fd37mr5504272f8f.26.1749120921349; 
 Thu, 05 Jun 2025 03:55:21 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526ddb8afsm2070206f8f.0.2025.06.05.03.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:55:20 -0700 (PDT)
Date: Thu, 5 Jun 2025 12:55:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum via <qemu-devel@nongnu.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <qemu-arm@nongnu.org>, <eric.auger@redhat.com>, <peter.maydell@linaro.org>,
 <jgg@nvidia.com>, <nicolinc@nvidia.com>, <ddutile@redhat.com>,
 <berrange@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
 Complex association
Message-ID: <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S2sEt6AnwYBl

On Mon, 2 Jun 2025 16:41:05 +0100
Shameer Kolothum via <qemu-devel@nongnu.org> wrote:

> Although this change does not affect functionality at present, it is
> required when we add support for user-creatable SMMUv3 devices in
> future patches.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ab67972353..7e934336c2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "cpu.h"
>  #include "exec/target_page.h"
>  #include "trace.h"
> @@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
> +    Object *bus;
> +
> +    bus = object_property_get_link(OBJECT(d), "primary-bus", &error_abort);
I'd replace this with direct field access like in smmu_base_realize

in QEMU with PCI, usually we specify bus to attach to with 'bus' property,
wouldn't it better to rename "primary-bus" to 'bus' to be consistent with
the rest of PCI code (and before "primary-bus" shows up as a CLI option,
so far (before this series) it looks like it's an internal property)?

> +    if (!bus || !object_dynamic_cast(bus->parent, TYPE_PCI_HOST_BRIDGE)) {
Also looking at smmu_base_realize, it has NULL pointer check already.
Which also rises question, shouldn't smmu_base_realize check for
TYPE_PCI_HOST_BRIDGE as well (aka can smmu be attached to anything else but a host bridge)?


> +        error_setg(errp, "SMMUv3 is not attached to any PCIe Root Complex!");
> +        return;
> +    }
>  
>      c->parent_realize(d, &local_err);
>      if (local_err) {

