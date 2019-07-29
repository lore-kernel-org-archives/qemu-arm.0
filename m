Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3252201wrv;
        Mon, 29 Jul 2019 08:04:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8LgkN/dFGl29AOku9cX3psKinmHxiVNbWPHi/v1OU4xwQwW0CcjDP2yjczUxz/z5gNQrb
X-Received: by 2002:a17:906:5806:: with SMTP id m6mr22166741ejq.80.1564412674026;
        Mon, 29 Jul 2019 08:04:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x42si20137625edx.239.2019.07.29.08.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=jnmf5LB0;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7CS-0004oN-W5
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38469)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs785-0005Jr-O0
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs784-0005Ru-Nl
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:01 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs784-0005RC-FW; Mon, 29 Jul 2019 11:00:00 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id AFFD696F92;
 Mon, 29 Jul 2019 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGORLyVsyoPn4CUafp3DkuY7BxPSGvVkEp7R/gpfDbs=;
 b=jnmf5LB0kusot6raukquz8lPwMXc9zV2FeRAcofzOXMmmKd1jRsLpvbl1ViZVyEcCbQUCS
 SO27AlK946/F7M4vxFkmM/9qNwA8kgdMEjhsr2hrh4Gj0XCf1iJJ0t/rIDAMlf7awXDESB
 lNlyPzqbxMQjKEK9UqGe50uy8ekVJH4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:40 +0200
Message-Id: <20190729145654.14644-20-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGORLyVsyoPn4CUafp3DkuY7BxPSGvVkEp7R/gpfDbs=;
 b=q5cGZv9a88zJSmVzplwAzjUVhIJHdAvvuXY7RDQKi0spMb8RJnXTHDtqA15PQXW191hF8t
 mpLVE8crYPSdbnZXwyYCn9FyqUOHfivKfjJ3BG4jpQFEoL0sSiAR+oH2zPStSKkGur++Zq
 Ab4Za56t/pZ5MWIGuYlhKpZoVXuPg0o=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412357; a=rsa-sha256; cv=none;
 b=FtKC4bRy9kmEhgoLjr1bG0ETU+E8zZFLMB357yCR7zcqjaZF5mw0C2ENCSoCpsvRCPI4pw
 EaUYswGtSd0myspPdUDHgt5w/XbfrH86+Js6XbT9FVboqD0zqKib83cLZxH8UuLyzg6fHS
 z0kl7zQfD9efR2Zoo0mB59Ko/MpZW0Y=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 19/33] hw/sd/pl181.c & omap_mmc.c: remove
 device_legacy_reset call
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n30P1/7YsbFx

Replace legacy's reset call by device_reset_warm.

The new function propagates also the reset to the sub-buses tree but this=
 has
no impact since SDState has no child bus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/sd/omap_mmc.c | 2 +-
 hw/sd/pl181.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 24a1edc149..3021e54b8d 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -317,7 +317,7 @@ void omap_mmc_reset(struct omap_mmc_s *host)
      * into any bus, and we must reset it manually. When omap_mmc is
      * QOMified this must move into the QOM reset function.
      */
-    device_legacy_reset(DEVICE(host->card));
+    device_reset_warm(DEVICE(host->card));
 }
=20
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 15b4aaa67f..a59ef7eb2a 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -480,7 +480,7 @@ static void pl181_reset(DeviceState *d)
     /* Since we're still using the legacy SD API the card is not plugged
      * into any bus, and we must reset it manually.
      */
-    device_legacy_reset(DEVICE(s->card));
+    device_reset_warm(DEVICE(s->card));
 }
=20
 static void pl181_init(Object *obj)
--=20
2.22.0

