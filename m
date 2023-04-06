Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1180814ejb;
        Thu, 6 Apr 2023 08:08:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zue2I1oh7C1D7PRX9FerpkyNi5cEF5mpLgjCRfCd9ovvWU4Ng/dbqSE7LuO7A9F8z9kjE2
X-Received: by 2002:ac8:5847:0:b0:3d4:205e:be4e with SMTP id h7-20020ac85847000000b003d4205ebe4emr11566044qth.13.1680793721962;
        Thu, 06 Apr 2023 08:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680793721; cv=none;
        d=google.com; s=arc-20160816;
        b=1Lm4DWzBacvtSC9xYHs+G0NzC7Dz+Qv6Esd+dohxfDn2oesC2wo20F7aG/YOu+aBHk
         rroTX2L4BrWc1rU2aSERYhw+fcPrp45sQwq34bcYUxVLG5wwYMAdKRzs3hFfC+FDoRCP
         XrKf0cMF8R8otnz7O/u5pYwUR9LwZXgPSVGn2ZsFb0dn8EjLl+PmqCiEULMJTQieAnJo
         RmQq045+uohUqGCxXi5PKHBpU2Fkn9dKly3gpe53t4cmX0bjAshj5KwE/18sbFyTt4TW
         t4lrJ5GhEG1HBfc0U6Gfxyr3RMqZLuhWNZiyyKfqiTAupnizw7M0RsWP0zYIUodbVAK5
         ez+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gh4qcndhDJG95oN4owUI9IOpNnJuYLVio9Sn39/QZ9g=;
        b=l0nK30+0r94bnVZbg81dJ9BSDm8hB7/eKYYCowfr/hDceHGbzqUySPtARqKMXXMMD9
         vSjYF6197Eu9iohOvhR1HC7551CeO/iQBm88eVoMRdnkzMwzHm53wJg+b+9nsx0V6Mf1
         TK99Rn1TyLJAMjcmSWQBKKVlX+7+GOWuWjxutKE9cy5w7btsiccqDsxY779bhucoEROz
         IE+C/keABArRBt8wjrpdhYpxtfmzr0XbiDFCGWmj3Ad1DSrhaDhUdqSPjDkbyDbw5tZU
         ldknNx7UOooFHhrwM2pf+ygexF3OVph7ha9buxeojMQhqYzrTWTqvLp9xIxwO5j1QCkq
         UOew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PpE3PUi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05620a241100b007465b41a9e6si1182248qkn.305.2023.04.06.08.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Apr 2023 08:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PpE3PUi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkRE2-0000V4-Gy; Thu, 06 Apr 2023 11:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRE0-0000Un-N0
 for qemu-arm@nongnu.org; Thu, 06 Apr 2023 11:08:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRDy-0001LF-V9
 for qemu-arm@nongnu.org; Thu, 06 Apr 2023 11:08:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so20405107wmq.3
 for <qemu-arm@nongnu.org>; Thu, 06 Apr 2023 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680793709; x=1683385709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gh4qcndhDJG95oN4owUI9IOpNnJuYLVio9Sn39/QZ9g=;
 b=PpE3PUi/qdUWaILab6zEnkLgFZ9BK6ibTWqNnR+iUBQYmW6mT0PKgkY4U3ocl2lI/m
 qHheuFqpqe9xA1FwkTqUOOUd4nBSq4bz6z1K0bahsnG0hGubdtyUlclqdhuHBqsqm8Fq
 mxgtQHDc/XRv0DOS77hI5juJ4lV5RptvPyMyn1McFh5iJz7pW8OPbuyzgBAVq/MR7C18
 xTmxF2aOcbK0ZrchxqHdzF3zTWYZGyImB34f278n2ajtX/DQU9ugyGWgKw0Z3OSH4pig
 mfjvCQngyVTHYsznC/CxFQRgXpEHR7y4nJj8+L4RKW2tGekBxIx6KauSPsqLsVAZAkHS
 WrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680793709; x=1683385709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh4qcndhDJG95oN4owUI9IOpNnJuYLVio9Sn39/QZ9g=;
 b=lKboGr6X359ix+nZtOl0YHG815QOvRr5L2Kzb6C/Cpfo0s+4kZ3hXyuV2kfmBZYILk
 e84pqQojgoILu4zgawckhdaIodn0llYR9ovVqtvhgTbSNj0M5ZFzAwhDhYDxZ3YPvKck
 qAo3jG/WxdlMGdBM+ms5dT9tvBNGKrnJ67lPcx2Lwwg6tXZ1m21L0stYYiGZoOxs0P2B
 b+fOPsP7HpN51fqKNpkBHMERv7XQVYJozcgNU6tpWVg9jusTKKkQtxjLwlsLNmq4x+gA
 ROfpA3+04PMar5/S6qXd0Vf2OA+z9e5iKSdm6kS7tRg6Ddmz7AHXtLti9UeBefpMDQop
 uO4g==
X-Gm-Message-State: AAQBX9cM9f+RUWGMBNvZyOG7RtRho2eQTo7jw5XensbctJIrblk+AJoI
 vDd+fCFptLGIwERQsUqe0HAb3cs5EGp40jEZqNo=
X-Received: by 2002:a7b:c7d8:0:b0:3ed:5eed:5581 with SMTP id
 z24-20020a7bc7d8000000b003ed5eed5581mr4576146wmk.2.1680793708915; 
 Thu, 06 Apr 2023 08:08:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003edd1c44b57sm1823651wmk.27.2023.04.06.08.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:08:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Luis Machado <luis.machado@arm.com>
Subject: [PATCH] target/arm: Report pauth information to gdb as 'pauth_v2'
Date: Thu,  6 Apr 2023 16:08:27 +0100
Message-Id: <20230406150827.3322670-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wp/9494rDoX0

So that we can avoid the "older gdb crashes" problem described in
commit 5787d17a42f7af4 and which caused us to disable reporting pauth
information via the gdbstub, newer gdb is going to implement support
for recognizing the pauth information via a new feature name:
 org.gnu.gdb.aarch64.pauth_v2

Older gdb won't recognize this feature name, so we can re-enable the
pauth support under the new name without risking them crashing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think the gdb change isn't quite upstream yet, but this is
for 8.1 so I would expect it to be there by the time we
get around to committing this patch to QEMU.
---
 target/arm/gdbstub.c      | 9 ++++-----
 gdb-xml/aarch64-pauth.xml | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 13fbe9b0d7e..03b17c814f6 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -521,18 +521,17 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
-#if 0
         /*
-         * GDB versions 9 through 12 have a bug which means they will
-         * crash if they see this XML from QEMU; disable it for the 8.0
-         * release, pending a better solution.
+         * Note that we report pauth information via the feature name
+         * org.gnu.gdb.aarch64.pauth_v2, not org.gnu.gdb.aarch64.pauth.
+         * GDB versions 9 through 12 have a bug where they will crash
+         * if they see the latter XML from QEMU.
          */
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
-#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/gdb-xml/aarch64-pauth.xml b/gdb-xml/aarch64-pauth.xml
index 24af5f903c1..0a5c566d668 100644
--- a/gdb-xml/aarch64-pauth.xml
+++ b/gdb-xml/aarch64-pauth.xml
@@ -6,7 +6,7 @@
      notice and this notice are preserved.  -->
 
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.aarch64.pauth">
+<feature name="org.gnu.gdb.aarch64.pauth_v2">
   <reg name="pauth_dmask" bitsize="64"/>
   <reg name="pauth_cmask" bitsize="64"/>
   <reg name="pauth_dmask_high" bitsize="64"/>
-- 
2.34.1

