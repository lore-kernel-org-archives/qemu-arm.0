Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2935593lfq;
        Mon, 11 Jan 2021 11:27:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHZ8J7Flz8VcAxDJIM5rdSJEgzmZ+wy6aZ2V9W1tWVSQb66+7B0CRIDMj0vl9cKonVe1ll
X-Received: by 2002:a25:7a44:: with SMTP id v65mr2089711ybc.0.1610393238685;
        Mon, 11 Jan 2021 11:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393238; cv=none;
        d=google.com; s=arc-20160816;
        b=Yc3GkArwk4vNqmJpP8viYkYOuaI6bhzKrpUXmxxJLcTK30GBxIPMqrp0KvNwHm7JbV
         Bkhl47YB9zXGCtQ6jZ4gKnDgQ006h4nYMn58OH/u4OeE38oR9OKe1OdJoT/EX2EuOs6X
         YuGRJ9B4Ewl/mcMJcclNmQufim/btOM0G58sI1gfVjDjVtnv/m97iHPQltBMxuR0Qqtd
         diNXUdYaEfk219Xb5g/lyBEJxKvYjWMFE0ZzZtT2Y8+9bnVo025jsEXK8B7PriOXbsr0
         pDnhk/hlXf5Mq0oQKSMA6uoYENFySfIP5d0eBdENvdvJPG1pgvjUjSMZFrydPX89p7BG
         q2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ujOKDZy3uoTEqD4vP5J9dsO4Br90YqivAcCQm5Xm+7U=;
        b=RRCPQpMalH+alX63EEsSn4ZMM7ekzwvsv1Kn+v9fidf/MfHgG8/JtUr+0nsrqPnqtI
         AuP1NknOuw6reCzaKkJDuY677bL9hW55h3b6l8HDjw6GwpcUL9Ds3GKYPWIEL4Jexlb0
         wJYbXB8uTQHkD1ziPTlSvOf1Ox0gxLON1F597/lIwH7O/jrMwamFY+VdYqhvj35erVO5
         TAk/mENbcHcSXIDrHOLLqhBrbPJyj2Yuqv7VDWIYKKwNldCY0m4xVMOyCG5bO3LlKM6z
         UxqZhmsOoUXurZ58gvAAlBcJxYzomNRAwSWRFLPDC0te5ujR71F6uYgeLTD+3jQatfiW
         7eHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNZiTbIF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si600586ybp.236.2021.01.11.11.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aNZiTbIF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2qU-0003lM-1q
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SH-0006VD-Bi
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S7-0006YA-D3
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:17 -0500
Received: by mail-pj1-x1031.google.com with SMTP id f14so93426pju.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujOKDZy3uoTEqD4vP5J9dsO4Br90YqivAcCQm5Xm+7U=;
 b=aNZiTbIFFzVjIqUwovXPTXh2ftYT/zs5MttzANqbMh1aVHo/lEb4ayoFE9lSP0Osye
 5vH69wEVGeBG7i9IXXfwiTAFX7UF6fCjwEFB/5bbiTmnBEDiS+N3DHcB3JMW9Ipqwd1g
 ogAvkTgH+KR5PhmPVlIcrUk56gQ0dSp+moJnmpZz41sEsoIZbFd06JgdzP7B8BXAk550
 paeQdHz0TRYtUio/bK0FkiIC6e6ck5oXHJCa4DzJter8mZMt/bzmrf4C53GmOXA5fjYs
 D1wOcGg7k25XzWfthIenL/T2dKaHWiabUPNgcD2tA6yPeG4sIEmUZFzJExdmwzENvFbZ
 Ijqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujOKDZy3uoTEqD4vP5J9dsO4Br90YqivAcCQm5Xm+7U=;
 b=paagAvZaWSrWPqjuw2gDevZGT5JoOiQIHzfwYqqCN7NSFTBZmaFPoocWLqMDaWKiR3
 HkVyk2uN7SyuaNpeXpT2kf6lOXAfP6mC6C54WSfV5CEn/NWEQkcF47nlZTN2+CV4Kn3j
 HwcICiFYU/ldbb3jCyfY6S3hyrvSnOr4KhaA+Y9POAbV84d8BqF3E4iDfSgsrp/lbfWR
 CfYSTq8jdNf+rF1BT86X8WBnfIr6WaMvxrme1eY4I5dGS8H9V6apM43gqDX3J610BbbC
 4VzpDjGJmts9Ygnp69Q8nWRWfqhkkqNIgHMXMuPoKaJcV8461pEh4yk1wuVY2Gzxt72w
 27zQ==
X-Gm-Message-State: AOAM5319ypWfr22UnZtbjr8sNUqOIo3oF/oWMQjMa+Zoia27lXJvUCbZ
 C03T+aXfu9st1kaxiN5ZnE73oGAsXjdrIA==
X-Received: by 2002:a17:90a:df12:: with SMTP id
 gp18mr283095pjb.43.1610391725601; 
 Mon, 11 Jan 2021 11:02:05 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
Date: Mon, 11 Jan 2021 09:01:11 -1000
Message-Id: <20210111190113.303726-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kq0jvy6TxNz8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 296cd430ab..7765c15e0c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3606,7 +3606,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     bool is_postidx = extract32(insn, 23, 1);
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    MemOp endian = s->be_data;
+    MemOp endian, align, mop;
 
     int total;    /* total bytes */
     int elements; /* elements per vector */
@@ -3674,6 +3674,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
@@ -3692,11 +3693,17 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
+    align = MO_ALIGN;
     if (selem == 1 && endian == MO_LE) {
+        align = pow2_align(size);
         size = 3;
     }
-    elements = (is_q ? 16 : 8) >> size;
+    if (!s->align_mem) {
+        align = 0;
+    }
+    mop = endian | size | align;
 
+    elements = (is_q ? 16 : 8) >> size;
     tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
@@ -3705,9 +3712,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size | endian);
+                    do_vec_st(s, tt, e, clean_addr, mop);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size | endian);
+                    do_vec_ld(s, tt, e, clean_addr, mop);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
-- 
2.25.1

