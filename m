Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954819lfg;
        Tue, 9 Mar 2021 08:20:47 -0800 (PST)
X-Received: by 2002:aca:3f87:: with SMTP id m129mr3484587oia.82.1615306847254;
        Tue, 09 Mar 2021 08:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306847; cv=none;
        d=google.com; s=arc-20160816;
        b=eWHZJXSdgyv4wsBrHDbgTya8HTT+2u6XgyGb9wjC/TG5exhmb3u+sZkKGg9lFX5vIH
         UOHYoObIv4p0hJHHSCtqJMm6BRwiuHGvlYLjFM4duZQyqhJZyMEk3PUA1lWSucgEC3c7
         ZFWfWWNugCGJSRTTFucXfeZiuHa1bQbGXQcpFvbSG/ju0dC4bSEouXC1+yfSrFM2B6cQ
         9ZF0zCpkijDHw2tNluBDU7m8C5WRUVmF5hcleWC/1lYDLW17iP8+J4SAAJtgvRpwU2Jn
         4P2FJUYDWEzZh+5WPiz1W93X1jiVF3syOWKWASoQbCiBinKG6Zuo5CUoqrfTLbAR/c3v
         4ykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hxGq0ZhXNKQdyORVC2X6O56UWpurZDIjXhlbnnV/c4c=;
        b=G3sSxIIU96E6vtbW4ntjrYcjDmohd/Ff5UUgZITX+USgeR+e0cbGgIkLYppcCbe0if
         vsDcy3bRvd7RrIrb1CFJze5NL92YO33UwAh8sBEQxapUob3ov8gnk+FZj4BMbwiUtHE5
         jnCOsMuqyDOSk/d8Y6jSWIyoSWN/jjNGuNvDqCbcln8oe9PwyQv8hZsMIkyhziyI16jB
         kovk1xHki2XnUG0HOmydWbyqC/VA+HBiDoKEtMXjGGbqZJv7FBwzV17c03vU6s2D1WlI
         4rLOazGMetZXRCciCPUlYdELXq0xRBQioJAdGfAR3O9mc3hK0WIA8ZpXAWeOix6njYqP
         Fgiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEHxcwsl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w78sor3995522oif.143.2021.03.09.08.20.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEHxcwsl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxGq0ZhXNKQdyORVC2X6O56UWpurZDIjXhlbnnV/c4c=;
        b=vEHxcwsll2OL7B4wPd2UzdoCTPKBWqQo/x+vErN644MUv7skSxqY7aJZPou+AchHhj
         aYP6/qI7RrQT6wz/qAJFO6Mmauvg+IAUeFWokO4paRD5dZb/Zy7ewl2+k/3KA90Sqz2m
         lZsRoBqghk8KLKFG3i2FuewlLQCNMqtdRz8J1e/QVSUxrMVMAfQvOgV5V+PDrV+jTyr1
         BeLD+Z/CZTZYzWQXT148bmupu2rPgwcRLfWZULQHQH8LEuBSY/nHUsv8mHzd98s8xDym
         xvJcc0byCZ0V+U9b8tEoJBppsUVlfmkT3+36+EVWAYggnVff7cDjzu+uKE8fZ59SeYsp
         K1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxGq0ZhXNKQdyORVC2X6O56UWpurZDIjXhlbnnV/c4c=;
        b=cH9hfQZPX7aqtt+O98AKLnETh962jklHC/87ngN5wxh6Noe3+d73spmEWCkJsVNa8s
         GVJrQAdmoqV8G1mJCCUAeP6cF1pL2qMMXJLNAwKaRWa3jSdoUTRMjFn5oF63mlDfuIkB
         ldIi/CnNqdS3wqCa2rlO6bjBlQlSdcuLAk8bqQlUT5nwo7dO9KNgsBDKIpHPsL5crrtu
         4BpZ3JzCEXn6w7PBoBn6xZXkuETLoQBKLY15kQsBnK1ykEP+GindC4vt2CtdRhW9IYKc
         ovq0NHCHbUAW10S/DspNjDH6r91Bi+EwOCfgkZm+AExPwFdlNrmSCuD8J/Yk16EPv49j
         oGhg==
X-Gm-Message-State: AOAM531fv7X9jDxiZBMUT6Lr2khOoKm3rvx9JQmUGjbe+fLoSjq/YJ7K
	rZVxSrxuYKwDvPoEoRZUOnjykFXo
X-Google-Smtp-Source: ABdhPJzX8+nEUbUsI3dWLog9XqplylP+87mUnWXBR6hu1AC0cQNpaIdpil/mJzUCZcwIrEoC3mxyng==
X-Received: by 2002:aca:482:: with SMTP id 124mr1517622oie.21.1615306846873;
        Tue, 09 Mar 2021 08:20:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 03/78] target/arm: Implement SVE2 integer pairwise add and accumulate long
Date: Tue,  9 Mar 2021 08:19:26 -0800
Message-Id: <20210309162041.23124-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VFwC3NKgiqS1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 39 +++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e4cadd2a65..b2a274b40b 100644
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
index 557706cacb..0524c01fcf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1100,3 +1100,8 @@ MUL_zzz         00000100 .. 1 ..... 0110 00 ..... .....  @rd_rn_rm
 SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
+
+### SVE2 Integer - Predicated
+
+SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
+UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fd6c58f96a..00bb82da91 100644
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
index 06b906bce9..603e673696 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5846,3 +5846,42 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
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
2.25.1
