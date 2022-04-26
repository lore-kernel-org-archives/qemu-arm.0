Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp344405lfu;
        Tue, 26 Apr 2022 09:14:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5xQSikTX3QtKDPwnwCJomJPgKQxrF9gRl1VN9WMEhN4hpPjyIib5EumxlRVg0ZwVgRQCP
X-Received: by 2002:a81:1655:0:b0:2f4:e558:73c5 with SMTP id 82-20020a811655000000b002f4e55873c5mr22889472yww.274.1650989663671;
        Tue, 26 Apr 2022 09:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650989663; cv=none;
        d=google.com; s=arc-20160816;
        b=o4yFHvN8k0uxicRnKhebos6EDott+E3xOMlnoKpXmkYSFWlAxXfBAVHP0Znv4i9NN/
         BW0oWgV7chR+zhqsscHIUzMI3nPrXJWSJTfMe4Gz7ES+wUOHXRTdRAHs+NDmqmXep6j3
         /0JhePEEAGg07zFxKziCUIw1/uSrgubzCtPZjvrEcLck+aYIFOCGm2wnMNylKLWzqvsn
         b33P3MRpAn7v4+4kQwT+YDebWK5YMhybXJToC7cjKsU6BDqOW3a9uopTQMlVKr5uGI3A
         wTU6WBp5asyyVL55oAF2MHg3LuY//zkpjEVeHM2MFdLKwR2QUFufYOkdLayVB/+ZEORk
         +84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z32BMyn+yGJAtZTpHVnzzj+i0p3WqVl/zaCG0tsjJlk=;
        b=YJGLyVSdJZKlkmM1Fx3jiTMrY72BPC9D2YPVQilC/5SUcl7hGRxW+p9aBusvFmA4ul
         FbwKU6z8oJcKJPEVk0mG+9o+7R0vqaXwhTTFTfDTguv/CHZl8/ggHdJ0Zl26ZxWfOpNP
         gv41wAZF4QWSSRGI3cic8SrOkd44BNaAgJyvdsOTgW8tmqmGFnOOWHFd7loAx09gS4Sb
         RpJ8vbszhHw2cPh4IECyMJkONVQwLvLuO5Z4F2F/nutu4wS8qJWStiSaroInSTpIITJ7
         NB6k1y992iHsm/wbRv1ew60/70nUHs8iDr71RH3A33Oof8GMxOCcuG7mIUlYS/EW9FrP
         VI3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toIno8Pm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130-20020a250f88000000b0064534f57922si12901047ybp.399.2022.04.26.09.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toIno8Pm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njNpX-0002w5-0u
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfx-0006T0-Fz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfv-0007o5-FP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id w4so26081363wrg.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z32BMyn+yGJAtZTpHVnzzj+i0p3WqVl/zaCG0tsjJlk=;
 b=toIno8PmSDyTi/EcApXnqZMSlP6jK9sHOQ7YdSZ5iigqGKsY5Cd0O24s7oRK4bfNtI
 kjycVSoQVpHQSLgl9+O4bEEfZrZk9UsMeKPoHXFvHfASgPdNPVbox5kv8wtDE6DOsj/y
 R85hQM/iIeevBY4YjSfbnkyzVnAgoBQWdOJu3Y5O5N/s12VcwMsoqgKrJ44XPh54awB2
 8ucYTWTiz+TM0da/HIhR0ayEWetrd+3SNg6O+99rYI1/mXKgfkdzUzmnBFihCCTsuL0y
 qm7L/s6Or35p+8fgid6BjET+lcodaPs5Ddy+VsmNB33MlBth1mV/mWfe/aguUMaYnI0X
 f63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z32BMyn+yGJAtZTpHVnzzj+i0p3WqVl/zaCG0tsjJlk=;
 b=nQ+E7vY+0rICr4h7pdZXLSix6JkCtlB1pH2H8TrPbSn0emflSY7Wl4Hfgho6RBqdGx
 QtkY4rsW1LBvXrpG9R2cvhO2YZWFLZdewV85T1dp5SRkFfFD/9xewMa405stqv6l3beH
 C7Bjc7BasHa2qJJOD0mv7tWUQzO4ooplSLn7YbiXH9SacepzfB6siUL8z7Lgn+c8xIip
 vK3tu/voWDJBUfu0OrAH7mHA/6PE9ctaIr9yzd2hWARfyo6ngwvFh0Uc44JK//idlnR/
 nTzj86IgMqunfrjzAvvnj4xxO6ycu5TpyFT29UYXwAb+XabG70x4tdI5zsEFX3E3V7bx
 dRSw==
