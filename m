Received: by 10.25.44.15 with SMTP id s15csp6361950lfs;
        Wed, 2 Aug 2017 09:53:01 -0700 (PDT)
X-Received: by 10.200.37.146 with SMTP id e18mr31560835qte.251.1501692781498;
        Wed, 02 Aug 2017 09:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692781; cv=none;
        d=google.com; s=arc-20160816;
        b=vfXr4oc1CrAgsURodw7wOizEs74WpG2HLiLJ7adxAZJU51Bhj/YndwhCyLJEufSVyI
         RjeQULoju5wK+x9M9FrA+P06AVgtwo3uhi6tFbpZbdjWwwBznZ9R0wfwN7hxJ0s4TIBQ
         huilFYlwtRrAenhaOwE9vJtC1fHJZ0/AtndBbB5Orcss7ue+msmMVniFdnVnzDZMtwUM
         vpBp53Q19Kp+IOtCtKWd/+2D49IUtI/4F/bzmAorfivdSKnV7O4hiKxL6s3nwVAk32kF
         6RykS/Vd/ELMmYV10D3dKclQY6zZk/dprZrbz9ltUgYlep2wXr438Be44XUdUdD+Xur9
         PgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TGpe+gwZK1tiZZ/w7896S24yO2koBdo3Pa1UR+C9wt8=;
        b=K4Ok9wavL68rfMCrTiKt2uD9u9AftdnR0hFFCSWPlgvWJ7bDrsM1bzz37UNsYfdSMJ
         GToPdYMMenC0BhazLLJ+pCJ8yxDktHvPTCUTxLTT2TDNzyWvJ5vw5yuAdF/VPmZmJpQq
         QSq5qFzeuLuzm6ukbW9ie+xAyh10DRlPufWIIAtVgTyhMTk9y/1GY6dUCs6IxdZf23e6
         Ll+GxKpwk2eThQLBZ8f7V1UtZIoRd88xNT9gCJuzYM4dyTmrxJkGbWMwNK1mvzuyNG/9
         GjrzbkjRSMN25JZqpgxU634SLUWXrzqydyDTneV72IIAOwVYUAEuG7xs0fEGFAtRtNMs
         MmdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8si25046386qkn.396.2017.08.02.09.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwtH-0001o0-2D
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:52:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlF-0003fc-5L
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlE-0004t5-DC
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwlC-0003zA-Fm; Wed, 02 Aug 2017 12:44:38 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkd-0003wR-EG; Wed, 02 Aug 2017 17:44:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:48 +0100
Message-Id: <1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 02/15] target/arm: Don't trap WFI/WFE for M
 profile
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ghd3BPGZNAAN

M profile cores can never trap on WFI or WFE instructions. Check for
M profile in check_wfx_trap() to ensure this.

The existing code will do the right thing for v7M cores because
the hcr_el2 and scr_el3 registers will be all-zeroes and so we
won't attempt to trap, but when we start setting ARM_FEATURE_V8
for v8M cores the v8A handling of SCTLR.nTWE and .nTWI will not
give the right results.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2a85666..5a94a5f 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -370,6 +370,11 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
     int cur_el = arm_current_el(env);
     uint64_t mask;
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* M profile cores can never trap WFI/WFE. */
+        return 0;
+    }
+
     /* If we are currently in EL0 then we need to check if SCTLR is set up for
      * WFx instructions being trapped to EL1. These trap bits don't exist in v7.
      */
-- 
2.7.4

