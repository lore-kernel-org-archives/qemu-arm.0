Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CC7C5DF6D
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 09:23:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwcV6-0007ng-0T; Wed, 19 Aug 2026 05:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV2-0007jO-UK
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV0-0001vE-4H
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso7809295e9.3
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787131336; x=1787736136; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4geHRkjj8d8oUE/IydElNtCaW5PNUS2wC32OKCgUJDw=;
 b=AWq5CSvFDyFzBbhF344lU0LGnZdLkHyYK2gmvAYN5gr7z3wPQslaj9yf9vwT7MPAfe
 eZEITgrpY9tjEYpl7RXoU2zm8p5k6NpX6kNx5pvW6yBXZrfKde7/ny0r43ZdFSpHXXDd
 fguVmBJrfAWPSMGlEFjVrMLk0BQ1X3sXl8nPXisrBLzvM0MezcKDIakwNIwAnvxi41d1
 d6aNg5ixj3VZc36JGQX7tpOOgKB2IJa/LWkFTYei1Woc1WibOqE9Jb2SPNNqNiWhMl8f
 bnET+fZEW0yZQ4eh96xEQuNJqDX7edC2SWq2APapvc+5H5J3c3G0p92NRJdIvb4JsmMX
 dwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787131336; x=1787736136;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4geHRkjj8d8oUE/IydElNtCaW5PNUS2wC32OKCgUJDw=;
 b=k3YqQ60e5MdijPKE40fe72iqO8QxEG5u3NnUjsUgOIDFcgZoNRl+YaCoDnIYoEhwJp
 4YqCqKslEPIS4rp9INoy6EQPlm+pJPgjCwlQZizuCHiy9b4w4WTw8MlQx2/Lv7Pelfb2
 gz/F7p+RAE0pK8yedguPoddP9bOLkUB0QHhcz2dp1+iiiY8bB/Qw7r3ZWcvSQELmnWGJ
 S6qCnJo1SCHS9ukznutfrvpH09DkWR3vStbI5ZDytYffZ0cIq89DfuXFxqMcOUVH2jtw
 L+7cBo885Y9d66nH05htb4+1U4eJOhyAKcMiTf5xyh4p+0XJVldNiwHF3gjnmXxRWNrn
 OtSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpjs3bVYJzVQFbmOPqMJqe/d3nBVCZFgf1TRQD4oDkDJ75mBrk630vJuFrkPK2BmBdkhbnahAWQ2g==@nongnu.org
X-Gm-Message-State: AOJu0Yxc2kDC8Mpxb7JDw0dCgYlotCoaXQOnIlS9m0mTJRsJdqaVkgHN
 Qefiew+Iy8+i7Bcn49wqmPIx4cxSU322yj7IzN2cwfUSLe98xRr7A6E5572oi8KiQto=
X-Gm-Gg: AR+sD13nIl+QNM50v6ytOdtY5vc342ynENP8LcOLRsORh9iaB9/XYWkafJQhxgxBAPA
 lNb8SxgMn02OYSLNjo4mQkkd9hUQAw0XYE1JQ8rtLSTFo5yWmUTIHoWF1HPPOTuQ601CGdYm3cy
 BpYZd355Ys8W9RtvGwSA+g/QGr4JCCsW/a2vm7+4LGoSAsWlt3pPVMJkaN+zBpAtWc6tlEJdLzh
 DwSivU8SKfP0UXn1VYYIp1aGQwFxpIqbdqpsOM5lf/MmAy/opMcOjM3y8KI0tK4eHRjCW7rWSBZ
 5CLQQUjLl80pKg8tmy9yuxTjZGvbFF0j3ET4Ee5WKjMd/P77nAuNOqnJQh/BEuV4kOHTLuLj/iG
 WfmJafrLBw4g7HWt9nLIYyr066lxrFxflHLw6jLlA8ryL2LUGm3Kqk36gjt9iix81BXxPcookfO
 YMbIqTXkWy2fZ8sTZmMl5xNteA5uZnAzbzuUPq0zwLp3fyewyFRI+JScTfNWLP
