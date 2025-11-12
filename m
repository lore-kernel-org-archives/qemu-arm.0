Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF7CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 00:51:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIz53-0004Pi-Rv; Tue, 11 Nov 2025 19:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz51-0004N8-Eb
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:23 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz4y-0005nz-9G
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:23 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-880576ebe38so2659766d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 16:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762908678; x=1763513478; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ARNbVFBkKf8NAUvEUK+ZcTKvc61KFuP7xijw4qB45gs=;
 b=VS6sIIgOi4ouUffqBWcg/twzzuzH34CchH1jlPi9E0FwRssBwHYEUzlmncU+Gde97q
 M+H/4vwqOdbajo7DaBUY7ywdh4Eo6PbmCtCq1s841lyIgXYbG1+UskLOiaSQrbW+qp8+
 ezhEEk+m39OrCHVhkL8fVDTTRd565sL5PmN7bWf7PZyNp2sXa+tTTtBt0XhhCXmVOYDi
 zIBh8Tx2WsX8S6ndQSdm6uzG9BMvbnW4nYyXRsnET9PU2YYSCaI7hPEjIG/k99r5g19m
 OSgY87+2bCiR8icBtQgji67yH37WtHpxG52BtxxTJ84H8tHf2TYaENe9vfuZ8WeliiTK
 YUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762908678; x=1763513478;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARNbVFBkKf8NAUvEUK+ZcTKvc61KFuP7xijw4qB45gs=;
 b=rzKM+xZOemfDqfQEaqvUiPMBOencoPhBmpczyJkh0oB95Kuiyt9Q0KCd/V7PsawU/l
 g8QrA7j2v3fRlyJv1QRs9IipCd/Nr/XY8CaglVWF6mdw1cCA2IukitWm2NxafbtlenDS
 nIhWlflzCOzwpVLbGTWQtjq1Q2BJ5O9x8uLJVy8joqkj68VScnl8ZI3ucObNXisTzgbd
 gCGC25GspcFLrISpCWQdoPAGkBieakjcLd4j1PjEAsckZLXkKPR0Na8fHu5egQQ+vTKy
 EIGlZVNxBHBZ1nx/gD7vFz9V+PZepNfbAihBGg5/JZhN49UHWK0Ac/itFjtYhwlHUZNN
 5YoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXXnfgLmJsDCb+1/EXWsQhsCocIhnEzARRXxpoXy0XI+tUG0DK+bN+eJloOzacI31eIt7MtJg9ZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxi6G2wM0kurz3IgsCTCe9nGsqsdWitGcRTGCspNVY2MThuubXt
 vWBJ4LsIVb31rUjFq8vGOfDOTiJIzS/Ff6H4vz5dta1CZBlo0FJYQEQH/8qL1Ob1
X-Gm-Gg: ASbGncurN3uXWRibITN6SqFQWjCXGwxdh4PH+80o3cW3BLMRMSdv0cbBtjDVSDUcb42
 5srp4fb6NXVzdsPs8p2I1WU5cxRJdlSdyiyNIuoG+dT1teaWzco5Jf5tF8GMR1LWkksXWl5vBHX
 rCzY/hf2Om8giapYtJfWbEJCVgNoM2Pd66zkljmWo7txz78DbP7ha5Ak9vmGNFs/TrTRRgbqM2Z
 QeYudQPsTVpi7+5zPXhk/KeNlBF0E/kXQitfzwW5BH0fzta307Z1fOPCRCsFr3xjN9XWeAGcQTG
 dSYQK8+nz4FBzB6eEnxossEpCfPM3guR9xl2GhJPoQk4ERp35b2P+va1uHT8906TciC7I+gZAJv
 phFlf4t+jNvIhTFqXsr8WRM7hJM36zMpvOdcAHXA5vHA+zoZ81QZ1V+YnOn2jNY33n9HYprl24c
 Eq1QOFW4wn
X-Google-Smtp-Source: AGHT+IGcSKh5ExZwbTVKB0AQ+5h34epIOos/E7g1fYp2q2E0lkMlfKgrhIgvITFeh+39LuN/SsTlEw==
X-Received: by 2002:ad4:4eed:0:b0:880:4695:464a with SMTP id
 6a1803df08f44-88271988a2amr17786946d6.24.1762908678176; 
 Tue, 11 Nov 2025 16:51:18 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8823892a79fsm81445096d6.4.2025.11.11.16.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 16:51:17 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Subject: [PATCH RFC 0/5] target/arm: add support for MTE4
