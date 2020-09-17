Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp530741lfq;
        Thu, 17 Sep 2020 05:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC7mXwqXvYuzIIyXB7NfP3L37n7XINYCXcWRmJsY86zhK+G+t6E9zwh8zErsF3IRJYDu6V
X-Received: by 2002:a5b:287:: with SMTP id x7mr41024313ybl.144.1600345418495;
        Thu, 17 Sep 2020 05:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345418; cv=none;
        d=google.com; s=arc-20160816;
        b=0N7m4onQSsneoXP/qYAZ3s687FhjgZkeIG3r5GC2xAidprSdQCqtNvLz7xttA85uxJ
         xAuCO5Op9sBrGgNttvzPGfdU9/u/Ctu9DR7FtL7bVqKQ2iixzhKhy8v7I/tjRecaA6a/
         1dlc7WzZcUOdRezkPaAIf9bxeJMYGyjgWlZk+YzwNGlUM+l/jEO2AQs0NjLJ0WSVhI1J
         kWQEygVkConJGrWjns9Wy9yV+T6kd63PqbmZZcFSVell7uEbE0vI90GyAADkvJzXjO+J
         aV7w2DgjcnKwm7gV3Ahvx130kAPHPPULzhWK6yXQ4fKITlWzgP9D1M9NNqO24FTLjxwE
         GV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=c87eOSfFD2FtU0P6NbN7MMxJqWwme3F1j2RHGIVRWbA=;
        b=ABd6QEyBjU4nmzbXUMVmeJ4dL3ifTREFiJoDfNFbkaV48j4KRW2B+B/XzbqK142Gin
         KK6mbgZt0wIpMPQvxMnoWyepWFnbtbVFrTMXQXqUWDsPYhXU8YI+eu++syoKTXP/wv6l
         NjT7mun5Wo0hIXDX1FKOZnVzdwcAury80A9jB8ZrET7LpF90cCZLZp+C2sR+ynDQv/Un
         9ZLVA28InWpqXgbPtvsYDbLcpLISkoYfPjkw+tce33GDU94ZKm5SE4UkHn9t5xsWhKPW
         WqPenrg3Bjj+t4GtXlaP2wUQ+HentLRnIWZtIFKXin8zP7Ku9FUvWXisNvgsBzXxNGtk
         4sng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u38si21957352ybi.168.2020.09.17.05.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIswr-0008Co-Nk
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswg-00087e-Ll; Thu, 17 Sep 2020 08:23:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4711 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswe-0003P9-N7; Thu, 17 Sep 2020 08:23:26 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5C1F6D076B237CBC13A8;
 Thu, 17 Sep 2020 20:23:20 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:10 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 03/10] target/arm: only set ID_PFR1_EL1.GIC for AArch32 guest
Date: Thu, 17 Sep 2020 20:14:42 +0800
Message-ID: <20200917121449.3442059-4-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:17:13
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
X-TUID: ilzmQV7OcKW9

Some AArch64 CPU doesn't support AArch32 mode, AArch32 registers should
be 0.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88bd9dd35da8..3a48bc4e4809 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6627,7 +6627,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     ARMCPU *cpu = env_archcpu(env);
     uint64_t pfr1 = cpu->id_pfr1;
 
-    if (env->gicv3state) {
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && env->gicv3state) {
         pfr1 |= 1 << 28;
     }
     return pfr1;
-- 
2.26.2

