Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152560wrq;
        Tue, 12 Jun 2018 03:45:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK/jzmtjYY0YbXlsZLpfvYPZaMc3/da4TsZMpGwLMV3KgikcTle/sXRHsCsUBqu3Ee7aoZj
X-Received: by 2002:ae9:e602:: with SMTP id z2-v6mr2701246qkf.182.1528800311342;
        Tue, 12 Jun 2018 03:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800311; cv=none;
        d=google.com; s=arc-20160816;
        b=dnarmXNTPpOlKAXXgvKIv1QC0LIwZggbQ/80J/SO9ZImMevx3ijLdkZewaXODXPKSc
         5LLrOqe3qm9klLFTOfa3/2otsxwYASihAOl38beEZFvAmotkOiCgHXexoFKqCvb5cBVa
         0h4fWjH5xWbDVI4IcflwcxaMnfjxhwT2toK6D7NH+QSHeU66qtmtUtgC+zvZPKzHjsmM
         pHuakiLiYH2mBA4J5IRlu5koLrhIxBdy+DMG+7R9J6bXxlH/rerVh/qMcInZs/Rsdada
         yQ8CbsA3oqaqrzB9NpYnP0bls3eeQRJ6YmdEqjq/hNJJlQG+XupwDuFbpRWnsOXfLDOa
         RcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=J/7YOkHo7ZXTGel5NoKmVCbW7pfk+Y1SfYZk74CVNa0=;
        b=AaolmWeRAQYXMUsgeMYmlxRpS9PdXOkh8TebogRDTh8QQvSNMnynwaxF/KBVipWC22
         vZ0N6yrVVHFBTgb9e/29SDpZA4oEpln/U+xE7aWlHwU3C93QpuJKPXmxJ0v05Mxom4QY
         fx7jI9t2ntMB2Yyz10+fAozsqn4LTa3ywsg1hKfABz0CRiEMnG2kSt1FHoC0hWy2XANr
         FZ8dEmlY1BAQ4pG9/pVV/XYpNnZQbuh877dPxooKFx9v1NbvxuqxleGeCCCjZHIbmv6T
         B9finUMLw+48lhrqtmmgTBgToh3B6iZ5EJW1nKojYkR/JGzkidg8b82D39yoZZr5xPsN
         Z98w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68-v6si531273qkd.271.2018.06.12.03.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnW-00039V-Qh
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002nc-6a
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmv-0007sJ-T6
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49326 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmv-0007s2-OW; Tue, 12 Jun 2018 06:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 392B477887;
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9764A2024CA2;
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B0B4A40DEA; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:28 +0200
Message-Id: <20180612104430.25745-7-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 6/8] usb-ccid: fix bus leak
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHlCyq4W1cK3

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

qbus_create_inplace() creates a new reference in realize(), it must be
released in unrealize().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20180531195119.22021-4-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-smartcard-reader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.=
c
index 2131e33d27..f7c91230d5 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1147,6 +1147,7 @@ static void ccid_unrealize(USBDevice *dev, Error **=
errp)
     USBCCIDState *s =3D USB_CCID_DEV(dev);
=20
     ccid_bulk_in_clear(s);
+    object_unref(OBJECT(&s->bus));
 }
=20
 static void ccid_flush_pending_answers(USBCCIDState *s)
--=20
2.9.3

