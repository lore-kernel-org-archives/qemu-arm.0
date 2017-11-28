Received: by 10.223.159.82 with SMTP id f18csp3163263wrg;
        Tue, 28 Nov 2017 09:34:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaLfs5A37O4zGWvg7Y+VrdTJ+9QCPZL3d6CaY8bw8PcmdYOhFbdavQU9VZclh4G5Uzn6T4d
X-Received: by 10.223.155.133 with SMTP id d5mr17024088wrc.132.1511890452488;
        Tue, 28 Nov 2017 09:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511890452; cv=none;
        d=google.com; s=arc-20160816;
        b=jMgiwJdMEz2U/6IkqCHqBS2F8Vgy43LhUyJUe5f8ewjiHQgWb/DCuOD9NSBzSvpENT
         uzpN2ucSecUIoSGIftkvlwT3SxrCwtPX/wnl0pG977SAxHWvnz2XFdDlLhlbNcbW0Lym
         dr2z78Xdkanss2vrSWsROp1pIobRCnt0WLsl10COgOMpbCxdi0NA1JFrXtTVrUdPmtYF
         ydaW2CeBTBihuJZzDjwnBQowdLF4ywpWfZEZkV/ICSwihu5OEP9QXDsfoZFtR2o68Wld
         vLWcjBQoROK+mnaa7NUgjWjOdmLbbch900uXdVgZlK4Nf2+dQqF37jwZ4GWfkhWa8vq8
         sh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=Xzmp1K3b4BFe0uxIBe1JnVdAJ0xYfPsw9LveunCw7pY=;
        b=xukEDtKujxyFGsZPvPzJDiY50kFy5sUvp0shJVKHFIUFA21RMZP3ygYtcfVwMNJMIh
         xbZ9upa3R2IGFOvLxTUUr7EQoFwa/PuR6iOnev5IMqdN3dVBdFT5h2IVXk4b2xmAtD+w
         C+250C2g7IYRAU6UU6tGeEZvj7pLRlcYNLqZW1FOvQQjPs8+EC4OlpTKA6A4bQKB78vo
         b6c+HTP96c03z13es60MbTqHty/GnLQghwWU8ijLYBqU17fGkw/SOhCL1fiebLXtHWDm
         kYcFpWrGxh/lJf+ZFVmpFHeCUrXMV9KFLyYsouiudN0h+w6Rh1vmEUqJNAORtk9X+0Op
         nY8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id m19si23718585wrf.445.2017.11.28.09.34.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2017 09:34:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eJjlo-0002Ce-P0; Tue, 28 Nov 2017 17:34:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/arm/nwfpe: Check coprocessor number for FPA emulation
Date: Tue, 28 Nov 2017 17:34:07 +0000
Message-Id: <1511890447-13601-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: ybE+hAuamXFV

Our copy of the nwfpe code for emulating of the old FPA11 floating
point unit doesn't check the coprocessor number in the instruction
when it emulates it.  This means that we might treat some
instructions which should really UNDEF as being FPA11 instructions by
accident.

The kernel's copy of the nwfpe code doesn't make this error; I suspect
the bug was noticed and fixed as part of the process of mainlining
the nwfpe code more than a decade ago.

Add a check that the coprocessor number (which is always in bits
[11:8] of the instruction) is either 1 or 2, which is where the
FPA11 lives.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with a chroot of arm debian lenny, which is the last one that
still used the calling convention that mandated use of the old FPA11 FPU
and thus needs nwfpe emulation.
---
 linux-user/arm/nwfpe/fpa11.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index 441e3b1..f6f8163 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -137,8 +137,17 @@ unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa, CPUARMState* qregs)
   unsigned int nRc = 0;
 //  unsigned long flags;
   FPA11 *fpa11;
+  unsigned int cp;
 //  save_flags(flags); sti();
 
+  /* Check that this is really an FPA11 instruction: the coprocessor
+   * field in bits [11:8] must be 1 or 2.
+   */
+  cp = (opcode >> 8) & 0xf;
+  if (cp != 1 && cp != 2) {
+    return 0;
+  }
+
   qemufpa=qfpa;
   user_registers=qregs;
 
-- 
2.7.4
