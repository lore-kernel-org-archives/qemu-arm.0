Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp388789ejc;
        Thu, 19 Jan 2023 06:58:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsPDWxaMK685QeOVoWYGzk6xBtMKWSeUJWI9OvHzhBcG+UMnmuvbkrDoyNfZMB4Fj4rfVip
X-Received: by 2002:ad4:5909:0:b0:531:d090:4083 with SMTP id ez9-20020ad45909000000b00531d0904083mr15517637qvb.14.1674140337293;
        Thu, 19 Jan 2023 06:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140337; cv=none;
        d=google.com; s=arc-20160816;
        b=BIJXPyKxGwgmn7PrZXa5erlbGKX/mzaIctyvxTLfZSmXxUVkVP0ltX2SGNdRdCtNDj
         qA+5hGuRj2Ohy2ohXZarYMp1MKVCUr6LL8DPenS5GEB3lwkZ9cSEtP5L1QTbqcQ2EL1X
         SgXp1n/Z/pKQWXsjWrnQBiItG452x6XlEDuk4OU3J49pf0Ixw2C0Zppk+AJ5I3rZBCjU
         q+hu63X2h8cRabqBI+vltbIumQxi5c95Zc3qAsbxhHWjymLTTG7rGpTlHpuN4ew4pbbo
         wP6GrebsNHhYnYRNC3pxq7i+attDwqDK/ytSXJidA0zxJb7Hz9EHpUiRyJG9Gui/wgZ8
         oMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+4Tl4K3CGqyg++a/7QHqSqqgZ2XVBo5YG4lCRSctXYI=;
        b=OeeqO1DJjfO9Yrderb9c+ox3TKs9LegKeE4U3py9rmHKwSNOoIwDwsV3cAZGrG7BDQ
         8+svfMheMWkZxOHb5AVHkBo3Aqm+c/90Gxi3pZGeDf7zMvonlPbv+2NgT8q1jtAcYQQ6
         XZsYhy/3bR1QR+BLzbxq2Lpu9181IOwnWRwkVL7pBO18vOq2mzwejw37fyICY6b42KFe
         rqk3bCwTTbNAoCtFa4h/2EOamLiAosR9W5aMLiyTJ0FreDgV54X023txCyEo4mkwdwDu
         CMOuxaosYqae+f4oizKoQyDcdu6j7SbWA4aD4VKUIvHm+UqHDLdRV4wQ/rm5m1IeAYBP
         cy1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7jYh/dJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020ad45f4d000000b00534ec62fb09si8434733qvg.400.2023.01.19.06.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7jYh/dJ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNJ-0005tz-CK; Thu, 19 Jan 2023 09:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNH-0005ng-Fx
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNF-0003Wh-OM
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id q10so2151021wrs.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4Tl4K3CGqyg++a/7QHqSqqgZ2XVBo5YG4lCRSctXYI=;
 b=v7jYh/dJLX3c7OWmnPoyHSPvpP9Th1BF5BzoOjbbIiJ+5wHEO53Nhbslg5GtlrgG9y
 qT1slXIrvTl2Ogbh6GG1xPLLoaNRe3lAp+XtkCiyeoJp1H0IjuyKPyuReA9kYcGbKx5o
 VgU/LvOFxyxRr3m24s6y1/iL75TEnc3KAhexaD0Myl8ufte4SJ5GRRDhvAZhQSXb4aDo
 z6WQQIf1JPuD1LZxCK4DVVELbwTwE3OClM6hV3EV5SCJMSKnZ2TkfIqNKyF7u1d2zqLA
 Ae6kHmvsepfzOXJUu06gm8jiAiNQR+kTBHYj6ZhXrhkhtqwCX7NSehNyWtBO1Ng8ZTfT
 3coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4Tl4K3CGqyg++a/7QHqSqqgZ2XVBo5YG4lCRSctXYI=;
 b=UOFuigzuapuTyTaBpxxxq/QjcDoP531DcbhmbIcxZOTkdao9fqGuyM0732Z1uOFg+a
 CkTEEKQjYozxsb5X7M4rvNY3t1CpRkJRnIefnzBkimJxdp1ZK0wMFhCvW+L4UCjvoGX3
 Do0OBq6lTkp+W4mMb7oz5HV9N8fdF2nrfYwyOxWN6LSF7+22W8jc7Kry2CQGRQK1LPEp
 Apkv7pUovjMNTWQi5XSJkNTbpijX82lQXdc3Gpy3paGv8y47AUA+ob7Lvtw2tT6cJCfg
 anqklTBzm4nXjJazCnUA3dI7FSptKHdqH5kzw2CrrW1mY8uPJBAVqv9iijTy+KfhtzgY
 RuxQ==
X-Gm-Message-State: AFqh2kp+9++V1BmHfWm7tK+QB831Gjel4vDfdS/YHV8l3qWKZJ4A7Wjb
 NGGrBTptrjuseEEJkHhaL+QgmZFmFvRYfX6E
X-Received: by 2002:a05:6000:a03:b0:2bd:e7b4:aee3 with SMTP id
 co3-20020a0560000a0300b002bde7b4aee3mr11111603wrb.66.1674140320236; 
 Thu, 19 Jan 2023 06:58:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adff00e000000b0024cb961b6aesm33198829wro.104.2023.01.19.06.58.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/11] tests/qtest: Allow running boot-serial / migration
 with TCG disabled
Date: Thu, 19 Jan 2023 15:58:27 +0100
Message-Id: <20230119145838.41835-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8AwBaVU2+20T

Two test were failing on Darwin when testing Fabiano's series
which allows building ARM targets without TCG accelerator:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

These patches allow boot-serial / migration tests to run without
TCG / KVM.

Since v1:
- Split GString API conversion in multiple trivial patches (David)
- Use KVM first in migration test (David)
- Dropped HVF changes for now.

Philippe Mathieu-Daudé (11):
  tests/qtest/boot-serial-test: Constify tests[] array
  tests/qtest/boot-serial-test: Simplify test_machine() a bit
  tests/qtest/boot-serial-test: Build command line using GString API
  tests/qtest/boot-serial-test: Only use available accelerators
  tests/qtest/migration-test: Inverse #ifdef'ry ladders
  tests/qtest/migration-test: Reduce 'cmd_source' string scope
  tests/qtest/migration-test: Build command line using GString API (1/4)
  tests/qtest/migration-test: Build command line using GString API (2/4)
  tests/qtest/migration-test: Build command line using GString API (3/4)
  tests/qtest/migration-test: Build command line using GString API (4/4)
  tests/qtest/migration-test: Only use available accelerators

 tests/qtest/boot-serial-test.c | 46 +++++++++-------
 tests/qtest/migration-test.c   | 95 ++++++++++++++++++----------------
 2 files changed, 79 insertions(+), 62 deletions(-)

-- 
2.38.1

