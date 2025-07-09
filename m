Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9680EC83F03
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 18:06:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZZBF-000191-PC; Wed, 09 Jul 2025 14:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZB4-00012T-0D
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:05:54 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZZB1-00048P-J5
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 14:05:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso2673695ad.1
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752084348; x=1752689148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SHBBVjxR7SKscGz2bEmo/Upd0VMcbGiwaDjOWYwuGJ4=;
 b=WIXqNgZAm5Lvl8wHmoZE55VvwqPC/FEOFCxOEkgCc+wLG4iZcoq9/jTuGNXVHBwy9B
 UFq079W9GsqKDYO4xKbEbULSHshYCSKHIYE7NZutVEZdFqVBrKsZZo0j9kAo13W/mqSM
 ScKcD1gCtfhc4E34lQKmtNIJ9SetJA1QhL8vmf2scOr6+sT+Qbt6V83xa+ZbanJJmC2t
 4rrqVPvBJF7/GjDhrAklGTQzNz+ZSj+ewrQuhVNqFx8dVQdHTgW6lH2QEc90SX2gVI/9
 PDDNCK/iLPWhkEgk1RYEfUz9iqeOd/9QKW2yecNkHp3sEZjo8QudS4UKY33w/2i1KEQm
 aBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752084348; x=1752689148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHBBVjxR7SKscGz2bEmo/Upd0VMcbGiwaDjOWYwuGJ4=;
 b=kJS3L8D5YCInuGJn+7hOkYZ1WAHeDbh10oKMyswvMJ2/T3e8zerAaw74503GSBHKdA
 Js4ssKJu/o1H2eRr30zYfwdLbVGVgxk4BCHAtiKugSG2GQKOMkngPfA6YbMwjuzdxOg6
 WHxS3Bfs9+TdX91Dmr1AP5xZSSO9z4TuQ9ThDhuSF3rNVjvlVUpdvOFQIryUweBLtjgS
 Jnss3pRrDDUORbIsIFFt7uIeye4Xx9NmPXg7QYLZnnxa0g7YrwZZMGRiIas/WSWt0DXs
 ahNsbkhBmE7UY5HTQXfhS5Yzi9+7kgglCe4lOLObkBHXuUKmAq9bMAXJossoryq/GZNW
 0Jgg==
X-Gm-Message-State: AOJu0Yz07GRhBTgY1fldclZ/xZyw85H7O18mQfBeP3ZE9c5Kx1yZ1Bj+
 sq4EjhDN3IcB11kiGWT7wkN0GsBWO1LuEO7JVnBnbCsnkW9s4ctRBlroio8AsivIhYRXILsxsRU
 ZSG8l13g=
X-Gm-Gg: ASbGncu64jlBsOSvKDgFHp5UU8hPBwR3emuoX9Drho+sb5Mwoqs3GNovK/GcTsPgqJ1
 WyUzf5XubfzuuJ7vsDbTl1mTJZrcuvLn3bR12PYmdnhBAcpliiIZvVQx7jCnMXIOI3eWVsVOtNf
 ntl6Ra2fpsEO3dwBm1UY8ozte5DOHTxkMENy0+ByBDpFKUQuuh90qYUpXPFn1USWZQWNr7wyOb1
 xX9sx8ioSmDGcx9gFrXbJg2MN6Mv0Za4wzk/E9vBSC9seoMqQJjlGejnU5d0FlRs0QWlfU/Y4+5
 KTd9PV5Hxy2ZyoOcvByODiYKObc9cZO3G+xCVm62y6djYf+U/kps8hnBlpNMyEr0Sws=
X-Google-Smtp-Source: AGHT+IEts4RLvt56Fj+8VKxok4hb7qbM+eWSkRI1xmQJtnjBPyKdJdjxFdYPUisrdTgg0c75PhYKtw==
X-Received: by 2002:a17:902:ea06:b0:235:f45f:ed55 with SMTP id
 d9443c01a7336-23ddb1dc49cmr56072535ad.1.1752084347976; 
 Wed, 09 Jul 2025 11:05:47 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84599f07sm153380175ad.218.2025.07.09.11.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 11:05:47 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH-for-10.1 v4 0/6] target/arm: Add FEAT_MEC to max cpu
Date: Wed,  9 Jul 2025 18:03:20 +0000
Message-Id: <20250709180326.1079826-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
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

This series adds support for all FEAT_MEC registers and cache instructions to
the arm64 max CPU.

It includes the FEAT_MEC registers and cache maintenance instructions, but does
not modify the translation regimes to support the MECIDs, so no encryption is
supported yet. However, most software stacks that rely on FEAT_MEC should work
properly at this point.

I'm currently exploring possibilities to support FEAT_MEC encryption (or
obfuscation, for testing purposes) in QEMU for the various translation regimes
on arm64, hence the encryption part of FEAT_MEC will be contributed later and is
not targeted for QEMU 10.1.


Cheers,
Gustavo

Gustavo Romero (6):
  target/arm: Add the MECEn SCR_EL3 bit
  target/arm: Add FEAT_MEC registers
  target/arm: Add FEAT_SCTLR2
  target/arm: Add FEAT_TCR2
  target/arm: Implement FEAT_MEC cache instructions
  target/arm: Advertise FEAT_MEC in cpu max

 docs/system/arm/emulation.rst |   5 +
 target/arm/cpu-features.h     |  15 +++
 target/arm/cpu.h              |  29 ++++
 target/arm/helper.c           | 242 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |  20 +++
 target/arm/tcg/cpu64.c        |   3 +
 6 files changed, 314 insertions(+)

-- 
2.34.1


