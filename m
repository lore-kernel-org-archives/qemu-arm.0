Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1267213dyc;
        Fri, 4 Jul 2025 07:52:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6WDPoqKa5vmmjrjMspT06gLhxq8RQKLPAZBEr6IFBAk0JX78TZzGtbnBPDm6Wxk5P/4wuebK3eh/ZMA==@linaro.org
X-Google-Smtp-Source: AGHT+IFf4kq1Sf2Xq13LL3Fq3wj3FmW47mxF82uKTVlgFJpuNLGfNDIIp9hvepp1fnCVpVj682jp
X-Received: by 2002:a05:6214:2f86:b0:6fa:ccb6:601f with SMTP id 6a1803df08f44-702c8bcf0ffmr31531346d6.21.1751640734545;
        Fri, 04 Jul 2025 07:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640734; cv=none;
        d=google.com; s=arc-20240605;
        b=L+lyW50KU79GW+m/VunSat0QL8ob1M5Gz8+4K7T+GHmJl7pZeJHHPCHItyqOCAiT5d
         N/GBNsdpBu/zgf8MDlpquOM3PsdUEqrPuSUo+RGIj95F5gxGr+N5WCfpABlmB6qxCWwX
         JZ/jtpebqm5dres5SVqPRpbxIr4DwH8RYan3DEalMS+aJOxql5BSCxn1KnGTN6hfO3Ur
         nnhopUFm+luwtdKFL+zBVnFmGr5ACCnkvlI2Vpr3AgEZWfvnE37Tw9ERzu289eFehGcJ
         G12p3Z/UCIg2zzNSGUbGZkbqULoS/pSSnRY8z4oLdgPLUahij654qa/aD+b90eDOiO2K
         ux+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=29K9yY7dE+axUAoDft5EA1rREE381pcsMtG+hnxeQIA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=aPjREmmc3t3QZDsp9tffiflWJMISTaRjgSGVL5KefWkm5EFnp7UFIFYpVn+tIKi9qa
         9a1+Lyv4s8lJaC7/Mp7wHsbmzs3VEfhA18bTBVkcJvZakLDyvo9eCgriEl3vAPVvKzda
         DG6H7DfUDHBiuMmGI7Fm2kEgPwGTsvt7Fwlmd0DbElLXdQrwIUw4Qdo0gMBrD3G749OT
         /guxn2QP7CqAz4n3m/sf4Y/AAyWITEuSCwk6o3GaNNDMCPZ19A0rkjbXIyJpzlb7WPOH
         avzxVkjGbG/3TyAgKpa7LpHaDx/wbBYxpFbC2+NKMqoSZaizD0If415dR47xg5xhlF46
         MAeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ke0Xg4Cp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4ccc58dsi21555386d6.38.2025.07.04.07.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ke0Xg4Cp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhU7-0002hZ-6c; Fri, 04 Jul 2025 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPD-0002Vn-BZ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:52 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhP9-0001Lg-6J
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:47 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2eff5d1c7efso818108fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639322; x=1752244122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29K9yY7dE+axUAoDft5EA1rREE381pcsMtG+hnxeQIA=;
 b=ke0Xg4Cp1bRGfDElZz3UwVbmSlAXzl3lAtHgry9byob9+R3JLSfgFbJ3GIEkkK9b1U
 iJ7lS3NsccPuQwIqCADNs4oJCuKhxxInR9HeU6cSjB5U0t91SpaPwSWdsARBM+w3Gf96
 olR44XSlkbaFyfuwK3gEQDVXv8lLxjr+sZZMJyzCIc7WTM7s/ZVgvp16S+dbvwiIEdaB
 Vc12oJOMIxw8Y2HGzQqUMTJYLMKxXIIOYuwHTpvhZ+lO6G3f/MHUQHsgvq1wQnbdsgr5
 hfclfRVznaNnp45eCukcx6flvMHbcqkph24qFN0Wsjl935OeJkXuu0q+vk3DDMX7cH2e
 LyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639322; x=1752244122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29K9yY7dE+axUAoDft5EA1rREE381pcsMtG+hnxeQIA=;
 b=XRKRoHLtclAzYTQN3MfiT2n1XttXn3ifzPSQJJ4baE44P/EFMjZbl2zu4RK/iaEF46
 CjPN2pfAy1zbRhYfMjddxsYMoNoQQB1qOq+u3ME0jsmUexs3yZe9W8oYfoTRhjBAO1PV
 RXfCWji7Km/NQwZ5GwPw1F7LIzM3Ao5hCMYe/tmEPOuDigcZjbY1ySZoqN7KCQJBdQQQ
 89spN7Hj4suhuCem8Nd7uAsm0awmLUJNBOiCIZJhRXuTD0UqEAaAVBdQnSA5T1QkWXX6
 qcwvLEQfDdRSqNqrhI7+LDvC6bRWdc83OJx7JlZkBbEBGCv6lbvHIhUvsUR40R7W3HU1
 HHKg==
