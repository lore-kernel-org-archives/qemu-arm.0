Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026299lfb;
        Sat, 9 May 2020 06:09:18 -0700 (PDT)
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr8236080wrm.72.1589029758574;
        Sat, 09 May 2020 06:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029758; cv=none;
        d=google.com; s=arc-20160816;
        b=Wmw97xnx+TggElot5HBoiJy70HS7rHdaJfKXuLMiPAOTuI4zgYQ3+zSwxeRzIA1+8G
         7wyuMWR2y2W+tW5XFGluAkJJ+N2dux+BHzFGFCnZDxKqcz38/Kc0xWKNdeusm71MGq+/
         Bc5FFw1an7gyOqewQbLPJYuoa7UwR9m6CWqC0rsJiGCFWPA5uAKF0vXq/HCIL0Ixdr/h
         pdzKZrNuZjnjMR4rwdyv13fBpL7Ssl37LsTb5WURX/hbkEBjA2Pc2vLJ5nREVf7Y7G3i
         DDQq4xYGjOEANIJ9CO0idIEM8GKA5JWtg8o52shTxxMb6y1uZOTYICFwSnZ7qnTYiEZ2
         Bb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TeWtSAei3ep1DJcrXDtpu+82w6foJlJk1rjchgbdgfo=;
        b=nqajeXWauNZsXNoX9Fai4XqtYOQSWqLiYpkg97rfu2q9N4haFUMs+awO9SQ93fFNWy
         HSvAigs5D/tDyKgCNM6zvq8sLKZ8i0+Z1hWqGjjsBYHeRx+482S7K3etrMgWC4ukt/MU
         IG5QlFyvYBuNeb8aJzqj7cNf8YA5qK3uHIGUp8SEwtAXNdy/eoXWi24oHIXmGLo1WrVs
         i5GH0bn0Q5Xw9c+Vwpi5o1+4by1azRhbWpBDnDUnDzBQ+L77oP3XQTUGH/SHi9qZNZhC
         AgZnE/8SzXK4RG+Q6pMk3A5BVK0riHn10KcL5BwrzfrvEsOpglwVLQ6X2WM0NDOA/RsB
         zSuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVDqgvQ0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b85sor7884450wme.12.2020.05.09.06.09.18
        (Google Transport Security);
        Sat, 09 May 2020 06:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVDqgvQ0;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TeWtSAei3ep1DJcrXDtpu+82w6foJlJk1rjchgbdgfo=;
        b=FVDqgvQ0ukrRJhtKvI+c9JPloXHMWIoy4AmFxurl2ULEWeMwOVaSrI1H5mBNVyd+H1
         Ed95DK3yvQ4R/SlqX2RCwHGKz/P19lTQd0mUepd5K91LqBkDxhjIlkXh//7fOecLtnL/
         r58B6l/H4/FQ2PUD2TtH87WSEDAle4hkIVJRdXeRybIVjl21R8MIuCc4yRUQUPToZ6lG
         SRAuTKsLgWJdL4s5CCiNuuX546BqvIFtJkUUu5YwAancGKkw+JLUcHNgt5tWiS/gndED
         D5+gmz1DkoKQfL1Dy+dft260i0kfLg6ar12XmZgV7hqsRhdfAF0HqCC2Z1QqjN+bVGtH
         D44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TeWtSAei3ep1DJcrXDtpu+82w6foJlJk1rjchgbdgfo=;
        b=Zs4aDYhseLyWR6XYGW/n2XyXE2Y35CT9SNPoyFgx62sK9v1140U7//AixEk9XPauho
         4GfxQcquH7TcC1ezm1tf4jPQalTO/xodIi2OC1yKJoUvtAErtPrAxNeMCjzkdtjMe08f
         xCpWKsX1w/dQaNKHnVVwd7aSAZqCZBx0QSHh/laTDDai7P5+94cwtARiCrOYqO3Ds+PI
         r6tCFYxPlsd9bMzqInLwJPXQNjvFdQd4p5806h4cMWnlpkaWimj6qspxXN62reVO3j4x
         LirlJxhih4oUshOfTnKpfTFmFDBdzXD9tXZNXe0F1Lro9hw9hbX6eDww8dqtHqTuacWr
         nGSA==
X-Gm-Message-State: AGi0PuYWk2LR29AXwJVe3oNWAw7bJd4uf30Cdw1buvuFtx47SZEilB5N
	1URrSqq1U2/el4lKnYkVEp4=
X-Google-Smtp-Source: APiQypK3virEnIkWexu8Mf8qsHDhzVfpImcldIBfa3jsD5SK4vyes6cGvXjwqv8wQQgx4WnoNRS06g==
X-Received: by 2002:a1c:f306:: with SMTP id q6mr21073205wmq.169.1589029758217;
        Sat, 09 May 2020 06:09:18 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:17 -0700 (PDT)
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
Subject: [PATCH 01/11] plugins: Restrict functions handling hwaddr to system-mode
Date: Sat,  9 May 2020 15:09:00 +0200
Message-Id: <20200509130910.26335-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: YqxBQimWvYCE

Restrict qemu_plugin_hwaddr_is_io() and
qemu_plugin_hwaddr_device_offset() to system-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/qemu-plugin.h |  2 ++
 plugins/api.c              | 17 ++---------------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5502e112c8..06c271a107 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -326,6 +326,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
+#ifndef CONFIG_USER_ONLY
 /*
  * The following additional queries can be run on the hwaddr structure
  * to return information about it. For non-IO accesses the device
@@ -333,6 +334,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
  */
 bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr);
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+#endif /* CONFIG_USER_ONLY */
 
 typedef void
 (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
diff --git a/plugins/api.c b/plugins/api.c
index 53c8a73582..785ad2e45e 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -249,7 +249,8 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
  * Virtual Memory queries
  */
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
+
 static __thread struct qemu_plugin_hwaddr hwaddr_info;
 
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
@@ -267,26 +268,14 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 
     return &hwaddr_info;
 }
-#else
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
-{
-    return NULL;
-}
-#endif
 
 bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr)
 {
-#ifdef CONFIG_SOFTMMU
     return hwaddr->is_io;
-#else
-    return false;
-#endif
 }
 
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
 {
-#ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
             ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
@@ -299,7 +288,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
             return haddr->v.io.offset;
         }
     }
-#endif
     return 0;
 }
 
@@ -308,7 +296,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
  * will be. This helps the plugin dimension per-vcpu arrays.
  */
 
-#ifndef CONFIG_USER_ONLY
 static MachineState * get_ms(void)
 {
     return MACHINE(qdev_get_machine());
-- 
2.21.3
