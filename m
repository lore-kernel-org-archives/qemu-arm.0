Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1439497lfc;
        Tue, 3 Dec 2019 04:32:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZEx3YhP4c+nyAcMMEvXDGSMxgPRN/xDTtVa723Lunl7Q9Glxr7vdjAutFlwc80QUApIxK
X-Received: by 2002:a37:a4c1:: with SMTP id n184mr4634317qke.499.1575376338698;
        Tue, 03 Dec 2019 04:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376338; cv=none;
        d=google.com; s=arc-20160816;
        b=Yo9RuGK1/UYUbnIiaPOOqTHrgDjrw86tV6+MA0xQfw+nx96TJAM6bK/tv0ZBtG5wX2
         S7Zn7FyRaG60ly/95KajdGWobVlYq5eb8JsoSUbi5nANF7fpy4NEsV1rRXswZDC2uVDv
         nbKPtrYMmHeqqSuwXaQkE6HFECfIDsj5bZ89senq6JrPr9iZAC8Jq5IWMwUoo1rxzKSX
         iyVGJwSMssP7PaakambwIdlAAReTZMAF/WYxjcfP6QqmbQC/+l6xiJeG9/R8txRbFOxu
         Eny+GH8we/Gjb9/GFhzNMDqX8UETt/EtsXNUAsk8I5ZjLMh/omYj9VeCqkQOAm/OLhRS
         Kb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=1j8oku2t8Hyll7kmQKDtqLtZb1xIghCmI93Q7HHPmf4=;
        b=i8ASBhVJQ2sy7TvldY7FybExZRATwkcE3b4wjcFXkoDaKSv5LIORP5Yjo4YEEPSfTa
         K+rFZatnfVq9qVpuQPGxMUqvoBb5gEFtNGRzxdg4/1Is1ZFg9zcJEqWGwuHWkpMveRKJ
         o4kFicyZ+wIGd8Bnh3SfrpcLFx9Ie7mpCZWdFOa/6q3LcnvAkemfCqlJSRT330y0tYFB
         sDfvbQVkv8OL6FsI9kyWe07X8fUnJA4Jm+ZkuTnDCrZGHkaP8UGpc0FCImBbc6P0B5qJ
         cHOqFn/EUXiO9Kr5bLpJt7mu9zgkQJEE+2rF+lcyL58i4Y3xvKCwXPHkYTq+NbiLEljV
         vDsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz6si1779590qvb.10.2019.12.03.04.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:32:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7Ll-0000jY-Bq
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JJ-00082z-MK
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JI-0003d5-4o
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40892 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JG-0003QA-E4; Tue, 03 Dec 2019 07:29:43 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 55886495215DB76C2F91;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:24 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 4/5] hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS into
 fw_cfg
Date: Tue, 3 Dec 2019 20:27:52 +0800
Message-ID: <20191203122753.19792-5-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZiQCsSmn2Ot0

I'm not sure whether it's neccesary to add FW_CFG_RAM_SIZE and
FW_CFG_MAX_CPUS into fw_cfg on virt machine. This patch just makes
the fw_cfg-test happy.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d4bedc2607..26a4183775 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1084,6 +1084,9 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
 
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)ms->smp.max_cpus);
+
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
-- 
2.19.1


