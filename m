Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp487753lff;
        Thu, 17 Jun 2021 05:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQKgcpXJ4Ln3tk/obg7dmqusq4INBZPIPJeNJFo8ITAQDPnX6pM/E2ybNnaIW9ESlbk6Sn
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr4892070wmi.2.1623932680082;
        Thu, 17 Jun 2021 05:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932680; cv=none;
        d=google.com; s=arc-20160816;
        b=XDyGpUzXBQX6k5gdTR7PQ+TX3i1wa1C9x9GpWxlW78GnHLfPGXJ/bPuAFGPVKZw4sM
         +CIaKaQxWE7LG8wwxf1Rd048ZXn1XRSPayh/thX3HJpKcp8onrnFJyBcF2QDW4gPnLr2
         8GZw374nPBh1IjbZ7MM1YIbz3eEgPg12n8m4GjuTZpnp7a2irD2LR7oLKSxTpfCGYbNv
         cRWq44VDGz8d32j02dvpTsiPqN8X76Xg+QpZz6ugmJonytWdEDS6n6xDhXPrj7njHBE2
         +ct8py2L1by7OZ6kCxndYxjA9frJ0C19i1V6YWKKtBl78mJ8XSTr71xjIKPSVlfzpxQF
         bEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RSmUdgTY3vNX2ok8QM61elDamksiAlZsPWNetuCUjfg=;
        b=WVHL7PiCTKT6alFYR+EUwUctMkAcBVmPB0v17xJi0iuqN9QzG5zusmkpXZ7fBEZ5h1
         kgz6zQlC7LJ0tCGneSidkI+HsoDMmfuy6Rqb322V1xNiLrX5JGcDNhtFYMevdbpszJ2c
         eh8AMIA6nbEKgh+RfMTRClt2GMiIBFaVrWmVYP553D1WUTS6P4LJxOGmdWaDe3R1NeCG
         jk3cmebg5X5hjM8FB57y8q7Pm7sk9KmU8/LgbHku78RyrwUMN5Xu6mvwwJzVOo+K6p1d
         EdUqvVZ91eISqFJrW0mPDa5p8n4fJSuSNbiVhPdSOLug5tr9Kqpy5XqothtEHW+08L1S
         mnkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/RZRha8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si6677184wra.332.2021.06.17.05.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/RZRha8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr4Z-0008NY-76
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwu-0001Ga-R2
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwn-0006wp-UD
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id a11so6523168wrt.13
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSmUdgTY3vNX2ok8QM61elDamksiAlZsPWNetuCUjfg=;
 b=H/RZRha8MmQ9zDLdpRiD8nrkcZaWNF7u8DcsEDXUbrWs524eAlZdm8Aw0zBcH6r4VJ
 Ttjzyk85IHf0Mp+N583S6o4kkQKLsdS6/67sJ3mUZ8IruzsQbhsA5Kq00OKHOuZtttq5
 DVNqjAVj0dI9KJ8N+dUK9WeBPVD2RmzloNcEHPIe2BtgsuTV+pmu2RptJ9Ynx39pQDoF
 Xdx37v/+8LQb0dUalkhpY9X96xFAUHCiQCX/inwELS34dMgGxfdMVkR5QeGj/2f6LuBF
 +WYsE7HBFQD1WNe3ZEJ/A3XSQOUcubHOhIIMHvQkx66VqO8BT7ybtoV0fg0Zn9dRvUnw
 ho1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSmUdgTY3vNX2ok8QM61elDamksiAlZsPWNetuCUjfg=;
 b=hc30hTDBM3R4q3rnF8+cHO5VRa8bOBH4JC3Gk3kAGe097EDwstX5RBVC5U9KR3lJQm
 7Nu7LmfZAYE2HiDmBgfYHYsKAI1CndoUhUaiu63goJCYsdluzgPL4b0jQUo684WuVdnM
 lF+gkB46bBxCM3rkoE7CWLrkD8APaEoW8M/k6S8GfEdYVD83dsKKywY5zqyJ0t18JA90
 rpWEfST8ncSAsa2u3ImDZoaEbiFb8WhGQ7B7k72kj0kvTodo7MOpit5DEO9R0Ki+TT6N
 Zl3VcL/1LdpXfYXfYBFZD+kc82oGx4o+2fnjw/606IKuo4WzqSk2SNpCiprfML+f+p4W
 SlaA==
X-Gm-Message-State: AOAM533q7x3R8eChh90Ov/jXiCB9WSK9bvyThoyrPMlfc8DttO7/VdDG
 PeQmioXBXa74C3fh78Xoz9aBf/IX/zq+cw==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr5300767wrr.358.1623932196769; 
 Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 08/44] target/arm: Implement MVE VNEG
Date: Thu, 17 Jun 2021 13:15:52 +0100
Message-Id: <20210617121628.20116-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVfm9tkMr5NY

Implement the MVE VNEG insn (both integer and floating point forms).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 12 ++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 76508d5dd71..733a54d2e3c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -55,3 +55,9 @@ DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 66963dc1847..82cc0abcb82 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -80,3 +80,5 @@ VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
 
 VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
+VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
+VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index eaf750ead0b..7ba6a8a2d9e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -309,3 +309,15 @@ DO_1OP(vabsw, 4, int32_t, DO_ABS)
 /* We can do these 64 bits at a time */
 DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
 DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
+
+#define DO_NEG(N)    (-(N))
+#define DO_FNEGH(N) ((N) ^ dup_const(MO_16, 0x8000))
+#define DO_FNEGS(N) ((N) ^ dup_const(MO_32, 0x80000000))
+
+DO_1OP(vnegb, 1, int8_t, DO_NEG)
+DO_1OP(vnegh, 2, int16_t, DO_NEG)
+DO_1OP(vnegw, 4, int32_t, DO_NEG)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
+DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 90996813a85..ad2e4af2844 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -200,6 +200,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
+DO_1OP(VNEG, vneg)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -252,3 +253,17 @@ static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfnegh,
+        gen_helper_mve_vfnegs,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1

