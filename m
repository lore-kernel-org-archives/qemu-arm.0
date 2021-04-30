Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp466636lfg;
        Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4W4B4ovMoZ7Uw5cJlwFdC9kU6ixeo9NF2j8zZSUBopNT6rn0exuBD8+hmrrafuYl/WBUf
X-Received: by 2002:a05:6e02:118b:: with SMTP id y11mr5464971ili.163.1619814394470;
        Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814394; cv=none;
        d=google.com; s=arc-20160816;
        b=bm/rFwFj4KXmaOGLJyjEd+YCZqparjnw4qw56fbgqnmtCtoLndDmIQoxRFKVZxOwSI
         bCmkvqWUimkxswj5Lo8Kk0EW3Mod6s7ABETKzQEwCm3S4bgjVLNbB69b2e60vNe3t4jW
         +S8AYzk9H197/MIVJciVJneDAo3lzQ8tcGe97vc/1fSsM5Xa3U4q8xY1xwT4jla8iwis
         ImyeCZI7h39R8vl0U/UqEO29c0eVxiHrOxoSQSwyPdXia2e+3AhISGDxSLYNKBa7IhYm
         OQ/y9V+0Gktr9/Tqn9u1w/kStZlbXEKIER4gDL9bCDC51gYyENQOZusLKpIACdlHXUmn
         h/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TLnAK3F2EuCsyPGbgX4McZcLJW7/N72p142oSUvhLBw=;
        b=sFo5gabBjmycaIq5MUjy1V7T1Hd3g9oXEd9yn4yn/i8xKvcPX+3JoCWnHL8MCj1PQM
         hmuoXpXbrfSxSFRKAZrx6FIbaZuyAQgdJWQZKrBu83rcIzgydlcRl9oatjLliO/iXFgL
         iD2LhNjQqKVkvQSBEdnlTXiL+MI1qhgdK2XwNueHBhMZ1+Lx+RIaeFSmroNRGp5s2CXh
         U0ePq8aevxnsycW/9jIFgE7VoAH338BVXpt6VDkPPeK7ZdoFDE3wQAeilWDErY+9ITX3
         fA2j5SpLH+8vL2riwVzVz2msqXl5CeOM4OA7XrVw6UmomGA6Lwod2uh3zRo/zo+xlzv2
         j1Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WhfqXB/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si1818326ioh.98.2021.04.30.13.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WhfqXB/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZib-00083g-Nw
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiJ-00082E-DC
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiH-0005qF-6w
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:14 -0400
Received: by mail-pg1-x532.google.com with SMTP id j7so40761153pgi.3
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLnAK3F2EuCsyPGbgX4McZcLJW7/N72p142oSUvhLBw=;
 b=WhfqXB/vz8hEbI8/RNPbQAuQVAMixQjyNw8xs8LimgkhIzsy5abmqCuHVjyiccWHCE
 aH6at7n5A6ZN9Nn2BbWQgWsqwOaCRrOwNnRQ9zmNpCa+F92lTLiF6+pSxciNjs8CFmX/
 CaIno4H3ruUhyE3tW3Mdx7JXglsH/02nUzmJ+B3gOR/oY1SOVlgB0BtScIJ2O/rwy1d8
 4Wr2rboy/6opJ4T+PuyAfGjn8GIKypGe4mETvI5HSX79idGY17D7mIHASlFbC341XDhV
 rWKCRtg/X9JV8aqQPX2Cz5iu1laLL669FJmq8VdiULRdaIaizneZR3FhG9w0XfoV6/Sy
 G1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLnAK3F2EuCsyPGbgX4McZcLJW7/N72p142oSUvhLBw=;
 b=YMsMpKI+wnmkL+WZMf4wc9QXfwD0dTXXV7fvcZevRoEGnaTVAhf708uSE5GQJBV9+m
 eGGTP/3n2I7tIvQDBMbr5eeF74Bz9Xc9U//kpiYUcN4s8WAqffHTtf59Th9Ig4OZaJsc
 PQ+iBGyoSB5P2GIKWmmNIcgNfLQWtwLi5j7jwIKZFc/9SRz8I9S5eAB8GBx056WvVpKD
 lK5OJ9uRQqEl8NI5+JkMARCOfx8M+Nn6T6mNsh5H49PlHSEBoxONjrzAtcttP1BMahJ2
 4rRvR/DPEipWEpw6dF1DNqo+ekjIN3J+7pdOPeXVxxQWfLlJKoPbegryZFMa3B+Q80sn
 sA0w==
X-Gm-Message-State: AOAM5314J/0Ib0Y/sdmgHfT2EfD2Y29VRm34I2eja4VH7QhF4S0c+EGq
 mdTdfmG5M07wgpehcEykLtluTQEfmmW0Ug==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id
 k7-20020a056a001687b0290253f4174dbamr6479649pfc.5.1619814371202; 
 Fri, 30 Apr 2021 13:26:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/82] target/arm: Implement SVE2
Date: Fri, 30 Apr 2021 13:24:48 -0700
Message-Id: <20210430202610.1136687-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dIYKLSFSwLka

Based-on: 20210430132740.10391-1-peter.maydell@linaro.org
("target/arm: Split translate-*.c.inc into separate compilation units")

Based-on: 20210427214108.88503-1-richard.henderson@linaro.org
("linux-user/aarch64: Enable hwcap for RND, BTI, and MTE")

Since I believe Peter has both queued on his target-arm.next,
and I didn't want to get in the way of his bulk code movement.

