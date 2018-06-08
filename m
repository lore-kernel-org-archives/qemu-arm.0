Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp748283wrq;
        Fri, 8 Jun 2018 04:20:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK6VODPM3WlozJ5JhMoGKmxtkqJiGR9KT10kGqR9hstNi3ghlGzP0OJ+55rufEg2clyrSES
X-Received: by 2002:ac8:3159:: with SMTP id h25-v6mr5265568qtb.162.1528456815680;
        Fri, 08 Jun 2018 04:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528456815; cv=none;
        d=google.com; s=arc-20160816;
        b=SD0WBPYIt1uF5kXQu8NocEtasjuR4C2uEYEKhCD8kCUCayoaPuPnFFcjdWSrpXNsDP
         glvo8H+gb1hAPKhup9bX8ip8wWKPx/4YwnUY1ClwLiN6j3yjv744UCh4tpRJ+AKeuF0y
         nqyT2Zxf3aqf1A25GvGXwTgkMCtgimq8jDfXDMrCtVPQGUCBWQdBZYqfAFo88LX6qpGa
         T9IfTrmfzdP+p/B1KSoQ9NUmYdTouJcapmEtuhiOMluzvCTI6SvrdjOsMYyFOT+OmNLY
         lo5yDR6Qh2trWH0htv9csdkSnBsbXOXMkoqMtbyk2oRKCOCI5ZWWI+dlbwS0QbAUAD5B
         lCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X1xAQ7mwpeZECJm8/g8E0M5TPsquwduCQKDtNjzHDdI=;
        b=jA8m8bmAtmxE9ouY3AKIqDaN4bXAElkso69+ef2Sjjy/4OAcGojnluDvq7JYGLxyeE
         WoJuGiLDZXVd8sfiyY1reBxnnmW/b1f0ONyr2ViORJBkBzpo2mlpWSYZzvpc2lEcoZLo
         Zmi2A4PVzPWh98ZWmuswXC3WoyGurRacJzQ4DiuSg8fYZekKfxMe4oByDw7Q3mNhsKwq
         4hvoMrv0ZEJ8Gns20Ai5qyMhGovOoFMyyvwaoA3vz2Hfj34KmebsXgGuOVyydSAAjDCM
         PpM434A8r0VLR4meFX2qM7+B6mzOIoUI020vZ0Q6isGlB3PjubF7vjCfMCZWlDGEMnLX
         2lHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4-v6si6240023qvb.115.2018.06.08.04.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFRH-0007xc-8j
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRA-0007vM-LF
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFR7-0001fj-Mw
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48310 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFR7-0001f1-JZ; Fri, 08 Jun 2018 07:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DB3D401EF04;
	Fri,  8 Jun 2018 11:20:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B56C3202699A;
	Fri,  8 Jun 2018 11:20:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EB8ED9A8F7; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:20:01 +0200
Message-Id: <20180608112001.14729-7-kraxel@redhat.com>
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
References: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 6/6] bochs-display: enable vgabios
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S6w4Z8mpCw/I

---
 hw/display/bochs-display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 1187d77576..12d8a66c6c 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -337,6 +337,7 @@ static void bochs_display_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_QEMU_VGA;
 
     k->realize   = bochs_display_realize;
+    k->romfile   = "vgabios-bochs-display.bin";
     k->exit      = bochs_display_exit;
     dc->vmsd     = &vmstate_bochs_display;
     dc->props    = bochs_display_properties;
-- 
2.9.3

