Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp256663lfk;
        Mon, 7 Feb 2022 15:06:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX5P3m3TiAPSvDj6YDUXY6hq8XZ3ktVSyjkh0ywTPOA00xaLNYhUp93yt6sDFVM72TrEE9
X-Received: by 2002:a05:6102:3c1:: with SMTP id n1mr717688vsq.83.1644275204645;
        Mon, 07 Feb 2022 15:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644275204; cv=none;
        d=google.com; s=arc-20160816;
        b=NkzdDJjgq0RRcX98uj1GjuCkWe+aSUp+jwzO+t9lxCAr8InSyn8otfDnkgc7M8R8HQ
         QRMJn24Fj7YSa1GQfbka253SgUWxlEcfsOgYMUjWyCa9FNZj1Fq6vgdXb8LPJZ52LrXf
         QmIa5EpxzTzbOWg5YRZAFz8FutGgqwJwkHqBNR1KzCAr6v5cuuv0gACbCbnBuTjB7P5i
         y408IzCixx4zHJpaH/mPy90LO7oTO93BtZo8AZwmF5nhhayZGNgBQkHkXqIcYPGi3411
         p8/MRKc8KH2IckWdYF3CZaSh5spjovEMwpnwKDqV0Hh9TXMnZMpgZca4L731odnrBOJf
         BmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=ArsGzdiys2UV86xcHL3cbzS0IGNvFtheCvPUrpycbzk=;
        b=x2W5GYnP4NWo/eDKCKPf090+ZUqkP8w/kD8d9LH4iRdp2nGr6Y+raMv9y0njABfL1d
         qWsOCkbbXtMFtYEsG9ud1IlaaYEseCZQDvFz0R78NC1raMnAz3U+23Vd1O1YHf9wOlnW
         Ajx74/LjI3g0s5s61k9ByF4EVv3+sZ/IkiK04TExecHeLcbjIrcm2y+SJ1zky0mabTwJ
         16mdvuP9yznNhn8KL6jnAKWvODmUuU4Jh+JWwVNvX8D5XYuPTNgRVyiK8agE9zu3zJNQ
         MQw9zFGUbx+6jww34ax3zeLCmC6CkKnNbxRmvo4/ZUp+Pd5MNL6b9nH1ggx1QlN3mqm+
         WN3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si675801vsj.55.2022.02.07.15.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 15:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHD5o-00030S-3F
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 18:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHCrp-0005Ul-In; Mon, 07 Feb 2022 17:52:17 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34154 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHCrm-0007Ty-N1; Mon, 07 Feb 2022 17:52:17 -0500
Received: from localhost.localdomain
 (dynamic-077-009-016-031.77.9.pool.telefonica.de [77.9.16.31])
 by csgraf.de (Postfix) with ESMTPSA id 49FC7608119E;
 Mon,  7 Feb 2022 23:52:12 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
Date: Mon,  7 Feb 2022 23:52:11 +0100
Message-Id: <20220207225211.15281-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AD71J/6EUMqU

Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
those reads trap into QEMU which handles them as faults.

However, according to the ARMv8 spec (issue D17783), reads on this
register in older ARMv8 revisions should be RES0. So let's treat it
as such instead.

Reported-by: Ivan Babrou <ivan@cloudflare.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 92ad0d29c4..045ec69c7c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -54,6 +54,7 @@
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_ID_AA64ISAR2_EL1 SYSREG(3, 0, 0, 6, 2)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -780,6 +781,10 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_ID_AA64ISAR2_EL1:
+        /* We do not support any of the ISAR2 features yet */
+        val = 0;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
-- 
2.32.0 (Apple Git-132)

