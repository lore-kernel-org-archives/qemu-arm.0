Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp629127lft;
        Mon, 20 Jun 2022 11:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vK34kBNTWZmcHYMmMYw/E5dMZuzd3/611EiN2IDTPwIUHu7hU8RRTjjfpCZwy2SGfMJ13v
X-Received: by 2002:a05:6214:21ec:b0:470:3f6a:9103 with SMTP id p12-20020a05621421ec00b004703f6a9103mr6836726qvj.27.1655751435143;
        Mon, 20 Jun 2022 11:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655751435; cv=none;
        d=google.com; s=arc-20160816;
        b=cQEyRh36C/5J2AigHSZHY46LJ1l01bFigv5bY7O2FEj0ZN7Cw/AXn+A80CwECU9OAO
         hZKB/ID8DkYujrEoRXUNy2KibyWN4WzojJIZXcgcc1MD8TJLmbEX4w9W0v0FL5TcZB4i
         scFKgEv8G1D2lcgOapRG80st4Qyy8ju02jxkniJr5viPrZ860Xng1EZh/dAE+hhIi3Jk
         H2kOQzjhFasZ58UyRKugY7ELeYkv9cpFjoHy0Db/z/EabjC1/B7HaY/lVkkigWtB06Xe
         +XvKFOrI+ZcCdXC/Y/AtyP66b7jDZ7zeK7Ls7YxPRgwZ/CKJEAjveJg0PwNa0TT2s09T
         ijug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cId+jl3LafbTbLYlOOg+jSuzH9qsoTjBGOokKriD7lU=;
        b=ZtbwKevENzNW2x5+kFFZhd7+OATVIxiWZZkHDKL7gWGi9c7S0ntoIvEeWGTjlSHvFO
         pKd5Tx+OQ7x2xriJskVzBQSjwOsROQDBsIhw64mBTTsQqjy/uO8UbBWyukfcDagDN24y
         QcN7k8kE7+X7cUQ9fhnBiaanIzm2IdgcdL0j3xNzj38lIECUOiJcWiy9yPkSjWjXeMD/
         cRaK4k2qkPkNNM2UwobjNqF9nReBW8IK2CgHOGf7INXImFWidxNULJl2N1foGQR+Lhxh
         JARSCQ2kebdtBbw61z0OZuqcn7FlXWLW/Xcn4wIyGDSFHgpZkrSkSFtMXQsDfIUnfTFe
         VBmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vZr5D/Us";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020ad45ca7000000b0046ba37bb2e1si8761253qvh.468.2022.06.20.11.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vZr5D/Us";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3MaI-0006HZ-KM
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaN-0006OO-RY
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0001JG-2S
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so10405994plg.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cId+jl3LafbTbLYlOOg+jSuzH9qsoTjBGOokKriD7lU=;
 b=vZr5D/Usa00YbQTltq5JGlPpX+tklLQsTbKZuClm0IWZaATS+6CgqsHQNbIqL++XZT
 PCyEt+shitVZjWtzRbBp+/TXDI/dGaGu+9KpLe7/BMygGn1a096nezym32//3+fF6BLV
 djFHcyYYnWrBgR/nKlE/h1jLLi2plDqYpFUQ88Ksss0o055qTGlvbgiuAICj9JaFk35V
 rrhVj/j3JHtK1f4BjOy/Pdi+E4ZdW+tvZBC9B9LCUXj8GfeVmHd1QC2vTWLhxfeceGv8
 jHgOOxzTpEL7O6gm1ObzAKpJSzA1P0RelxBp5a150/dFHHO97nnOQ6W16bhss/GqQYAg
 VhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cId+jl3LafbTbLYlOOg+jSuzH9qsoTjBGOokKriD7lU=;
 b=m/djGJCy9dfRo6OXZDmi58bVF4zKH+D3WEqGsy15mlmrYEXPAI+9pl4i0ltB4JMMMF
 XiAVSu5HgTeVFeux54HoNpD5viDAJq3jd0dnClojjkypKejveAceFlkai5cLmTeFcM0W
 vMQcsWdeyLn2AyQ2EuWNIVa92OQeW9mqVuqyxFso63yUpgkkbhXkOypgCgVZIh72KCs4
 eeHStz6W///hItlB05pBXX33Gza4mV0wG1Y6QJ1wKuK6DtZtsLHYw3Lm0tgZz+y/wkqX
 MdtdgGJ68xxCAx7Roi7MFm00GGMUVAnjgoGuOO3RxvwMcvaJlfwPhCTtyb+p8CV4BsnR
 neAQ==
X-Gm-Message-State: AJIora/Gx/OsRZuzbPj6Nro1K2QoMiSryCmdiFZXNLpJ/xeJ2HoKQ9/M
 eh8axzERsiSGydRr+2lDsmgfydxrrVGj/w==
X-Received: by 2002:a17:90b:1c02:b0:1e3:4b6d:4269 with SMTP id
 oc2-20020a17090b1c0200b001e34b6d4269mr38626265pjb.57.1655747586594; 
 Mon, 20 Jun 2022 10:53:06 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 35/51] target/arm: Implement REVD
Date: Mon, 20 Jun 2022 10:52:19 -0700
Message-Id: <20220620175235.60881-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lKRQxdl2guP1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f..cc4e1d8948 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bf561c270a..d1e229fd6e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9a26f253e0..5de82696b5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 58d0894e15..1129f1fc56 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2896,6 +2896,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.34.1

