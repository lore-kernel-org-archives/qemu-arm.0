Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1359762ejx;
        Mon, 11 Sep 2023 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX5A5bjb369mrb0cdjDhhbOiFcLRbzGoFoOyK1SIWka/1WSaT5ZPnnqcHNl3+cJaniu8g4
X-Received: by 2002:a05:622a:5ca:b0:403:ae1b:c0e8 with SMTP id d10-20020a05622a05ca00b00403ae1bc0e8mr11455670qtb.41.1694440452745;
        Mon, 11 Sep 2023 06:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440452; cv=none;
        d=google.com; s=arc-20160816;
        b=D2ClIoPfC4ZXxau2TcxHC7p4HOyxTUZ3d+01bDr76nKWXafMfxF4FdAsmeKOYy5mRi
         /SGcgw78W7pO0cYSM7Tj5ufbJNyf7VAbhUclAXnrXJ723RXfmiey3lEcZ4ZkmxYGpLaz
         EmhRNXLBUgm3jpa8955dzmwvtvZVmN+pOTPtMt7SPucHIPv7jo8IctCeyzurMzjBfywA
         WLV/bV8OlpSDbnbS/0KOQgsEk4Y4mofDN33yWnjI7kzoBqJkj8yop7vjduzZRIHcI2KF
         BWkU3xCP0+JMeaLTPyCwMJ4XIr+2fBNqimzTIqJ9LWoJyBM9PidfkbOP6v1Z56hW9igO
         BqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=k0jBq4oF6jCx/majD4+9H6Sti+74uufIErJN9e/RdIs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=uXSRhF6oq30DFmBc/6k3rqAwaMFraQOU85FAhTravGxYypU2sjDDOVK+AS5yThhnLu
         txEuh00CLa5uddmLLK9VPxQoCgo+P7v1Q7rfBuh8dksTQcTwO2m7y+rJ8KWH5cUUKmE8
         J1U2DNExu8kMrTRVHi28nNjc3Pscq872Tt00t2Yx8XRVfq20600ueHbGnn0uvR3Gf3dS
         Av55Zhm4jvAflKvBW2NLrzV9Vt5EqpOLx9z5URLX+ig2dvc23N8dsO+62n13W51cqwnT
         fV+4W7giMoDEt5RA90d313R78b7xyNxMfKFBFG49lMWxx433GAVvnxe026rCQJKFAHTV
         A6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJuK+Gz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac87e90000000b004035b30ed1bsi4720368qtj.589.2023.09.11.06.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJuK+Gz6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMP-0005gv-Pe; Mon, 11 Sep 2023 09:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMO-0005gH-GE
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMI-00039I-2I
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso3595081f8f.1
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440423; x=1695045223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=k0jBq4oF6jCx/majD4+9H6Sti+74uufIErJN9e/RdIs=;
 b=KJuK+Gz6gfyisUU9hM+bwrXKV+iDaECheoZP1z7gqd5q0jq7eaeXseroWxQU92HSKs
 qePG3N2FkJSMfL6fzLCWsFU+yyan9BzLUtAhmorDKg8BUPBu9rII2ua+dss6nwdaDyZs
 XMZ5hZvLJ1vv6gqMxy7hlqU+f6v/O+kyYxYdRmflzNSITl3U1OrinVMIcFqOdmXyz7TC
 cvCMVygeZ34BOgZtPJHBSAzlwK3HI9L0ZEg7K//RW0DYszvgBGV4HWNeFXmu40bMUSKP
 q80Bdf3sL3jkqvwqOuCQNZ+Tm60+Vd+kPWUKvwDqlEh6NAEgM11jKfM/YeooLMBvKjf0
 FDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440423; x=1695045223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k0jBq4oF6jCx/majD4+9H6Sti+74uufIErJN9e/RdIs=;
 b=sMx247OadBmqng43v2LhxocHw2PXvzI/lG1ECdlotywn51wVa1yrGqJ9njjdT5wowt
 y4GyMXbt8kAH0/OpXX1BMb9A7GqlfnQUkGaNDqK+3ovdp3Y8RyaySs7HmAmFmZ9e21Mt
 oo5H+tE2D8vZOfov8W/UcGXsDCS8hrAYRcKcto9rHIfsrA5IMLaheYHRk1ndVl1yPjiV
 aL1umJ57P1uW+QYVNJ6bHtyyFZ/zgSvzooW7EwXl7ZwWZppQ0skDNYtEJUetOEkD78sH
 kn2RufpJP1IbTLV40Hg1QLDS8mEdVoYDieb2r+rURj8lphdGjq6khwkrtCt5jzVz1iaG
 hRPQ==
