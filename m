Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F3CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:37:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyKJ-0006N3-Re; Fri, 29 May 2026 10:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyK8-0006Hj-6q
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:33 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyK6-0007SU-A5
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-68bfcf11050so1515411a12.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780065389; x=1780670189; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xNjQ8ATolvxkQnQXFaFGJLRrymYi+CqagUpkaiZh+jg=;
 b=P3UB767TDiwOwk0RKQU9l9ao05gM07Wp/3gRJ7GV8IF3MV8/gCoLgvix/V9xT0apn6
 /EjHBdq7Gsd5yhmrC93BQEx+etk4jT/EEwVeKyugwLgGJPmvETWmKKxCEIwqrIQpBo6r
 LoC2UUlCBvq7B69FEuaBk6+yczPvurm4JdJKTt5/JY/PHGGTSB0Y3qRfML4bSeKtU3xU
 CklSWpyOCd8Ncp0DP/PJWrrTM8dOIFeQeNw1jorkZuRIuB4UYtQUf4uJCp5rJrdUTfcI
 Sg5xfje0naIBJtSeurvS4tIWLf/Zyevu5rT8xxNKpFEjmobUtH8K47MKX3/f3ViG8YnU
 pevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780065389; x=1780670189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xNjQ8ATolvxkQnQXFaFGJLRrymYi+CqagUpkaiZh+jg=;
 b=oWGsW5COxbQjtd0XRaWTbf8zqPGPBwV4Hi1EZdPtlV/pE3PmBckd+BYoaRvEQQ8CCP
 7QX8Hs1f62bJCGj5EcGry6+bO5FPQE5SsGhfCZP+3+KhqoRpcd2bu3xo6ozxXVl1t7uG
 45oNqkNQEaK3DoQKt8qAzOS9Wz5oRchGGV1+aPfdD7TifVzI7wR1+qwFKPj8rQWXtKJm
 mn+P3tn6nyGeA+gU+bQyt6GNoHbXVCqyE3XQNvrFA9m7xrI+UuqRh0gFyeg3GSHXzNvn
 lJda4nhMoo+kwTik+zP2LqPWpj0nmYvKD9nBDir6Aj1K7cg/tjI5e5YiAKVKzfRFEebg
 7K2g==
X-Gm-Message-State: AOJu0YylyS6SjYSV7qUzbrVZEPpc+GPmgdsz5sgd92R+YM+r6rfVSXGJ
 bKBbfATdwkS8pRUigkVQYht5SG5HAOdvVL6oKcNcp1uBsOeJWm8tJgIPyzTWaBYM7OL0/IoCUV/
 NgSsb
X-Gm-Gg: Acq92OEEGaZ0N2Ubx92RZis8yO7LdT88Asf8gn0WzBHewk5S7ujur4yqA1EyOnFEGL+
 JSbu1rp7M/uJANTjhABfYniR85BOA5O7FrliWPVIc+BU42NgcJDRW55CT/dFrTsmPNrJ9sWs9iF
 9Cw+jkKGZqMjGFJ2gUaYxfO5C8LGLGzuZuMkXktr9+UIseGNDVYg7Mom6Pe3yS9NrNfFHqy3tAl
 gy4sJ/8qGh5O1vuF8ho9vkqrZftdrFibrSLB6YplAkUhUWpFCRmmUC/uMSgdFd0Vsa8J0H715NI
 WtvwLG1nPwWVb3bAbgufpNTaZNyYJ/i9VptDidJzgbVjSKOi2d8YaJQD6AnZJFSQW24E64Ce1hT
 C8jzvl0ua1ytuLlibuHCZFa9RJA6v9hhYYJqm3/F9Q03XhYRAgAnDCX/ms2uqdLsGIGDwWg6e3J
 bQ1NyUCUygnaqDq0INs0/9PLOMQku1aYiIp0Ypk67DHBfr9UsKWQhStUBIwSMpzQa3rWN8xXtC3
 bOM6pRScg6dVH3Bc9TUwV7u5gYgMApKoCoDgf0XGbw=
X-Received: by 2002:a17:907:2675:b0:bdb:2fad:4811 with SMTP id
 a640c23a62f3a-be9cab1bceamr139303666b.28.1780065386091; 
 Fri, 29 May 2026 07:36:26 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356a4c4sm4180675f8f.31.2026.05.29.07.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:36:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw: arm: use logging rather than hw_error
Date: Fri, 29 May 2026 15:36:22 +0100
Message-ID: <20260529143624.158935-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

These patches switch a couple of older devices away from hw_error()
for "guest can do something wrong" or "guest uses some feature
QEMU doesn't implement" cases, replacing it with qemu_log_mask().

These aren't really very important, but I was at a loose end this
afternoon and they do let us close out a couple of gitlab issues.

-- PMM


Peter Maydell (2):
  hw/intc/exynos4210_combiner: Avoid hw_error for guest errors
  hw/dma/pl080: Don't use hw_error() for unimplemented features

 hw/dma/pl080.c                |  6 +++---
 hw/intc/exynos4210_combiner.c | 29 ++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 14 deletions(-)

-- 
2.43.0


