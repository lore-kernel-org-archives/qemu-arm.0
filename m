Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2517662lfi;
        Thu, 26 Mar 2020 16:26:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtY81/EJEsFfYUtK4Mutxb5aCwgJFTCOHDLCjUX0THZiY6e0SvBHLZz2xo5Yj/QwZq1TRip
X-Received: by 2002:a37:9d89:: with SMTP id g131mr2921350qke.166.1585265196704;
        Thu, 26 Mar 2020 16:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585265196; cv=none;
        d=google.com; s=arc-20160816;
        b=ITimbxP/l/FL4gTRI1jrdbZeixnzly/npZgoPKtOrt/qXzxWkEBQDOn0COqVAVC/bX
         6U0+LqxNr45ZhixSXIPY8HBtLWKnNyEQqNkwAKKfkEXFy1UjZJtRoet7NwUFzmhOSzfR
         N6Bf02jYP6OaASzuSPhcvVrd+bkvRlvqClhMLpq7I5daST8kh167XTEtPqoPm2nh4les
         WWw1xgY3TiuRZOQYuVBR+79Olvm7+JD67rhAxCYe7mXlxSAsAjcMqj5BM5KPrZb8QUEL
         pYRqOokWb6vRhXLSYRIFE8GnFq0yb3lRK9JGZZI9z+Gk70nGrO67hVtxqMny8HbETF1+
         iu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OdjaC+2trQ9ceTWGUWGj5oLcK8x+CzwmCibMzIBPms4=;
        b=jOd9TRDrJKcFRlpUh4yI7UNl6LYRXJlrlv2FEh36MwJyrW4O53vC2JYuRwD4kuDkew
         5z1A8nWtwsBv9iI/j8eneSRMrmm5vGfkGHWf99M5oL7VTqePmiUwbU2XNTDt15DxPZAf
         rkAWzpwDZNknIPN5vkqFMccc8vjo+CAbOlf8/60U5KpeeJhWqdUZ8ucl3Av1vjIWbEXD
         8etfKTLvAxKc/fzp7C4PCDonJ/6IphzEwd7fxoyOMO2CqY7t5kI6O2bWwBdZlm6eTdEe
         UVxSSwctCTz1XnRlx9vIiNw8yGJbuUzNVVEWiH0op7DSYHjlszseF9sWMrlXrt+0wEMS
         t9Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aD2zgnrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si2538182qvl.171.2020.03.26.16.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aD2zgnrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbtU-00044a-3p
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcf-0002xc-TU
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbce-0001tV-Oo
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:13 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbce-0001sI-Iu
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:12 -0400
Received: by mail-pg1-x541.google.com with SMTP id 142so3639946pgf.11
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 16:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OdjaC+2trQ9ceTWGUWGj5oLcK8x+CzwmCibMzIBPms4=;
 b=aD2zgnrzX/IkgZWK1ZnF0cSKeiEAY8SMYX1u7WTSWJknIg6OOX4PVlZUgaR9pG6qy0
 ZyNsuIILpcGidy1iqB9znjowkFRlTsfrtbdhGh89GR3i6GYamkAbiwTcpzkLXE6xgjH6
 rqZXAq1FtARKFrJJCEnb7fJj667c3OWzmk1DpklnL5hbGvD2UitAmC6dMKTtDO5v0WKQ
 dauE7kIRDOJbpqXICicQuE4vJq8D3Io5DA1LGYWP2H6f8fIDtXbSot69QxJ7+Bdap39S
 z4+qhQj92FpCiV+YtMEILq/0xLm7s2omjTpRDQwGNn+7B4sxmzkMbPUJPtcUaPAdac+v
 wWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OdjaC+2trQ9ceTWGUWGj5oLcK8x+CzwmCibMzIBPms4=;
 b=dR5DzU2qZj/RTIcNyknibI4jP7ZP5tWxrzfelz6P4dkPv5R83TMw9+IhKT4pMom9Rg
 6WljhppKIMDZozQnEvDqrivhK/Riu2NOqMfJ/G9XwGrOEMgODdE/c65V48Dvx9Pj0GyT
 XqT831VjLbE7W+X56p/qWh980iZmF7gd4F+jS46VbgajRgOjaevSyPS8Obqz+Oj3Lfi3
 bHvVQruTC6U4KG42OIRIvmbnBUm92jf5sVTZB0IJ2reBjvReYhZaopfRaRjdhhVQfKBx
 sNp4Z3o96CVXOhJwrHjsvVG5g+C0MF2v3ywxA0a4zMIEOj5O2WBqykcpAmOj63J6CvQL
 FTbQ==
X-Gm-Message-State: ANhLgQ10YtX0jYjE2PfBa8nuM5JEbbxghdcohPjNuir0qj2l9fKsGuu0
 1/4YpEu8xGEfi7OOiNlDN8DPnLPWD8M=
X-Received: by 2002:a63:2cc3:: with SMTP id s186mr10720238pgs.71.1585264151297; 
 Thu, 26 Mar 2020 16:09:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/31] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Thu, 26 Mar 2020 16:08:32 -0700
Message-Id: <20200326230838.31112-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /G21Pgd7+vOJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5d46e3ab45..756f939df1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a80765a978..1d1f55dfdd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6317,3 +6317,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_ursra);
+}
-- 
2.20.1

