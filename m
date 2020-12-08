Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4231979lfb;
        Tue, 8 Dec 2020 10:01:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuTFIDXnWbzzjEarBLAbYl+mF/O/tVvYwtjimmmAD1z3kScigmW8Y6ff0dsXNQUeRfrbwZ
X-Received: by 2002:a5b:312:: with SMTP id j18mr10645104ybp.196.1607450511648;
        Tue, 08 Dec 2020 10:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450511; cv=none;
        d=google.com; s=arc-20160816;
        b=C74SR45kDbo/PPe6dpXBtoom93FNyFC+gnR5+OB/Ieqd6oAiBXz0smzQ6roWHvstYb
         kdgqQi2kHrGseOYQUitwyfW2+10rKD78do+w5Bom0Bt/0Qnh50hsDo//lOcf7E8aTgRk
         6g7hxkM6CZ194htrPKAniOwLSsvQNNXBhNPwx7IJMWleEF1q2wGIsf3SbdamHMXWdD6q
         25TfkpRaFN7zdCByWPB5PGgD/9ZfgHaB+6a/6zqUhRY92yywRgNgXyB9uwu2KguyOfOe
         KZxGat1otZy1+f+X9NQ4ZBys7Oec7cFKHOqhhuHMJR8kXt5+f8mcvRZQcRsIXAgriQXK
         oHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nRCndp7/HIEVv/fe6sGye+LbO5nxxv9GiYms8HDhkaM=;
        b=irNfsigssopq4m8aknuEnkU9dq0mMUwUEfz2Dslg6XQ1XMeilMrXrhCSCEws8kjbRk
         UyxuZD9RZZmEgV/YbJbeo1y41U9oGMxvLcCqRrgJv1prhSYGUDdhHkmIf7MSwbeM+6gm
         uWPcr6Jr9fyJUVMGVtLL9+h5asgasZ15d0Yw5EJhJvv+uAvCa2jeE3c3oRpch8HzAmmg
         J7SB8Q6gE/Yq+UgOYv/W7DrMwEswk/eKKocK0pI4Ax9XphVXUnjnRcnYqgRUFuPT3OKv
         F4JgDXWfsTaAm5oRlxkaykIuaOn1nnKQShZXanUz2xQowQkyte+SOOL90SgpLfEtgEPM
         0HGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y81G7UhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si7545922ybf.81.2020.12.08.10.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y81G7UhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhJ9-0007Sa-01
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIk-0007S9-IO
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:27 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIg-0006Jj-57
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:25 -0500
Received: by mail-oi1-x22d.google.com with SMTP id l207so17413039oib.4
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRCndp7/HIEVv/fe6sGye+LbO5nxxv9GiYms8HDhkaM=;
 b=Y81G7UhCc8OCKeIKZ5owhiM2uCHr/ra72yPzXHvbtEwz/M/9fpXjRB2/6BQX7XKJFF
 /e1knLrFWZIo6rMYFJzdaEj5o1373sCirr5djyvQKgWGGnqqZts2SsH+mqDi/OU0MNjl
 oHa3PhrxRaSDSzzEmL6XXrEDvHjENaIog9R+RMMAA19AIpzhEEfLaJxYhLBAJ6iO3v/j
 pSsazZpO+7zD8tKS20th3+hHWqKUOLH7zx6MlOtZslcMC3x5cfI7bkSqeztdIpxYI3Wz
 w4yPT8WNysgV5xgO09Xmbj0YEJgr32Pg+bTJXycGKBkk3K4VrURnVn1FzF6lwfic8Eo4
 1Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRCndp7/HIEVv/fe6sGye+LbO5nxxv9GiYms8HDhkaM=;
 b=VgeuSYkAkJO080pACcjUFBareRGRjZ7+IO5wbsDKCY6tvx3/i88uGCUTWh0uX3JopC
 xsH37c9Wgt50MjikhbarOMH/NPiZAJ3kZG6DiGp1Homs5RHRCmBW3PnNank3rVRs8A63
 M2gul0a4cQbiM503D5qT7yUr4peS5THuHkzq4SRcUOKsXy1l7F3UgkXq901QKfhDMoKa
 32fG5yVSMTr/uPkgrN0NzbRp8m8AOepd/ZR2x1XwgBynSn89BkmolZNwZxcK/W4hKqPk
 tnnHT78b6zX4n0tP1B5CuxR1q8mJZ5/JP/VvMKMgM1KILg4Js8lA/7vV/G6wvgW1Ie78
 hWaA==
X-Gm-Message-State: AOAM533fPN7W2CM1sVZAYRhIrKMNm11kvLQU7cQLAI14yTkdLJNZeCHQ
 jx+4eFWsqMu0+bqfUtzI73Adhg==
X-Received: by 2002:a54:4f08:: with SMTP id e8mr2830675oiy.110.1607450480455; 
 Tue, 08 Dec 2020 10:01:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] target/arm: enforce alignment
Date: Tue,  8 Dec 2020 12:00:54 -0600
Message-Id: <20201208180118.157911-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j/t0xfOqhXd0

As reported in https://bugs.launchpad.net/bugs/1905356

For version 2, I've rearranged things a bit, which has made it easy
to support SCTLR.A/CCR.UNALIGN_TRAP.  At least for non-sve code,
where we issue tcg load/store operations.  Predicated sve load/stores
will require more work within the helpers.

I've not explicitly tested the SCTLR.A support, since I don't have
any code that tries to enable it.  Though it seems obvious enough.
I will look into writing a small semihosting test case using our
existing test infrastructure shortly.


r~


Supercedes: <20201125040642.2339476-1-richard.henderson@linaro.org>


Richard Henderson (24):
  target/arm: Fix decode of align in VLDST_single
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
  target/arm: Enforce alignment for VLD1 (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Enforce alignment for VLDn/VSTn (single)
  target/arm: Use finalize_memop for aa64 gpr load/store
  target/arm: Use finalize_memop for aa64 fpr load/store
  target/arm: Enforce alignment for aa64 load-acq/store-rel
  target/arm: Use MemOp for size + endian in aa64 vector ld/st
  target/arm: Enforce alignment for aa64 vector LDn/STn (multiple)
  target/arm: Enforce alignment for aa64 vector LDn/STn (single)
  target/arm: Enforce alignment for sve LD1R
  target/arm: Enforce alignment for sve unpredicated LDR/STR

 target/arm/cpu.h                |  20 +--
 target/arm/translate.h          |  27 +++++
 target/arm/neon-ls.decode       |   4 +-
 target/arm/helper.c             |  19 ++-
 target/arm/translate-a64.c      | 175 ++++++++++++++-------------
 target/arm/translate-sve.c      |  60 ++++++---
 target/arm/translate.c          | 207 ++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  85 ++++++++++---
 target/arm/translate-vfp.c.inc  |  20 +--
 9 files changed, 391 insertions(+), 226 deletions(-)

-- 
2.25.1

