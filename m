Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF190F9B605
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUXu-0006vn-3K; Wed, 22 Apr 2026 06:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXj-0006pG-Ta
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:53 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXg-0000hZ-3K
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:51 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6715006f4f7so7987101a12.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852645; x=1777457445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTC5LhoRkf6ve0e8Svdu6+rIAu2GnxjtZscQzak026I=;
 b=XqUj04bAnhjcO8+MXlFEkJMAV7wzztyuSKnraatj/yl/wykiXlKmwQr5lap0jlW2Bz
 nm/6KVbVrT1Kh/ddz8jDKt4H6Z0sJfSJ+TLxLUn5LWK125VfJ+wyC7MRezZyT5mOCqTG
 FmGLNJorhnsUa2z8kAftdkMndXjhVip1oWFXr74uKrbf7WgZwPFsUjjhIOdZbyC7tuBc
 2Vp6L5xl+M7UCi11q9tOyDlnsS+SJS7VHMpJVAbuaAUHD7JiTzEgnIlklzrOeaTUBKEM
 6QX9ZGIZ/4W6EVqOvBxG1bbAy4XDHTFuacd/pP5rnJT9CQADOLIQMsEJ9H0kMxi7pjLq
 VZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852645; x=1777457445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTC5LhoRkf6ve0e8Svdu6+rIAu2GnxjtZscQzak026I=;
 b=Bo6cOv1rdXH4wxXAV7RCIdvdY5Oir99gg8/6Ho7ALRmrBHdjxqoIvmew2Oh4071Bzi
 ksYvucDE0zNNkHWgId4PNRC1kiF7Hn7YeW3zKrH8dqPByBRIMIHBAVsYX+vpP6I/nG9z
 nfuNnQeg6MNdwDfp6FPZaavWwO+x77xizYznQ9otL+BsDj3rkQkDvZQTPE//OFzzbCIP
 /pDrFl4tcNvjYTnNfjD7Fr7XOLH8m+z+JXL6etAwjP46AoYdpV+ulA28gDmZyQmVPp3q
 VRZpZu+Zgx2p4+6Gc8wp4f+WxQ28ynSIHT7hsnbJw3Bsac6+53h7QSyFDTPas05wtzjh
 1gaQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ98y2Dw5JDc2UP9jB3wiZkR1xSRZoV2LmRdOhJ4KPriqCa2KeG7Bnvkum/PlZekw0sYj2czUm7nwA==@nongnu.org
X-Gm-Message-State: AOJu0YyGj506gXy7uEmH6bGHfhMYfVfz20oISWTrRRBSRgR6+F1lY024
 GATgTMH3gjRCI1IJGVcDUO35GKqvzwlN6U+t3B0Gf06jd1+xy0dQxQcVLaXsFfgejKg=
X-Gm-Gg: AeBDies33qhimmNVGks4iRyApqvrB+JI6e/krsJ1dC26CmtSDDOInjdm9z5oHByQ/3i
 QgdtQt/E7VoAn6higBBZtoVsUZ9ucfRUtXDmYD11F+cSki6BC0eV2x0PrMOIn0rwDyHj/eHOx8Z
 ig8ax1eNqpJkdBvgzea4UlU2ZuBJHPhAsvBXIWJtVtzvZVWMaxfmMFrA+tS6aCh3DK3mFWIQjbt
 /Pb0AxHjQKzBr14eZW+emAFUrElwCsvCST0JOVzNLTtV547Lkbtn8P5bXZ0eckX5Y9r6RfNLM7C
 D0P1oyE7R79xLbwgKZmfS7gElGkaUna9ixsQov/5GyFkQTGeCPO00PJQ3YYwukJzTIHO2LPUdA7
 L/9aXlpcr79/CSjWxY/VnzDHQ/H/nvnvbOmaN83Mw1C85YedEuBtjvrpaw2IzZmVXLLxbx8Irfh
 u6KSHjer1/mhlIhmRrVKPSLI933DNNqnuf5Q==
