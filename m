Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02F0CAC5B1
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 17:58:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v17H8-0003WM-II; Tue, 23 Sep 2025 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v17H7-0003WD-4b
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 13:58:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v17H3-0002z7-QR
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 13:57:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so31153265e9.3
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758650275; x=1759255075; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=zfei7KP/bWoKW/hTT+e9D33ufJy04pPBV2x8zyynI/o=;
 b=GXC1BtnlicoKyzv8noqWoma7lyFq3rDYYamK93kWA/uTQl0FFl6wN4FSatwkKrXVVw
 zI084EPh2rzEfpzsEzOiYTO/oaiSS0UGECKZ4FbwMSqGpaKcxB8CY2N3p2KXBwvzjVUp
 d1LRVYZ7rkdrMihpzKTnFvqhpWfoooofuqARZMLGaJbFm+e7jejjeAnbHdzmSSmcws9d
 paYTm2bNMUBeSRTfQkrdkEq3QsmA3j9Cbx/jKsZGHWJFZpny3mXJm5KinBDPgc392IIQ
 virVBjim6yF5ns3xfScB+BBufqMULMDYjOwnWD65IVzjtDQ/tP/WtdaG+wa1vYKS4xCX
 0VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758650275; x=1759255075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfei7KP/bWoKW/hTT+e9D33ufJy04pPBV2x8zyynI/o=;
 b=JwL4Z8LC/mBPstMNdxqQ9p2CSbRlcWaA/f2GPL43XtmGcvSWnaUCBpsRsbIVs8jcHO
 d0843Malfh2SL8f0NSyNCr6sXWLQNs5IQbJFXd6hluSoBjeRQCApUMejgORBIUN65yre
 fcqQJO1oU9kkAk49wXuUEzCqEl2RGaL21wHuSt8h4Aj3uwjfV6bo2B3BNGnFZed5QzIb
 z7HYZzAp1aLpPKkuDS5M1OJ1KpqPOmH4qR+6hw0aEXRwUQ1q+XEa6KW+mOX5Fg5wQzud
 W+swhvz3QeA/gziHz+fw1ZhsuneNphd4sTQsxBNNKzO1UkcIP4jzqZc77ZCeUf9SVMDW
 rnrA==
X-Gm-Message-State: AOJu0YyxS4OUfUoDhlAeTA1QOTwhpXD9/k5Y6lvQhWi8fDZ4R0qPtebS
 AGxV/0WI9UHJu8/UHos0aquQlZ8olbEF0fFMtizX0bYDt4BDzKNqVHn8qvjMjiRm4vmVGOAAS55
 aaTNT
X-Gm-Gg: ASbGncslFRiWFDB3L1jUeaIXu1I5p4oUcdBAY4UATRim/7S1ASTX7uxwMWzmwCQE/ky
 2rWgPbrUR+B8ADVuVpMwrqSsIuRiuXqDRS/I2H9/WUunobmOS2nDQm5qvolMz6J3TtOGC4ML1p2
 jkyUwkxjtwWi8IO8eex7EYzPwt/9aQf0nCYD8jCpHGSuYk45l8NFnbQXBN+tacTxCemgohqlatb
 stwwuqL2eYMizbLxcsWmyj+CuX4chA4X5P/szc7taq9CGWVxFYCcuDEMt/rgYb0hWpkV/RZ5uDB
 8Hed9tu3hYhWWpcDdkmpTWl5hg8Sh2y235lB51SK6nKNysxtfuAL/trdAOdB1fx7YUp3XA6n37J
 ZSPVkiTAyCRznM3GjJJNHSlP7zv1t
X-Google-Smtp-Source: AGHT+IEk0XGtBmVdhCzAetVIl3ErF9/RaywQqumMnZ0uctRLhR46tbhz/CxrIJl9F+V9bM+M9woiHw==
X-Received: by 2002:a05:600c:4fc7:b0:45f:286e:49a8 with SMTP id
 5b1f17b1804b1-46e1e0564famr42504125e9.30.1758650274835; 
 Tue, 23 Sep 2025 10:57:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d1c97a87csm97657155e9.20.2025.09.23.10.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 10:57:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] target/arm: Implement ID_AA64PFR2_EL1
Date: Tue, 23 Sep 2025 18:57:49 +0100
Message-ID: <20250923175751.966795-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The ID register ID_AA64PFR2_EL1 is in the space previously reserved
in the system register ID space, but recent versions of the
architecture have started to define fields in it to advertise the
presence of new architectural features. We don't implement any
of those new features yet, but will need to do so at some point.
(Notably, the GICv5 EAC spec defines a field in this register
to advertise the GICv5 CPU interface.)

This patchset gives ID_AA64PFR2_EL1 a backing field in the CPU
ID regs struct, defines the field names, and reads it from KVM if
it's present there. The only visible behaviour change is the
name we present to the user via the gdbstub.

Commit 1 is a code movement one to clear some more stuff out
of cpu.h that doesn't need to be there; it's mostly because of that
that I'm sending this patchset rather than holding on to it until
I have some GICv5 patches ready to send.

(Compare commit f7ddd7b6a1f90c from last year which added the
ID_AA64MMFR3_EL1 register.)

v2 here is just a rebase which updates the patchset to handle
the new array-based storage we're using for ID register values.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Move ID register field defs to cpu-features.h
  target/arm: Implement ID_AA64PFR2_EL1

 linux-user/arm/target_proc.h |   2 +
 target/arm/cpu-features.h    | 415 +++++++++++++++++++++++++++++++++++
 target/arm/cpu.h             | 410 ----------------------------------
 target/arm/cpu-sysregs.h.inc |   1 +
 target/arm/helper.c          |   6 +-
 target/arm/hvf/hvf.c         |   2 +
 target/arm/kvm.c             |   1 +
 7 files changed, 425 insertions(+), 412 deletions(-)

-- 
2.43.0


