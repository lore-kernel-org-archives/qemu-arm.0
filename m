Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFACCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:15:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuAI-0001K2-Lf; Thu, 23 Oct 2025 08:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8o-0008MT-Nn
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8l-0005FE-JM
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63c3c7d3d53so1140248a12.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221397; x=1761826197; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+0U4t7TJx0pQHp17q8cgNldMYGi3quYhnb/lv6Cse4=;
 b=pVVcc+lSaVTqdNcFNmgKEz5KHQv/7EZdo1RYGqXomiKNWUIR/hE/j4PTZGJtdxyKk6
 hXDtixIuoiT5IO+bIXPWvN8PZlXC49N0XwUE/mZRdHBVU1mTgYV+jme/lhirAESrwT2X
 LAC0AkrpEk7m3Iuuj58lLYIC/T4QNwWN47WbU8k7gM6UXWTx0fY1ewdE0EP0d6DI+cbM
 J9X51FGEWvsAj3Mb0MicTUFYfB8ICYeKwWl2fOP0aKWCAGGBH9Jq2p9HJyI72b8570BX
 3JVh4oADNxi/msHGNcwJ9EIwRdSkQHUpuIWOHK9wNDP/JoVO3ypVT50YbOeyYsIu5XAg
 LzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221397; x=1761826197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+0U4t7TJx0pQHp17q8cgNldMYGi3quYhnb/lv6Cse4=;
 b=GJDBq0GtpZv2AWzti/mAvIHRQ0Rt7ClpF+F/7QKv3Rp8Ceumitkwk5MnN2SIkSAox7
 22NNqbfgSRSlyTlU+YSXjxdPs+Pc9yf4FcW0O8Ea4YfeKnSByZxYEHykAi6bj2ZLkhxO
 p8aqozE5n+jupMW9pi4tpsXhAAVlDlWUGvrAzlWlbuCZ3+2dgrIfGVR4OxsSTCi7NLur
 q376k64pn63krNW786QwDrbk2gSh+KkmA3Y2M2V5jz+AZVAb3HoNt/R87pMICCMMhc3L
 9xQaFiZYteIhJqGOA5RMyxiUzGm6dJKqZDKyWvv1ulqdXmEM6sjbVXBshzGipqXWzSMT
 ffVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpuBmlufNwTPx4Vu6WblOZmrdF1eYN5ZknQiDKYqIKhPM8ZO8ABCNMMqmK5HaimXWddKhoGR3qFw==@nongnu.org
X-Gm-Message-State: AOJu0YxPOIXYO7mIca63qVFIK31GdL2Qp2gSSLT44OLAub++ejTYPoC6
 nGjwwrLONInCR5/FttZ2WljMqdZtb3QDRP9Nt2oQbk9SrNCO+FmqFtyiK0MPduWjKEY=
X-Gm-Gg: ASbGncv+8P9CPFnX6tXvMIv7sr1LP6Imz9eiYYzi2mJNsr6ECFTeLL/lLEC2qRpzKtQ
 W7MvlsQgJGgA2VKi1dfd/6nRaRCkGgUU2QuTF91W4EL7nFDJTGKYF+zxiX36TCOQAdPZkv/At36
 5BcZLZY+4BQRqxqPb0zp51Q1Bdl6gfIZXPWAyRWn+uDWGdL904nMg10jz6CsxXXdKGMAzXs7GlE
 C9l7vh545AONSqba0nolowEGEnpwjPL8qQ9tG0mmldXkTBP9nthWI8GjcwGLGKaz1uQ0wf0dna2
 fH9gjAfLMx0noNazCShf5D1aSOqhCeNyabucWURMfjCGM8lLlOngNnWi25Ev9xzbrGmtn1YZItZ
 ppuFVTHSc8a48bJ9N2kGp2r4007id5rNePAM52kleGAeivYBuS1SPTuLvynlTuqSYUgUVKMTD6y
 rG
X-Google-Smtp-Source: AGHT+IGYxYTBza0UK+fad1RIGV4aG5m25NcQ0rxVC3BvIg5L0VkjF4a8JVKWyklfghiIlXAWgrrBuw==
X-Received: by 2002:a05:6402:35c7:b0:63b:ea47:bcbb with SMTP id
 4fb4d7f45d1cf-63c1f64c996mr23288766a12.8.1761221396978; 
 Thu, 23 Oct 2025 05:09:56 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f324628sm1531832a12.34.2025.10.23.05.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:09:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 062D960E36;
 Thu, 23 Oct 2025 13:09:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/7] scripts/ci/setup: regenerate yaml
Date: Thu, 23 Oct 2025 13:09:48 +0100
Message-ID: <20251023120953.2905297-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023120953.2905297-1-alex.bennee@linaro.org>
References: <20251023120953.2905297-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

0d4fb8f746d (configure: set the bindgen cross target) updated the base
libvirt-ci project which has resulted in changes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/ubuntu/ubuntu-2404-aarch64.yaml | 4 ++--
 scripts/ci/setup/ubuntu/ubuntu-2404-s390x.yaml   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/ci/setup/ubuntu/ubuntu-2404-aarch64.yaml b/scripts/ci/setup/ubuntu/ubuntu-2404-aarch64.yaml
index ce632d97108..70063db198e 100644
--- a/scripts/ci/setup/ubuntu/ubuntu-2404-aarch64.yaml
+++ b/scripts/ci/setup/ubuntu/ubuntu-2404-aarch64.yaml
@@ -26,7 +26,7 @@ packages:
   - git
   - hostname
   - libaio-dev
-  - libasan6
+  - libasan8
   - libasound2-dev
   - libattr1-dev
   - libbpf-dev
@@ -37,7 +37,7 @@ packages:
   - libcap-ng-dev
   - libcapstone-dev
   - libcbor-dev
-  - libclang-dev
+  - libclang-rt-dev
   - libcmocka-dev
   - libcurl4-gnutls-dev
   - libdaxctl-dev
diff --git a/scripts/ci/setup/ubuntu/ubuntu-2404-s390x.yaml b/scripts/ci/setup/ubuntu/ubuntu-2404-s390x.yaml
index f45f75c9602..4f1a49be34a 100644
--- a/scripts/ci/setup/ubuntu/ubuntu-2404-s390x.yaml
+++ b/scripts/ci/setup/ubuntu/ubuntu-2404-s390x.yaml
@@ -26,7 +26,7 @@ packages:
   - git
   - hostname
   - libaio-dev
-  - libasan6
+  - libasan8
   - libasound2-dev
   - libattr1-dev
   - libbpf-dev
@@ -37,7 +37,7 @@ packages:
   - libcap-ng-dev
   - libcapstone-dev
   - libcbor-dev
-  - libclang-dev
+  - libclang-rt-dev
   - libcmocka-dev
   - libcurl4-gnutls-dev
   - libdaxctl-dev
-- 
2.47.3


