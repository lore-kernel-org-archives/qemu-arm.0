Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp33271lfc;
        Tue, 2 Jun 2020 18:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdDcxS0BfRFr6gCke0T8MZI8mLOhfb4htdPLL0RyaLl6ETBclVpwZOVtf1MnY8Z6oooisk
X-Received: by 2002:a25:cb45:: with SMTP id b66mr35611667ybg.397.1591147083195;
        Tue, 02 Jun 2020 18:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147083; cv=none;
        d=google.com; s=arc-20160816;
        b=yAvrP9frYKQWyMqkeDtLw6rGrgLVjxPtidzLE8fRKdZH2seYjFDOYWCtyoMiQOKGxf
         PkRPAynPmRboT5nxtE3Lf6As1kMELeiy2m+UinwutF0t/4LGyFRzp1nKlnu2uhkEFcY6
         So+nr/l89+wSbB9lkIlTYF66yRTVhBAcyXhII/+/N0IWsBw0wDQUElpN1HNY1OWKYxKQ
         vB2mYogZU3MQJOewu57GoEqmIzE/5ljaP92+F3kltDkJN0OVM6g8DMD915y/8oZlWc7J
         OkpW+SOX6iJ4x/enYL48ath46d5gh7yo6BAse2ht8NjtF/yC//qztpflX2DvkaDyeCXu
         sP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lQUCdDSymie/7dQ1iavooQ03Mfu1YJhrKa9eVrF8VLk=;
        b=EKv211z0WIp3l6hPu/pFg+BLYnYak2nFh5uwjYzBU8Cs6syDOJuebr10Y8rJxsYTNo
         WJLU+423+2WQR7gyi7Gqm/jVUZWXiB4MA5FyfiAqrtNBB8luDmBRdfAciJh/VippbRPD
         ml5AKTHpVDXOmU1jOc/IoO1G4AEfLby4dJvUcXPwzbONyHoDuO9RVObFm+TagR+YYNsS
         tJH54cBLcLBF6ukzRF6qRmgSaZpSUi4W/i8RJd2L9EFVFXKFfSlbApXx6iCUGPn27ETt
         iRoI9HyHP2AFSBcuF46P9IY4U/1tUyE0tAx+PN44xHmwitO/qikYY6Ur6cBDVDl53066
         Sl4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U/q0uTVo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si308406ybr.497.2020.06.02.18.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U/q0uTVo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI2c-0003MG-Gk
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyT-0003yE-As
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:45 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyP-0003Zg-CM
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:44 -0400
Received: by mail-pg1-x542.google.com with SMTP id n23so522202pgb.12
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQUCdDSymie/7dQ1iavooQ03Mfu1YJhrKa9eVrF8VLk=;
 b=U/q0uTVoFwQhjnL9XwKPSwInTYw7BqC/t+ZGwi4JRUW/sPbFLP5A5TDNoSz6MTkBvb
 sgs0BUjzNzoB8LmB8YKm/6ZQJs/NGKZ+1R5pGrovVN+iMAKzyjFLFGDQaDlqEYiFZGj/
 ib41y5livE10QOUJLkkGuFlUPOscTndPf6Povg7tGl03wj5imEdYaYEDAjwoa8/Qgs+c
 ywnz91TtgvzVIDXjPaILVMYrIIfqIM66v3ycbganuzBIm/m2X3X7awbcqMbLf+Ltn8Kp
 +6sFQz0G9xLrXbRou2x9BeEVGzd7+JK5o5und6fnd6pYbBljpg89+5FDDYmZDebydoQw
 iRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQUCdDSymie/7dQ1iavooQ03Mfu1YJhrKa9eVrF8VLk=;
 b=Ziiu95h4MZpxI7mXTN5eO7tj7u9IiWwVRAx/4xquJKprIx707RNRfNitVd7XO4r/H4
 7OM1wUNS1sFT18KrWl1CopIxvVhhFsJYLxAeX4s1FXEu+5k5Y4vPsVxvgTRqTfndWZYb
 x3mw7koNpr3EmfC4/K9HoyA5AwfMxWRlO6hm+dUjQ3KzxBULXKE8sbZJf/pSFsVuWo0C
 ouB7vfE0G6bvsiqJtmpE2/P3/u630ansG/eYyenvEnWSc6EsGYLnI0giCLGJxec6SmbV
 VlSz99YdpXU6fWbxF7izIvkbN/1/0XQG7x7FtXsjojiz2FZWqugQSh4QzVHT7l1gAoli
 QcYg==
X-Gm-Message-State: AOAM533mWQHgCkJvjPnYKoQhmDd436gwlfFQGhC+O/pXTIwrbFfqs9fj
 KsNX7XvEYE3eZjS2PAQWCwIwzw==
X-Received: by 2002:a63:348:: with SMTP id 69mr25417768pgd.68.1591146819477;
 Tue, 02 Jun 2020 18:13:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/42] target/arm: Implement the STGP instruction
Date: Tue,  2 Jun 2020 18:12:51 -0700
Message-Id: <20200603011317.473934-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ehoqcqsqjN6U

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Handle atomicity, require pre-cleaned address.
v6: Fix constant offset shift, non-checked address, use pre-computed ata.
---
 target/arm/translate-a64.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0725c2ca07..2fc070ab90 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2681,7 +2681,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2706,6 +2706,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2718,6 +2719,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2758,7 +2767,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         return;
     }
 
-    offset <<= size;
+    offset <<= (set_tag ? LOG2_TAG_GRANULE : size);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -2768,8 +2777,22 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
 
+    if (set_tag) {
+        if (!s->ata) {
+             /*
+              * TODO: We could rely on the stores below, at least for
+              * system mode, if we arrange to add MO_ALIGN_16.
+              */
+            gen_helper_stg_stub(cpu_env, dirty_addr);
+        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
+        } else {
+            gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
+        }
+    }
+
+    clean_addr = clean_data_tbi(s, dirty_addr);
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
-- 
2.25.1

