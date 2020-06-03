Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp36265lfc;
        Tue, 2 Jun 2020 18:23:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK5jfTaFW14cRQfs356grfm1XNcilqsBMvBBF8qVAXXTwf36bwnp0rvdHkHVsz8ddPra4t
X-Received: by 2002:a25:da96:: with SMTP id n144mr45956215ybf.291.1591147404430;
        Tue, 02 Jun 2020 18:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147404; cv=none;
        d=google.com; s=arc-20160816;
        b=n2doxyTB9OVujXUyXtEukXZVihhgE0iP59vLcx2RVzo25pixyoUE9e1IzuF6DdMKbW
         hHax+T4X+3JDgIqH1j4Av5LGkvI2BZ3D07m7Np0SpalGC23g4NEW3Tm282UpxTCJ5tIE
         nfekIW8u7fksNM+LDo89OQbYEl1JTIQ/o2zGQGzqTxMEo8zV2WvuQveKuNtG3Io7SlKY
         x/rUtQLKUHpyymgQiOtg1mF7fgjeMH892vpxZJBPChrvhWzj5LKRrKKdvfx6jp2n4CLS
         vCMiXm/QEStpywiluT83bBoNLKaZ8h7XpTX7DaP6tg+LdYxMAcYPFRq0V/MwRKMc+Vod
         em5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xQv4B3bb36rbPBYcVwiFiacx7H8VsL7xVtsrr5uJK6w=;
        b=ZhBeqm4LvOwbmh+hfkulznQXU315m+zIDwJ1sLrQf6jzh6egIK26JYOT7x6w7TX8FE
         HE0pXyBy7mCRxNWKkW2uy8orIeSmX19Q+u43aZd3kMJBg9FaGXatvEHBRw4RQUTtZFs1
         KmeSSOuyy/tG6So3AcRb2Mpi3rOulhH+X2G2DUnY9sbTkpysCmgSjtxIcf78GwZWq9vm
         cYWh6whzPepbfH5HSAyUgixZiktxo4izq4oe1BDS+4V0Au52/JERO94oMMhW79Dm3zPv
         fE62ZAbdtBPVZGHSnA9RZH6D9D43l7EEMjjFsVlFUwUOjmg/+G4mrCJqnNeV96WCVvm/
         CWng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=svnfqhtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si302056ybb.414.2020.06.02.18.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=svnfqhtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI7n-0006Gv-Pp
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyZ-0004Cg-Im
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyW-0003bI-RW
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id m7so202903plt.5
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQv4B3bb36rbPBYcVwiFiacx7H8VsL7xVtsrr5uJK6w=;
 b=svnfqhttMHOAuUdKTBputqZVA2XoWk84Evd6xO2uOpVuJb39CqHBhz5AGXYlqySWu4
 qnP7DQSRNJA7OLbN32jGJMMXUAYuxGBLyXo8S3sJZI1m29I1uAAuzznQHGj4CrOfJzcJ
 liO22Tw/1WJJhzv3rflsFZaMxSuz2zmGWjcmMdD3Iveq+WywzDAS+m9FblI7CTqtVEIg
 Qt9oelXng+hVcdEntO1RP1VWHxjJ+9ICLYXjAIk0q/IZCSFI38RaOM+5FoxO53pZh1Al
 8cmYKUXldeAXV61oefZN46Ddwf2vmm1d3Oh4sW6ghSft3mBZ1Wygp06lEWyqxKpZZy7+
 9uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQv4B3bb36rbPBYcVwiFiacx7H8VsL7xVtsrr5uJK6w=;
 b=LJc5SyteF7BzQZH1AileIn/eb/Np6iIaXYX/ZZOR6Acng2OO9CBMWOLcVgjCgZq60y
 WTjGrCdBW57cxcYKmkFW9549JPd/nmjj5KSsrGVuW5D3E18uTFFl3LqNYBd8OyELh65n
 VYWFT1MRt6xYbtpLaZwOqRRhPZWVEll4Wvik3nuG5Pby32CoMAcfzQX/pv0nYfXy9PRL
 USFC87Z2wZWHK6zHs84DS+9hOoyNygrvAY42dD2itEu6Mj2k4tUw3uKSo1241mp99ndR
 hXDX92UvA4kwsvWT2F+5WtCQgoIpd30RDrXk1e1YVrYVqP7CAN3Zuu8ZZu7NCgfQY49j
 mmuw==
X-Gm-Message-State: AOAM530wt17PNtE5Pt9/iT9GT6jI+goh0B8HqBf/Jt0L1NwbhEvldtWU
 yyMWifJvCYK0iknzXi/IG+EzYQ==
X-Received: by 2002:a17:902:ee93:: with SMTP id
 a19mr16191657pld.144.1591146827390; 
 Tue, 02 Jun 2020 18:13:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/42] target/arm: Move regime_tcr to internals.h
Date: Tue,  2 Jun 2020 18:12:57 -0700
Message-Id: <20200603011317.473934-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9uZdQkisP4r/

We will shortly need this in mte_helper.c as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 target/arm/helper.c    | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c36fcb151b..7c9abbabc9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TCR controlling this translation regime */
+static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return &env->cp15.vtcr_el2;
+    }
+    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bad639e2a7..c56e8e500b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9873,15 +9873,6 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return &env->cp15.vtcr_el2;
-    }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-- 
2.25.1

