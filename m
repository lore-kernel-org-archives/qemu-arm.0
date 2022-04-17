Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1268161lfk;
        Sun, 17 Apr 2022 10:54:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNRVUzigT/ozJC1pO17Dqrpt/QWB57QchVr0E93y7i3C0wwfZpVY6AJMhjpPK7WzF8lxbp
X-Received: by 2002:a37:a055:0:b0:69c:8302:7c0a with SMTP id j82-20020a37a055000000b0069c83027c0amr4719393qke.56.1650218051488;
        Sun, 17 Apr 2022 10:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218051; cv=none;
        d=google.com; s=arc-20160816;
        b=I/2A2D8+fpQ1Bix3NFdMVlF7Fh5w8kzOCrIjWs1HEYPKNpKoayhMjplB+nDJ+d0bDa
         Q63dXqDDZLbrgPWdl5rdTPWCYVW0UXF8qJhTkStyLfnswFRLAqWLOkuTB1Gph04jhAt4
         BtCvwiW0ikUrzA49No67val01AwP3T0pmCF2Mkv6R/yNPWD7Boi8udUmhNeCgd/mPn9q
         J4YwNlViyrsrmtUdoycqmHgOqTA3ClsCtPIKPZsOdXAEymwihfqLYY6dzWcuYqpPF08/
         EbahGXfhXgXBbjPUByqzD5cpL6QrRNHATMRAAQSe3RNpIPNZRU4uKVdDrWepUGHbeolw
         DwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QU3oeydO4deqKs71AOrHq4mL0RBHni0rDESBhTtVtZg=;
        b=iGojkaDvAn/y/yKhsG/drdFkWO9eEwstlnjDncMp5pKXx2ARPBVLdzhW0gZOkkJwFD
         e3PqRHnMRc24pE5c9gtr1TX9GHjW7KIlDoHpxh2ZK6z4EfS4dw7s7Q5hB+u+X7Z35zUN
         d/u5hDm9MCIEjEB0jQ8lxSE1U/5sBjQZ/304JkIq/MkYpxdrIJkiI9F3T8/hGkJiJbos
         SXVwqfyuSi8zBUPzya1hC4Zh41aTDYMNSbzyAAOHnuX8tcbhVY7UjcmTZExXkag7ENCv
         3HwnvmZUUouisUT/smAc7bm+Mq7Dj1S62YxAnKyryZYqLREuouXRosOLm5FXX4Qhf3k1
         M8XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuHfkcAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac813c6000000b002ed1365dafesi2062807qtj.711.2022.04.17.10.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:54:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuHfkcAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng96B-0005V8-06
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wu-0000eX-T7
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wt-0003G2-7v
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:36 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h5so14948572pgc.7
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QU3oeydO4deqKs71AOrHq4mL0RBHni0rDESBhTtVtZg=;
 b=QuHfkcAa45CVHNhWIt5J9EguM6s0DglhM2qCMAOia+jzJ5jEmbq/eZgmSZMXu+9Jcz
 evGbGUhTefzInCOFnHboL4DEIFTv1RUGO3o1lG+l5SYB29R2ikvOifJxIZuUbnq65sad
 PPxeIJKD0T19WIEoi6axKLrZS8cGM3JIYZ8QcfpFJYVoUTBTtoEjCWLHJAgyP5Hm5gFj
 li8G0ND1j/RVNoREFGSURvmPCFxuO4wUp08jOO7qLz2lFvB7F3Uli7KBdj8+8IzdFeze
 e929xuBSZAWfFrjvf15McWULdX/kfJWrVy5qUKXQiY39vxAn7Lfig0wczP5JEApAErX0
 SK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QU3oeydO4deqKs71AOrHq4mL0RBHni0rDESBhTtVtZg=;
 b=GlMMDrtmb1DTjg0URSwgUrPWgfu6KgOL6GKKHKP/FSypDeEfnkCt83d2vDJcIxkOv7
 eAGibJE3XtZqMkd75NNwbIHEhaSVjB4l8peDRwF86k9ixamwURKyVZ6qJpYSh4JpgnqJ
 HWXDEHz2j1021u/SEFY29gkPRb7WGS6Cx4MQlzjlpmlYmj/PbtmADLygiVolaCq+tYqS
 vpSDfTiVavUabd6tP75Lj59mIlILARKv+Mb5VeMcMJ/iW72LBNU0mCp29TP0lFPA7rav
 Q4R7WlBlSODe+/Sjpo5ZVwBQUU7z87bdw9em/R0pWoG4JwG6dIVGTKOF4iiB3BzbOk0x
 Qs4g==
X-Gm-Message-State: AOAM531gw+tQ8wcRmyZxksJd1fs5Ig4F1Nk3Z/TAqgfC37CLH9vOj/V4
 MalWEGgNApIbMGmJGO+ylxRKqaV1LZ2AwA==
X-Received: by 2002:a05:6a00:997:b0:506:1e25:435e with SMTP id
 u23-20020a056a00099700b005061e25435emr8268538pfg.9.1650217473977; 
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/60] target/arm: Change DisasContext.aarch64 to bool
Date: Sun, 17 Apr 2022 10:43:31 -0700
Message-Id: <20220417174426.711829-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: EzzU8iPfAaIr

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3a0db801d3..8b7dd1a4c0 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -59,12 +59,12 @@ typedef struct DisasContext {
      * so that top level loop can generate correct syndrome information.
      */
     uint32_t svc_imm;
-    int aarch64;
     int current_el;
     /* Debug target exception level for single-step exceptions */
     int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
+    bool aarch64;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9333d7be41..4dad23db48 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14664,7 +14664,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 1;
+    dc->aarch64 = true;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..480e58f49e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9334,7 +9334,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 0;
+    dc->aarch64 = false;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
-- 
2.25.1

