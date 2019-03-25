Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4053533wrx;
        Mon, 25 Mar 2019 09:28:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTtCJ5p8BR+8f0BlC13Fay49rBc6LHuVKAIG2B9McKJBaPjcsOyaFPskHe3uz40vlt/Os+
X-Received: by 2002:a81:2e88:: with SMTP id u130mr20287835ywu.98.1553531304306;
        Mon, 25 Mar 2019 09:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553531304; cv=none;
        d=google.com; s=arc-20160816;
        b=Zi8ENOTAWz6eQ+l4OinKb/mEEjdmjLzo8vEmZZUhZXAffUVIXbzl5fNhPM1o0ySim1
         iSt8DticYO+Y+btC51VRD3WDoWoQuFurWL9WTjXmiCP7AiisjEayRx735BpZHf0Sr6ja
         vFTQp4l4bp4tNSGSePo0X16Hdx7G3nslYDnmD1BS0eqmsPleIrgFKcElL7lDoe0tOADE
         1J9jrQNqDQrkiYvg0yLwbSQzXB27XY0eJqMP9dOELAp+wHe6zR33JyFCnvJBr0313DJJ
         cX5cxh+oSU6Jj1OqKRt8X3ICOKymh/R+pRH5a+MyxhR8XcIh/pGeuoj7iZS2jbXSqJMQ
         DgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=f+lBX7uZTAKquta6iaZMIpkPO2kukJsy3Mw7wbC9tQk=;
        b=UB+3xwvq56XA2VWxkvdiwPjBCTY6usGfw5Vq1tgig2Ihkh0ri7HKscH+P9/gnyop8D
         8aqYHo6w7BP1gjGoNdpMSHdNwhbuSh2jvSQfa0VNU4gxsFJfCMEXrLgAzMyPqY/aDaCB
         2AAsOShCl4EBo6D1EF8YMNbgWn4WTcj0XTQaRfYz/8MiuEp4eNCGtCgMbt9dgP6eSM9k
         BvJGbx1miMXoLNcM0FWv4NqQb6qtWt7jkiAdHgm1Afg4W5e0zv5g51oNZgHv+dnrQkE4
         p0YpPkd3jwqaGPLlLsoEeMwCiVu/XnVRs3cDu1tNiI107ibTumXdUsg2e23qf5LfN3Wt
         wMHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si9746852ybd.425.2019.03.25.09.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SSV-0006CZ-Mn
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:28:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGt-0003aF-Ms
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S0m-00055w-OO
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 11:59:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S0k-00053e-2d; Mon, 25 Mar 2019 11:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFA8B3082E6A;
	Mon, 25 Mar 2019 15:59:40 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5D684292;
	Mon, 25 Mar 2019 15:59:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:52 +0000
Message-Id: <20190325155857.10661-3-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 25 Mar 2019 15:59:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/7] trace: avoid SystemTap dtrace(1) warnings
 on empty files
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sxl1QkHIQIn2

target/hppa/trace-events only contains disabled events, resulting in a
trace-dtrace.dtrace file that says "provider qemu {}".  SystemTap's
dtrace(1) tool prints a warning when processing this input file.

This patch avoids the error by emitting an empty file instead of
"provider qemu {}" when there are no enabled trace events.

Fixes: 23c3d569f44284066714ff7c46bc4f19e630583f ("target/hppa: add TLB tr=
ace events")
Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Message-id: 20190321170831.6539-3-stefanha@redhat.com
Message-Id: <20190321170831.6539-3-stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/tracetool/format/d.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/tracetool/format/d.py b/scripts/tracetool/format/d.p=
y
index 78397c24d2..c7cb2a93a6 100644
--- a/scripts/tracetool/format/d.py
+++ b/scripts/tracetool/format/d.py
@@ -33,6 +33,11 @@ def generate(events, backend, group):
     events =3D [e for e in events
               if "disable" not in e.properties]
=20
+    # SystemTap's dtrace(1) warns about empty "provider qemu {}" but is =
happy
+    # with an empty file.  Avoid the warning.
+    if not events:
+        return
+
     out('/* This file is autogenerated by tracetool, do not edit. */'
         '',
         'provider qemu {')
--=20
2.20.1

