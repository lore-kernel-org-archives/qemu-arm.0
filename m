Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581478lfo;
        Sun, 31 Jan 2021 03:14:06 -0800 (PST)
X-Received: by 2002:adf:f843:: with SMTP id d3mr13010762wrq.172.1612091646335;
        Sun, 31 Jan 2021 03:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091646; cv=none;
        d=google.com; s=arc-20160816;
        b=JDl7wmwVlQmyLgdMD+Z8UiyCoPZXFlEU1Ym6UBW3jhyF11e6j3PuPZwwolHYtKXdEV
         ONhr+qIa4ckl2f3zL4tlcf8qjNUMNPDrGu7CM1uLhOObBJMLC2JSIEX8AjMYz/23B4pZ
         y5K02NtDd0roKjaoo8tYvIESVNjNORiYhwVTB/7x3WJOJjyAeiEM+nT5BP0koBdj2lwL
         MG3GdsJZB4HkcTXwrdUPK8fohskEAjOZFw0HZNiEGoP8YKsjR1cMNbwQD9YlvHznkPQ6
         C3HgUW846M4OTgFJ/9lnI+qm/h4XDlQv5Cy+Hj8t3M3cVyleNIKp51VzejmQgtEG5s9P
         02cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Eh0nPPe+ccMxW9Cb/jr3NHaD25Nxmw47W22jriJyAa0=;
        b=yKssSKIDsPFd9Y/dfZXHCUstKHdzCjQChI4HsGNs4BAtIIlXwA/iQlaAYkrmYS6ahd
         NNkt41b61BLn6UKxhFCv8MuGGF717lzFy2V/1wjJJq3sgOPESqDCOeLM+wJ9n+7bvumu
         IwrqoDmwnpQwi7Hwezxpu0Gb2MeO5Q4RrTK+ehDOrpruaoAmu3s8ZKkEZ51X0artgrhn
         INLRt/PxfYFaHtgZZypLYEWeKiXxCYZdSeKWn+GUQ2viT5IForBKgcbm/bqlz3aN3UjO
         K/F9OEwslkBzIWu2j4hNM/dKqbZtoCOGU4cPXrlAPG7arScfKagDzdVU3x6pCRFRAepe
         7ZFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="qG77/DVN";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g184sor7031395wma.9.2021.01.31.03.14.06
        (Google Transport Security);
        Sun, 31 Jan 2021 03:14:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="qG77/DVN";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eh0nPPe+ccMxW9Cb/jr3NHaD25Nxmw47W22jriJyAa0=;
        b=qG77/DVNuWObaYdxvSPXp5aG31DRU/wwuuwJi7XpKzBbIN+GO30SCqSe+Ev8IPFx+J
         7AOHuOBnnOi2Mu1p26bxIbkAg7mNr8kTMVGj/d1RRoOyYaqlCOwSAECWsxACrs55ND4j
         XBxBOZ+46U6R2MmtCyyv/rI3TwxL8+lpwzo9N4P0iCRcWIv6FhslDGiBGYJzyyNRJOJM
         0Fya/lNgbOvAl16FrnWD4NIAPg8hdSNvc03xmCdsePxHZDJIexs3p+Kfa5NsO5eQ1ydy
         FFXy9x/slDkUf+t14rafYvKY3wcV5qpkcGGfm9UC6tWBQth6w+81RT82O9phB5VVKoFr
         h6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Eh0nPPe+ccMxW9Cb/jr3NHaD25Nxmw47W22jriJyAa0=;
        b=OcGojuWtPvAHRRVH2tk/ch9vNqXSOLrvzJp+TKJqCMOu0AxN+SXxEe1gudFiP19wLG
         tX9g6ojsPrh3dp6SZHnKBy/GuoSH14Osczc0gIb/D1fy0wQr1lF0jR96LDudXOFDeYU+
         cOl0tfI7Fp4qAVjEeDyOJA3BXv0QcN8yNa6mRswXbo9CRd0XppX0vB4HKy/VrpGyE0ft
         Z9YG/xtL19jx+Vr9NnEwvlcEHtZj0l5NySu3TblcAl8hsNhLoyHtc5wFAyE+qDXEzPlB
         iyXoTMEPWDAt++e/mcRXmzGUFBwo3zS/AzWNYhtHGFTqkiCb4A2gEvPrTZQSgQskE9Lc
         +80A==
X-Gm-Message-State: AOAM533Oqni2fohn3OshWRWTDclfjineo6J5sj5ukg+liElejjikvOaq
	nf/Mwdrxpnor6quBk/G9Upw=
X-Google-Smtp-Source: ABdhPJz4doJnrW/LDttNtT/C/l19beETvSJdy/mFd/0h+4oo2oFT/uS3U7LQJZd1vVQMdWC5gHeIMw==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr10703980wma.33.1612091646092;
        Sun, 31 Jan 2021 03:14:06 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id p15sm22584734wrt.15.2021.01.31.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:14:05 -0800 (PST)
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
Subject: [PATCH 07/10] target/arm: Move V7M feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:13 +0100
Message-Id: <20210131111316.232778-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cDOTwCYHkxEe

V7M is an architecture feature, move its declaration to target/arm/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig     | 4 ----
 target/arm/Kconfig | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 09298881f2f..f3ecb73a3d8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -292,10 +292,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-    select PTIMER
-
 config ALLWINNER_A10
     bool
     select AHCI
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b2..1f05de47ca6 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,7 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+config ARM_V7M
+    bool
+    select PTIMER
-- 
2.26.2
