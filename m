Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599374lfo;
        Sun, 31 Jan 2021 03:50:25 -0800 (PST)
X-Received: by 2002:adf:9523:: with SMTP id 32mr13771418wrs.361.1612093825783;
        Sun, 31 Jan 2021 03:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093825; cv=none;
        d=google.com; s=arc-20160816;
        b=0jMskAbkDzYnfyxP+4Sw0dHHXvBo5mk7a60TZnNFo4LrFQ/u2iY0MvTCXNgDmR3PzS
         mPKa8f//jY7dHb6khRbsNR5zBtxJlExerXfYHg7o47z+H4XBscd4jE9M8wXq3DDjIzZZ
         Pekskqa8/cTjZfuknxDTKPlgMt8C0mbuyklgfkVlLbn0Tbiur8sPztCbb8Ku0yW9MeUI
         2nRPYXW2GdPt14qdxx7LRDYNNyS+mn3hPK6WT8jFDjOwEM0op0CgEwRxUJBT9iyKMa3u
         zkl8e3akSIWBdrNZR46hLnCasOR/i6kQXxxI8LXfH8E/1TA5OhMa8tT3iJjr5cCDBQwe
         4IXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=1gCD684y2+yR8ZPFp0RrwyPF7ZTcIuoLv37e2hkgFE0=;
        b=Vi59CRFh0wqcvT2mTD2pU0o6lOMiTA3tJcJkAdxBBd66MKtrmnQeMSjUt5P9hcsxXF
         SWBQOsfmjAAvBQMm0fDERSFU5VQ/1OIDkdiY7i6J7zbB+hBr6nt8GsVjV00NN4fmBiE2
         HRap/ImTGzhoDEns2498d38hF46c7GMAcN/mX9221ztyRVFQqEbvzWfHgozUr1uXrJ+V
         bo2/ujkJUS3PVcos5MiiP82Uw9fAG04UoU5xN49AtW+rpUt0PgPycZgcNqI790xWhvHq
         7sDzpthe9TTaaPnL5by2lZxJzlufSJx9ev5YDiXjhfIrqqV9pyBQJ8QnYvteb237+Blc
         wTyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="n/rUycdc";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f6sor8613939wmq.0.2021.01.31.03.50.25
        (Google Transport Security);
        Sun, 31 Jan 2021 03:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="n/rUycdc";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1gCD684y2+yR8ZPFp0RrwyPF7ZTcIuoLv37e2hkgFE0=;
        b=n/rUycdc+ct+UAqDtNRrvH32lMXamGwdH/hrZpmxT5tFvY/s3Yt9F8aZkX9j4jtwqP
         ujuykrOso7k6mKqrGY4dNKu1x+SqgfERulsiFPHm7Bs9POeqwzV6W2qVO31s1MJffxLA
         Go5XmdNKRrrNV7xzzETC4xkxqMXnuX/xVwPduR4mNEZaQbjK5Kzuoy9up/bd2iUXZ+3U
         S9+bFqz2m53y3bVyiwj6pfQ3NXAHBSqMgrHbDF0KDJkEvY3squ+2FaeICfjkqIVBu2DQ
         dtE6Pn9JhTFPDzknw4DWaiVAtDRs4ZhplHKoalaxdC6xOtO+k5V8b5xEYZmwXr8jU8ck
         AMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1gCD684y2+yR8ZPFp0RrwyPF7ZTcIuoLv37e2hkgFE0=;
        b=HDZHaWjCl1Kvyo7DYxGnG191w9mEGPa/ua4ADpxGlgXszLnHL0g3mEzu/drPUvfg29
         AGAl6VpZ981ThEqzhjThyo9EUX62zUFaN594xr5xlkN4sOm4ZiBhgH7hOaRLTZTFqEDU
         3RfmBR+C0yfrgSu0mphIFonEfnHg7QBZmfp31vq8Az6gUTzSaf8w14bQk6PikS2tarJo
         6fcUFLy+JmlOa/bif0OuLYsTT5YpNXQli3q+TkXr5bX2G7aEZoRnmaYaUlovXecpm+MH
         0oEUAwe898hduwqoXUBrhWhDYEca+c1fMMzMWpfS9PgeeIqAj6Y2GUCTv7HUAhPxlq9q
         t42Q==
