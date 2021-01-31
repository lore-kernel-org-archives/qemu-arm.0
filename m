Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581531lfo;
        Sun, 31 Jan 2021 03:14:12 -0800 (PST)
X-Received: by 2002:a5d:560c:: with SMTP id l12mr12867493wrv.417.1612091652810;
        Sun, 31 Jan 2021 03:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091652; cv=none;
        d=google.com; s=arc-20160816;
        b=Lb7VMawhC7y0bVoLGM3hslNMrMGoTKFMUMG+6id6n5LRhIxTcL17f770SZgWi9Sjvd
         N3+TitZVtGZrploauZGq2HdsPQM7kEFIvfdeJFDcj10b1LhsVg7EIlAmKPFlNtvnqRDI
         mA/wUhSZc5evaiWo7Q84G+tk7vOnOvJOgFR8cPrLNsqLCGy76Lqv1Rd+ttxNc+Kn67CS
         sjdTxCx5YXVXDvaozfpo8j970Ac6unoUGdcTvsVO5o2shfa3upRUhs1dXHH23kloTgES
         jGqi0XgCJKogxjxN/BvrMloM+7SuwBm4Gjb/b9wozf8ysILJZQFQb4IgPIvtju4tQD12
         YU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GDkI+rwKtjNKilVNRpLbahjwFzHqXAoDQm6Y6hyZ/4A=;
        b=L5D7RBXq52goENLFsNdr9FVtLlBrY2CkrClf6Vw7zqHlBKD0u5b1jmCfttbuJ5xQZD
         Gx6zpzatiHJDuS/gclnHgdedA5qvEyD3b4IixRNpGfOIfQlvYyamSZtlBu2w3z1bp3Sc
         sf0hIUvYMxOpcZfkCNCCAWzGF5NGqZlouoL+wKxdRnMiJ8l9rUtloOR8OQO6DWrT/ZhR
         Qu8e/LvF+zmCtUQ21SKTGWioZRPn9KffDaT/7uSbUYZhYC/eUdoRiOnRfP8e9DZBO9lH
         r5Tyah72j1aqkaPVd9Fu+YigFvJRftbnFfBdzse43kY6gcR+GD96UOJcarjcuI6XtmqP
         jVMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=leLcc6pF;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l22sor1455537wmg.19.2021.01.31.03.14.12
        (Google Transport Security);
        Sun, 31 Jan 2021 03:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=leLcc6pF;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GDkI+rwKtjNKilVNRpLbahjwFzHqXAoDQm6Y6hyZ/4A=;
        b=leLcc6pFkG2sud5rWI+np/GSNmk62nWtvomlIRSzn4Ps4W4u0zcCv9+YPncGta2nOk
         zojnlppJSKiqHsmhu4SMXg9Sqb3Nho20dwRvOZu88vHcEoIyLCwBIwgwPC6qkGR8SGjL
         mDOi057bPcyru2ek9N1L9V9YoqMQiiYOVJ7P1lRvK0U/qB5QmOkczRl7tbDXxThWuHvg
         NDUxTIVV1kg0sYo20cJ/D46E6W/6YFEUGy5kZmYktcCAwspqomi+1r5IuzzJ7dlfnJR4
         jSraOTY7DNRBaBcm24oskY1FGrU55g878fdQuGIoCSgpemOyATgpaDpx8l/aG/31ITJ+
         fC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GDkI+rwKtjNKilVNRpLbahjwFzHqXAoDQm6Y6hyZ/4A=;
        b=HJO5nbRaaMa2bGEy1kZIZPuTRF5Y+Hokso0t/AdP58+uAqccvKi34bYc7V7I3ZntVv
         s/+H25lRg1bAKyDYRfrJeQU/0/5UmqiFo20jPZgGu6s+ujqAc9JDuip5LHEJX0vt0u45
         xgy0nTaniXDoqeCWf4s2b479DUS5iukXuHmqPIH/BFkgoFlsqrpbFzu3VHns4PX8MyaR
         3dWEPenGxOTBR6BQWDIOUhihC3YQxLyhSOBnQWYUFQUbmwUD6RCZQP4ZQ78DQTUEtgSz
         QPncV8JwmIbML5/m7Ah7ExHyfPutt7HKkEpoqJ3PJkURaijndW2uQxn05LFmVVVhS+AC
         9/jA==
X-Gm-Message-State: AOAM532FfrUBHzJaLfGJ2C+uJybOxxnkTBQjSXamHxI1zHYq06U9cNTX
	oILb+r7WeLqc9o5U4ES/Q+c=
X-Google-Smtp-Source: ABdhPJxnjopGFqmpUKqaP8zHmFxUTRSBU1pnTi6CbH65zn6PNcQ5hIQXrup6Ok2s8PWmQ9nwRghYPw==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr10912239wmh.22.1612091652608;
        Sun, 31 Jan 2021 03:14:12 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id h1sm23178056wrr.73.2021.01.31.03.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:14:11 -0800 (PST)
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
Subject: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING selection
Date: Sun, 31 Jan 2021 12:13:14 +0100
Message-Id: <20210131111316.232778-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1/De4LqKUM3q

Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
already selects SEMIHOSTING. No need to select it again.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak     | 1 -
 default-configs/devices/riscv32-softmmu.mak | 1 -
 default-configs/devices/riscv64-softmmu.mak | 1 -
 3 files changed, 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c7..341d439de6f 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,6 +41,5 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index d847bd5692e..5c9ad2590ef 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5eec75f05e..d5b2e25b6df 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
-- 
2.26.2
