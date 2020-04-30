Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2193689lfm;
        Thu, 30 Apr 2020 11:11:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypJzcbxxAEeS+867enFTxAisosxqBsHJJAG4VD6tLHOhgNUjwhc2pW1s4uobKYVBH57zdxpd
X-Received: by 2002:ac8:4e81:: with SMTP id 1mr4987204qtp.58.1588270279166;
        Thu, 30 Apr 2020 11:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270279; cv=none;
        d=google.com; s=arc-20160816;
        b=pXVWBaI8I/q0i4gRTNZ9ekm7IUp4wJdvXrNEtlo1/MvDml1QnZZZhAs9su5u9ETfi3
         kppMwyL25dPWwMib3u6akquGu5CcOuK3ngc1zgyyoM73V+tqwIbXacn4vf921RrSOgKX
         ZIrLX37TPgFbmq3oEHCCOfYCu9RR0JRIGDHJ07xzpWvA9Z4A+qN7G7hMajDRotgurCyy
         DdlZZTbktPS1NLXx+5MU/ac6w+Ahd+tODaI548kYc2iNFej9O/nQGdHxgKI0N2StNJ7T
         OHhovfEosNtDTESGnPnt15ICuB5aWbIghb6dx66Ti3jmLYq1U3sqrfzMJ6u6GABKuM1b
         X2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=QSCkMIU3/qtFoswudN1xA9osD+mc7a0ztbpDr62YSng=;
        b=0Z3s6dcH9HzP0aru04nGYSdAjP3B01ovPk9/tDGzj6IZqbSNerXXgVPepw5HAsegkF
         t5/IYE5HD91cWxYmw+9956THc1bJRGsIBz6MF0Pgd5gAenrHYy5/GAVknPFW8Q3gJLNn
         yq4NoUcdor30jMrxlYAVgcYm5UATI/0e6Niyb1DLUbCLcgcEnfjEB7aAjfpb+P3fAVd9
         VUIpABtMkMb99v0VyiGkEKpTKn5qKKLszglSFh6IA8xq1wk9+B7DrLxkamT8DEl1L783
         0TaHb5hcNs2RiW85N1w0ATJo4EgFTC387Efrp5D0IEOwn4XAjJYP7SSwacQrEKFY342n
         53BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2cx9Glj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a17si259002qtc.293.2020.04.30.11.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2cx9Glj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDeY-00022r-93
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdp-0001Nf-Hp
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdR-00009k-4E
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdQ-00008x-Lq
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x17so8172830wrt.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSCkMIU3/qtFoswudN1xA9osD+mc7a0ztbpDr62YSng=;
 b=P2cx9GljKb7WlY7v2GyZq5xONoPFQ+DkCJFsmKiptJtgHjPaGg2lp2HdcahwjrHP0m
 wpn/0TYgF3eCiXJ/akUBHp5kqRp/IACA+ITpL/is9pRDPN5If0sILNhw9+YOur2Q2oBb
 kOWAYADpV7DIWB6WNZjuOJfQtZ69S4/N8Vz/FJgiaW7l0wrVLyYt1H5rJGwFN089kyUm
 uFp2vAJFN3XDwqH7XpU5cCaXLTwr2XZ9To1HfSfnWbNJ1LRhku2ouX5/15B+ix48JhZe
 KS4EkSU4pbBv91PKCuptoxSs5o01TRjZIrX3il2Ad4veHGdTU2j7Fj7rlOJniAJCD0dk
 ClZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSCkMIU3/qtFoswudN1xA9osD+mc7a0ztbpDr62YSng=;
 b=gfaBaZyuogewIMnBiQT/Xspk46bBDo/MuzZsEM+U/rWAKENRnj1LCk0KY50SkgZ27G
 y2+aI8lipXpyBuitvpd2MeCR9t0u62KIlVmE+kBR5hTR/jYvcek6kGuWQUcmU22v9lnp
 cSFCcM9VYH7S+xKWyURm6pzaFTwhYoMt8anBLErcygK4C6kiPFpFlQrvV380lCYRS8gi
 7jFg/cxkhmVhTLb3TI9sMZa6NxQ0N5WdSX9rRjKD1llL83uUPcL4ICKNIxmPZg+tX5Ku
 6QRQm3nBxJOS0XjZa070XJFAhy/iKmsizgyLRTrLIlL3nmm1wPvYM5yiD8dubL3oru9+
 Eznw==
X-Gm-Message-State: AGi0Pub7+6/nLVMBq17/kWroI77qeeY2qtwpWc/3Q60lM/LbyeU0LcKF
 th5b+9ElP8O5b2nsV0RESOXWZzpb+BAnsQ==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr5384700wrv.260.1588270206625; 
 Thu, 30 Apr 2020 11:10:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/36] target/arm: Convert Neon to decodetree (part 1)
