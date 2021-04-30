Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp499872lfg;
        Fri, 30 Apr 2021 14:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMz8smymOvzeVF9WXJQ+8Bum2rbZbhNEkHIT5A9mTsKRs6tTTWNhNCy1XqLo9y2RByy/ms
X-Received: by 2002:a02:ca45:: with SMTP id i5mr6704319jal.118.1619817196102;
        Fri, 30 Apr 2021 14:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817196; cv=none;
        d=google.com; s=arc-20160816;
        b=wC+tqH5WUuSzLl5pXMY8pzbVqKQO8fmRqX+Vsi5xx33ElU5AXWZa5I+OzIeH4LfhPE
         hv2Jw170zjCPeA41vSvglErnowrTAigcj7NLnM5mzghokWFcecA71J/1iEW+eeqYFmV7
         wmZ/Po/GEI2NshO2zzsEgLQDlTjPOhMzdiRgtdlUI9vqTj22xPQ/z9YaiZ4OtzNQI8H7
         +d3N782l3AVkfLBjmgXBMROn7B/GoPsipz6SC5Srlx+N4+3KUpTK4GCwr17DdlqTa5qr
         6HM6NieueP5ljX9NKhV9zgK7wyzMuowvtFLzjMi2GItVOru53m2RY87apNaxFZ440Qiw
         aiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=biS3JWPtxwuQ9jQo1R+HoActsqUh9fYZHGmqJRkFZnM=;
        b=ni3UwVcvKkavmaHFvVAST3YjNOj3Ao+IkZfgLDSFjelVtENhSxzqdUZzt+ewBMrJw+
         PVezbfuu0fkEG7PSOLSe9gcmKPXA1K7B3HecLJspWpLoXPhGSV9K71/je1UO04M6A58B
         V25KZrazxDXar2kezMZBTBG5QVnYnRlzX+515IEiizxOsDHt+luS0QE8OrHzz4hxXkPy
         x/Lad5juUhDrNZUDq1+6QdcusMeaqpqE7PLx1yFQj2Y1L7EcH4KhOAcAzbiTTsTFufcw
         aNJtFDok6sgNWx7Z1LLZs3aJgCf88JsyRK1n78qu1UnE5+eJ0d2qTYu4WloaoEFJ288o
         vUcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNVF2WGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si3548885ilh.102.2021.04.30.14.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNVF2WGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaRn-0006hG-Bz
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZm0-0004EN-JT
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlk-0007hk-4s
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id s20so21394819plr.13
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=biS3JWPtxwuQ9jQo1R+HoActsqUh9fYZHGmqJRkFZnM=;
 b=FNVF2WGgEyLNxNc0c7TCUOPS6FRGucXIxnyUwCctUxmVhJewwCvMPDNVtyMcWA4diA
 5sLTf/28P5dvmWLykTO5xVnYaO5Md4+ds/bHmDJMAM2w1s5FwGilDymywptJPVCavpan
 5E9QqYvaPRQtLuWdv6UvRMBGEYAVdxp91uDx4hxuIoikh8vqFpbOcqyubYtSBrWHGBv4
 sQ16ZhH2QB6GQPLQ6w/DVy/QvH43QLepIQ/YqnKwuRXSxlg1qDE9GU8fTnUqXoGimRY8
 BRWeHbfAMf18q5NdqbvPN0hFA446n/WkRaZbpYt0Vz30wxv818qBtYRyIh05dk9RMsNl
 /N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=biS3JWPtxwuQ9jQo1R+HoActsqUh9fYZHGmqJRkFZnM=;
 b=SelC7GEU1YMcZSv7WesG+0Km2ApDOFFG0z2B7DUAfoUF50ixJlCO02Xci+giDQO6i1
 hp3Ub8KY2u9i7H4mtv+LhftinWz3S0AK0kJQdrqUtSbt243Dhia5oxXwL6dt86TKimb7
 fdmTAMLuaaIWhJ4TN7Jo3lArNKA7Nvfy/5hNSDlAn/yfQdmvtBtzPxYKQdrfQc2hCpUy
 Kg7n0IolQEMY45gWrxeP6z5RzPwAsIkFQ8iMlDVBaRr9Cjd86976k5HMU9vbsyAAUor8
 b6rg1c7nTxUeubA7afsJafVxgKnFktV/XfP98ozn8jjbsXbYqERKlFD+iWWXDeAQSd9v
 MTMA==
X-Gm-Message-State: AOAM533HoiMvNu1rngMRfOXGbtXUbX+i9Z4AU782FB3HE9a8veHqMTWL
 uRbrcCRF0me88xHWhxdxOKMd9A==
X-Received: by 2002:a17:90a:c903:: with SMTP id
 v3mr16899148pjt.13.1619814580670; 
 Fri, 30 Apr 2021 13:29:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 47/82] target/arm: Implement SVE2 SPLICE, EXT
Date: Fri, 30 Apr 2021 13:25:35 -0700
Message-Id: <20210430202610.1136687-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bj9fasrcg6oD

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
index cb2ee86228..67b6466a1e 100644
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
index 5d455c4db6..3de14e3af9 100644
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
@@ -3013,6 +3026,18 @@ static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
     return true;
 }
 
+static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
+    }
+    return true;
+}
+
 /*
  *** SVE Integer Compare - Vectors Group
  */
-- 
2.25.1

