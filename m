Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4315909ejy;
        Thu, 6 Jul 2023 07:12:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEVyLKCUDicZFClbT4w3kytH2MBoJUW7E8e9eR5LJlbAf8LOpZyZIHtl4YptceY0KyHAAbG
X-Received: by 2002:a05:620a:458f:b0:765:a633:43f2 with SMTP id bp15-20020a05620a458f00b00765a63343f2mr2520446qkb.12.1688652768344;
        Thu, 06 Jul 2023 07:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688652768; cv=none;
        d=google.com; s=arc-20160816;
        b=IXCGHhXoo8dZQBGiCsnet1PkLfryu+qV+B2hLHh6Yp7UROtHLsXZR5Sd/pLjeaKX9C
         MIhWZAt7pwGtTM0ahsugNAinq5smNrW3+25wnS6OTj6QMBiXrXKHaw55AzvzmUO8UFt5
         BX6pUtOEjfhdbH2F3+jdf4uBh0iK4CGALoTHClSeTBkB9yOMDqhmjc4OKR/FlhLjDr78
         i6ViHB6VXugNlGj5JJeeJb5og2K026XMtcrINSZ17RswHubAXEzGNTkjhNavlVlzdxqo
         ZH29d1KTP1sPfONdZ+P+TZCkZDcmHhh+j4WA+hUkRsvqqKEMIaTbGekk8qu3pabVkRLf
         x6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=y8EcAtZee2xyMmG6qvAV2IgEtPw0oRg5VwhrhipzSYs=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=rgn1nmKKm8jrmZQxBzaiV1Nri/u45Y4i/JOyzPgtYRrzRKYnLF2JPmy+FQBw4f4xEO
         C2stwCLt8moQusqREd4OncxmRb4e1V8hmwSOxXySM0iqt/aDQrkmLwDbhpVaFSBmzaow
         50zW21bMsxe8gJlwVf5bZGKv6IReQ0EoIWrDabKm/Zr9U9n6B4LHcy0XjpZGcZfuaEn+
         hh+0aUiKAiMCMTsLm9fh80ySlPn1JSZuAdLsZA5OufAmiMq3XU100dH3qo5PU+Sq8Xuu
         wJL7CWk2B3w54LXKRMjAH2GQBX4LHdKZtJ4Wpp+OMyY/lW0MniUDCER5jshiAkPRW4Dq
         SBVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JN2+eRKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020ae9e315000000b00767179b3a48si1157535qkf.289.2023.07.06.07.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 07:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JN2+eRKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHPif-0004Qr-Eb; Thu, 06 Jul 2023 10:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHPie-0004Qf-4C
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:12:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHPic-0005lA-Ah
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:12:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbdfda88f4so7941145e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688652744; x=1691244744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y8EcAtZee2xyMmG6qvAV2IgEtPw0oRg5VwhrhipzSYs=;
 b=JN2+eRKcb487n3IfDnwMiVDYw2P006KKtXU2S9h1ZJAPmy95/wStwSLHd1VdQy/EJN
 8hajgfH4gM+YCfQn5LEiLOL/ijpFZOVDrvOypr/sNyU+fMFyowL+S2VDK1YCCl2WU5bF
 Bk8PevrnrUuMcbAb025Hyv3/QEjNN699K8c+lRlCLxcZeGtdSzwLgesIgQwtHLfZ1gLN
 iBJkj8jOrzVaG05a30+W2FMQda6jTbwhZW+0FkqcqKq5jK2Y53DkJccAJkhHOji2cfCl
 5q0jk6Eio+pGjCBx3hgKlNVz7wApFLHhkh4xP5JxXs0amNI3r8bQmqHC6CKNZl52d9DC
 OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688652744; x=1691244744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y8EcAtZee2xyMmG6qvAV2IgEtPw0oRg5VwhrhipzSYs=;
 b=edweXaAK5YaYi+UhHplH0Bkwvyda5keY/jG+O1FlPR0efQ7iohaWt/ldxOKFGM4AAp
 t+pMCky2RQgJ4Cnv/x2GrrP/tJ112fydvcvISYJlX1R78mgczA6x9Emkc51OWA2iU7Md
 38ZvH3ilcg7JYrDU+MdEMMIzheIKRK7dMF+zeKu4GOse4oEb0qWaDhePPmJv+/URYuHb
 dDR4aTnBR7BxFFMjkBuAuV4XGlcuvCDW2hNfetvCe/f+iJicOmVjlWNM/FVBXZd0buuQ
 c+NYWaius1l4S5W4uAcG+hcUH5ykTY+OHi10iA6juJpdkjmKTqNKRBKwosI4FslEn1QW
 vM/g==
X-Gm-Message-State: ABy/qLayIagiPGmTWN5R1i+qNwdNVIrRVTkKk3wGJteiPa0KkJV7yht5
 7WMEpzsYdwbwlVrYv/B+VjA2sQ==
X-Received: by 2002:adf:e790:0:b0:314:824:3777 with SMTP id
 n16-20020adfe790000000b0031408243777mr1689836wrm.48.1688652744037; 
 Thu, 06 Jul 2023 07:12:24 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff992000000b003142e438e8csm2008708wrr.26.2023.07.06.07.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 07:12:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
Date: Thu,  6 Jul 2023 15:08:51 +0100
Message-ID: <20230706140850.3007762-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 76nwdWBQ0ahr

Arm TF-A fails to boot via semihosting following a recent change to the
MMU code. Semihosting attempts to read parameters passed by TF-A in
secure RAM via cpu_memory_rw_debug(). While performing the S1
translation, we call S1_ptw_translate() on the page table descriptor
address, with an MMU index of ARMMMUIdx_Phys_S. At the moment
S1_ptw_translate() doesn't interpret this as a secure access, and as a
result we attempt to read the page table descriptor from the non-secure
address space, which fails.

Fixes: fe4a5472ccd6 ("target/arm: Use get_phys_addr_with_struct in S1_ptw_translate")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
I'm not entirely sure why the semihosting parameters are accessed
through stage-1 translation rather than directly as physical addresses,
but I'm not familiar with semihosting.
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9aaff1546a..e3a738c28e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -465,10 +465,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
-            .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
-            .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
-                         : space == ARMSS_Realm ? ARMSS_Realm
-                         : ARMSS_NonSecure),
+            .in_secure = is_secure,
+            .in_space = space,
             .in_debug = true,
         };
         GetPhysAddrResult s2 = { };
-- 
2.41.0

