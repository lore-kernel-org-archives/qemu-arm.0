Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1267538dyc;
        Fri, 4 Jul 2025 07:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx28IZmuUkhflkqTlubMcAujlAwaczclHjNq1CSkMIxCxgiumErDoSME/a8NhZY11rWC3WORYLdayiWw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmTNaIL6SUlo/60koBbbdPnipS6vAjb3B9xuEUNd7J2U5v15zFD13vE6veeGhHrAovkwBO
X-Received: by 2002:a05:622a:5a8d:b0:4a8:182f:3514 with SMTP id d75a77b69052e-4a998887abemr39396121cf.49.1751640776191;
        Fri, 04 Jul 2025 07:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640776; cv=none;
        d=google.com; s=arc-20240605;
        b=Ic+L/EfyLWo0G/oDkjbFKbfavjSrVQ4NY2YaQ/7M7NCdc7ONn/9im3oDT1V4hgkwfj
         fACmrFBxaE8XYogjEnaaqPdfdHeENrCRZkiX4OblRDHuj68ECSbCxHwuXlHgKM2Kvdyk
         iujjXhpSKRHTlUrbLDyg0s77PC5ZOeZoUOrkHL+WThksblqCgiMwSnVIezabObhwkk3z
         B5EPGrJJyFv/NyCSeQiIEIQAYdnkjtbtOK8SOugEBpde1qXShFf+nn1EPOsLvw9EjkmY
         LL4nAi/p7CSTXuhvskIeE4g9QGGge6OYZhC++yiFkWz+humYFWnG8qZYdt9bEeRywKTS
         jbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=31ee4gbuG+xTnvzONPAYhTdNeczCnwl4Vw3AePUR+UU=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=VqQkp9dM7gz3G2GiUAmUfBwQ/JEhbC0ktLNCaD9Dd0QgspZyCi8cUVzHnYtyClCeCT
         aiyXT+MtpsjnHpW6vuWO+gyhUwX0NdZJ8TYoLNesdQSTEyolYk1NdIUAlOup4UYZS0hq
         Sb06so4mTBCP4HbLET5tYhwfdGa4Hk1HxCNYKrBPeEbOey1E5fqcSCouWPAAbbsuI+FJ
         gq6uMWWSf1bZGChdcFUcvAqdh61AmmSDcL+GpdlKGKmEI0XJP0yCg2rimtO4Fqvo9F6t
         3Uc3aW1ygEFN2/eBzD7MEdoKp1bq43LiBrSIIEWRlmH5JLCUQLu95UuzDlC2PhRAyRf8
         keig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEckNf9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994feb366si21691971cf.166.2025.07.04.07.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEckNf9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhWO-00075Q-CN; Fri, 04 Jul 2025 10:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPU-0003P4-SD
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:29:08 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPQ-0001oA-T7
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:29:03 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2ef891cd058so858024fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639339; x=1752244139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31ee4gbuG+xTnvzONPAYhTdNeczCnwl4Vw3AePUR+UU=;
 b=FEckNf9FAf+GRN1M9yKwpwMvtEpgZx3qrABEcNALRpupI3CEJOGxr/eXnko18XaFK2
 Gm0+xeiirpmcuo0F97lWXdUneLIlsxpJ2ml6zPMqavXo2fgUjomeQo/VliTy3dyq7ZVa
 pKi3Qvaa+LQJmWMwaIth2WJDVnyEhYgt+4kwId8yUdsWNk5/L/sI3jop0DajVDmYVjrq
 EDonF2r9LSeKmNyYOVucPAzXmfQ3YU7hFKyecKknMap54vo5eaF3LZvEGUrD39N5wKeR
 BsfSzeCfluSLYSB4hWMVYpj89e3PfNUxQeO4AImQNwP6roAhirFxRx/nMKZINCnqB+wx
 lWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639339; x=1752244139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31ee4gbuG+xTnvzONPAYhTdNeczCnwl4Vw3AePUR+UU=;
 b=i2EnFEFKGfUUJIqhd8pjZgC1rW1YZ/ODWUxfxcic0pmk+JnOBJJM3Ar2VmfM2vc9/L
 ksFHzr6eGs7TAtFtY9oFTEHHQQ/gKd5FlHT85LHT0S2FOa0wumCpe1FvQKcRfrf3Ywq1
 APlJydTcUXmFO9A8RLzk/dc38WGuDirsy/Wk9fk54pv/b7Qj10zIp6fjp4iubKRbHIzB
 0fbeae2IfHAL0LLJJwy8artPavfOXXo959pLRsZMwG6EjLbfhE136mwqxOCDVSwwe22L
 iAOxrGcsnNPMv4FWt0eTPh05SNTPbv6MRGE0kAs4ukOC/3rbOXztlIHajozwTNPGM3xV
 aKNg==
