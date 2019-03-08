Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7811760wrx;
        Thu, 7 Mar 2019 17:41:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqycuCnOvcKoUXab9FTcgA3ED8SnnK+qVH04XnqDOupnYEnt5Ag3eOk8mLn9JesGEKugLZ2q
X-Received: by 2002:a25:df41:: with SMTP id w62mr5691335ybg.219.1552009298675;
        Thu, 07 Mar 2019 17:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009298; cv=none;
        d=google.com; s=arc-20160816;
        b=sd1CHzznA+kE2Y2nJnlrbF+oshyQQHrJzqCoE6Zhmi7sbWv37ua0yl8Jhdw6e54fpr
         K82VLKMOFwNXVNpvPHYenAMjjGrre6fQEDJAr13/+4n+DVEX/3nQI2ecM8c7ZmRt8PQr
         zozKVhSUMnDEBHdaerL/9K0+fujcDhnkqn/Tk1fu+5vmIhg++HuXQsW/YDuKd5sCoXZS
         imUijXQHWPW7aE0/YmP0vWLaWVTRS1U4xSbSxLg7LbtuJSvgEoO2gIk/n9C8qvIf6HvA
         rdj0svOM0DCEvdzgRI4tFoBrbsXWYke2NaAQE4qbTNW9b9cw1YWPYWy2ekshWMpEdfgf
         TzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4JLRWCj7OZ6/BedhuQWNy+WFaL41G4FjLlXlldVpYek=;
        b=XiacD1z6HYX2yYVb3QEY1AmGFxxUSpEH6j8A/0HG+0D5OIyH4jYqSlc88Jrq5GSDlw
         BXnbWFLKQTV/42zU934WRFD2fGejw3id1nMCeMCtL1S6UgYe2aToOximBzacgng4q44f
         GvMYISZT7vBOzU8436Xx2tTB45DyTpNKbvlCgT4BXhID7r+eJ3pnZVZ3AO4iXgBtWSut
         cCvojBD2ll1t7DZcPNkrGJfigrKRox0xYLeEIzAEtpsxyrsN0bV9QswMev6lOVs6POWd
         UMKJSoSm4hFbdxUxKxgFiT/99KDDNYlyWauL4RjHFPYsROy3RV57IpIHwiAfhjy14AUN
         BJfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q123si4015564ybq.57.2019.03.07.17.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:41:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24W2-0000jh-44
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Q1-00045g-Hi
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:35:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Pz-0002xh-HT
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:35:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Pr-0002gz-Oi; Thu, 07 Mar 2019 20:35:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B13A53084247;
	Fri,  8 Mar 2019 01:35:07 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7B7C60BE5;
	Fri,  8 Mar 2019 01:34:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:16 +0100
Message-Id: <20190308013222.12524-13-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 08 Mar 2019 01:35:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 12/18] hw/nvram/fw_cfg: Keep reference of
 file_data in FWCfgState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lv67tXw3CA4R

The 'file_data' is allocated by read_splashfile() (introduced in
commit 3d3b8303c6f8).  It is then used by fw_cfg_add_file(). Due
to the contract interface of fw_cfg_add_file(), it has to be valid
for the lifetime of the FwCfg object.

Keep a reference of 'file_data' in FWCfgState to be able to
free this memory in fw_cfg_common_unrealize().
We can now remove the res_free() from the main() loop.
The global boot_splash_filedata is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c         | 10 ++++++----
 include/hw/nvram/fw_cfg.h |  1 +
 include/sysemu/sysemu.h   |  1 -
 vl.c                      |  9 ---------
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 3ac6687a04..fc392cb7e0 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -215,16 +215,16 @@ static void fw_cfg_bootsplash(FWCfgState *s)
             g_free(filename);
             return;
         }
-        g_free(boot_splash_filedata);
-        boot_splash_filedata =3D (uint8_t *)file_data;
+        g_free(s->boot_splash.file_data);
+        s->boot_splash.file_data =3D file_data;
=20
         /* insert data */
         if (file_type =3D=3D JPG_FILE) {
             fw_cfg_add_file(s, "bootsplash.jpg",
-                            boot_splash_filedata, file_size);
+                            s->boot_splash.file_data, file_size);
         } else {
             fw_cfg_add_file(s, "bootsplash.bmp",
-                            boot_splash_filedata, file_size);
+                            s->boot_splash.file_data, file_size);
         }
         g_free(filename);
     }
@@ -974,6 +974,8 @@ static void fw_cfg_common_unrealize(DeviceState *dev,=
 Error **errp)
=20
     g_free(s->files);
=20
+    g_free(s->boot_splash.file_data);
+
     g_free(s->entries[0]);
     g_free(s->entries[1]);
     g_free(s->entry_order);
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index fcb771186c..83a0540b6c 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -56,6 +56,7 @@ struct FWCfgState {
=20
     uint32_t reboot_timeout;
     struct {
+        char *file_data;
         uint16_t time_le16;
     } boot_splash;
 };
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6065d9e420..3cd856b015 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -109,7 +109,6 @@ extern int no_shutdown;
 extern int old_param;
 extern int boot_menu;
 extern bool boot_strict;
-extern uint8_t *boot_splash_filedata;
 extern bool enable_mlock;
 extern bool enable_cpu_pm;
 extern QEMUClockType rtc_clock;
diff --git a/vl.c b/vl.c
index fad6fec38c..47dd63a309 100644
--- a/vl.c
+++ b/vl.c
@@ -187,7 +187,6 @@ unsigned int nb_prom_envs =3D 0;
 const char *prom_envs[MAX_PROM_ENVS];
 int boot_menu;
 bool boot_strict;
-uint8_t *boot_splash_filedata;
 bool wakeup_suspend_enabled;
=20
 int icount_align_option;
@@ -558,12 +557,6 @@ const char *qemu_get_vm_name(void)
     return qemu_name;
 }
=20
-static void res_free(void)
-{
-    g_free(boot_splash_filedata);
-    boot_splash_filedata =3D NULL;
-}
-
 static int default_driver_check(void *opaque, QemuOpts *opts, Error **er=
rp)
 {
     const char *driver =3D qemu_opt_get(opts, "driver");
@@ -4591,8 +4584,6 @@ int main(int argc, char **argv, char **envp)
     job_cancel_sync_all();
     bdrv_close_all();
=20
-    res_free();
-
     /* vhost-user must be cleaned up before chardevs.  */
     tpm_cleanup();
     net_cleanup();
--=20
2.20.1

