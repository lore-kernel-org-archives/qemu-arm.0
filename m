Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp323760lff;
        Fri, 30 Jul 2021 08:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ+DjRhV25em3ddhaXouBC0RDXkvlJ1Mt1dP8AXYHPTXqW7SxCVMn0ECMrTAI5CMlaA6Fk
X-Received: by 2002:ab0:209:: with SMTP id 9mr2449550uas.135.1627658212763;
        Fri, 30 Jul 2021 08:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627658212; cv=none;
        d=google.com; s=arc-20160816;
        b=e5iq834bEdShxbgo/XqvORbh5jjwgKJceQUTKCneIyS3KYWr8uZijc0SeRsTqI0Hk5
         7t7LQ9peN33pZoVI/TzepOVH5NShRjf/aVb0p9ORLU5lKKsdEF/H0T1VaRjLOJDpoRuh
         b9+yGNrzL1NWCL5D+oI1x7QjBXQoCDEirx/2oGq517puozhPxarARcatKS0gYadNnbGJ
         PRuo0Rc2X1yAzTnXvGG1Jze7o9kA3J2Be5kLDVjAD6X/46meOyWAk1J6Pjp7YMDb339T
         ZHXFMWsxfkUdKt1MKuhzgH/NCa4xVv0AabBs7Lp1lShcOKrM9ZD27KsEUFwYDksIt0mb
         jk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zjDrMTLlUOhiuTOt61+dB6ig0Qs43twSaUJnIxWi7s8=;
        b=YvdhaHCOmam+8/KguLZ2EXe8MX8IRClV9JumddulW9E2rLBk5e/TQgjg+Ixc1Ncyax
         DznQk82IAkPESR4UlLC+fjjF0ZDJPXkBFDbrNSY+ZZ6XdO+7x+yAKpa3SPlN8kXI2Wun
         unAgaweKHssts29NI3cADAeov5L6sqKzmSwischD0P6zWnvmVEZo2gXFkiew4pIwjyQz
         TaP4+T9nnjFsUEZTuvACB0t2IudJ1VlykGKsW3pYNawBeGvMr+vc77bZ1oSoxlsm0ImS
         qlw82MIC2nzwBoMatowPJt6Cf9ERxZ8nqa20zigr10g8p/DroWdlWn6NH9Avsp45VhnO
         Jb+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fAbWJjBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si938378vko.28.2021.07.30.08.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 08:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fAbWJjBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9UFo-0004jl-1V
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 11:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFd-0004jW-Ir
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFb-0008Rw-U1
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b13so888818wrs.3
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjDrMTLlUOhiuTOt61+dB6ig0Qs43twSaUJnIxWi7s8=;
 b=fAbWJjBMjpY51xzLf71RRL23MsBGRWqYx+uR5A/OE6vhnOD8DhDuyKm8e2AA1ncnb+
 wJDqKZq5dltdu+ckLOYTwtFLzkJFt+U1DH4mWaG5VX1PkmnM6TcjNgIk9/fRyfoG102G
 A/9JS97D9Ns7jKrChUPGBlV5i5RdBO6a9iAUwitBdliulEHI1rStft90lpNCKLiVpSph
 yo9kvL4Hd5BGj8+gbwtrp1n0dm1jRLNHwURaP5jyJJOIQUNEgVO5IXrCu9E0oB8Y+cFu
 cSjapCK7quY45JIepdUpQ+dFooIzWnspYjSghBDh8BryTZ5VCk7pyMqT1AhUAgg247AK
 LZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjDrMTLlUOhiuTOt61+dB6ig0Qs43twSaUJnIxWi7s8=;
 b=lfSxIZM4gZnDgHRJkBEuPPIkLqPuKUZHPSEW1MsT/oslOtqKOezgP2yMaGaPiVKGdk
 Ley5ZDZPNk7k2ZbPx9MGfhyuvJ6KsFUx84LpVwR1hHAkR2K5fEX51kh9YDXG/6KNwW9I
 H5Veewuy3hZQJacw+ReS7R/1GvkgU8KskArR/DxvSTvkPPjuTeFF9z0y5tln9aYbFqzi
 gp09w/vcjd5kdQk/3GlKn3USDD+d552R4E5XvrRG5G8OoXQSHwahzXYA0rn3t2tNtNVR
 iaKFcUJOVXjsWBnzrbCocolsyM4G0Bo3DYnyUUGZ6oNvWR+QXgLoBP1t3/j04QmKO2vw
 Pg+A==