X-Gm-Message-State: AOJu0YwSpTZFtJAqFeMwviYW+K1yPPtD5afdyIS1+vDnZtw+MXG/sqKW
 qgy/xGM06BwsJgBz/VR+ZOQYOVa7y3JoaeFQP/kuMVcQBMWMELBYHBZ1D0UIirRvpAU=
X-Gm-Gg: ASbGncsm53JtIj0NsUMoJbeN7GtgkpPsDI3i7E5fXK9mioGjU5a+v2hMq9pbVXr5qXD
 SYwQ5vgZ6j/Cmcf8fi3Qv8LfkJS0o2UUrlcSpG6OdupGH4XCEOfNhXUrdoGIcyshJPIfOmH6J5S
 YwN6MAeEpZzCr3V+M6V/nDM53sWLLTRZMyJepn8zjPK6Hxmy9XceFx4UtWZJX1xxjM4moidA9L2
 KPL6nHrXH5nrN8tU+tqQ5K5AJLjOn2rOX6h8hVB0o8ia9TR/nz6jNcCZFKCNGM3KVyPp5ERyctd
 LbRmEJ+IIjYZEe06oOfiW4nQwC6R/4lAaAI8GPz55qKX4zc7zjIUFbazZq83LLzeLX3ZoYEEp5Y
 A2pSGVOlvNZXXi00jKW0v8NVJEZSkMzkcLzs74bvY6Gj9MKjeeGlEwevUsJg=
X-Received: by 2002:a05:6870:224c:b0:2d5:2955:aa58 with SMTP id
 586e51a60fabf-2f79651b55emr1603817fac.0.1751639339467; 
 Fri, 04 Jul 2025 07:28:59 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 100/108] target/arm: Implement LUTI2, LUTI4 for SME2/SME2p1
Date: Fri,  4 Jul 2025 08:21:03 -0600
Message-ID: <20250704142112.1018902-101-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ywC5rIfoD+BL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h        | 24 ++++++++++
 target/arm/tcg/translate-sme.c | 56 ++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 42 ++++++++++++++++
 4 files changed, 210 insertions(+)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 392bf7b9b5..d9565c8069 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -1188,3 +1188,27 @@ DEF_HELPER_FLAGS_4(gvec_uminp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(gvec_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_1b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_1h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_1s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti2_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti2_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_1b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_1h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_1s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9592f6a996..d38b8a5ca2 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1697,3 +1697,59 @@ static bool trans_SEL(DisasContext *s, arg_SEL *a)
     }
     return true;
 }
