Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F847CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:12:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40LZ-0007yY-8i; Wed, 01 Oct 2025 13:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40LT-0007v0-2z
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40L5-00034i-7E
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so245075e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759338591; x=1759943391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0komx1VDBWrWu3LJvaJHmjHm69UbO44yc+hkmHvjlM=;
 b=cOMKT2jK8kEDxuQNF8KrMPXmkgIBcS97kxNR0EtckY/ezAiu/DC+32Lj7oaNEbb898
 IOiUOOiQoGPjdteKBAn0FT2FPKw3G58gewjbSmF73w1Q6zXM3rVxDVah3XK2Dw5tgtkl
 M8RyMsoSXCwn2UMf2SkZYJcUTmp68G8Xng8ysvhE3JrUJY6fmtk10fEXKk8BVrNSD7b1
 2XZYEm+J5eqIKohXs6Rk1MUUh0i4q363adKQnqXKy87jSzphoTJsmiich4e9mj0AQFgM
 QjyHfLYehrTVXtcyApMSoduJTBpkb9YT+Wl9b1qedvgdYAse6czN6fRd+IdA+1yrS2J+
 pXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759338591; x=1759943391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0komx1VDBWrWu3LJvaJHmjHm69UbO44yc+hkmHvjlM=;
 b=tuQnMztfDewZwib3o+NDMeWf/XQwRVFd+8hUzlNBbSrXz28fFruxR3arI4QhG9ZWti
 sT+aqF3f0SxWieTHXaT3iq/WJufKiLaA6UYZEfp6PoNbFFR56fsfHae+OWSUGQZ6WVKB
 Lcde2VYEi6ovH6vB80TZMMNddFIaKUAjMeBjdE0vxwbj5okgTSGXW9PsRq66aCNrplBx
 CZRjsbBfuopssN4aK614NNaOqS6DSXWc7vGF2gPLX4sG4jLJSYpaT3Fcf21WnhtwWVT3
 2fUGyl/z+UJoW3E/k3BjVX/n1Q7q6JxiXCAISbh9ODAt4tMttySbgN5vlDLtY7xkD31S
 y1PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBCfi9Lx3LbNx3uRqx5zQcKHoWfv+vF0ZRAwgHJjw3DW/CtxAPs9LgoMbIIEgtd3GkESpf/4tSwg==@nongnu.org
X-Gm-Message-State: AOJu0YwCsfRCZh+GD9k3Yaa/QDf1Rpd+XjtA3VDoVlJtRWPqegJP8ouy
 wODuntQCIJFMIDmM4MN6RJMgDucJDyP9nNrBiZRQIjtd4L2TBMuVsXL3F5la7/C4TMY=
X-Gm-Gg: ASbGncu270XxTJY+G0rutyy+eZiznYO5S0NFC8hJzaU8Y1hjIbwqdALbjW9xPXSWTxa
 p58kq/teuF0kXAYmW0xGxnrjEisZ4dCsLhWj4smT3fnbR6L52iKejKsxhx+sA4ib/PRk28CXx5p
 lWhVsR7/8nP7Dd2jpu60NoXfiniaPgv71er27w+zLd8ogep2ffIY/2NlCx78XG2NpnjrM0DKadM
 /mLJWOqJu4Oi4VYC05umzDPb/z8b1U3GCm+WwlgnxQmOVjr2GwR4Pym+7JbAePEzJDeQq3kfgAh
 ApROmKpHJSYNEXMAgS0+u+pXTVXYZr1Lf79K5Ti622FNtakbxtgj+a91ds+igFaqlwZ4/n1iM/H
 bbL/vIbW+okqQIvlHlFANj78gCzWj/iQaADoC3AAUaaD9kPo=
X-Google-Smtp-Source: AGHT+IGMRI2qKBkPU+whpXopZ+psRkGnjoRCdoFZYnMRQ+KUenYoRbx40Ita3ZI2Vqjvt5ik6fa75w==
X-Received: by 2002:a05:600c:8b65:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-46e6127cccfmr36402925e9.10.1759338590990; 
 Wed, 01 Oct 2025 10:09:50 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602eccsm29529984f8f.40.2025.10.01.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:09:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7ACD05F7A7;
 Wed, 01 Oct 2025 18:09:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/7] testing and misc updates (docker, ansible, .git*, gitlab)
Date: Wed,  1 Oct 2025 18:09:40 +0100
Message-ID: <20251001170947.2769296-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

My first set of patches for the development tree. Should be mostly
self-explanatory. We still need to apply the upstream COPYING patch
the u-boot-sam460ex code but we should decide if its worth mirroring
or should we just treat the copy as fully "ours".

Hopefully I'll have the new aarch64 runner online by Friday and ready
for the switchover.

Hopefully I'll also be able to pick up Gustavo's reverse debug test
fixes by then as well.

Alex.

Alex Bennée (7):
  .gitpublish: use origin/master as default base
  .gitmodules: restore qemu-project mirror of u-boot
  .gitmodules: restore qemu-project mirror of u-boot-sam460ex
  tests/lcitool: drop 64 bit guests from i686 cross build
  tests/lcitool: bump custom runner packages to Ubuntu 24.04
  gitlab: move custom runners to Ubuntu 24.04
  scripts/ci: use recommended registration command

 .gitlab-ci.d/custom-runners.yml               |  6 ++--
 ...4-aarch32.yml => ubuntu-24.04-aarch32.yml} |  8 ++---
 ...4-aarch64.yml => ubuntu-24.04-aarch64.yml} | 32 +++++++++----------
 ...22.04-s390x.yml => ubuntu-24.04-s390x.yml} | 28 ++++++++--------
 .gitmodules                                   |  6 ++--
 .gitpublish                                   | 16 +++++-----
 scripts/ci/setup/gitlab-runner.yml            | 12 ++-----
 scripts/ci/setup/ubuntu/build-environment.yml | 12 +++----
 ...-aarch64.yaml => ubuntu-2404-aarch64.yaml} |  4 ++-
 ...2204-s390x.yaml => ubuntu-2404-s390x.yaml} |  4 ++-
 scripts/ci/setup/vars.yml.template            |  5 +--
 .../dockerfiles/debian-i686-cross.docker      |  2 +-
 tests/lcitool/refresh                         |  6 ++--
 13 files changed, 69 insertions(+), 72 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch32.yml => ubuntu-24.04-aarch32.yml} (78%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch64.yml => ubuntu-24.04-aarch64.yml} (89%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-s390x.yml => ubuntu-24.04-s390x.yml} (88%)
 rename scripts/ci/setup/ubuntu/{ubuntu-2204-aarch64.yaml => ubuntu-2404-aarch64.yaml} (96%)
 rename scripts/ci/setup/ubuntu/{ubuntu-2204-s390x.yaml => ubuntu-2404-s390x.yaml} (96%)

-- 
2.47.3


