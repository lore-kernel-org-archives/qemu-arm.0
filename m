Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1262150lfg;
        Fri, 26 Feb 2021 05:14:00 -0800 (PST)
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr2833864wmi.88.1614345240191;
        Fri, 26 Feb 2021 05:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614345240; cv=none;
        d=google.com; s=arc-20160816;
        b=hKO+SeQuSpmt/0ol9MchwbYQapU5LtBFN+YQd2f0afN4XXpphAiz10wHS9AP+jzXzS
         Ltfwm+4FDwxUKQfdEmAmluExcF1Tm6LM0T/mxodQjmqJRcfPO441+4e5Nw3tr5k4Uiha
         I9pwB9o/5z0ICzHvcpMQffBmoLVfErVRmClHDmp2pmaQnUVVEr98ii53DATl4FT4QZ0J
         BXwDUSUEAKZKohvW2l3V++qUNViQFTkI4v+BezPgkkBL0A4G8KgF4i9u2k5+NRQHaomt
         g2wfDMxkh/XUYIpmo5tKKsAyMl7f3owQp5Ie7F+RLj0GbdoewLpXts1RXbhsUwDEtABO
         xQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=D7nSUCRfb8txR1q5zJGXHNZDilnXFlqpxGYdUYXSX+A=;
        b=LoHfqtdHDaziLewXSXSojd1EZGycNou8ASO1UVCRs4SSJsAqAjGQtS7XGUvLgKJIIT
         QrHaw06ocH+QySk2YClT9C1vgZ/q5D40jA+d+smeUZFF6L4DQLTlZ8vGI4r6euvB6feV
         bIAQHmY9JuJsfYeDOJ2vxTzlrjMdpkGzNmNddkTiwzSkElU+TDKddLZyEWQJjh1hzFNE
         2rKX15GQ6qOEguclKdZt/7zBedT1JHyG/uY6gvEbayY1EhwFdIlNylO5+k1VSuxyB8zX
         ktwQjLzz8oEw1j7wgmknYaj/SlhOjSWWJ0ZpCmc//dPUnsHPvwTGa2ZR8JAAWWlU7chd
         UyGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BC5bQAL6;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o6sor4478735wri.43.2021.02.26.05.14.00
        (Google Transport Security);
        Fri, 26 Feb 2021 05:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BC5bQAL6;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7nSUCRfb8txR1q5zJGXHNZDilnXFlqpxGYdUYXSX+A=;
        b=BC5bQAL6w8wvkIRP+zeg3DVvYRqdhr2+BqGagzg8MCU0NZrNeoINQMzrL+43O/a2uz
         6k4sLYr6oxr+mz+31zGOYXXnx5Yby8oFGnslRoDINTthZUnA+MxSZBdII4x+Qf8P4p1E
         8b36WKWAMPqC9JvL0f+FJkxTIkjT/ZqC+1Lh76IILjift+t0pbx2XSXuT4d+sJUeJ9NR
         XatSg/QV0BjNeQr5WW+IOu0rZclPrNiu91QV2T00Xxsj5g1S6UifkhYr2K12kcHe2Iyy
         Ejwz11bPhH6YmpXt1CvcALnwP+x033bTIYsBIl/YqwJhp9k8S8urBmIoOLPfbLLBUdQZ
         6EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=D7nSUCRfb8txR1q5zJGXHNZDilnXFlqpxGYdUYXSX+A=;
        b=sKTfJYL8RygSmJhBj7A7WgZEE64BfvV4DDr0N1S5Bik0HW3grueIyeSayaMMA9SwrJ
         9yAidcoMi3qMlMdAHe1sVZnEQ1p6FsYrrY8xoxb6Mo9loE+C72puoip3731IhlODpeKL
         YPm8Jc+e2Xt0YhkCE081AqqLaJR82a5AMoHkRQ//YoTzjRmfBQDsseH1m8HrlnoUvRZq
         TxxRSJMIikSrvpC1OOfTPILwyqM0vLwPv6i2Vr2jZHwrPnMsGGF6pVaoLKah03cJGLei
         7Uve8TbmU4rcTFEjU/7ytVEGpI8EapYH6p3foD7FqTOC8YgB/D5SqU1DOfn2TQ6P4rgX
         B4hg==