+
+static bool do_lut(DisasContext *s, arg_lut *a,
+                   gen_helper_gvec_2_ptr *fn, bool strided)
+{
+    if (sme_sm_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           tcg_env, svl, svl, strided | (a->idx << 1), fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(LUTI2_c_1b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1b, false)
+TRANS_FEAT(LUTI2_c_1h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1h, false)
+TRANS_FEAT(LUTI2_c_1s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_1s, false)
+
+TRANS_FEAT(LUTI2_c_2b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2b, false)
+TRANS_FEAT(LUTI2_c_2h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2h, false)
+TRANS_FEAT(LUTI2_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_2s, false)
+
+TRANS_FEAT(LUTI2_c_4b, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4b, false)
+TRANS_FEAT(LUTI2_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4h, false)
+TRANS_FEAT(LUTI2_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti2_4s, false)
+
+TRANS_FEAT(LUTI4_c_1b, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1b, false)
+TRANS_FEAT(LUTI4_c_1h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1h, false)
+TRANS_FEAT(LUTI4_c_1s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_1s, false)
+
+TRANS_FEAT(LUTI4_c_2b, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2b, false)
+TRANS_FEAT(LUTI4_c_2h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2h, false)
+TRANS_FEAT(LUTI4_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2s, false)
+
+TRANS_FEAT(LUTI4_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4h, false)
+TRANS_FEAT(LUTI4_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4s, false)
+
+static bool do_lut_s4(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
+{
+    return !(a->zd & 0b01100) && do_lut(s, a, fn, true);
+}
+
+static bool do_lut_s8(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
+{
+    return !(a->zd & 0b01000) && do_lut(s, a, fn, true);
+}
+
+TRANS_FEAT(LUTI2_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti2_2b)
+TRANS_FEAT(LUTI2_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti2_2h)
+
+TRANS_FEAT(LUTI2_s_4b, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti2_4b)
+TRANS_FEAT(LUTI2_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti2_4h)
+
+TRANS_FEAT(LUTI4_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2b)
+TRANS_FEAT(LUTI4_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2h)
+
+TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index d4ee6f4d29..0603db0909 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3443,3 +3443,91 @@ void HELPER(gvec_ursqrte_s)(void *vd, void *vn, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+static inline void do_lut_b(void *zd, uint64_t *indexes, uint64_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint8_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H1(e)] = extractn(table, index * tsize, 8);
+        }
+    }
+}
+
+static inline void do_lut_h(void *zd, uint64_t *indexes, uint64_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint16_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H2(e)] = extractn(table, index * tsize, 16);
+        }
+    }
+}
+
+static inline void do_lut_s(void *zd, uint64_t *indexes, uint32_t *table,
+                            unsigned elements, unsigned segbase,
+                            unsigned dstride, unsigned isize,
+                            unsigned tsize, unsigned nreg)
+{
+    for (unsigned r = 0; r < nreg; ++r) {
+        uint32_t *dst = zd + dstride * r;
+        unsigned base = segbase + r * elements;
+
+        for (unsigned e = 0; e < elements; ++e) {
+            unsigned index = extractn(indexes, (base + e) * isize, isize);
+            dst[H4(e)] = table[H4(index)];
+        }
+    }
+}
+
+#define DO_SME2_LUT(ISIZE, NREG, SUFF, ESIZE) \
+void helper_sme2_luti##ISIZE##_##NREG##SUFF                             \
+    (void *zd, void *zn, CPUARMState *env, uint32_t desc)               \
+{                                                                       \
+    unsigned vl = simd_oprsz(desc);                                     \
+    unsigned strided = extract32(desc, SIMD_DATA_SHIFT, 1);             \
+    unsigned idx = extract32(desc, SIMD_DATA_SHIFT + 1, 4);             \
+    unsigned elements = vl / ESIZE;                                     \
+    unsigned dstride = (!strided ? 1 : NREG == 4 ? 4 : 8);              \
+    unsigned segments = (ESIZE * 8) / (ISIZE * NREG);                   \
+    unsigned segment = idx & (segments - 1);                            \
+    ARMVectorReg indexes;                                               \
+    memcpy(&indexes, zn, vl);                                           \
+    do_lut_##SUFF(zd, indexes.d, (void *)env->za_state.zt0, elements,   \
+                  segment * NREG * elements,                            \
+                  dstride * sizeof(ARMVectorReg), ISIZE, 32, NREG);     \
+}
+
+DO_SME2_LUT(2,1,b, 1)
+DO_SME2_LUT(2,1,h, 2)
+DO_SME2_LUT(2,1,s, 4)
+DO_SME2_LUT(2,2,b, 1)
+DO_SME2_LUT(2,2,h, 2)
+DO_SME2_LUT(2,2,s, 4)
+DO_SME2_LUT(2,4,b, 1)
+DO_SME2_LUT(2,4,h, 2)
+DO_SME2_LUT(2,4,s, 4)
+
+DO_SME2_LUT(4,1,b, 1)
+DO_SME2_LUT(4,1,h, 2)
+DO_SME2_LUT(4,1,s, 4)
+DO_SME2_LUT(4,2,b, 1)
+DO_SME2_LUT(4,2,h, 2)
+DO_SME2_LUT(4,2,s, 4)
+DO_SME2_LUT(4,4,b, 1)
+DO_SME2_LUT(4,4,h, 2)
+DO_SME2_LUT(4,4,s, 4)
+
+#undef DO_SME2_LUT
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index f7e4143b7d..5a5b8ff8a5 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -945,3 +945,45 @@ ZERO_za         11000000 000011 110 .. 0000000000 00.   \
                 &zero_za ngrp=2 nvec=4 rv=%mova_rv off=%off1_x4
 ZERO_za         11000000 000011 111 .. 0000000000 00.   \
                 &zero_za ngrp=4 nvec=4 rv=%mova_rv off=%off1_x4
