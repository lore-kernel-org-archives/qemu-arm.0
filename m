Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp330026ejb;
        Thu, 8 Feb 2024 11:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXP4rkPBZCDKomS1gddroC4vlIU3MC1mEi1c8dELpn3Y+VWlLEMMHkvLxhp/f9qdqY04CrPU4YdAnIs5jPNdE9LAmUYdVyn
X-Google-Smtp-Source: AGHT+IGsg50ZtMxDBOiDx1nB8j89QGsd4WNjWCgG9TOwtptxiJyGr2wp22TnUvCXeontie97ZBg3
X-Received: by 2002:ac8:58c8:0:b0:42c:3b1f:fe31 with SMTP id u8-20020ac858c8000000b0042c3b1ffe31mr218017qta.35.1707420510247;
        Thu, 08 Feb 2024 11:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707420510; cv=none;
        d=google.com; s=arc-20160816;
        b=oKxCeP5euQ/2WUF+6g7XpbzwUoZdRGTDJGC1Oa8W5VpQTWfSwknO03FE70WYWXEg8u
         yRgm3RlkCnyi5y5FMuiZCRmlzv8LPZLfPZQlxbBGF3vm0XVk1vGhId/Z8SCPX3a105vb
         n4vWxGerg8Mll8JgxjRZRZRvuYplofGeRPWmWc1ug8z+B2iU9UGNzbanG9wy6ACFzq3K
         FV2OCWmcLmh5PT7aKVlpIk6F8NNOvImL+vVEWGrc0HiV9b2P02S+iLrBgeBQE8FIUHnC
         TJFFhpXsq/u2FE4feqhK3crVYwCKuZ2ObDW2WpfuzbcJSGxpfytrJPc8c9v/J/jeZXVI
         374A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
        fh=bWNpUG3zo3qFaDum9eX8AfkChd0tEqTk2SlI2XqstEE=;
        b=USf4mcjBq58m8JPiJtBN7IMK4c8qIURlu9PqqidOa3PW+qGAALfTpJ1LTSYc9FXwUP
         E9ZKKx3cUbErj0tB6IVqDBY27F4K3IpI8tCGdVynx0wsOTbke+D1n3wpSPLmeucnlISs
         WQIG7uklC1JEdQ0l6sGZtY5e6RW0Yp1pZpc1wcIe4vWYDuE/vmmAjijwMGrx45DPUUV3
         vEcM2cc6ZshroB7L1OCqBfUr80eX4t7W32jabprWpuoiNbuvGz9K2fZG7kQc/0Ag0h3/
         AtRlyM8mSrSXQHv8dkedcPPhQckvr0xQKEoZ7faFY+7ATkIAP2sN6ZfZDh46KZIzvcqF
         DhBA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Si+DT/Ts";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
X-Forwarded-Encrypted: i=1; AJvYcCWO4hnxh3HXRhKTgDJEIS9iMHIapNSlkLtYM9tmpRvA0FeMfvgodLDnphsKvKYtasXnZYqxYYlbKVbss2alS9Szp1r1XuA9
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a044e00b0042bf828c159si119543qtx.609.2024.02.08.11.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 11:28:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Si+DT/Ts";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYA4F-0004GZ-1H; Thu, 08 Feb 2024 14:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QCvFZQwKCN8OBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1rYA4D-0004GH-9d
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 14:28:13 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QCvFZQwKCN8OBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1rYA43-0003oy-2B
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 14:28:13 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6049f0f9856so4440937b3.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 11:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707420481; x=1708025281; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
 b=Si+DT/TsNnB+gceUhWVFQ13jUmFM/w63Zd7k9Ybz7wt9ELXFmqkClrI1j81GJgaG58
 ot8pL7suh857pkrxOq76oXE3eXf5eIeixdKRVB1d0koieX4kQXmn02qm54EGZLRntFqd
 iqLWLSqMHBGIhC7DapACmfyOGyer3PfagjuC1Tv2ecxQkEvAd5pJXebjkudSBkh6Bp6Q
 bsQJUW49Juk67h1s11BRileNT7mKV4hgG84lKbqP0JEwzJkWojxcOR6c0+gAp5U7uzVM
 SAJFEkyG6sdaP95ZUyOaqpTk8AFQtbyU9JZRdiRyJUGy1/bO9aNN5MKym/lCH3YHJaax
 iUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707420481; x=1708025281;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92fOOnHCkanWg80V2hAwSCwodLG+3/RgTATFlOBrVEc=;
 b=q0vnACI1Vevge9n3LDWtO+rmhDn6hKDOyJ2oAp7UfDbjY5ge+CpR3kKfiYNw7P82fK
 r5X0UWU8rUeZ/4k6eZizAr4RsPQ4ynT96N6gIXfHr8yKJXlEM+utIQ5ObwqBe/rdB/tL
 NUzaVsvEhLS3FW3W7baEoWbHAzaT0G9Ug32Za4r7eBwNdrKGH9rSx98p12rj8MbLWc96
 fgH44RcRudCRvtBcPGTB5PGqy78Fit9leJuIwlgaK6+IxppJLHAx5jMncuVtZe8A1wYN
 W4V3LiTdAaIoEaYkvGyFJw8Qm4iRWlrsrZn/SJcgWQWSDNhfTFEsSfe+s8jiRF+i+2Aw
 yqdg==
X-Gm-Message-State: AOJu0YzHFTCM39CWfcwT7jsMH8VbMba0u++ZxGg5AUh4UOci5buVwOEv
 B2eqmbpNURZXaST0U88j1gczthcv99H4sMFI8djAYfcm0hlsGbHbSVzws7+inlV+oep7xYFPfKx
 EEahLYI+MIKVa/H0CsJ6S3MPnqQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:70b:b0:dc6:55ac:d08d with
 SMTP id k11-20020a056902070b00b00dc655acd08dmr104748ybt.5.1707420480860; Thu,
 08 Feb 2024 11:28:00 -0800 (PST)
Date: Thu,  8 Feb 2024 19:27:51 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240208192754.2774311-1-nabihestefan@google.com>
Subject: [PATCH v2 0/1] Sending small fix for NPCM GMAC test to properly test
 on Nuvoton 7xx
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3QCvFZQwKCN8OBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: yUXHObUsBzbM

Removing testing for PCS registers since that doesn't exist on 7xx.

Nabih Estefan (1):
  tests/qtest: Fixing GMAC test to run in 7xx

 obmc-phosphor-image-gsj.static.mtd | Bin 0 -> 33554432 bytes
 tests/qtest/meson.build            |   4 +-
 tests/qtest/npcm_gmac-test.c       |  84 +----------------------------
 3 files changed, 4 insertions(+), 84 deletions(-)
 create mode 100644 obmc-phosphor-image-gsj.static.mtd

-- 
2.43.0.687.g38aa6559b0-goog

