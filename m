Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E3CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:07:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYun-0003vX-Qs; Fri, 19 Jun 2026 09:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYum-0003tu-EG
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuj-0003Ov-4r
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so1742872f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874339; x=1782479139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HGWeuLURh979C1kGzuFu7ruukGHfTBgJCcmQRq0kZac=;
 b=GUCviYgRfN8qkWJCSCRJXEwpahGyI6G4Z0c0aTzFCaAqjLjgHcZ1myubbZIF+zdxqq
 6RWXAGlH5Yf8KujONRUX2aZjbTVXyb+GKkeCiWugNfmWCfZT+Ff3uVwT11LAoangYYpq
 9l8fy71xfoE+HW4UL3QkooC4v+Q3VcrfDwhCOcw/hJFXNm2ZSNLIsFu40XWknBylVKmS
 p7AlK+0XnmdBtdEqQuIpp9mguNAaSZgsapducOZ9zHX2p4rPUW9g4AWqRGSobsn8ynFm
 B1t5sJCUx1Qe7yGAXv673JIf/eNQQhSGG23DCc1VrnPMFV4/8W/wHraRnjOCgExae739
 ou8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874339; x=1782479139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGWeuLURh979C1kGzuFu7ruukGHfTBgJCcmQRq0kZac=;
 b=L3j10VyZxAYjZyjMySm5/LqYANwhJAftoM1ZdCGHKEu7FjyF0BF1fUhSDmFRcm9ie1
 9Y8ybjJPYpSfQuD80hCwp3ul3d3VJYadAgMUcwOzz5+JrzZ2WS38fhAESHZYw8QHMi/F
 vjhdcWGPakUG6rx/Wxl4UNtLWUo++lz04xNcKKfd0n4/Jho0j55OUnCPh5+e7XEzR11R
 zk59aMI3AYKziNEbreIkW/98dmmSbws5LFjKv06tSjBopmJlXwLfkYEdhO3mJRSICuhM
 kIF/hfZjQ9Q+Pr6YgxdwhqLL8sWRAgu+8BTuaXiK0OIoZVVN/PyR5jirLtagA2D81ANQ
 PNDw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hyNK8NcJI6yPnj2p1PPXDHs0cz9/PM0k4hnx82oKJi+cVs7PSea7jmQ+EB99bMrJXIq0afk9pwQ==@nongnu.org
X-Gm-Message-State: AOJu0YxmJZnYwE3Z3WHq5sMO+QkRT2EcPIbcptCA319L446EYZVKtJpk
 3N2URedIAUxOFJom+ogd3dJgT4KRStbGhPLaJ6DtNK06FgA6awUiwQO0UBNufMgTUBI=
X-Gm-Gg: AfdE7cmX3cb5OEO2rFNH5naV+dYrWiNmNMzNpL93w3ebsdPGjC7bjjLaBzqDs5YknzD
 csfhPho3pndFvzAFHdqEcqK1uy19xhukEFhuLsEaR1vgek4r7opjLbKd/Pbyc2vYeU2bN1rAy5M
 44U68jAeOhFfiN9tDP+NaAIq41qRQIVqH2EkOqsJZkS9OiPyHKw7dH5gD/LpXVn8s9+SP4J++xT
 Bqceih5P750LkNkznpcUAkRwYAXG1ab4HPA5R5BUaFpoP4dy9OBb0szr0E1lHf5yB1B5zm1wl0w
 vKLMRZNxHT8Y1nufqYQ8EBpiOgFugV/5qo0rHpfcTz6EgD5p73onAA3JXOLGQnlYo9S4VLdevkO
 BhssmyEwkaK0Vst+O3GChM5xJzAriQdWCbTcL7Hzqo+iCCsJ0DgAb6KTsvl5BnaVqZl3aNkkusS
 rX1NrYQumlHBB5
