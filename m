Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp274757lfg;
        Fri, 30 Apr 2021 09:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbjFebTTBcKtD2sTg4dD8n+sM7tES+OMUomu5NMp5EtOW1+HiUmOS/Q/sjj0T5wcqXwwAM
X-Received: by 2002:a92:c749:: with SMTP id y9mr1449768ilp.141.1619800084259;
        Fri, 30 Apr 2021 09:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619800084; cv=none;
        d=google.com; s=arc-20160816;
        b=iQVMWrQVJCeBfGVahB+fedzoOibfC8qfmY3ojonStKyPlxbWm9TCkn8uFlK9k/tful
         z68X1ZP2j0A5asVMD89Ma/DwY6k91ziwbc6yuCsH0Bs1KNtXdGKldW7ngOPju1HzR66b
         P4VgZHir1sAzf0Mk9rZfNSbIypUWN2Gvc731FXL34MDvcqo3AsgEIAi0A1F3mRYecE5L
         qx3BjR3GB1U6bTU3BaCXn4QyecLstkbLGcxsB1fxJupEFXd75vNO/3pn1rBfSPQ/lSzL
         hqMDBHR1kTo8o0H0Zmriwf4GXDMyIhrGASjtmGaeUHUOTfAph2dOSE+H1j2WLn5fziCr
         pFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yslsL0vxZl/43aFqtxJCsTyiqJiMHzf4CLCZds7Mx6M=;
        b=kI/q6HczQdw9tEN9grmNenHRyF8uk/ShwgDQeUdrtTJRQarckbFWm5MkgPDjbRjID8
         6kYMFrBCo4Ql7wlSsJabmmzhrivzGCQN/z1LNgzD88Kv7jPiDsosJgbFbLT/nhWn1I3n
         BcbaHLyi2a4M4cxWL1fCkjswo2T99t49UvB/bMC/rQ5G0ufo27tfV2pZHWnTAQDgf8JB
         T9qsERKAbakNytMAqUsUweyo2ckjRlb4/QktxQV74ILZnOxQ6oY5N9H0HLjbndL/PQPe
         uAi1tEHnl3i09bPcQaEy/0eEjvw3vNOdour0+RMOGKaomUtWGSmsE4Yi+XSjvq6dRsr0
         j0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NIri3LLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si2548237jaq.45.2021.04.30.09.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NIri3LLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcVzn-0003gM-Gj
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVuF-00071C-AF
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 12:22:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcVuC-00038M-NL
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 12:22:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id d11so13355847wrw.8
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yslsL0vxZl/43aFqtxJCsTyiqJiMHzf4CLCZds7Mx6M=;
 b=NIri3LLZmivN37gIpUM1t4iGBcIlcsxu7Ayq94Dir2pHxQJcU7YIIUUh+WQLhVDqB5
 Vt7Bm/htuXvGb3QpMbzPDtGO4aLa18pRBi4vQ7/RfPksMU5RNAJip6YBvG3LvpI2SxFh
 1wIGhUkL5ebYd4bGlQYxq7Ow8gXJLMiCr8l2w4G47Du8QzRWBJ09w0Oj57Iklh8KPMZo
 PfQPyE6oAVrVG2qrY0adsbkAeqy3pL5hxC7c69mET4onFT0PDAIZrwkEOGwekrAt7PAw
 WgeOMcN4Vd2g4VETQPFYUJB+EmfBt8c6D5W/RXbt3n0A3Y9nqSkJV12aLDnYqoGefl/+
 EwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yslsL0vxZl/43aFqtxJCsTyiqJiMHzf4CLCZds7Mx6M=;
 b=k5K3LeZ4U+zUWTtF/I3yeRXfS1Ox3g1wtJu8Avve00ji95AieHjC2ZuhPp51kCN1lW
 CzUbEDooA4I92bUj+KksLFUzn/XeroiTTdvEthsRqdG888QzCP/EES4kLMbeBLhNTamn
 NfOfFuUwKftZXghUx/KoOCIMT2y36f9ZQJHPpH+RwkioHPVVVNSWHpZXeoycvswLh7w4
 Hq8koOybEf/gIaUB3bIFqV46sFoPXHC73xLXSCjOhwjElTQvbLPIXbIYLurH5wEFU8/3
 ycUk18gwbcny6TQnhpLT4yzs1AXEULvJiSdeowpdSWoQQ7j0Mtmopr9WAi9fwrOMf0+5
 jPLg==
X-Gm-Message-State: AOAM530Tanf6PB0ZS7q8QawKl3LkSBFf9C01iM23soJ8mzvmJJX8MUvR
 bBpy1iTZ8h6Yfws8aUaHFHMtR1iYL0BsYyyP
X-Received: by 2002:adf:fa84:: with SMTP id h4mr7807714wrr.44.1619799734592;
 Fri, 30 Apr 2021 09:22:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 3sm17120838wma.45.2021.04.30.09.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:22:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Make WFI a NOP for userspace emulators
Date: Fri, 30 Apr 2021 17:22:12 +0100
Message-Id: <20210430162212.825-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BryJhbhZSZPT

The WFI insn is not system-mode only, though it doesn't usually make
a huge amount of sense for userspace code to execute it.  Currently
if you try it in qemu-arm then the helper function will raise an
EXCP_HLT exception, which is not covered by the switch in cpu_loop()
and results in an abort:

qemu: unhandled CPU exception 0x10001 - aborting
R00=00000001 R01=408003e4 R02=408003ec R03=000102ec
R04=00010a28 R05=00010158 R06=00087460 R07=00010158
R08=00000000 R09=00000000 R10=00085b7c R11=408002a4
R12=408002b8 R13=408002a0 R14=0001057c R15=000102f8
PSR=60000010 -ZC- A usr32
qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7fcbfa4f0a12

Make the WFI helper function return immediately in the usermode
emulator. This turns WFI into a NOP, which is OK because:
 * architecturally "WFI is a NOP" is a permitted implementation
 * aarch64 Linux kernels use the SCTLR_EL1.nTWI bit to trap
   userspace WFI and NOP it (though aarch32 kernels currently
   just let WFI do whatever it would do)

We could in theory make the translate.c code special case user-mode
emulation and NOP the insn entirely rather than making the helper
do nothing, but because no real world code will be trying to
execute WFI we don't care about efficiency and the helper provides
a single place where we can make the change rather than having
to touch multiple places in translate.c and translate-a64.c.

Fixes: https://bugs.launchpad.net/qemu/+bug/1926759
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 65cb37d088f..1a475aa51eb 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -286,6 +286,17 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
 
 void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
 {
+#ifdef CONFIG_USER_ONLY
+    /*
+     * WFI in the user-mode emulator is technically permitted but not
+     * something any real-world code would do. AArch64 Linux kernels
+     * trap it via SCTRL_EL1.nTWI and make it an (expensive) NOP;
+     * AArch32 kernels don't trap it so it will delay a bit.
+     * For QEMU, make it NOP here, because trying to raise EXCP_HLT
+     * would trigger an abort.
+     */
+    return;
+#else
     CPUState *cs = env_cpu(env);
     int target_el = check_wfx_trap(env, false);
 
@@ -310,6 +321,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     cs->exception_index = EXCP_HLT;
     cs->halted = 1;
     cpu_loop_exit(cs);
+#endif
 }
 
 void HELPER(wfe)(CPUARMState *env)
-- 
2.20.1

