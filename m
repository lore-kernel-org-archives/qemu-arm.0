Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2917484lfq;
        Mon, 11 Jan 2021 11:01:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuNG1NpsAfk091HPG2Nqu1w0LQ2YryK/lTYDvUYWAYIP7dzqSwa/J/TnbSNe3/ORXzVdoS
X-Received: by 2002:ad4:4431:: with SMTP id e17mr1044238qvt.21.1610391717526;
        Mon, 11 Jan 2021 11:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610391717; cv=none;
        d=google.com; s=arc-20160816;
        b=acXL8AeHFTdmzE9Eh1//hrPnihIZqkuZdgjcRdGJMbtEEzKyCUWm9/ReMzNJQ401E9
         vrOQ3MlMs9ZUBWicsYW6Wb8E0Z7KSJuYHUiUiJ7nJsk5Bh1eLT2QeTn1EspYNw7tQnq0
         xmtcjW6t5lTtic9+C4RB+iDQgnN8trMGQrS8eNQTMkSCclj3LZXSg9G+LbAcOs4XSY7o
         DlHdzZhgkeG+n13kdf0RAzxoB6x0PPJRXERgqdyiQGCqDHYM796KX0lKTQoqM/LUzj/a
         qL5dLCM1N7bD49g8yH8K5PGpZV09HL2bWqozwrJdz2DNtmUY9wF+0z4JVGW1Y5Eik2rw
         tCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/F/kqeHksImGvstf5taTsaI7j9+MkxMQkwgzkDOwKP0=;
        b=Ey1EAwJo6gff0aA/BSE++68Pc7Q6mjj8KsQiduKsU25Ycexwkr/oGdBRvngMo+tK+A
         ASTSqX2D/uFPJtrzfQ5deuCitAbG7E2wnSNDfxuz06euU8CA8d0d8BErIjBbpY84P6Jd
         z1JP1ZhjptJQi3Mr521Go+qvo8jKDeYsqcNdkTlb0Qw9zHjFajytzBqak5HmZouOneao
         yb5nKBOpOCPnWDZ0UdVGcYIWqW76Q2FOiObzruQn24Ti4cXdQnjQaP0a9n5mtCeYcSeY
         g0NyQgiCMQJrxkBbOzVsKUqB670Gmpljw5ISjstAwBuxi2hZvv8G/C/tkn87woWIlsNJ
         5wig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DKsuor1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si606374yba.383.2021.01.11.11.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DKsuor1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2Rw-0005h9-Ra
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RN-0005fT-Fd
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:21 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RK-0006MM-9L
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:21 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x18so336833pln.6
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/F/kqeHksImGvstf5taTsaI7j9+MkxMQkwgzkDOwKP0=;
 b=DKsuor1vXPGPlQYxFbaQbgeI509RcGrRpvHlU9zKMUE+dyet4PeT7FIpHCD9F5GAJF
 Uf+r5mGGOfcp1p3oxmBfbd30TNnoaE0QWlkUteBVpfsbiDOQGDftTTGmpdz9GGhm5E4o
 a1VN/++xo/Z6axdYmGA/rxRj5AuOoeXhxYmRTf2wNOhNvlMUQRWXDmuuQo6pC0P9+OT4
 v1j7QViPDcRgODsjUZ10O+27Exb1rinIIA/HI9URDbP+IQ7j0p2S9XobouAHROQoVuvS
 1dyPK+jpoqdOGRINqrKCXgnf6BattDrLmx15POgb653X+eF3263vjf7ZWQ1vI2ba/9gC
 lMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/F/kqeHksImGvstf5taTsaI7j9+MkxMQkwgzkDOwKP0=;
 b=d5BupVcRkEMRC3VgKECwnMJ+2XsL75YwIUmJiDUwdXQM2iYBTQwScleTQskTOqHoS6
 FZFhKuZki9LV/vPkEcDULfVss4VgQJXJgmGrn/sfajKSCQtcrkr77OZQUd+lkPmTY3e/
 ESvgyaqRiY6eYGSPudhLVHtRUOPN6JgtgRQ9c8EMVd0t6+pbBmGe3a+WoRLf4mrCRSaD
 +bOSC9rhn/uOs2NZBIsLhjZV8RDefKK2anoXx8HINec3hu9P5hrVNkyeMWjFvvq2EVBY
 FWBgsSgSPbQOSReCNfgjEmmW4VFa6t4ZW4VB7yTeZywWluuLNsorA3DYcKsmEIAAbor9
 q3xQ==
