Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1280205lfm;
        Wed, 17 Jun 2020 22:02:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsm948uUW6HZmS44qeBDPOGRl578TgPYEInJFTHLc8HhB0Ex9yjdx16Nm9B10TPG2+HyYa
X-Received: by 2002:a25:686:: with SMTP id 128mr3770018ybg.284.1592456554930;
        Wed, 17 Jun 2020 22:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456554; cv=none;
        d=google.com; s=arc-20160816;
        b=KLjoger9Y5GY7nnfgOoXzsSFeZ0sqVCcM4o3UrsIfy96MvZk8QHoBEpvcOkOOj1+gu
         S43euQS5svifNEwIak72Z9682xTwF+mSfyYOfwn65KxZzxUjkHZcCz0o4Hfe6dCq6nCI
         /ncqYe2O8aIB7PgSXNaEZe/T4GAsJL7770av8f6/GWOkhPux/W7/EaG6KJzcdxvvUSIf
         +9MmLGiSY2d2wwyNYKKKha+y4SJk40pXGX6/BqC0Pszuypjsh/YKBr/ZyIbN3fRa+00E
         tW2uPb1cd04FeVbI+sJJvcTMyW0oioJOlOuma9v8vpPBFDnb3h52ySmNap5CW92WNQ1r
         o5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aL3JmGTn7BB0ZGVDuD2d3mmxx3NlQruQfPzWzn6p43Q=;
        b=sOxRo4sSUkleyHVNBpjPvZqnaVy6KrGnO5Y4N+zyFcEjytUz4LA7w9x0jtyiIdLVSl
         HrtDCgRgeNMBn/87w4BwU7LNOqoI4PID43iEMzP+b5SlQusvePXMD8xjZmKzL9Pocj/Z
         TSyNbtxCBn25JobUWleLE1LFXBmtE3kOR8aVoAxBTGWiVjltgpTwuzp5BGjwZ1wemto/
         7+60Ci16slRDeMSQbQJn39WtvwDKAS5xCYVzhG2L5ehZBuPv/t2iVYgpuV2rEaJO4XJ2
         ENhnKnlLznyCNUJFqY6Pe1j8/ZZXHrR+o37S3hHjjCayvchQIuChOliqBMXvClT/vuTb
         AABw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHD6YF+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si1616057ybm.156.2020.06.17.22.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHD6YF+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmh8-0008TH-5G
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCt-0003IK-Ei
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCq-0003Jx-U1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id u8so1959852pje.4
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aL3JmGTn7BB0ZGVDuD2d3mmxx3NlQruQfPzWzn6p43Q=;
 b=JHD6YF+WXSCLISzBczbonXfyKQNB+e/96xxwaTPQqqLqi/T8aSXR9EEOVT4EzoRK+K
 CuCZFnoSaFfqktvVdcaziWtLFeAATn2XFZKkSYjhn1EqRdq6prvjTHaf9zerbDsmFcTG
 /M94eqrlEpOaWTIa26mtyT6SVYdcdRG3arxW3I8N9Fah5+IOaNAwWCbmGEViurvsx8WA
 kQEHEJUDgaOFW0jmpQFkwfEP6SsNF6FzlEyQ6stk+24hCo7XZXuADH5KhikjDQvLKzt6
 1UOCpfRedxTrF0i7GImW412JKYacY/4WOe8Yt6zZJ6fem2SqcS7UdD8XZYiYm6kuzb+J
 eQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aL3JmGTn7BB0ZGVDuD2d3mmxx3NlQruQfPzWzn6p43Q=;
 b=WwCV+xwovW+n7RIV7x8rHr+qGuNTeFNWyvXgtNp1iZnv7LAThLKN6I6mHMKTbEzg4g
 Z1Tj9UuGoCh/GNfLRzSsGMjMy1bTCO/WUv0epN4SfYtXO3sEB6ZPuC1CqnQH19C2CxYA
 1pJIq2rNreTiuRWjDstQijofnSsoWkCcRwIJpiSFoesOQ2Re+pur/KpVKQhEi0t6X5uP
 xN7WMtxF8ju+K7IhDsoDxOQNFtdHqNHxxj8UvdY5PORYc0nISXcdliLYyZ5BcLSkJe1k
 AYT00Z/4OQ6q6/FJ0n7fh5aBMhmbos2gqSbRiiF7rX0jNoQYA5j3vAJDQhLMYmwXvpzq
 +h6Q==
