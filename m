Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp332345lft;
        Fri, 8 Jul 2022 08:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMfJMPBnUA2QTG0ZM6X5KB8IF58RowlfTrxGVL6rLcG21lTf1Btn5XdyjVLh5Ir2ab8U/G
X-Received: by 2002:a37:5341:0:b0:6b5:5971:5981 with SMTP id h62-20020a375341000000b006b559715981mr2723171qkb.562.1657293566124;
        Fri, 08 Jul 2022 08:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293566; cv=none;
        d=google.com; s=arc-20160816;
        b=hWpF5q7nvU0DxBmvQ6RAhHxs0CaxFOCAPLB9kte8WJ1dkm/jkK7oQNpFUJ4H7Tp4kY
         KB5qXXlzwTIHj7kEy60XEKdBjftjgptjDReWMJQJJc/o4I0ENoJ0fuLLzALFTcDCQG88
         UTPGMOqole5j6PKeZ/zS5e0YE2JmXoSM7Tvu+fZo0kmEhFEyjGp8umE4GcUl8tieTeo8
         0UbHAT9cl3qooou+kGwaU4H5qGMGQ9SGTBTeuxpbXe7uIk1zv7XsKnSacAtVXjTGzwNY
         wq7Skn3mwyvriNAA4q3eaDJm3vAmt9/RHDPFB3oD93w8tZWDYwv+ISGv3F7267qHNvHE
         Rr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1mHWMd8rxjTcZd8VSZBiybJK+Vy8ZjvVBl26hIoOM7Y=;
        b=J9pze4FWkXonVnPLTnBTs3AZtWb06jxJ6j5kUxZdOZLFVeb9hB4+Ky8c/0TPKZw/rQ
         hm2JsGpEhTx/nfcsMgl2TfVTc48f1fqypPbsQXoXd0IopRlLJok+ELeLafZqip4a33Cn
         rpHd86ahqLJJgSJpONd4WoJx79IEArbnKXqF4Y0Nn1MF9OGkPt9njlPX83HMggnOxfd0
         mezDfhNvE6NT81JqW71dd1sBIF+YjeCvpjkslkpWBjRaJYuY2B65IbHEz8yMR3k4x8z6
         fNmg+rJLgaIw+XTZvj7FAMDGZQt9jabjXEjzt24kPqDzGSJd0ln6fXMRLZn7FLlan4hn
         lTIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgWiSBu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a409600b006af4b2c7406si25050831qko.490.2022.07.08.08.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgWiSBu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9plN-0008Fg-JW
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi5-00027p-T6
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:02 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9phy-00024d-RZ
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2218817pjo.3
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mHWMd8rxjTcZd8VSZBiybJK+Vy8ZjvVBl26hIoOM7Y=;
 b=qgWiSBu5KImlVbg+v6ZIe1LNlGUqcRXzeYkj8mBnaHvIM5PNq03mYcXzqE3LzJN1h9
 1i1hn0O85H9uH646Rmkfuawk048usBPUoNGCV7XqObAAUUbYE73glGdwZOhWggXuZUok
 UOY24fhQdM3j31jD7jsdRQOKX5avIUI70F/XYYAp8FbFgENjN/1QJK2Xhpn9zT7IZFYy
 c5xRrpMqqWQ9Swm+hUDzz6wvZayj5wdCFG8t4QVuPwW0Yne+W9L9kRe+JIjt+KEohpDh
 GTRov9OSusl9cptWHgFllyuUjDIeBHtBaLKBfDruFB04Asbj+M+3YplVSO7a+ajlJorR
 PejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mHWMd8rxjTcZd8VSZBiybJK+Vy8ZjvVBl26hIoOM7Y=;
 b=LXNQW0IXVDLtBetNAaYf4ocXTXJdHAE1sPZL8Cv6jNBVP3aDqA4Kt8+ePFniJOi4En
 pFKPoRYkFmlqvP6jyncnXG+hWaFzXQt7wnb0PSqRpWfZH5u8sABGV9lgVlh/Pffz9r/v
 AYLf2hRNC8OPk4KWju52fi1GWCtur7M4BwoZgbCpuQs/4iQWltfh83Cqnt8R2r9j6jXa
 C3OFjNx2Npb6Jiazx26qpY2hFROXFpb+aJ0GCFDuX6wEqEL0aQ8vyFeUh69pl63Webqd
 mt0a+G2I7CiI2/ywyNn/eCNSLCWgarBi85rjv78xrJpZZIZTm3QFPrexhaOMXhbWrwEX
 LHkw==