Date: Tue, 11 Nov 2025 19:50:49 -0500
Message-Id: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnZE2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNL3bTUxBLd3JJUE10zcxODRDOgRKqFsRJQfUFRalpmBdisaKUgN2e
 l2NpaAEohnWNgAAAA
X-Change-ID: 20251109-feat-mte4-6740a6202e83
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762908676; l=3528;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=WoMWB8mSoYwa7AUlOW915FMNbnAzZg2S1yjfQbbqmqE=;
 b=6HL1qfjazhRSydxttzAH4SElrWpJwDA20aKM6AIUMHWGfotr2YMNkXGQu/vGKosilbM0yOcUA
 1TCpMBhDLZ0AQWLt+odFEMPOwH2RkScy08DVgNFzwN2i7bANIv4CG1w
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf2e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patch, when complete, will implement ARM's Enhanced Memory
Tagging Extension (MTE4). MTE4 guarantees the presence of several
subfeatures: FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR,
FEAT_MTE_STORE_ONLY, FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM,
none of which are currently implemented in QEMU.

According to the ARM ARM, the presence of any of these features (except
FEAT_MTE_PERM) implies the presence of all the others. For simplicity  
and ease of review, I plan to introduce them one at a time. This patch
handles FEAT_MTE_TAGGED_FAR and FEAT_MTE_STORE_ONLY, with the plan to
introduce FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_NO_ADDRESS_TAGS, and
FEAT_MTE_PERM in later versions of the patch, although I'm submitting
in pieces for ease of review.

FEAT_MTE_TAGGED_FAR guarantees that the full fault address (including
tag bits) is reported after a SEGV_MTESERR, and exposes itself in the
ID_AA64PFR2_EL1 register. QEMU already reports the full address in this
case, so this change only advertises the feature by setting the
appropriate field in ID_AA64PFR2_EL1. My previous version also unset
the feature when MTE was disabled, but looking at the way that similar
features (e.g. MTE_ASYNC) are not unset in this case, I changed my
design to be consistent with them.

FEAT_MTE_STORE_ONLY, when enabled, skips tag checks for memory reads (it
keeps them for writes). I implemented this by creating a helper that
reads the appropriate control registers to determine whether or not this
feature is enabled, and introduced a conditional at the start of
mte_check that skips the check if it's a read and if the feature is
enabled. The conditional only hinges on the contents of the control
register for this feature, not whether or not the feature is actually
implemented on the chosen cpu. I would appreciate feedback about whether
or not I should explicitly check for cpu implementation of this feature.

Testing:
- For FEAT_MTE_TAGGED_FAR, I wrote a test for this functionality that is
  now included as mte-9.c, as per Gustavo's suggestion.
- For FEAT_MTE_STORE_ONLY, I wrote a test for this functionality, but
  since the feature requires setting a SCTLR_EL1 bit to be enabled, I
  was only able to pass this test successfully after I manually set the
  bit in question. It's not clear to me how I should go about submitting
  this test, since I don't see a way to set this SCTLR_EL1 bit from
  within a user-mode test. Some guidance here would be useful.

Follow-up patches will implement the remaining MTE4 subfeatures listed
above.

Thanks,
Gabriel Brookman

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
Gabriel Brookman (5):
      target/arm: explicitly disable MTE4 for max
      tests/tcg: added test for MTE FAR
      target/arm: add TCSO bitmasks to SCTLR
      target/arm: add FEAT_MTE_STORE_ONLY logic
      docs: added MTE4 features to docs

 docs/system/arm/emulation.rst     |  2 ++
 target/arm/cpu.h                  |  2 ++
 target/arm/helper.c               |  4 ++--
 target/arm/tcg/cpu64.c            |  8 +++++++
 target/arm/tcg/mte_helper.c       | 22 ++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/mte-9.c         | 48 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 85 insertions(+), 3 deletions(-)
---
base-commit: 593aee5df98b4a862ff8841a57ea3dbf22131a5f
change-id: 20251109-feat-mte4-6740a6202e83

Best regards,
-- 
Gabriel Brookman <brookmangabriel@gmail.com>


