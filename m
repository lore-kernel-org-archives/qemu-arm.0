Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6829606A31D
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 19:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw3TbhXx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLnDk-0002n5-AS; Tue, 27 Oct 2026 15:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDh-0002lp-Fz
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDf-0004pV-Jz
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e47347279so186261f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793130746; x=1793735546; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=luRnNUW7uwy2MemYFX2qJnRCuTbEd1eVHKo0CdM5Jko=;
 b=Lw3TbhXxZJnB/3nLizMEe743e3Jl70NGVWn7exAIuCJz/5+sFLOgxDpvEoBvloBcK1
 OrmfUSjV6e4spa5xW0js3v6aFX8ZivepdQ9xNCt9vKUpW9x0djeVgiz23+1EKbw1FV1O
 iaeyhA148QNgqM0SSJ8nryInp4zLadRHwcIgu0FCIF6Lsk8EtCmtFiHgbzzk/5tPJO1z
 LHx2eBmMn5kaFzPRNa4XpJUec520E1wYsr39453ENzDXHnm9QnsaDE2g2eQVSJjHzNQB
 QNz69kH4PI0teQ6ygKe9o0QfxqVPvV7P787nj5N7jy3ZLSpKei1onjiQkGB4BIbBV2CR
 e0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130746; x=1793735546;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=luRnNUW7uwy2MemYFX2qJnRCuTbEd1eVHKo0CdM5Jko=;
 b=CxsutZOW/flqKaBJ0SZgFs5C5vdgheex/fwbBiHjlM7Y3HnNDDuBHXAogQ+p2EN0wb
 vEY1XzwORx622iPjmxS/VVP6ZZnd0ZsJMRy9ggbXxFJ+Fo2V934icKP0BWVoI46cvjtu
 wY3tS6rMhTk/b5xm2JwB3mP+IlUrE+uzBfnp9P7kXPi7uOlr0uWHU/9/P0BHy6L0/EOv
 SYRpsWJfBK1u84IvuWMnvKO4PU7K2QCApPgzogw0vG/8Y16xY6ueW/59/X21EERYBpjb
 lRWcscN6cF0qACXUP3kN0D15XvAm0IK77AXH01DyRHs5PxIomB2lSPLkR5etGljHvU5Y
 2CmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFdnqgn/T5UzLt0LPmd+/3bpyda+ZZbBPpXDTsRmG8T4ytt5ulREtd1VmdaewV/A+uuFWCFDJKsw==@nongnu.org
X-Gm-Message-State: AFq9FYJA8VVqhNWsLwzpwMZjBFUuOJVjziRWx4GLColpyxUmXE7c7gyR
 5KfacpcGPvUuFnJifx9OsQ5x7n7CinW3SqrFI3GvL9tUPnYoFVpEY1Cw
X-Gm-Gg: AYBFou0ZhR5eJjR5AJ5hoyV7H5AvC9SHsK1faq7OT22SKEYS3Sb4FBUPRHh5mw9uIQT
 +d56/xQWgPgWgWLp6i5Ujfwo3GbcnE1IZn2MArTpV6RJKTYxwGqIdVQaKFYANeWMXoqagJ9dhXn
 QnpKDfRLp/V3sCkz0LY9Smv8cPCgXNPaJrmeV4mcEG/B7APxRyTocZ/cXVAeUu9MM5Pjeuo+Qia
 CVyGsAHJfDMAXbTUmm0Yq+kg+DqzhaQj8YBSWnKVZuPSR0XgVtTx2/3Yc/hgg5v+3ZaiSJDl0fO
 KTUSrt3f30m+lGdgnFcs8MGtDrx34TToXabM/VFyiTkWMB1HIKhOR+WUJG8OdnqpHcCEcWPji3d
 2HMVQSwymgPwPhckT/BhVPptsLW1Tb/bE/UkZcMnXp0f6K8BbmW+eBodaG0skBzkSfOCliErw4Z
 0amFXUeRVwxj/9OueBaoBxJqM/78h7lVpcxV4olqP4JoixRt/ZBkVuTEpfIF+ZHDYDeB5IrAQwK
 4O80UdHzy4fff9zXKGVypIJoi8Ie2zRXQLvq2644Etw2i+z3chmehtdr9Od1+WTW0Gx/AG1cNcK
 3Zft0Sfi1273gGw=
X-Received: by 2002:a05:6000:4a19:b0:487:40d:af33 with SMTP id
 ffacd0b85a97d-48e5d5c27admr803704f8f.13.1793130745532; 
 Tue, 27 Oct 2026 12:52:25 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb846sm24746368f8f.25.2026.10.27.12.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 12:52:25 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Subject: [PATCH v2 0/6] hw/i2c/aspeed: fix non-packet buffer and DMA
 transfer modes
Date: Tue, 27 Oct 2026 22:50:41 +0300
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6DIBAFf8Vw7jZARGlP/Y/GA8Kqm1YgYEwb4
 7+XmvTY40zy5m0sYyLM7FptLOFKmYIvIE8Vs5PxIwK5wkxy2QguFZgcER2QtOCDj48FBnqBvvR
 ayV5ZXRtWtjFh0Uf33hWeKC8hvY+bVXztr9j+Ka4COPC2sc6hEvWgb+Ns6Hm2YWbdvu8fFLffp
 roAAAA=
X-Change-ID: 20261025-aspeed-i2c-nonpkt-fix-89b852b5c84a
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793130744; l=1458;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=SMyJH0N9KYFgSRT/4ZYFWoRqEtu1Al23PZB9s538W4M=;
 b=P2vbQHToaTgEQYGF5v7/ACZMwIzx9FTnIg4xHtZuxoSaAgy303BLIhCQy7jdU/uu4MgeKsJ4t
 hZb7xOSHf1JCFtwbP51hyYmD87J9fP3Pvq7CB3iQiguM06mCXIG2Kfy
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=gessingate@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In non-packet mode, buffer and DMA modes are broken
in the Aspeed I2C controller,
probably because no available driver currently uses them.
This patch fixes them, so byte, buffer, and DMA transfer modes
now work correctly for both register modes, old and new ones.
Tests are provided to prevent possible regressions.

Signed-off-by: Timur Maksimov <gessingate@gmail.com>
---
Changes in v2:
- Fix commits description format. Some of them are reordered and clarified. 
- Link to v1: https://lore.kernel.org/qemu-devel/20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com

---
Timur Maksimov (6):
      hw/i2c: add dummy device
      hw/i2c/aspeed: fix BUSY status reading in new register mode
      hw/i2c/aspeed: fix I2CD_CMD register reading
      hw/i2c/aspeed: fix buffer transfer in non-packet mode
      hw/i2c/aspeed: fix DMA transfer in non-packet mode
      tests/qtest: Add cases for 32-bit Aspeed I2C controllers

 hw/i2c/Kconfig                |   5 +
 hw/i2c/aspeed_i2c.c           |  23 +-
 hw/i2c/i2c-dummy-device.c     | 168 +++++++++
 hw/i2c/meson.build            |   3 +-
 tests/qtest/aspeed_i2c-test.c | 836 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   2 +
 6 files changed, 1029 insertions(+), 8 deletions(-)
---
base-commit: 9b77fa7a4fe86c80d1ff526769c61ada7d28666a
change-id: 20261025-aspeed-i2c-nonpkt-fix-89b852b5c84a

-- 
Timur Maksimov <gessingate@gmail.com>


