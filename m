Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2515417lfi;
        Thu, 26 Mar 2020 16:23:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu0uoEizys4GACRxon/bfNVM7gJPCIVCSKHrC+GF7H0oof5HPpUU5Xeawoy6PgrUc2B0Zx5
X-Received: by 2002:a37:7987:: with SMTP id u129mr11237026qkc.312.1585265037786;
        Thu, 26 Mar 2020 16:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585265037; cv=none;
        d=google.com; s=arc-20160816;
        b=ukszBTHHH2pZocP3Y4i8Y3kdFwoQJRGKPmbHekaxV+otdwebDdyRoag0n+pDC23TYp
         Kr35lwe75XzAEs0poTtsGvZOm0TlgeE4okNcHqfPsFi1Xb/9FML7JjiMidmrRjMgJMyk
         cXFhtYlXiGsmDoF/2MkFaehfrzpl/q+69BpiC6sKMXASUseowibN932/8W0YIOADVZAn
         IVjl9D9Nwzcop7Y02NSZ1e40pgrQbqCsdjrwtLBEH7tFguEeOQ7ZWcy/qft5jYNAb23q
         XglOoBdfEdhPQCpzAlCr/gkkmyLoU3+E7paiLdphXlcBOwnAGkIjfCGzNvJ8yD5k+JS5
         MvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y9AW+fkUrXuwDSItggnbypCfN/Kt8Ehf1WvwBsOiyX4=;
        b=RLk1uwcde8ntc9n9ihiErfrvl/im/pXj8VY4gcbvz/kD1qUuXFOUXmsXrxK+0XDtH+
         8k551A6Bzbs1TSYSDVv3qdRspTEHNuCoIByMojiF5VvVB6TNwOPVRlm/tiheRx1K4awg
         ojx0+1+QXTZG9LDxUqYR4gs995FKL7lovH90Gscuv/ACgXUilbls08EBsXDoU0JLl3HF
         1TxBzUBTfJddbS/3McCAX00Y1u6qr6E8Fha5DrIE+GbAVGNOkc6PY/zjY48SLophIhAY
         vTAllcGXWSxtl+vqbudlsbLI1BrYPE8HL2iuaRoX/8PiU3UQ44eytwMlU8fa5OZsswLL
         MqNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khvwLdZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l76si2424829qke.270.2020.03.26.16.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=khvwLdZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbqv-0001Fk-5X
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcm-0003Cy-KK
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcl-000255-E2
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcl-00023y-7c
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id a32so3652632pga.4
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9AW+fkUrXuwDSItggnbypCfN/Kt8Ehf1WvwBsOiyX4=;
 b=khvwLdZab3bGspZGQIaKRdwlLVP1QxMoQh23OPqJ9bvQ0EaDbAH8hdQF9ns2qOh9+Y
 5xDTzqwa9KB5x2bpqlMI0WYts9IWOfgKn/M6T/EvrVYh39mDqEO9DGodcUjyjqATD5L1
 Z+adzhVsC1oe7IEciDLGylE+8OEhrgV9KIZOR1L0fKSTzVzkVnssBVTi7mF2oGOmFIIX
 wDhMMPndHWwPVxMkGspGsevtspvHPhqsxvjLmcRi+vYJ+uvl5K8evme7HZ7Iaq+hH6IO
 gf2YUtR2yWM6ZPiYulrCzlEoBrtEqUj1W/tZSKgKai/Bo2yVtjyKY67CpngbpsbA6YcV
 P/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9AW+fkUrXuwDSItggnbypCfN/Kt8Ehf1WvwBsOiyX4=;
 b=DqwT8CBgM2eP5V+XNyQxSKIzzh5PaIXZPs/qCSqCYMaDYKRKD9KToVDMjIieg2Vpgc
 8oQBMyJWL1MVyYwuT4IjtURqJj1zAYlZoHSU3ZFQ72EEGHu8AYZ6clVBqucuki21KvU2
 gsHyB/8ts2rs+pmlXDdJnl+7cP3G/WTH5wxflM+1ybspGAK/KS6dLh8cDq4SKnFw+PRN
 kdfDewFhxmi/QpJv/MX14tQm06AZKy9QPFVkuhmbxWRuYlfujOT+47YqE0kyJfQM5F3O
 ufTaCfT05SlYWHZa1kR0Sv3eIT5CrA5vdh4ZFEPW9ACWRiQzSpHJSbD0s1olRK0q1G+x
 pjXg==
X-Gm-Message-State: ANhLgQ3Q8p6Py7T7xpdu95oopprGW0dxepECCP6cJZrcIHoVNpkXDKnJ
 dXexOZPfSP+r/HUxNmUE56NAUQ==
X-Received: by 2002:a62:7a82:: with SMTP id v124mr10983254pfc.10.1585264158220; 
 Thu, 26 Mar 2020 16:09:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/31] target/arm: Implement SVE2 integer absolute difference
 and accumulate
Date: Thu, 26 Mar 2020 16:08:38 -0700
Message-Id: <20200326230838.31112-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 63gORA4dOsqJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9bf66e8ad4..6d565912e3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7556cecfb3..42ef031b77 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6361,3 +6361,28 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, arm_gen_gvec_sli);
 }
+
+static bool do_sve2_fn3(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        unsigned rm_ofs = vec_full_reg_offset(s, a->rm);
+        fn(a->esz, rd_ofs, rn_ofs, rm_ofs, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn3(s, a, arm_gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn3(s, a, arm_gen_gvec_uaba);
+}
-- 
2.20.1

