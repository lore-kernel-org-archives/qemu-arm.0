Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1267158lfk;
        Sun, 17 Apr 2022 10:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK+AKl4wKKbi8Gsq/e7UVCVskobNPqcoW49NpIvWFWjMqlWKSsWkNkx0Ydg7Xk/f+Q9ouS
X-Received: by 2002:a05:622a:1a28:b0:2f1:97df:cf3c with SMTP id f40-20020a05622a1a2800b002f197dfcf3cmr5087261qtb.119.1650217869349;
        Sun, 17 Apr 2022 10:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650217869; cv=none;
        d=google.com; s=arc-20160816;
        b=eUnYOqMFent0Q8wyzEKtsHJ1gvEAdWymoJVxa0AbtvJmljupqQNXsdUqzDdNsmy5Gs
         a5swJt5ml5ZHgHJG78lrASx5Op8MY56gl9RzDQ+lbHDVAAOlulu8hAkIfVls+glatGu4
         NyjVNf7xUy6IzvyKGOwo/FGxGPVxFFPXs3Eu/9q9OKoziNV8iG2tLKRzmioEY3TmgU06
         3JVRPQu4pOx/D4SVHinryqEQATB6pM4TgYoTNHyrDIstV+85XEZYgFee2MVonSM5ff0j
         DfvK6v95bnYrdItA7vi7ZiJNa4nix59UQDMn/anETylugB2q3xUlNk5VTYK0MRcGzbAi
         LaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RxLRcUMRXZIX8VeQpjedlgnjJfO7UvkrNmgRZi4O4+0=;
        b=F/v3NfFT9LH9iKlet3FKATbXQdhLYtcLl2ynwPnGuVr+VNeWJbavF+N7yd1F2NpBQP
         LD3P5iOEnRXMh/p1h1flVgT8ttX6cHy4F9/g+9t1NFqrkCU8hicywcGQSd1C8NbciPLs
         7GSF94BU3COosccyqC9BlV7ccihSaifrXsaYi51CSffKBSAeToi8lYSIGeJ30ahYCRX9
         QOLRkmLpbrl0n0AW8eGJs/EX9D45Qfz+ttLmUfQ8kEOCP/R39z1cxKPrinO9cZ8zQXCL
         w7hiX6bLQyuBG/0cbAcU12RDOZ5YcppE4ZmeOOc/SFmN72i6AQ6lZxqjPT0J1PrcQhrY
         NQ0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdLM8h1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a0562140e4700b00440e46a7d67si2188814qvc.517.2022.04.17.10.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdLM8h1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng93E-000893-Sh
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wy-0000fV-Sj
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wx-0003HA-9a
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:40 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q12so14933806pgj.13
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxLRcUMRXZIX8VeQpjedlgnjJfO7UvkrNmgRZi4O4+0=;
 b=KdLM8h1JGtzeZuX9glkjRthvPMUmMwW7CNEQ/sKHmk5U8L+Lptw5Cj5sJvm/W0qu6Y
 1aQIDVX487Smbz7Tqsw/pP7DR4DmpUh4cvKjVuXnB9TWKHf3iQnK65l14jjz4yljw59B
 RF1ySx5Gb3CLSsWlepjHm0JeiezwKG7brMkVw1TuawQMvI2GoqEOm4pJKLpjuCbnGbg9
 hXHKQNxfxSAJgr7AjVn1jMncJK1hFKLIMktb4ZtuIPfppky6hwDFivDupaEglnz44f5c
 RXCYzPzhN+brwePv6ln/I1dLX/8Fn4LEGJ4GWODZ/PTOvHHvhX0bZA7k0Zcfb0b6yT18
 35TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxLRcUMRXZIX8VeQpjedlgnjJfO7UvkrNmgRZi4O4+0=;
 b=hwkT6rZCvQiFZPH10E7UiuurgOe/mACt5odxkp19LddiBm4uspQezhuehsI/D14dWo
 wLOzBKRqPZ3mZuqlIyGUiqWhanz+DHODGHqS6LPMIWH3vAPMMlgfTA/ERG0hWy5qUGoa
 XyglWmeEDOWzws5D62IfjsJS2m3gpRx5xeDtsPirrQ2unHdgWysBVHh8hsh2Xc55HeSR
 ZksHLzChuUIe2nxz7B47vtZ8GwgL8df/ihx4T4cPcBoBsAVQdvoRl6TN0moTyJgKf/Z0
 UO33ICz++yOUMfMFwBEAfvejgWpSz9VQcNBhdcncZTRgYS/JHyWAF2UfS7g5xAr2kqke
 gKWw==
X-Gm-Message-State: AOAM530sm8hasel24fk5Sp4ZZKcIHs7rRcPVTDedwoWaHc58pymxqNuH
 4lSYq6bfrhrOrZCEV/e9fUE+dA==
X-Received: by 2002:aa7:920b:0:b0:505:66a5:3029 with SMTP id
 11-20020aa7920b000000b0050566a53029mr8313795pfo.40.1650217476615; 
 Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Date: Sun, 17 Apr 2022 10:43:34 -0700
Message-Id: <20220417174426.711829-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: PDpCfh3Rr4j6

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8b7dd1a4c0..050d80f6f9 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -30,7 +30,6 @@ typedef struct DisasContext {
     bool eci_handled;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind;
-    int thumb;
     int sctlr_b;
     MemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
@@ -65,6 +64,7 @@ typedef struct DisasContext {
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     bool aarch64;
+    bool thumb;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4dad23db48..be7283b966 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = 0;
+    dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
-- 
2.25.1

