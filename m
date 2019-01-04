Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp860088wrt;
        Fri, 4 Jan 2019 10:00:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WGoXc2crtL2wBGIqFw+TiUftCpiU4kNZLlXiIh9q+h6wCY0sx6wlroaTGysBWPQPKaGZ7z
X-Received: by 2002:ac8:2585:: with SMTP id e5mr51155132qte.233.1546624828678;
        Fri, 04 Jan 2019 10:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546624828; cv=none;
        d=google.com; s=arc-20160816;
        b=B3csa82yCrLGPrsi421l0XbeEFeKx+gmVxI/3XkJjlw0RkQq8Cu/glARqxVicXRD34
         4upJ1UBy0QyTHDfRMuV/M9LB7C841BnrFOvSTmwHWDFMympBhi954/mGEptVbuAKkxR9
         8TEyYfDxPkNiuUaUpfVwidiB4UJY+0YM5jnEdYucUk1VdZTW7nyjN+qHwtegI7/lpAFQ
         tzd1jgNsV8m65Q+HvJdgPm5wGYgVSMKjhjgtCIzSnAGF4vHiHShrsbJFnRRi0k3qECsS
         C5oa+elRVBXpYF73jd/rUyIgJGcEqO/oxj7l3djrWGoPiIsY1VrpcagQE53367DT7NNV
         HLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KOcnDrW6l+yI3CDrx8ed8bG67Y71TQFb6Jn1FJzF6D4=;
        b=VEm5UkKgbYa9kL6RCYtzKnlFHKPj0w6DwpHkv5QjsbVg3R0bX6caP4zPY67opMi84y
         o5HzdJa+Te1b2KaOiEajVdoI8e9asjIdqRTkGzuDk0Ke0RARDuPxj88oQ8TGugP8ocdw
         U16SnpHCEGdSpy97xDiKbJ7Mo00a9L/lpfjEe6bYRSlVXQlmuwcM9D2fSFuNigw1kJLO
         KTEC9Wcj21NAOIBgvfLPe0ZWGcbUBW4+DdfU7yPquuwIZ6YYfVF32qpB9Ujnq55nC55e
         RH73QDeWUOmGlhVnSgWjBg8OiNf7p/ECfRHEcBuzMvvJ3LU/qFmsECbwHiCaMA0u6nke
         Lwfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 45si4941806qtr.28.2019.01.04.10.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTlj-0003NJ-Pr
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:00:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTl3-000302-P5
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 12:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTl3-0004Qb-6A
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 12:59:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTky-0004OH-Um; Fri, 04 Jan 2019 12:59:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB23285550;
	Fri,  4 Jan 2019 17:59:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D8A5D6A6;
	Fri,  4 Jan 2019 17:59:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:34 +0100
Message-Id: <20190104175847.6290-4-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 04 Jan 2019 17:59:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 03/16] hw/devices: Remove unused TC6393XB_RAM
 definition
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lgi3C6IZhzqp

Introduced in 64b40bc54a9, this definition is no more used since
a0b753dfd39. Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/devices.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/devices.h b/include/hw/devices.h
index 0e27feb0c2..4019b3be17 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -51,7 +51,6 @@ void retu_key_event(void *retu, int state);
=20
 /* tc6393xb.c */
 typedef struct TC6393xbState TC6393xbState;
-#define TC6393XB_RAM	0x110000 /* amount of ram for Video and USB */
 TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
                              uint32_t base, qemu_irq irq);
 void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
--=20
2.17.2

