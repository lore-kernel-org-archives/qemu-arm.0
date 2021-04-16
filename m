Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp648850lfr;
        Fri, 16 Apr 2021 12:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5HybHTnquii2e0tGIAn4G977cly1mEf11Pz78ka9HfPhljjCPZwNZfE3JGHB4NG3CTSZ1
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr3440355ljp.252.1618599681254;
        Fri, 16 Apr 2021 12:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618599681; cv=none;
        d=google.com; s=arc-20160816;
        b=IUnS+wcTm56z92sV3I/EzNTdWGWnU5Oh5DYwGX0T1n+0AFvwE+Nyl1E8eJSCjoT542
         A/bZPEYc7zAHWRcQPKpGk+OgkjAWpJQx6/8JBZW3wFbWG8iE1BmT7gA1aP26DSPd2r/p
         XFzG9J8CHVgbsbSUmIuMksQFV6zWU5UYtGz1fy4Kb+XzBvomnnmUNGeTJGKlgWzEr9EZ
         OlSQreR5xwJPfIDbFkIghNi1uFPX+1a6g+3l+rUMwPP6EQrH2zf9a71vfPW6ENsPqs92
         CCQ7Zcl9O3mfSQi5/3xTHurIppT/X9KcaTWbiNYUboRpvyeBbwdMnTAvlCeafqSsjBjF
         CMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Evp4L9R4so9YAj1dmMhARdiMu9PTP5fTYoZIvTA1e28=;
        b=Ia3iqZWEZ5e1DYLgxnedOoSwx1usjR/UvjKmZgIQnmND/3hhV5NoIJEfcmkm8oixgA
         k9pvy2Xe7+AYPZNMcKrfx7PR0z/YSbCmeITw0wx1zQGdXD5Hla1ywbuq5FNs26/THig0
         xwYgnW107MYCzHypa9R5/hPIRs8UH+HP6U3n6y5lHKdCig1OT0dTBhdVCd3zG6bfZWos
         3OsHdTpTfgKC4oLQbK2KDhpEwDZxEnGulGnAQQhT6Ko2Dh5SU2Od1Qy8EKJzSxCOv9nR
         JX1yFQJXBWpfhIU9iZbTubfWIqW3SCO102zYxhkUsWahWmcg58VXPab/5mQTAo1uT9WH
         g2Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xDCoNfIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si3607796ljr.209.2021.04.16.12.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xDCoNfIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTiR-00048G-PX
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThL-0003PS-9e
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:11 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThC-0004Ai-Mo
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id y32so19806935pga.11
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Evp4L9R4so9YAj1dmMhARdiMu9PTP5fTYoZIvTA1e28=;
 b=xDCoNfIkLJAr9Kw4aWTbc5EbwVU9T33lwAOHpo+uqkQYQwE4FvGvQ4r1pwbgcSQeJz
 tFuww2wKm5gCp00WyUOHN0tdSnhiDqkT+un4BKMbMoQ8xrie8Ly7mOGWNAPcvEl3SH4a
 qTxzp/eLjZkvzL64WUPwQxzPLRZhuBqnBgc036qq1JH3L44USlEnKhtDM3lfaOPdYGTd
 pOfYMk8JFNMG0+FLYGzbo8RSPJ+0acqu6Kq0cABDpPA7XbTKOzLfDGlDuB1Yg3Wv4Tnb
 oPsiGuoEnTtfKFZukf+1/Rw/6slrOnn0HEehp/gqYSv/O3h7w9bjmOq2EZ6nfC/+QApn
 G9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Evp4L9R4so9YAj1dmMhARdiMu9PTP5fTYoZIvTA1e28=;
 b=Ul8cGq5LfGkc2UvCpawJzMC2rWhVST2tetyG6EiqDGPo2jrEq64F7R1L3HUiR0bL/Z
 tOQtyUdnjgUHthc3lzWkH8PfBOKyoC65Tp4S3PUdP3gXAVHaEm1OW4dGhk/3gdilnJAq
 9hjDts6zxSoybGHbmFbD8UmDl9p1P57DtFYa3I//zWqjgE7vRJAVPmIGinRWxiYCr6sE
 YCQvp2tpQRTLbJQxj5BZcx2F1RjjJHooDnmP8b0Zdd8aAN/frP6BsVruVUlbZV28PlxF
 4UOYZqeuaTM6O5qeVDsqszYN2VVbHczJWl71nzIWxztA1pTNVW3Px57hXQ9iRiQkZlA2
 EhKA==
X-Gm-Message-State: AOAM530g+1tGykbDdUxjmt/ZlUlDUgX4uc/pTI6cWZN02zk5za3brp7L
 kKD7TficGMFsIO+SFqXD8dD4tPhbTp83lg==
X-Received: by 2002:a63:f443:: with SMTP id p3mr490928pgk.378.1618599600865;
 Fri, 16 Apr 2021 12:00:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.11.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 for-6.1 00/39] target/arm: enforce alignment
Date: Fri, 16 Apr 2021 11:59:29 -0700
Message-Id: <20210416185959.1520974-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4s9xqpfoyws

Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
("[PATCH v5 for-6.1 0/9] target/arm mte fixes")

Patches lacking review:
  02-target-arm-Rename-TBFLAG_A32-SCTLR_B.patch
  03-target-arm-Rename-TBFLAG_ANY-PSTATE_SS.patch
  04-target-arm-Add-wrapper-macros-for-accessing-tbfla.patch
  05-target-arm-Introduce-CPUARMTBFlags.patch
  06-target-arm-Move-mode-specific-TB-flags-to-tb-cs_b.patch
  07-target-arm-Move-TBFLAG_AM32-bits-to-the-top.patch
  08-target-arm-Move-TBFLAG_ANY-bits-to-the-bottom.patch
  09-target-arm-Add-ALIGN_MEM-to-TBFLAG_ANY.patch
  21-target-arm-Enforce-alignment-for-VLDn-all-lanes.patch

Changes for v4:
  * Rebase on mte fixes and fixup minor conflict.

Changes for v3:
  * Move TBFLAG_{A64,A32,M32,AM32} to tb->cs_base, leaving only
    TBFLAG_ANY in tb->flags.  This solves our current problem of
    running out of bits in tb->flags.
  * Dropped "Enforce alignment for sve unpredicated LDR/STR";
    there are more changes required for SVE.

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