X-Gm-Message-State: AOAM532Zodei34o22h+TFqbfIm5xS9x2uUapCdHs4D57t+naM1QARJTd
	Q0Q/NJBiaw/L770Evd3DAO0=
X-Google-Smtp-Source: ABdhPJzsDYvjco560LOYCBKpBNmnGYMfJVanmaDuDYjBhX/EvJQ/HJ6QE2f4ZbaP5WOEy+sAgNIaPw==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr3146590wrt.256.1614345239916;
        Fri, 26 Feb 2021 05:13:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id c128sm12150240wma.37.2021.02.26.05.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:13:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-riscv@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] semihosting: Move it out of hw/
Date: Fri, 26 Feb 2021 14:13:54 +0100
Message-Id: <20210226131356.3964782-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: RgNqcAwYjEYf

In order to reduce CONFIG_USER_ONLY uses in hw/, move=0D
semihosting out of it, being a generic feature.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  semihosting: Move include/hw/semihosting/ -> include/semihosting/=0D
  semihosting: Move hw/semihosting/ -> semihosting/=0D
=0D
 meson.build                                       | 1 +=0D
 include/{hw =3D> }/semihosting/console.h            | 0=0D
 include/{hw =3D> }/semihosting/semihost.h           | 0=0D
 {hw/semihosting =3D> semihosting}/common-semi.h     | 0=0D
 gdbstub.c                                         | 2 +-=0D
 hw/mips/malta.c                                   | 2 +-=0D
 linux-user/aarch64/cpu_loop.c                     | 2 +-=0D
 linux-user/arm/cpu_loop.c                         | 2 +-=0D
 linux-user/riscv/cpu_loop.c                       | 2 +-=0D
 linux-user/semihost.c                             | 2 +-=0D
 {hw/semihosting =3D> semihosting}/arm-compat-semi.c | 6 +++---=0D
 {hw/semihosting =3D> semihosting}/config.c          | 2 +-=0D
 {hw/semihosting =3D> semihosting}/console.c         | 4 ++--=0D
 softmmu/vl.c                                      | 2 +-=0D
 stubs/semihost.c                                  | 2 +-=0D
 target/arm/helper.c                               | 4 ++--=0D
 target/arm/m_helper.c                             | 4 ++--=0D
 target/arm/translate-a64.c                        | 2 +-=0D
 target/arm/translate.c                            | 2 +-=0D
 target/lm32/helper.c                              | 2 +-=0D
 target/m68k/op_helper.c                           | 2 +-=0D
 target/mips/cpu.c                                 | 2 +-=0D
 target/mips/mips-semi.c                           | 4 ++--=0D
 target/mips/translate.c                           | 2 +-=0D
 target/nios2/helper.c                             | 2 +-=0D
 target/riscv/cpu_helper.c                         | 2 +-=0D
 target/unicore32/helper.c                         | 2 +-=0D
 target/xtensa/translate.c                         | 2 +-=0D
 target/xtensa/xtensa-semi.c                       | 2 +-=0D
 Kconfig                                           | 1 +=0D
 MAINTAINERS                                       | 4 ++--=0D
 hw/Kconfig                                        | 1 -=0D
 hw/meson.build                                    | 1 -=0D
 {hw/semihosting =3D> semihosting}/Kconfig           | 0=0D
 {hw/semihosting =3D> semihosting}/meson.build       | 0=0D
 35 files changed, 35 insertions(+), 35 deletions(-)=0D
 rename include/{hw =3D> }/semihosting/console.h (100%)=0D
 rename include/{hw =3D> }/semihosting/semihost.h (100%)=0D
 rename {hw/semihosting =3D> semihosting}/common-semi.h (100%)=0D
 rename {hw/semihosting =3D> semihosting}/arm-compat-semi.c (99%)=0D
 rename {hw/semihosting =3D> semihosting}/config.c (99%)=0D
 rename {hw/semihosting =3D> semihosting}/console.c (98%)=0D
 rename {hw/semihosting =3D> semihosting}/Kconfig (100%)=0D
 rename {hw/semihosting =3D> semihosting}/meson.build (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D
