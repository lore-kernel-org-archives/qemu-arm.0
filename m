Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276577ejb;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4I1VyvqKEgTnY2NwWmKnH4FbGypByFPviWcIGbFoSpdERwV2cGZP3gSI4gOK2AH6aBzwOU
X-Received: by 2002:ad4:5967:0:b0:5e0:ad80:6846 with SMTP id eq7-20020ad45967000000b005e0ad806846mr10235885qvb.0.1684600144083;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600144; cv=none;
        d=google.com; s=arc-20160816;
        b=xmvQcvNxWw1aCW/pT3NayAwpBJLQmwV9s8efpFpYTf2Lbfp7StRFl+R2aEbR2Vs1B5
         9NgoUr4AK1vfZRPyrUNAYONKpty058aiTLtLYeAxWrGSxdJOMtl6A1ODRqVLf4b+hdBF
         OK89jwn4bxcZFKf4lHOV688Q9zely6JCrdzuONoItnO56bae41lXceUtUwV2gDaMV4me
         aO2Ty6x4xEZfrZZ6nZG4av0pnI4jhfqtKHKbwOmvs0VMX/M0Q3BTkXJF/KojOurUKuS5
         +iXlVT3qX1q7273bMGn21d5UuN+0xnV9e62Fh3Q0cW//wyuC0z6F7BkKV6//fjVuicsC
         cOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TCEmCa6svz6iI89FPgua0fOjkJEldQJYp9iT0pK2PQY=;
        b=WwOvGmgCUxk4FZoJIVMIm+Ua88BXtroZs0H4lV074lReQfG2BsQpYIi6yuTMd3I2ZY
         aaD07fl3RSHQRIzX79Comc4ZaOdjoQR654l8XbQA1iVufbHVLxxKZ0Zf4Kvyh9XsY7qa
         mxQKK2W3gca4JvZwor6tXk3l7wcE1+DfhWl536VQaLzemsHZITTMkVEOmzG2+7U64wuU
         zUbKarsFPGWlYHE360fx5TM1dz00goZMuHftW/Lkv/Gow3IZ8CycjpC+Fcbd+jSLS/0R
         RaNtt55+qNbrqTmUshx3kzpjuWlQj21H8F51hyv3M5nnEP2hwqpmMh6BWe6JWLgznYP2
         NHog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3C5W9l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im10-20020a056214246a00b0061964c0b8ddsi934991qvb.12.2023.05.20.09.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3C5W9l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PPr-0003bA-8B; Sat, 20 May 2023 12:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPp-0003ZL-3D
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:45 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPm-00035c-QB
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:44 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a516fb6523so40842045ad.3
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600001; x=1687192001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCEmCa6svz6iI89FPgua0fOjkJEldQJYp9iT0pK2PQY=;
 b=S3C5W9l29tHbB0CbIR/XyPKetPQ5zqRW++q9amRBFfI0RpOpWpOxN3oriGV5TJUupa
 nku9WoZdEuvtS/aKLoVKUEIu/AOiYzP+DYyUbPlhFCJITGWhZzYR5exxi3lhUyTBQOLI
 F/TP6QY9D2o3OejOXMX/j+p2wD2u1DhvmkjY3n8Xo3KnrFA40YQffqJrrcAxx5uss3JL
 LvpwrwUbFn83J4Q2fG7Hst/eIF/pGoUeSEblNXcbsRNSNeiohbk5rFt/njT4Ay7PeNQf
 FXG3irN/2rtsWr4S8u1yp1qpS8OamwYsD2ddUb7W+ZDOTpV75qUuGQBFfnuzoUWsdxIw
 Mrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600001; x=1687192001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCEmCa6svz6iI89FPgua0fOjkJEldQJYp9iT0pK2PQY=;
 b=Py5cYAHZoNwpGiMoFaKJB+HhjkCIsJqshc2NL2I/5w3aMxS5lJUgJmx729CBr9KiLD
 a7z2KQGvDHeQc69v9MhQQgyccIpJ2ITSpjyN6svSYaUt4Q4Mit3rfWVnAN6L2PbnraVO
 A5ASYXPZcfWaxSjpGQYzX06hBqUSWrH1OgOHDbbuJpbdsqM7ZFzTkiZpJKxVWqjKyMav
 lOWwXy851yLcSEzz0DCEYRkSDn+8qmeSfkv9cZL6eZkX5mjFhDaWScoOID+6aswdA2WI
 tpyfRl7c2FrI3Tbaw5qJvu2W5xF3T85SRRVLyDAv36M3ZiXNSTF3xhPtAaK7CA6PhnrH
 yI4g==
