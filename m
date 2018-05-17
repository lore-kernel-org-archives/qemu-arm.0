Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp522597wme;
        Thu, 17 May 2018 15:50:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoCn+KlLEji7CDw9Zrx32fYftco8TRVSfeyFmV7mO02CACoPPtSdMiSfbvICRpSKGkVxthV
X-Received: by 2002:a0c:946c:: with SMTP id i41-v6mr6970519qvi.139.1526597418079;
        Thu, 17 May 2018 15:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526597418; cv=none;
        d=google.com; s=arc-20160816;
        b=cKEtOhHLvzowG3G55NSgtFVrX6vu40AdGBar2y4ZTfLBTm+C/H7EPhVfeIv5E3zHmC
         SC3ym6UxZFoBOFIX4TmwNYZKaRLexvPrRICuoEHo4euwkUZQVVhhcSbAkk/HUqDfL070
         wKHwBJf7usNpOACtmU8psKkyzr2CQ31ukiI6tALZbDloYprI4gcIx7dJHoaN53Z1cK03
         LWGpH6QS/Mc2ddDLlAgaSXSi06Xt91coW7q4U1SbxvhDqaLw65SYE0MjrcXHFSVhJEJx
         4pg2uDa4yc1WJUq85xrTJ9tNbpjRQOEYdXbtKRayyBhGlTUzVweqF73vmWFjGA1NsHzM
         hO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=TtDHod7a37VSGFWO0WL3be2X5UYNkIhi8hi6Ty9xlxo=;
        b=D4GoLIDkNvntQZ87flOSTxrNFDfncJvVMjB4iG2jp+jBTTRwxg+O34mMHzwHILzTpl
         tZkySH/dbbCiS4+hu2tLzk5qX1deTLVAUx2HuxgP7WxmOkr64adHLwDN/pXf27AIhO/E
         ZzaQM4GfjqIiNfplJlhWW/ctLx6hz2rnIyNs1h8hRHX94FhUKTvHXYiE7iG4S0TMqC9Z
         1V78Q2kpe5aHrDWKfHrmbwpglzxXdNmEHr/1+iJhOAqBU9WCySH6qsR+DULRIDRZHQ88
         GE53KHtqEpkj5IRZ2b9LlD9x0uyDWllyW0pVrd97pO+V6efkAeSgKoM/ohvofkOW1wcQ
         85Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iNvg/pjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g33-v6si5777867qve.160.2018.05.17.15.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 15:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iNvg/pjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJRiz-0001TM-GH
	for alex.bennee@linaro.org; Thu, 17 May 2018 18:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJRii-0001Ss-Bk
	for qemu-arm@nongnu.org; Thu, 17 May 2018 18:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJRif-0006Ai-5A
	for qemu-arm@nongnu.org; Thu, 17 May 2018 18:50:00 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:46980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJRie-00069a-T4
	for qemu-arm@nongnu.org; Thu, 17 May 2018 18:49:57 -0400
Received: by mail-pg0-x242.google.com with SMTP id u8-v6so2429955pgp.13
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TtDHod7a37VSGFWO0WL3be2X5UYNkIhi8hi6Ty9xlxo=;
	b=iNvg/pjd7Kn4K1Qxy/6mNSddj7sG7bFzWCU2dCgCVs8jcvpa+8qbHoR4znsXIpn9oV
	iXAEIJvz5+z7OCkE1OukQiZm6FbWc+nzMZj2/FfxNDl6Xl0tTRz6hv818zf9Cs1lCK10
	G3TGompWSufATxCK7AoSR9tKd+BI4Jy3TRgi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TtDHod7a37VSGFWO0WL3be2X5UYNkIhi8hi6Ty9xlxo=;
	b=SLHhYbsq74eXlMyfsD7X8u0UkAhFT2vXqCf0c2pGYla5nTRDH7j7bzNxvqFKuC3ay5
	s+6vh2dUbxyyRCxlxfc7AUOGjB4bbjb0rNUZECgRR5vqSfy5tISJna+wvoZ/wwex9PiJ
	Du9KHlptyqANQpzT57St3vRH6k3a0sTl2FphdmNYefGt6/EJefTHOs5QDas3idG9b4sM
	8Ou60gHAlRQmXRH0PUDeCV1xp7fZFldXGJl+ktmX3OC2TpUClcigVc9alRLlmKnsWe2Q
	XVN/9d6rpBIkDR/jLFgW5QgTl8wARcuZQL4Gxjljuqub6prprhElZltqmBqdSSnGhxaq
	pQoA==
