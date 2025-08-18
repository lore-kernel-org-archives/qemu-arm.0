Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE014CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrG8-0005nr-TC; Mon, 18 Aug 2025 00:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrG4-0005nD-1j
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrG2-0002Bj-2o
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-32372c05c5dso230399a91.0
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490443; x=1756095243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o7DezmuwfjbPRIU2hYkSmLkMWVfXQ4fggw3uYW+YQzI=;
 b=PqBztlNuM9xlaawq8px0u+vIMpvcys4JF5NhbyOrE/IuFTUV61qIJlavq9l2LTA0MH
 cKNDWMIx+l3zX3wPhcm7Fp9bFLAzz9s1Tb/IQA9lXSMG266doMQa1epdLq8HacjlYHkl
 Lk+k/gwlpAudkiol6TloXaQ+KxlCEOOhcYw1/xCnHbQ1kkFxzVpN9QhGbHn8FRGCpEfX
 piW6urKQkhDeeqTSnGbe8wJx/Ir1wDPgXkWgdMvqLfPfPKiwhmrPq+/ag2ds6XF96gRt
 UawRRHGC/SpWXA7jGPhcI1DY12XWVovSSozniTw9AlSOC1FQ/ZI88RuSajVmO9Vn/sUs
 K9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490443; x=1756095243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o7DezmuwfjbPRIU2hYkSmLkMWVfXQ4fggw3uYW+YQzI=;
 b=Dr989HZSFEJakcavVKgcgGy0h1mCj+54ccvDqEHfbKqM+9vkQp+D8Qrmj9WKqFhpkS
 Btyc/yjcwGGpF3c7J/NyPt6+XmJXqyAdMVXGmCNQmZiHC5NeNd8yoTFGgg4cM2KpuTBu
 ugwfTPsrOQiLIZRersCiA5uhUh7B7n2sDi23WleeWlwmD/2DPBJr8A3rc6jn6eMoktVC
 7VPA0FBKxh8vDB//rgWKxUm1x0GzfivtXjlPkC6OxcYh12DA1GN3kl7fSbBdSE0TRtgq
 gcWdRVC81xeywBJ0tYzd4cV3ghxpjhqnz1TtPXUHfx56+C1BCybhNB0OaNh89nx8mML8
 kBwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrC6yA3AAil6zqwGrebUKoW+VxPHgHOkLjzRUe96N90l/XX3KRuWrTBW7amBZU1MyqwnX2HE78RQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx81+uR4bF7ESiSsI4bGh3GqIATsTh9TMR3VtybLiYL+v4WrJrE
 1GL5wMt1EKgD8+kN4ZP4P27bBLvgyl8liWpgNxMzQe0uRwjH6LoJV6irEhbJeUjw+qQ=
X-Gm-Gg: ASbGncsLoS5OMRtEEAJYMRifWQ61zP08vu/1crYuOmbogR2NV8mX8O+IyhXuAh+PlJx
 rMPq8zIYOCZUgY8OxGiF11ZBcP4BhCz9Orx0+8NI4zV7YfYud80UVna+I+bGXTRK7x5uByjnE6f
 2La/BoibTzlSYItmqA1JH6WOAt/DC2phNeFS2DwTJ67mqYE64gttJgKRo/PFSL1Af/ilTeR4kOG
 lQlZ28UmcMwR+TL72kaFyaOr5sCn5Yw5Av58Xv/2BtjI/Ju4sNXJQquUaQ16okQmOK3lJOdAFR9
 LEWvs4E3+6xQqT+VXqjDfB3dg5xvOfIXeBVPzgzUpVT+2ZOoJ2Ofn/7VxOluWGY0vO9fjORDsNE
 t78R1R1dVcNDYDHTTTyISKiYjExQyA98cp+b5YoJoyo4ns9o=
X-Google-Smtp-Source: AGHT+IGKjweePcn2HRKhrvWC2ZYQ1F5nagLzSElu/nDR/LZ6sLs3vN7iobRQjB/d/VBXNMWx3ikMFA==
X-Received: by 2002:a17:90b:180f:b0:321:c567:44bf with SMTP id
 98e67ed59e1d1-323421849b3mr14035859a91.29.1755490442670; 
 Sun, 17 Aug 2025 21:14:02 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 0/7] target/arm/hvf cleanups
Date: Mon, 18 Aug 2025 14:13:47 +1000
Message-ID: <20250818041354.2393041-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

While working on other things cpregs related, I noticed that
target/arm/hvf failed to produce a sorted cpreg_indexes[].

I wondered if that explained the migration-test failure that
we have, but no such luck.  (I have no idea how to debug that
test, btw; so far it is still just a mysterious SIGSEGV.)


r~


Richard Henderson (7):
  target/arm: Introduce KVMID_AA64_SYS_REG64
  target/arm: Move compare_u64 to helper.c
  target/arm/hvf: Split out sysreg.c.inc
  target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
  target/arm/hvf: Remove hvf_sreg_match.key
  target/arm/hvf: Replace hvf_sreg_match with hvf_sreg_list
  target/arm/hvf: Sort the cpreg_indexes array

 target/arm/cpregs.h         |   3 +
 target/arm/kvm-consts.h     |  11 ++
 target/arm/helper.c         |  11 ++
 target/arm/hvf/hvf.c        | 230 +++++++++---------------------------
 target/arm/kvm.c            |  11 --
 target/arm/hvf/sysreg.c.inc | 146 +++++++++++++++++++++++
 6 files changed, 224 insertions(+), 188 deletions(-)
 create mode 100644 target/arm/hvf/sysreg.c.inc

-- 
2.43.0


