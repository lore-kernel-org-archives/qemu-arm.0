Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D7606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mcdi6o0p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt1Q-0000hh-2j; Mon, 19 Oct 2026 15:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0x-0000SW-3b
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0q-00033o-Db
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48c4be28b82so1901288f8f.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438030; x=1793042830; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3o+Btf39R989kvm/VWlrprxcKrBtRJRhTAk2pUmeGhI=;
 b=mcdi6o0pKT2/o0oAyCeNFhNF1rKyfWVCRRhB1b4AorQon8g7jShb64A0N/IRrSik6E
 2Hi7JNtcCW7skIBuTS5b0rCbHIBRkoXgVTlQlEa++Z07X6S7eW8/qZRUFnGVrAabmWOf
 jKxgNVwaGzAQMTwEMY6MV61eaRpYqbjlf5sraZTZTuOtWjqOROiir/AatNdnBjDisENq
 iPb9ppMzs0M+En2zkuxepTKszyTA4HMlSkoqHqVvGmRKGlTgiY+TRsXPFuC4KbOGps05
 Rp4wxmQD/jgYuvh+lucrQAAtT3RO6rQ1KIcKqD6h4nN4j7WgCzqIxsfitD1GqWa30GX3
 paTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438030; x=1793042830;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3o+Btf39R989kvm/VWlrprxcKrBtRJRhTAk2pUmeGhI=;
 b=JDhscCdz1hAGIOK6+WBzqSSH9AcXSGmituRFbPbrxbF4WjDl1v3xi6+JvlgC+Vm6xG
 yK9PMx5tfguLknFfQZMiqS3rjOOWcQDWdOGLPEO+0C4wNo3VN3hL3ZVROrDhp8LaCReH
 XNxBS5j1RMMWwyvslLvqeKTQcB2Z++vAUh6cGBIwaTuk44/xSp2XbUYD8aYkwfUPZSJd
 fmh3cI7015rq7uoyqg64PBQukta6e+HoJcocQsaHc0ISLkY8LFZPzJrChSroX1OwYC3s
 K9AWetLSGULwsZ7zJf8CoCX94g3PBWX0Bipu8rlXFV5Ei1j2TYEz6nvvbppPnPrX7jBk
 hDqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBybw5nB4UhmEww+kYTMS00WJUjPXXxyNyxQe5c3iyH8py63+CiNMcmJc19bZY1l9p0qhQld7hH+xw==@nongnu.org
X-Gm-Message-State: AFq9FYKexManbNCi49ySR9wzn+ZbRKgsoY91MlW30CszYZWXSMhfTi1F
 wvbs5sGwwROxXSwhg9wQYo5WDRC7H/G1IFKcFXsSSEKDlfMx0N+uWEeSO/iSSB03Cqg=
X-Gm-Gg: AYBFou0N5x4FbWdlZogSvrFzzb+x8R1MMyNVqT3x4zeIfQgjCvAULvfJ4Roe+7zUNMq
 6iVYVednVG1iFMf03VxQU/8SXCNou+vOhx6THYsNQ1/jj9R6dPch8SRCA7flcVlZERtsDmv/M+h
 Lu89IJolxWaUi4RwHbeNKs5Q8bbInCWIFB18omvTNuzvE3xFERrbWx/FY2THu4tc/4uRl+0DwKd
 1dyCfFIBSnLRPMrsIK/bPFgH4pxs/u1WUCKUXlvEmIMXBJYDZjKe/NJSTXezbkSX2BCpYkMSnKA
 DWLpL6AoVquZfrdCXnYqUaFBMXeNK/8yHtiMGhPCDDLTAAuoXiEgoziEcMTzn16Y8bGH2S/UE5M
 2t8+eOqxswHJVi4/ByRYfb2B7oJVqbIXDFJP6Kb8zJvT3YCjx+CIIZUdJfbGuKYvlCjdcpDUpJc
 Rdoqq7bP7R5NnzWnslxdBO9kQAj650T7Da06142ZS+HSlKv3vm/Nq6trtwKct3X9RedsPeRw==
