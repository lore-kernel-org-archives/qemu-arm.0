Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70448CDB481
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 12:47:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcMzQ-0003Na-6P; Wed, 24 Jun 2026 08:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz1-000386-VE
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMyx-0006Mj-F0
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-463b2f6fc9dso1134994f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782305130; x=1782909930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E51fzciGP16X57K6+5mbVdSS6Z/a61UsdP0TMTQdK3U=;
 b=yTpfNqpd1w+UbPpGCcbteBRLCE2mkyaeUtB7R9P9YPAel/thM09P2QheItJ77XJFV1
 EkvNvAtq+BjSSwwd3x+184tuV5K9JPj/t0ScEno9O+aJxWk5lwH+FofcSlTJ5uUEon3M
 ujJwix1A3ENff7kzDAWbrhlOwayz3aOnMxNe1XF1uMf9qgTGbDI/cCB/p+ZnCARGba8b
 KD+MEFzvGXOsBKqyZ5HFhmeBfVOtyPBBqu/DkUyqCBGFuz89fCw5mrLNqDLJNuyemoRa
 ZZyc1pA9e96pEmgdqHxUBXnUZlH57ShjjGEoW5IxqCb9MMXbkxwWGfVu/qeg5FBcDnmD
 TT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305130; x=1782909930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E51fzciGP16X57K6+5mbVdSS6Z/a61UsdP0TMTQdK3U=;
 b=gObeTtLleNPGAhhXk8HPvL18oTKdwpfDgLmys7W6vK6+NwzhBdI/Zj4GWQI3yf9VA+
 Uo38T1hCb21BmUz4qGFY1azwy/q3Yu27gk0JNkDE4q3p/B5vrRPhf8xbwr4w2Y8dHODh
 t34qz2qSyI1b4ivP97KGI2MVhn321nmzYv+85bTZQl8frq72SD88W2h/xLg1u4/tQb5a
 3thAeEaQiH80bZWBtciX+UzHNQSZQ7hUhHT6jmjDNav2EXn0Yp8MRXXpakCdLLxmJihW
 vqkUYdR94NfUyEhAVVW1EJzncnkj4+HzKSfqN3w2RISp6KkF5LKVDflJm5zeZ7S7b1CY
 CJNg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro7kqJIOriWcZ4gPn7XJ+V9TiPc8MlWBP+HfereRUT4xnxR8QNLdKMhgwiMTnxjRJ6V1WodVOQwYw==@nongnu.org
X-Gm-Message-State: AOJu0Yx6ar4kT991yoEhM5adew+9mHVXfciWTBkg8RRtzf+UOZuhFEnb
 HJTuV+6OV2f28TsGFvbWuVChALyPQUeGbL93DPYOyYzIV7qlBVAP0is1+AGPTLccsUw=
X-Gm-Gg: AfdE7cmQr3Q2PkPUkj4lzEsrTaxFtch5Ik1zdhJujShMQ9IlYr5Ah+FK+JBkG2xLYRA
 UO6NhWDOWezn2VEWjAqnWWSueLKfjRH9TbDZAcZGTQjM85GURkUdq6jnkro1EanYXprHho0sXsL
 uAnRx0jzwNE8FzMYhexO0vJqiijR0b9D1T7jVxIMRVGEmppMx5s6VM63ZWsnta5GEAqmSdwD598
 Gu2JlZR2CRgMa1y7cY+FNmfP3TzYvzagZK0eVtABSMezOPy+Em1FUXzj1GznQxD7UU5hR7FxShL
 q2XzFrQFPv7S37WN8LkS5alio/GRBLsn4AnO07uBulPylQ2eQBeYcTz3HM0ORihZfTrmfcumELu
 7IWqjbGjEryFDcBCTX9FuwP7N7RLUfKNgGXFVDE/0wofkER1Z5d/yo+aFisFZMd92KjHSW76cMc
 WLaRO1BG9UvQrL
X-Received: by 2002:a5d:6242:0:b0:469:3bd0:fa7d with SMTP id
 ffacd0b85a97d-46c0c346abbmr3829203f8f.41.1782305129539; 
 Wed, 24 Jun 2026 05:45:29 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840f4bsm6848246f8f.4.2026.06.24.05.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:45:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0F93D5F803;
 Wed, 24 Jun 2026 13:45:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/6] target/arm: a few timer fixes while checking
 FEAT_ECV_POFF
Date: Wed, 24 Jun 2026 13:45:21 +0100
Message-ID: <20260624124527.1018912-1-alex.bennee@linaro.org>
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

While I was checking what was needed for FEAT_ECV_POFF I discovered a
few potential correctness issues. We had actually already done the
work for the feature so the final patch is just documentation.

v3
  - tweaked the FEATURE_EL3 check per Richard

v2
  - added target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check
  - ensure gt_recalc_timer has updated hcr_el2

The following still need review:

 target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check

Alex.

Alex Bennée (6):
  target/arm: split evaluation of CNTHCTL timer IRQ masks
  target/arm: trigger timer recalculation when toggling CNTHCTL:ECV
  target/arm: trigger timer recalc on SCR:ECVEN change
  target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check
  target/arm: trigger timer recalc on HCR:(E2H|TGE) changes
  docs/system: add FEAT_ECV_POFF to the emulation list

 docs/system/arm/emulation.rst |  1 +
 target/arm/helper.c           | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.47.3


