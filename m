Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1437683lfc;
        Tue, 3 Dec 2019 04:30:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgtieNtzgMTkJ/FAwHsHSx7dph9kO3Hk+rpc+kuM9DrqwZUJWibhu4j0oTZUb/JKMdPLqt
X-Received: by 2002:a50:f612:: with SMTP id c18mr2929714edn.285.1575376253877;
        Tue, 03 Dec 2019 04:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376253; cv=none;
        d=google.com; s=arc-20160816;
        b=a0UTNUcn7pq464KVwiqBxzAGRPyPpIEGwoUw4l1t9H+GknJsN4KFaJevTY9OjLtAV8
         cvpiif16K83qpBFLJ+UN5yAUNGgKHNglSGLFlV3nbnEeuliVVTKql8Vl7UtYBDJwVoVh
         dl7+OUrD9bC9ua7KHeWdRoumrIBvdqA86emK3JahAZjgLSz+Xsf4dN5ifSK9Z2d4leGT
         HIKigC320Th4m7drpReC3zZuaabgGq/3CqqatvRnUoCqUNMzpREZpYZTz/IxZOYGpbn3
         DXtaL2rsXVKtVjPzpOKR+Gt93opYuJeEkCSA7NZcLvZ7YDTE9f9+ka9dSy2JLGh7ins+
         2uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=HNx5awebTenw3cog8mBdUqGHqH9AuegEds8jI01zaEQ=;
        b=fso5KqaFHjC3t5VXKMzvvSs+G/JducibK2C8pB5DusU6bD+6qLudhGwhjNKdmqLmJ3
         xyKcFpJ0ZENIq5Uap+wuB3Pmh1MIgqv4LbdOz48dOSvQEi7UC4JCe+T31iohtW0Gw4Ia
         TZRqdgzdE8qNYRvDziNbdY2Aqiw6jwnB4bNVi+nhmsK8cZP3XKBFX4lCAnY81It0+Qpz
         IYl3Kpah0nEcnYvWE+FRuadZjAr5AR8orjDzO9je25AojJLqem4s5mDGmSJs1DbRgJBe
         KNfLFGTAqFuGXu3PCsbc4i4IGsi3ah1V1B2ILFDyz31S86nl7afEjxnAQeWr6ZZNjNp6
         no1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si2131780edw.361.2019.12.03.04.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:30:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7KO-00083y-C0
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JK-000832-Of
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JI-0003dh-78
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40894 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JG-0003Q7-F6; Tue, 03 Dec 2019 07:29:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 631662E73581EE20096E;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:23 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 2/5] tests: fw_cfg: Support read/write of fw_cfg registers on
 aarch64
Date: Tue, 3 Dec 2019 20:27:50 +0800
Message-ID: <20191203122753.19792-3-zhengxiang9@huawei.com>
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
X-TUID: q07nJsw0r+l/

Refer to the fw_cfg registers locations of x86 and arm in
docs/specs/fw_cfg.txt, the test codes need to differ on the addresses
for read/write.

Besides, fix the endian problems in mm_fw_cfg_select().

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/libqos/fw_cfg.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
index 1f46258f96..c1518c5e81 100644
--- a/tests/libqos/fw_cfg.c
+++ b/tests/libqos/fw_cfg.c
@@ -57,7 +57,14 @@ uint64_t qfw_cfg_get_u64(QFWCFG *fw_cfg, uint16_t key)
 
 static void mm_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
 {
-    qtest_writew(fw_cfg->qts, fw_cfg->base, key);
+    const char *arch = qtest_get_arch();
+    uint64_t offset = 0;
+
+    if (!strcmp(arch, "aarch64")) {
+        offset = 8;
+    }
+
+    qtest_writew(fw_cfg->qts, fw_cfg->base + offset, cpu_to_be16(key));
 }
 
 /*
@@ -108,9 +115,15 @@ static void mm_fw_cfg_read(QFWCFG *fw_cfg, void *data, size_t len)
 {
     uint8_t *ptr = data;
     int i;
+    uint64_t offset = 2;
+    const char *arch = qtest_get_arch();
+
+    if (!strcmp(arch, "aarch64")) {
+        offset = 0;
+    }
 
     for (i = 0; i < len; i++) {
-        ptr[i] = qtest_readb(fw_cfg->qts, fw_cfg->base + 2);
+        ptr[i] = qtest_readb(fw_cfg->qts, fw_cfg->base + offset);
     }
 }
 
-- 
2.19.1


