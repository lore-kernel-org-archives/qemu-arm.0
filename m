Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp133283lfk;
        Fri, 13 Aug 2021 06:18:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXIYwWOudTwr1dh80v2MvGQDUZn/9T7cC1sKpaHs/23H4p7WITmumSEsn0tyqejZzzt3xc
X-Received: by 2002:a05:6402:b56:: with SMTP id bx22mr3112165edb.285.1628860721249;
        Fri, 13 Aug 2021 06:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628860721; cv=none;
        d=google.com; s=arc-20160816;
        b=wk3bIO0ez84NT4H9zH3ldpPCQJux2OtESK4R4der4TtDwNyHWnHsJQq8pSfYXi+nT9
         iobyYj192Hmt8R4DNLml/NLk6CVkzCQjXCgle20BUajncmlfDoE+4xyU3rmrW+AOaQBz
         1yK+TNScGVV8lOYBrqeOiQnotgD+vAPrbXn9TAty9GdCMKDYs4Fzqr5gW4QemeeOjVcs
         PC2cEJL9EfLYumg0XqJdnSJ5jgr9ROgY51oaKP0uZjGirjmRLRIDFVkIiOmYNfyp+SSh
         zR7vlSpkNmXRcapJt8Od/Ld8yeK4b6IZ10+JeSUv9GOSKzhWlQ2a4DIxNwIFYGe5X21o
         saHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VZe3/1hyTQTCF1UUiSV/SSyOsPwX6hyTgaN6st6LKBE=;
        b=rc/rj743HpOmlKIsrzrl3Ilvmj/GiELMhh6KCM9TlpU7KiTZEC2x7RiVmH27LoBYzw
         GrOJeWkJyFmlN6TP/VL232dPHpPYlRw0H4TvoVcA2huKm7U2wbEFWLGixsXjqPi39Uk6
         IBHw8R8mZlqTI65oSeT+IyWRHdKMqyJJkSnuhRNI39SRuR3BDh5zcFIbB0NL2ouBjvVm
         fSp/07vTMep1ld/4ihLC2cxtQSXQfG0gOEW3II5xNtbgYOZc1xPR7BjHjqrlUd5amph1
         37rOepsLU7BuB0SvVz6RlJY6A7IflNedDUX5iomJqoU7zclvMCFIPMGPMYBO8VQYtHbV
         J2ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgHaVsRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22si1665493edx.181.2021.08.13.06.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 06:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgHaVsRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEX56-00064Z-BE
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 09:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4j-0005zV-Fo
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4g-00018J-N3
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q10so13299799wro.2
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZe3/1hyTQTCF1UUiSV/SSyOsPwX6hyTgaN6st6LKBE=;
 b=LgHaVsRug91j296MQhShrF29znimPA1dF5KPeO5ifQ9RgUPQ2ZUXUXMBhTt77urdAH
 wSuvcI/lTEHbDajMdzuQVpnfbptfcWjTSHlL8zsQz81NqQ0CsN4EhK1XdbR3sf03yX2C
 AsOXAqZH0cRNEg+82XRJ1vr2DG/ARmbxvLXSOgJWl5YgKZC7dQUxp6181HpkUfDjDv0f
 CYSZ+LlAa2OmNNSp57t+NdeLjSpUHgtGGvOHtZzrri0gedsg4Hgw7N86HG/inaw8QArr
 Vuj1TE2eMM77jyKMOoYsxVyDC3zvo79UKGZX0HxDvQflgQUkwrmve9grLaSP+1JfZAs7
 xqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZe3/1hyTQTCF1UUiSV/SSyOsPwX6hyTgaN6st6LKBE=;
 b=PXxf5PDZPAy13jfEvX4bdvK6nGo1aNn4e3KrGYuokEq0ZFk9+XyW7gPQ9X40B/ey0l
 BZb+7U/ItSUEXZtRQbE+hI62OPY1M8fmMCVChIJwJRjz0YsLaWuHXNT3uUvSgLPggppf
 ka7ekexRCNK2mSso6k7YxwbeRVLwOFEK/k08cG61vz0RwnzSpsBqx+yEenpt3IxavW2z
 7r54f4PiFJ4pCnaLi4wgP9VD3cvUqhofApVfMFJcGsoRl/GBM3umMJjlgqSNKmXZ5wGJ
 eAJm75fp18UKMyVFKBDmJxsNau9T9pA8BXMOrdoED6K4l0rTQivg/P0bZ2jQoL900Fmz
 JKVQ==
X-Gm-Message-State: AOAM530qQDt4AE5w5LsoUC8Xn45CrdKZtVFN+RVE71IHED8kuiaaS3WB
 /yCCUM8gqF1CXtk07QAASFG4nQw58fdzXQ==
X-Received: by 2002:a5d:618c:: with SMTP id j12mr3075529wru.374.1628860691714; 
 Fri, 13 Aug 2021 06:18:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/7] linux-user: Clean up siginfo_t handling for arm,
 aarch64
Date: Fri, 13 Aug 2021 14:18:02 +0100
Message-Id: <20210813131809.28655-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hQGU3VbnCbb

Coverity reported that we don't set the _sifields union when queuing
the SIGTRAP for EXCP_DEBUG events on aarch64. This series fixes that
bug and a few others, and cleans up the way we queue fault signals
to be less error-prone.

The underlying cause of the bug is that when queueing a signal
the code must set the right field in the _sifields union depending
on the si_type that it passes to queue_signal(), and there's nothing
guarding against forgetting to do this. The "fill in a whole struct
and then call queue_signal()" code is also a bit longwinded. In the
real kernel, there is a function force_sig_fault() which does this
for the SI_FAULT signal type. The series provides a QEMU implementation
of this (which goes alongside the existing force_sig() that does this
for SI_KILL signals), and uses it in the arm and aarch64 code.
Because force_sig_fault() takes the address as an argument, it's
not possible for the caller to forget to fill it in.

Obviously we should also convert the other targets where they are
directly calling queue_signal() (there are other places that forget
to fill in the sifields union fields; I don't know why Coverity
hasn't spotted those). But I thought it better to send this out
for review of the new API and approach before spending time on
converting other targets. (In particular fixing places where
EXCP_DEBUG handling forgets to set the sifields address is a
pain, because in the real kernel different architectures might
either report the PC or else report a zero address here, so it
requires looking into the kernel sources to check which...)
Once all the archs are cleaned up we might be able to make
queue_signal() static so it's local to signal.c.

PS: there's probably a trivial conflict with my include-file-split
patchseries.

thanks
-- PMM

Peter Maydell (7):
  linux-user/aarch64: Set siginfo_t addr field for SIGTRAP signals
  linux-user/arm: Set siginfo_t addr field for SIGTRAP signals
  linux-user/arm: Use force_sig() to deliver fpa11 emulation SIGFPE
  linux-user: Zero out target_siginfo_t in force_sig()
  linux-user: Provide new force_sig_fault() function
  linux-user/arm: Use force_sig_fault()
  linux-user/aarch64: Use force_sig_fault()

 linux-user/signal-common.h    |  1 +
 linux-user/aarch64/cpu_loop.c | 33 +++++-------------
 linux-user/arm/cpu_loop.c     | 64 +++++++++++------------------------
 linux-user/signal.c           | 19 ++++++++++-
 4 files changed, 48 insertions(+), 69 deletions(-)

-- 
2.20.1

