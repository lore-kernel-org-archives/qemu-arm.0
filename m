Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618701lfo;
        Fri, 29 Jan 2021 17:52:31 -0800 (PST)
X-Received: by 2002:a05:6000:1189:: with SMTP id g9mr7354870wrx.230.1611971551114;
        Fri, 29 Jan 2021 17:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971551; cv=none;
        d=google.com; s=arc-20160816;
        b=SHtyqWsV8CuAfbEqhzND3Ba76TWTEXQyS0xbDxT8UWEy8HOdRGtv9x//AKPiC3UpiL
         74PBJninGabGZpK/6EXGcq/um7TDOc1x9l99GeGYT7k5894vT9sakvMpkebLUaxtdWSP
         5lqVisjy9uLUWHkNnmOKEQr7KwFgZ5+Ua4GHralGzEJEraZOnIfw8L7zdG17Yx961b3A
         p+s01J65wtpmjAYlQVpwoxj1/bd17eHkf+JqBfDPnml7SY45o7IAc+m4l/0QZrbR9tdj
         YqknrX4OgXHyvAGRJqCXTKAts6oE2y1ueOHT09s7tLYt86ctnNWN5wXurqC0dZc6NVOR
         /cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=adQegksKyg6ypqy8yaNY4IxRFUUd8NlguDdBcG0O0Dc=;
        b=D3pkWnJ89s8dRJv1SPPeXb4CMfvu95H4i7Q2T1KEft2ZlYenNZ+lmdN2hrGCl0N3jh
         6y9qeK3Ef6yZf7kB1QLoe0Hi4uwjyQi1E7jjnIaHsRbXffjZslmAAebJVLCPR6e3imw1
         zlZ1iThL0NNnhNCcGe7uxKoSAVtfNhfQ2+ruLqibjiGFvZwavWqMWbeT1XfIyku0AcOS
         Ggn8oa1gOGNMeXii5MkNGVyuH/CO5afaIe32GXNOlZjey8oXGMnQdS2rvhNgtEXQvduB
         l2sx0NuwslPSgpwRjcXjPEhnVhIfqyRmxHWoKYbJkkp/2ONEcrJ0K2Yy8TkDIQrGeak2
         Q9cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jify+HIv;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p128sor5460350wmp.2.2021.01.29.17.52.30
        (Google Transport Security);
        Fri, 29 Jan 2021 17:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jify+HIv;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adQegksKyg6ypqy8yaNY4IxRFUUd8NlguDdBcG0O0Dc=;
        b=Jify+HIvCRI6v2kFDWjTZrLVCkFPKsirwWVmqbOedbFWxEWVegCK8Kfa5vj1pFUxNR
         uVc5o1KEC4qiu0zDMpLGV/D0/60D4MPbPGua/hCXEYPst1Gv7htKhNx4uEL6eT4mq1+u
         xrIxvT+4cmFzEtGbbarSXi7wPPUsqpBBh2xGR088evTJQDO5hPAkzcAnHItmWFdxuCtm
         th5XWIsnQ2N49bSnJC6+lJtaNE46hgI0naP5dMuR0EKp4QP815M06UqGrxn62rOTX72K
         b4eZU7IMeR8PULGxqjQi4Df8MG49oURxPLIda+TTg4pBpWCFlHieW7lxwh/2o1n0irDR
         eUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=adQegksKyg6ypqy8yaNY4IxRFUUd8NlguDdBcG0O0Dc=;
        b=owIVcF/SkzrKcb0Q/GFvGhwxx9/Z8cCm4njCVaqzx0NTsMKnAoGtJWA5ZmDd/Xl1wY
         mpJjBJZiOq7npxzsrVm7k414AmfGgFhHePq0/htLmRnzGcVxdUjbtr1mq/Nd4aiQJM2J
         TQm2bG1G+zjIDKFPWAiJ6/IjMs1IwSK6f6dGhikT+TUsLgHRAw/yMUt7fccdYn+W9eiY
         WYHxG0oAA5O+EDg1+HD9Ba8V1ngGqkliRne7YkW2xOOYynrE/fMfX7XBwXPF7n2Z7J7j
         B62n7ezEmbt/7ccABNUsE+XBiAlIsOsdQs7cfACyldEk2dWPRu2W+mmX1jTNiYTiuOSV
         y0bQ==
X-Gm-Message-State: AOAM530Ulnuq0Iyaw6YpuT+vuSgFv3szU4z+xcFfrJR7gZ5A8kU40kNi
	e5cPEvAlfZc/+5X+hft/MFM=
X-Google-Smtp-Source: ABdhPJzAZ1zraX1+wErsQAoxLg/4/5cge/k+zf+9AXuQRmCgsUUA0TAkV3aDzuzdcsuTqEd2pjPmTg==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr1504698wme.147.1611971550627;
        Fri, 29 Jan 2021 17:52:30 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id e4sm15520107wrw.96.2021.01.29.17.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:52:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 00/11] Support disabling TCG on ARM (part 2)
Date: Sat, 30 Jan 2021 02:52:16 +0100
Message-Id: <20210130015227.4071332-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: I5KcimzaoJSZ

Cover from Samuel Ortiz from (part 1) [1]:=0D
=0D
  This patchset allows for building and running ARM targets with TCG=0D
  disabled. [...]=0D
=0D
  The rationale behind this work comes from the NEMU project where we're=0D
  trying to only support x86 and ARM 64-bit architectures, without=0D
  including the TCG code base. We can only do so if we can build and run=0D
  ARM binaries with TCG disabled.=0D
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
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  exec: Restrict TCG specific headers=0D
  default-configs: Remove unnecessary SEMIHOSTING selection=0D
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
 default-configs/devices/arm-softmmu.mak     | 28 --------=0D
 include/exec/helper-proto.h                 |  2 +=0D
 target/arm/cpu.h                            | 12 ----=0D
 hw/arm/realview.c                           |  7 +-=0D
 target/arm/cpu_tcg.c                        |  4 +-=0D
 target/arm/helper.c                         |  7 --=0D
 target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++=0D
 .travis.yml                                 | 32 +++++++++=0D
 hw/arm/Kconfig                              | 66 +++++++++++++++++--=0D
 target/arm/meson.build                      | 28 +++++---=0D
 11 files changed, 196 insertions(+), 64 deletions(-)=0D
 create mode 100644 target/arm/m_helper-stub.c=0D
=0D
-- =0D
2.26.2=0D
=0D
