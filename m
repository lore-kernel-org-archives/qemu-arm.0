Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7808861wrx;
        Thu, 7 Mar 2019 17:37:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXSui5YPNSeufOxhlbKAZS8PQry1LGOe68WE9IwSFW1EjHln7pfkZxRPijCQjql1wZJUpQ
X-Received: by 2002:a81:5f86:: with SMTP id t128mr13031896ywb.467.1552009043716;
        Thu, 07 Mar 2019 17:37:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009043; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYcnB3eV4HvcfAL9E6h1pSrjD74JKCzSdgOG7DMrZiDJeWGuvaD2jJCaNmAW2zanxu
         WxDqKtIss3fa6rt+2rjmM5X/kFCxVWx8ZSbSt+qwvUR9dbsXSfiJQRwvbZzwQA9gZMYR
         7fGclvuvbgUzLvb0PGmpdwiYWpPH9mltLrk6T/lyehb/qpQrl6/abZHMVTJ/iZlWXsv5
         d2iTZA2jto0EAd8ILO75SQnPNWFipBpyW4Bh922NNd+zN4heu0wh3kmXK5v0jSHDy0rs
         4IcNs95q3JVJVF947SlkX9wft9Qqey7H83bwTqbhh6scepPcaMJWG0XsE6qEtu8Qa/i+
         PQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gbGs6Jlp4983PbkGBg4ev6EIUrYO4hkDO5LAXSJ9CKY=;
        b=N8Ezp4MN7BiHKQQxQ3G+7cyQnAlePwiieRruag9FblvXUM92dLZMrgGjiBt01ujwpm
         t5rzAxuYQTaVWvlFw/psM3gmJz/N70joCfLIdpfrkuwPX6kkZNFeaHVmqRTfzHknuhCW
         lj6nyNArb/+g00ycvdW9aRt6jXuikiYNcT2XZ+W750aLZRsHSY/5O/oKBAoGVEXtU33F
         xmIQjrWaIW3VKRCobwP7cByYqVCt/GHy+0YBYv8rrv8e556/wmH+GXol3SN8uURYkTLU
         r5l2UUoIKTq0t2L3YU44lMbW9UvvZuSFxRGXtPdQ3lMP7Ej2yql5AGtiwrfcFkisk7aP
         NGdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q127si3528508ywq.162.2019.03.07.17.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:37:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24Rv-0005nW-3E
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24OT-0002aP-Ly
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24OR-00014f-FK
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:5916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24OM-0000vD-F4; Thu, 07 Mar 2019 20:33:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9788DC053FDA;
	Fri,  8 Mar 2019 01:33:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 685E660BE5;
	Fri,  8 Mar 2019 01:33:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:10 +0100
Message-Id: <20190308013222.12524-7-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 08 Mar 2019 01:33:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 06/18] hw/nvram/fw_cfg: Remove the unnecessary
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q0YLXssDPKV9

The 'boot_splash_filedata_size' was introduced as a global variable
in 3d3b8303c6f. This variable is used as a 'size' argument to the
fw_cfg_add_file(). This function has an interface contract with his
'data' argument, but there is no such contract for 'size' (this is
not a referenced pointer).  We can simply remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c       | 5 ++---
 include/sysemu/sysemu.h | 1 -
 vl.c                    | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 8eb76a382c..b2dc0a80cb 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -217,15 +217,14 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         }
         g_free(boot_splash_filedata);
         boot_splash_filedata =3D (uint8_t *)file_data;
-        boot_splash_filedata_size =3D file_size;
=20
         /* insert data */
         if (file_type =3D=3D JPG_FILE) {
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
index 89604a8328..6065d9e420 100644
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
index 4c5cc0d8ad..fad6fec38c 100644
--- a/vl.c
+++ b/vl.c
@@ -188,7 +188,6 @@ const char *prom_envs[MAX_PROM_ENVS];
 int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
-size_t boot_splash_filedata_size;
 bool wakeup_suspend_enabled;
=20
 int icount_align_option;
--=20
2.20.1

