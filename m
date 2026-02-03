Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BF6E7FDCF
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:53:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnEx2-0007vD-Nk; Tue, 03 Feb 2026 06:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx0-0007tq-H2
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEwv-00057v-VP
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:09 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b8710c9cddbso697879166b.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770119524; x=1770724324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mcHIevmey8ZqNfQ6gP0WEtZgKQi8/gD+jh4jh1+99to=;
 b=TAu9WaAn42Zbci1SNFGz5J/+Iskvhokd7J4kIdbSaPDfPcyCTvb5AnFXl1DazxY4aX
 TOXJY/lXI0khS1Oi/9/kcKqLyf2/zoDdAd/chG5rIhhXgLoh78jzvKg5+PYLToylMEFd
 ng6J8YsV/YFbsvDaJVMd4BgslxBwRPOEpYgxuBEdp5YGqMpiU474e4VLDDonweztxNrX
 THfmfZNKOhvI3+wFMqpG7ICf2vemyARfG09wNYNOAf95Y3gdUVKcZkorPKVcfcB2YnaW
 WGj7A8vojZK+aNYzPtMlppJTg/jyjfnoKhNY28rY0p97Zj7Pk0caMSDbhoOadg42sxrq
 yXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770119524; x=1770724324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcHIevmey8ZqNfQ6gP0WEtZgKQi8/gD+jh4jh1+99to=;
 b=BxgALHq2Y9FP83ia3U0NkpuF4L09IB/xHCoW8oGlD6EDNpjd0r+AlymE8xXVF05bXR
 y+rUOHoOtd9ihQGWTOW20vhLAcAKF2OKQbniAI+9UbUWeU2rOZzM+b+jaycu1jLVyg5k
 iKHNaZ3hvWgdRLfEtc76Ike4wv8A5snaqQevyw0XcsRrztY7n9RX47t+C+/sfODwXzmo
 f4DM1cFhV46AW9sIFVeJCCm7+8srqPWYpTDkfRnL2NUn0l/hmDChlQYC/PR9mtuSHkCA
 sSrivMZDnUvvRGV0a5mIREjxa2KuL7s5H7PZvJfBBbohu9ro1LNlmyaCwmR+Zh+I4BDc
 qEVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXph3F0ltxxUA2ZbdjRZSQceISfW9MzCfHP5ICl7wjKuwkhf4OIjVZkPkAxyKPyImeIi1e4O+5d2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwdkJl0RdSeBW5dknrNnfw6d/DXGv9HWE5/2jBpCBkAydc5MdCy
 dVSMeFBzMVHRz1H5i9yCJmIbUttVb1EGaUok6XEXuCm3qysvFvZQbJ1ILQqLkxZo7ls=
X-Gm-Gg: AZuq6aLzq8mNR0SqYp/Nyo08rdUuOh4wygZh7Vl/c3NuXawMTLMbCyvD1XSp5NeWyxy
 ZHrMq331ZymWEGipdLd6ZDtQieibr226oQXjetnOEfAOdU9UQKj7xs2MhdCVtCGHbeGDYC/cNCU
 7/b7EKnw+gBQP2L9V2kP9tIv29bTFZgCfOLLdxdUNWMipmRoVS7pEFgY/gaS/I4k81wHTA/uUwq
 lRDUZ/xM15nvmVe26X5sk+PB/juxbXjFXG4tqkrT/J6C5anqRm2jqp4MiSVzdMK6GS6Tokp2jxz
 skxLk6I++XPXdUBsxmx6Hbat8zrncps4mu2daA8D7hu9TGv2aaTlSsonZQ5Dq3ieK+OA7apTauf
 CbHFXHS9vtwqmvNMn043td3LUWcgS3WDTkkjH+GKD9FL/E2OtNpM+DxJid7qtbQamlPTFUNnRi/
 T8ho+L5AgoeIg=
X-Received: by 2002:a17:907:97c6:b0:b88:5385:59d7 with SMTP id
 a640c23a62f3a-b8dff5e9051mr939869466b.4.1770119524428; 
 Tue, 03 Feb 2026 03:52:04 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8de289bdf4sm887869766b.44.2026.02.03.03.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 03:52:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D82A5F841;
 Tue, 03 Feb 2026 11:52:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 00/11] gdbstub/next - bug fixes and cleanups (pre-PR)
Date: Tue,  3 Feb 2026 11:51:50 +0000
Message-ID: <20260203115201.2387721-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Flushing my queue for gdbstub/next and I'll roll a PR by the end of
the week to get the bug fixes in. The other re-factoring patches are
towards a longer term goal of supporting more stop packet reply types
but aren't critical to merge save reducing the delta. I won't include
them in the PR unless reviewed:

  gdbstub/user: rename and use bool for running_state
  include/gdbstub: fix typo
  gdbstub: pass GString to gdb_build_stop_packet
  gdbstub/user: localise variables for reading gdb socket
  gdbstub: extract stop reply message construction
  gdbstub: remove the need for goto cleanup

Alex.

Alex Bennée (8):
  meson-buildoptions: Remove duplicated entry of --gdb in the help text
  Makefile: add python script dependency for meson-buildoptions.sh
  gdbstub: remove the need for goto cleanup
  gdbstub: extract stop reply message construction
  gdbstub/user: localise variables for reading gdb socket
  gdbstub: pass GString to gdb_build_stop_packet
  include/gdbstub: fix typo
  gdbstub/user: rename and use bool for running_state

Yodel Eldar (3):
  include/gdbstub/syscalls: Add EIO and ENOSYS GDB File-I/O errno values
  gdbstub: Export host_to_gdb_errno File-I/O helper function
  gdbstub/user-target: Convert host errno to GDB File-I/O errno

 Makefile                      |  2 +-
 gdbstub/internals.h           | 10 ++++++++
 include/gdbstub/commands.h    |  2 +-
 include/gdbstub/syscalls.h    | 11 +++++++++
 gdbstub/gdbstub.c             | 45 +++++++++++++++--------------------
 gdbstub/syscalls.c            | 36 ++++++++++++++++++++++++++++
 gdbstub/system.c              | 11 +++++++++
 gdbstub/user-target.c         | 13 ++++++----
 gdbstub/user.c                | 40 ++++++++++++++++++++-----------
 target/m68k/m68k-semi.c       | 29 ----------------------
 scripts/meson-buildoptions.py |  9 ++++++-
 scripts/meson-buildoptions.sh |  1 -
 12 files changed, 132 insertions(+), 77 deletions(-)

-- 
2.47.3


