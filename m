Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA73FCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 10:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8cVO-0004XD-Cj; Tue, 14 Oct 2025 06:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVG-0004PI-5m
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v8cVB-0003Wy-Pj
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:43:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3190655f8f.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760438605; x=1761043405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jil0Ama1zoQrZnPdRDjlJAWkmuZcYK/+OGYeLjiDqe0=;
 b=p154IGX5rhIDLDWv+CwtHRzGTgar/5m/1tLfCuoJmj8NFStWaVRNbw1efoHQTwJ2bE
 jrhsmONqH/XjckqIrOuXGwkEa5CWZFIZHJfznLNKQg8SaaMvs4LEO2793uJ/redep2Cp
 L7MSiYbotGRgUcqGwsXx4Z4DdqkNykvPQhfhCFL3S+Qf8gxvrofjOfEeuAfWBIyVFpck
 vCYQV3YCboWDRaJWN5L2VSA7N+WtKB9S/x4PaE4MM3XxtecuyL2wOw6fMe0ewvk+3yln
 FyMKBZn6kssaxq325OiCHdzJZ14yLzGB3dys9/G5+Yvd0OjD8iChFlo3tbwGYoU5KO76
 5EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760438605; x=1761043405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jil0Ama1zoQrZnPdRDjlJAWkmuZcYK/+OGYeLjiDqe0=;
 b=cgOdL9khLYuAqMIOFGn7Q7quBTiQ25Fhni5yza63UzxI+A9I//DJQKzqEeR5A4ZHtj
 snfyov3NQf5dpSBidnSozEI+1pBTNb4ygbX/liJNJTFwlpaiBHSghr9KD3symwObIW/s
 1DRnpKO93BLZmjsvE93EX+ynbr7vXZGwbOiZ615Dd1Hz/ko3jwlyZ2Z7Znm9ovLs17iX
 QyA9KDtFQR+m9xbOKW4rsfR7tNRdXw6WNNSwtLzuoce4u1nohsVUnkESWVC8sNFYA/Oj
 N+M+cvCu6BxjcW5rbF5JvSRiCjKi2BEIPaZE5Wn2P2CQh/5joFSryLi7VIZHN0kQEDMl
 Z06Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt8TEskNNXJ9aW/u9+HHTtu18yRnBYA0VS6wy/r9b0yq+vvJd97a5Jfmrtiwfyx6Os7yk9xu7d3Q==@nongnu.org
X-Gm-Message-State: AOJu0YxlUUuV6uMP7y6m38VDaqrB1K+VqUlicPv+hZINx9wEdhQoICcL
 Zi7v1U+utS7OmWY6ABM9nzuhQJFaC/w5x8b6nJ/mXgUZwkmmSiCtCLAHBsm7M2VskNQ=
X-Gm-Gg: ASbGncsSDmu6pCQ1ROe2Bgfg4Kyp0Ykkfbd6w2GmK6T+3zPJM49c3Eh/ySi1bN17RTE
 8K0jJMpjn9bSYPqDmIjrUuRAoUARRRJtbB8lqsBzA61YQiYmbDsgG+t4NJhplPxx56gCTb98Evr
 QRs8tBBbQDR7eihZqwbBKkg5mHHGUJEm7oU2t6SyKmAag463m6YFKL1aFA2aNk0oKKy3X568IC7
 9LInv8Wqv8fmXiMzpyQy20FIxidHt8M1SRnGYWsrlmEBopdfiQZwEZhwKwL77Utm3sM9NFTswff
 aI0BTI3H0LYJy5MqrmS+TXZHGA/gzTmo7SCamzpaOrSDIK2z3CQKZ+2VNwN6Z2Bb77zW45/Di1M
 rUb9Ol61AqK08ghfEIngw1DsoKfzvWQ1YkyADHz2GQIM/GZa+M56SokeY
X-Google-Smtp-Source: AGHT+IEapHYNwEsBeHKpfb8hNIa+UaI/5witG9DkXrRFY1Y8kMzrkmWlFHzupl/07WpZBNXGZEKkbQ==
X-Received: by 2002:a05:6000:40c8:b0:410:f600:c35e with SMTP id
 ffacd0b85a97d-425829b0561mr16342480f8f.8.1760438604816; 
 Tue, 14 Oct 2025 03:43:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce583424sm22685054f8f.21.2025.10.14.03.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5264A5F812;
 Tue, 14 Oct 2025 11:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-s390x@nongnu.org
Subject: [PATCH 0/5] testing/next - arm custom runner tweaks
Date: Tue, 14 Oct 2025 11:43:17 +0100
Message-ID: <20251014104323.3023714-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

This isn't quite ready yet as there is an in-flight MR for libvirt-ci
and the final patch has to manually drop a couple of packages which
don't cleanly install. I don't know if we should deal with that
upstream or in the lcitool metadata. For reference the two packages
are:

  libcurl4-gnutls-dev:armhf
  libglusterfs-dev:armhf

which I don't think are crucial to coverage. The main motivation was
to include the crypto libs so the block io tests don't fail.

However the the bulk of it works to:

  - improve utilisation of the new CI machines
  - remove hacks that get in the way of private test runners
  - fully drive ansible packages with lcitool
  - widen the testing of 32 bit Arm on the custom runner

Please review.

Alex.

Alex Bennée (5):
  tests/lcitool: bump to latest version and regenerate (!wait on
    upstream)
  gitlab: use template for ubuntu-24.04-aarch64 jobs
  gitlab: modernise the ubuntu24.04-aarch32 jobs
  scripts/setup: update the armhf overlay
  scripts/setup: update build-environment to use armhf yaml (!WIP)

 .../custom-runners/ubuntu-24.04-aarch32.yml   |  15 +-
 .../custom-runners/ubuntu-24.04-aarch64.yml   | 230 ++++++++----------
 scripts/ci/setup/ubuntu/build-environment.yml |  22 +-
 .../ci/setup/ubuntu/ubuntu-2404-aarch64.yaml  |   4 +-
 ...armhf-cross.yml => ubuntu-2404-armhf.yaml} |  67 +----
 .../ci/setup/ubuntu/ubuntu-2404-s390x.yaml    |   4 +-
 tests/docker/dockerfiles/alpine.docker        |  10 +-
 tests/docker/dockerfiles/centos9.docker       |  10 +-
 .../dockerfiles/debian-amd64-cross.docker     |  16 +-
 .../dockerfiles/debian-arm64-cross.docker     |  16 +-
 .../dockerfiles/debian-armhf-cross.docker     |  16 +-
 .../dockerfiles/debian-i686-cross.docker      |  16 +-
 .../dockerfiles/debian-mips64el-cross.docker  |  16 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  16 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |  16 +-
 .../dockerfiles/debian-riscv64-cross.docker   |  16 +-
 .../dockerfiles/debian-s390x-cross.docker     |  16 +-
 tests/docker/dockerfiles/debian.docker        |  10 +-
 .../dockerfiles/fedora-rust-nightly.docker    |  10 +-
 .../dockerfiles/fedora-win64-cross.docker     |  14 +-
 tests/docker/dockerfiles/fedora.docker        |  10 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  10 +-
 tests/docker/dockerfiles/ubuntu2204.docker    |  10 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  11 +
 25 files changed, 259 insertions(+), 324 deletions(-)
 rename scripts/ci/setup/ubuntu/{ubuntu-2204-armhf-cross.yml => ubuntu-2404-armhf.yaml} (63%)

-- 
2.47.3


