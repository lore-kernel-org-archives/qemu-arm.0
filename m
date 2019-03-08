Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7805824wrx;
        Thu, 7 Mar 2019 17:33:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSJA36GO7qO19gFSNGZE/1rzKe3wA5zRbIRjABZaA5NOaw5KXx3ABlfjaShgB0hN2VFZl8
X-Received: by 2002:a25:1687:: with SMTP id 129mr14257785ybw.11.1552008786866;
        Thu, 07 Mar 2019 17:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008786; cv=none;
        d=google.com; s=arc-20160816;
        b=VGI/dqNuy1OaQpL+jYStbWgsRufxpV7iED5IlEskEs/B0ZNyHqu8dTgu6a78VPKH1T
         bbyreKDP78rEWqB3mBp8aHhPW3eFvVXoJUyqpveWEjyf9VqWyBECNt6WejWiKyuaGEjo
         7YYyxcCiiDkL81K9d7GM8QPxEnxN1TShPLpHNF1oVmQSSjtShYgpE5pf9sJWC6+7yfpQ
         Iw/U3cfMkDJGDaxKUMOSH3AEtAwpADrvIoddB9FujUHSeLMu8Qd+D6IwUtMG2CVzHOoF
         xistlIEqAKdyBjB9JlxgaLZOI81Hx6j3fBpV2UTR3acGUXN2vYQoKWrf8gxUYiqYVJ0E
         vuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4l+1YvPBDsMTlEG7iLsboFYIwLt/G4cUAZuIk4wTgwI=;
        b=fzRCNr8W8LTBypDgxBX7te4QUozqrdsV15EraibRBSXSvqRuYPaOsB6z2CqmG5/gW4
         3dNwFyGQVygrdkS8EuCFi3YBC+7Td8VcsmqUC4iHTvElmy6+5P77j7adGNucvMdfgaUr
         m9Pufjt97oHrl1Hi0CIT4VEUhVDyonQejWMLf8uOfPHZkXNVFWPkBOsg+5qg7hljRGFl
         /IWNVBuo9BpIvTH+BdajHcS5cuOGGeW3lwchFwTydwp7daADpd5TyNSGo7SaXsP6v/LO
         QAwyVbI5e/Jxian5BuaKc+rrZYMauJC9GTCK6JvewvRlV67J8X0fdfyYReoVXgv16dBZ
         OGFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y143si3864802ywa.97.2019.03.07.17.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24Nl-0001sN-Aq
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24NT-0001rn-KM
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:32:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24NS-0008B3-Pa
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:32:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24NR-00087U-61; Thu, 07 Mar 2019 20:32:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 181CB80467;
	Fri,  8 Mar 2019 01:32:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C860060BE5;
	Fri,  8 Mar 2019 01:32:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:05 +0100
Message-Id: <20190308013222.12524-2-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 08 Mar 2019 01:32:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 01/18] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
X-TUID: 8IbPx8aisLM0

Since commit 578f3c7b0835 ("arm: add fw_cfg to "virt" board",
2014-12-22), the machvirt_init() unconditionally creates the
fw_cfg object.  Later, commit c30e15658b1b ("smbios: implement
smbios support for mach-virt", 2015-09-07) added a superfluous
null-check on it.
Remove this superfluous check.

Fixes: c30e15658b1b
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Corrected commit reference (Laszlo)
---
 hw/arm/virt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c7fb5348ae..bb7255a080 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1282,10 +1282,6 @@ static void virt_build_smbios(VirtMachineState *vm=
s)
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product =3D "QEMU Virtual Machine";
=20
-    if (!vms->fw_cfg) {
-        return;
-    }
-
     if (kvm_enabled()) {
         product =3D "KVM Virtual Machine";
     }
--=20
2.20.1

