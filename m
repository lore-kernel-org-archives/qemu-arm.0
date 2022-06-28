Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2888224lft;
        Mon, 27 Jun 2022 21:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sreOgudHNVeqvtsv7X6tstCZDS5TftJ/lOMurzUEgNzcrSk99sI72k2DBwxph4NqBTeh+0
X-Received: by 2002:a37:aec1:0:b0:6af:2f56:1ab5 with SMTP id x184-20020a37aec1000000b006af2f561ab5mr4673138qke.173.1656390833641;
        Mon, 27 Jun 2022 21:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390833; cv=none;
        d=google.com; s=arc-20160816;
        b=y8ueNB3OSIZEuejhKdGXq7kHEP8iB0Wuk4NkjeIJAj29tj5WoUoIcbpCyFilfLLGFv
         sCbbtcpJbjo32pOkRIJsa11ohnrRla+iRHMRmUFWt9vyre7Q69qOU/0d0w4EoiKTFFAr
         bbKRTupilMlYo7SUSXXN3MBJbBsH3GJq3VlixgvdCstR0841gzPLnFyXiEhvPzwV0iYg
         rv1fSVYSJunp+A98qAfMmjtDt61NWCcz0NkaQUGRA9ScObLW+N6HmvYSaI6YigJtce+x
         +3Te3aa1RF21PA362+M/NZEOSlQj4zY8EF9G48gTZiNLo4bl8TleUkDCsh04smJYTAKZ
         WuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pNURgSuocVgs5B8bRGEZVrFEdfi62ntOnXeVG2Z7Cdk=;
        b=NGeveU75QBAGEdL94l49x3xmQuLrz9CWLZoxHSXRV29ahdOeVf7Gy6AJ7BcUf2BoFO
         dmwYDTXXWWtl6o9fMvhuvaozrru/a8z4Apaa5xZ2DLS+iHj0IsJkb0LXlI/71TbtNEUy
         7mUCq9w5GqaxVK95pbsGMP+RJKEz/88x/jqvBJE9pFPv4HF+S9P4XFg+cNNRT3v0rFKE
         28WpeV8DxNZGTfpzurZdnIhxBRqzvTWmJjLN6+mcB0g9/nL0bGy+CY7TUffAgU3Ync/7
         XgBU+l+iEBtLeja+nqKA1rXt7GqKduH4k7+czxp8EgP6RT/kyeTixkMLK78m1/nieNrw
         LGRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tc357iJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020ad45bea000000b004718d9a6e86si2257779qvc.337.2022.06.27.21.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tc357iJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62vB-0003Bp-3L
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jo-0001z0-Ua
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:08 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jj-0003e2-08
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:05 -0400
Received: by mail-pf1-x42f.google.com with SMTP id k9so1670213pfg.5
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pNURgSuocVgs5B8bRGEZVrFEdfi62ntOnXeVG2Z7Cdk=;
 b=Tc357iJ/cSiAv52LDxS0geb4wr/RZzdp9+4I08ZdlmoofyjUaVhLbL0o5BrbDZv9ck
 otRBUmzCGu93vQk4a1QVTWub/O85vMSKbpoMmk4MwBZ+LGKMHqgY5AVZVNia73uGH6df
 0kvaFu+k4mx+kvapou72Z/zq6sqizGjC/E3FAsbkXwjLfoQPhvwVGb2zSjh3UX8wqwGo
 pxs1YPxy4+y/LDTWyMN/GoJuBAwNM3fsL504sjP2jrnRT/HCYgWYMYNs5i21LMMac/Oy
 s+8GJW5bbsuVcPXonMvSxOGGe1Q27DwBXepzcl1/N4VMGH/m0L7b5U57OIfU6AuonfVU
 jfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pNURgSuocVgs5B8bRGEZVrFEdfi62ntOnXeVG2Z7Cdk=;
 b=CN4VV6abGvloOqoGKE3tWNYTWZii2jD2nP6MsNcXiyjulcw9+aPdV3GRSF8poQQN48
 2+HeffhNk+0KjclpU+0FgTllJBzdARFMCpyyxFImG9f+g9wseWYQVrbH6h4wTvrmE0/Z
 dd8wVek7GFwtM1Axltutb4LRkbZ61rhfN9z2hwmEh+5Lcu9t324nI63mq1BlE0b2dD+T
 8WoYOp9wS7+dzAAQsxfmL2jas3vPT2q98Ysy8X4ug3L2bo9pc58bOcjd1w4K/PZxGXaH
 rywhjLImjDrAOaL5KKW2UgNapG4PUFsPJER1bpcHrAq11Kgx93gCkBAyVcxekZnJChtt
 b5pA==
