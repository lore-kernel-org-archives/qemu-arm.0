Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCCDC44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 10:59:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVw5-0003ae-RH; Wed, 21 Jan 2026 05:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw3-0003GX-8b
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:39 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw1-0007w7-9m
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so539575f8f.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768993176; x=1769597976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xOTSclcs1qm3AW4VgmJ74H0mVLzF3969HljuRmIapsw=;
 b=aDp+F4Bh7Vo8E9cQnAx+XC9Z7cSi7vOB+UMloPZp/dckk26Cmn5QJhWnf1TJejLhfU
 sGRwuUd08iMkvexARd9EW1BehfX4JUMPwyoWZmulDysKTPpW5BpQhQFxRLzXAy6/D+f9
 wczLaIX69HyPhdJ7KA3TKhZOejrQ/Hm0r2U0pAViCj1mwGZXdNk1abGsnMX/ALP3WUzD
 GpWV3WstbcyzBA8urSk+9jHivlCDgIK9t7aUoLnz15Tzm3s/1vpg63eySyLT0pHIE2H8
 hoNZT6nJf+umzsLNimRISYR2taRSEJky7y1WB5YSaOk7co+0MVkTykgagodE5r0QqWeS
 r4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768993176; x=1769597976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOTSclcs1qm3AW4VgmJ74H0mVLzF3969HljuRmIapsw=;
 b=K110o23xOdlU7e4ZA+z1FPv/EP9LJLk9tgyzOPHogA8l+c1doBmxWX//5E0E/pHFaj
 Zavb/nZ8+kts7RHgGCPtZlskHf0d7cAbht3QUSm+qkyWSmmX8pu2lfd1vZAVv/X8Bi4P
 0ZrdXPoh6p8VxXVFAHmF31Be+1BpS8K6g5U6ywil4zSKZ+4fRAF+mCz1Gv8VcktjXrU8
 ufp4dmwQEAeY+/SE8fTGhOHN74OFbQPdTJyOJrtIYC/Pwk3VCX9oFz05c4m1RhobWVRT
 YoAPyj9ludBcMujWQExS3aZZc1v4WIX238Vi3QD7Wjrzdw6OCj7P8L26KtFdlLrPOK5f
 pl4w==
X-Gm-Message-State: AOJu0Yz8FfN8HXvOaiZZaMK6IH4q75jEm7Cv2Mo+2fhqLcdC0JvKkTbQ
 moRqtw9cJrRJW27kZPsKvc+KfEe6XnP3m/C15/D7xn2KB+qdJQJwX0Wsuld2SZrig6Q=
X-Gm-Gg: AZuq6aLUhXIU5fp2HEaJO7LW1xwU8FgAL+XPy+jrV7JqkZ3EVaP3lGCcNNNTzKKSgyh
 04y/2x4dvxRWBrgky+2mh+1T1yfwQ2RKdhxyK2a9Fn77h9R0CAPSYwmcbMJurRMX+n/dwOY/pjT
 RV0kIHl8kEwY+ZzZzdsxnPA8zaUo9syLrpZfhfuQ1hzFVEjti3Bm15c5WRi2Rmk1v8+h30fo383
 dPWh+uXQihp55Gaqdlux/k9WNvHQI2zpXYkilKldSgnhHYkC5rmU82yBUb4K9sGbLVbcr0ImcXE
 nhDfFJzdeVlCj/oaJe+eKsotj9XeFaO7ueEg/8+OUd53WHGDXP4f7LxdjjSF06/6JG3pwX+b5eK
 0NY8Yp8Mf9LSP4SpRt9x9wEgmAtlpx+jm1V0Fvav5WUSPxM/8cXu4R1h3YKKwNt0c7AJJlTzbQ8
 CCNZ8nX87g5xFL
X-Received: by 2002:a5d:5d07:0:b0:431:66a:cbc4 with SMTP id
 ffacd0b85a97d-4358fed7986mr7898914f8f.17.1768993175675; 
 Wed, 21 Jan 2026 02:59:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cefdsm34524352f8f.24.2026.01.21.02.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:59:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 62A7D5FDE8;
 Wed, 21 Jan 2026 10:59:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] GIC DEVICE_LITTLE_ENDIAN clean-ups and potential bug fix
Date: Wed, 21 Jan 2026 10:59:28 +0000
Message-ID: <20260121105932.135676-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Following on from my RFC on Monday I have split the
DEVICE_LITTLE_ENDIAN changes apart from the corner case bug fix as
well as updating the other GIC regions.

Alex.

Alex Bennée (4):
  hw/intc: declare NVIC regions as little endian
  hw/intc: declare GIC regions as little endian
  hw/intc: declare GICv3 regions as little endian
  hw/intc: avoid byte swap fiddling in gicv3 its path

 hw/intc/arm_gic.c              | 12 ++++++------
 hw/intc/arm_gicv3.c            |  4 ++--
 hw/intc/arm_gicv3_its.c        |  4 ++--
 hw/intc/arm_gicv3_its_common.c |  4 ++--
 hw/intc/arm_gicv3_its_kvm.c    |  2 +-
 hw/intc/armv7m_nvic.c          |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.47.3