X-Gm-Message-State: AOAM533fMlkQC1m38RjOKaGPLazbGCTOo0VN4EHht7iABcVdVGl6wR0A
 vU/5jmHDP0lXgQfzh2QTe758rdv0js8=
X-Received: by 2002:a17:902:eb14:: with SMTP id
 l20mr2214389plb.189.1592454675656; 
 Wed, 17 Jun 2020 21:31:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 063/100] target/arm: Implement SVE2 SPLICE, EXT
Date: Wed, 17 Jun 2020 21:26:07 -0700
Message-Id: <20200618042644.1685561-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPS9zVE2+ukn

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200423180347.9403-1-steplong@quicinc.com>
[rth: Rename the trans_* functions to *_sve2.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++--
 target/arm/translate-sve.c | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 11e724d3a2..0688dae450 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -494,10 +494,14 @@ CPY_z_i         00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 
 ### SVE Permute - Extract Group
 
-# SVE extract vector (immediate offset)
+# SVE extract vector (destructive)
 EXT             00000101 001 ..... 000 ... rm:5 rd:5 \
                 &rrri rn=%reg_movprfx imm=%imm8_16_10
 
+# SVE2 extract vector (constructive)
+EXT_sve2        00000101 011 ..... 000 ... rn:5 rd:5 \
+                &rri imm=%imm8_16_10
+
 ### SVE Permute - Unpredicated Group
 
 # SVE broadcast general register
@@ -588,9 +592,12 @@ REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 
-# SVE vector splice (predicated)
+# SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 
+# SVE2 vector splice (predicated, constructive)
+SPLICE_sve2     00000101 .. 101 101 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Select Vectors Group
 
 # SVE select vector elements (predicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0fa04afcaf..45ee91d3fe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2266,18 +2266,18 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
  *** SVE Permute Extract Group
  */
 
-static bool trans_EXT(DisasContext *s, arg_EXT *a)
+static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
 {
     if (!sve_access_check(s)) {
         return true;
     }
 
     unsigned vsz = vec_full_reg_size(s);
-    unsigned n_ofs = a->imm >= vsz ? 0 : a->imm;
+    unsigned n_ofs = imm >= vsz ? 0 : imm;
     unsigned n_siz = vsz - n_ofs;
-    unsigned d = vec_full_reg_offset(s, a->rd);
-    unsigned n = vec_full_reg_offset(s, a->rn);
-    unsigned m = vec_full_reg_offset(s, a->rm);
+    unsigned d = vec_full_reg_offset(s, rd);
+    unsigned n = vec_full_reg_offset(s, rn);
+    unsigned m = vec_full_reg_offset(s, rm);
 
     /* Use host vector move insns if we have appropriate sizes
      * and no unfortunate overlap.
@@ -2296,6 +2296,19 @@ static bool trans_EXT(DisasContext *s, arg_EXT *a)
     return true;
 }
 
+static bool trans_EXT(DisasContext *s, arg_EXT *a)
+{
+    return do_EXT(s, a->rd, a->rn, a->rm, a->imm);
+}
+
+static bool trans_EXT_sve2(DisasContext *s, arg_rri *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_EXT(s, a->rd, a->rn, (a->rn + 1) % 32, a->imm);
+}
+
 /*
  *** SVE Permute - Unpredicated Group
  */
@@ -3023,6 +3036,18 @@ static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
     return true;
 }
 
+static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, 0);
+    }
+    return true;
+}
+
 /*
  *** SVE Integer Compare - Vectors Group
  */
-- 
2.25.1

