Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4835788wrq;
        Tue, 19 Jun 2018 00:59:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLv4tG9AaV1C9eVIcEy9Y7g2UoHSThxDH2kvany6+X0L3htsnC4DI8ir6pA1MpimXYp3BMZ
X-Received: by 2002:a37:9486:: with SMTP id w128-v6mr13115225qkd.119.1529395198763;
        Tue, 19 Jun 2018 00:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529395198; cv=none;
        d=google.com; s=arc-20160816;
        b=TnxxvbtwNDrWU4iLJcaODOdzu/qDN0B/E7bHds6TC4gWnEZxecff0F3rnQeXEbeixw
         FQpp4ZzBRn7E5YuTFka2BPsxVKfnpf81xz6e+Dtxqew8GQ4fQ1gjXZoAmmw/1wGQAe9f
         Wavd18Tm1xtkrm7ZKJfpvuv5+e6ZWj9lGrn5MF94PVZQEPfXzAb4Ygx/8jxroVQ8w7bn
         h6A4e/lu6Cip/Gs669QCLp/ae7JfDTltxAWwdBwMZDWJBMvVgpDJl+9fsGrjgi2o1v/w
         cFr+r+nvjldkKa/1DpU0ltVhZO4F91ASARFRq11l7JVQi2m+p2gchfvdfQEdiW+okPOQ
         v9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=8r/Vhn+cl37F0xFyfCZIZ9h0BMq7WUrX94v/MW2thyk=;
        b=NuhMcISHCgKbgLAm1dKrnK4ruSQlCZdlIAlwEs0+NJU00vfXlf1jRtK5IY6OWvQ3Sb
         pKwqnBUvWC5xndGXJAVE0YUMhE6R0aEXTQXGhvfHNiFDq+z2BpluqkiWq0w0gyY4Ofz0
         oto/EbOoUng3qlV0Z38r0QSETOxGJWbBAhiX6FF/0tXRN7KGmiTFu+HbJ7AxqUcrcvex
         vTA/vpOVDtV2EqTlth7SNACkgoUDbw47fin5yBEmxFGbekNqKtOt/VGz/Egzj1jca1or
         aTbiaRA8b4YbJw+YlweWHt24RRFojzqqugFtbBM9OMAdEmSUw+9y7oq5KxHw/G2oCI8w
         mGjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g26-v6si1574808qvb.82.2018.06.19.00.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 00:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVBYU-00088H-BO
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 03:59:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1fVBY3-00086q-GJ
	for qemu-devel@nongnu.org; Tue, 19 Jun 2018 03:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1fVBY2-0008Jv-QG
	for qemu-devel@nongnu.org; Tue, 19 Jun 2018 03:59:31 -0400
Received: from [45.249.212.35] (port=43844 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1fVBXw-0008GH-Gp; Tue, 19 Jun 2018 03:59:24 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 73B90CEECB070;
	Tue, 19 Jun 2018 15:59:15 +0800 (CST)
Received: from HGHY1z004218071.china.huawei.com (10.177.29.32) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.382.0; Tue, 19 Jun 2018 15:59:09 +0800
From: Zheng Xiang <zhengxiang9@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Tue, 19 Jun 2018 15:58:21 +0800
Message-ID: <20180619075821.9884-1-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH] target-arm: fix a segmentation fault due to
 illegal memory access
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Zheng Xiang <xiang.zheng@linaro.org>,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ws72uLOe/Y39

From: Zheng Xiang <xiang.zheng@linaro.org>

The elements of kvm_devices_head list are freed in kvm_arm_machine_init_done(),
but we still access these illegal memory in kvm_arm_devlistener_del().

This will cause segment fault when booting guest with MALLOC_PERTURB_=1.

Signed-off-by: Zheng Xiang <xiang.zheng@linaro.org>
---
 target/arm/kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 98f5006..5bf41e1 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -256,6 +256,7 @@ static void kvm_arm_machine_init_done(Notifier *notifier, void *data)
             kvm_arm_set_device_addr(kd);
         }
         memory_region_unref(kd->mr);
+        QSLIST_REMOVE_HEAD(&kvm_devices_head, entries);
         g_free(kd);
     }
     memory_listener_unregister(&devlistener);
-- 
1.8.3.1