X-Received: by 2002:a05:6000:4e:b0:461:a161:8101 with SMTP id
 ffacd0b85a97d-46500439771mr4937397f8f.11.1781874339376; 
 Fri, 19 Jun 2026 06:05:39 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46508a0546fsm7800409f8f.2.2026.06.19.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 418715F7FA;
 Fri, 19 Jun 2026 14:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v8 0/7] target/arm: fully model WFxT instructions for A-profile
Date: Fri, 19 Jun 2026 14:05:29 +0100
Message-ID: <20260619130537.820184-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

This series fully models the behaviour of WFxT instructions. We
already had support for WFE for M-profile but we left off A-profile as
it has more potential sources of wake-ups. The main one is the event
stream which includes events from significant bits of the timer
ticking over.

The refactoring from the previous iterations of the patch have now
been merged.

I've dropped trying to fully model the global monitor in favour of
taking advantage of the architectural flexibility to have an IMPDEF
event wake up for any reason. We treat the setting of exclusive_addr
as such a reason because it indicates the current vCPU is in a ldstx
exclusive region and we don't want the guest to deadlock. This does mean
the system won't sleep on WFE enabled locks but people shouldn't be
relying on QEMU to model real world sleep patterns anyway given the
efficiency of emulation compared to real HW.

I've written a test case using kvm-unit-tests:

  Message-ID: <20260527111822.1563679-1-alex.bennee@linaro.org>
  Date: Wed, 27 May 2026 12:18:21 +0100
  Subject: [kvm-unit-tests PATCH v2] arm: add wfx test case
  From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>

v8
  - Fixed quanta-gsj model SEV errata failure
  - Update the aspeed_anacapa test case
  - Ensure wake up events for V6K/V7 and plain V8
  - merged trap with implementation

v7
  - more r-b's
  - extended comment for typo fix
v6
  - add typo fix
  - addressed rth's comments

v5
  - addressed rth's comments
  - all but one patch now reviewed

v4
  - precursor refactor patches now merged
  - dropped global monitor emulation
  - addressed other comments
  - tested with check-tcg and kvm-unit-test wfx tests

v3
  - fixed the WFE exception handling

v2
  - I've kept the tests separate, see:

    Message-ID: <20260417164328.1009132-1-alex.bennee@linaro.org>
    Date: Fri, 17 Apr 2026 17:43:20 +0100
    Subject: [PATCH 0/7] tests/tcg: more capabilities for aarch64-softmmu tests
    From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>

  - tweaks to global monitor behaviour
  - STLR/STL will also trigger events to avoid deadlocks
  - see under the --- in the patches for details

Alex.

Alex Bennée (7):
  hw/arm: use cortex-a9 mpcore base for CBAR on npcm7xx machines
  tests/functional: update anacapa-bmc image
  target/arm: do not clear halting reason in has_work helper
  target/arm: ensure we create the wxft_timer for all modes
  target/arm: implements SEV/SEVL for all modes
  target/arm: enable WFE sleeping for A-profile
  target/arm: implement WFET

 include/hw/core/sysemu-cpu-ops.h            |   3 +
 target/arm/cpu.h                            |   2 +-
 target/arm/tcg/helper-defs.h                |   3 +-
 target/arm/tcg/translate.h                  |  18 ++
 target/arm/tcg/a32.decode                   |   5 +-
 target/arm/tcg/a64.decode                   |   5 +-
 target/arm/tcg/t16.decode                   |   4 +-
 target/arm/tcg/t32.decode                   |   4 +-
 hw/arm/npcm7xx.c                            |   2 +-
 target/arm/cpu.c                            |  26 +-
 target/arm/tcg/op_helper.c                  | 252 ++++++++++++++++++--
 target/arm/tcg/translate-a64.c              |  42 ++--
 target/arm/tcg/translate.c                  |  34 +--
 tests/functional/arm/test_aspeed_anacapa.py |   4 +-
 14 files changed, 331 insertions(+), 73 deletions(-)

-- 
2.47.3


