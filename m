Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B20CA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:04:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJRi-0005KW-4p; Mon, 12 Oct 2026 13:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRL-0005CT-9K
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:03:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRH-00075m-TW
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:03:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48c6955a7c3so464602f8f.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824629; x=1792429429; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZBeoqsuLlvT9DZ1W3YVZQU/yAZaDmhpUannbrhcqvH4=;
 b=lhwj0WQJZibAg3uXUxOrxWLFylJe2oajaCkKFlo5d3J+B6CylhHmdC4jATzgnxmaDB
 Y4EbYKzt3Ho0+/aJIzKntyuua+KuJvIS0+6nxT34dCxJf7AVlAUZrziVm+Uqh2l7W10L
 ZCXjTzuLE4PAWMMSzu73s6q5oPeTp+eZvb781NEewIz6JMK310akyEx0IkEljAvJNNF/
 /KrGAOeqvsLjTbHPdz7b4PIK6Qm0gJQf0KoLl2eodiqIdtpa6JnOa03mWTiabMqmE8cU
 2uFEyFc8/VP087OAwVhFe+4DCvfkQav8oaBDwobokcLxY20+9z83PUAd6nkhpCNKeLSG
 encQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824629; x=1792429429;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZBeoqsuLlvT9DZ1W3YVZQU/yAZaDmhpUannbrhcqvH4=;
 b=pY7BO6eTjymCdCHIedGZtI0l2tHBw19+0qwo3yvhZWrhSj+3A0KmpM+ApAdLQfx21x
 697GMs9cPvxHmJ6xhSi54kjtbc1TqJngMbLpf7TNCFY3GU8wm+0NtlcpyxWAuIWX4MSi
 O5xeGBxwtqVxtyHWAZZtvy2OSYCCSRiS6BQqX8hFgfio3/PnVkGz1r/oYvHBKAwj02WN
 afxwJNCqSACPTIEJdMIy1/dc9+2wnsc3QceX4yf/yPBzn5IO2d2nRZETptZjiYL9d9eE
 5ajfUf7/hdINQh89YzH6dYquG2ww8OX4Z1zsuEazulnXDG6ItX48B7qexTCe8rhmsWAt
 Jb8A==
X-Forwarded-Encrypted: i=1;
 AKwUvByH9RXvNzRspEpORR1xnWihrGuXCiUw20ktor08LTcLku8qM3wMlzvAiaxVowyNwQmQauGevDPYhQ==@nongnu.org
X-Gm-Message-State: AFq9FYI0QRjbfXLNdwdRrW05xZAguaY737ztYka5thtDPCoGd2JPh91+
 kkJgwF3v+vPnWyy685Vrij2fjQmsx3ELzKJy6SLusFCRI0j1bDN8oudfWQfxfO52nSQ=
X-Gm-Gg: AYBFou0k5HhXwgrZE6zxNprEcCx3sXVVvaxnDQlvsg5GGH11dFhUUmeXS1WjTKroYtK
 fGpJUFjs7pS7kjvT1r81R3T8owHpEXleLhFTpdUZHmxDZpHCG1a5k57fL7n4BXwnUqz7aNDncvj
 jmoG83WEWWRTG0/+YcHDeLHB69L0piV1/RwLCr7KOhilRgRUKvZI1blrlSySKrbd8fY5MnxbGYk
 gV7Nr+vpboI2EgSS/q8Qtvp1NBxc4DqniLDE4a6LzyRWFANNKNyeJxXU1LEpH/iJQvXlFxYqHJj
 zBHuf+kixntSCMmp9Nr0447Zk5NQZPh/q116Cf6Aajz5fpTGrO/UGZo+7J/1st13uOlKzVpmbZA
 8C81ym+7Wj0mUBso/HDYNyndiBP7QR4wXRtJYSEoXUB/js9fXVtmWZJpSifRiIT+t6a5Ji/S0RX
 b8gPhNxxYpGfiOQNjC9lgdTmUNNlKuidYjccCMAmvl169ElHz5056TbXaY+sKSig5ai7mDcfnTQ
 bnY8o1m
X-Received: by 2002:adf:e185:0:b0:48b:3f2:2ec7 with SMTP id
 ffacd0b85a97d-48dbacfe69cmr19116879f8f.31.1791824629276; 
 Mon, 12 Oct 2026 10:03:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab5b03sm474700f8f.30.2026.10.12.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:33 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 075FF5F808;
 Mon, 12 Oct 2026 18:03:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 00/16] testing/next: functional testing updates for gdb
Date: Mon, 12 Oct 2026 18:03:14 +0100
Message-ID: <20261012170330.1144446-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

v2

  - fixed up the sh4 direct call
  - dropped the fw tracing test case as tuxrun images cover it all
  - added aarch64 and s390x cases
  - worked around s390x watchpoint issues

The following still need review:

  tests/functional: add tuxrun kvm gdb test for s390x
  tests/functional: update s390x tuxrun images
  tests/functional: split s390x tuxrun into tcg and kvm run
  tests/functional: add tuxrun kvm gdb test for arm64
  tests/functional: update arm64 tuxrun images
  tests/functional: teach tuxrun about launching gdb tests
  tests/functional: allow tuxrun tests to be passed "accel"

Alex.

Alex Bennée (15):
  tests/functional: test_acpi_bits requires TCG
  meson: move gdb detection into the top level build file
  tests/functional: allow tuxrun tests to be passed "accel"
  tests/functional: split x86_64 tuxrun into tcg and kvm run
  tests/functional: update x86_64 tuxrun images
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
 tests/functional/aarch64/test_tuxrun.py       |  35 +++-
 .../functional/gdb-scripts/kernel_gdb_test.py | 176 ++++++++++++++++++
 tests/functional/meson.build                  |   5 +-
 tests/functional/qemu_test/tuxruntest.py      | 103 +++++++++-
 tests/functional/s390x/test_tuxrun.py         |  33 +++-
 tests/functional/sh4/test_tuxrun.py           |   2 +-
 tests/functional/x86_64/test_acpi_bits.py     |   3 +
 tests/functional/x86_64/test_tuxrun.py        |  45 ++++-
 tests/guest-debug/run-test.py                 |  10 +
 tests/tcg/meson.build                         |   5 -
 12 files changed, 391 insertions(+), 43 deletions(-)
 create mode 100644 tests/functional/gdb-scripts/kernel_gdb_test.py

-- 
2.47.3


