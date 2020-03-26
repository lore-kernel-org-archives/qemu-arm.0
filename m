Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2504034lfi;
        Thu, 26 Mar 2020 16:11:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt5Iako+oYGagOigYfhWc69cvO6sYsr50yZ8IsI3RtIelyE4rjpsPqnthy5+5Fzofsv+frQ
X-Received: by 2002:a37:a40e:: with SMTP id n14mr11314281qke.494.1585264273954;
        Thu, 26 Mar 2020 16:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264273; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQczbfBYmjoMe7su/O+c30IDq4Zvt5jX80rafJAY/4OPz3tVmJHK09zFSRjHe4SNem
         K0Kzv48qxh/gAAnQw55k8Er5y2DgiJKCN7Im380TyyP2vVyAmkLECVs8niv8Hm4JmMTE
         dUtLjMAO91+DvbTpSHfg9vsrlHa4kP92dJSnmBZY2OgxAZvhQHCTW3YeQgC/LH0FhTSY
         WlE4Iml4MIX04PeSvPGQxnLIi5kRtVfJvnDxBrOlWB448Q5ZC12CMWsHmvAt31pLYokl
         Si880b1h3PJE8qH9xELb0D04F2w52aZNlOJ2FNMZ3po+m2qs6c3cIWpn0AuJ3M5q8Qm7
         ed1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ENzLI8qMuJSws+8eLNHdlg92DyxjJFX8uRl+A0psg7s=;
        b=puDY5VdkIhGkRrP4robRw7dcE89CWluFG3Wmk1NPEIGMQwUyzviGgpNq658WsQrQUz
         ROMkU1weLJHJngUEiGc/l5UpNfqQHbfhRMZ29EqZXC9vImuDyzbEgY6QaTTq1MQp27zh
         L3EHPxjwcM9/8waSO2428K0PR3KpuMmW8WqagOJnGccPZ9gv414OxeegEqPIKC4ZoFZs
         I9pVykEx/gotXaZeRYqZFxcYHFPVHsrvFJes1MCC4gAog8Iisc7TNvrKAZyVkVh2n1d7
         aMrE20ZTDwQiplJ9m5zBVd9rby/SHEdlGwHU1FcfsORVGRF1c3kkb/H15U8QhHl2JzXp
         bOHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iperahye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131si2370994qkd.173.2020.03.26.16.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iperahye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbeb-0005yQ-Bp
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcE-0001qX-Ez
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcD-0001GQ-76
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:46 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcD-0001Fx-1J
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:45 -0400
Received: by mail-pj1-x1043.google.com with SMTP id ng8so3090857pjb.2
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENzLI8qMuJSws+8eLNHdlg92DyxjJFX8uRl+A0psg7s=;
 b=iperahyeiAw+M62lLJODUFHBwlVgapsnkYDNUt8COvK1fUmm1CJjWCE2Hler7y8WFs
 thYR4AGnwlDpnCKLOz4W2/jPs87Mc9ZC6qQB6TmI5C9/I8Qzt10HEy5wCcfcrImpN++9
 q9/ToVSicS6yJNXRwm7YmfeY1qvAz1dE00t+m10yGiwla4weY2NoLjx6l5mYqNOX2zU1
 Z9PFttzHnPu6iFSBdTty5pTpAISQ3TP4y8T0HMxc/IyWH4HluXYgXB7QE/vzVfvzqEXl
 59jGq9BWoPSBCrgj9jgfG9GAMPto66F6A8AY6ZugID3QINWKSrYUAzjpAwU9dB1vLayU
 P8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENzLI8qMuJSws+8eLNHdlg92DyxjJFX8uRl+A0psg7s=;
 b=bHsq8fx1MtpABI0z1zfCZKowDirf0MFrggl47uijCNns1+/Z6Om+X13qVs5DA4OV/Q
 DDE7lN8sV5VkmlzdUhaVNSnHbHb99Dm8WS49xMZ8EcSg88SaIpaQeHAPiZGzmqr6eC39
 Asb27X7hNA3GOhcFMWcVHsNy84dl3GjcyhrMWzPNsRx2E1ADn1eEtKehTJHth/5HRjmC
 Y3+IZTXhxqAaX5qKHu+LjNZFA1y7co9TTsHsW6zv8e5gEV1fPJ8XxoyFoi+vrsr5tjEf
 7BSUBt5hVxXSENJDaBqLnW6Do02UJEyyiXUUpDRo3kJwMQQGrYeVL0Z/fyaJAbr/bhgn
 UHUw==
X-Gm-Message-State: ANhLgQ34YOBgieNd5dYZOQ3VlDgGWpL2SENoPQgpZUzMINFjdm/pXTHA
 10Q51GcEFHtMhv9nfXvQNy4l/A==
X-Received: by 2002:a17:90a:c385:: with SMTP id
 h5mr2508231pjt.131.1585264123970; 
 Thu, 26 Mar 2020 16:08:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/31] target/arm: Implement SVE2 integer pairwise add and
 accumulate long
Date: Thu, 26 Mar 2020 16:08:10 -0700
Message-Id: <20200326230838.31112-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-TUID: iqJYZu+soaqO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 39 +++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 11d627981d..854cd97fdf 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -158,6 +158,20 @@ DEF_HELPER_FLAGS_5(sve_umulh_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_umulh_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sadalp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 58e0b808e9..6691145854 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1102,3 +1102,8 @@ MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
 SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
+
+### SVE2 Integer - Predicated
+
+SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
+UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d40b1994aa..7dc17421e9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -517,6 +517,50 @@ DO_ZPZZ_D(sve_asr_zpzz_d, int64_t, DO_ASR)
 DO_ZPZZ_D(sve_lsr_zpzz_d, uint64_t, DO_LSR)
 DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
 
+static inline uint16_t do_sadalp_h(uint16_t n, uint16_t m)
+{
+    int8_t n1 = n, n2 = n >> 8;
+    return m + n1 + n2;
+}
+
+static inline uint32_t do_sadalp_s(uint32_t n, uint32_t m)
+{
+    int16_t n1 = n, n2 = n >> 16;
+    return m + n1 + n2;
+}
+
+static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
+{
+    int32_t n1 = n, n2 = n >> 32;
+    return m + n1 + n2;
+}
+
+DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
+
+static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
+{
+    uint8_t n1 = n, n2 = n >> 8;
+    return m + n1 + n2;
+}
+
+static inline uint32_t do_uadalp_s(uint32_t n, uint32_t m)
+{
+    uint16_t n1 = n, n2 = n >> 16;
+    return m + n1 + n2;
+}
+
+static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
+{
+    uint32_t n1 = n, n2 = n >> 32;
+    return m + n1 + n2;
+}
+
+DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e962f45b32..bc8321f7cd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5880,3 +5880,42 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
+
+/*
+ * SVE2 Integer - Predicated
+ */
+
+static bool do_sve2_zpzz_ool(DisasContext *s, arg_rprr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzz_ool(s, a, fn);
+}
+
+static bool trans_SADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[3] = {
+        gen_helper_sve2_sadalp_zpzz_h,
+        gen_helper_sve2_sadalp_zpzz_s,
+        gen_helper_sve2_sadalp_zpzz_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
+}
+
+static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[3] = {
+        gen_helper_sve2_uadalp_zpzz_h,
+        gen_helper_sve2_uadalp_zpzz_s,
+        gen_helper_sve2_uadalp_zpzz_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
+}
-- 
2.20.1

