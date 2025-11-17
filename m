Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1873FCEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 20:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL5zu-0005Jh-Mq; Mon, 17 Nov 2025 15:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zl-0005IX-5S
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zj-0000bN-Hs
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b3d4d9ca6so3908075f8f.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 12:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763411917; x=1764016717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zTInPho37rHm/qO7ZFS6pA8QVfK4rpRL6wvD6QhEAcU=;
 b=kWkGFWALcypkDZdL2Sknz4yXGrL7pdSx9ttR96Ri2icXYCcdrswYXfYq8O3Kqykm/W
 TO+hkGkBbjD/S0wwMx6BRuzarGPKYPHoobdTgHE228gNZzTMD2W1zr8+zmxSRn6Ex009
 M5Qn7ttFrHkHCRmQ6KAeP+RkNuqWboI7HTH4HzyTE9/f65eIIa8z3s0HXDzzmtgImXOm
 D0sfA1YlJEE38LF0fDChAUsUO+gZyQu2VTDx3HdQVSk5rLyehhKHJt5JAMKR5LsSHI1/
 xvEI303SnGp5EE3NB/eB/5X3K7DQnRhGHnRBFPxOfZ6Mj3eJC39xNeGXFuaZO21O733Y
 frKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763411917; x=1764016717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTInPho37rHm/qO7ZFS6pA8QVfK4rpRL6wvD6QhEAcU=;
 b=cAeKzGx+gksaRQhbRkYSSYzFnRcbZLbkXPsI/ZDPbLeHAoGHkrr9a/ecRFCGT7cOLj
 CqE/jFLMtGXXkP6ignWw69JPIlaG9G37Pog5M2p/bBwgMbHBJHKBW32cVWHFFsCnGZMH
 bTZrnJKDZOIdL11w7lgSfw61fox+5HIpEtnu9a+f9TDWWbnAM5sUIaO/vkmNIc02DFH6
 Q55MG6RqhfImEodpEdphKiAHRuZWMMDwUN8tFfYsX0HvQp5fS0wrC81ikPzFXCskCmEU
 s7oRiK6217pFK3ep+K71OoJ1WDVlCmp1FFuzpf/xVz92pzwYrUum/RRVC6CciI29AFve
 gKEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEZAG/zfW7arRSQQRHUeY2KbLzTfA7AvpCCw4I/aZ5fK7h4jd13oYGGnW0QTb/f/KI5Nfy4rZkJg==@nongnu.org
X-Gm-Message-State: AOJu0YwJNNZhcVn6E8KaZhne3kPXLdaVPgIHRjcTkk72DA+bQFVeooIL
 0V0897B9LCA+PRnRVo5ags2WghbRxWxCIHFk7h7CA/otatGR0p15IVA5U3Ce1wF/FPk=
X-Gm-Gg: ASbGncshjic2TrRoA+SRsLc5XfS9JVAavB5JbApD+fWyuplUeUB2prEOPWZ6xqraXRO
 X0sddjz4EfOAZFvaPh58hXK9wbUc3ScfVQHhICn0+1UA9JvhDbNdSX28X4vGJB6dbcaR4ttUFjx
 UmklhQY6HYz1WH2F+TTYmXwHmN+rqtjA7shETfhB3AhEALr0VRntInSLMj/kakkKssOWe0cuDd0
 scZPD4ihvTpg/zCLQo21i+9FUylR/dbQrCJbYaxKIfy44/XhQSneWzrcJI/iRiQf9L+tLiTU4v3
 QgLuLBTv358wkh2O3V2K5KwKmZEnRI8q2xLepGsDK0Im2Ys2JUvA2NgdhfJozU4ueYCDLp5lQHH
 C00Y6prS2dwPG9r9fBuHv1osSYn6lKUxkkVBzF9diKLW8zUBn9pITzdf3yJ4IScX4ioNg+7ZU9o
 8eTR8L8XRgotLIkxn083RKSxxNqSBMalG5MXyTxE8j99aCR/cOecB3FmuVRgAF
X-Google-Smtp-Source: AGHT+IGg16NCbWU59x4qKTYBMi/x6cMFj1R/FWIrsPX2S6SLrbKpTPOlyRHREDR4IGyyDvDpad1nmg==
X-Received: by 2002:a05:6000:2509:b0:42b:3e0a:649e with SMTP id
 ffacd0b85a97d-42b59328f9fmr14437781f8f.13.1763411917322; 
 Mon, 17 Nov 2025 12:38:37 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f17cbfsm28011422f8f.35.2025.11.17.12.38.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 12:38:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nick Briggs <nicholas.h.briggs@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH-for-10.2 0/3] buildsys: Fix Solaris build
Date: Mon, 17 Nov 2025 21:38:31 +0100
Message-ID: <20251117203834.83713-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Unfortunately Solaris OS is not tested in our CI, so it
bit-rotted. Fortunately the fixes are easy.

Philippe Mathieu-Daudé (3):
  qga/commands: Include proper Solaris header for getloadavg()
  migration/rdma: Check ntohll() availability with meson
  target/arm/tcg: Undefine Solaris FSCALE definition as a kludge

 meson.build                    | 4 ++++
 migration/rdma.c               | 4 +---
 qga/commands-posix.c           | 3 +++
 target/arm/tcg/translate-sve.c | 3 +++
 4 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.51.0


