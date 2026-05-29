Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309F0CD5BD2
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSsbO-0001QA-7y; Fri, 29 May 2026 04:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbK-0001OX-Ot
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbI-0005QY-HS
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so77500665e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780043391; x=1780648191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PqBIIlOsJpFHNeGX5mY/Ufew+QU+w61wObkGDAw6TBw=;
 b=oSodMyX+nUNhuQxCvR6DrNc6o7RKhQaRuG7fvedk5eXxjbQ/7WeO8RNiA/JZdPy2mA
 SLjJxCM8AxgBMXkHOH/zwm6pCpiRcJqJ7/umhiinirjvyHWBi00XozGH+7kgt+fbiRUD
 kPIrD0DZocHzgahwcnUWpLeqMDEBCAtZhQEDlOib9Vmi22nbPBqkey84tMUEMVEQcyi9
 Fg+cdxrAIlc+3d95KPOGEylBRCoFouWcQvfwk8fVeYB8ySFZv5bDZP4ZYlccsfNY2AF9
 vZZlv9lVufNMOYUm8waho7nCf3XnnvV3fPqNpUcb8G7YFpgLCQV++e/JKt2/opq1JCwA
 DMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043391; x=1780648191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqBIIlOsJpFHNeGX5mY/Ufew+QU+w61wObkGDAw6TBw=;
 b=r3fVSSixfsED63x9ORkPyBI9Ac08BTmB6bsNEOglPIKTnXjUZJFvgL/uDbldz3c8w5
 XD2oQyCX1AzeWGuXY4rydTN3M8QuklBtxGGsI80RofQUEx+kek4kKKJUnTJAvcRnkERM
 OYigBWSlZmhFfh3vQ1zXBwdgt2QeX6BUfxYn22GDjs0Z0NwnZoQrB0dPYp/GJqhzy7bZ
 THJ6LY4r21XMJ1RpZ7HTw2joXkywG9EMqDrCNLdN2Jt06d6QdEZJUvTblqWBfeooDUXO
 PPGzO+M6qboAtGtdVpA9HAwuLYvVqhlBcyjlOqfV7jYWUBnJL2NOUTu1vqLj+fYPpR48
 mqTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+F963ZpFXi9GnzZ1NV/s4mVle0qtbk7qZeyzyZf/kcEUD0+88KbvjyojjRWz0W4O/F7pzSZnHxDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzu0RJeE84Ypd4LgbsFAYGPRu95J1cZcohiNocuVpic4K9/oQ1N
 pEZXfvJnKjJ36kZcd9qjzePOtX5aVQ9p4UZxyvm99NqCnN9EEphMDkH+mdUBuJLmNSQuv1Vgf/w
 Z9DEQ
X-Gm-Gg: Acq92OEq/HU/zbcRZJw7O0NCcXFp7UC6Yg8rxSlsJaznMlyjHY3E1dOgUryEJwLyoA6
 +vKBz7Tm5HhNMAxY0Lv4tJ1gaPw/d0I3sBnB9Cjga1Ug4OIJ4jFJbLof63LEd03fKABgMmwimh5
 n5Aze3KowS5TsKecfml7hRNo6VjahBkbNgqjMgn6JIiMPhwp+8lVtYAPeCBYCA/Gqy8VDHo+mfK
 POacxY9hoRsXxPhmeL7xQi3afH0/Gw5wxWoj0ajdjH60nLLQQUJd9QBlVyCIrASOaiHmN364C2C
 pHIfeCFcjVmZuVr6xcTJMu0FH17Jp5frRclagytXIeU4saVoXOy5PCbcbiZ8qEW7jES9XXeiNQ7
 Mj8hjAUV+lp0BdVo1grVZs/MR80t7kBGXO6rwqD2w7cUJDhdzYVEuQIDArJcUN2ntjWutbeEpKN
 ONNP0240oOR+9CELIgvpGRHGK8BvppI2nF2A==
X-Received: by 2002:a05:600c:48aa:b0:490:81cb:d7a with SMTP id
 5b1f17b1804b1-4909c0c6b91mr19611555e9.29.1780043390709; 
 Fri, 29 May 2026 01:29:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d5f2347sm24497485e9.0.2026.05.29.01.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2125F5FA53;
 Fri, 29 May 2026 09:29:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v7 0/8] target/arm: fully model WFxT instructions for A-profile
Date: Fri, 29 May 2026 09:29:39 +0100
Message-ID: <20260529082948.363931-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

All patches are now reviewed.

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

Alex Bennée (8):
  target/arm: fix WFET typo in syndrome
  target/arm: teach arm_cpu_has_work about halting reasons
  target/arm: redefine event stream fields
  target/arm: ensure aarch64 DISAS_WFE will exit
  target/arm: implements SEV/SEVL for all modes
  target/arm: enable event stream on WFE instructions
  target/arm: handle the WFE trap case
  target/arm: implement WFET

 target/arm/cpu.h               |  16 +++
 target/arm/internals.h         |  22 ++-
 target/arm/syndrome.h          |   2 +-
 target/arm/tcg/helper-defs.h   |   3 +-
 target/arm/tcg/translate.h     |  18 +++
 target/arm/tcg/a32.decode      |   5 +-
 target/arm/tcg/a64.decode      |   5 +-
 target/arm/tcg/t16.decode      |   4 +-
 target/arm/tcg/t32.decode      |   4 +-
 target/arm/arm-powerctl.c      |   6 +-
 target/arm/cpu.c               |  53 +++++--
 target/arm/helper.c            |   8 +-
 target/arm/kvm.c               |   5 +-
 target/arm/machine.c           |   2 +-
 target/arm/tcg/op_helper.c     | 253 ++++++++++++++++++++++++++++++---
 target/arm/tcg/translate-a64.c |  64 +++++----
 target/arm/tcg/translate.c     |  31 ++--
 17 files changed, 395 insertions(+), 106 deletions(-)

-- 
2.47.3


