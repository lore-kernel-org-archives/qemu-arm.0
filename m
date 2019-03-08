Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7813589wrx;
        Thu, 7 Mar 2019 17:44:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYIiTAYjctB/mr9PGyxDU2sAMANJIvzfVx6ig01jX9u8i/bXviwQqpw35+Y/npHiV1bYse
X-Received: by 2002:a81:3a0d:: with SMTP id h13mr12915849ywa.224.1552009458007;
        Thu, 07 Mar 2019 17:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009458; cv=none;
        d=google.com; s=arc-20160816;
        b=SO+kzzEmhJvW5a22NftX9fSarunTM2rWDRoA5csLP29G510yIPEODxKlPyEXuewfeU
         2VUkQRPV44VEjxbrQIsODLEmTm7l4kkMj4s7QDEiLzNpNz7PibnZjeGQMnFY+dM+mWeW
         fPY9NaLDiagp6l2Nmt3chod6LhV2URssUm0F1RkkGwp1A38ZtPpy89Km1VmHfUe5+731
         vC9y9xX4pJiW64n/va1L0pl5+zvCFVTNG+/TMFi6kx0wbmePYs6Sb2LIXx32b9OTVUg0
         Z+TUiHcIDKoEuXlUDSYn6A8Ogcpkd/Q5P//DODhdZT9yk0FRjtYROvNXXO/h/Rf+lx7E
         e6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6GFgI6dOesbajjvt0EdxDc9nyzRZH0WWODhEVpvCfhg=;
        b=HpNfFzExWXB4PO3eGCLcuMF8SkMBitsSLN82vNsP124JvCdrGL591A+W/WOsI6PFOp
         HqYYCIOwLMQpw0Kss0GUTitW5rsypBgozJB3WK8pzoNLCj5U+zv3rik54r1KwDFLtrdF
         shB6VVl4oCgACoh2qK2B2sbpDTdt4bYfP7sVVBXmwfnzJrezjqkGfE2rtbohxBAZ7Zdk
         1ETGAkrehfh+FrE3WybTwZ3+tKG+/Typ1+QzGKdtfmHASOOubgoT5zqshORbe+zOG+0A
         ZP4c/wqPYsmK44V1jQWURcBDInlic3/xgtKynXcs4kmYA+ngWPq/j50MerlC5/ZrFR2R
         VRiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si3775825ybt.122.2019.03.07.17.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24Yb-0003MF-Ck
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24PL-0003Sy-Vj
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:34:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24PL-0002G5-1W
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:34:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24PH-000297-U4; Thu, 07 Mar 2019 20:34:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FD593092672;
	Fri,  8 Mar 2019 01:34:39 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 231C060BE5;
	Fri,  8 Mar 2019 01:34:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:15 +0100
Message-Id: <20190308013222.12524-12-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 08 Mar 2019 01:34:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 11/18] hw/nvram/fw_cfg: Add
 boot_splash.time_le16 to FWCfgState
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
X-TUID: Exz7H9Z0qIv/

Similar to the previous commit, use the FWCfgState lifetime state
to hold the 'bst_le16' variable content (renaned as time_le16).
Doing so we avoid a memory leak.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c         | 6 +++---
 include/hw/nvram/fw_cfg.h | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 182d27f59a..3ac6687a04 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -187,7 +187,6 @@ static void fw_cfg_bootsplash(FWCfgState *s)
     /* insert splash time if user configurated */
     if (boot_splash_time) {
         int64_t bst_val =3D qemu_opt_get_number(opts, "splash-time", -1)=
;
-        uint16_t bst_le16;
=20
         /* validate the input */
         if (bst_val < 0 || bst_val > 0xffff) {
@@ -196,9 +195,10 @@ static void fw_cfg_bootsplash(FWCfgState *s)
             exit(1);
         }
         /* use little endian format */
-        bst_le16 =3D cpu_to_le16(bst_val);
+        s->boot_splash.time_le16 =3D cpu_to_le16(bst_val);
         fw_cfg_add_file(s, "etc/boot-menu-wait",
-                        g_memdup(&bst_le16, sizeof bst_le16), sizeof bst=
_le16);
+                        &s->boot_splash.time_le16,
+                        sizeof(s->boot_splash.time_le16));
     }
=20
     /* insert splash file if user configurated */
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 99f6fafcaa..fcb771186c 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -55,6 +55,9 @@ struct FWCfgState {
     MemoryRegion dma_iomem;
=20
     uint32_t reboot_timeout;
+    struct {
+        uint16_t time_le16;
+    } boot_splash;
 };
=20
 struct FWCfgIoState {
--=20
2.20.1

