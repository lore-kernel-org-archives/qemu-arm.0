Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp166096ejb;
        Wed, 1 Feb 2023 23:53:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/0ZqFYLUZpdfl7y87/67DTwMdB8jsCLstwoQBiECUsyY8eykZDcIviiNPH1mlYNsFES1MD
X-Received: by 2002:ac8:584e:0:b0:3b9:a4c8:d57a with SMTP id h14-20020ac8584e000000b003b9a4c8d57amr10445981qth.32.1675324424778;
        Wed, 01 Feb 2023 23:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675324424; cv=none;
        d=google.com; s=arc-20160816;
        b=YxIELpLg7vDkX9bh/h88n5QM4wwrHf9VTkaalX/15rLVLNj9OgHe6O2UVE7I1hiP2Z
         sAAOW2TKrKviCJm1Sr7sKu6jMkSsQA/BhjxnfdGD6l0brJ9u2XmQdUBOZFJ0LaEqKTtV
         mbCLFM+9MrjR3s1FY7o04JVudF6snZ9ygp2XpIFlFNm9wOs3aGSw72Bbtri+D9Xdhdkt
         muK94wv+NALD2asIIx+GdsRn2LC2EiYXuoZUUjBsuiNDABxcS2RQxw7JUEWkEs7lO+MW
         xu9F2ByHPCr+8Xi8CgKB5v//jz2iOGg21Vs0K0PoyEjKKPjob3iaXKurMWqMIbtbIylW
         DJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3SFomLrmZIRv5rQjAeMZtXdriC7DG7safnUA2txOf0s=;
        b=QPABAjk9cYMaOT1AyCpOLt3/RJDKLV156Ux8eFMz0Fc6Xup6dn597Xjl4j4OjQX1XW
         7pi3oUF5/Ol/nc88FsUd3iLe0+5625fGy4f6O3Ly3oBZ7KdhJC06Pz2Egb8ufW2O3bF6
         t+SB8QWclFnpscxWi+NqlZ+73JZKTzsPhci2PdQxSpy6ipLfpYSlrw7I6gX16VwxYli5
         kANv3HXONHkC3k7LR48d3LHcOuXtyiB1atKJJgvFOdiVTk2t223kT2OTvNb69Ne2xhEd
         3pRe526crDdyD9pDYNQHFCB6CglJ59yizQfPbMZDrbljzhQHH9JA2BJoP8lf/nLWlEKY
         BZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfL1hh3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ac87d81000000b003b86c9f73b4si6326474qtd.502.2023.02.01.23.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 23:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfL1hh3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNUOt-0001Oo-NP; Thu, 02 Feb 2023 02:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOq-0001NN-MZ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:52 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNUOo-0007jb-NZ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:52:52 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4771611pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 23:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SFomLrmZIRv5rQjAeMZtXdriC7DG7safnUA2txOf0s=;
 b=qfL1hh3S+PvaWPN5684F2TExkbOEU/+O83ITMr0qbA1nKRqWFx0QV87IRpOQW+CXBH
 Pr4Kh8vKLGz8Rs6/sKKtQ+Sjz6aRLnTa1FqKs3zYu7H8aU4j6GVzf3M/XbLwP25mrQLl
 YE26sji/PGvj2XEoFMuLjiCIF4OaO8dmgqQs01+o/sw0I4xyVasccuGnXICggCd+tOa0
 ySxLUIz5iKFR6gaWNo6aKUee3HjF8SE8VGFjeeT9uix7OZPcP/TBwsemnYb2zGM8FrQw
 u/uqDrlTRjNcJHB5FUxmo0AkAzYPt7zC81PqCM/SfaOqGEfLnP02JotQ3sNrhzWsaISr
 htBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SFomLrmZIRv5rQjAeMZtXdriC7DG7safnUA2txOf0s=;
 b=e0A24BEA+b6D3Fqsg0AHoUWbckPE1BAeSCFon0qwMCeH41GQGsELJ6mulVe5LLFh6q
 8wrqni4Awe/wmzDD7J+JD6LET41oNlmjAgY4XUB1GhY70yznDlYDPvDim4LLsid/SSmo
 zxI/jAT4UrQyiSaxg+9CEVOYnT/db6wHjQnzM8o67krH8uJjRQTKDKrcp509PzDst80n
 EN6TbFWk8b1XZKzhf3eo/zmjYrALd1lBEQT40F2l+Iz4olcHVK69SN0n6LTMIihtGuRa
 8xnSGEcSmsT/w1Pqte/INuKYNK6mJh36BXS/eeupAYkd+i0a7/W6EA7bqmH2op96a36q
 6APg==
X-Gm-Message-State: AO0yUKVFwGKZlaStfL/1NmfsX5dWCA4hJ/AgRZxMiSzkvYfODKfkGvDw
 gPyUj9szocY45sskkx+OAHmDLeU0aUTZIfZI
X-Received: by 2002:a17:90b:1d05:b0:22c:6c0c:3e3b with SMTP id
 on5-20020a17090b1d0500b0022c6c0c3e3bmr5573231pjb.7.1675324369324; 
 Wed, 01 Feb 2023 23:52:49 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a7ac400b0022c35afad5bsm2496763pjl.16.2023.02.01.23.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:52:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/4] target/arm: Flush only required tlbs for TCR_EL[12]
Date: Wed,  1 Feb 2023 21:52:39 -1000
Message-Id: <20230202075242.260793-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
References: <20230202075242.260793-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 82suAOCtJFhn

The ASID only affects stage1 of the relevant regime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..8ad9a667f1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4054,13 +4054,30 @@ static void vmsa_ttbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
-static void vmsa_tcr_el12_write(CPUARMState *env, const ARMCPRegInfo *ri,
+static void vmsa_tcr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
-    /* For AArch64 the A1 bit could result in a change of ASID, so TLB flush. */
-    tlb_flush(CPU(cpu));
+    /* For AA64, the A1 or AS bits could result in a change of ASID. */
+    tlb_flush_by_mmuidx(cs, (ARMMMUIdxBit_E10_1 |
+                             ARMMMUIdxBit_E10_1_PAN |
+                             ARMMMUIdxBit_E10_0));
+    raw_write(env, ri, value);
+}
+
+static void vmsa_tcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    /*
+     * For AA64, the A1 or AS bits could result in a change of ASID.
+     * This only affects the EL2&0 regime, not the EL2 regime.
+     */
+    tlb_flush_by_mmuidx(cs, (ARMMMUIdxBit_E20_2 |
+                             ARMMMUIdxBit_E20_2_PAN |
+                             ARMMMUIdxBit_E20_0));
     raw_write(env, ri, value);
 }
 
@@ -4151,7 +4168,7 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
-      .writefn = vmsa_tcr_el12_write,
+      .writefn = vmsa_tcr_el1_write,
       .raw_writefn = raw_write,
       .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[1]) },
@@ -5894,7 +5911,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .writefn = vmsa_tcr_el12_write,
+      .access = PL2_RW, .writefn = vmsa_tcr_el2_write,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-- 
2.34.1

