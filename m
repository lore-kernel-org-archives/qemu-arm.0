Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3647597lfa;
        Sun, 1 Nov 2020 21:44:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA4tr8UQYFL0wu9bMhgLl/8cJ7OH8KxvrpYBd/lMWcneKGQB7XEK/L9nqaSXpc9EQwXWnN
X-Received: by 2002:ac8:7451:: with SMTP id h17mr7961909qtr.100.1604295868886;
        Sun, 01 Nov 2020 21:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604295868; cv=none;
        d=google.com; s=arc-20160816;
        b=VcYW9ryEmu6doJnYCRTxGlTcC7s968D4EQrL5zrHZQDC4CZ2IofIROvJ2y1rwiHjFt
         +S37hEFZyUMFQMHuelikNHi5jXGpfWWikxKzTgQQVcGpHfN8v0vBToyDf0gCwVoixWBB
         AyJ6qD+H6TOq1VQgtyrF/OAwuOL5YRogkwZhaUTnIuGKO01a0jlcnQc/2u16bDfJ4y8A
         nLBAP8DcAqJklJ3tF4TCqd9Vp0sht6quW6dY9MiMXEqs4BiOYlJxYbE/Gt6fleq5tTPC
         DCuFRZei9jvjhwxYI/r77hd6u8BCvQMbUf0PbXpWzCAj2cPi7T8shjXPdl83J4n1NL8G
         Esag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4i/PoRjuys0ag7yrPkZTiIu4awERrIYKNdfVkW1kQJk=;
        b=GaVT/7h7TUOxIWWEipP2IHv9t0/YVTv3w6o63uwM2xYnmikas2CppA8nefjp6D5iT5
         +hqAwcVu9pGldueEn0d+t6R77EgI8eioznqwQdFmcXwwReWvRzBAYQOQxnCQ9Q+8WkB3
         bybPbEV69O6QQiwPRFh1Wk2NtuZta5hWdpkt02Z4QIhP86IiNzU+LaKHrsENZXvs0u+m
         +5Ug0wo4ebtltNL8KvaPiZcALBcKtHDQfnOJITjjZBt9ry6VN/7cFd+GUjwiHhB76fL1
         rgQ0uYaL+kkXxt/gRrxiw6OhUYGDR2rHUJBT1WOeNNl8O3ftQ3u6RvOAo2yWluAKbAZo
         a0+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si7983251qki.52.2020.11.01.21.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:44:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSdo-0002Qi-6q
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdJ-0002O4-Qh; Mon, 02 Nov 2020 00:43:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdG-0001FQ-I0; Mon, 02 Nov 2020 00:43:57 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhfn3Lzbz15PDZ;
 Mon,  2 Nov 2020 13:43:45 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:36 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 03/10] target/arm: only set ID_PFR1_EL1.GIC for AArch32 guest
Date: Mon, 2 Nov 2020 13:40:48 +0800
Message-ID: <20201102054055.686143-4-liangpeng10@huawei.com>
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
X-TUID: kug+YOqz7N4p

Some AArch64 CPU doesn't support AArch32 mode, AArch32 registers should
be 0.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 97bb6b8c01b4..ba6f30e02f5f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6660,7 +6660,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     ARMCPU *cpu = env_archcpu(env);
     uint64_t pfr1 = cpu->isar.id_pfr1;
 
-    if (env->gicv3state) {
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && env->gicv3state) {
         pfr1 |= 1 << 28;
     }
     return pfr1;
-- 
2.26.2

