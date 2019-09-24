Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045425wrp;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytAo1+AS1zxz/bsxS0drBi5uT6DikbblUeUVqerYE10ovLWY2s+adzjOVsfIsVV3Y2wOrb
X-Received: by 2002:ac8:6e8b:: with SMTP id c11mr3377398qtv.77.1569338620183;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338620; cv=none;
        d=google.com; s=arc-20160816;
        b=LZ0zxTrF7dkm/wtz+VE9Ru9AKtueonpOfc2qmtwD5fdWgjSava/AHWqY+YWrpVLKdE
         WUG7H37FmsWyqcE3EQwAwPBcRzH6NLLJzJN245lpjp2w0AxSnorrjcTw5mPq4uXOoCfv
         o9vfUyr6kc76WhFVw/DB2/q/TNqdaAuD5gStPfUdrLYw6fLk3yQfOEthu+XmijjEko4m
         ZLsZRRusmVz6z2oM2bbXlk/5yYFmvxWy817ay4ZKfOjCRofrX8WsPUEFWwhaKWTUNq9o
         yx94snbamAn8cTtKAxADXIhTD/70avdmZvO1c1ZuMWeYJsxfY1kkgLIzH3scAFAE3Lij
         peIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4ufvYzqtOolB7W+Ga8+hwW5APvCt8+Ca8ubg6fRYrT4=;
        b=g97mldaJzWmWtnKEnOXiy7+wPwE9aVK3pVpts9lqjjWUpinx990gtgn6mW6z05GrQj
         yxodpWRLieNIqvuB9pNr/sBBTabuNRLOT/IMeoC2J5sTU1TrxMSKF1RwwlNN7xsikuEJ
         rZmirAHy8omRagCZLxEHshhsZh1MszPJ/LuA30BSiZjleHKwe7YZTUzmcw1eJ2Ai66gv
         P9mYkmrLcPGJITg1GbUf+qQRXhpOCyHmou6/juGZ3XPEmv+6L97RRdQAXf9QzEYDp9Q5
         4j7wgrpqwTeYl/tgUif1ElsOdjiNyuXuSP7zTSh9QBnFxtXCTgYO+2E0hfM8pXTkkS7k
         GS2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g43si1256755qtc.379.2019.09.24.08.23.39;
        Tue, 24 Sep 2019 08:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DC9354A67B;
	Tue, 24 Sep 2019 11:23:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJEIVMTwkfsw; Tue, 24 Sep 2019 11:23:38 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 713534A6E4;
	Tue, 24 Sep 2019 11:23:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B15C64A672
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:33 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0V+ptipkmNb for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:32 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8FF6C4A681
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:32 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 58A3B3FBB55EA3E76511;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:16 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 04/12] arm/sdei: add system reset callback
Date: Tue, 24 Sep 2019 23:21:43 +0800
Message-ID: <1569338511-3572-5-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>, Jingyi Wang <wangjingyi11@huawei.com>,
 Heyi Guo <guoheyi@huawei.com>, Dave Martin <Dave.Martin@arm.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: v+8GgKPcBPKt

For this is a logical device which is not attached to system bus, we
cannot use DeviceClass->reset interface directly. Instead we register
our own reset callback to reset SDEI services when system resets.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Jingyi Wang <wangjingyi11@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index b40fa36..f9a1208 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -1083,6 +1083,26 @@ static void qemu_sde_init(QemuSDEState *s)
     qemu_private_sde_init(s);
 }
 
+static void qemu_sde_reset(void *opaque)
+{
+    int64_t         ret;
+    CPUState        *cs;
+    QemuSDEState    *s = opaque;
+
+    CPU_FOREACH(cs) {
+        QemuSDECpu *sde_cpu = get_sde_cpu(s, cs);
+        sdei_private_reset_common(s, cs, true);
+        sde_cpu->masked = true;
+        sde_cpu->critical_running_event = SDEI_INVALID_EVENT_ID;
+        sde_cpu->normal_running_event = SDEI_INVALID_EVENT_ID;
+    }
+
+    ret = sdei_shared_reset_common(s, first_cpu, true);
+    if (ret) {
+        error_report("SDEI system reset failed: 0x%lx", ret);
+    }
+}
+
 static int qemu_sdei_pre_save(void *opaque)
 {
     QemuSDEState *s = opaque;
@@ -1235,6 +1255,7 @@ static void sdei_initfn(Object *obj)
     sde_state = s;
 
     qemu_sde_init(s);
+    qemu_register_reset(qemu_sde_reset, s);
 }
 
 static void qemu_sde_class_init(ObjectClass *klass, void *data)
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