+
+### SME Lookup Table Read
+
+&lut            zd zn idx
+
+# LUTI2, consecutive
+LUTI2_c_1b      1100 0000 1100 11 idx:4    00 00 zn:5 zd:5      &lut
+LUTI2_c_1h      1100 0000 1100 11 idx:4    01 00 zn:5 zd:5      &lut
+LUTI2_c_1s      1100 0000 1100 11 idx:4    10 00 zn:5 zd:5      &lut
+
+LUTI2_c_2b      1100 0000 1000 11 idx:3  1 00 00 zn:5 .... 0    &lut zd=%zd_ax2
+LUTI2_c_2h      1100 0000 1000 11 idx:3  1 01 00 zn:5 .... 0    &lut zd=%zd_ax2
+LUTI2_c_2s      1100 0000 1000 11 idx:3  1 10 00 zn:5 .... 0    &lut zd=%zd_ax2
+
+LUTI2_c_4b      1100 0000 1000 11 idx:2 10 00 00 zn:5 ... 00    &lut zd=%zd_ax4
+LUTI2_c_4h      1100 0000 1000 11 idx:2 10 01 00 zn:5 ... 00    &lut zd=%zd_ax4
+LUTI2_c_4s      1100 0000 1000 11 idx:2 10 10 00 zn:5 ... 00    &lut zd=%zd_ax4
+
+# LUTI2, strided (must check zd alignment)
+LUTI2_s_2b      1100 0000 1001 11 idx:3  1 00 00 zn:5 zd:5      &lut
+LUTI2_s_2h      1100 0000 1001 11 idx:3  1 01 00 zn:5 zd:5      &lut
+
+LUTI2_s_4b      1100 0000 1001 11 idx:2 10 00 00 zn:5 zd:5      &lut
+LUTI2_s_4h      1100 0000 1001 11 idx:2 10 01 00 zn:5 zd:5      &lut
+
+# LUTI4, consecutive
+LUTI4_c_1b      1100 0000 1100 101 idx:3    00 00 zn:5 zd:5     &lut
+LUTI4_c_1h      1100 0000 1100 101 idx:3    01 00 zn:5 zd:5     &lut
+LUTI4_c_1s      1100 0000 1100 101 idx:3    10 00 zn:5 zd:5     &lut
+
+LUTI4_c_2b      1100 0000 1000 101 idx:2  1 00 00 zn:5 .... 0   &lut zd=%zd_ax2
+LUTI4_c_2h      1100 0000 1000 101 idx:2  1 01 00 zn:5 .... 0   &lut zd=%zd_ax2
+LUTI4_c_2s      1100 0000 1000 101 idx:2  1 10 00 zn:5 .... 0   &lut zd=%zd_ax2
+
+LUTI4_c_4h      1100 0000 1000 101 idx:1 10 01 00 zn:5 ... 00   &lut zd=%zd_ax4
+LUTI4_c_4s      1100 0000 1000 101 idx:1 10 10 00 zn:5 ... 00   &lut zd=%zd_ax4
+
+# LUTI4, strided (must check zd alignment)
+LUTI4_s_2b      1100 0000 1001 101 idx:2  1 00 00 zn:5 zd:5     &lut
+LUTI4_s_2h      1100 0000 1001 101 idx:2  1 01 00 zn:5 zd:5     &lut
+
+LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
-- 
2.43.0

