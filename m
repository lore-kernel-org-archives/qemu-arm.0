Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CF4C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:41:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMKn-0006zd-Pw; Thu, 02 Jul 2026 14:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMKm-0006z9-By
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMKk-0005KF-KR
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:23 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47488efcf30so1329540f8f.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017621; x=1783622421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDcqTMrFmkLoqrrgt4P/XEoC/b0P+9HKI5m9xYzf55M=;
 b=a2PMM9x5iV83zW1ace4ali1Ui3U4ouzbeHx/ZQ9Zlg5wfiT7q6a8hK5nqZma7h2/hf
 MUTvBLwKOjOQg8kqwsChWyttaTx6HY+1zgNWauRBJyE/cb45hAYG6JptziraBBKHhS3d
 hEdaELGovuRAr+Kq+dxxe5VAEo0R2IlpKvYs6nz7B4edciHRhoF5W09sFBRf+cgrKKN+
 k8O8iwmKHH2M+OWXL1tQVgeibeUaeIISip67Gcro3hbAHbhPeu4lezrzyuDC20HAcRFc
 R7zhfgLXIt7QpQp373PgryF/bs7S7aZShIoWucqsLRxMky2Mamoou8abYYiMbxn/QZ7+
 Y8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017621; x=1783622421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDcqTMrFmkLoqrrgt4P/XEoC/b0P+9HKI5m9xYzf55M=;
 b=BS6sU/tHFNEEWVpNUwwqRa7AR9EDgGaQt8C+Ef9n1rs0hAkpj3+AD06nyDDs02CfFQ
 Hk5WhDQ4nK5bAFT00K4cSrNTe5dvYv4qdZbqfepnpHFTLqqhTUJS+uFgGxuUVEG6CZlj
 d0PP3H8mz1l5VOLBXUL0ZbCoxryfIAZ4mOG9DLwayFge0AFFqw6zuP/9XeBUSOKMYSYc
 3Y5u9g5wAyAmPUUbt58+dHKeukw3ohcn/Mw9ZD7QhniGBmxhMPAzsQ3I12WlXenGADK6
 sMAmVhAYL/us9nwu5ivb62r+Q3E/y/orFfOO5XYTSD5OCVqiOrrR2FMt9ZrWTUUHIVNU
 XUSA==
X-Gm-Message-State: AOJu0YxST2PYe2e3acSZDJqtG/pbzytJix+h883R012NjHB3rIkSSByx
 oMkYgNJ++pOxrIlwkxiYv4aVWfIo82dk0vXe4tvuZo97QaKq8l6t/w7dIwegt6HwxsglMnIVMS/
 Dxn5+3um0nw==
X-Gm-Gg: AfdE7cm9TVnL80QW0ntj2cYa6FW4PyXnyI9Uqq/72H6S6siU59kGDD5YaNE4vmfRFop
 bl6Id2p9lkYGX8gIu9UnkERdVPOxrPtmXKFduTDZ4dPLxKjunpGunRqx5PC7bcsG2+Uq2IZVPe6
 WiJkZb9MhGGMz79p84NHVxlyjy5iR/KDDbhIqRo3RpzIF0RAcPgsV58LH1aUMEbcC/fvyEyMSI4
 4XXZbW1487F6UW8CMtd1d75QlVOYJ8o4UdE8FT/edFODkKsNQTV9XN1ID2q3JCugfhmsRIYF/I3
 C/QGf0yfariob34JndkztJU6Y+vjkF6RAC8c9lsjDTdtcAircy47w6FKCJWkK8yxm1UjPpjfa8o
 nJgqAJ24PJMPQbJKzpNWnJwq+FVJp5QCn3qj5+0TEqHawyRkg2X6raqBoPMxxStrHgyyZFxSa6y
 Og2Bn++XuRF+akO8MWWeYHJWrAAeRcNgTCy9ASXfoKrylWzccOo1MBUMma6/CbN3A88qdEXQ2ni
 kmvKGfcER9einzwSuHNcMyNxWKkIkXW
X-Received: by 2002:a05:6000:41f8:b0:475:f0f0:9ef6 with SMTP id
 ffacd0b85a97d-4775b7447f7mr12157033f8f.59.1783017620826; 
 Thu, 02 Jul 2026 11:40:20 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/arm: Fix some Neon trapping corner cases
Date: Thu,  2 Jul 2026 19:40:08 +0100
Message-ID: <20260702184019.3431139-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

There are a couple of corner cases in trapping of A32 Neon insns that
have been kicking around as issues in the bug tracker for ages; I
got round to fixing them today. They're related in that they both
need us to distinguish Neon from VFP insns at the point of checking
for traps.

The first one is a bug, where we aren't reporting the correct syndrome
information for A32 VFP and Neon insns that are trapped to AArch32
EL2. These have COPROC and TA fields in the syndrome which we weren't
filling in correctly. (When the trap goes to AArch64 EL2, the fields
are RES0, which we do get right.) It's pretty obscure, though, and I
know of no guest software which might actually care about distinguishing
Neon from VFP insns in the hyp trap handler, so I don't think it worth
backporting to stable.

The second one is a missing optional feature: there is a CPACR.ASEDIS
bit that lets software force Neon insns to UNDEF, and also a hyp trap
bit HCPTR.TACE that lets the hypervisor force Neon insns to trap to
it. These are architecturally optional but in practice implemented on
all CPUs except for the Cortex-A8.

The third one is another missing optional feature: CPACR.D32DIS lets
software force VFP (not Neon) insns that use D16..D31 to trap. This
is rather obscure as it goes away in v8A, and of the CPUs we implement
it's only present in the Cortex-A7 and Cortex-A9.

-- PMM

Peter Maydell (11):
  target/arm: Separate out Neon from VFP access checks
  target/arm: Separate syndrome functions for A32 and A64
  target/arm: Report correct syndrome to AArch32 EL2 for trapped
    Neon/VFP insns
  target/arm: Define fields for NSACR
  target/arm: Handle NSACR.NSASEDIS in CPACR accesses
  target/arm: Handle NSACR.NSASEDIS in HCPTR accesses
  target/arm: Update confusing comment in cpacr_write()
  target/arm: Add new feature ARM_FEATURE_NO_NEON_TRAPS
  target/arm: Implement CPACR.ASEDIS and HCPTR.TASE
  target/arm: Pull VFP "can we use D16-D31" checks out into a function
  target/arm: Implement CPACR.D32DIS

 target/arm/cpu.c                |   2 +-
 target/arm/cpu.h                |  16 ++++
 target/arm/helper.c             |  93 +++++++++++++++++++----
 target/arm/internals.h          |   8 ++
 target/arm/syndrome.h           |  28 +++++--
 target/arm/tcg/cpu32-system.c   |   4 +
 target/arm/tcg/hflags.c         |  93 +++++++++++++++++++++++
 target/arm/tcg/translate-a32.h  |   1 +
 target/arm/tcg/translate-a64.c  |   2 +-
 target/arm/tcg/translate-neon.c |  74 +++++++++---------
 target/arm/tcg/translate-vfp.c  | 131 +++++++++++++++++++++-----------
 target/arm/tcg/translate.c      |   2 +
 target/arm/tcg/translate.h      |   2 +
 13 files changed, 351 insertions(+), 105 deletions(-)

-- 
2.43.0


