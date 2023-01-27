Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338454ejc;
        Fri, 27 Jan 2023 09:58:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs1NjkTq7JcqrHhaFaG7mwGuqUVZyNrY0SwjOmrUXpQ/gwD/pW7w1jBp5WPGETqnkOEFmiF
X-Received: by 2002:a05:622a:6008:b0:3b6:3a8f:d743 with SMTP id he8-20020a05622a600800b003b63a8fd743mr53984952qtb.66.1674842280241;
        Fri, 27 Jan 2023 09:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842280; cv=none;
        d=google.com; s=arc-20160816;
        b=gfRIHSkT1EsoSLLunSTXaVEyLWDUhR88TpOvzEEDQM0/s6dY/lxBnBPAR+HpaKmO7R
         pwJU8OIS0IOLPU6iyjLBlZk8t3Sn5elnqx25bz+CPKl5La8ImFhlHca4lhvT7GbHgJPX
         /N8YY5eJFxJWoM6br2YWSa+ZsNuaYrbfD+5gZ+zqIUZkCqVT1dEOXzVoYk73oBHln6Oh
         BzKW6oG/dE0xXleOYXTjIBpXuCl3+mXDRSWpivYK8o4wRdQNGU4vFtXVGZrM+GsfpNGX
         PlcM6PB+Bpp20d+uVwN0juPqnsi7+wTKMDs7TqNQEjsbfiTBBh27vv8RhmNhFS3mgThI
         IHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=uvuf0K3RKNAPJETXJV9XevZKYErx9RVt5zxuzgDSynQ=;
        b=G6CgSPO4P8UEBexvBC3DSL419zVCOcO3JYt6SiGDxAH1BKs/irJvKm42Ip+pFfKvbA
         MCiv1NBqLiGbY4cCm4Qfmj1Le/9AtsW4Y6cvuIoCB/ptp4odfUTHa/9qhJsyMubnrVN7
         jFDSvbx2CllUn4S2rPjaLO6nUCOetsOrn6vSMqN71AokFenTyIHubD39q2VFEQSgZm2Q
         W8bpFo7e8qf0+N7C79+waLwIOMwzXxlccJj5ih8Okzh9q2wQBXC5JcW0lfCgpsGTq5k/
         GmsKEFqOSvL2LZguV4eiQBGNIAR2b3IT1EgNcxRHHdVWUGJQaBMCI920nBZ4tcPEcdUD
         ntEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVWb9Mgn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020ac85b51000000b003b630a616dbsi2605684qtw.730.2023.01.27.09.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rVWb9Mgn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSwo-0000oP-87; Fri, 27 Jan 2023 12:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0000mr-S6
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwT-0005yR-9m
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so5640615wrz.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvuf0K3RKNAPJETXJV9XevZKYErx9RVt5zxuzgDSynQ=;
 b=rVWb9Mgnv9uPZXJYiAAK+Uy3P8sm4aTdS2P//YzaHxe3p9K0A9vv3KpRnc4Aspfq7z
 m/m1OXfJNSqAVW3FKHuy6E+YIvY9qD8wtT94tjUfogTORWDhkpTFTIU56oxTJMCCIeoR
 WpZ/FsjyIVNZWWz8IbJoOCZWIrZE2iLcxgZMa1ds0FWIYosJtRh/BrKjFZn5mVydlq9S
 3gMnPEgxAQZi67k20hCzX+dyIFvAmxZVNDwYiis4q9KMS5omlcwn2Xph2XhgtzHM8XW2
 IDpGhZNxA1I98qzAtCGytu4KB8vvQiSmibRSwjkwIt9qkvHv2Fl+2IDD6UkdmjVJhv9h
 qSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uvuf0K3RKNAPJETXJV9XevZKYErx9RVt5zxuzgDSynQ=;
 b=oqU86xCJ1L2zMvhTIUFxDs7US71CiTeSBp7rBs7OIie0+/OcobNUdBE1bhJLwICA75
 JFyN3suhwT6fqvNRNWGr2UoBracqqPLDDI32gRmwk9j1mt+Qp1fJlBPo/bbwjodZzclO
 Cvw1n34BfnThlxht/DVo6ektBI1NDTC2n3sERnrTodvKYwBfssnCvtdRycUVsw3D/AGO
 WtGJcUiteVC2HKjhMwdIYAKzvtB85j9VHnpnH8glZ7dIzGmoSoS2+H4Er3hdl7BPQ5jS
 ilZbDBMqjcT5MXud4w1gsURFElT8OU5IJUdAy7jqEmoDX/ZBmnuhedaZC50wheI/RYd4
 drdg==
