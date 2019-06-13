Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1591wrg;
        Thu, 13 Jun 2019 10:19:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3dEquCKgL4cYLM9VeOQhRQJNB+FAcaj4//uIdZB/0S/ysLNnkWIraSfByNdVrwcZtweeW
X-Received: by 2002:ab0:13e2:: with SMTP id n31mr38092706uae.61.1560446349881;
        Thu, 13 Jun 2019 10:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560446349; cv=none;
        d=google.com; s=arc-20160816;
        b=0cMBgQEqiGATFfsT3Y4a9jdrB426Zp3KNey0/zn6Yu4qmaHarILCvbV0J8Urv3Yttb
         BF/dI1lc6W5/Cd9xBH2qJNgLt8rIwFg5xwG76VLodqJymqoLeq+KKGe5bw2ea/dFlRt9
         MGvLY36sFYoc0OQVidC4sFJxksfivyKIQP3pyR0f+1EqhVsWGT/E+U0UEHoG7p/72SEw
         u3FLVKOpP+9SR3FtaJk0pAQrLyNymwdkAQrnxMc/Yrusyd2/ONHdI8GrR5ciY2GDmjAX
         WxVZ5TjLLcLfyub9vXBcIs0RMx7htmFAhe/L/0j3j4aQBYaps//UMQxPmzsifdNk5fk/
         dR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=Jkv2tV7T5KFrjVdetifVI23wGPLfGThH9CbytKhyysc=;
        b=HEUoR3Qd3DnVY8pjqkT9umkgsHkM9M3NsM7fqUCZtNVFWc+a93ou4olCMkRrWufVHR
         6ibrXCHYOd9oUZaKTtQXrg2zFaPbmuXpQ782YtVKSu5N/mzUwZXUetx2D3f4ZwL65OS/
         lZKzl3D/dGLKTurRXCECRSCICnrnDVXoxHtWIM//oEIYLy2qFMnFbaC34nRZBFmBe9HC
         1sZDpawLXMeAYRtCsLuH0xrEojTRvce7db4zptk8KKFsd3TTPWyimzEEPEABH76QC5mU
         A96Vjx1UZ0gDjYOPr/7paIZk1KXQrZ7kp3x7Vi17KNY8R8xJLhs62Oyv3pvGwZMvN0NG
         XpAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aJUikcpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si156445uao.234.2019.06.13.10.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 10:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aJUikcpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbTNV-0006JZ-DP
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 13:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlH-00040j-PO
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003KB-GD
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44233)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0001gC-7J
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id r16so2363113wrl.11
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkv2tV7T5KFrjVdetifVI23wGPLfGThH9CbytKhyysc=;
 b=aJUikcpn74iZg1Nl03coA+mYssTVs4eDaX56OzJ8VXXiYG+ufcQlGrRkBQ/7e7I28J
 rWUDiNC1N48aM8u5YTdOJ4bUUhsRJSAS9UThbgmvZzsLAaHkKRBkH/agCowrkqDfLVYT
 I0u1FgJ8EjPyzd/dmk9DmfTqFQY9hgV5Hw8nP6a0sQEcsynN+DBteC1EJBZqoLIb9csV
 c8kIPSxOOfe0evdfKng1SSJPdL58rZqj19oLH51ujgIH4cStt6kfeS0KAlVGppZaOEMP
 wf6hWVFLQGhUpRmWKmRBqOaQyB53HmTXpqP03YR4rDSpc8TMR2Dk0oJewEwuFtPRngBT
 +gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkv2tV7T5KFrjVdetifVI23wGPLfGThH9CbytKhyysc=;
 b=Hfnu0EVXF/bKgyt+/vTnoPdbpF75BGmK1KLqWiKHXw3fffLp1dZ2rvIDVCevimsvsu
 8uW0FsZCn5PZ4m9EpANG4JtnZEjK0/dE/FYySO7jI41Q6Tyzq+sV93VKM3E1Sw5emEg4
 r63SXypXSQ2Acz13rMoXx8fbD93Rb1mzRvMdwjeGqcJEwaw4N0w8vsa61HkCEB1A2Znf
 kzxCiUaN23XoW0t+XIvIfaP6llJ5ZPVMuvO06CaKvAXdS+rAZsbRNUsRGXh+bmamhlYi
 osHPgMwYfpSbHIE10YlDFZAg+vu6suSmJxMPthjhRKSImBlKORRiYiwhGVX9P0IopFXc
 pP9Q==
X-Gm-Message-State: APjAAAVklbNvIbq+aMKzzs8nbCcZeVmTDchuinWAIfec82JiKuBc5UBj
 XeVmhKQRs4RjL0lPO+uwHEX8XlgcX7uh2A==
X-Received: by 2002:adf:ebc8:: with SMTP id v8mr5747880wrn.46.1560443959155;
 Thu, 13 Jun 2019 09:39:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:05 +0100
Message-Id: <20190613163917.28589-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-arm] [PATCH 00/12] target/arm: VFP decodetree conversion
 followups
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
X-TUID: GYmkaI25Srx6

This patchset does a couple of the cleanup/leftover things noted
in the coverletter of the vfp decodetree conversion or discussed
in code review:
 * use vfp_expand_imm() for doing the VFP const-immediate
   decode, rather than hand-coding it
 * get rid of the final uses of cpu_F[01][sd]

cpu_V0, cpu_V1 and cpu_M0 will have to wait until somebody
cares to tackle the Neon decode logic and the iwmmxt decode...

thanks
-- PMM

Peter Maydell (12):
  target/arm: Move vfp_expand_imm() to translate.[ch]
  target/arm: Use vfp_expand_imm() for AArch32 VFP VMOV_imm
  target/arm: Stop using cpu_F0s for NEON_2RM_VABS_F
  target/arm: Stop using cpu_F0s for NEON_2RM_VNEG_F
  target/arm: Stop using cpu_F0s for NEON_2RM_VRINT*
  target/arm: Stop using cpu_F0s for NEON_2RM_VCVT[ANPM][US]
  target/arm: Stop using cpu_F0s for NEON_2RM_VRECPE_F and
    NEON_2RM_VRSQRTE_F
  target/arm: Stop using cpu_F0s for Neon f32/s32 VCVT
  target/arm: Stop using cpu_F0s in Neon VCVT fixed-point ops
  target/arm: stop using deprecated functions in NEON_2RM_VCVT_F16_F32
  target/arm: Stop using deprecated functions in NEON_2RM_VCVT_F32_F16
  target/arm: Remove unused cpu_F0s, cpu_F0d, cpu_F1s, cpu_F1d

 target/arm/translate-a64.h     |   1 -
 target/arm/translate.h         |   7 +
 target/arm/translate-a64.c     |  32 -----
 target/arm/translate-vfp.inc.c |  61 +++++----
 target/arm/translate.c         | 240 ++++++++++++---------------------
 target/arm/vfp.decode          |  10 +-
 6 files changed, 133 insertions(+), 218 deletions(-)

-- 
2.20.1

