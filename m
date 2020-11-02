Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3649745lfa;
        Sun, 1 Nov 2020 21:49:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFN6OJ8csYjDA7sO3und+IL/TecgptXglM+AyeJqs7CdeffkRPF8hfBkYwpsXicqk3HIzD
X-Received: by 2002:a37:86c4:: with SMTP id i187mr13724933qkd.371.1604296159397;
        Sun, 01 Nov 2020 21:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604296159; cv=none;
        d=google.com; s=arc-20160816;
        b=Zj7HlKN5D5AiudLYl/KvzF76RQB6tOSmnCc2kSLVrml2+oRaAvbh7CHwEHlpTupcYP
         AOaqz6h1uedQJQ3U791NJfG6z0fSZp96ju6PCO0609NBnwB/zX0NIxrgNvs6UgiCK40t
         dUGPTFxYqx5DukRxGOUK7Xms2XwaNPIXMFs3x2lg12Z/cSHwGb2zJdB8eygi5V1Xkvw7
         80KHlcTcLuOfeCQcVu1vGDhBuXVtEBP5vhe1PJovxAhZbCUmytN5Sd1sL//fwRzLPTLH
         UgS3YVWYwoQqLWGG0qrFHMQzAdjsgvD5AxVpWqVoVrg5OFgzUDAVvuiONpDVhKwEKy2Y
         MBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=OI8OrX4NmxMF7jQoYAv0fFlPI8ka9cMZLInOnp3rESk=;
        b=LCf9Bq5YqXJ2QZFgo8sgeenAR18Wid31/Of9nltx/tNxWCTM3o8sL12X5cDZg66j7t
         /OlD6/uJnI++2kOpk5RdA1UHa72PXTnYT62N6fz1pen9OJ7Z5OeO3WBmWvn04hIsTQXZ
         tH/lnGMvm49Xo9RPN/ho4Z/oLhhdwZ2kYCgrBn5VlFoGwBmLVHkhcwFE5tCAtDESvUqO
         I96CmbRhTKUJKFBGujiaxvATSb91sazYS/VrjbPPtX4ROmsrW7GNtcSnHZCoyhZ2KAHk
         K1258QccMfHhU9dqT+9vw/XMEuRlUpGcssXojR6da6ZlR8nNJm631uMK3rnYk7qWEc1t
         wRUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si8078520qtf.240.2020.11.01.21.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSiU-0001SF-Q0
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdN-0002VT-QZ; Mon, 02 Nov 2020 00:44:01 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdL-0001NU-T4; Mon, 02 Nov 2020 00:44:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhfy2H0Mzkc74;
 Mon,  2 Nov 2020 13:43:54 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:46 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 08/10] target/arm: Introduce user_mask to indicate whether
 the feature is set explicitly
Date: Mon, 2 Nov 2020 13:40:53 +0800
Message-ID: <20201102054055.686143-9-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yYSbVj2U1zHq

To add CPU feature dependencies, we need to known whether a CPU feature
is set explicitly or automatically by dependencies mechanism.  Introduce
user_mask to do that.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.c | 2 ++
 target/arm/cpu.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c5530550ece0..8c84a16d92a8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1306,6 +1306,8 @@ static void arm_cpu_set_feature_prop(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    isar->user_mask[feat->reg] |= MAKE_64BIT_MASK(feat->shift, feat->length);
+
     if (value) {
         if (object_property_get_bool(obj, feat->name, &error_abort)) {
             return;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c20f1ae20429..1ee653a712fd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -932,6 +932,7 @@ struct ARMCPU {
      */
     struct ARMISARegisters {
         uint64_t regs[ID_MAX];
+        uint64_t user_mask[ID_MAX];
     } isar;
     uint64_t midr;
     uint32_t revidr;
-- 
2.26.2