X-Gm-Message-State: AOJu0YwCfqxt7bNicawkA4IcGPj7XDQ1BG6jDs95+RlTbK3s9Bc7feCG
 imGzcPxQhYRdmFlXTf4SRN+faaLZsd88kFqh1vIMu+9P+/f5QSwA23UhKpgoNVerLvA=
X-Gm-Gg: ASbGnctw+4t3AtCQgwURB2xmIgtiJuj9PS5OvIxlSJ8N+je4gyqMRNvVTQZsqKdkDF7
 TSk4BExkqwwvKeMqrCBi5F0ed/pxEtYlMJ/7kUarv80Bo8RmxFDtBJe59uJ8kh3wy/wevApmLfo
 pwShNFwTIZsFy7AGktgcHmkP1+w74EOKhOOK2y6VPLaYmiwuSecBXzQ/3bVo63keCw3BbDMG7Ij
 CCQPteNsKVrh2cl34Hsb7vPKNQ1aRaZWnZ+/xxkl7ManV6UTrJQN6KZ6ACIs/+HE2IsW3jdloCa
 NgBMuUdoUSz8T2lsP+bbu/3ONwfKZ7XpWIO8vQucnp58t5QyO6vVWVXmkQikncefVu3EiQb6R8Z
 ALjPXPNCfqpx6lZmY+5vIu6ghLNcp+eVFVJWBKGz3T5EskKI7wjW5qjmwSrI=
X-Received: by 2002:a05:6871:547:b0:2bc:7d6f:fa85 with SMTP id
 586e51a60fabf-2f796b2ed9dmr1688806fac.16.1751639321744; 
 Fri, 04 Jul 2025 07:28:41 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 083/108] target/arm: Implement SME2 SEL
