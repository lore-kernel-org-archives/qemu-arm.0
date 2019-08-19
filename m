Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3184290wrs;
        Mon, 19 Aug 2019 14:58:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWSH1U5M/grHw62nXZudoVYF/4NOTks71sPjUloWTnS31pJC9NRnBI9BuDoYY9ws2hT92G
X-Received: by 2002:a50:c38f:: with SMTP id h15mr6127433edf.256.1566251899354;
        Mon, 19 Aug 2019 14:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251899; cv=none;
        d=google.com; s=arc-20160816;
        b=CR0K1BXCm0PGDELs2DyM9n1a14TcAG697YQHjf+f1iqtWLsF8+vQIPH3p/kSq9QKlP
         JxltGkFOmRIvCi1Imd5znxX/19CoO9tsMUrd4zoPSpXDhBg1WEMI5aL91TnrlO1A6Ztj
         UybHhfjZxqXmMoFCXNid5eQTMG8HX0DI4UIxhwsvxXKiG+nStd1n6byi3yTuqMyguwbZ
         n4KeiocqTdKx5+T8H44uXasO653kRK4fFetwqhHfG7GTOU86+DpD76eRMTC25TCYVjIC
         AP93VAJxDPIBgYYQnwHMULIgksFZl8k6m6u6TT5GZZeeKUsRV18hIhxbLTAcIXnpPbAS
         vNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PQ+LqO+lz8aRvDtiE1Qc+qi0l6DF2tSTKskus1LdpN4=;
        b=u1kwCntN29lHrxs9RKvhtyuX9JcAfOjmZRAvMTCqXakdbJBFKuYTf/pdpsHU15uN3S
         bi70yZq/chCFQ2BznWmvqhlfx9VOsY6JsghzcwbMYigN5yyDRHW+/9qX9NivdY2jNYOl
         xd0fXANz8kE//16lJbWQ65/eSmGCrHP61FzPpX76ISWQHDA5Iy9Ckz1andYR/bIelBT9
         0MUZ2D3WnUZJHVOlPbyV790oalJlznQ4rX4sD2ETZ6smmSgW5zYzpQgbh9fwoD7jnYmj
         MDkPquzIaAZA7ygFgrptP/F0Or6uWZbL7vCvN4bDOOyPuwWz2Sq1KuFmlxJh3NDgLeWh
         swog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yJtSnyCn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si7751497ejc.111.2019.08.19.14.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yJtSnyCn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpfO-0002MI-2U
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMN-0002AS-1A
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpML-0006Pe-V7
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:38 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpML-0006PA-Om
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:37 -0400
Received: by mail-pf1-x444.google.com with SMTP id 129so1946771pfa.4
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PQ+LqO+lz8aRvDtiE1Qc+qi0l6DF2tSTKskus1LdpN4=;
 b=yJtSnyCnzFgS8dO+gi9fsUmsemw5RartDZNEsx/CN9M9gFxSZQ8iCboaDsqo9BgcP9
 VJ/8frTOBPA+8HbkZjVnWcEXc6NpkWmXIPMDDmZs08/YYHslBtRn0OTfk28/aWqrXgiE
 QYavLQyrS38/iX8xsNsvGxsHKUOpg3leK08WVsFof2PoET7tmmU1EpDSIBdfmUIjwydf
 sUGBw/ZDM+irk9IgZmsoZGKHan0CYmFzqmKs0YrQPsiNA5V16BrpX+yIDtCHcy6lC3MD
 rrzhXllmvOdl4vo44T41AMF88Rjs5K7ibHMVeKQmcHTNfSYt3YUTE6cPx+hYt7GZOSdl
 CPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PQ+LqO+lz8aRvDtiE1Qc+qi0l6DF2tSTKskus1LdpN4=;
 b=BkFbYBVeLizrWzVBzFEsr9SeByyhjDuZiTp1JuG7gaLfI0ZXX45KayLmIg/pewLxjf
 Aqo9xwxVuYQtr5HtVYNRfsTQn94qRJqP+GQR/nrvx7btvbhpPHL4+MaNCCizy6VLPXRW
 1ul9jHT5IHg01Yl+Nuqy+LSeLk1O98jMd5OWak+yrphV1NTy1hX1ryt4/eRE7w63+yV4
 VYyv1MwzZ8pQblo3F9NcBkn4PVwbYb4J/dx4QU0LbN39B1M7wFMbKfBia2YCju2nGxDa
 NSCAgdteLx5T3sAgLCUZgN4KHrFmhVO27uQAuPnjqbaziH/9rI7M0EK5ENubt8F/r++3
 u9Bw==
X-Gm-Message-State: APjAAAWpxjszIYKLblJYR9Oc/Lk9e46DCkMD22G8nvAs0R/vkKHQIsjq
 ehoIbSJKo6gWiXFPufbYlZAEH2lWWUI=
X-Received: by 2002:aa7:925a:: with SMTP id 26mr26490232pfp.198.1566250716944; 
 Mon, 19 Aug 2019 14:38:36 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:19 -0700
Message-Id: <20190819213755.26175-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v2 32/68] target/arm: Convert SVC
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
X-TUID: QakNinP1faj2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++------
 target/arm/a32.decode  |  4 ++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6b7b3df685..b6d8b7be8c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9968,6 +9968,18 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+/*
+ * Supervisor call
+ */
+
+static bool trans_SVC(DisasContext *s, arg_SVC *a)
+{
+    gen_set_pc_im(s, s->base.pc_next);
+    s->svc_imm = a->imm;
+    s->base.is_jmp = DISAS_SWI;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10235,6 +10247,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x09:
         case 0xa:
         case 0xb:
+        case 0xf:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0xc:
@@ -10250,12 +10263,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0xf:
-            /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 24);
-            s->base.is_jmp = DISAS_SWI;
-            break;
         default:
         illegal_op:
             unallocated_encoding(s);
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 62c6f8562e..0bd952c069 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -528,3 +528,7 @@ LDM_a32          ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
 
 B                .... 1010 ........................           @branch
 BL               .... 1011 ........................           @branch
+
+# Supervisor call
+
+SVC              ---- 1111 imm:24                             &i
-- 
2.17.1