X-Gm-Message-State: AO0yUKV2zqRIR81DUOvBiCOMHuLZV8kM21BffG/zar3GIcBy6V1mxftd
 58UGE2ZA1qGobkzJ2kG1i1W2yzJ7XcQi8eb1
X-Received: by 2002:a5d:4951:0:b0:2bf:d425:11ba with SMTP id
 r17-20020a5d4951000000b002bfd42511bamr2806451wrs.22.1674842110542; 
 Fri, 27 Jan 2023 09:55:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/23] target/arm: Implement FEAT_FGT fine-grained traps
Date: Fri, 27 Jan 2023 17:54:44 +0000
Message-Id: <20230127175507.2895013-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: d5vy1yH8WZjM

This series implements the FEAT_FGT fine-grained traps architectural
feature. The bulk of this is new system registers HFGRTR_EL2, HFGWTR_EL2,
HFGITR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, which have bits that enable
trapping of system register and system instruction accesses on a
fine-grained basis (typically one or a few sysregs at a time).

In theory we could implement this with our existing ARMCPRegInfo::accessfn
machinery, but we would end up with many many very nearly identical
access functions. Instead this series adds a new ARMCPRegInfo::fgt
field, which specifies which bit in which FGT register should be
checked; this is then tested by code in the access_check_cp_reg
helper function.

A few bits in HFGITR_EL2 allow trapping of instructions which aren't
handled by the ARMCPRegInfo mechanism: ERET and SVC. These we just
implement "by hand". FEAT_FGT also adds new MDCR_EL3.TDCC and
MDCR_EL2.TDCC bits for trapping the Debug Comms Channel registers;
these we implement with a standard accessfn.

The first seven patches are various cleanups and bugfixes that
I noticed while I was doing the FEAT_FGT work. In particular, we
weren't getting the priority of HSTR_EL2 traps right -- these should
take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
The rest of the series is FEAT_FGT itself.

thanks
-- PMM

Peter Maydell (23):
  target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
  target/arm: Correct syndrome for ATS12NSO* at Secure EL1
  target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2,EL3}
  target/arm: Move do_coproc_insn() syndrome calculation earlier
  target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
  target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
  target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
  target/arm: Define the FEAT_FGT registers
  target/arm: Implement FGT trapping infrastructure
  target/arm: Mark up sysregs for HFGRTR bits 0..11
  target/arm: Mark up sysregs for HFGRTR bits 12..23
  target/arm: Mark up sysregs for HFGRTR bits 24..35
  target/arm: Mark up sysregs for HFGRTR bits 36..63
  target/arm: Mark up sysregs for HDFGRTR bits 0..11
  target/arm: Mark up sysregs for HDFGRTR bits 12..63
  target/arm: Mark up sysregs for HFGITR bits 0..11
  target/arm: Mark up sysregs for HFGITR bits 12..17
  target/arm: Mark up sysregs for HFGITR bits 18..47
  target/arm: Mark up sysregs for HFGITR bits 48..63
  target/arm: Implement the HFGITR_EL2.ERET trap
  target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
  target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
  target/arm: Enable FEAT_FGT on '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++-
 target/arm/cpu.h              |  18 ++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  20 ++
 target/arm/syndrome.h         |  10 +
 target/arm/translate.h        |   6 +
 hw/intc/arm_gicv3_cpuif.c     |   2 +
 target/arm/cpu64.c            |   1 +
 target/arm/debug_helper.c     |  46 +++-
 target/arm/helper.c           | 245 ++++++++++++++++-
 target/arm/op_helper.c        |  65 ++++-
 target/arm/translate-a64.c    |  22 +-
 target/arm/translate.c        | 132 ++++++----
 14 files changed, 986 insertions(+), 67 deletions(-)

-- 
2.34.1