X-Gm-Message-State: AOAM530XI4GWe41cE4ZmZ8ERKrGaoUTSuzyU714MMqNMGoErp5gVpEYX
 r7nHy9EY/FWjtGBj6oVEksFuMPRyDowPBQ==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr3648478wrp.123.1627658198493; 
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] arm: Implement M-profile trapping on division by zero
Date: Fri, 30 Jul 2021 16:16:34 +0100
Message-Id: <20210730151636.17254-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: fenx0pw+g7eY

Unlike A-profile, for M-profile the UDIV and SDIV insns can be
configured to raise an exception on division by zero, using the CCR
DIV_0_TRP bit.  This patchset implements that missing functionality
by having the udiv and sdiv helpers raise an exception if needed.

Some questions:

Is it worth allowing A-profile to retain the mildly better codegen it
gets from not having to pass in 'env' and marking the helper as
no-side-effects (ie having M-specific udiv/sdiv helpers) ?

Is it worth inlining either udiv or sdiv for the A-profile case?
udiv can be done with movcond/movcond/divu, something like:

    /* t1 = (t2 == 0) ? 0 : t1;    t2 = (t2 == 0) ? 1 : t2 */
    tcg_gen_movcond_i32(TCG_COND_EQ, t1, t2, tcg_constant_i32(0),
    tcg_constant_i32(0), t1);
    tcg_gen_movcond_i32(TCG_COND_EQ, t2, t2, tcg_constant_i32(0),
    tcg_constant_i32(1), t2);
    /* Either t1 / t2; or 0 / 1 to give 0 for division-by-zero */
    tcg_gen_divu_i32(t1, t1, t2);

sdiv is more painful because it needs to check for both x/0 and
INTMIN/-1 cases.  Some other targets choose to generate inline TCG
ops for it, though.

Side note, I don't understand the x86-64 codegen for the above
sketch of an inline udiv. When I try it the TCG ops are

  mov_i32 tmp3,r2
  mov_i32 tmp6,r3
  movcond_i32 tmp3,tmp6,$0x0,$0x0,tmp3,eq
  movcond_i32 tmp6,tmp6,$0x0,$0x1,tmp6,eq
  mov_i32 tmp7,$0x0
  divu2_i32 tmp3,tmp7,tmp3,tmp7,tmp6
  mov_i32 r3,tmp3

but the x86 code is
0x7f5f1807dc0c:  45 33 f6                 xorl     %r14d, %r14d
0x7f5f1807dc0f:  45 85 ed                 testl    %r13d, %r13d
0x7f5f1807dc12:  45 0f 44 e6              cmovel   %r14d, %r12d
0x7f5f1807dc16:  41 bf 01 00 00 00        movl     $1, %r15d
0x7f5f1807dc1c:  45 3b ee                 cmpl     %r14d, %r13d
0x7f5f1807dc1f:  45 0f 44 ef              cmovel   %r15d, %r13d
0x7f5f1807dc23:  41 8b c4                 movl     %r12d, %eax
0x7f5f1807dc26:  41 8b d6                 movl     %r14d, %edx
0x7f5f1807dc29:  41 f7 f5                 divl     %r13d

where the comparison for the first cmovel is 'testl %r13d, %r13d",
but the second comparison is 'cmpl %r14d, %r13d'.  That's the same
effect (given r14 is 0) but I don't understand why the backend has
chosen to generate different code for the two cases.  (Ideally of
course it would notice that it already had generated the condition
check and not repeat it.)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Re-indent sdiv and udiv helpers
  target/arm: Implement M-profile trapping on division by zero

 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  4 ++--
 target/arm/helper.c    | 34 ++++++++++++++++++++++++++--------
 target/arm/m_helper.c  |  4 ++++
 target/arm/translate.c |  4 ++--
 5 files changed, 35 insertions(+), 12 deletions(-)

-- 
2.20.1

