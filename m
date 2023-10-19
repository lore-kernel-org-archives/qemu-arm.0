Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp712916ejb;
        Thu, 19 Oct 2023 11:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1JFzJPjd9PkUCQg5sA4nWgLhchHCevvykaLaqY4R1iOTArVjeU3itFl6Pwf9n+n1vmJV9
X-Received: by 2002:a05:600c:4ed2:b0:405:40ab:7693 with SMTP id g18-20020a05600c4ed200b0040540ab7693mr2495492wmq.31.1697740364863;
        Thu, 19 Oct 2023 11:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697740364; cv=none;
        d=google.com; s=arc-20160816;
        b=gnuzMmvDCgmUj1NX9rBaRFJQQuNgZSoEc82cpE+l+R7rYu+IS3pJEHg8GSZ9j/C+RZ
         Ux9g6cO3L9mEet7urpjRbRyyUe+orOoM8t90/zEiw+chpm+nSVbfi2iRUEDNPzNsSIFv
         JQoWJL6qFQf103xNS0RKYF0JXkPa6/8Ha+16CavjTcW/+rCJF7uK3PtmfX5EQ0kYDt/B
         cTfnsEaLsfjKOWxSZFPhrLra2hEHiOYd9qIhPzvzosSQAvwgKUNlgnesa4zbayVOL0M4
         kL3y38FroEA75KyqWdmauVR+8tpzSZuO31D30EY5591kaLbUZgVliiVrFYYdaFds1FXN
         fAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QTHub7s42k1B/V2tyKlIn0Lpz8a5cI37rRdHq6Exv2M=;
        fh=rp4SvMZyvufgLOIbJsYRQQ45Pxd1jVTSEU6q8ruBOWo=;
        b=ByPQlz96BiFsG8ColTdpcvD4u82Lrg4KGMbFaoS4V05a26I/geIyYxJY9l9+D2c21m
         sqSJX7m9c8xl+6S3+AK5WHo2DnsrXf8vSkhEugXQouW0sXoeVzsePqT/2TWuDX/8Czar
         MWrg02Dw9upgJlPz4ZV5ZBhZfH6xHZWQShFbf3dCzo8xpwtOTVY7icaME6kJlf6FB+bW
         4N4JZhhbwhYTHd6CjUhUd/QCPLmvvOOmZLxnuuJKYRWF3XcacCFLlhjLvFY6gJTYst8v
         dS88WjxXx227qmnzTrn3sJHzAIoFQtzXshlI8VoLx4a3K3E6mApjsaIsWfCF7K3L93HY
         FHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whmmY5LM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020adfe88d000000b003179d287ce0si3062249wrm.415.2023.10.19.11.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 11:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=whmmY5LM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtXmG-0001wp-C0; Thu, 19 Oct 2023 14:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm5-0001GQ-0Y
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 14:29:38 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm2-00071D-Qq
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 14:29:36 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6c7b3adbeb6so18347a34.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697740173; x=1698344973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTHub7s42k1B/V2tyKlIn0Lpz8a5cI37rRdHq6Exv2M=;
 b=whmmY5LMn3znDQrLLT4JrGHCHWWXKY/5JTNFQoljg8rPaIavLxE5i0YIM5Nh7f9Lq3
 KtSv0V6MNbwsFiqULRLI8JoDsYFQesnFvaKaZd213xvUlgK967rUMTIXLT15m2XmZPvy
 CzyIQXgYc3fVW9OSD/O83eBQc64FmL9MM+cQK3Qz7oUfUTChyc3IoCx16B63kKN/oBUC
 z52IMwhaFe9UEQVBn9/UM6scSCa7ixeamElNPlut+TPLCUp/MN7y9HE7BK2iUBQIvx7C
 g/29LntXw4hSSJUxteucjOCTS6gNNyYpPn918Ravn+BdkG9DnUH54FOqGA7CJeHZy7Fg
 +2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697740173; x=1698344973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTHub7s42k1B/V2tyKlIn0Lpz8a5cI37rRdHq6Exv2M=;
 b=cP21zVhsAqng2E/NxfBc68N81wUdTsNQGHdUvOUWGVe3eyDA53+Y9A/gvfnVEP/eFR
 7PdbPZh4NlGUMgWDltzx7Ag1VZ5zn3P53fJlgFMUpGq63PPT2fiuASJkAKWFhTqwD913
 A/LRA58ASiAQ7/enkV2vuzxpkKkMxTLZFP4eiZJ1S0RaV7bhjkaJRVs+qONZ1p324HY5
 D++iNqHqCEO2i6T/anU/HTztoiftvTBQfWF/6TWZtinBvxSLCFXqSS+geQ6QmZCtE88C
 Kor7JOyXOdBL/3sOQZDQ7OxWq8h4xcF3RQAwsNkXjiRwv0U5n4/TkzlMcgVvIQVu55sa
 r5hw==
X-Gm-Message-State: AOJu0YzhqS71u8Ob+chKjifb6amlWhLIW67lNVJrURBuw3w/D5td7jvl
 eKM2yHsiqqbD0MfqvjdkVhgiG7+0TSqZI20xa2w=
X-Received: by 2002:a05:6870:82a2:b0:1ba:8307:9a13 with SMTP id
 q34-20020a05687082a200b001ba83079a13mr3479888oae.11.1697740173583; 
 Thu, 19 Oct 2023 11:29:33 -0700 (PDT)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 e1-20020a630f01000000b005b856fab5e9sm72216pgl.18.2023.10.19.11.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 11:29:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
Subject: [PATCH 6/7] target/tricore: Use tcg_gen_*extract_tl
Date: Thu, 19 Oct 2023 11:29:20 -0700
Message-Id: <20231019182921.1772928-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019182921.1772928-1-richard.henderson@linaro.org>
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HAR2Oz/uN00z

The EXTR instructions can use the extract opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index dd812ec0f0..66553d1be0 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6542,28 +6542,16 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
     switch (op2) {
     case OPC2_32_RRPW_EXTR:
         if (width == 0) {
-                tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
-                break;
-        }
-
-        if (pos + width <= 32) {
-            /* optimize special cases */
-            if ((pos == 0) && (width == 8)) {
-                tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
-            } else if ((pos == 0) && (width == 16)) {
-                tcg_gen_ext16s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
-            } else {
-                tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], 32 - pos - width);
-                tcg_gen_sari_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], 32 - width);
-            }
+            tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
+        } else if (pos + width <= 32) {
+            tcg_gen_sextract_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos, width);
         }
         break;
     case OPC2_32_RRPW_EXTR_U:
         if (width == 0) {
             tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
         } else {
-            tcg_gen_shri_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos);
-            tcg_gen_andi_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], ~0u >> (32-width));
+            tcg_gen_extract_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], pos, width);
         }
         break;
     case OPC2_32_RRPW_IMASK:
-- 
2.34.1

