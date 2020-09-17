Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp534147lfq;
        Thu, 17 Sep 2020 05:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwragvW0MHNhpiKfVNrZsUQqQ37FNbD/513va1SPeqk+ROOaJZsdK4a8UOXjTVGtYW0nrDl
X-Received: by 2002:a25:2d1c:: with SMTP id t28mr10761909ybt.356.1600345715774;
        Thu, 17 Sep 2020 05:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345715; cv=none;
        d=google.com; s=arc-20160816;
        b=LIMclXH7EFeEKRyzUhe3/5j9oUa1dI4RPu0NYPtGLsceWPaaspWeE5WTB3Fg8jB0g8
         ieJ9G034d1XZwBWCC/qVw5LB8Ug1Y8M1Op0PZBHo1I3TjiyXuUDfnnqYr6/Xo4AmVkgV
         HaKobFuUIrUcXVOKlQqfDTy863DrQzGLHZw4qb7wb1T5nsD8gIQ6maPrvIxGH2Ly7dsf
         ZqotSAaHnOe0SPfVmd/IFHuIqSqJGH8HI6zV1UtMxz+DWHILUeRXnJVxdyeqmh5T/5xs
         cQGCShIwDW620spdFIuzWvQ3HbbLF9sWq9O1oJd0N8AObFfVkEeW7IyDwotDjztRSvZi
         PdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=DogZtjfX2tUBM/uYxJDdYF9nutsdtlBlkRDbZk9QWoo=;
        b=s/Utrmm+KQzeZnWhAKbxWB5Ivbvxq7qzWWJ4NStPms3OfO3nUvlxVYxWkg7iYFyVOw
         s9YKP47UeDnq1mPiQMzAw4XwgpPknjV+a/2M223SET9lO4IMnrIppEk1N+Alf3M0U6V3
         gYzocNE2wlT6Ag3RH5mc89PrS/cgwFv1XLX+hX+kT2oackhXe+geDXG8Q9KbmjhdooGq
         VT++YD//GLIKmw0qIL5j7RvI6+/MMNbwoZgsnrTTOXllZVX87poCrzilygnIiUSfsqSC
         pNoZa1gsk2zQALALBlzROFcs8xkQ/ibiTglQqyp4Y8p5ps03RGKCM9riGqt77zOBpIeY
         gFIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r135si21838423ybc.10.2020.09.17.05.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIt1f-0005Ht-6R
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIsws-000096-90; Thu, 17 Sep 2020 08:23:38 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51562 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswq-0003R5-0j; Thu, 17 Sep 2020 08:23:37 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 591FB7FDB8DC9D2E3180;
 Thu, 17 Sep 2020 20:23:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:19 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 08/10] target/arm: Introduce user_mask to indicate whether
 the feature is set explicitly
Date: Thu, 17 Sep 2020 20:14:47 +0800
Message-ID: <20200917121449.3442059-9-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: 3jzL73eXPaZX

To add CPU feature dependencies, we need to known whether a CPU feature
is set explicitly or automatically by dependencies mechanism.  Introduce
user_mask to do that.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/cpu.h | 1 +
 target/arm/cpu.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d93ad0f8f00e..c7513a5d393c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -925,6 +925,7 @@ struct ARMCPU {
      */
     struct ARMISARegisters {
         uint64_t regs[ID_MAX];
+        uint64_t user_mask[ID_MAX];
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10a52518dd14..36375807e19d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1312,6 +1312,8 @@ static void arm_cpu_set_feature_prop(Object *obj, Visitor *v, const char *name,
                                           feat->shift, feat->length,
                                           feat->ni_value);
     }
+
+    isar->user_mask[feat->reg] |= MAKE_64BIT_MASK(feat->shift, feat->length);
 }
 
 static void arm_cpu_register_feature_props(ARMCPU *cpu)
-- 
2.26.2

