Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183836ejc;
        Mon, 10 Apr 2023 18:08:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuNhJDvGI7ZvIg2f/nMD+KWUMY3M1W311IYNRaNd//HabG76ZAJpqZdGHmHmRLTgSVVkxE
X-Received: by 2002:a05:6214:300e:b0:56e:bc62:e151 with SMTP id ke14-20020a056214300e00b0056ebc62e151mr23698411qvb.7.1681175300262;
        Mon, 10 Apr 2023 18:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175300; cv=none;
        d=google.com; s=arc-20160816;
        b=z6g9DdCqYNVf4Ob7P2g0pSLl9ZYlFnU1Ad6AMartEiGqzgiXbyGMWiznoHFXwUCLj/
         lwQNybfZaG674vzQgsy/CkfveheWjLDlMz9LObprzImXI82qfnsgHcxPL7Cj99JEPQxu
         NsU9gr3nJwjLwPKNs1Aa6If5M7NC4lxpoWgLTJuzbCg+SRokAVEoP5esanrbF9tsinke
         htXMBLBkL8TZSIxJqKzl5pN3VuHBKG64U3l0RZUnmDTEygbhEbrr0tV874If0aLa8FUv
         JtisES31nm0UaBfjOA4D/OhDfyE2RW2bIgNs59A/I8N3mB8u7jMKWfDELNV5o4z/HWPN
         B2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sz0V8vMtRGVbrYAv3TYBEb/m0VtaqYXZfpQLz+M3/Cw=;
        b=XtefuMxMtjrR8gwOmn1CQ50D74sJhXoEZ67y6gsHTS+IYEwfva0IUIM2zjYWEljFOj
         XKxGyAxqVXE+BzNVBIhZxbs4cDzdBO46iwzeyPCK4G45LhJtMymxIyi/VG6WH4z1WFo3
         tqmFvnQyivE5snq4FOLPQmOxPWhcSysfbUGCZu484xaSXxCtmDR+82VW1R4IY3dzK7Sk
         qdfYgmKMPI6/Gt+iGCOsOxMx1J61zjnWPVDTaN7UI0UIRuvB8//k2BS29byTmvYsGqZ3
         DINbvj4sX43o1GmxKN32Q0oP5Q86P+ZJQ8dU4kab2/Bc7b0KzeSUANCLxHoShwt5MGui
         lTuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FbeFLkel;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020ad45aab000000b0056f0822fd3esi8446585qvg.224.2023.04.10.18.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FbeFLkel;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Rx-0004LG-BI; Mon, 10 Apr 2023 21:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rm-0004AH-39
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:23 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Ri-0000V5-1m
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id q2so11144246pll.7
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sz0V8vMtRGVbrYAv3TYBEb/m0VtaqYXZfpQLz+M3/Cw=;
 b=FbeFLkelKPVM8Hd85QJAcC7uhKLnXWP0/Q2PgLkRBvtTt2JdENAJgFSomgebxisYPV
 lEzTnTNGf8AfhrcLCp60IW6b8H1JdfWAXNN/9Y6d+02xu+/a/kAaSB390h1JQQ/abP4q
 yDYqkEEa5jMRJx51bvAtjmqnnb7y3hcztyxDc59JjdeTQ8mOGhpYQ8aS0Bz6tTH/CewX
 HpobDDyvm4HQiSxrdz3WvsFIeouGB9VThv+4plt5+sq9mDmg3A/nmkgQ4HLIF7OF3Jeq
 /j7w42kFUrXnwQt2ae5ElPsIpzVc8667Fr3MUjMa5DZAgMC+NyjTBuiAO0Yr6xMbGP87
 mS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sz0V8vMtRGVbrYAv3TYBEb/m0VtaqYXZfpQLz+M3/Cw=;
 b=kiXPvfjT0Y6nB5bpxhbjrv/vXf+AHKj2SqFKzQfyC6hQrhi3Ar7adHHm2yxi6uvVK/
 tajGcUfh5wALJ7CMCKC3D488jB/koray09I77RtM13T8YOzBUMZKE0KEhV2EXeX/g7Oi
 faJHWtrP96/vi0eq9Puw20VpLommnn8jefw5ZwYWGfXDfjj7WaI8Qfg8njraN7jEQAPg
 HryX3SAjrdrzVojGPR79AJ43OPMIydYubmt1vrKpmdvaYDg8MmxAFXOFRCOSv0mkedFq
 dJBI6b3B+1W0gX2HVhQws7/zLVo3DzmGbw6ek7BNvwZ11r6cY6aPHGmYYUZDsAI+9QGu
 mlTQ==
X-Gm-Message-State: AAQBX9ffNbgb6dOxxYdRNzPEYhIv89z9YoajTQCo29HW1TrhOuABG8nb
 8RBz2+1ZOUJ7XfjCXGR0CUW0+41BhVgslDBQH/4=
X-Received: by 2002:a17:90b:30c5:b0:246:cf1a:569c with SMTP id
 hi5-20020a17090b30c500b00246cf1a569cmr2253887pjb.35.1681175116626; 
 Mon, 10 Apr 2023 18:05:16 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 01/54] tcg: Replace if + tcg_abort with tcg_debug_assert
Date: Mon, 10 Apr 2023 18:04:19 -0700
Message-Id: <20230411010512.5375-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 9OU9Fmbhp5Th

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 4 +---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..100f81edb2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1174,9 +1174,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5a151fe64a..dfd41c7bf1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1369,8 +1369,8 @@ static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
     }
 }
 
-/* Use SMALL != 0 to force a short forward branch.  */
-static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
+/* Set SMALL to force a short forward branch.  */
+static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
 {
     int32_t val, val1;
 
@@ -1385,9 +1385,7 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
             }
             tcg_out8(s, val1);
         } else {
-            if (small) {
-                tcg_abort();
-            }
+            tcg_debug_assert(!small);
             if (opc == -1) {
                 tcg_out8(s, OPC_JMP_long);
                 tcg_out32(s, val - 5);
-- 
2.34.1