X-Gm-Message-State: ALKqPwd1mM6IH3HL9ofSUZLwqHZfBoXLHEB2EvgMnHoyaR+E+6eWbr+M
	8/seBoIPiAzve7LNuW6JzIVAfw==
X-Received: by 2002:a62:4387:: with SMTP id l7-v6mr6747462pfi.55.1526597395371;
	Thu, 17 May 2018 15:49:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm8678809pgn.64.2018.05.17.15.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 May 2018 15:49:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 17 May 2018 15:49:52 -0700
Message-Id: <20180517224953.11642-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PULL v2 00/28] softfloat patch roundup
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5eq+nd7h02ls

V2 fixing the two erroneous uses of get_fpstatus_ptr
within the aa32 translator in patch 9.

Only reposting 9/28 here.


r~



The following changes since commit a4207e3b00e89f934adb231057dcf9a75ac2ae45:

  Merge remote-tracking branch 'remotes/cody/tags/block-pull-request' into staging (2018-05-17 11:59:50 +0100)

are available in the Git repository at:

  git://github.com/rth7680/qemu.git pull-fpu-20180517

for you to fetch changes up to 377ed92679a2a5f838bc0a095112ea5020720fff:

  fpu/softfloat: Define floatN_silence_nan in terms of parts_silence_nan (2018-05-17 15:27:15 -0700)

----------------------------------------------------------------
Roundup of softfloat patches

----------------------------------------------------------------
Alex Bennée (4):
      target/arm: convert conversion helpers to fpst/ahp_flag
      target/arm: squash FZ16 behaviour for conversions
      fpu/softfloat: Partial support for ARM Alternative half-precision
      fpu/softfloat: re-factor float to float conversions

Petr Tesarik (1):
      fpu/softfloat: Fix conversion from uint64 to float128

Richard Henderson (23):
      fpu/softfloat: Merge NO_SIGNALING_NANS definitions
      fpu/softfloat: Split floatXX_silence_nan from floatXX_maybe_silence_nan
      fpu/softfloat: Move softfloat-specialize.h below FloatParts definition
      fpu/softfloat: Canonicalize NaN fraction
      fpu/softfloat: Introduce parts_is_snan_frac
      fpu/softfloat: Replace float_class_dnan with parts_default_nan
      fpu/softfloat: Replace float_class_msnan with parts_silence_nan
      target/arm: Use floatX_silence_nan when we have already checked for SNaN
      target/arm: Remove floatX_maybe_silence_nan from conversions
      target/hppa: Remove floatX_maybe_silence_nan from conversions
      target/m68k: Use floatX_silence_nan when we have already checked for SNaN
      target/mips: Remove floatX_maybe_silence_nan from conversions
      target/riscv: Remove floatX_maybe_silence_nan from conversions
      target/s390x: Remove floatX_maybe_silence_nan from conversions
      fpu/softfloat: Use float*_silence_nan in propagateFloat*NaN
      fpu/softfloat: Remove floatX_maybe_silence_nan
      fpu/softfloat: Specialize on snan_bit_is_one
      fpu/softfloat: Make is_nan et al available to softfloat-specialize.h
      fpu/softfloat: Pass FloatClass to pickNaN
      fpu/softfloat: Pass FloatClass to pickNaNMulAdd
      fpu/softfloat: Define floatN_default_nan in terms of parts_default_nan
      fpu/softfloat: Clean up parts_default_nan
      fpu/softfloat: Define floatN_silence_nan in terms of parts_silence_nan

 fpu/softfloat-specialize.h    | 691 ++++++++++++++++------------------------
 include/fpu/softfloat-types.h |   1 +
 include/fpu/softfloat.h       |  18 +-
 target/arm/helper.h           |  10 +-
 target/arm/translate.h        |  12 +
 fpu/softfloat.c               | 726 +++++++++++++++---------------------------
 target/arm/helper-a64.c       |   7 +-
 target/arm/helper.c           | 114 +++----
 target/arm/translate-a64.c    |  37 ++-
 target/arm/translate.c        |  74 ++++-
 target/hppa/cpu.c             |   1 -
 target/hppa/op_helper.c       |   2 -
 target/m68k/softfloat.c       |   3 +-
 target/mips/msa_helper.c      |   4 -
 target/mips/op_helper.c       |   2 -
 target/ppc/fpu_helper.c       |   1 -
 target/riscv/fpu_helper.c     |   6 +-
 target/s390x/fpu_helper.c     |  12 +-
 target/sh4/cpu.c              |   1 -
 target/unicore32/cpu.c        |   2 -
 20 files changed, 718 insertions(+), 1006 deletions(-)
