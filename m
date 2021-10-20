Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1639605lfc;
        Wed, 20 Oct 2021 07:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz62GOFVmG1wCmOE3Bt/2zjVg1hWK64OTglXjlU57iVtKi2CGuMY7mn/ngkwVKsLq00S4H
X-Received: by 2002:a05:6808:d50:: with SMTP id w16mr6437854oik.128.1634739769385;
        Wed, 20 Oct 2021 07:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634739769; cv=none;
        d=google.com; s=arc-20160816;
        b=0jqsTGBddRzrArhsiR0CoYj/bkkyql3U0+Y+XdysH7xF40ECwgx5xVouiC6I9hNrJp
         Tgm9v8uwWSBTmFTMyMNOEKTxjFu6iOrnSAKsLlhUc5LrhQ0iogbnsgnE6yVRXv0+TLsb
         1mDqt7ggrJt9S/LY++oaNzll0MY695JQ+a1APGYwFBimnLAD6SA9o3cd0M09nVPhTMII
         Yb73WdCIfF/9WmmYuiw6SgmkugSFOerOeaX4hd6In3AmPGKQ9S8m5ri5mQbZBeRsNsqv
         58E9eZF1Don9CHAXsTvl8wB+R/jbaXjasOxoEEM9y+YCEVGatpMWn14d6vD6lGsJZgWr
         pWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=16QA+VGL85nPXWMLyjQXioksc0WXJb2g9smkiBgNFJw=;
        b=uR8MrQaKryRvCScn3OIXQL0eXZctOeuokdNSy5iOn5DEHi9zytfLlo+vePwvmPLlZ3
         sG7F3fVVcwWakJoZXtXxrcpTT5rwjlShevSOzohMUZPv+djD1iFYPZaxPAX+iAuxwYxK
         H6/bzrDCU/m+9DwZ9/CRsiu2Ctbi/1zchaSj7xEtWxGO3iLFIW03uepXj6Dmg8oObDVT
         WX/Vjd10ZoH45XJAszgdN+wSHbgT1euqCiJCpVEThvzAXzd89rUKssCRLjcFdY0FFPqU
         9xnMcqlHSvpT4pKmUydpjJ5k5uJO5dgnCYF1Fwzxg7A5c8onNttP5c/f03sDxM/+lBiP
         0r5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z63si2483772oiz.172.2021.10.20.07.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 07:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdCUS-0000Zk-JX
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 10:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTK-0006sp-58; Wed, 20 Oct 2021 10:21:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTH-0002A2-1E; Wed, 20 Oct 2021 10:21:37 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZCN04fctz90Lj;
 Wed, 20 Oct 2021 22:16:32 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:28 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:28 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Eric Auger <eauger@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v9 1/8] hw/arm/virt: Only describe cpu topology since virt-6.2
Date: Wed, 20 Oct 2021 22:21:18 +0800
Message-ID: <20211020142125.7516-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211020142125.7516-1-wangyanan55@huawei.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: +YsXFHQL5d/J

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
index 4160d49688..15e8d8cf4a 100644
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