X-Gm-Message-State: AOAM532KitglD3cWKPDNeRITvCZB3K8IhE+E0rZjv9C/ywSjBRxaLOES
 3lkub4H0B8GkSfE9vIdM9EMK0g==
X-Received: by 2002:a17:90b:14d3:: with SMTP id
 jz19mr298131pjb.196.1610391676277; 
 Mon, 11 Jan 2021 11:01:16 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/30] target/arm: enforce alignment
Date: Mon, 11 Jan 2021 09:00:43 -1000
Message-Id: <20210111190113.303726-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GmID1GO8TYOs

As reported in https://bugs.launchpad.net/bugs/1905356

Changes for v3:

* Move TBFLAG_{A64,A32,M32,AM32} to tb->cs_base, leaving only
  TBFLAG_ANY in tb->flags.  This solves our current problem of
  running out of bits in tb->flags.

* Dropped "Enforce alignment for sve unpredicated LDR/STR";
  there are more changes required for SVE, and I think I'll
  integrate those into my SVE2 patch set.

Changes for v2:

* Rearranged things a bit, which has made it easy to support
  SCTLR.A/CCR.UNALIGN_TRAP.  At least for non-sve code, where
  we issue tcg load/store operations.  Predicated sve load/stores
  will require more work within the helpers.


r~


Richard Henderson (30):
  target/arm: Fix decode of align in VLDST_single
  target/arm: Rename TBFLAG_A32, SCTLR_B
  target/arm: Rename TBFLAG_ANY, PSTATE_SS
  target/arm: Add wrapper macros for accessing tbflags
  target/arm: Introduce CPUARMTBFlags
  target/arm: Move mode specific TB flags to tb->cs_base
  target/arm: Move TBFLAG_AM32 bits to the top
  target/arm: Move TBFLAG_ANY bits to the bottom
  target/arm: Add ALIGN_MEM to TBFLAG_ANY
  target/arm: Adjust gen_aa32_{ld,st}_i32 for align+endianness
  target/arm: Merge gen_aa32_frob64 into gen_aa32_ld_i64
  target/arm: Fix SCTLR_B test for TCGv_i64 load/store
  target/arm: Adjust gen_aa32_{ld,st}_i64 for align+endianness
  target/arm: Enforce word alignment for LDRD/STRD
  target/arm: Enforce alignment for LDA/LDAH/STL/STLH
  target/arm: Enforce alignment for LDM/STM
  target/arm: Enforce alignment for RFE
  target/arm: Enforce alignment for SRS
  target/arm: Enforce alignment for VLDM/VSTM
  target/arm: Enforce alignment for VLDR/VSTR
  target/arm: Enforce alignment for VLDn (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Enforce alignment for VLDn/VSTn (single)
  target/arm: Use finalize_memop for aa64 gpr load/store
  target/arm: Use finalize_memop for aa64 fpr load/store
  target/arm: Enforce alignment for aa64 load-acq/store-rel
  target/arm: Use MemOp for size + endian in aa64 vector ld/st
  target/arm: Enforce alignment for aa64 vector LDn/STn (multiple)
  target/arm: Enforce alignment for aa64 vector LDn/STn (single)
  target/arm: Enforce alignment for sve LD1R

 target/arm/cpu.h                | 105 ++++++++-----
 target/arm/translate.h          |  38 +++++
 target/arm/neon-ls.decode       |   4 +-
 target/arm/helper-a64.c         |   2 +-
 target/arm/helper.c             | 160 +++++++++++---------
 target/arm/translate-a64.c      | 214 +++++++++++++-------------
 target/arm/translate-sve.c      |   2 +-
 target/arm/translate.c          | 258 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc | 117 ++++++++++++---
 target/arm/translate-vfp.c.inc  |  20 +--
 10 files changed, 555 insertions(+), 365 deletions(-)

-- 
2.25.1

