Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2444327wrp;
        Thu, 26 Sep 2019 10:53:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyL3sLAFS3wJadrPlDr8skdSOV4Zm9tkdtrem6/WR3/iuwYiFXA5xDahfOKE2UICcaorRHK
X-Received: by 2002:ac8:5043:: with SMTP id h3mr4977868qtm.99.1569520426765;
        Thu, 26 Sep 2019 10:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569520426; cv=none;
        d=google.com; s=arc-20160816;
        b=I0eaygbNMuvR5Eb7pIq6Ht4WO08Hfx4r+oPveBd1LCmgzqD7PK6rfGxYchfuWp8h8r
         EL8XS6rtQXnLT3NiI2b6QzkHeQCXGAMoDQfrkW01hJpl8ZNcV/kd7VrNGljL7GRs9f6h
         W6kZpju2RzfiBywtBBdml5sKjMT8Nxfw7RWy+4V3VBHs4Bvj+bVxnOLlkMjsH8d7r5MV
         9zehwV7sTpugq6fLbufi7I2e4CXZB0FykJ2nytyt0P1r9ASm1qPPvQQdqYvjBckVMIXj
         i4I/H5mA+dy7BikJDW7miL5gKozJqoxJVReS2VJ6n7Hbdcvk6Im4UZx02ugv2v6wi75C
         l1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z54O11bD1AbofRei7LiG1f1sZB2nRqAkLzkY3rTTmZI=;
        b=00g8fZmASwY4cXtLfvhajYYbpRVMjNIRbFBHgz33yWtphySdNE/qD+IWLT1vydM96l
         fw1zaYJf1tKi2SPfD5nBV7UqzOpT/DwXQEXrlM+WtuWZQLNoTKJljGKvcx5DWyCTMYkG
         LZUdEwRgUMEbJrqT2HiJxxnUPxM6CxH4y/16t3bwPBoaM1nFDuE4lagyNW+d1/QZyFaN
         6Gil0XC7/Vcdr//XjOkOAGGSz9eodxzMvxUvJtMbOP8IaE/lKhbulgVlbMzLc+AieFqj
         awx87Wp1G2PbfxeRK7EK7a2G3sxSUYr94ASphblhhr/ZlhtP5VaofttwVW0T724keWUn
         GiOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t7wXGZvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si2229020qta.90.2019.09.26.10.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t7wXGZvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDXxZ-0004Co-Ae
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgY-0004qU-MM
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgX-00039N-E8
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:36:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgT-00036d-V9; Thu, 26 Sep 2019 13:36:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so7136180wme.0;
 Thu, 26 Sep 2019 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z54O11bD1AbofRei7LiG1f1sZB2nRqAkLzkY3rTTmZI=;
 b=t7wXGZvq12V5hEcgfvWVIZ+8SGse2gghokboAfHp0r+y6hhBb7A6uUVCAUdjhkDuOJ
 f2H0Zwf7hpMlRI7IyR4roEyhRs21f/LUXCd3wPGbFioe4Ii5uUe/t247FcsMbTMDJf9G
 wDEd9bgC7FXkFYJe5L+eYClcAcfxPH3DERjK4QelVCp24B+tQmg8/DeuK2FSwUuwoOGv
 LGv9NdF0hW0BjD/XdEgRn9EjN8GZ4yZ0MM/akgUq+Pu5k0FA/t7pOkYY/Ptqn17C6U1c
 unKCATtFbHK91Udn7J5rCbRMoLfKbfJvZkBNENokX1ZLDFz+MVqeuN51GanpmpYm8jXW
 p/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z54O11bD1AbofRei7LiG1f1sZB2nRqAkLzkY3rTTmZI=;
 b=cDVMv8GkPAcYxaG3dkZOnXUgS3UWa3q8ypfhT7tLWLxhwp8aUsIVPfzcoTugrfp+j3
 DZQrEIZgQPLJ1LnKCK2gfTJiYCDuYjQbVWgHgX5QqAMgUeO9jJYh2pNipCMRdg1FIkl9
 tVZ/NsndvX8OO8dGF8uwkxKWqr2d0R+PuJKP8T2I+HwUv3K2H8lfXkNCAsrE1sAS/tsx
 W1/0CX+/9wNl7csIDGOTiNWWwOnUen0md3edxna9dFEK194OafMjfPgg+9kwq25h6x+3
 F1dN1fpcx+adBLyzsMpyXStAjrgAglszD/2w+3fMqrO0FXHU16PqQPlJjaliUNllc6Rj
 TM6w==
X-Gm-Message-State: APjAAAXkkYAv/nvuV+3l6C+slXmAbuJ50VjQOoWtjPmfPk38Z7a797FR
 wr7uCMeXdGyve11N8yq9tSVjMqosV6U=
X-Received: by 2002:a1c:1981:: with SMTP id 123mr3901961wmz.88.1569519304847; 
 Thu, 26 Sep 2019 10:35:04 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:35:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/19] tests/boot_linux_console: Extract the gunzip() helper
Date: Thu, 26 Sep 2019 19:34:23 +0200
Message-Id: <20190926173428.10713-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/FWgUyWgsBv

We are going to use the same pattern. Instead of keeping
copy/pasting this code, extract as a local function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8a9a314ab4..079590f0c8 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -19,6 +19,11 @@ from avocado.utils import process
 from avocado.utils import archive
 
 
+def gunzip(in_pathname_gz, out_pathname):
+    with gzip.open(in_pathname_gz, 'rb') as f_in:
+        with open(out_pathname, 'wb') as f_out:
+            shutil.copyfileobj(f_in, f_out)
+
 class BootLinuxConsole(Test):
     """
     Boots a Linux kernel and checks that the console is operational and the
@@ -166,10 +171,7 @@ class BootLinuxConsole(Test):
         initrd_hash = 'bf806e17009360a866bf537f6de66590de349a99'
         initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
         initrd_path = self.workdir + "rootfs.cpio"
-
-        with gzip.open(initrd_path_gz, 'rb') as f_in:
-            with open(initrd_path, 'wb') as f_out:
-                shutil.copyfileobj(f_in, f_out)
+        gunzip(initrd_path_gz, initrd_path)
 
         self.vm.set_machine('malta')
         self.vm.set_console()
-- 
2.20.1

