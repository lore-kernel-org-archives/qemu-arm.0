Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp992743wrt;
        Mon, 11 Mar 2019 12:17:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU7Zlpm1fgS8Gh2dRuf9SuT8MaMXX2xO0FMM3vLyAPCAXWPh9wEDuN0h4S+3JkBH9R496/
X-Received: by 2002:a25:b211:: with SMTP id i17mr28511344ybj.122.1552331869975;
        Mon, 11 Mar 2019 12:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552331869; cv=none;
        d=google.com; s=arc-20160816;
        b=0WzMYlpcULBLQTVZyDCEUT3me4p8eK3BrdwqItUhAcT9fR+mS1g0IqQtZc8Zbe6V4y
         moxFAFUuLf30TcxmCPA/qBrL351IfKhUJwKYf/GVfM1nV76Ydf/52ONUbHwe9IP7MFZA
         bAcohHJDuxW5T5FQaFdcfIWsr2lwuRAb8Ghuby4Aj11vPSz33fdG+5gSLKYNbqQsUGYS
         C9FncHOZ45aX6YPpdO5MbZNTu9mQx5Om8KT7YG7OpYZgIXvpX72VFmyDrVBj5l/Adh3v
         LYA5IcEOEbPS5837GsglyTlaRj9yG6/BCYeDnFSbzV39XsN+9qC2XIpEwdy+gJztOB8r
         7+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7vuZr3RBZHru/PnueYt8xkKcm1CTp8HnzCL9dRblxWA=;
        b=Gy+vo1UrHvVNciF7M2/RWtNWVtBi+YQhoIStNU+eGRK8lCubkCcvM1iPC4f28nc9N0
         PvI/UpfdoF13CvW4Qs142t+iU8X1N6/sJhcTylTIAlq9LzXitf/B8L2TdJ2TU672jUeI
         6+c/VFro43NNaJBOstYRRsPRAO0JENC6fv628vBGBEPPM3vwgQ71GY8q5sXTDm5/abZU
         jzbto+ZvbNY+ydKCz49K6cSzm1Pc5VOofERvV0VdIPSsBoZadlFspw4y9piYfbsF0FTd
         VWx6RofOIMGM6zNibYq0maXdbMSqNxu4PA1gcqVejBqf3afJa99ufHcgPZQ5xYFgR41x
         /u+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si3522739ybk.74.2019.03.11.12.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 12:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3QQn-0001T1-FT
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 15:17:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL9-0005Rd-01
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL8-0003Zw-3R
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:11:58 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL3-0003Tv-JY; Mon, 11 Mar 2019 15:11:53 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MQMmF-1hPkXw1L8L-00MI6j; Mon, 11 Mar 2019 20:11:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Mon, 11 Mar 2019 20:11:25 +0100
Message-Id: <20190311191128.30562-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HFlQa10MD656FZ3YLA7NbZ2FXpyv7sOUhCkLAYKUokk0HWhpMGn
	5tpeCV1NOhjJEFzoaFuV/uFB40NlrAi8piP8FPwxvWX9xf/02t9MKAzU1ojjrKOwkgLonbT
	89gQgJ7EuC2f5f3tQy0IreDvFK42RZ2JnhEDekou+Xce1xUmmM8fEjPW2RlurA7qa2iytN6
	wsUx1lrluhyhUVNUQ5AvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yAvhZuhBY7E=:dMA1BqMbq4omhSgggHCYob
	V1Io0AJjQXvYZe9iZB2UFBuQRXI/vM9v4wN5y4Q7bA170jXVyTh3e8xFSj+PYFyQTT3eChNRp
	KizvYNRu7YVnhHXr57rCH77kPEpyVySAH/ZPlT0if1rOiiUfJdJ89d18b36vTkGBbIpBlIop2
	pU5X/xoqMOWQG1EPmC+Cuh1Lr6ZK1xilATn71grzIsCA1gQt1FvgTDqd7bYwYlhP5Tn4foroF
	RmMwMdA+vTgod5SVIdRJQaiqrp2zWrrm8UAbiP/OEldlNjcyPjRcwGxU8a7jk2B1ypHvGVC4P
	YGEJUb5D2IPNZdUBRfakp/NdpzVipTdoQVqkdsvxxFanrGInfYilPk0yDh2xvcwjcXcx3gzQh
	MbWNZLQficwqkWUCDtUInlmS53WMWi3U83iBQeDy3fSOhCdfNvIPiUFTTTaB4W9twuctkdhkO
	GQr70ZepOoyMPZhC+cUcAieIHBve9KSzIZCG/kMPxsXweqlztMASvB45GQpr8O7/poEAdpGLd
	5QVbmsA8FmMF9n5FKeFnUOE9ka/AZlRdSlfG88ibU9nejwUmd7lmqp1vzRkLaUm27/l2U+uaS
	RxvNH39beo3OUOAufJQZGj0o2Qvbw3mjMY1OEDZP74KnbAzP7ftkvielNkd1bfPW2ccbpRH0a
	qE2sWR1UPTUjBqydlY21S7q3G0ukulFFULw2i7WDLKbIkjWXYKJLNE+0vovRjGyN8tC39zBIM
	Bp7t/KxIFENQ8NsJnA6DhXqit1AjH0A2IFti4JIWCylZYldcM3xlXn8w5k0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-arm] [PULL 2/5] hw/nvram/fw_cfg: Remove the unnecessary
 boot_splash_filedata_size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlKB67my1+c3

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The 'boot_splash_filedata_size' was introduced as a global variable
in 3d3b8303c6f. This variable is used as a 'size' argument to the
fw_cfg_add_file(). This function has an interface contract with its
'data' argument, but there is no such contract for 'size' (this is
not a referenced pointer).  We can simply remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20190308013222.12524-7-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/fw_cfg.c       | 5 ++---
 include/sysemu/sysemu.h | 1 -
 vl.c                    | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 7fdf04adc97f..13aab122889d 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -161,15 +161,14 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         }
         g_free(boot_splash_filedata);
         boot_splash_filedata = (uint8_t *)file_data;
-        boot_splash_filedata_size = file_size;
 
         /* insert data */
         if (file_type == JPG_FILE) {
             fw_cfg_add_file(s, "bootsplash.jpg",
-                    boot_splash_filedata, boot_splash_filedata_size);
+                            boot_splash_filedata, file_size);
         } else {
             fw_cfg_add_file(s, "bootsplash.bmp",
-                    boot_splash_filedata, boot_splash_filedata_size);
+                            boot_splash_filedata, file_size);
         }
         g_free(filename);
     }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 89604a83282b..6065d9e4203a 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -110,7 +110,6 @@ extern int old_param;
 extern int boot_menu;
 extern bool boot_strict;
 extern uint8_t *boot_splash_filedata;
-extern size_t boot_splash_filedata_size;
 extern bool enable_mlock;
 extern bool enable_cpu_pm;
 extern QEMUClockType rtc_clock;
diff --git a/vl.c b/vl.c
index f46f8d769a5c..483ca17c6830 100644
--- a/vl.c
+++ b/vl.c
@@ -185,7 +185,6 @@ const char *prom_envs[MAX_PROM_ENVS];
 int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
-size_t boot_splash_filedata_size;
 bool wakeup_suspend_enabled;
 
 int icount_align_option;
-- 
2.20.1

