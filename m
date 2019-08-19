Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3198340wrs;
        Mon, 19 Aug 2019 15:14:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7coUNq0JdDDkz05uJUa43O3r4XqDLS51ZolIY1rmchoXBz8WFY4m2FWoehcLypPuV3ONC
X-Received: by 2002:ac8:3315:: with SMTP id t21mr23390610qta.392.1566252871452;
        Mon, 19 Aug 2019 15:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252871; cv=none;
        d=google.com; s=arc-20160816;
        b=Y72qjqFdou43sFSVdBNVwV4u49v/9rN+4OzrP+QULb0Et3n4cps1u/SFNY7spe525e
         Sr7Zunad22sUWdYlJVaZE39XbmVo0Odn+WnwjmMWODvOusUH5PBsxOXhDC/ObaBdKp7x
         w2CJVEp34enGnnZHLjbCo/OcQrYAQKqrf6rS/d73cM5/m4Qds+M1LKBxMoElKfiS8Jxe
         +gfNGh54rKzXdZqSMtwS+iTBn1z6UAoMvAenXovOgL3xiOlJEKnbuuOJDtFvF5ILyEog
         DftozWK90P0j4E8U3bK6feuSUuVuNAumNMKuvUay4JXQUwvMQBizzfIqFVa+n6q+nQpR
         Oy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AfObyYVf+TtUvkYatWrX5oVYyhEhA7Z+ZbkDEmf7ZT8=;
        b=g74InCWzLnug+w8T3W6UJCewbrzKEJrnT4aq0/1VkzzHnv/76sCfs6itBnqLlZvMUB
         PYI8+MI6OQbXexQ1kYFshXlWHCyHKeE5oMycAKuPnWEEPFMO4j7SF38AHPjQy/wSru0A
         b0yPHRD9E5QSC/SaYCZ5pUykndiuJ5LmtFMtbjWUEnfaz7HnvvUWcXLrz8B7Z7yQIRO3
         geKqyBGLEtx2iSq0JqgK9yZJ22eyzbmLJuy6+vUeoLBIqNS9mxSrPPVPneD3j/2rWjHU
         1oizN0mh1hIOFBP44QKj4mP9r9XcnQwgYuS4pfFBnv887tLEqI5x7tghOftd56T5tS9s
         /DqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RFuZtKWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si9622370qkm.355.2019.08.19.15.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RFuZtKWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpv4-00083V-FK
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMV-0002NA-Bk
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMU-0006VI-B5
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:47 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33052)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMT-0006UP-9a
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:45 -0400
Received: by mail-pf1-x441.google.com with SMTP id g2so1954439pfq.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AfObyYVf+TtUvkYatWrX5oVYyhEhA7Z+ZbkDEmf7ZT8=;
 b=RFuZtKWFqnZO0ojoGmbmoV+jl/jaVkvAC9l8GHZG0Sy3J5rXnNMMp8S3ITVP1X95tU
 GM+1qmUS7we6nFCdoBPGu+vSpi73vT67ty7s7RmJXOE9kNxl14bpsAz1V+tPE/oCOX3w
 ltPuhuBXHYVCG5EkKZ+Av8L7KahVXtIMSUll+5nRwd8CqtVYalAUuq1kVLL67GiK9iFY
 G/7xRKkwHdLBK01/ABYGcJ/HJ7IzVlnyJiks/wszSXiP8BLnzehWwNZcHhDlp8hEsynd
 AWuznA/tpXZ0I14XRkzsfpBDPYMElty8M0gwagZBpFwRnpDR2dLee8r+UBoXOJGBiclm
 l6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AfObyYVf+TtUvkYatWrX5oVYyhEhA7Z+ZbkDEmf7ZT8=;
 b=VB08RSpgAe8m1YwcVh07KlCv6FQGfQEyAgtvK5d5ua8ny42DZzO32R65v8SqMVQp3m
 nEn0kPcw+kKtiuBi3nafbDZV2qIBYnyFgu+uj1uot4pnpAgEDy8vxbqXAMCCbSMzTkaA
 QxAF+nU9PtQrdBJd+WFh8yQArtt6g98BvBS7fEPrSOEIzBqUGxY+ICFSIl4XkONrgNtB
 dym3Qh2vCilrvdtDa7X8Vjxi8srDrG14pZv8uwiOplFIRpVSo4b8NJZYOxYKctFqMAfW
 HtawnfAKpOY9HEJ5lZnjq2DbM4ftKk5TQLgeoDalahOWcUUjmG1VAPTebglwqf0xgoXQ
 PiFw==
X-Gm-Message-State: APjAAAU9znC1p6koXnjcJ3Pl9vdjQxxzfiy16q1w2jAhc2aYo/64KuvH
 EA45LReOWADVnIzryJILYgQwaA==
X-Received: by 2002:a62:8745:: with SMTP id i66mr26021455pfe.259.1566250724045; 
 Mon, 19 Aug 2019 14:38:44 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:25 -0700
Message-Id: <20190819213755.26175-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v2 38/68] target/arm: Convert Unallocated memory
 hint
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aG9K4ntuk6lv

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 8 --------
 target/arm/a32-uncond.decode | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a30a9bb4e0..9ec6b25c03 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10216,14 +10216,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f700000) == 0x04100000) ||
-            ((insn & 0x0f700010) == 0x06100000)) {
-            if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                goto illegal_op;
-            }
-            return; /* v7MP: Unallocated memory hint: must NOP */
-        }
-
         if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index aed381cb8e..afa95bf7aa 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -64,3 +64,11 @@ PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
 PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
 PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
 PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
+
+# Unallocated memory hints
+#
+# Since these are v7MP nops, and PLDW is v7MP and implemented as nop,
+# (ab)use the PLDW helper.
+
+PLDW             1111 0100 -001 ---- ---- ---- ---- ----
+PLDW             1111 0110 -001 ---- ---- ---- ---0 ----
-- 
2.17.1