Changes for v6:
  * Rebase as per above.
  * Rename isar_feature_sve2_{i8mm,f32mm,f64mm} to sve_*,
    because these extensions do not depend on sve2.
  * Update hwcap for the many extensions.


r~


Richard Henderson (64):
  target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
  target/arm: Implement SVE2 Integer Multiply - Unpredicated
  target/arm: Implement SVE2 integer pairwise add and accumulate long
  target/arm: Implement SVE2 integer unary operations (predicated)
  target/arm: Split out saturating/rounding shifts from neon
  target/arm: Implement SVE2 saturating/rounding bitwise shift left
    (predicated)
  target/arm: Implement SVE2 integer halving add/subtract (predicated)
  target/arm: Implement SVE2 integer pairwise arithmetic
  target/arm: Implement SVE2 saturating add/subtract (predicated)
  target/arm: Implement SVE2 integer add/subtract long
  target/arm: Implement SVE2 integer add/subtract interleaved long
  target/arm: Implement SVE2 integer add/subtract wide
  target/arm: Implement SVE2 integer multiply long
  target/arm: Implement PMULLB and PMULLT
  target/arm: Implement SVE2 bitwise shift left long
  target/arm: Implement SVE2 bitwise exclusive-or interleaved
  target/arm: Implement SVE2 bitwise permute
  target/arm: Implement SVE2 complex integer add
  target/arm: Implement SVE2 integer absolute difference and accumulate
    long
  target/arm: Implement SVE2 integer add/subtract long with carry
  target/arm: Implement SVE2 bitwise shift right and accumulate
  target/arm: Implement SVE2 bitwise shift and insert
  target/arm: Implement SVE2 integer absolute difference and accumulate
  target/arm: Implement SVE2 saturating extract narrow
  target/arm: Implement SVE2 SHRN, RSHRN
  target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
  target/arm: Implement SVE2 UQSHRN, UQRSHRN
  target/arm: Implement SVE2 SQSHRN, SQRSHRN
  target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
  target/arm: Implement SVE2 WHILERW, WHILEWR
  target/arm: Implement SVE2 bitwise ternary operations
  target/arm: Implement SVE2 saturating multiply-add long
  target/arm: Implement SVE2 saturating multiply-add high
  target/arm: Implement SVE2 integer multiply-add long
  target/arm: Implement SVE2 complex integer multiply-add
  target/arm: Implement SVE2 XAR
  target/arm: Pass separate addend to {U,S}DOT helpers
  target/arm: Pass separate addend to FCMLA helpers
  target/arm: Split out formats for 2 vectors + 1 index
  target/arm: Split out formats for 3 vectors + 1 index
  target/arm: Implement SVE2 integer multiply (indexed)
  target/arm: Implement SVE2 integer multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply-add high (indexed)
  target/arm: Implement SVE2 saturating multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Implement aarch64 SUDOT, USDOT
  target/arm: Split out do_neon_ddda_fpst
  target/arm: Remove unused fpst from VDOT_scalar
  target/arm: Fix decode for VDOT (indexed)
  target/arm: Split decode of VSDOT and VUDOT
  target/arm: Implement aarch32 VSUDOT, VUSDOT
  target/arm: Implement integer matrix multiply accumulate
  linux-user/aarch64: Enable hwcap bits for sve2 and related extensions
  target/arm: Enable SVE2 and related extensions

Stephen Long (18):
  target/arm: Implement SVE2 floating-point pairwise
  target/arm: Implement SVE2 MATCH, NMATCH
  target/arm: Implement SVE2 ADDHNB, ADDHNT
  target/arm: Implement SVE2 RADDHNB, RADDHNT
  target/arm: Implement SVE2 SUBHNB, SUBHNT
  target/arm: Implement SVE2 RSUBHNB, RSUBHNT
  target/arm: Implement SVE2 HISTCNT, HISTSEG
  target/arm: Implement SVE2 scatter store insns
  target/arm: Implement SVE2 gather load insns
  target/arm: Implement SVE2 FMMLA
  target/arm: Implement SVE2 SPLICE, EXT
  target/arm: Implement SVE2 TBL, TBX
  target/arm: Implement SVE2 FCVTNT
  target/arm: Implement SVE2 FCVTLT
  target/arm: Implement SVE2 FCVTXNT, FCVTX
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 target/arm/cpu.h              |   66 +
 target/arm/helper-sve.h       |  681 ++++++-
 target/arm/helper.h           |  111 +-
 target/arm/translate-a64.h    |    3 +
 target/arm/vec_internal.h     |  143 ++
 target/arm/neon-shared.decode |   24 +-
 target/arm/sve.decode         |  525 +++++-
 linux-user/elfload.c          |   10 +
 target/arm/cpu.c              |    1 +
 target/arm/cpu64.c            |   13 +
 target/arm/helper.c           |    3 +-
 target/arm/kvm64.c            |   11 +
 target/arm/neon_helper.c      |  507 +-----
 target/arm/sve_helper.c       | 1904 +++++++++++++++++++-
 target/arm/translate-a64.c    |  111 +-
 target/arm/translate-neon.c   |  231 ++-
 target/arm/translate-sve.c    | 3117 +++++++++++++++++++++++++++++++--
 target/arm/vec_helper.c       |  854 ++++++++-
 18 files changed, 7377 insertions(+), 938 deletions(-)

-- 
2.25.1

