Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp946871lfp;
        Wed, 6 Oct 2021 20:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz881RJ8bT8ngf77gX2Uu+ijPrQkac4I1icfnM+w+fj2A2hXTVU4DpWQnt/Cg/P17hdVunK
X-Received: by 2002:a6b:b784:: with SMTP id h126mr1411456iof.194.1633576099724;
        Wed, 06 Oct 2021 20:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633576099; cv=none;
        d=google.com; s=arc-20160816;
        b=swRmOgZ42tpaaC/4fHVJrx9j2Z3UW3hQYbV5wMH1WrKW3oTVCm6UqrXBSBENPx4AOt
         q5f5oo2H1/UjzpWMDOnIkfgt6EnfOBTPTqb3/XA+sOLJ+po2iCaPKU8sqnCVGN8nXdRu
         THuYpA3RD87EHdxUfpT34IXR+T10paKjqeFPKYfbzBBGPvDDjzveGkBc4XS6lSMSo+/f
         MmWA41ikHAOOgc/oaCl7sxkD0muTc1tGkluUGLuarJopNcwKIvtrlxBtlJTFP+IOmHkW
         64txHDjPJgw69puW0VXZdW2pXc/GbIgtzc8wtxChXtYHwh72MdSBGnrLVAq0AQLDp6zn
         Nu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=LBFJeqdPDJ3Tt73CrjKnrRYOxRKDl/0MEArtYc2g6O8=;
        b=HAbQaEzTSYE+LXw4dg9IHh97RrVAk3YGk6UVZPOpFzL3CfU7x1nqm1eSfZ/IZHMOLz
         Cuf50A7cjryrAIGCGtSe1kz8X0fMEqLvDCfnRDYdRZjX6PDQ5jrqOVN00ShWEt9LZm6l
         o1jkWR/+sa2s4a37+uRllS5MEapnObE6oUOoTlHSPc5KDewalk+4mdEFicvbHURUP+X2
         qISAWYrnv8909hnYCTaI6UcYhm+USk5JutEbbURs3dNXl1FZYx7yFHzyAIinRSt002dl
         O2pJnVRe2C9q8lE/msu4tAxTat2Q6EoClaQwm4pm40LtFUYbjykQypOiKIHvEwhV5MnQ
         8lRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si24230925ilo.25.2021.10.06.20.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 20:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYJlb-0004fS-2n
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 23:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlO-0004f1-Uz; Wed, 06 Oct 2021 23:08:06 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlL-00011w-DU; Wed, 06 Oct 2021 23:08:06 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HPx6k6R4Mz1DHVd;
 Thu,  7 Oct 2021 11:06:22 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:51 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:50 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 1/8] hw/arm/virt: Only describe cpu topology since virt-6.2
Date: Thu, 7 Oct 2021 11:07:39 +0800
Message-ID: <20211007030746.10420-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjkzl6OrdmYo

On existing older machine types, without cpu topology described
in ACPI or DT, the guest will populate one by default. With the
topology described, it will read the information and set up its
topology as instructed, but that may not be the same as what was
getting used by default. It's possible that an user application
has a dependency on the default topology and if the default one
gets changed it will probably behave differently.

Based on above consideration we'd better only describe topology
information to the guest on 6.2 and later machine types.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 1 +
 include/hw/arm/virt.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7170aaacd5..d241516523 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2816,6 +2816,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     mc->smp_props.prefer_sockets = true;
+    vmc->no_cpu_topology = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b461b8d261..dc6b66ffc8 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,11 +125,13 @@ struct VirtMachineClass {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
-    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
+    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
+    /* Machines < 6.2 have no support for describing cpu topology to guest */
+    bool no_cpu_topology;
 };
 
 struct VirtMachineState {
-- 
2.19.1

