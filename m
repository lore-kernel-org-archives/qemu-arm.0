Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp391830dyc;
        Thu, 3 Jul 2025 01:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCs5jbyj5+Izbe7PnU0t1HBDM8WhCDx68nO8BLk6F4BB2kARYBxzE6aGI+iOyASSNPHEL6mSe4Wxi0sA==@linaro.org
X-Google-Smtp-Source: AGHT+IH2nch/oVokkJcLWeZnXRRXbaylKPShVzx3wit6JQeG3jVMA/lTj1F3PtxkiUX2TZSwHy9E
X-Received: by 2002:a05:622a:50:b0:4a3:ebb6:6a62 with SMTP id d75a77b69052e-4a987a43c99mr44041211cf.31.1751532479742;
        Thu, 03 Jul 2025 01:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751532479; cv=none;
        d=google.com; s=arc-20240605;
        b=lLEal5pwOEU99stxZgf1li11k5eZAfnfLhDbU8xk8/2k6cp9jAouqIlIcuO9NRpHmS
         xOVfoH4HUp38KRJAyV/Ccn7MIDrOtJer6C90efmiTUunJcBxU9B03BNR5K/elbLPLO02
         oNATKGRFoRxspNwGFfCt/HdYC4cIuqTRMdlKvn480+RH8WfP2HDoA698H+iwv+TtgSXY
         13Q350ZEp3kk9mtvZ/yE1b75Klah0icHGtIuDo9gZmkbvauAvGhwxYk9I3thxLllQXws
         sb3iqHZecGB4DzHbLk2CtgCvSjnJaLDc1mn9lDDMvamiRYVwq+ekjBLctNj1yvYZm7yg
         pUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=nuPKuzn2rZM0TqKIbrIOKVj2I9EowGXDup8aVxEN0T8=;
        fh=K6DRGZ9v0QUPI5y28IyZ3JGzxcTK+mf/rR6Wgk4w8yA=;
        b=NsSoE2sxQA6V8ydH93JneTGIrBPkZoOtCoiZcI/o5ms4nCEKZURjsYe1AG4sI8ozKB
         JdamTk2ljrbqZzds+eR68X69xyQAcutzh7u0SxIZGRAG4Vy8rnfDJOsT8FaHMdrgKhv4
         ZX7WReIKin8EsDZhK9sHP6cE4baVgdsdx8KEw7IcY/eO0hiOceH+/IPkH0G3X72Yhxgh
         /dqnY8XyufGmGTPEanQMZmabtUY4cHP0o39VgdxepLSG6PgTtNGlo/X02/YnlzygvUfE
         6zAJejagr3ArGow6hpaGFPm5bZUyPdz9uW6+vVqL+oisyAsAh6j5Q5f5nq3AUXRTvwzv
         0o/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a8183f0348si98390951cf.631.2025.07.03.01.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 01:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFbZ-0006aT-Sg; Thu, 03 Jul 2025 04:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFbV-0006YF-KI; Thu, 03 Jul 2025 04:47:39 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uXFbU-0003q4-2K; Thu, 03 Jul 2025 04:47:37 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXr0v2tDVz6L5fn;
 Thu,  3 Jul 2025 16:44:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id F3E82140371;
 Thu,  3 Jul 2025 16:47:26 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 10:47:17 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v6 01/12] hw/arm/virt-acpi-build: Don't create ITS id mappings
 by default
Date: Thu, 3 Jul 2025 09:46:32 +0100
Message-ID: <20250703084643.85740-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0xLglynGN0bE

Commit d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables
when its=off") moved ITS group node generation under the its=on condition.
However, it still creates rc_its_idmaps unconditionally, which results in
duplicate ID mappings in the IORT table.

Fixes:d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off")
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index cd90c47976..724fad5ffa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -329,12 +329,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Sort the smmu idmap by input_base */
         g_array_sort(rc_smmu_idmaps, iort_idmap_compare);
 
-        /*
-         * Knowing the ID ranges from the RC to the SMMU, it's possible to
-         * determine the ID ranges from RC that are directed to the ITS.
-         */
-        create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
-
         nb_nodes = 2; /* RC and SMMUv3 */
         rc_mapping_count = rc_smmu_idmaps->len;
 
-- 
2.34.1