X-Received: by 2002:a5d:4b8c:0:b0:48e:38e:3102 with SMTP id
 ffacd0b85a97d-48e07f9bdfamr12895951f8f.29.1792438030394; 
 Mon, 19 Oct 2026 12:27:10 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d80f9dbsm810525f8f.19.2026.10.19.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0305B5F82D;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 00/19] testing/next: functional testing updates for gdb
 (pre-PR)
Date: Mon, 19 Oct 2026 20:26:45 +0100
Message-ID: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is the current state of my testing/next tree. There a are a few
minor tweaks and fixes that I've picked up. The majority of the new
code adds testing for the gdb stub when used via KVM.

As a result I spoke to Anders who handles the tuxrun images and he was
able to turn on debugging symbols and provide a vmlinux alongside the
bootable image. With these updates I was able to resurrect the old
test script I was running by hand and then plumb it into a functional
test.

So far I've done x86_64, aarch64 and s390x. I can't test ppc because
our CI machines don't support nested KVM. I don't have access to any
riscv kvm capable hardware.

The reason I went on the side-quest is because when working on
cleaning up QEMU's internal KVM api I realised that quite a large
chunk of it is not exercised by our functional tests. This would
ensure that at least:

  kvm_arch_update_guest_debug
  kvm_arch_get_registers
  kvm_arch_set_registers

is exercised and I'm less likely to break things in my re-factor ;-)

v3
  - address review comments
  - convert run-test to use arrays for gdb and qemu cmd lines
  - fix errors on s390x and aarch64 hosts

v2

  - fixed up the sh4 direct call
  - dropped the fw tracing test case as tuxrun images cover it all
  - added aarch64 and s390x cases
  - worked around s390x watchpoint issues

The following still need review:

  tests/functional: teach tuxrun about launching gdb tests
  tests/guest-debug: convert cmd to an qemu_cmd array
  tests/guest-debug: convert gdb_cmd to an array

Alex.

Alex Bennée (18):
  tests/functional: test_acpi_bits requires TCG
  .dir-locals: include QEMU code in PYTHONPATH
  meson: move gdb detection into the top level build file
  tests/functional: allow tuxrun tests to be passed "accel"
  tests/functional: split x86_64 tuxrun into tcg and kvm run
  tests/functional: update x86_64 tuxrun images
  tests/guest-debug: convert gdb_cmd to an array
  tests/guest-debug: convert cmd to an qemu_cmd array
  tests/guest-debug: add --kargs option to run-test
  tests/guest-debug: add --symbols option to run-test
  tests/functional: teach tuxrun about launching gdb tests
  tests/functional: add tuxrun kvm gdb test for x86_64
  tests/functional: split aarch64 tuxrun into tcg and kvm run
  tests/functional: update arm64 tuxrun images
  tests/functional: add tuxrun kvm gdb test for arm64
  tests/functional: split s390x tuxrun into tcg and kvm run
  tests/functional: update s390x tuxrun images
  tests/functional: add tuxrun kvm gdb test for s390x

Max Filippov (1):
  tests/tcg: fix buffer overflow in multiarch/linux/linux-sigrtminmax

 meson.build                                   |  15 +-
 tests/tcg/multiarch/linux/linux-sigrtminmax.c |   2 +-
 .dir-locals.el                                |   8 +-
 tests/functional/aarch64/test_tuxrun.py       |  35 +++-
 .../functional/gdb-scripts/kernel_gdb_test.py | 164 ++++++++++++++++++
 tests/functional/meson.build                  |   5 +-
 tests/functional/qemu_test/tuxruntest.py      | 108 ++++++++++--
 tests/functional/s390x/test_tuxrun.py         |  37 +++-
 tests/functional/sh4/test_tuxrun.py           |   6 +-
 tests/functional/x86_64/test_acpi_bits.py     |   3 +
 tests/functional/x86_64/test_tuxrun.py        |  45 ++++-
 tests/guest-debug/run-test.py                 |  83 ++++++---
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/tcg/meson.build                         |   5 -
 14 files changed, 444 insertions(+), 74 deletions(-)
 create mode 100644 tests/functional/gdb-scripts/kernel_gdb_test.py

-- 
2.47.3