X-Gm-Message-State: AJIora/KKfHWVThhlL7A/4CkSmAFscjEhLA1ma73yC9rpvpZyd4LtI9i
 Ei/WwptEQ9HxhJQqGD3cXbNTy5J4x9qoMsO5
X-Received: by 2002:a17:902:ec84:b0:16c:278d:add with SMTP id
 x4-20020a170902ec8400b0016c278d0addmr2174104plg.12.1657293346912; 
 Fri, 08 Jul 2022 08:15:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:15:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/45] target/arm: Scalable Matrix Extension
Date: Fri,  8 Jul 2022 20:44:55 +0530
Message-Id: <20220708151540.18136-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQ/uJKflPBXA

Changes for v6:
  * Some sub-word big-endian addressing fixups (pmm).
  * Logic errors for BFMOPA/FMOPA (pmm).
  * Fix for PR_SME_SET_VL hflags rebuild.

r~

Richard Henderson (45):
  target/arm: Handle SME in aarch64_cpu_dump_state
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap non-streaming usage when Streaming SVE is active
  target/arm: Mark ADR as non-streaming
  target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
  target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as
    non-streaming
  target/arm: Mark PMULL, FMMLA as non-streaming
  target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
  target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
  target/arm: Mark string/histo/crypto as non-streaming
  target/arm: Mark gather/scatter load/store as non-streaming
  target/arm: Mark gather prefetch as non-streaming
  target/arm: Mark LDFF1 and LDNF1 as non-streaming
  target/arm: Mark LD1RO as non-streaming
  target/arm: Add SME enablement checks
  target/arm: Handle SME in sve_access_check
  target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
  target/arm: Implement SME ZERO
  target/arm: Implement SME MOVA
  target/arm: Implement SME LD1, ST1
  target/arm: Export unpredicated ld/st from translate-sve.c
  target/arm: Implement SME LDR, STR
  target/arm: Implement SME ADDHA, ADDVA
  target/arm: Implement FMOPA, FMOPS (non-widening)
  target/arm: Implement BFMOPA, BFMOPS
  target/arm: Implement FMOPA, FMOPS (widening)
  target/arm: Implement SME integer outer product
  target/arm: Implement PSEL
  target/arm: Implement REVD
  target/arm: Implement SCLAMP, UCLAMP
  target/arm: Reset streaming sve state on exception boundaries
  target/arm: Enable SME for -cpu max
  linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
  linux-user/aarch64: Reset PSTATE.SM on syscalls
  linux-user/aarch64: Add SM bit to SVE signal context
  linux-user/aarch64: Tidy target_restore_sigframe error return
  linux-user/aarch64: Do not allow duplicate or short sve records
  linux-user/aarch64: Verify extra record lock succeeded
  linux-user/aarch64: Move sve record checks into restore
  linux-user/aarch64: Implement SME signal handling
  linux-user: Rename sve prctls
  linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
  target/arm: Only set ZEN in reset if SVE present
  target/arm: Enable SME for user-only
  linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   62 +-
 target/arm/cpu.h                  |    7 +
 target/arm/helper-sme.h           |  126 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   18 +
 target/arm/translate-a64.h        |   45 ++
 target/arm/translate.h            |   16 +
 target/arm/sme-fa64.decode        |   60 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  243 +++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   56 +-
 target/arm/sme_helper.c           | 1140 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  373 ++++++++++
 target/arm/translate-sve.c        |  393 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2821 insertions(+), 135 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1

