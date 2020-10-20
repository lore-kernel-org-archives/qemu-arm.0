Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4778887lfa;
        Tue, 20 Oct 2020 06:16:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBPhKDPdSXmkbBPoh8KKTQZsoqhbD6bJGv10vLIlSbvgO3klmTWuEDHuMKLUTB+RZCDpue
X-Received: by 2002:a25:d43:: with SMTP id 64mr4042106ybn.308.1603199776217;
        Tue, 20 Oct 2020 06:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603199776; cv=none;
        d=google.com; s=arc-20160816;
        b=kHvCPWk9p/TpzNgwWDZ1LioYS2tqAnJk6DlcmaAyPoZOBVqfSYzBdQS+T0UaihzU04
         ID0X9sIg0/Ymdx2ff7dsmi/2pOxw4UKa7+UCRYJ03UBangTpX2FlawHxk81HIoy/k8Hy
         /gBctjKGjm7FAkfrBFyaJTerRa0ZLyGGftnDyUI6ETM2Z2wgGSpqjDkxtJyrnXKCRLY0
         r4R1EXYMjNDXIBeEGWPDapKRP95815WQLFalVudUiQnDRxFgnza4aFOvcrduaSiHRaat
         NYKzyQNGitoPFm74u+XGRTH3t1IGnO1xIeSYxI9SZXaw55qZDmItEFHEs9Q3pdE3d4vS
         Z+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7Ce6RGYu/wkHKdzCLmRvlchnUXn9v294+gQx+31Ekas=;
        b=Xaa6aH3XIJGCRfzmgH+vJy3QWuJBOE3oK/QE79St49ButLSYkx0MuzQhF+qeFKs1Lb
         iCGeF9R5G/RGUFzozE6QAmLAakkL03nIaW2mxmCC+yZSrUmWhZPU36T5xWomfH0mP2ec
         7jUcBNVMSruu1oO0fduf6hK2Gc3g6pVti4LujopLJR5EMRLy3Qrfdhqy8xBaDJEb2MV3
         2oagbk58ZXZ7wH7t3DoD93KKJO/mLijyubMpAHKqpCgn3Ru5dJoRaI0jkowMYyBeUZPq
         fozldYqzph+UkKJ5mFaaebBukNGUyCxdA28YW2QDPt0ojGxbcAHViFsAb63srbgnmFjm
         XOPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s126si2035677ybc.95.2020.10.20.06.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrUt-0000IM-HM
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU3-0000E7-CD; Tue, 20 Oct 2020 09:15:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5266 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrTz-00076U-MC; Tue, 20 Oct 2020 09:15:23 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A51C4423EE2A1BB2D8FE;
 Tue, 20 Oct 2020 21:15:07 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:14:59 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 02/13] hw/arm/virt: Remove unused variable
Date: Tue, 20 Oct 2020 21:14:29 +0800
Message-ID: <20201020131440.1090-3-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1HHWc6GK/xJ4

From: Andrew Jones <drjones@redhat.com>

We no longer use the smp_cpus virtual machine state variable.
Remove it.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 2 --
 include/hw/arm/virt.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0069fa1298..ea24b576c6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1820,8 +1820,6 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    vms->smp_cpus = smp_cpus;
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 953d94acc0..010f24f580 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -151,7 +151,6 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
-    int smp_cpus;
     void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
-- 
2.23.0