Date: Thu, 30 Apr 2020 19:09:27 +0100
Message-Id: <20200430181003.21682-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::42e
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2CsfPiM/qlG

This patchseries starts in on the job of converting the Arm
Neon decoder to decodetree.

Neon insns come in three major parts:
 * the 'v8.0-and-later' extensions
 * the 'loads and stores' group
 * the 'data processing' group

This patchset converts all of the v8.0-and-later extensions
and the loads-and-stores, plus the "3-registers-same" subgroup
of the data-processing insns.

I'm working on the rest of the dp insns, but this seems like
a pretty large chunk of conversion patches to start with.

thanks
-- PMM

Peter Maydell (36):
  target/arm/translate-vfp.inc.c: Remove duplicate simd_r32 check
  target/arm: Don't allow Thumb Neon insns without FEATURE_NEON
  target/arm: Add stubs for AArch32 Neon decodetree
  target/arm: Convert VCMLA (vector) to decodetree
  target/arm: Convert VCADD (vector) to decodetree
  target/arm: Convert V[US]DOT (vector) to decodetree
  target/arm: Convert VFM[AS]L (vector) to decodetree
  target/arm: Convert VCMLA (scalar) to decodetree
  target/arm: Convert V[US]DOT (scalar) to decodetree
  target/arm: Convert VFM[AS]L (scalar) to decodetree
  target/arm: Convert Neon load/store multiple structures to decodetree
  target/arm: Convert Neon 'load single structure to all lanes' to
    decodetree
  target/arm: Convert Neon 'load/store single structure' to decodetree
  target/arm: Convert Neon 3-reg-same VADD/VSUB to decodetree
  target/arm: Convert Neon 3-reg-same logic ops to decodetree
  target/arm: Convert Neon 3-reg-same VMAX/VMIN to decodetree
  target/arm: Convert Neon 3-reg-same comparisons to decodetree
  target/arm: Convert Neon 3-reg-same VQADD/VQSUB to decodetree
  target/arm: Convert Neon 3-reg-same VMUL, VMLA, VMLS, VSHL to
    decodetree
  target/arm: Convert Neon 3-reg-same VQRDMLAH/VQRDMLSH to decodetree
  target/arm: Convert Neon 3-reg-same SHA to decodetree
  target/arm: Move gen_ function typedefs to translate.h
  target/arm: Convert Neon 64-bit element 3-reg-same insns
  target/arm: Convert Neon VHADD 3-reg-same insns
  target/arm: Convert Neon VRHADD, VHSUB, VABD 3-reg-same insns to
    decodetree
  target/arm: Convert Neon VQSHL, VRSHL, VQRSHL 3-reg-same insns to
    decodetree
  target/arm: Convert Neon VABA 3-reg-same to decodetree
  target/arm: Convert Neon VPMAX/VPMIN 3-reg-same insns to decodetree
  target/arm: Convert Neon VPADD 3-reg-same insns to decodetree
  target/arm: Convert Neon VQDMULH/VQRDMULH 3-reg-same to decodetree
  target/arm: Convert Neon VADD, VSUB, VABD 3-reg-same insns to
    decodetree
  target/arm: Convert Neon VPMIN/VPMAX/VPADD float 3-reg-same insns to
    decodetree
  target/arm: Convert Neon fp VMUL, VMLA, VMLS 3-reg-same insns to
    decodetree
  target/arm: Convert Neon 3-reg-same compare insns to decodetree
  target/arm: Convert Neon fp VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS to
    decodetree
  target/arm: Convert NEON VFMA, VFMS 3-reg-same insns to decodetree

 target/arm/Makefile.objs        |   18 +
 target/arm/translate-a64.h      |    9 -
 target/arm/translate.h          |   26 +
 target/arm/translate-a64.c      |   17 -
 target/arm/translate-neon.inc.c | 1577 +++++++++++++++++++++++++++++++
 target/arm/translate-vfp.inc.c  |    6 -
 target/arm/translate.c          | 1200 +----------------------
 target/arm/neon-dp.decode       |  186 ++++
 target/arm/neon-ls.decode       |   52 +
 target/arm/neon-shared.decode   |   66 ++
 10 files changed, 1967 insertions(+), 1190 deletions(-)
 create mode 100644 target/arm/translate-neon.inc.c
 create mode 100644 target/arm/neon-dp.decode
 create mode 100644 target/arm/neon-ls.decode
 create mode 100644 target/arm/neon-shared.decode

-- 
2.20.1