X-Received: by 2002:a17:907:da7:b0:ba7:62f:9fa4 with SMTP id
 a640c23a62f3a-ba7062fa21cmr624513366b.6.1776852645250; 
 Wed, 22 Apr 2026 03:10:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb135asm48912309f8f.6.2026.04.22.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:44 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6E5A55F93F;
 Wed, 22 Apr 2026 11:10:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/31] target/arm: fully model WFxT instructions for
 A-profile
Date: Wed, 22 Apr 2026 11:10:11 +0100
Message-ID: <20260422101043.1234229-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

The series starts with some refactoring of the syndrome register
helpers to use registerfields. We then expand the WFIT trap handling
to report the register used. We then implement the event stream events
for SEV, global monitor and the timer related ones before enabling WFE
for A-profile and then finally WFET.

Note on AI usage. As an experiment I previously posted an RFC series
with the help of Gemini. This series however is a ground up
re-implementation which takes some different approaches on modelling
the event stream. In particular rather than running multiple timers we
use the same wxft timer and just compute if the timeout or timer event
will come first.

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

Alex Bennée (31):
  target/arm: migrate basic syndrome helpers to registerfields
  target/arm: migrate system/cp trap syndromes to registerfields
  target/arm: migrate FP/SIMD trap syndromes to registerfields
  target/arm: migrate eret trap syndromes to registerfields
  target/arm: migrate SME trap syndromes to registerfields
  target/arm: migrate PAC trap syndromes to registerfields
  target/arm: migrate BTI trap syndromes to registerfields
  target/arm: migrate BXJ trap syndromes to registerfields
  target/arm: migrate Granule Protection traps to registerfields
  target/arm: migrate fault syndromes to registerfields
  target/arm: migrate debug syndromes to registerfields
  target/arm: migrate wfx syndromes to registerfields
  target/arm: migrate gcs syndromes to registerfields
  target/arm: migrate memory op syndromes to registerfields
  target/arm: migrate check_hcr_el2_trap to use syndrome helper
  target/arm: use syndrome helpers in arm_cpu_do_interrupt_aarch32_hyp
  target/arm: use syndrome helpers to set SAME_EL EC bit
  target/arm: make whpx use syndrome helpers for decode
  target/arm: make hvf use syndrome helpers for decode
  target/arm: use syndrome helpers in merge_syn_data_abort
  target/arm: use syndrome helpers to query VNCR bit
  target/arm: remove old syndrome defines
  target/arm: report register in WFIT syndromes
  target/arm: teach arm_cpu_has_work about halting reasons
  target/arm: redefine event stream fields
  target/arm: ensure aarch64 DISAS_WFE will exit
  target/arm: implements SEV/SEVL for all modes
  target/arm: hoist event broadcast code into a helper
  target/arm: implement global monitor events
  target/arm: enable event stream on WFE instructions
  target/arm: implement WFET

 target/arm/cpu.h               |  27 ++
 target/arm/internals.h         |  31 +-
 target/arm/syndrome.h          | 595 +++++++++++++++++++++++++++------
 target/arm/tcg/helper-defs.h   |   3 +-
 target/arm/tcg/translate.h     |  32 ++
 target/arm/tcg/a32.decode      |   5 +-
 target/arm/tcg/a64.decode      |   5 +-
 target/arm/tcg/t16.decode      |   4 +-
 target/arm/tcg/t32.decode      |   4 +-
 target/arm/arm-powerctl.c      |   4 +-
 target/arm/cpu.c               |  53 ++-
 target/arm/helper.c            |  12 +-
 target/arm/hvf/hvf.c           |  14 +-
 target/arm/kvm.c               |   5 +-
 target/arm/machine.c           |   2 +-
 target/arm/tcg/debug.c         |   2 +-
 target/arm/tcg/op_helper.c     | 216 ++++++++++--
 target/arm/tcg/tlb_helper.c    |   6 +-
 target/arm/tcg/translate-a64.c |  58 +++-
 target/arm/tcg/translate.c     |  33 +-
 target/arm/tcg/vfp_helper.c    |   5 +-
 target/arm/whpx/whpx-all.c     |  13 +-
 22 files changed, 929 insertions(+), 200 deletions(-)

-- 
2.47.3