Date: Fri,  4 Jul 2025 08:20:46 -0600
Message-ID: <20250704142112.1018902-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TfYtY9GCofHt

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |   5 +
 target/arm/tcg/sme_helper.c    | 317 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  31 ++++
 target/arm/tcg/sme.decode      |   9 +
 4 files changed, 362 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 78ba3d1f20..467073ea25 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -313,3 +313,8 @@ DEF_HELPER_FLAGS_5(sme2_fclamp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i3
 DEF_HELPER_FLAGS_5(sme2_fclamp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sme2_fclamp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(sme2_bfclamp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_5(sme2_sel_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
+DEF_HELPER_FLAGS_5(sme2_sel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
+DEF_HELPER_FLAGS_5(sme2_sel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
+DEF_HELPER_FLAGS_5(sme2_sel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 8a1f9fbf3d..c1166e4ffa 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2118,3 +2118,320 @@ FCLAMP(sme2_fclamp_d, float64, H8)
 FCLAMP(sme2_bfclamp, bfloat16, H2)
 
 #undef FCLAMP
+
+void HELPER(sme2_sel_b)(void *vd, void *vn, void *vm,
+                        uint32_t png, uint32_t desc)
+{
+    int vl = simd_oprsz(desc);
+    int nreg = simd_data(desc);
+    int elements = vl / sizeof(uint8_t);
+    DecodeCounter p = decode_counter(png, vl, MO_8);
+
+    if (p.lg2_stride == 0) {
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint8_t *d = vd + r * sizeof(ARMVectorReg);
+                uint8_t *n = vn + r * sizeof(ARMVectorReg);
+                uint8_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, n, vl);  /* all true */
+                } else if (elements <= split) {
+                    memcpy(d, m, vl);  /* all false */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H1(e)] = m[H1(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H1(e)] = n[H1(e)];
+                    }
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint8_t *d = vd + r * sizeof(ARMVectorReg);
+                uint8_t *n = vn + r * sizeof(ARMVectorReg);
+                uint8_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, m, vl);  /* all false */
+                } else if (elements <= split) {
+                    memcpy(d, n, vl);  /* all true */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H1(e)] = n[H1(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H1(e)] = m[H1(e)];
+                    }
+                }
+            }
+        }
+    } else {
+        int estride = 1 << p.lg2_stride;
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint8_t *d = vd + r * sizeof(ARMVectorReg);
+                uint8_t *n = vn + r * sizeof(ARMVectorReg);
+                uint8_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e++) {
+                    d[H1(e)] = m[H1(e)];
+                }
+                for (; e < elements; e += estride) {
+                    d[H1(e)] = n[H1(e)];
+                    for (int i = 1; i < estride; i++) {
+                        d[H1(e + i)] = m[H1(e + i)];
+                    }
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint8_t *d = vd + r * sizeof(ARMVectorReg);
+                uint8_t *n = vn + r * sizeof(ARMVectorReg);
+                uint8_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e += estride) {
+                    d[H1(e)] = n[H1(e)];
+                    for (int i = 1; i < estride; i++) {
+                        d[H1(e + i)] = m[H1(e + i)];
+                    }
+                }
+                for (; e < elements; e++) {
+                    d[H1(e)] = m[H1(e)];
+                }
+            }
+        }
+    }
+}
+
+void HELPER(sme2_sel_h)(void *vd, void *vn, void *vm,
+                        uint32_t png, uint32_t desc)
+{
+    int vl = simd_oprsz(desc);
+    int nreg = simd_data(desc);
+    int elements = vl / sizeof(uint16_t);
+    DecodeCounter p = decode_counter(png, vl, MO_16);
+
+    if (p.lg2_stride == 0) {
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint16_t *d = vd + r * sizeof(ARMVectorReg);
+                uint16_t *n = vn + r * sizeof(ARMVectorReg);
+                uint16_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, n, vl);  /* all true */
+                } else if (elements <= split) {
+                    memcpy(d, m, vl);  /* all false */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H2(e)] = m[H2(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H2(e)] = n[H2(e)];
+                    }
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint16_t *d = vd + r * sizeof(ARMVectorReg);
+                uint16_t *n = vn + r * sizeof(ARMVectorReg);
+                uint16_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, m, vl);  /* all false */
+                } else if (elements <= split) {
+                    memcpy(d, n, vl);  /* all true */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H2(e)] = n[H2(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H2(e)] = m[H2(e)];
+                    }
+                }
+            }
+        }
+    } else {
+        int estride = 1 << p.lg2_stride;
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint16_t *d = vd + r * sizeof(ARMVectorReg);
+                uint16_t *n = vn + r * sizeof(ARMVectorReg);
+                uint16_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e++) {
+                    d[H2(e)] = m[H2(e)];
+                }
+                for (; e < elements; e += estride) {
+                    d[H2(e)] = n[H2(e)];
+                    for (int i = 1; i < estride; i++) {
+                        d[H2(e + i)] = m[H2(e + i)];
+                    }
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint16_t *d = vd + r * sizeof(ARMVectorReg);
+                uint16_t *n = vn + r * sizeof(ARMVectorReg);
+                uint16_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e += estride) {
+                    d[H2(e)] = n[H2(e)];
+                    for (int i = 1; i < estride; i++) {
+                        d[H2(e + i)] = m[H2(e + i)];
+                    }
+                }
+                for (; e < elements; e++) {
+                    d[H2(e)] = m[H2(e)];
+                }
+            }
+        }
+    }
+}
+
+void HELPER(sme2_sel_s)(void *vd, void *vn, void *vm,
+                        uint32_t png, uint32_t desc)
+{
+    int vl = simd_oprsz(desc);
+    int nreg = simd_data(desc);
+    int elements = vl / sizeof(uint32_t);
+    DecodeCounter p = decode_counter(png, vl, MO_32);
+
+    if (p.lg2_stride == 0) {
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint32_t *d = vd + r * sizeof(ARMVectorReg);
+                uint32_t *n = vn + r * sizeof(ARMVectorReg);
+                uint32_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, n, vl);  /* all true */
+                } else if (elements <= split) {
+                    memcpy(d, m, vl);  /* all false */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H4(e)] = m[H4(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H4(e)] = n[H4(e)];
+                    }
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint32_t *d = vd + r * sizeof(ARMVectorReg);
+                uint32_t *n = vn + r * sizeof(ARMVectorReg);
+                uint32_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+
+                if (split <= 0) {
+                    memcpy(d, m, vl);  /* all false */
+                } else if (elements <= split) {
+                    memcpy(d, n, vl);  /* all true */
+                } else {
+                    for (int e = 0; e < split; e++) {
+                        d[H4(e)] = n[H4(e)];
+                    }
+                    for (int e = split; e < elements; e++) {
+                        d[H4(e)] = m[H4(e)];
+                    }
+                }
+            }
+        }
+    } else {
+        /* p.esz must be MO_64, so stride must be 2. */
+        if (p.invert) {
+            for (int r = 0; r < nreg; r++) {
+                uint32_t *d = vd + r * sizeof(ARMVectorReg);
+                uint32_t *n = vn + r * sizeof(ARMVectorReg);
+                uint32_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e++) {
+                    d[H4(e)] = m[H4(e)];
+                }
+                for (; e < elements; e += 2) {
+                    d[H4(e)] = n[H4(e)];
+                    d[H4(e + 1)] = m[H4(e + 1)];
+                }
+            }
+        } else {
+            for (int r = 0; r < nreg; r++) {
+                uint32_t *d = vd + r * sizeof(ARMVectorReg);
+                uint32_t *n = vn + r * sizeof(ARMVectorReg);
+                uint32_t *m = vm + r * sizeof(ARMVectorReg);
+                int split = p.count - r * elements;
+                int e = 0;
+
+                for (; e < MIN(split, elements); e += 2) {
+                    d[H4(e)] = n[H4(e)];
+                    d[H4(e + 1)] = m[H4(e + 1)];
+                }
+                for (; e < elements; e++) {
+                    d[H4(e)] = m[H4(e)];
+                }
+            }
+        }
+    }
+}
+
+void HELPER(sme2_sel_d)(void *vd, void *vn, void *vm,
+                        uint32_t png, uint32_t desc)
+{
+    int vl = simd_oprsz(desc);
+    int nreg = simd_data(desc);
+    int elements = vl / sizeof(uint64_t);
+    DecodeCounter p = decode_counter(png, vl, MO_64);
+
+    if (p.invert) {
+        for (int r = 0; r < nreg; r++) {
+            uint64_t *d = vd + r * sizeof(ARMVectorReg);
+            uint64_t *n = vn + r * sizeof(ARMVectorReg);
+            uint64_t *m = vm + r * sizeof(ARMVectorReg);
+            int split = p.count - r * elements;
+
+            if (split <= 0) {
+                memcpy(d, n, vl);  /* all true */
+            } else if (elements <= split) {
+                memcpy(d, m, vl);  /* all false */
+            } else {
+                memcpy(d, m, split * sizeof(uint64_t));
+                memcpy(d + split, n + split,
+                       (elements - split) * sizeof(uint64_t));
+            }
+        }
+    } else {
+        for (int r = 0; r < nreg; r++) {
+            uint64_t *d = vd + r * sizeof(ARMVectorReg);
+            uint64_t *n = vn + r * sizeof(ARMVectorReg);
+            uint64_t *m = vm + r * sizeof(ARMVectorReg);
+            int split = p.count - r * elements;
+
+            if (split <= 0) {
+                memcpy(d, m, vl);  /* all false */
+            } else if (elements <= split) {
+                memcpy(d, n, vl);  /* all true */
+            } else {
+                memcpy(d, n, split * sizeof(uint64_t));
+                memcpy(d + split, m + split,
+                       (elements - split) * sizeof(uint64_t));
+            }
+        }
+    }
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b6316ac716..7407597177 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1642,3 +1642,34 @@ static gen_helper_gvec_3 * const uclamp_fns[] = {
     gen_helper_sme2_uclamp_d,
 };
 TRANS(UCLAMP, do_clamp, a, uclamp_fns)
+
+static bool trans_SEL(DisasContext *s, arg_SEL *a)
+{
+    typedef void sme_sel_fn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
+    static sme_sel_fn * const fns[4] = {
+        gen_helper_sme2_sel_b, gen_helper_sme2_sel_h,
+        gen_helper_sme2_sel_s, gen_helper_sme2_sel_d
+    };
+
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        uint32_t desc = simd_desc(svl, svl, a->n);
+        TCGv_ptr t_d = tcg_temp_new_ptr();
+        TCGv_ptr t_n = tcg_temp_new_ptr();
+        TCGv_ptr t_m = tcg_temp_new_ptr();
+        TCGv_i32 png = tcg_temp_new_i32();
+
+        tcg_gen_addi_ptr(t_d, tcg_env, vec_full_reg_offset(s, a->zd));
+        tcg_gen_addi_ptr(t_n, tcg_env, vec_full_reg_offset(s, a->zn));
+        tcg_gen_addi_ptr(t_m, tcg_env, vec_full_reg_offset(s, a->zm));
+
+        tcg_gen_ld16u_i32(png, tcg_env, pred_full_reg_offset(s, a->pg)
+                          ^ (HOST_BIG_ENDIAN ? 6 : 0));
+
+        fns[a->esz](t_d, t_n, t_m, png, tcg_constant_i32(desc));
+    }
+    return true;
+}
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index c4b85a36d0..0a2ceea8be 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -878,6 +878,15 @@ UCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 1    \
 UCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 1    \
                 &zzz_en zd=%zd_ax4 n=4
 
+### SME2 Multi-vector SVE Select
+
+%sel_pg         10:3 !function=plus_8
+
+SEL             11000001 esz:2 1 ....0 100 ... ....0 ....0  \
+                n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2 pg=%sel_pg
+SEL             11000001 esz:2 1 ...01 100 ... ...00 ...00  \
+                n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4 pg=%sel_pg
+
 ### SME Multiple Zero
 
 &zero_za        rv off ngrp nvec
-- 
2.43.0

