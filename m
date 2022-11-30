Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1211326ejx;
        Wed, 30 Nov 2022 05:27:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4iCjz48AI+vfdITMwV61iK3PuTP+wrgl7jG/Ew3AYlL0i4ONM1H0XVSQMp08tvLtBS7fH3
X-Received: by 2002:ac8:4688:0:b0:3a5:3622:6831 with SMTP id g8-20020ac84688000000b003a536226831mr46496329qto.479.1669814852997;
        Wed, 30 Nov 2022 05:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669814852; cv=none;
        d=google.com; s=arc-20160816;
        b=lP2kyhyGARk4RTwL487f4GqQYONDL/V6uxUEu6pKuq2rNKdomIRQTAGI9vew6VdGZi
         +41K+/JX/JgDMsjro6QLGtVJlCtCB5AaT6tO5qoTC3RAeHu0XJi0X4B0CV+WM3go0Mgu
         x649X8R4RKnwLybBuuOeusY0uodYwLiAkGGK+yrVREiG+dDHtVHOHJpU6PGXdUPD+wyL
         mzE8Nf0ZunyyG/tCHpVyhzpx2Myl6edmUm4Y2slGQb4IHHS/ilZCzrdWEog56Se/q+5t
         QGyShP/aycXZCJe6td/7yYlEqN0GIdBrLWELYoytFyTQ92yZySGs+4qaU+DThVHOxcWg
         vKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=63COJef6IAkH8xxnEAdJ5D3CnIx0YX0J2CyRLRnlx98=;
        b=Gtex33ejrUZyBdRFlMN156jeJiKd4xtBRT9NbNvsuU/OHfHw9rW5xTfIrd6PiGfqJr
         jD6oI95XQhJJ50XQPZ7vTQO58ATXKosRUvpbIDDGlXP9wE7o3OXERHQozk8h5Yh1bvu0
         I+WsQCZr04i/bOvCONcQ/8tF1yXm4bqmPs5E3WXqeAt/jE/F1vWyugXhRd0GJ7ULYsbO
         xKRu9viIwrsoSEyymOU6baAw3mUh+JNgMSe61Hrdp9n4C4oeP6FKeXE7m+THxtYW/Drw
         IjylxJG5W0vxi6oeIF4u9ezXgHy7sV8YCnEFE/+oXhrocJhG5bSQlyZ0mY5PRIQYgvfH
         Flwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6cZ2ECp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a056214202e00b004bbb4219c4dsi828263qvf.282.2022.11.30.05.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 05:27:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6cZ2ECp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0N7A-00038u-IF; Wed, 30 Nov 2022 08:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N78-00036m-Cr
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:27:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N73-0006GF-UZ
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:27:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1391058wmo.1
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=63COJef6IAkH8xxnEAdJ5D3CnIx0YX0J2CyRLRnlx98=;
 b=t6cZ2ECp2YUMZba07nMyDNNaxEN0W33CoQ+VnlBxtdYwzBSBrvE1ACui8org9sMK70
 gwYq9hA1l8z0jDEN14x6nZcGErpa6MIBMbVPaoMwgvSlmwLkQ185bv9ataTXdxOSgafb
 limLlF1Q0NponTweN9EKAJXP5UeN37Ex+VagiAWe6Oh/h0ZKtaJrPAz1RmWNqbxw7Y05
 QJt6lkAK7I6tLRhGBfyAE0DAgVfbAoMGiPPfYEgg7SmyjIhTblCeLOyuczn9uj2wHR3U
 F16l3YFaNpCTiDknNix9HkJ2IsrKg9POOjYm4GKqa9AUIf3XX7JByaSVjHjh0kKkGYmb
 lpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63COJef6IAkH8xxnEAdJ5D3CnIx0YX0J2CyRLRnlx98=;
 b=o6ki/UhmsTmOmwhANFk2YeT0NANJPfP33Xtnn3pl10lR9hCBOAL3fc3CaFeeu6Rcz9
 XoBwGjfR4WHk56AT3xtwdcLkwT4Z24efI1NqxMTbV+a/i2aZO6ZIC8IMwZHx/lwjlDK9
 iDv4fenP5D6zMmVYJUy8m+gLrgbLL6xf+22D+ASlAMmrkYtn7zQN3YQI5y8Kowu5HZCC
 /OX3gW+AsLwS+Xc7ZM1zMi7LJwdJDZth0ckRB7GxYsJKjowoDpuO/fE4XfB8bBv1Hj1e
 p4SdfT5wzzc1xjydYq9FKWOOv4MpDuRYH+fl2EDOJeG0BzErsskM6zxYhAJh37MF2O7c
 fRbA==
X-Gm-Message-State: ANoB5plIJlXNjorMll3JHe8BU+OVyBp6baIXsTqyG0LiKy8gawz92lTU
 MyVBlwj4BD1Ye/5fV7eTxF9LKw==
X-Received: by 2002:a05:600c:3503:b0:3cf:f0a8:d04e with SMTP id
 h3-20020a05600c350300b003cff0a8d04emr36400684wmq.45.1669814816469; 
 Wed, 30 Nov 2022 05:26:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003a2f2bb72d5sm6994144wmo.45.2022.11.30.05.26.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:26:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <git@xen0n.name>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: [PATCH-for-8.0 0/3] tcg: Replace tcg_target_[u]long -> [u]intptr_t
Date: Wed, 30 Nov 2022 14:26:51 +0100
Message-Id: <20221130132654.76369-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wMfxTLbHrqg2

Trivial cleanup (99% mechanical) suggested by rth:
the tcg_target_[u]long type is redundant with [u]intptr_t.

Philippe Mathieu-Daudé (3):
  tcg/s390x: Fix coding style
  tcg: Replace tcg_target_long -> intptr_t
  tcg: Replace tcg_target_ulong -> uintptr_t

 accel/tcg/cputlb.c                    | 44 +++++++++----------
 accel/tcg/translate-all.c             | 12 +++---
 docs/devel/control-flow-integrity.rst |  2 +-
 include/tcg/tcg-ldst.h                | 40 ++++++++---------
 include/tcg/tcg-op.h                  | 62 +++++++++++++--------------
 include/tcg/tcg.h                     | 18 ++------
 tcg/aarch64/tcg-target.c.inc          | 16 +++----
 tcg/arm/tcg-target.c.inc              |  4 +-
 tcg/i386/tcg-target.c.inc             | 16 +++----
 tcg/loongarch64/tcg-target.c.inc      | 30 ++++++-------
 tcg/mips/tcg-target.c.inc             |  4 +-
 tcg/optimize.c                        |  8 ++--
 tcg/ppc/tcg-target.c.inc              | 16 +++----
 tcg/riscv/tcg-target.c.inc            | 18 ++++----
 tcg/s390x/tcg-target.c.inc            | 42 +++++++++---------
 tcg/sparc64/tcg-target.c.inc          | 14 +++---
 tcg/tcg-op-vec.c                      |  2 +-
 tcg/tcg-op.c                          | 16 +++----
 tcg/tcg-pool.c.inc                    | 32 +++++++-------
 tcg/tcg.c                             | 24 +++++------
 tcg/tci.c                             | 18 ++++----
 tcg/tci/tcg-target.c.inc              |  2 +-
 22 files changed, 214 insertions(+), 226 deletions(-)

-- 
2.38.1

