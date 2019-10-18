Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1232518wrm;
        Fri, 18 Oct 2019 10:54:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybLgP9UcG/6ruybVxnReuFe6vi+8LIYM2/eInKEN0QV0sSKwhfjXeUg2Tf7IhIh8DPgaAH
X-Received: by 2002:a05:6214:208:: with SMTP id i8mr11259147qvt.108.1571421242636;
        Fri, 18 Oct 2019 10:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421242; cv=none;
        d=google.com; s=arc-20160816;
        b=qSXgotzGchcjYJc8lwBYtHXazC6DTDm1ACyi9iCbAktmOKDq0B66+P3JmsP/EelmpI
         t6ZxsPm4vWg7OMej4v9a6z7ZTLVOKOCjIk7pAxe/eAPAgf7hLIruMWcnTZmSZ6xF5zfu
         Sf2t4DGSeAt1BQpjP+Bskkdosra8NVs+Fliy9sPHadG8LN5anO0teeAmE9ELa0WHYpyM
         whm9c8l/IOOLoglGNCgia684J/vCRlgkHm/M9AlfcIYeZLx5ooDJtIwP94+f3qHoTDvp
         PoIiCyyfC4oefFWSi8JRZJgKJ0jGOPFkJPBZQrLsYCI3xk/hCgPJ/DrXbmfGQmLFzDy3
         PGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
        b=ceeIaIuqwrp9ohhPsq7aKNyJ+zCwFiMHYh78cFkJZxsdTb6LYyanfG/lXH665hjM64
         d1S6TTSB6e3UT6nvkJC9VOhVgehbTeM4SDslnL47lRhf/ZJ9MMvbwgzq2dFZ2FsEtWmr
         dRHs4DMHjd42zd+oPHOyvcpdmbs02mKpurmujqEGdT1G0tAwc0PmT0spjd3a9BpnFErG
         lYLakTgYJornulCnh5cjJXdRBbqiomTfR0n3ZzZNjD9rqAaoxQPXiCjQJMGLoXUz7re0
         5dLADy22dkL+n4DiBypzVmssFjE6taVCHqoO4sbdv9AS/eo6mFw37bJYkK0Xo9SfxPsS
         bV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CmQzsPrv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si6695898qti.118.2019.10.18.10.54.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CmQzsPrv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWRt-0006xR-Ll
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIv-0006VF-Ba
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0005Qs-7M
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIs-0005OZ-CI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id q10so4340048pfl.0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=CmQzsPrvDUP7TGC3Xij7NV+0fVY9PVR/mErfUMpWnbVHd0/oFLChlsIsrlZY7Zwrfl
 i0eRuvLYsOB2lO3rnSYAwmuA9V7NX7MQMtEdJq8YXwNNIanQSEFpN4T1Tcj76WqsWRSk
 n+x/LSuytWhOfARUfG9zy1AzkFiofTCTTyk6lcEDwvk3CN5/knom+NbGhKMbdE5/SqlX
 7+JDx+BJLKau+8aK1NqnekbjmsQ9R62XHbnmUoVQDyEGp2gm868uw0XkyqXYt03+fulh
 LWKwCDGlVkAA0aNQmzRWtxLPIteb/oupb3tc/vgYmWhKKMYiR7JL6HVxZBEQX+kLSk/7
 8v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=hshnB8PYALP3LjizqBsOPWaW85gXjCezx1gl+cHzkFc7mXc79560ggrIxG75BMkTkl
 bI7K6ASwZ0Bw1T/SUye1yC2lzMtAAxY5omIeftEfN468wgXj/krGK8FJetnTBXt+zZah
 x6R/0kaWl2+iq8ClgO6Wz2tUEISmrG/hDCcfBLJK1LbHEqNKz0JbDrR7/UC8xNGFYu8j
 48GamPyafuuSjWIaaO0fh6Q9Q1b5c/YTajvnksVRWK/tZmSf5vmD27AbXp5yyaNWVpGB
 kLOIyJFg6+lfdMHxjkONImuBFWysPXMlscr5Y4EQZu1KcBXlbF0OVJqAFhI8Fml7ECvv
 Lzyw==
X-Gm-Message-State: APjAAAV+tlGTkqQgOrqFwEtsi1itjdNVUWeBs4MD/wSNj9v2nlGmlqoB
 nTEkzyEGCoTMWjWLajIiJ/JKzSURXzY=
X-Received: by 2002:a62:6842:: with SMTP id d63mr7967828pfc.16.1571420680836; 
 Fri, 18 Oct 2019 10:44:40 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/22] target/arm: Split out rebuild_hflags_a32
Date: Fri, 18 Oct 2019 10:44:16 -0700
Message-Id: <20191018174431.1784-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: +U97unwiI80u

Currently a trivial wrapper for rebuild_hflags_common_32.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 296a4b2232..d1cd54cc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-- 
2.17.1

