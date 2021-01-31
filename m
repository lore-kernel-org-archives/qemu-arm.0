Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599497lfo;
        Sun, 31 Jan 2021 03:50:42 -0800 (PST)
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr13077509wrz.86.1612093842588;
        Sun, 31 Jan 2021 03:50:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093842; cv=none;
        d=google.com; s=arc-20160816;
        b=G7Ot4OfgKIg0Q79rurtUd7cVTlhrN6UUtn/4XLIBXPcgxfP/19adnMOM7ES9VvHQMY
         zW6Zqt6kFORpx/jeuVeu0CGMqaaJFhEucB1WedT5bdisY4IcQdpZPaihu3eabYVVOaVi
         nikWyszop+0WBlKMTyE5oxJTEBsvqSbrNUP3dgc6B8W+R890i7URPPWVTMiomznxJd2k
         0f1C+KXU1/hmlRiTnYBPQ1+2oLnXHPM6b8dzF8dA8unqG3z2KLUvioBnN5ml8is/umfH
         4bQ3qX4eCEQ9iusTriYZ6gJekycpdNitRiNOA/JvIkmojsQabVQ7reaDif7BCnGwccAg
         MGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fh28JukriQ8n71FXrOcLQmLKpZgUpaavJogE1lG2lKE=;
        b=OhbUS4+52iW388vLLofgzsXt36N//Prh7LIs9LCG718ZbsvxqkbqD1Y6snkYNoH1v8
         FqESevTh0e4WHHCuXIhmZvJrfIdTTgDqlZQFVt9iYKQlg2wSK4Y/AtxUd+LKqVI+G3P9
         LAAa0fKYpzBXyU6iQRa6TZNBVLEyNL8f2MOtmbkMLQjvGj68V4gqX6VcXSNmJ43j2g16
         i3Zx2Q0EX50raFjKyLJoO8S9lmyoHehbr6ZcjU0gMiozFlhu25JFcIEkGiKl0SaPTgBe
         kIWUto0yp+/2CQVxg5r7koXhdYg+msPsh+PTNMCtepQms3NieRaOOIUP4AE8SPD/RH3a
         EA0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9jvv1aL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h9sor7474409wrt.8.2021.01.31.03.50.42
        (Google Transport Security);
        Sun, 31 Jan 2021 03:50:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9jvv1aL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fh28JukriQ8n71FXrOcLQmLKpZgUpaavJogE1lG2lKE=;
        b=V9jvv1aL3pv839Xy1/0k6WXm66MH9MuJ++7EvsG8qCa8S/wu6yqaRlsHWM/6QNB9nq
         otF67bI38HB/w9Q6MYBXxVOV5UBCfzchBKzB7qzo23tC+CtVSDEiuDhSZgH2dTnQIoYd
         6joAcsNUIBk61d62T+9j0tEWV0NdSA6ytJkUxnBG0i3S908YNLWEon8evQ47X9B2sLl4
         nYV4yaQ2owvFrejRRcFu4R05XEV7WMKV9GrqyrPq04KqW0pgCUzJ6KMZIWHx1H0HXq9X
         d3lwh952RSMVU6+mG+0RM+tLEOoLrQ673P9FK4aAUMuTDxUGUjXBbhRSvwjSbsfKJ1+J
         eQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fh28JukriQ8n71FXrOcLQmLKpZgUpaavJogE1lG2lKE=;
        b=KZmLe5MYfkgdJ/aUvzCZX0N7CKRtvrNYJ8RPL2r+Hy2aQLI3irXROaoBBPUvTESUeb
         7VYPwqPXXcifQSpeWc8dzwnIT4lfBk5zP2nmDxSo358b3/YRU/aw6Z7WwnD0i7FO2ZH0
         DVNEyrvin0n6cz45kYJczvFNjq/C+9yEZc4rGeC3vCu6emlv/qWiL4ydWo4JDL09jPHp
         65uQn06xTwjyCgPHMJ0I5O40YR0TabdWms1LPQunhv9ysr1YA1cxjj5AHZH064USMHzG
         tBtZxjOjzrErCZVCVWIWmSuwA5zyJPSxOa79DWrYjDiUbo5dlFCMkEPXKGGxqy+EVlp8
         YAuQ==
X-Gm-Message-State: AOAM532d3j40ofqFOHyBptNWsvDcpVBNIyXEsnPDlPL4r7f6s7Koa+oB
	lgnr/E7iNr0UJimLOr1Iy5w=
X-Google-Smtp-Source: ABdhPJzPZYCyk9Lid3tGRWhj4ZiT3g9tiJCZJewZhjiHAEXNm3DGC368mGAO4xLutOTTbFfAQmbXoQ==
X-Received: by 2002:adf:f303:: with SMTP id i3mr13248696wro.60.1612093842413;
        Sun, 31 Jan 2021 03:50:42 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id c18sm27536097wmk.0.2021.01.31.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:50:41 -0800 (PST)
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
Subject: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Sun, 31 Jan 2021 12:50:14 +0100
Message-Id: <20210131115022.242570-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WewrW2aFAIGC

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

The following machines are no more built when TCG is disabled:

  - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
  - sx1                  Siemens SX1 (OMAP310) V2
  - sx1-v1               Siemens SX1 (OMAP310) V1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 2 --
 hw/arm/Kconfig                          | 4 ++++
 target/arm/Kconfig                      | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0824e9be795..6ae964c14fd 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
 CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f3ecb73a3d8..f2957b33bee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,8 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && ARM
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -249,6 +251,8 @@ config COLLIE
 
 config SX1
     bool
+    default y if TCG && ARM
+    select ARM_V4
     select OMAP
 
 config VERSATILE
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index ae89d05c7e5..811e1e81652 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -6,6 +6,10 @@ config AARCH64
     bool
     select ARM
 
+config ARM_V4
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2
