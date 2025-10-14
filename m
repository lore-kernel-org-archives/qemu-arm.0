Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C7CCD187
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 10:45:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8cWC-0005Cs-IK; Tue, 14 Oct 2025 06:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVO-0004XA-4Q
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVC-0003X8-R7
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so48954315e9.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760438606; x=1761043406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIbkSUzuy95fWVG2YehHRKZZn6Jn1DT3kGS2n9ZFy4w=;
 b=IGE/rHihEkInGV3zRR/3EmBs5uRD3jp+9AnpLu6j/YwsqafnOjN5pyVpYm+IAQEGuN
 EJthRSAZM9Zu7FA2R/a9Hw8PAoWaZjt7McCf0CNpAsKNj/pWVfBKvHRxgzpK63oh5GWz
 KOjeqAtZ6jCQ469qKPtz2rNIbmmbtws+L7xKqhg5c18fN34FvRxEsYaa/1AJg9tREMYB
 qE9MFvxJ0VfPfR0GNgXQyzeE5SBjJt/tU2nGQ/JfqJtB3+MKPFhmJaCDiUQ+MSwqBxj+
 piYUQD2GluVwkCQ3SubQm591onESZgSqVSMsmhi51nTMvNi3VE13S+cOUuUIZUzBpzYj
 ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760438606; x=1761043406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIbkSUzuy95fWVG2YehHRKZZn6Jn1DT3kGS2n9ZFy4w=;
 b=Cvrt3t4gKjCz9SC4I6FVRHVZPx68q9/A4M4WcBiQ0tJpYxjohTNsYcEzS9/3rRgeup
 PCkLDVkVN2jyUg5Td7G3tkZA25Xijm/bHhla7Aj1HRjjnOGZD8n5XKLk9CHcclnOtCxi
 w9R1YlyhEJHmff8009Nj9cHEZt6s/crIrSM/YhO8x3cZk6/k35facZUkpsTi6SX/dXE8
 N/DrG7EvJeY8B/tz0XrcyZQUemduCC7OwYk7oKHVKV76rB+mfB4tV0Yd4DiewN4YrcA9
 DrjmE+2n9Hya9n6Z7zrYXHA04IEKlnqgMFv/gleiS0awkUbppeeBTVG9tRmi8zv0U34g
 x2pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNPWhYeFmqbH9wjiID44eCilfL/L3L2urtbS6YxW+ZypJeFUxltXhhXKMC5QJECmQKHF2hNxPhFA==@nongnu.org
X-Gm-Message-State: AOJu0YwC/YSaZOMGYyi47cHXekMgInMFOdvcKk+JOD7p4XcdxZcQloZk
 UmYAfg/Lh3RURvWrhNc4Sza0SamRAff8HMzaEsANQfcrR1hIY3vWnt4uItOcKYIHHvg=
X-Gm-Gg: ASbGnctAhz+HYn4dJ0+fyBQZzPktceMiSqdAnjZBLUhzsZ4m8td8svZZ035UZ27RHZR
 RfeQQruK89ZzQziVechR5fCYNh47WwmnyxkPys0jSRIBKwWyvY1ka1pUkM4LReyG1l1Nedtf3N9
 sdvpo6cd24CMO6BpvJqjKZChFGroS5mlM90a/NMFIi1qYFxjuXd5HJ5iVHJAWEsmPUXQF4HDlg3
 NtTdaboGuWeZqulG3pchvXW2jTs15V+Llwi+LxEcFLY2mGQhPbo+ngmeeJ4sAh4S8AwdUcumHG2
 rM9UqR93VhrUMloHpJz5Z/GIksbZicVLq875dyVmGWSdYo+70pe4a9Fter+S8BU7net2JeBwfKT
 85bXDI7bzq0PTj3M5Ar7XPrSlvIh5AhAUxZlqCYhDu14fUQ==
X-Google-Smtp-Source: AGHT+IE5X7bSlEgQpG3QMyeIYGEdXpqE6l/mhSZdpcUHn6QYdxjN5qcU5j40aopNr0wL4Aiw2h6Smw==
X-Received: by 2002:a05:600c:608d:b0:46e:6d5f:f59 with SMTP id
 5b1f17b1804b1-46fa9a8b2aemr167346395e9.4.1760438606466; 
 Tue, 14 Oct 2025 03:43:26 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf70fsm22221883f8f.27.2025.10.14.03.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B23725F83C;
 Tue, 14 Oct 2025 11:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-s390x@nongnu.org
Subject: [PATCH 3/5] gitlab: modernise the ubuntu24.04-aarch32 jobs
Date: Tue, 14 Oct 2025 11:43:20 +0100
Message-ID: <20251014104323.3023714-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014104323.3023714-1-alex.bennee@linaro.org>
References: <20251014104323.3023714-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

We only have one job here so no point using a template but we might as
well update the JOBS calculation and use our fancy section markers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/ubuntu-24.04-aarch32.yml       | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
index 75029c9187e..3e7fdc8fa98 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-24.04-aarch32.yml
@@ -16,10 +16,21 @@ ubuntu-24.04-aarch32-all:
  - if: "$AARCH32_RUNNER_AVAILABLE"
    when: manual
    allow_failure: true
+ before_script:
+   - source scripts/ci/gitlab-ci-section
+   - section_start setup "Pre-script setup"
+   - JOBS=$(expr $(nproc) - 4)
+   - section_end setup
  script:
  - mkdir build
  - cd build
+ - section_start configure "Running configure"
  - ../configure --cross-prefix=arm-linux-gnueabihf-
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
- - make --output-sync -j`nproc --ignore=40`
- - make --output-sync -j`nproc --ignore=40` check
+ - section_end configure
+ - section_start build "Building QEMU"
+ - make --output-sync -j"$JOBS"
+ - section_end build
+ - section_start test "Running tests"
+ - make --output-sync -j"$JOBS" check
+ - section_end test
-- 
2.47.3


