Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026693lfb;
        Sat, 9 May 2020 06:09:47 -0700 (PDT)
X-Received: by 2002:a05:600c:20c6:: with SMTP id y6mr20813686wmm.131.1589029787338;
        Sat, 09 May 2020 06:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029787; cv=none;
        d=google.com; s=arc-20160816;
        b=E/u/Aj9/hWsse8fk3qEgrH9RlcZWU0RxliemLYDlgqLbtNZmgmX7+89gnZlELUcdb5
         fhDQVxuibpKGAqrWbTkOqYhXgAlFiOHnY10lFIHFP7EXIZH8XuN0xjxJU0i0Fx3cEUi3
         trLaZhSq/5/ZB3eBu4X28YgIyOiSeRTVtfIitKe9eJfjg0pO6mvkI2gfFoZAM46J7m2S
         0v+z8hjiJ3SWOwVXUvA5UAVAzL9ov1dRupVFkH2wEb+Y4DnKOlP591DTHWSsAnxstcU0
         5DyCvI5d/cRBrPno0c02Y9/+EcjC0M8m2nEjWr+V5ZeIGznGhRx2e9uT0QoOt+/U3aNq
         LVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=FhXzEDZMFN7nI/HcObjzYIjU52XHskJ+5ArXsA4s8n0=;
        b=vFD2PJNZrZODvc7YdnMxKY+2c+HBGW6Otrlpfr/ywgkgCBTmXqnPq/l3KJaf/QG6Ao
         hUpGWeczwGvdw2l63UezmW4SjOBDy8baK+qNxJAYa7ydVGrLNFEeX2n4iJ4C0QkaBQFz
         QKxvT3uyrE4QuZisoI9fsGrDGXRM1c7P5biVBAaucpqoB5X9igLNc7VNJhK/t2kfEo4k
         SZz+dumAdcEEcbI3YMk0hW5SE/Q/pJuPi5iedsrR/4lpn7kWNuBIhxdRXzP8llJi8+nt
         g30578AjRxwSk5MyaITLnow3Lrpv9PNFtn4WdmO6ILqj8mr9RRXVUPZG60qTB7RPJUgp
         9EHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMA+dOHP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q142sor7984473wme.6.2020.05.09.06.09.47
        (Google Transport Security);
        Sat, 09 May 2020 06:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMA+dOHP;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FhXzEDZMFN7nI/HcObjzYIjU52XHskJ+5ArXsA4s8n0=;
        b=tMA+dOHPorUcef3Ii8plnVwx5/I0le3h8ZG+eca+U8AHmyZPa1SS3f3WuI15TwaqMj
         dp9D1WaZwrnsb5FDXqtTKtmj9ql7Ri9+E8lUya6BaANZi94a9jnQGJI6G4UF9TPdagy3
         OgmgfqIWppS9Pv6g6oO0G49S6T5H9O2kFz53VTuxNlRRSqGgB2PYtlmYAhUAAIgl/CYG
         HU4xvfI3vTtrbHl3Tih+sk24b+RCb6pHPSaM+TNWHXOX0xGVdE/7Gx1IYmx3SoM0UFHV
         VJQOMdVbuLbFyNLdR4Iii9ly1xsgPL8IN+1T7566Y3evQ9HqdPdME6aN9M/UwH5+GcKH
         jFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FhXzEDZMFN7nI/HcObjzYIjU52XHskJ+5ArXsA4s8n0=;
        b=svu0okwf1RlkUStCBY4H/YH3UfshGQMtzDrLrthmBaBtEYjM6+CEFSf5KKKC5zOBr1
         mp59/8ieMIHPZ7JVntvlO0QdH8K+/FswqJzM8o2e0yIopeXup/6jOndgP2AAAfE5uUTe
         a7LF+Tt9s16+AOkLxRTdg5d5xWwKHg+d/B1fbyJrEIwFGAVmuYFsOPPPslQ0pb4qJ12w
         wPnTRlKj3DLDoxGabhcmiWPrhuyVprc53NTe9b8rtqSDzrPQxRBLHMdOpTHtTLXfSI2Z
         4rVEZcaCMSKdqPWcefl/yCYwcpqfKJLJfPsbBJCKmBIfiAUFlzBc/dNK5rIuewNYakth
         vOCw==
X-Gm-Message-State: AGi0PuaMQMRya7RjDuaK7I3KzGPkpIvW+7SPdnZ6IzdJ3eQMHkbmRGn8
	uPpLwmP+gK/BpN0yNWqzfFI=
X-Google-Smtp-Source: APiQypIPiOQOoy1QDhlipK4I1Af7DTsG6G0dwlgqBHdFcvssaN5XNM/0LHVECJmyi5GMwxGZeM77rg==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr20571336wmi.173.1589029787021;
        Sat, 09 May 2020 06:09:47 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 11/11] exec/cpu-common: Poison hwaddr type in user-mode emulation
Date: Sat,  9 May 2020 15:09:10 +0200
Message-Id: <20200509130910.26335-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: LZ59bs3wEnke

The 'hwaddr' type is restricted to system-mode.
Declare it poisoned on user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Checkpatch complains:

 WARNING: architecture specific defines should be avoided
 #10: FILE: include/exec/cpu-common.h:7:
 +#ifdef __GNUC__
---
 include/exec/cpu-common.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index b47e5630e7..56cfce8153 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -3,9 +3,13 @@
 
 /* CPU interfaces that are target independent.  */
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+#ifdef __GNUC__
+#pragma GCC poison hwaddr
+#endif /* __GNUC__ */
+#else
 #include "exec/hwaddr.h"
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
 void qemu_init_cpu_list(void);
-- 
2.21.3
