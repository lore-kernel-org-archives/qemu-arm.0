Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3738999dye;
        Wed, 2 Jul 2025 04:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTtP7Z7tTz3rmRapfH9Xj9ZrTIdpzds985dtyD2s2CroNLXYr9ss3IwxStU+gmJN8QAYHljcbfQkfyoA==@linaro.org
X-Google-Smtp-Source: AGHT+IFqzvgoABfmP5YWFXxfWcRIOMjI/o/AAKYlTEcXLk0jDrCh+bXHArAuMChtzi1wxyrwSB/w
X-Received: by 2002:a05:620a:178f:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d5c473ebcamr406737785a.22.1751455305509;
        Wed, 02 Jul 2025 04:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455305; cv=none;
        d=google.com; s=arc-20240605;
        b=T6GTU+UPts3Gqib3n+4Pu4w7wHq5KOZ/h/K1El0ErPtAQIUu4F+pC3vCp+FIpmOMeM
         N3rljvmiqSUFTIZ9JAuGSUwBjpWlPUAL6xcXEAz5QJKHwDHAyQG+lvsGzwiLqACmEx0M
         zGIADlY2Ss0gTL0vNZIbnOiTyP3zlungq+RpCxibPcIakywX3qKowfioLS6q7Elyz8aw
         VmB+WZrTSYSYuLeWBJRl0MfB9bWtHQdUc8JiYVwcccr5kyFdWXdq8UeMJIVbSnUSukcM
         hb7SWFrglW+Y7dkIpzA6ipyo1q5mBiMqnZ8Na1AHSsDZ5K1+lCsdwZZUqLKreOJ15Fl7
         HgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3J4Bv1vpjzwpdZe6XYejX5dLNpz+G5brIjasw5lYx80=;
        fh=jl6eTuMToTy5EqMewCWwPg91mnGDKj6bvyn0gs3zaHQ=;
        b=fkzNKumCjB8rSgYDW+xvXRmEsrIrhHuCyRqnxXpDuIjbOTdFlfOUM0DO66r7DQWZ6x
         38Ks2OFkfI5BTBCxNvebFCeCgnwQV8CrcnmWjM6YtDjyROjhEbXeyv1QbGf4m25ZOa+2
         fv+0RS4O08qNeD19ohPOe43JT4WKM9+IFPXYzPUThGDUpw6pz/IIdTxNOT/cFV8/dLhE
         G+M8avu9xbelWm4tctIZRkTRMaiZoGFh9/E3zUQsQ/6eU7sNbIB7EM5rYvvJ2HqKHmCf
         EofGTEtyiy3+oZZJxEBSayQ9m1DISTKnu8XXAHc7LiGLoS/Vm5xpbtFLWbKlS3KU6GKV
         DEig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iffLnyAR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443225881si1178086885a.255.2025.07.02.04.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iffLnyAR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWvVn-0007Zt-EN; Wed, 02 Jul 2025 07:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVl-0007Yz-Vv; Wed, 02 Jul 2025 07:20:22 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVj-0002Lc-KH; Wed, 02 Jul 2025 07:20:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b0b2d0b2843so5681153a12.2; 
 Wed, 02 Jul 2025 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455216; x=1752060016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3J4Bv1vpjzwpdZe6XYejX5dLNpz+G5brIjasw5lYx80=;
 b=iffLnyARVCGKfoPtEZ4AZ+UQEmXaK7jCLfHnP5zBkllvhBoPHcC7OoCg2tHQuoHhST
 jXWUgh8mrbuSrWjDwYv79pWEZ1i61/hCyusXZk8+g9ekbU/nm2oJqY8DBKI4LrWkCn/S
 2bw8qADvmHWWA9DFbcq4p28YhtRk7lhYtvOrOtaT+a61TNWQRs2zGsth2RGFeJ1mkEw/
 i1qLLmrRuaGWFl+xP/h4TuaZ58tAkDqs6KkLAHMmYTzoMHv5oEneam7B53tdNJGc+w7w
 bv2nsmh+aCk9w01LEbREMqQyW3ppknLJUaF4xoHeX9sVzsoYNkUap2+W0T6aeNw7qxzV
 8UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455216; x=1752060016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3J4Bv1vpjzwpdZe6XYejX5dLNpz+G5brIjasw5lYx80=;
 b=vAXdlsj86hv2ItuOF+MNE0OloGJ466NPjVcjn5kjFl/eM/ZWu1a07NE8dVDhzo1xs2
 IiAINgg8zfgDVwCuE5+Tg+lVqgCr4isWgNp0QXXtVQCiX40y6AWFu9pQh8ML4gEWlFCj
 yytT3zdiYulaWw5NLtAfu9xF00CxfQR7modjNWyCGl+EGdxCxDW13qUyEoidqvr1MuI+
 43fxfNxzGeIKzfWmKRMTdTWRmKukST5aYdfB46IPYDHL6ogWXbJMbHQ69tFFN/W8ezHd
 BrS0pdrOWYwpX40d5lo8NPm7Osip4Ohm/LET5IyJ/Cns8iaPiomANpDEhUA/60MlYD9L
 2QcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPtQgCPYtuIydNC/KS4mIZopG7UCSC5bI7H2zSvxFChypFmFp9ZIE4PxOjyIIwqrDYkSQyLAKKyQ==@nongnu.org