X-Gm-Message-State: AJIora/INt+uFxCDWD00DlZO0BTSG5CihF8GCaLMm06S5OFRypvMsTrc
 fr8GlGtIWvz6yB4Ke6bDMT6H7N9nvfTiLA==
X-Received: by 2002:a05:6a00:1a15:b0:527:d02b:29c6 with SMTP id
 g21-20020a056a001a1500b00527d02b29c6mr6067pfv.23.1656390121959; 
 Mon, 27 Jun 2022 21:22:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 17/45] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Date: Tue, 28 Jun 2022 09:50:49 +0530
Message-Id: <20220628042117.368549-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VXfzrBQVZCev

These SME instructions are nominally within the SVE decode space,
so we add them to sve.decode and translate-sve.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add streaming_{vec,pred}_reg_size.
---
 target/arm/translate-a64.h | 12 ++++++++++++
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 02fb95e019..099d3d11d6 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -128,6 +128,12 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/* Return the byte size of the vector register, SVL / 8. */
+static inline int streaming_vec_reg_size(DisasContext *s)
+{
+    return s->svl;
+}
+
 /*
  * Return the offset info CPUARMState of the predicate vector register Pn.
  * Note for this purpose, FFR is P16.
@@ -143,6 +149,12 @@ static inline int pred_full_reg_size(DisasContext *s)
     return s->vl >> 3;
 }
 
+/* Return the byte size of the predicate register, SVL / 64.  */
+static inline int streaming_pred_reg_size(DisasContext *s)
+{
+    return s->svl >> 3;
+}
+
 /*
  * Round up the size of a register to a size allowed by
  * the tcg vector infrastructure.  Any operation which uses this
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 908643d7d9..95af08c139 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -449,14 +449,17 @@ INDEX_ri        00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr        00000100 .. 1 ..... 010011 ..... .....          @rd_rn_rm
 
-### SVE Stack Allocation Group
+### SVE / Streaming SVE Stack Allocation Group
 
 # SVE stack frame adjustment
 ADDVL           00000100 001 ..... 01010 ...... .....           @rd_rn_i6
+ADDSVL          00000100 001 ..... 01011 ...... .....           @rd_rn_i6
 ADDPL           00000100 011 ..... 01010 ...... .....           @rd_rn_i6
+ADDSPL          00000100 011 ..... 01011 ...... .....           @rd_rn_i6
 
 # SVE stack frame size
 RDVL            00000100 101 11111 01010 imm:s6 rd:5
+RDSVL           00000100 101 11111 01011 imm:s6 rd:5
 
 ### SVE Bitwise Shift - Unpredicated Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e5e9e1e0ca..9e304f78bc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1286,6 +1286,19 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
     return true;
 }
 
+static bool trans_ADDSVL(DisasContext *s, arg_ADDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * streaming_vec_reg_size(s));
+    }
+    return true;
+}
+
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1299,6 +1312,19 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
     return true;
 }
 
+static bool trans_ADDSPL(DisasContext *s, arg_ADDSPL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * streaming_pred_reg_size(s));
+    }
+    return true;
+}
+
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1311,6 +1337,18 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
     return true;
 }
 
+static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        tcg_gen_movi_i64(reg, a->imm * streaming_vec_reg_size(s));
+    }
+    return true;
+}
+
 /*
  *** SVE Compute Vector Address Group
  */
-- 
2.34.1

