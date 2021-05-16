Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp347663lfm;
        Sun, 16 May 2021 03:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdhlOtnepBeA8avgahQLIBd87Vca39ZtFVNCua/zw7t0bzjIgE5UuPgZSb0dyL0aKP+zJS
X-Received: by 2002:a92:c26d:: with SMTP id h13mr19798971ild.131.1621161111565;
        Sun, 16 May 2021 03:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161111; cv=none;
        d=google.com; s=arc-20160816;
        b=n073RRlBT9bmwtxkPB4aLcUASHc/7tPZmV63zN4BcTLeaGQvHRFL8HvNc3Sz/X6+35
         Gm2dJ1CuLLSHzvXeDQgMMdN5CoGfb7y1BdsTg6+/vSUpT+0SMN720foW+Lnh99Ntjriy
         qCRWw+sSfxFMpdlyzLGB+2p6TQ31GuFyOT+BC1PL/wuKxrS5TW4GChKcQy396SlxFtXb
         7C31w26GFI8jwT79fIgno/3dFDuea+CN0Wbp/P+jXUhzxrcOYP8jR8tC96LxPpwBPng7
         MAf+1Uo9b+z8KeTrk6lWHteWzgcn/op9XKDbNEE65NqS8b1CUyf7bdwFqJgIcIk9E3AN
         m+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=M+1OHYpSL1tSD6iPr3fvqyZXHh6IRGWU0ABA9ErH2f4=;
        b=UHYOVFbRvKHE7qs6fNv5BWyKHvLBQJ9bPJ5ubtrUX6CApjhq24gyvUZOJ1FZmJEHzK
         kgArddOz+extGIFYsD5jVfbZ7IM0ABGZ/nbUdleQQQk2NNy/6xU0280J/ctz+PrLd0nL
         IPjR4/PF4l9GdKEXNNJ5JmzViYIwVwP40jH/ZhxreKjxzTdDIhPasdoakr1nUa37CKli
         yPyRFJ+EHSF7ivoC0ySmwxHM+WTwW+3ChW+iRqmafOApo0jx3jX/O/4lzz8T0famUp+v
         DvdjewSiLwJrp+xmEFlpPr9iAcymgnAfrPRexsMqxB3/liP+0KDY7qq3imz+lDUh7Yv5
         /CNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si14603038jas.117.2021.05.16.03.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE3q-00055X-TQ
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1V-0001TN-RI; Sun, 16 May 2021 06:29:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1M-0007B1-Af; Sun, 16 May 2021 06:29:25 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdhv5Rw3zmVNP;
 Sun, 16 May 2021 18:26:23 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:07 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:06 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 1/9] hw/arm/virt: Disable cpu topology support on older
 machine types
Date: Sun, 16 May 2021 18:28:52 +0800
Message-ID: <20210516102900.28036-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516102900.28036-1-wangyanan55@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Of0oDlxYRKL5

Add a compat variable "no_cpu_topology" used to determine if
a machine type has enabled support of generating cpu topology
description for the guest. Also, for compatibility we disable
this support on older machine types.

On existing older machine types, without cpu topology description
in ACPI or DT, the guest will populate a cpu topology by default.
With the topology description exposed to the guest, it will read
the information and set up its topology as instructed, but that
may not be the same as what was getting used by default without
the topology description. It's possible that a user application
has a dependency on the default topology and if the default one
gets changed under its feat it will behave differently.

So in summary, we only enable support of this feature on the
latest machine type and disable it on the older ones (< 6.1)
to avoid possible problems.

Co-developed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c         | 5 +++++
 include/hw/arm/virt.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0a78532018..c07841e3a4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2761,6 +2761,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    vmc->no_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(6, 0)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..f546dd2023 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -129,6 +129,8 @@ struct VirtMachineClass {
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
+    /* Machines < 6.1 has no support of cpu topology description for guest */
+    bool no_cpu_topology;
 };
 
 struct VirtMachineState {
-- 
2.19.1