X-Gm-Message-State: AOJu0YyMak1293ZRxUU4CEzqVJvxbGdldvq6gXmcFKT18IY5mippuyJt
 NIZiHM3zb7fwowRifq6qVZ1dWzZyy9CbUjxhFrTrY6w6Zj2y1bECGuvddhDW8l6pKdE=
X-Gm-Gg: ASbGnct2bNM/bhkAL23SHpR9fjsYd+j9jSjjpPepZgur6YzQ7fO0W2yx5llwLxW/Bne
 EuElZGX0N+DjHf014m75HNApKo+A5fGmjN9ZEvJ/Jca5MMBVAXpU8MI3ZCPf88vcwpTSsL16w7i
 EeCt2yqVuu+jIh1R2HqKJpOL66C9Nm+ScvMhft1FK9LvgSVlEabs6Lw5aSMG14CVwop5xXE+ZRf
 mn+cRZmc3majQliZto6uIPC7mLeSQfEAWBUiRVdoIq9FzFsWZMAFYKrw65CoipKBjRCSTe7Q85S
 QdIvq+oFHwr/iza2WgG0NcDFWYMe2VkiuIZATpi9GBzc2OCkPXrw63WfcwwmtRHa3rU+hSTv34T
 jI2tkIFBaEwpfyX1zy9/6SgXD3OreUvNRvGsxEBgpjPg=
X-Received: by 2002:a17:90b:33c4:b0:316:d69d:49fb with SMTP id
 98e67ed59e1d1-31a90b3d073mr4734170a91.14.1751455215922; 
 Wed, 02 Jul 2025 04:20:15 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b34e320fc3bsm11469354a12.75.2025.07.02.04.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:15 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 04/12] target/arm: Fix VLDR helper load alignment checks
Date: Wed,  2 Jul 2025 20:49:46 +0930
Message-ID: <20250702111954.128563-5-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: FAu2/e+FuYZF

This patch adds alignment checks in the load operations in the VLDR
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 506d1c3475..1db626bb26 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -148,13 +148,15 @@ static void mve_advance_vpt(CPUARMState *env)
 }
 
 /* For loads, predicated lanes are zeroed instead of keeping their old values */
-#define DO_VLDR(OP, MSIZE, LDTYPE, ESIZE, TYPE)                         \
+#define DO_VLDR(OP, MFLAG, MSIZE, MTYPE, LDTYPE, ESIZE, TYPE)           \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
     {                                                                   \
         TYPE *d = vd;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MFLAG | MO_ALIGN, mmu_idx);        \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
          * beats so we don't care if we update part of the dest and     \
@@ -163,7 +165,7 @@ static void mve_advance_vpt(CPUARMState *env)
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
             if (eci_mask & (1 << b)) {                                  \
                 d[H##ESIZE(e)] = (mask & (1 << b)) ?                    \
-                    cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;     \
+                    (MTYPE)cpu_##LDTYPE##_mmu(env, addr, oi, GETPC()) : 0;\
             }                                                           \
             addr += MSIZE;                                              \
         }                                                               \
@@ -185,20 +187,20 @@ static void mve_advance_vpt(CPUARMState *env)
         mve_advance_vpt(env);                                           \
     }
 
-DO_VLDR(vldrb, 1, ldub, 1, uint8_t)
-DO_VLDR(vldrh, 2, lduw, 2, uint16_t)
-DO_VLDR(vldrw, 4, ldl, 4, uint32_t)
+DO_VLDR(vldrb, MO_UB, 1, uint8_t, ldb, 1, uint8_t)
+DO_VLDR(vldrh, MO_TEUW, 2, uint16_t, ldw, 2, uint16_t)
+DO_VLDR(vldrw, MO_TEUL, 4, uint32_t, ldl, 4, uint32_t)
 
 DO_VSTR(vstrb, 1, stb, 1, uint8_t)
 DO_VSTR(vstrh, 2, stw, 2, uint16_t)
 DO_VSTR(vstrw, 4, stl, 4, uint32_t)
 
-DO_VLDR(vldrb_sh, 1, ldsb, 2, int16_t)
-DO_VLDR(vldrb_sw, 1, ldsb, 4, int32_t)
-DO_VLDR(vldrb_uh, 1, ldub, 2, uint16_t)
-DO_VLDR(vldrb_uw, 1, ldub, 4, uint32_t)
-DO_VLDR(vldrh_sw, 2, ldsw, 4, int32_t)
-DO_VLDR(vldrh_uw, 2, lduw, 4, uint32_t)
+DO_VLDR(vldrb_sh, MO_UB, 1, int8_t, ldb, 2, int16_t)
+DO_VLDR(vldrb_sw, MO_UB, 1, int8_t, ldb, 4, int32_t)
+DO_VLDR(vldrb_uh, MO_UB, 1, uint8_t, ldb, 2, uint16_t)
+DO_VLDR(vldrb_uw, MO_UB, 1, uint8_t, ldb, 4, uint32_t)
+DO_VLDR(vldrh_sw, MO_TEUW, 2, int16_t, ldw, 4, int32_t)
+DO_VLDR(vldrh_uw, MO_TEUW, 2, uint16_t, ldw, 4, uint32_t)
 
 DO_VSTR(vstrb_h, 1, stb, 2, int16_t)
 DO_VSTR(vstrb_w, 1, stb, 4, int32_t)
-- 
2.48.1

