Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2003807lfq;
        Mon, 11 Apr 2022 17:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCJ753Q9NUhG0ONbP+BGfD0PVz/LE7ULWv7RNkmDwZGqun10K6LV94kUQ217/YMJOOgLBC
X-Received: by 2002:a25:7748:0:b0:641:6186:a88b with SMTP id s69-20020a257748000000b006416186a88bmr5540654ybc.358.1649723650671;
        Mon, 11 Apr 2022 17:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649723650; cv=none;
        d=google.com; s=arc-20160816;
        b=VV+XK+173ZkjaE3J7/O/bx/Ndtdq7U0CMIpSCNDJnLj/3V9XFQk+LCJSZIRi9gHYZ2
         MitmlapmDGel7zzJI6cDc6akkWWQkAzKsZojUQJckUiybk+bi+Ot4HZvG4dWgd6//aB5
         HslpNpOaa270tg6UT7iL6+zXVVi3G4LzXAacxg/I+Os8Olpase1sQQ044aD2YZi0/kNS
         euqJUWcOb0eUwJXp3Xr4vQc+sNUkIuG7JS91KEYWeRLR841SiCzam0h/LhKs/uwm/pX9
         DEsoNyV19np1hr7RS5M2EVFg6G7eAvNO5nxraRyFT8OlthnQ3qhC4ZgP6O8C2zlEqoAz
         JX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EoMxry4KNroNrInw/qLutWh0oJmp0gorOIKFQjnhW+k=;
        b=wreh66ky1lGQVdERnKs3Cj6Eez/6y4hidzgfxrBlFP6FnkaQFB7hMFNagIqSsa+Mo5
         MdI1ZpwAsbYstlOpJ3BYjZxt8Txvl2K4OYgShZKJ7lc0f85N/819DD/VV3SgkfD7f41o
         eFtTUfKzzQVSibD1Rsywa2Awwn+LLLvnI+T+sLsg3a3uBRj+zC39dhrIJws7LodIFJU9
         jk5CpljB94Em2fc3HQlZpUhDcHdDWSezjxOzsGKjEhjRCTcJuMcp/76kens2SwkI0xRx
         FdZ5o8S44IVlMv90RH8QIwEKrfhB4oOCM2nGSRNhSnIDV+gzpcwOtaJVjKzu80LkbIAv
         H+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihPLMmKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a254006000000b006376fde95easi4810762yba.612.2022.04.11.17.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihPLMmKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4Ty-0001kl-1s
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TL-0001kQ-U3
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TK-0001md-4J
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b15so16029028pfm.5
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoMxry4KNroNrInw/qLutWh0oJmp0gorOIKFQjnhW+k=;
 b=ihPLMmKnQT5sBs++Z911A0mKTiAJg9WeuoCW/PvZGBtvRETVYoMHF/b1XsRwro2G1t
 ARMKtSdAVFQxoHE5xK5djzNYWBqs/OP4XrDUUTKOHiznT6vwzedV0b7YBnsWmDhf3Oa+
 MRK/asBBxLjttkXjnL/s31mNQICds9LSwgBQb9/KLpluIX7OzhlrTv1u+A7MM+qctS/2
 DFP2WJJ/2VDO2lNli0By06iEtNYRBLwCyyu/3T4T9MlmYEtQplQ1zLpAQ8UtTDSn0AFC
 lX2R8sRR87XVlCCzXhyubaKNR+51BpZ/gvbT2ozEPo9FWopj6hdnQjudKhimKyAj9pO6
 f9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoMxry4KNroNrInw/qLutWh0oJmp0gorOIKFQjnhW+k=;
 b=K8qEwzcEnWFXQW7IBfrwEjfSMz18GRWvvB0zFXDSUELnljNRmtLou73Xdem3Yk0qiT
 5PAUMjSqoYCModxo0gsT4pyY4X5qXVhZyBKdjW99k7Dp+KFMzOVqwXJ5Qa33BOVDxrbA
 1soFPp84AjrDefXbye5xmhfsBHba8NVGW+4i4A7f36Vsjk+7bQq4eL3jz1WhI5+eOQKZ
 afAxsnMqgl2wjFXoZcuC2Yh4XNDfNfSjeak8biGL1ktdmwyGKC4Ddt7CpXrJOCyNydIS
 6UQDL/m05fvsOygbCAmjpI7O1PIf7HO0qviMDKwIy5PbggE52VWDrWjO9aAJGkBMUj4y
 s6Jw==
X-Gm-Message-State: AOAM531zrViBUx0BLVKRFb2q+yAXIn3e+uNnfY0SSQtKDIwNM/o7wrob
 RAifV3pDJ/wX5BbjAnP9X/8k/g==
X-Received: by 2002:a05:6a00:124f:b0:4fb:2608:78de with SMTP id
 u15-20020a056a00124f00b004fb260878demr34798582pfi.27.1649723608564; 
 Mon, 11 Apr 2022 17:33:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] target/arm: 8 new features, A76 and N1
Date: Mon, 11 Apr 2022 17:33:02 -0700
Message-Id: <20220412003326.588530-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eCmo2raqGIm+

For v2, combine two previous patch sets and address comments.

Patches lacking review:
  03-target-arm-Move-cortex-impdef-sysregs-to-cpu_tcg..patch
  04-target-arm-Update-qemu-system-arm-cpu-max-to-cort.patch
  06-target-arm-Split-out-arm32_max_features.patch
  12-target-arm-Add-minimal-RAS-registers.patch
  14-target-arm-Implement-virtual-SError-exceptions.patch
  20-target-arm-Enable-FEAT_CSV2_2-for-cpu-max.patch
  23-target-arm-Define-cortex-a76.patch
  24-target-arm-Define-neoverse-n1.patch


r~


Richard Henderson (24):
  target/arm: Add isar predicates for FEAT_Debugv8p2
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out arm32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add isar_feature_{aa64,any}_ras
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Update ISAR fields for ARMv8.8
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 target/arm/cpu.h              |  72 +++++++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 ++
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 target/arm/cpu.c              |  61 +++++-
 target/arm/cpu64.c            | 349 +++++++++++++++++++---------------
 target/arm/cpu_tcg.c          | 228 ++++++++++++++++------
 target/arm/helper.c           | 246 +++++++++++++++++++++++-
 target/arm/op_helper.c        |  43 +++++
 target/arm/translate-a64.c    |  18 ++
 target/arm/translate.c        |  23 +++
 17 files changed, 866 insertions(+), 246 deletions(-)

-- 
2.25.1

