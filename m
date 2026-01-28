Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D79D35693
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 10:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl3G5-000261-M7; Wed, 28 Jan 2026 05:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G4-00024b-4D
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G1-00029V-Dg
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:47 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so97238915e9.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769597922; x=1770202722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xri5nPLjqq920DtmBVk36uGiYNB2CFzx+rtg1k5XJOE=;
 b=lv1PoG8iyo5wDbx1eZrK4PNeh15q6KaqASD7z8dPKxDkmqTsCKoJcFr2VOkBHO7yuf
 Bk/Q4EhISpLK56kFRlraoFw5zjg67dZ1iCHOuOzIxPEA+rqOj3wqKl6EMwBnF3TXETKA
 KR9glOoAegq8hV4jpSno0ac+R+P5+nsyz0bv3VIZV1YifARVvVWcGGhuzLDyBwkJeTQg
 nmrkfWwN6TdHQeOHWFkwm+9QDCjwDZ93FC+XkQfqlTYUjzwZ9vS8KS0VubMWiIzt4yIi
 EZqyCrfZtbv3lznQmbLGjiC54Wo6dK5LXfL7j5qII4cA1Gpb+7CMU8AS+8ytjbEVRfwY
 FjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769597922; x=1770202722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xri5nPLjqq920DtmBVk36uGiYNB2CFzx+rtg1k5XJOE=;
 b=QVaRtd6ucn0vMpOJWms3i9sJkrWYJIanNA8g7/aeA6yg/qGMK+HV5/ud9g6YwZcny1
 mo8C4MEhFI/5UFg+EQzRLkQiz/Z3PqedMTJ4PYvbB3Rhcre9RKdd/GERHb45aHy175s1
 cWsDjgZG5xrJ9nBCDGaAd0CyRLAbgwBdikyn9IStxGQ7I0jkAjj3w7JXN+RlJE5RNNx1
 XM7Ztb0pmvlRAM6AqWKYzefZnqg63hXM/4ReTgzEWIU0mDmp0rxu5uL8Te1V4d8de/Qh
 UBSLXQQ2jw1PoiFdzPjdtf/VGDF95yH2Z2fE+lnEgEdVQNAyLWYf1oGjr/X24uD9NdBh
 qksA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7MfdMRj1ZtUNTf+ImYB0uRoMtt+adx3OGq9xx6Eu77s0AknBXAO5MPmq17rn7NxHrka5pk2u/1w==@nongnu.org
X-Gm-Message-State: AOJu0YydXrDzFvgyWIYfNpH02HvBf3ozKIafCa20heHx8yPOLiisRD9J
 dn03o52nE8wWFZ0IX4D1NgNvSHZDTrMkQjU5NvDS13nr5Qir1EOl/UCTnhQj7RARSh8=
X-Gm-Gg: AZuq6aKoy1ek0PP9PDwtK95jf1bpmNNFzXAq9BM+kvZur7wxoID+RanzXWwSiTEKBmY
 juPGzfLsi9D96Sj3qv4uJ6GCgVzz3F1FeISpDh+XmZe3GaqYejf71vOHEbEB6eXndfGEqmCwlpy
 RnDCV8JrmnSHylQqjXlyEDmn8a9z2TqkrCQwWVLklyJ7aTFHzFspSNoFrw7wV/bcdIOlZdaNDCz
 ACUIeQP/Jaw/fjY2WsyJz2mvay178pxom//UwB+z6MhjCec7R1WwIMppDZfLZBpgmyDrZlUeMUB
 Kf9xNq/JbtvBJ4DWt3YzXbjeTUTt76UjevhSA/bJrobGEYbJPbRWo7Rr4qUjo3Jr8XHPNFEBFhH
 5dChS0odrrq8tikdDF6N9W1ZBVhqvwjKFwurrtQjpPnGeEP7kopHMwGPDDlMG5KOqByjHXouSqT
 X/alAP5EUG8qQ=
X-Received: by 2002:a05:600c:8117:b0:47f:b737:5ce0 with SMTP id
 5b1f17b1804b1-48069c5a468mr57125975e9.23.1769597921673; 
 Wed, 28 Jan 2026 02:58:41 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806d98c8desm44397835e9.3.2026.01.28.02.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 02:58:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7038F5F7F5;
 Wed, 28 Jan 2026 10:58:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 0/2] testing/next: current patches (docker,
 test asset migration)
Date: Wed, 28 Jan 2026 10:58:37 +0000
Message-ID: <20260128105839.3487840-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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

Nothing much in my queue at the moment except a minor fix for the
container builds and migrating the last of the assets from old linaro
servers.

Alex.

Alex Bennée (2):
  tests/docker: rename wasm cross container
  tests/functional: migrate sbsa_ref test images

 .gitlab-ci.d/container-cross.yml                 |  1 -
 .gitlab-ci.d/container-template.yml              |  4 +---
 ...sm-cross.docker => emsdk-wasm64-cross.docker} |  0
 tests/functional/aarch64/test_sbsaref.py         | 16 ++++++----------
 4 files changed, 7 insertions(+), 14 deletions(-)
 rename tests/docker/dockerfiles/{emsdk-wasm-cross.docker => emsdk-wasm64-cross.docker} (100%)

-- 
2.47.3


