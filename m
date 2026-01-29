Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B764D6100B
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQJ7-0002Nv-Ai; Thu, 29 Jan 2026 06:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIj-0002CC-Qr
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIf-0007ko-HO
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso6549055e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686497; x=1770291297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jC9qLuc2CCbEtH481L2TMiLEHw029Qtt0ng0mG6BJ2o=;
 b=r4S6GX22YLF6KxJAKIRiilr9/pYSA4S6WsfPyxaSThdACHYqjOGOxcFKDQoSnbjrP5
 5ikzmIPUlvM9xN5fJWxOtYh5mdEI6CPseGv7nlcXp2mvl2QrFsaQlMcvlhATihC+IBl4
 0MqrKIHr8mbo7BHYANpTar3SIg361pzwV1+yyNbagY7br2Usz6NdslIQeWED4T5eO41u
 3ISXxRdjatZr9FfOaIi98RVYuFcFMpLlSqqs5ovNb6E58uYEFy+aA+gPnYL2z1Gc1nuS
 oj4MTL8g5/Dak45fsHos30Jsmhl7OWW6Mv37qrloMTIDn7qaHrOZhUHV4kPzKe4rR0eM
 r9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686497; x=1770291297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC9qLuc2CCbEtH481L2TMiLEHw029Qtt0ng0mG6BJ2o=;
 b=rMA6T6iqXdSQnZHgBYuvcxySU9FLVbL6Nm5jG8G5EougkWkGgPMkDKvN3JhcHRj3Z8
 KinU8s6oOe/93K+TUKx7sD9z4KrAqzJ2QhUZx4dsdOiWMd4VXap7yFs0pcTfwpXRoqB0
 3c2vvX+6VE7544+oPrV08+gzi+PeOqhjfrrAO6WDL2mlWRoVDhgOjL+zwSqnJgXbsdBX
 Q1mf/WWcssHmhNDLGQGwG716eYI/o90NbwJkh9OStrIQscjM8MkPlfKi+ON62E8dAG5p
 eXvbB2f94q1mg/NETV+jjRS3B8YsYYvmfYrZTt5sLkBgcOY9oYoAAFKIL9TTjGjhUHO0
 rJ/w==
X-Gm-Message-State: AOJu0Yw4Tr3f5AFJna6n0YB+OOYTLjK8vYpYZks9xQUGWWS9kS6FzoyA
 NwWrHUUE+7iKRTOMA3x5VpgQ9wAgNLiPzH3IIdaHQzawnUwbf64FCq/Hosmh6/EWkFq2jfl+cfr
 MGClcdFc=
X-Gm-Gg: AZuq6aKd4U0ehLHKCLTpYAjyQAuCasqECEbYYRL5WYrFigeNbne8Djl6KZVW9a3hodY
 b/mh5Dm3wMz7t7Efi1e+ALzoAdydZaafDdTFqiBjlgToJM67f/pZQLWKJ8VaQW7mjLoaPBNCG6P
 5Pa8CQStxqiZB+AzHRAtZND6O/vM7ecBomrFlpnEMBS3EWgzh8Ja0g5TWkiLg52ZS2C/bD//SR7
 qB1FehU+7FUwNJrudTFmeXTR/UP56hKEurH1h3V18UvHyMW5Wt+8/zNsMJob5D4GFmAVb5DVfXZ
 H6CPp216at1W0i2SoIkjPyrcQGyboprx3Q7g2thlq8hQALpsHol7mTYbTC9GmG+Pp3OV0M+8p/M
 nMfbiliX/Msm406D8ydEFHdZYBDrwW/xi/XhBZEvnwhNVvmCOMUbR/sEze9VjsvFz1Gpw54iuy2
 QQxkGZrdgT21qmJyeYh1wsMYKMoDfORtsZODtEJ2ud
X-Received: by 2002:a05:600c:4746:b0:47e:e9c9:23bc with SMTP id
 5b1f17b1804b1-48069c5547amr112824575e9.30.1769686497361; 
 Thu, 29 Jan 2026 03:34:57 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm196311075e9.14.2026.01.29.03.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:34:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 0/6] target/arm: Allow SME-only TCG CPUs
Date: Thu, 29 Jan 2026 11:34:49 +0000
Message-ID: <20260129113455.1283266-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

These patches add support to TCG for a CPU with SME but not SVE.  We
originally prevented users from doing that in the run-up to a
release, in commit f7767ca30179 ("target/arm: Disable SME if SVE is
disabled") by forcing SME to off if SVE wasn't implemented.  This was
a simple way to avoid users hitting an assertion failure.

Changes since v1:
 * reorder patches to put the ones that affect SME+SVE
   CPUs and are worth backporting to stable first
 * change approach to fixing the smcr_write() assertion
 * fix a non-SME-aware assert in aarch64_sve_narrow_vq()
 * correct a bug in how we report the vector registers in
   the gdbstub: this fixes the problem where gdb hit an
   internal error when we emulate SME-only CPU
 * squash FEAT_SME_FA64 on SME-only CPUs

This has still not really had a great deal of testing, but
I think it's now good enough to remove the RFC tag.

thanks
-- PMM

Peter Maydell (6):
  target/arm: Account for SME in aarch64_sve_narrow_vq() assertion
  target/arm: Report correct vector width in gdbstub when SME present
  target/arm: Handle SME-only CPUs in sve_vqm1_for_el_sm()
  target/arm: Handle SME-without-SVE on change of EL
  target/arm: Squash FEAT_SME_FA64 if FEAT_SVE is not present
  target/arm: Permit configurations with SME but not SVE

 docs/system/arm/cpu-features.rst | 10 ++++++++--
 target/arm/cpu.c                 | 10 ----------
 target/arm/cpu64.c               |  5 +++++
 target/arm/gdbstub64.c           | 12 ++++++------
 target/arm/helper.c              | 14 ++++++++++----
 target/arm/internals.h           |  9 +++++++++
 6 files changed, 38 insertions(+), 22 deletions(-)

-- 
2.43.0


