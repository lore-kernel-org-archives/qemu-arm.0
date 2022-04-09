Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp175557lfq;
        Fri, 8 Apr 2022 17:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhM130ILCKiglIUfi3P/bOU+YIw6UGnZAFbtOwlVXOgve71GN1lh5rJC7/uutb5i0LoAYx
X-Received: by 2002:a05:6214:21ef:b0:441:262f:c624 with SMTP id p15-20020a05621421ef00b00441262fc624mr18431302qvj.91.1649463537476;
        Fri, 08 Apr 2022 17:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463537; cv=none;
        d=google.com; s=arc-20160816;
        b=VoSvFP7U77o5Ks1MAEBLs3K/KgW+EImybyhDNtRcLfg8JELIkoy/LRoHVa0EN2m12t
         dIYFN2WCuVIQIn4Kz+0RsE6lLdWAVia+KkjbmgX/J9RbfxqRSQwPk4Bi4LgqsHKtgJaw
         VbvEDiD1cZKL8cisLV4HGkWOOKnrm+cIqOfet6kBRbX+0kC9WTT3BZfFy7T7jG0uadEp
         W4Eked2qEzr9gWDiYLYzSein7uCyP9hODqpCvxXg7iOKIqlCsDfNjM8F6aASclJEBbIG
         TU5yt1lawBHlN6zV0zuB+kBxWrWdlymk1WDZI7WEaie5l47mj/lFYuopPEygnefN+tFv
         8c1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MNTGLvkJnkedUMp8qlCzOgaMtMY1y27pusQZ1n5mN5U=;
        b=ChlLAtPchDCftaH1v3YLjdzmcBm2iq9BcJGeX5aXc6zf9vANJKQ49HQwtTrhMab/ki
         r2p9Md6ghQDNvSSAxsPa9hmmJ5TccUcAZQ5ASuLhVhIA7UgqPMq20PWMyivXmGmNQtMg
         lPp3dVkdKjEwUUCU4nBSrIWmLNuQitt7EbfQSmtp/OehJ5uULMwcEtf/GC3wDlmYr9in
         BY0JDpVOBE+29MyZr8PrbNshwrzfnRsqA87OT2lSkh4nLYAYsgK30sWK4cKFjejH51td
         1sXPAlaqmgmEiKI2KtTnZa2vbyAjg7JafiM067SZVuivU4rDRzUY2Jx3gLuw3KrXoMqL
         VjbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKGhXehs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc7-20020a056214230700b00443dbf49046si1083265qvb.424.2022.04.08.17.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKGhXehs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyob-00035c-0T
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydv-0008PT-0P
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydt-0003Ta-C8
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id md4so1767465pjb.4
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNTGLvkJnkedUMp8qlCzOgaMtMY1y27pusQZ1n5mN5U=;
 b=oKGhXehssyQgfEXYL3XAvFG4i5rWVMrdA50LWDpEhoW8BywZYpbFCmIlsgSytpoV8K
 2Ts4pN3cO+Cs1nW6tJ/1oaaw0AvBiYtJaBkcc31ZnlYYjy3hCzFdDASF1SC7NAU04S3b
 80etyrWF8FP9BZVcSITs3AZRGzOIuL38H7WWz6e99bxdAzi3W7mwIYr2vnY5pNUy4XxW
 KGoDopiCP/uC2et8LN11/rD2sASyHjPpNUUg2oZFMSqixryANqRjp84S1OeBNol9/AFq
 KYCKvHEQniHrrEUZGimJAPpaVHxUBjVm6ziflKAFxAKZxqbPA0JOuHT9QTRBiIJvtv7o
 T7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNTGLvkJnkedUMp8qlCzOgaMtMY1y27pusQZ1n5mN5U=;
 b=5T+xaxIXMQlDkVXukt47dzoPxJsPT1QrmkLb7cU/PoDFDLdXJz3vl0wNjtilIjbmEE
 Hx+vnctbZpcxc4KsucjpomUlLVpA71Y6QHrrIJT/dxYsCWEpSV9k6l6ryDxUT1ObIGyY
 28C5/s94ACC9bnrcqNXGWL0CaIrvBZQq77YCdoW9LM9gJK1pS6FEYGWRS4IuB+GyD0Xd
 2yGvN+iSs/MEYqA0ETBvTLF0GTd2xK+BebyDXYdE9dS8TKlqeNspxA26t231g5W+OJ/3
 5XaRhwxZYQAPctqO4k0DRk96XbJzGgfef+2HynVaAXj75qbBX7uTydLzvFIILhkvemRx
 +Cow==
X-Gm-Message-State: AOAM531KLJgYfm11Kk1My7r1vnRAwwVvXH8nrro0nFI9ZZqRTw0lNMY4
 Cgwdu7gm8NgDo0JaLFO+1NeI0Q==
X-Received: by 2002:a17:90a:f01:b0:1c7:ea40:93e7 with SMTP id
 1-20020a17090a0f0100b001c7ea4093e7mr24794823pjy.30.1649462871809; 
 Fri, 08 Apr 2022 17:07:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] target/arm: Enable FEAT_Debugv8p4 for -cpu max
Date: Fri,  8 Apr 2022 17:07:35 -0700
Message-Id: <20220409000742.293691-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H9pnTxSMersn

This extension concerns changes to the External Debug interface,
with Secure and Non-secure access to the debug registers, and all
of it is outside the scope of QEMU.  Indicating support for this
is mandatory with FEAT_SEL2, which we do implement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 2 +-
 target/arm/cpu_tcg.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6b6422070d..f20fb6d9e1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -854,7 +854,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ac91bbea9b..a443e8c48a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -79,8 +79,8 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1