X-Gm-Message-State: AC+VfDwCEI3rgMn2wF/REkmjdyExy1/+Qbby88mShFKjUhLY1qAxhHE0
 7FUVEFIYNdbuvkU+95iUpsNp2A==
X-Received: by 2002:a17:903:25ce:b0:1ac:797b:8cf6 with SMTP id
 jc14-20020a17090325ce00b001ac797b8cf6mr5911958plb.69.1684600001507; 
 Sat, 20 May 2023 09:26:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH 06/27] migration/xbzrle: Shuffle function order
Date: Sat, 20 May 2023 09:26:13 -0700
Message-Id: <20230520162634.3991009-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Yigpgz1eX5SD

Place the CONFIG_AVX512BW_OPT block at the top,
which will aid function selection in the next patch.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 migration/xbzrle.c | 244 ++++++++++++++++++++++-----------------------
 1 file changed, 122 insertions(+), 122 deletions(-)

diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 258e4959c9..751b5428f7 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -15,6 +15,128 @@
 #include "qemu/host-utils.h"
 #include "xbzrle.h"
 
+#if defined(CONFIG_AVX512BW_OPT)
+#include <immintrin.h>
+
+int __attribute__((target("avx512bw")))
+xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                            uint8_t *dst, int dlen)
+{
+    uint32_t zrun_len = 0, nzrun_len = 0;
+    int d = 0, i = 0, num = 0;
+    uint8_t *nzrun_start = NULL;
+    /* add 1 to include residual part in main loop */
+    uint32_t count512s = (slen >> 6) + 1;
+    /* countResidual is tail of data, i.e., countResidual = slen % 64 */
+    uint32_t count_residual = slen & 0b111111;
+    bool never_same = true;
+    uint64_t mask_residual = 1;
+    mask_residual <<= count_residual;
+    mask_residual -= 1;
+    __m512i r = _mm512_set1_epi32(0);
+
+    while (count512s) {
+        int bytes_to_check = 64;
+        uint64_t mask = 0xffffffffffffffff;
+        if (count512s == 1) {
+            bytes_to_check = count_residual;
+            mask = mask_residual;
+        }
+        __m512i old_data = _mm512_mask_loadu_epi8(r,
+                                                  mask, old_buf + i);
+        __m512i new_data = _mm512_mask_loadu_epi8(r,
+                                                  mask, new_buf + i);
+        uint64_t comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+        count512s--;
+
+        bool is_same = (comp & 0x1);
+        while (bytes_to_check) {
+            if (d + 2 > dlen) {
+                return -1;
+            }
+            if (is_same) {
+                if (nzrun_len) {
+                    d += uleb128_encode_small(dst + d, nzrun_len);
+                    if (d + nzrun_len > dlen) {
+                        return -1;
+                    }
+                    nzrun_start = new_buf + i - nzrun_len;
+                    memcpy(dst + d, nzrun_start, nzrun_len);
+                    d += nzrun_len;
+                    nzrun_len = 0;
+                }
+                /* 64 data at a time for speed */
+                if (count512s && (comp == 0xffffffffffffffff)) {
+                    i += 64;
+                    zrun_len += 64;
+                    break;
+                }
+                never_same = false;
+                num = ctz64(~comp);
+                num = (num < bytes_to_check) ? num : bytes_to_check;
+                zrun_len += num;
+                bytes_to_check -= num;
+                comp >>= num;
+                i += num;
+                if (bytes_to_check) {
+                    /* still has different data after same data */
+                    d += uleb128_encode_small(dst + d, zrun_len);
+                    zrun_len = 0;
+                } else {
+                    break;
+                }
+            }
+            if (never_same || zrun_len) {
+                /*
+                 * never_same only acts if
+                 * data begins with diff in first count512s
+                 */
+                d += uleb128_encode_small(dst + d, zrun_len);
+                zrun_len = 0;
+                never_same = false;
+            }
+            /* has diff, 64 data at a time for speed */
+            if ((bytes_to_check == 64) && (comp == 0x0)) {
+                i += 64;
+                nzrun_len += 64;
+                break;
+            }
+            num = ctz64(comp);
+            num = (num < bytes_to_check) ? num : bytes_to_check;
+            nzrun_len += num;
+            bytes_to_check -= num;
+            comp >>= num;
+            i += num;
+            if (bytes_to_check) {
+                /* mask like 111000 */
+                d += uleb128_encode_small(dst + d, nzrun_len);
+                /* overflow */
+                if (d + nzrun_len > dlen) {
+                    return -1;
+                }
+                nzrun_start = new_buf + i - nzrun_len;
+                memcpy(dst + d, nzrun_start, nzrun_len);
+                d += nzrun_len;
+                nzrun_len = 0;
+                is_same = true;
+            }
+        }
+    }
+
+    if (nzrun_len != 0) {
+        d += uleb128_encode_small(dst + d, nzrun_len);
+        /* overflow */
+        if (d + nzrun_len > dlen) {
+            return -1;
+        }
+        nzrun_start = new_buf + i - nzrun_len;
+        memcpy(dst + d, nzrun_start, nzrun_len);
+        d += nzrun_len;
+    }
+    return d;
+}
+#endif
+
 /*
   page = zrun nzrun
        | zrun nzrun page
@@ -175,125 +297,3 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 
     return d;
 }
-
-#if defined(CONFIG_AVX512BW_OPT)
-#include <immintrin.h>
-
-int __attribute__((target("avx512bw")))
-xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
-                            uint8_t *dst, int dlen)
-{
-    uint32_t zrun_len = 0, nzrun_len = 0;
-    int d = 0, i = 0, num = 0;
-    uint8_t *nzrun_start = NULL;
-    /* add 1 to include residual part in main loop */
-    uint32_t count512s = (slen >> 6) + 1;
-    /* countResidual is tail of data, i.e., countResidual = slen % 64 */
-    uint32_t count_residual = slen & 0b111111;
-    bool never_same = true;
-    uint64_t mask_residual = 1;
-    mask_residual <<= count_residual;
-    mask_residual -= 1;
-    __m512i r = _mm512_set1_epi32(0);
-
-    while (count512s) {
-        int bytes_to_check = 64;
-        uint64_t mask = 0xffffffffffffffff;
-        if (count512s == 1) {
-            bytes_to_check = count_residual;
-            mask = mask_residual;
-        }
-        __m512i old_data = _mm512_mask_loadu_epi8(r,
-                                                  mask, old_buf + i);
-        __m512i new_data = _mm512_mask_loadu_epi8(r,
-                                                  mask, new_buf + i);
-        uint64_t comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
-        count512s--;
-
-        bool is_same = (comp & 0x1);
-        while (bytes_to_check) {
-            if (d + 2 > dlen) {
-                return -1;
-            }
-            if (is_same) {
-                if (nzrun_len) {
-                    d += uleb128_encode_small(dst + d, nzrun_len);
-                    if (d + nzrun_len > dlen) {
-                        return -1;
-                    }
-                    nzrun_start = new_buf + i - nzrun_len;
-                    memcpy(dst + d, nzrun_start, nzrun_len);
-                    d += nzrun_len;
-                    nzrun_len = 0;
-                }
-                /* 64 data at a time for speed */
-                if (count512s && (comp == 0xffffffffffffffff)) {
-                    i += 64;
-                    zrun_len += 64;
-                    break;
-                }
-                never_same = false;
-                num = ctz64(~comp);
-                num = (num < bytes_to_check) ? num : bytes_to_check;
-                zrun_len += num;
-                bytes_to_check -= num;
-                comp >>= num;
-                i += num;
-                if (bytes_to_check) {
-                    /* still has different data after same data */
-                    d += uleb128_encode_small(dst + d, zrun_len);
-                    zrun_len = 0;
-                } else {
-                    break;
-                }
-            }
-            if (never_same || zrun_len) {
-                /*
-                 * never_same only acts if
-                 * data begins with diff in first count512s
-                 */
-                d += uleb128_encode_small(dst + d, zrun_len);
-                zrun_len = 0;
-                never_same = false;
-            }
-            /* has diff, 64 data at a time for speed */
-            if ((bytes_to_check == 64) && (comp == 0x0)) {
-                i += 64;
-                nzrun_len += 64;
-                break;
-            }
-            num = ctz64(comp);
-            num = (num < bytes_to_check) ? num : bytes_to_check;
-            nzrun_len += num;
-            bytes_to_check -= num;
-            comp >>= num;
-            i += num;
-            if (bytes_to_check) {
-                /* mask like 111000 */
-                d += uleb128_encode_small(dst + d, nzrun_len);
-                /* overflow */
-                if (d + nzrun_len > dlen) {
-                    return -1;
-                }
-                nzrun_start = new_buf + i - nzrun_len;
-                memcpy(dst + d, nzrun_start, nzrun_len);
-                d += nzrun_len;
-                nzrun_len = 0;
-                is_same = true;
-            }
-        }
-    }
-
-    if (nzrun_len != 0) {
-        d += uleb128_encode_small(dst + d, nzrun_len);
-        /* overflow */
-        if (d + nzrun_len > dlen) {
-            return -1;
-        }
-        nzrun_start = new_buf + i - nzrun_len;
-        memcpy(dst + d, nzrun_start, nzrun_len);
-        d += nzrun_len;
-    }
-    return d;
-}
-#endif
-- 
2.34.1

