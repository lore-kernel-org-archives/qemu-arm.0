Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4985919lfq;
        Tue, 29 Sep 2020 15:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL49o9qPAK5JIDbHiRxAvqN/jbwuSm0ehuKjmxuejO3K8ypzBs64I1rIXUJAo3UZNWKtTI
X-Received: by 2002:a17:906:1157:: with SMTP id i23mr6401961eja.440.1601419443842;
        Tue, 29 Sep 2020 15:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419443; cv=none;
        d=google.com; s=arc-20160816;
        b=z/kFzVs8Xt+AOSPov5XwqiLvNDvKoXibo3dpWEU02EpyH5RuV5uLSYeG+txxLx4LNw
         0zYRLnXXO6kbM8+peH9BAT8zjUvUpfVutiH98eLens9ZFVjgRT6HVmvCFkCSOGnaF7a7
         +gTV6C8ker1biqri6vkZvRDzrFwYMmKt154cEn2sHPLv9PXTgZMp9OKXzJhgql9UIiDz
         Ci1oXS4Y1pSbzsBeL8BP1ZZB62YdTQbSQnzOnvqoe8WFqmOi8imMBOk8rRGoLfTugPrA
         XNv/GKw0erNOHo4KMjjerBXTmz4kE6/rlTO5b0s8Z4/XzWLEahzxgEk8WeQ8Uh4fAXrO
         YX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Sm3Gm34Jjn5EWoNbFg1uRbBUxTP1yXhpa0ydpRV9pWQ=;
        b=np3cf4ndWDI2umchT33M8GHcrDbKTOhZueKb7ffj54sXmwYav2J6kdvCgGUr38yVVN
         KY2TLgyH0IblTnfL4ufYqQlPyRZjLkJ/TRfWIByHFBJFLbZFRuFbSgeFOCbDMHaheIHx
         XMdagEIlC5CAkQyyImjCcco/EAKK+ofJlwLdWF7sv7mlQirI9XyWt+E2T2yaDOgchqPh
         oRpCtZ57BY6JBBaZvfTrgpNhL+hLavtDqiyCDxdu6gwtc+gFVkWejck+cYwRX9npEyz9
         enGx3GGxRsLilJx4fCQfYz3rIBOx1+vB0UJnofokGrB01ErIg3AD+Wr71ADQvQiVTxcd
         j5xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eO3FSZiO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jo4si3345034ejb.681.2020.09.29.15.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eO3FSZiO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sm3Gm34Jjn5EWoNbFg1uRbBUxTP1yXhpa0ydpRV9pWQ=;
	b=eO3FSZiOtZUPxt50ouDu/cjEE4wVOb2qUuRoElSkh8Gydgf7zd/KtPEFBoqAKjNZHbow/8
	o/AlppNwHMAizPMfEeLuiyg4BGZogdZNCbU0+5BEobssw7Vk0K3sAwYDUZSEaqwW+JKb7v
	9Bm7UmUBqcxjng4zmcv+0ug441BucMo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-ig4ZiTXaP2e20dO5NoZ5tg-1; Tue, 29 Sep 2020 18:43:59 -0400
X-MC-Unique: ig4ZiTXaP2e20dO5NoZ5tg-1
Received: by mail-wm1-f71.google.com with SMTP id y6so195071wmi.7
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sm3Gm34Jjn5EWoNbFg1uRbBUxTP1yXhpa0ydpRV9pWQ=;
        b=Ho2bPmvveEQ3HFvunbFttt8TLL7120S7k0qI7c1I58v5FdSgC7foRpEiGtb0ryOKPL
         81e7zDs9PKZvxWsrt2kO/pSKyCN0x4beCnqJQkrDgIFmjOaxjINJTgRK51Aa6ce/hMpt
         BuWF+grUkSyse0KjXY/z4NkTF2iUf6BgVwkKmP651CD0LB+CBaQh7IT2yhc+x5lzRpRu
         f9BslZ52P22u+ZgK3+1MZfy8Fl9O/JZTbPdtwYSVxJOcLOs91HRmYGfCu240tT/1cYRB
         xrAeKlUhF2JwAyqlLawte6wUs/0Wtlr/QPqAm/jygwarC2sjO1a2tNdc5tHKUPx/YPGg
         6v+A==
X-Gm-Message-State: AOAM531MkAOp28nYt2BOml6IPREHYWopLQe0V5UbiyJrQIscoP2rARN7
	yF55zwFDoLr2WRYus4o5NOWeNZ4I/eCCaKCbm0Cw/k3KobuF9ygL+86zXIdpOAwCBFJfE5cZtSg
	Qa2Owe+azv2bC45tQ
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr6799095wmg.50.1601419437870;
        Tue, 29 Sep 2020 15:43:57 -0700 (PDT)
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr6799082wmg.50.1601419437666;
        Tue, 29 Sep 2020 15:43:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id t17sm8129443wrx.82.2020.09.29.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:43:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
Date: Wed, 30 Sep 2020 00:43:43 +0200
Message-Id: <20200929224355.1224017-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 5b1Gm4XzQjsn

Cover from Samuel Ortiz from (part 1) [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. [...]

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

v4 almost 2 years later... [2]:
- Rebased on Meson
- Addressed Richard review comments
- Addressed Claudio review comments

v3 almost 18 months later [3]:
- Rebased
- Addressed Thomas review comments
- Added Travis-CI job to keep building --disable-tcg on ARM

v2 [4]:
- Addressed review comments from Richard and Thomas from v1 [1]

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
[4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html

Green CI:
- https://cirrus-ci.com/build/4572961761918976
- https://gitlab.com/philmd/qemu/-/pipelines/196047779
- https://travis-ci.org/github/philmd/qemu/builds/731370972

Based-on: <20200929125609.1088330-1-philmd@redhat.com>
"hw/arm: Restrict APEI tables generation to the 'virt' machine"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg745792.html

Philippe Mathieu-Daudé (10):
  accel/tcg: Add stub for cpu_loop_exit()
  meson: Allow optional target/${ARCH}/Kconfig
  target/arm: Select SEMIHOSTING if TCG is available
  target/arm: Restrict ARMv4 cpus to TCG accel
  target/arm: Restrict ARMv5 cpus to TCG accel
  target/arm: Restrict ARMv6 cpus to TCG accel
  target/arm: Restrict ARMv7 R-profile cpus to TCG accel
  target/arm: Restrict ARMv7 M-profile cpus to TCG accel
  target/arm: Reorder meson.build rules
  .travis.yml: Add a KVM-only Aarch64 job

Samuel Ortiz (1):
  target/arm: Do not build TCG objects when TCG is off

Thomas Huth (1):
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M

 default-configs/arm-softmmu.mak |  3 --
 meson.build                     |  8 +++-
 target/arm/cpu.h                | 12 ------
 accel/stubs/tcg-stub.c          |  5 +++
 target/arm/cpu_tcg.c            |  4 +-
 target/arm/helper.c             |  7 ----
 target/arm/m_helper-stub.c      | 73 +++++++++++++++++++++++++++++++++
 .travis.yml                     | 35 ++++++++++++++++
 hw/arm/Kconfig                  | 32 +++++++++++++++
 target/arm/Kconfig              |  4 ++
 target/arm/meson.build          | 40 +++++++++++-------
 11 files changed, 184 insertions(+), 39 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c
 create mode 100644 target/arm/Kconfig

-- 
2.26.2
