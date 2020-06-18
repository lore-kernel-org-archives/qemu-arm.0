Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1284569lfm;
        Wed, 17 Jun 2020 22:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTqZNGiHbiY8xgks6UQgq1bzEMVx0PGtWgf/3kablTBb6UCCJwYdlfK3hxEbO68peF/kJE
X-Received: by 2002:a25:8404:: with SMTP id u4mr3891518ybk.515.1592456952239;
        Wed, 17 Jun 2020 22:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456952; cv=none;
        d=google.com; s=arc-20160816;
        b=o/G97uIm/Xnj7W7fqN9msxDf5NFAb5g/NN+MRXwUsmjPU+NDHrfBn7cey0vVXwaKDA
         pA7ELE3xUh9gzwB5eNQO0DIvxPyFqqjbah6re7p+ao+LqftuyiaWCrz8m5aUvhURo1kf
         7lU/zSO+et7UzjYqEzIAyavw1oL1UD8n/ci4372EsOILzdZPF9V0sXT7FPi5MydMM3MP
         6IL5IfHGfoOIX1XBhlytNBntVk7GJwhASjjIOAlaPQ/VJtujzX8/yxyrl2zrx9hek3oT
         9fJpiVn8CXWBld3VZAYS5WuL3jam6EhORF33ydarBXZxSfKrZ7tac6+OKyH9SM2XUE4q
         m0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Be7FerxOL0YxBcJc1swDCG2s6mkIpSU34n7zP+l5oYo=;
        b=A0UdkZRwx40JjPRXHR1LEskxIjvTVwWCyC6HoBIXmuzFw8Px60BYKZu7vI0LtBpDWD
         +dh7/hupH/MoPbOKCpJGwZXV7BZhLSrbKZsAXg7nPqEVIall0ABDtjsYos5sry1zvdSP
         Qllg5mcBR2f1pukKy6AJMjBxy00XM+stEFulh99DQzGk90pMf54FlxGbuLCmR3+CRYa8
         f5RB8FZeDr9AXM+OaPFBMoQrIpZ4Gggrf+mI9EicY+OxjtT0PBT1Vku5zmvTUlilt5No
         2zagyxrbZ081kDDVL0AntyCar6T6L4MDS0YSVsOvkcogMCFNC7VNb2qsWMHg7pScN0Ox
         0aRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zfezjfIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t45si1506692ybi.478.2020.06.17.22.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zfezjfIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmnX-0008Eq-JM
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEw-00071t-2I
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:26 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEu-0003ee-7g
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:25 -0400
Received: by mail-pg1-x532.google.com with SMTP id d4so2343925pgk.4
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Be7FerxOL0YxBcJc1swDCG2s6mkIpSU34n7zP+l5oYo=;
 b=zfezjfIzp2CV2e6Dl4Evm1/u4UaXhKU4upm2D5bp616W76ZV2D/Q1S08Jl3eYcwsu6
 GIuBHxOhVwckS+dIy5PUsissClKDKPl8gtjXIpWtShrfHnUsLqffvSljWJWXHslB1LXz
 NpqyuNsE1EyUr+SgGU5Jqq5w3GL/VMgA4as2rrtSq/EY26cAkfIBthu+acsRjtRv8ZYL
 ulczrc/QXP0ExT0G6TciDE6jXg0vr7vPG+Awc+OmcydKUFDuKjZDOsXfND6AGS6Rbyb6
 24EIbPH/oRalb97duzbnVLpnGpgiHLvRp/GAOd3qW2PU/peEjIPX2t0wU4cY8Xqf4tA8
 NSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Be7FerxOL0YxBcJc1swDCG2s6mkIpSU34n7zP+l5oYo=;
 b=e9/nrlQwJcm9xSiv7603E3akHauVJWXQBRheIc1pj1o4aDMYbu5mRyUFyKGPnMKCnd
 y9y+PKrnPuAGF/GmwP1ntS1gtPAA2H+79VQl9YYy4EssNlSwrtW/dqRxO+ValtXDgXAe
 WTCLzlGJdjeer8TeHSniqG26qYAcFllClDaYNqxCR1/3uNt58R4ZNOkt5y7W5sG/7cod
 sLxvs0hGcSO2gZxqwz7OQ4CByqle4L6KlPQZsoH3ZD9WdDSWnSGiNt6tZ8Geh+bSmwzt
 ClpTosAh8RXvF8GD/H3eEuLN7U/AYCLq/WHYzp6N5gIIPvIE/9mu2Is/gopV51tT0XGK
 ZnUA==
X-Gm-Message-State: AOAM53046tGfVEHE0Ca/AzLfMzwg24kCN0apMATQKbcrX/CcC67Xj4tq
 HMSvdZALJrgc6v2dg7686qjlCw==
X-Received: by 2002:a05:6a00:1592:: with SMTP id
 u18mr1968821pfk.26.1592454802978; 
 Wed, 17 Jun 2020 21:33:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 090/100] target/arm: Implement SVE2 FCVTNT
Date: Wed, 17 Jun 2020 21:26:34 -0700
Message-Id: <20200618042644.1685561-91-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
X-TUID: LQ6OoYgMPP2t

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a3d49506d0..252344bda6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2246,3 +2246,8 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 609ecce520..9ba4bb476e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1573,3 +1573,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6e9e43a1f9..7a5b0d37c5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7174,3 +7174,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6b9d715c2d..3c145857db 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7780,3 +7780,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1

