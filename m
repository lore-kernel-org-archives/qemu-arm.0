Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp407329dyc;
        Thu, 3 Jul 2025 02:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7cbD52WPUkDgIY/cNCecRyOb1Il6AvUaVdIa/r/4L6iwVYRAjut/HecUA0KGPDMQuJJjr78XWJCVmAg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+hjegHJjKrlwaQbX8K2MOp7KP6ZDP7Bt6RnHjFyJ9b3LXkzVx+YAtBysaq80aixQCGfuk
X-Received: by 2002:ac8:7e84:0:b0:4a4:3c3e:5754 with SMTP id d75a77b69052e-4a987a20d69mr43364111cf.32.1751534549583;
        Thu, 03 Jul 2025 02:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751534549; cv=none;
        d=google.com; s=arc-20240605;
        b=NYQgfycUNsGPO7mqmFfI4Y6mcYmJPhNON9zrXOd2AKkSFvdOLbUKXgYqdrATq3UHqP
         1hSQsumilIea38CDKyWchXAK7tJqzyzilQLCVdBqRPnaJWW7aG+8GI6NYHVnFsjrBUR/
         W4241P0caIXUrJbqhdPCXeW/j7wg42qviQ5zirwuLG2mWwXb16SP+xfvpucXc9ZxWAAV
         9qTWdtGDSVkXRc+6RAloCDtlObDWyXmUbnx8tYqBqNv5zoprnRYAb/Zco1pir/nTLzCY
         T5biR4Z+q+ns8oM98AT93PfrcB3NXssKRTh+jMLuXu9K700tGtZ3SwFQSDANtmcBJO+a
         +PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=Z8dQrfvxtxjc/iudA2wCHV4Q1u9HwlGD4HRwdGGyvrI=;
        fh=2ryYdeFXtBVzaJhhw8O3vsTJ5eFBUmhd9iet+vpA9d4=;
        b=SODQdxwfjgopU/pMsq3dcZkhOTEOyhWmFSjJPuZo/bFc9bTC+3GnxvhT+FjAeUvNRl
         NUPdhQx8Eyq6KMqOBIhlEieCThD0yr+t1w2pgwF7XgJKZFnFx49Qko32yQR1VLEhNDok
         jpQJAb1638kZxnsIOX7ZoRwkIOK9MCsyuVrtdUltbC9Bv9H5CWrzqPJq49DkpxtcrjwN
         E0oJckvJ5jMjZkFYbfsnBxlhUrDZHpHX/FAnfBOkgPNNo+Ofs3WQW230RIw1Uj/2sQ/C
         YkPrNekXmgucm69E4uCnQDkF1wC3VMprzTS/bGhVCTHWbvcDskzpIhq7byOysD4pqtVR
         a2kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc552fabsi141703431cf.481.2025.07.03.02.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXG93-0002ek-00; Thu, 03 Jul 2025 05:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uXG91-0002eP-79; Thu, 03 Jul 2025 05:22:15 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uXG8z-0006wx-G7; Thu, 03 Jul 2025 05:22:14 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXrmv43GYz6L529;
 Thu,  3 Jul 2025 17:19:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 39A231402F0;
 Thu,  3 Jul 2025 17:22:07 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 11:22:06 +0200
Date: Thu, 3 Jul 2025 10:22:03 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v6 01/12] hw/arm/virt-acpi-build: Don't create ITS id
 mappings by default
Message-ID: <20250703101613.00005bfd@huawei.com>
In-Reply-To: <20250703084643.85740-2-shameerali.kolothum.thodi@huawei.com>
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
 <20250703084643.85740-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1AadHLXa5f4R

On Thu, 3 Jul 2025 09:46:32 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Commit d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables
> when its=off") moved ITS group node generation under the its=on condition.
> However, it still creates rc_its_idmaps unconditionally, which results in
> duplicate ID mappings in the IORT table.
> 
> Fixes:d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off")
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
As per discussion offlist.  Why are we not seeing a table change with this?
Seems that we don't have a test for this case (yet) - later in this series
there is one and I guess Gustavo knew that was coming!

Anyhow, the patch looks good to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cd90c47976..724fad5ffa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -329,12 +329,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(rc_smmu_idmaps, iort_idmap_compare);
>  
> -        /*
> -         * Knowing the ID ranges from the RC to the SMMU, it's possible to
> -         * determine the ID ranges from RC that are directed to the ITS.
> -         */
> -        create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
> -
>          nb_nodes = 2; /* RC and SMMUv3 */
>          rc_mapping_count = rc_smmu_idmaps->len;
>  