X-Gm-Message-State: AOAM531KNg0pjae2/mXMilJnUq0ZsQaP1YKXKnA01PXYY0sz9xhODoFa
	+6fVrvZP+oMI+5Y9uSDwv6s=
X-Google-Smtp-Source: ABdhPJxub8KK7dIC58IEzuZSU43m5r7m7PqN3sJd1N+IK8W88v9tfmfMGC7iaD18Qc5HF+HixP+deA==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr10774027wmk.72.1612093825430;
        Sun, 31 Jan 2021 03:50:25 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id g194sm17384967wme.39.2021.01.31.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:50:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 00/11] Support disabling TCG on ARM (part 2)
Date: Sun, 31 Jan 2021 12:50:11 +0100
Message-Id: <20210131115022.242570-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8Y7FdmcgR2ju

Cover from Samuel Ortiz from (part 1) [1]:=0D
=0D
  This patchset allows for building and running ARM targets with TCG=0D
  disabled. [...]=0D
=0D
  The rationale behind this work comes from the NEMU project where=0D
  we're trying to only support x86 and ARM 64-bit architectures,=0D
  without including the TCG code base. We can only do so if we can=0D
  build and run ARM binaries with TCG disabled.=0D
=0D
Peter mentioned in v5 [6] that since 32-bit host has been removed,=0D
we have to remove v7 targets. This is not done in this series, as=0D
linking succeeds, and there is enough material to review (no need=0D
to spend time on that extra patch if the current approach is not=0D
accepted).=0D
=0D
CI: https://gitlab.com/philmd/qemu/-/pipelines/249272441=0D
=0D
v6:=0D
- rebased on "target/arm/Kconfig" series=0D
- introduce/use tcg_builtin() for realview machines=0D
=0D
v5:=0D
- addressed Paolo/Richard/Thomas review comments from v4 [5].=0D
=0D
v4 almost 2 years later... [2]:=0D
- Rebased on Meson=0D
- Addressed Richard review comments=0D
- Addressed Claudio review comments=0D
=0D
v3 almost 18 months later [3]:=0D
- Rebased=0D
- Addressed Thomas review comments=0D
- Added Travis-CI job to keep building --disable-tcg on ARM=0D
=0D
v2 [4]:=0D
- Addressed review comments from Richard and Thomas from v1 [1]=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html=0D
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html=0D
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html=0D
[4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html=0D
[5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html=0D
[6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html=0D
=0D
Based-on: <20210131111316.232778-1-f4bug@amsat.org>=0D
          "target: Provide target-specific Kconfig"=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  sysemu/tcg: Introduce tcg_builtin() helper=0D
  exec: Restrict TCG specific headers=0D
  target/arm: Restrict ARMv4 cpus to TCG accel=0D
  target/arm: Restrict ARMv5 cpus to TCG accel=0D
  target/arm: Restrict ARMv6 cpus to TCG accel=0D
  target/arm: Restrict ARMv7 R-profile cpus to TCG accel=0D
  target/arm: Restrict ARMv7 M-profile cpus to TCG accel=0D
  target/arm: Reorder meson.build rules=0D
  .travis.yml: Add a KVM-only Aarch64 job=0D
=0D
Samuel Ortiz (1):=0D
  target/arm: Do not build TCG objects when TCG is off=0D
=0D
Thomas Huth (1):=0D
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M=0D
=0D
 default-configs/devices/aarch64-softmmu.mak |  1 -=0D
 default-configs/devices/arm-softmmu.mak     | 27 --------=0D
 include/exec/helper-proto.h                 |  2 +=0D
 include/sysemu/tcg.h                        |  2 +=0D
 target/arm/cpu.h                            | 12 ----=0D
 hw/arm/realview.c                           |  7 +-=0D
 target/arm/cpu_tcg.c                        |  4 +-=0D
 target/arm/helper.c                         |  7 --=0D
 target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++=0D
 tests/qtest/cdrom-test.c                    |  6 +-=0D
 .travis.yml                                 | 32 +++++++++=0D
 hw/arm/Kconfig                              | 38 +++++++++++=0D
 target/arm/Kconfig                          | 17 +++++=0D
 target/arm/meson.build                      | 28 +++++---=0D
 14 files changed, 196 insertions(+), 60 deletions(-)=0D
 create mode 100644 target/arm/m_helper-stub.c=0D
=0D
-- =0D
2.26.2=0D
=0D