X-Gm-Message-State: AOAM530REh4g0sFkkzyLFjAwUrHKNALkKpjLtDkdNlGd4XdJjoK5E5/W
 TwnzFrlnAvrZnOVxdHayLa0JsA==
X-Received: by 2002:a5d:6e89:0:b0:20a:de31:18d1 with SMTP id
 k9-20020a5d6e89000000b0020ade3118d1mr7625812wrz.449.1650989066088; 
 Tue, 26 Apr 2022 09:04:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm13584777wrp.54.2022.04.26.09.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:04:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Advertise support for FEAT_BBM level 2
Date: Tue, 26 Apr 2022 17:04:21 +0100
Message-Id: <20220426160422.2353158-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7XVSXjrVPEGR

The description in the Arm ARM of the requirements of FEAT_BBM is
admirably clear on the guarantees it provides software, but slightly
more obscure on what that means for implementations.  The description
of the equivalent SMMU feature in the SMMU specification (IHI0070D.b
section 3.21.1) is perhaps a bit more detailed and includes some
example valid implementation choices. (The SMMU version of this
feature is slightly tighter than the CPU version: the CPU is permitted
to raise TLB Conflict aborts in some situations that the SMMU may
not. This doesn't matter for QEMU because we don't want to do TLB
Conflict aborts anyway.)

The informal summary of FEAT_BBM is that it is about permitting an OS
to switch a range of memory between "covered by a huge page" and
"covered by a sequence of normal pages" without having to engage in
the 'break-before-make' dance that has traditionally been
necessary. The 'break-before-make' sequence is:

 * replace the old translation table entry with an invalid entry
 * execute a DSB insn
 * execute a broadcast TLB invalidate insn
 * execute a DSB insn
 * write the new translation table entry
 * execute a DSB insn

The point of this is to ensure that no TLB can simultaneously contain
TLB entries for the old and the new entry, which would traditionally
be UNPREDICTABLE (allowing the CPU to generate a TLB Conflict fault
or to use a random mishmash of values from the old and the new
entry).  FEAT_BBM level 2 says "for the specific case where the only
thing that changed is the size of the block, the TLB is guaranteed
not to do weird things even if there are multiple entries for an
address", which means that software can now do:

 * replace old translation table entry with new entry
 * DSB
 * broadcast TLB invalidate
 * DSB

As the SMMU spec notes, valid ways to do this include:

 * if there are multiple entries in the TLB for an address,
   choose one of them and use it, ignoring the others
 * if there are multiple entries in the TLB for an address,
   throw them all out and do a page table walk to get a new one

QEMU's page table walk implementation for Arm CPUs already meets the
requirements for FEAT_BBM level 2. When we cache an entry in our TCG
TLB, we do so only for the specific (non-huge) page that the address
is in, and there is no way for the TLB data structure to ever have
more than one TLB entry for that page. (We handle huge pages only in
that we track what part of the address space is covered by huge pages
so that a TLB invalidate operation for an address in a huge page
results in an invalidation of the whole TLB.) We ignore the Contiguous
bit in page table entries, so we don't have to do anything for the
parts of FEAT_BBM that deal with changis to the Contiguous bit.

FEAT_BBM level 2 also requires that the nT bit in block descriptors
must be ignored; since commit 39a1fd25287f5dece5 we do this.

It's therefore safe for QEMU to advertise FEAT_BBM level 2 by
setting ID_AA64MMFR2_EL1.BBM to 2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6ed2417f6fc..c3bd0676a87 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -9,6 +9,7 @@ the following architecture extensions:
 - FEAT_AA32HPD (AArch32 hierarchical permission disables)
 - FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
 - FEAT_AES (AESD and AESE instructions)
+- FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ec2d159163f..2974cbc0d35 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -840,6 +840,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
+    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1