X-Received: by 2002:a05:600c:4e04:b0:499:8ed2:8234 with SMTP id
 5b1f17b1804b1-499aa0e221fmr71275625e9.0.1787131336089; 
 Wed, 19 Aug 2026 02:22:16 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa09b199sm41824835e9.0.2026.08.19.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 02:22:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5C5A75F805;
 Wed, 19 Aug 2026 10:22:14 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/6] various fixes for 11.2 (gitlab, tests, char-fe, fdc,
 deprecations)
Date: Wed, 19 Aug 2026 10:22:00 +0100
Message-Id: <20260819-fixes-for-11-2-v1-0-b7981c2cc371@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALh1hWoC/yXMQQqDQAyF4atI1gZMEDt6leKiM2Y0LrRMVAri3
 Tu1yw/e/04wSSoGXXFCkkNN1yWDygLC9FpGQR2ygStuKkctRv2IYVwTEiFjbN2jrr3jQAw5eie
 5F7l59n/b7mcJ2+8FrusLXvtfYnIAAAA=
X-Change-ID: 20260819-fixes-for-11-2-f98744b82c12
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=eRd91Q9Mbybc5OzTUIIf05kBnKuQZ0Yf80aZT+CMs7I=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqhXXFIMkWmoM6Z8qEEg5t3X81qMUrIAEjL79Hv
 jbWk96UdPqJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoV1xQAKCRD70NsJWp4q
 ROlYB/9VW+RhTop4+z+/+iG0I/gqDfKEnGPGzvwitJ4qRlmD7isf8tskJ8ZasX0XO9a5AaxzsDQ
 lVEUSnojTiNViguW2uK+v+6Mi7pRNJovUkIVKC3JHtUN9GRUQMw1kpn7F0l/0g6BqnGVD/iDzd8
 OAIGhPwSpHlo27v928968Rl/YKEl0Xod/CTuxsjaQQS8xF2ZYdr4BBYHMWAAMTJBcLJ7/1UOnPi
 DSxrMdYxH5c1O8FZBpUt+GOGeHfn8zvXTc+VHzaZVr0JyW/RKHraGwgiGnQKatjtpQUDGtvIXcc
 7tCyVaChOeSL70FKVgxkjfOhile+p9ANXaDiAbOu9PysQGZB
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

This is a rather random selection of fixes that didn't quite make it
to 11.1 although we have some qemu-stable material in here.

The CFLAGS tweak allow another target to be built and tested on MacOS.
There are also riscv64 compilers which could be enabled via brew but I
don't have time to look at those. The CFLAGS changes are also subsumed
into Pierrick's check-tcg meson updates which might hit first.

The char-fe clean-up removes a code smell of device models reaching
into qemu_chr_fe_get_driver which is poor practice.

The fdc fix resolves one of the many security reports for those that
still care about floppy controllers in VMs.

In my brief excursion into our confidential bugs I did look at fixing
virtio-crypto but found it needs some serious love. Therefor I'm
taking the other option of deprecating the module.

Finally I'm experimenting with using b4's patch series handling so
forgive any finger trouble on this series.

Alex.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
Alex Bennée (6):
      gitlab: use .base_meson_job_template for macOS jobs
      tests/arm: add explicit CFLAGS for system build
      gitlab: add arm-softmmu tests to the macOS build
      char-fe: implement qemu_chr_fe_backend_name
      hw/block: validate the fdc sector position fits within bounds
      docs: deprecate virtio-crypto

 docs/about/deprecated.rst             | 14 ++++++++++++++
 hw/block/fdc-internal.h               |  1 +
 include/chardev/char-fe.h             | 13 ++++++++++++-
 backends/cryptodev-vhost-user.c       |  8 +-------
 backends/rng-egd.c                    |  8 +-------
 backends/vhost-user.c                 |  8 +-------
 hw/block/fdc.c                        | 28 ++++++++++++++++++++++------
 hw/char/imx_serial.c                  |  4 ++--
 .gitlab-ci.d/macos.yml                |  7 ++++---
 tests/tcg/arm/Makefile.softmmu-target |  2 +-
 10 files changed, 59 insertions(+), 34 deletions(-)
---
base-commit: fa19879df1658f96ac07365fca8835b7decd6995
change-id: 20260819-fixes-for-11-2-f98744b82c12

Best regards,
--  
Alex Bennée <alex.bennee@linaro.org>


