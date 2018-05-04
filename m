Received: by 10.28.4.212 with SMTP id 203csp334085wme;
        Fri, 4 May 2018 11:31:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpFIuRQ4HKEHIc1GsIzsolcPeEku3w3tpeWBoKEi8SmTLdXGc0UnXOCMVjd2eXEj0/pj+yz
X-Received: by 10.55.33.16 with SMTP id h16mr22397776qkh.417.1525458667928;
        Fri, 04 May 2018 11:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458667; cv=none;
        d=google.com; s=arc-20160816;
        b=f6O2gu8HC0oQ2Ntz8HSjB2xvS/tVAqOXJB7BFAEO8Bgsxia98k2ogxNDoUQ0fLWlWM
         CMzCWQxCp9MnNLB0Adzax6uurjQp/rfAQseboExHrgHzNEPMSvgba+cMHns49VF3OY50
         lVGB6hKfLLmPESFaHD8QQ74mkwuEnNcniMvG+ZhuRZtTEJO9I9e+BzIGV0880p9imo3R
         PuQAUzJc3XhlQYxrFjwwdP1NwPchzCcT4rGWNxLTZivt2R9xAexdyY08cm2GmInt20DF
         87jMdNSCV9Ttc1jv7djlSnAc1g1ZE1CMNjdbkw1S+KKYrgOM4s3dwoZuiUTgxpCoASa9
         9e+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pX83ru2E3i1FHrQMTmbujCaU3VeAorJ2wf0oyrpNImg=;
        b=F6863pU818LkIoT2Ji7Ppui3VJmJjiZNGyyGDnDH4LsK4M6evUlEZhGF/oQAwx3o2t
         PKx/CGbk7J9d55JbV+7lIZuMOFdE6K44za2bV4gkc5fBcLLfeRKgkmT3v8EWxciQRz9C
         78VNlXBwPN0XgeXOAX7EYLLT6ZnwTsb6/CbXo080pd2tTnJLRlMvp9uxZ8esn0ZLUSjh
         tuQ2AB4uDMmmxeqy1dl+YIAiHpU1lKxKrAsAIlPgVCKkqSGdyyd/UdwQFxp2709qk1CD
         fLxneDseRWTELevkIxkOarvWgkBsNRhYHWsOZIzTIwttUB8MZWGWE6ii+YRiHUnrfiWW
         8wFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvleDs3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z26si10516192qki.263.2018.05.04.11.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CvleDs3g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfU3-0007mO-A6
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:31:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTU-0007VX-KF
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTT-000186-P1
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:32 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTT-00017X-JR
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:31 -0400
Received: by mail-pf0-x243.google.com with SMTP id v63so18061944pfk.8
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pX83ru2E3i1FHrQMTmbujCaU3VeAorJ2wf0oyrpNImg=;
	b=CvleDs3g8JmKMkxfP3OtTB94Ww3Rb//Oj1uizsTVgfVz3l0TASH5EAsw22/6gcoci4
	9O+e4G1ftvzA4FeHmW8CoifbclTWsDKZGajIaeVt/ZT4Uvbv1oFZp+v/mMi+A1pqCOft
	MkaO4aJxfKT+n5GZfvQDKIFDPMSxxV3tPdmdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pX83ru2E3i1FHrQMTmbujCaU3VeAorJ2wf0oyrpNImg=;
	b=iD1+8UF7bLDEBiZfbhZ6l7KPlGT/b3mcLklYbXY2NcPzEf1lWqn3XsiPy4PtAs+RR/
	5Fm0oBffJZnR/2ekYcYAVSgb8nB1WDCaenkL22e/xp+fecX0IpbBftZiQgIQNDOXnW0T
	pfWaylSxawG1c2w52Lgyhy74DFqmM3tnukL3fZkFNgneDWJypl/ekF7dUcfynPkyyJ00
	VytHLGOUm2nRGskHMcAPhTp+27I9gyBf2dQTS+jUMc4m+G6tZLyK0c6YLV4Nm7Bk0b5k
	915xFHBDpn4n9044yY61uGAD+9Cv7ioJE8lwW4V++lEZEoslCTHCOUVFIwBXp1K3K1/R
	omcw==
X-Gm-Message-State: ALQs6tB0VgQ6dU9e9KJMkrvSuisBWuX5pXnnrMj+2BcUMYZCYmqAlNYG
	7BIHIvhlI+wPzEp/Qi6r5IbeBg==
X-Received: by 2002:a17:902:9a9:: with SMTP id
	38-v6mr29290044pln.114.1525458630724; 
	Fri, 04 May 2018 11:30:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:16 -0700
Message-Id: <20180504183021.19318-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v2 05/10] tcg: Use GEN_ATOMIC_HELPER_FN for
 opposite endian atomic add
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5XyjGhG1SQn

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 49 +++++++--------------------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 2489dd3ec1..3f41ef2782 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -229,48 +229,6 @@ GEN_ATOMIC_HELPER(xor_fetch)
 
 #undef GEN_ATOMIC_HELPER
 
-/* Note that for addition, we need to use a separate cmpxchg loop instead
-   of bswaps for the reverse-host-endian helpers.  */
-ABI_TYPE ATOMIC_NAME(fetch_add)(CPUArchState *env, target_ulong addr,
-                         ABI_TYPE val EXTRA_ARGS)
-{
-    ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
-    DATA_TYPE ldo, ldn, ret, sto;
-
-    ldo = atomic_read__nocheck(haddr);
-    while (1) {
-        ret = BSWAP(ldo);
-        sto = BSWAP(ret + val);
-        ldn = atomic_cmpxchg__nocheck(haddr, ldo, sto);
-        if (ldn == ldo) {
-            ATOMIC_MMU_CLEANUP;
-            return ret;
-        }
-        ldo = ldn;
-    }
-}
-
-ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
-                         ABI_TYPE val EXTRA_ARGS)
-{
-    ATOMIC_MMU_DECLS;
-    DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;
-    DATA_TYPE ldo, ldn, ret, sto;
-
-    ldo = atomic_read__nocheck(haddr);
-    while (1) {
-        ret = BSWAP(ldo) + val;
-        sto = BSWAP(ret);
-        ldn = atomic_cmpxchg__nocheck(haddr, ldo, sto);
-        if (ldn == ldo) {
-            ATOMIC_MMU_CLEANUP;
-            return ret;
-        }
-        ldo = ldn;
-    }
-}
-
 /* These helpers are, as a whole, full barriers.  Within the helper,
  * the leading barrier is explicit and the trailing barrier is within
  * cmpxchg primitive.
@@ -302,6 +260,13 @@ GEN_ATOMIC_HELPER_FN(umin_fetch, MIN,  DATA_TYPE, new)
 GEN_ATOMIC_HELPER_FN(smax_fetch, MAX, SDATA_TYPE, new)
 GEN_ATOMIC_HELPER_FN(umax_fetch, MAX,  DATA_TYPE, new)
 
+/* Note that for addition, we need to use a separate cmpxchg loop instead
+   of bswaps for the reverse-host-endian helpers.  */
+#define ADD(X, Y)   (X + Y)
+GEN_ATOMIC_HELPER_FN(fetch_add, ADD, DATA_TYPE, old)
+GEN_ATOMIC_HELPER_FN(add_fetch, ADD, DATA_TYPE, new)
+#undef ADD
+
 #undef GEN_ATOMIC_HELPER_FN
 #endif /* DATA_SIZE >= 16 */
 
-- 
2.14.3