X-Gm-Message-State: AOJu0Yw4CthpbI15knZhiRUTM0Y9L9a70NEVFIcNFPJypo5P+K+FSuxO
 EjmfUsPPEr8tU92qoowjAyTm6hFDXnYRFAjE4nU=
X-Received: by 2002:a5d:540e:0:b0:319:55f9:d50d with SMTP id
 g14-20020a5d540e000000b0031955f9d50dmr6664320wrv.33.1694440422993; 
 Mon, 11 Sep 2023 06:53:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: hwcaps updates, FEAT_HBC
Date: Mon, 11 Sep 2023 14:53:33 +0100
Message-Id: <20230911135340.1139553-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qcowbj6mEC3r

This patchset started off as "implement FEAT_HBC" but I ended
up finding I needed to do a bit of cleanup regarding the elf
hwcaps bits, so most of the patchset is that cleanup and the
FEAT_HBC is the simple patch at the end.

Patch 1 is the ID_AA64ISAR2_EL1 that's been on the list multiple
times already. It's in a target-arm pullreq that's already on
the list, so I've only included it here so the series compiles
as a standalone patchset.

Patch 2 is a bugfix for some errors in feature string names
in the emulated /proc/cpuinfo.

Patches 3-6 update our definitions of hwcap bit values from the
current Linux kernel source tree, our ID register field definitions
from the current public system register XML, and make sure we're
in sync with the kernel about what hwcap bits we report and what
ID register fields we expose to user-only guest processes.
(The only actual bug fixed here is some missing arm32 hwcap bits,
but the rest of the changes are useful to, for instance, let us
add FEAT_HBC support.)

Patch 7 is the actual FEAT_HBC support. This feature is a variant
on the B.cond conditional branch that provides some hint
information to the branch predictor; since we don't do branch
prediction this is easy for us to implement.

Patch 7 will have an obvious trivial textual conflict with
the FEAT_MOPS work; I suspect this will get in first, since it's
much simpler. I also forgot about the hwcap for FEAT_MOPS, but
once these patches are applied that is a one-liner fix to add
the GET_FEATURE_ID(aa64_mops, ARM_HWCAP2_A64_MOPS).

thanks
-- PMM

Aaron Lindsay (1):
  target/arm: Add ID_AA64ISAR2_EL1

Peter Maydell (6):
  linux-user/elfload.c: Correct SME feature names reported in cpuinfo
  linux-user/elfload.c: Add missing arm and arm64 hwcap values
  linux-user/elfload.c: Report previously missing arm32 hwcaps
  target/arm: Update AArch64 ID register field definitions
  target/arm: Update user-mode ID reg mask values
  target/arm: Implement FEAT_HBC

 docs/system/arm/emulation.rst  |  1 +
 target/arm/cpu.h               | 28 ++++++++++++++
 target/arm/tcg/a64.decode      |  3 +-
 linux-user/elfload.c           | 71 ++++++++++++++++++++++++++++++----
 target/arm/helper.c            | 15 +++++--
 target/arm/hvf/hvf.c           |  1 +
 target/arm/kvm64.c             |  2 +
 target/arm/tcg/cpu64.c         |  4 ++
 target/arm/tcg/translate-a64.c |  4 ++
 9 files changed, 118 insertions(+), 11 deletions(-)

-- 
2.34.1

