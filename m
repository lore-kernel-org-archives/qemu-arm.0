Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A418EDF173
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPr-0001tf-RC; Fri, 13 Feb 2026 10:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPo-0001qm-UX
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:08 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPl-0007wm-Kc
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:08 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-65a1b17a99aso1908347a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997744; x=1771602544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxsuxdaSfuvmviENh9G98WFpXuHJOPaxQR6wxO3M1Bc=;
 b=vjVXaFPUoeVnH1rWr7J8WrPskdVIUjixgG/rYxTo6GwEhdlIqanBtPmrdZcHrI2RB5
 9YO0Bj9Df9fhp8Y1n8nKqqitCsz30VBzJ7iGfR7vtZf70DBWixXSAzwuS2/UDYiTb6P7
 h16Mp0Qn0K3c0K5BGZzEcWTaMpqoJ15zANh9Qy40CO9q/co6ur8wrLWczUyM8wgyfzAo
 C6iFoBeItcIVpPg9U3Ey4H3hmzQ5aXEhjnuDCnGC6rBhgz/HYgMA0iiDHlQzPClrn3GK
 Pxwy/fk05Nr4tJ6QEB+rsOhydSrLVkxqtsL9UVeDpnMNu+vhF6xvjNiweHMezvYqGKHc
 w4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997744; x=1771602544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QxsuxdaSfuvmviENh9G98WFpXuHJOPaxQR6wxO3M1Bc=;
 b=YHwIP8IJQ7guLQ14Qjvg0p5OE6rwDgYzA7kIgibQ9s7T2HcumsDIuaXh5ch/h+FfVW
 dDPjnwai7LDXt5hTbljWrt9whi5B+eyNLfd24ChAyZCYZpecglVP7ZJPYMVAhTKp5nVN
 YQKgwfxlA9S7p8HdF9ehSJ33jNsXQNXomaq1kS2F7OMkzeis0asMxDIq9jY0wTrZcRCx
 FiCdBq4R8rE5PoZR81twhwY/IVb5qKSAJlpmJqaaPv9EZCNnBarnz5qkSIG1Ce929hUZ
 Q95ntA5sglRvuSMuGN88VRge6RoBm+UW1yoXoxe9ROoqqTMf7pbOThnwf/A5nSqlmN2U
 xNsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC6ewTGMQWdnjpwWTv4hxptlh08xMQ11nJ0vXJTP5WSU0YFAX9v44cjzFH+9BEvkqQbhixeiwraA==@nongnu.org
X-Gm-Message-State: AOJu0YxH1xKj7ZUiJcwnOIs16O3itJv8GILazIT6SZv4JCDrT5oAffBN
 eD1vAqj9Vr+CuxOy+EsUGwv76tqbihcR2YPwTrHhAubmy33Os4y3khZ+2EkhvJVIg2A=
X-Gm-Gg: AZuq6aJ0XhV8eIve3sDQbKSBZxfuLdpVzoJohGYaQQuxC7RN9fmSsbcJDSwxTC5MOIb
 DIOj75nYvB8TasyNVAZda9rSgVVIQBUuKuEOJL1wd/fqZeQ+1mb3X0hqRT947azUCx3XhbcY+vR
 gbTXUCl65JFvr40i+VET29bab3+E96xY5axoxlQkUW1w8lrpUXREDXS3sf5LypI+rFbNgpf15yh
 jyLgIKiGSWYCVhzjx5a/xGGmLA9Mr/cjncundcLepZ/yiofLpBuB/Gk7sUe9kaxC1vBOXOKa0Wh
 1nh7n+4/Rvmc7trnNwD7rT/u3fWgvn6qtw8+wacvqsf3Nd3lDDrjC+7N8GJLRCxOkZy3af6VCbB
 A5s1Ns3R0+KdRxg8DFut8vpKMBw78228LFvFLv8lOX0HxI5w9k2NmDgdCz6MTRfr7vPZAh/2vaN
 XbISn6jsnV3+UC4VGwMq/c6fQ=
X-Received: by 2002:a05:6402:278b:b0:65a:409c:6fe6 with SMTP id
 4fb4d7f45d1cf-65bb1161199mr1339982a12.15.1770997743824; 
 Fri, 13 Feb 2026 07:49:03 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3e39bfsm768387a12.22.2026.02.13.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:01 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CD5675F818;
 Fri, 13 Feb 2026 15:48:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 0/6] testing/next: libvirt-ci,
 tests/vm and vbsa functional test
Date: Fri, 13 Feb 2026 15:48:53 +0000
Message-ID: <20260213154859.1551283-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

While I was looking at Jon's python patches I noticed some failures
with getting OpenBSD up and running. In pulling that thread I found a
few other bits to fix and up revved the image and converted it to use
lci-tool data like FreeBSD does.

I've also added the VBSA conformance test for Arm virt machines to the
functional tests. This just adds the UEFI based tests as the full
suite needs kernel modules and a userspace app which I think I have to
build.

Alex.

Alex Bennée (6):
  tests: bump libvirt-ci to latest state
  tests/vm: bump OpenBSD to the current 7.8 release
  tests/vm: remove unused import
  tests/vm: fix interactive boot
  tests/vm: build openbsd from lcitool data (!567)
  tests/functional: add Arm VBSA uefi conformance test

 tests/docker/dockerfiles/alpine.docker        |   4 +-
 tests/docker/dockerfiles/centos9.docker       | 240 ++++++++--------
 .../dockerfiles/fedora-rust-nightly.docker    | 262 +++++++++---------
 .../dockerfiles/fedora-win64-cross.docker     | 162 +++++------
 tests/docker/dockerfiles/fedora.docker        | 262 +++++++++---------
 tests/functional/aarch64/meson.build          |   1 +
 tests/functional/aarch64/test_virt_vbsa.py    |  99 +++++++
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  13 +-
 tests/vm/Makefile.include                     |   2 +-
 tests/vm/generated/openbsd.json               |  27 ++
 tests/vm/openbsd                              |  44 +--
 12 files changed, 605 insertions(+), 513 deletions(-)
 create mode 100755 tests/functional/aarch64/test_virt_vbsa.py
 create mode 100644 tests/vm/generated/openbsd.json

-- 
2.47.3


