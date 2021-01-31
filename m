Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581296lfo;
        Sun, 31 Jan 2021 03:13:47 -0800 (PST)
X-Received: by 2002:a5d:4391:: with SMTP id i17mr13229583wrq.57.1612091627127;
        Sun, 31 Jan 2021 03:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091627; cv=none;
        d=google.com; s=arc-20160816;
        b=aPhnP6BVp12PJL0QQoZ7+/Al2664l4y3fLyHDaGHwUtRBnSsYVXMpL+zQJsrF20l6B
         lwr7l2mh3LKP7uQkj3AeqBR/vQBjBBWVblS/F2YwfIzxA01ouGGpUA1WpB/y+Tp7JE9s
         BALqv9s8tMmcUXCKmnCZqREXM/klTo/iEAqdV2kEoc69DuLaqBMbZfrj+b5RuN1wZBXY
         NS2PR9WCMCs88enolY/2N3OfdGxP+M7mlRWhEAHy/A+dc0PjkJYQI8MjCNVtIsCEi0uF
         qpDwdNhaTckk0jsDRyDzhtNn7qng00v2OwSUM/8fvdsJzOPq8FtjPVyaxRZy4riTKQCW
         jgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VZ5JZwzpktnbjFuf/ncaeAAbDJxYH2JCDDvtVQgdW+w=;
        b=eu3XlaOfjJpDwFRHcTYwLrUDOyWUltwKkQVAetg8WxuvCHeKyrojIjAmqqUf/Qhn3z
         9wIQrQrdoaGYetDXzzG4gdljDD+4BvbDiwkb/TgUOCXpeUrDcfsc87RSW6AL7UwWeBDF
         5x1f72Jwzk8J/UL27IHgr8A8yv0HtOPLx4AA1S78mmO4MJToIzsVRfG6cSChvwApzvnS
         XVbn0q12YEti3Abdw0yR3jVwFXDF8LYXJRwP0BY8SmIblaUekSAwwHroMhftpnUzAzZ5
         QGVD7IHrmDONKCmvxDikk0vnMHtDLurjKIrxZ9VxTo7tqJVwLhavDFNB1ZBa8J66RxLY
         Ee+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ToTCx2jW;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g15sor6725413wmq.8.2021.01.31.03.13.47
        (Google Transport Security);
        Sun, 31 Jan 2021 03:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ToTCx2jW;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ5JZwzpktnbjFuf/ncaeAAbDJxYH2JCDDvtVQgdW+w=;
        b=ToTCx2jWckWjHNwpEOz5wdo/JJkak9+T2kGHTPB3H9cUsSWYIJ2j0m0wd6ZXLfgxm/
         npiF4nB+90iU4FCLw2dxO9FGjYxk7sqqOKNPgbnT43up9MT3+TqVcO1dzfS5nC30YWsb
         SmW/ud6ZCvRzxnycN0tOgYoFcQKL6HTXZlNopN7UPbBXEYJQRYkrmDTygLyZixrodMtU
         uBmILEY/oCg/GOX2dzjcq5QWWrpK1Q/kqNiziD08GehDKl/Ls9OGkVq3NNt8CNgoNTvU
         Pqb8qpC0WBbuifL4S2EngyrN/0+LMivv3LKHDfCnICIuLegny6Vgj+AjlyrXJ9Px23Vb
         6zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VZ5JZwzpktnbjFuf/ncaeAAbDJxYH2JCDDvtVQgdW+w=;
        b=f0qcHL/W6ilpOJyWE0swrpj8mU9kM92A/7bP3JNHdGAWsR4YOfGyrIz4YhXzHHTdHi
         k6fXCHKcBXiUnDZdLDprj3x40EJ1ztZiJEBNTzzTyCddTm2kIRTE9KHJUw2E3Y3FvZMf
         JTdIJDwAMiYtmbEhNhgZTXxwbqDwOB0vtM4kDOJG5DHSXnPxUsT2qX3uI6G0oj+pXkwY
         u6KwOntwNBqo3a7zEPvahndPuv8Oik6CwRw/nIS0ZlABtNNnNgHEM5+qA0G8sRv27Jga
         /1uK4tyPZ5II/La9B56yZooJ5w1GnEvrkPybBJDPzJIVPOvafzs5aeh5I7uV8/Rcqdv5
         z5Iw==
X-Gm-Message-State: AOAM532crTf9OAz4Q2DwHxImH2vTyR3d9CIWx3+qH4GvYuiVaooWB08X
	NdfXPq7NU+WQxpvEIO60Q2M=
X-Google-Smtp-Source: ABdhPJxUb54MNnNR5jLVD0xKsErUHIn07Vu6OqovQ7PCBXAlfVBhNXjdpq2WzDgjRc+LEHv7SAEXbA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr10918232wmc.39.1612091626857;
        Sun, 31 Jan 2021 03:13:46 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id u14sm17326317wmq.45.2021.01.31.03.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Green <green@moxielogic.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Walle <michael@walle.cc>,
	Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Marek Vasut <marex@denx.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 04/10] hw/lm32/Kconfig: Have MILKYMIST select LM32_PERIPHERALS
Date: Sun, 31 Jan 2021 12:13:10 +0100
Message-Id: <20210131111316.232778-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ompgMaCJRSpI

The Milkymist board requires more than the PTIMER. Directly
select the LM32_PERIPHERALS. This fixes:

  /usr/bin/ld:
  libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cpu_gdb_read_register':
  target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
  target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_im':
  target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_ip':
  target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jtx':
  target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jrx':
  target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
  libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_cpu_dump_state':
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 5867f4db0cf..38ad22c54e4 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -6,11 +6,11 @@ config MILKYMIST
     bool
     # FIXME: disabling it results in compile-time errors
     select MILKYMIST_TMU2 if OPENGL && X11
-    select PTIMER
     select PFLASH_CFI01
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+    select LM32_PERIPHERALS
 
 config LM32_EVR
     bool
-- 
2.26.2
