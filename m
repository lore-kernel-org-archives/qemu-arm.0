Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1033690wrq;
        Wed, 23 Oct 2019 08:23:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv0g4lVVzk7VNXLLjzujoX+0qJk3wzO8txwoYj/q3FvI2/JgWv+AKCzJEgnajjlfRGXc3N
X-Received: by 2002:a17:906:2319:: with SMTP id l25mr33485189eja.309.1571844184570;
        Wed, 23 Oct 2019 08:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844184; cv=none;
        d=google.com; s=arc-20160816;
        b=boA5tqikRHhtOz/k8QBv665vokMZf+Sy3ggMdtnsjGu2CZ83dFnEKCq6Hw/auaXu2X
         lmbS8TNS0/ape2q9yD6DSBRQY20IComh1kzhcSuzcV7/0gJowByuZdpkszLlTJzmu83D
         Zt6vrcQ/mtOpLUYsLrJ8Sye/RiMJWmVwN2BtoddHzRZpnEucoXX5xtc6IeJxv40YX+Jt
         O8AH6cV2Eoojo9IBxBhW3DS6VE1J/TLlAvkdwUeZNLWwdtcVq0FEJnJz0ax6nhBjSbkp
         SewQ+cSXMNN34NP1OcNPg9Yl8qi2m/9K68WD2n4tLo4aZQpNZq6ZL4um4hw3Q3HuhiWs
         7+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+w+DpqTaqyThsFD3h0g6qTaqlae+kRMVgywC4mwAkDA=;
        b=JYybcZuQxsZ9Gd3Frr2Wjr0jluUk6Xhn60uZMkfP9lNvbpfaml7QtBxjJHuDPgi0FH
         TNqt7GPtg60U+wQ182Mf8x01Fu3gapP5q9moOWGV3TFF4OQyYPoF4uUdjDVmEjs2+S7Q
         Q1WEnrY139lYR2YNH0s7RQMJyaO/WNnDyjEPATtaf8Zt5VXs1/7gJb7Iz/87CSdrWlFi
         +sHMHwe+r3qClHgM2tLl2lwq8rDk10Hw+i9HYC4e/wYGwEgFoYNq9jdsRcTfrA2bKByi
         ovA6HTghW0HHfTE6K0Hi4cnwu/gcL1HldDDwagMxy1g6LAwma/fNN5QFy1yMoDL/xF72
         dH5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tnqnVCH/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f37si3822731ede.11.2019.10.23.08.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tnqnVCH/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNITX-00089M-F0
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8u-000897-15
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001FO-BG
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:43 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:44401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-00014g-3T
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qt1-x842.google.com with SMTP id z22so12215931qtq.11
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+w+DpqTaqyThsFD3h0g6qTaqlae+kRMVgywC4mwAkDA=;
 b=tnqnVCH/71/mrfaS0bcMDWr06WHHWLbRbkKUHXp/nAueUslzhqQ0NwfEE0F1M56+kq
 gYX1meHPZKyM23Qo/XT0jI+I14W7cfHxL7sK6cIkR8vY/fMIy+1xQicWP+AG+UwgValm
 NrbTS6WOHNZZIiBykpTj3IN1bb7m14dy9k1nMaX9mw8uBNIDEywxHS8JQw5CTeliZ+2d
 Etl6kQdEGr935xJIkYvaM4GZiDQX4m1rB/bZWEE/kH2Ws0fI31oXsdQOM1sSFiybAiW3
 vhOSQ5424NdLolQlmBlVUfTtMDTLwZQ3uuZJ8To8BlchaBkcyxJvlF0+UKI5qqoze6HK
 +MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+w+DpqTaqyThsFD3h0g6qTaqlae+kRMVgywC4mwAkDA=;
 b=lqhExIn/7FhCuAOrqRfUOv6CbE8hUHSGws+u5AZcgazv6mtR/UND6nH0yp8iGMoxeC
 j4ocCnCgUzqTEFucf5BtYOX2P8Ic9fs1VLfxNurllnCKh4ySHsP40VonR0in5wiUNF4j
 cBvCYbrUl/zF8gKQcrNa2gFKFYpKPqK9kCDN/6Oc7Liylz/vCTmNtwCvRXgrz5nPfe1y
 9oVkJ1sPM9YLeXJyNYAycffrZF1iXDDkpRUq50TTn5QEu6y2BDpeieACamZlA9BV5u1R
 OuvmDnjnqUF4jxcNM2cAPF15zb5RhLULdNOOBVZm/fYzU1j7Zk0tWU+7hyd+e96/glC4
 tlNA==
X-Gm-Message-State: APjAAAUDyJqyHv1d9x1aIm7kMGxKc1YDF+F3xyMPmWJs6wj7no317pfm
 pQHwnOV3iA0IzBe7qpIIVn2c+EqU+6E=
X-Received: by 2002:ac8:664b:: with SMTP id j11mr9706105qtp.137.1571842874422; 
 Wed, 23 Oct 2019 08:01:14 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/24] target/arm: Hoist XSCALE_CPAR, VECLEN,
 VECSTRIDE in cpu_get_tb_cpu_state
Date: Wed, 23 Oct 2019 11:00:42 -0400
Message-Id: <20191023150057.25731-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hv4ibZT+WA4k

We do not need to compute any of these values for M-profile.
Further, XSCALE_CPAR overlaps VECSTRIDE so obviously the two
sets must be mutually exclusive.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ddd21edfcf..e2a62cf19a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11235,21 +11235,28 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         } else {
             flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+
+            /*
+             * Note that XSCALE_CPAR shares bits with VECSTRIDE.
+             * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
+             */
+            if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32,
+                                   XSCALE_CPAR, env->cp15.c15_cpar);
+            } else {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN,
+                                   env->vfp.vec_len);
+                flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
+                                   env->vfp.vec_stride);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
-        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
-        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32,
-                               XSCALE_CPAR, env->cp15.c15_cpar);
-        }
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1

