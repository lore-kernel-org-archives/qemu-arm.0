Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3262635lfb;
        Sun, 8 Nov 2020 19:08:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPWKDmFqHwc5wn0Umqi5xcLecUX9Ovwr+JHsSq0MVK4AeKV8k3e8ucKGdeuBWp8m6vcnMa
X-Received: by 2002:a05:620a:4d1:: with SMTP id 17mr2140752qks.40.1604891282416;
        Sun, 08 Nov 2020 19:08:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891282; cv=none;
        d=google.com; s=arc-20160816;
        b=cW04g76RKf6/eK20Zg4PoW9NB1lH0f23x7A/VPvgpUZ2vkiTdOAWxFUe9Q39n86nBw
         nv4MdZJN0eRONm7JBE80hgHnVRc6KZdubtfmWgvPUfUaQnZhV7nLGMki1Bd6K4TjZfYU
         pj7X5rXl6pt28z/Z8OPohlYv0SHWCWG2xUP7Ip03e+58UgyevJP6KFzlRa78ws2mTmvP
         GVfNr4agQKKuprZR/JC2W8Y63RhR//82AdMO1/JvMgy8K4rLxzgXDkcuq+3khf6v8t4O
         owZFQRzH8KWX0mXBZVyAlCRfSpz88+n//M+m8F5PY4OoDQfJdjvtQil3zNV0Jh6QluQQ
         WVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7Ce6RGYu/wkHKdzCLmRvlchnUXn9v294+gQx+31Ekas=;
        b=bdmbxY//MrxmrBlzpM3dpZUsYUZY/obDi7ILOJ9qvH0qZM6rkIelKuO47bbD6FPv7+
         GbtJtwQ0soWi4JaP1G4QgFa+0SO2YZGEbZmRNohWYmOmpE7bhwXvzrTDdv7SmfmD/u6v
         kzkV0SktYhNfBULCz/qOuksnV9dhBpI8rJjx3F4tjQ+IpEKiCGUk+QJulOIkhxkglsEK
         bG4pp4osKwco1ufeYKLEM9pR2DfZ7xWuW61t1o0YAFHxthKoNjvNg+qwHVsYVPAlc0KY
         gERIQpeUt2Hy/4/eXEdjt/H3Wb4uDCWdFYQru4iXJXeEE6UwRNiyCL1jy+69XSMJMjJv
         F5xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si4819387qkg.229.2020.11.08.19.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:08:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxXF-0005Up-P4
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUr-0001aW-LO; Sun, 08 Nov 2020 22:05:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006cB-Lj; Sun, 08 Nov 2020 22:05:33 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpY6GvZzkgqn;
 Mon,  9 Nov 2020 11:05:09 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:09 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 02/13] hw/arm/virt: Remove unused variable
Date: Mon, 9 Nov 2020 11:04:41 +0800
Message-ID: <20201109030452.2197-3-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1s5/7eAFwYz

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

