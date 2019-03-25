Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4049518wrx;
        Mon, 25 Mar 2019 09:23:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwX3eaNFKOzqaf+sTwIhoCq4hH0mhlPsHJAhyGgA5fqXC/PwyzMxcPCD1sHTIz36EA59NwI
X-Received: by 2002:a0d:d446:: with SMTP id w67mr21669383ywd.369.1553531037998;
        Mon, 25 Mar 2019 09:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553531037; cv=none;
        d=google.com; s=arc-20160816;
        b=pzJtmy6cfd6HEmMK8ps6QNCwlWvk/LaDaw8p4oUKpoOSC6z2sxtABA2RhyKryUDLUt
         dG35zfVqnED6gsTl50uKCWxlkQfOS/Pe8e/hfIx2+EPoTH46iJxLJqmeTMPWK4NzI/wU
         28ldLFd+36G34WuQJUiPbDWB6o4KaZ6gCbAPiWgaK0Hsqlg04ApzuIj+DhYUvX4sPI8h
         kIaVzVwRYS2eOIxkK5EiXwNiZTcruwG8i6RTe9LMG0PVECTXhQX3bweHN6qoQGAyjByX
         0MyCE9QUJ2Ngm7EjdN7jdDFb+K1IRNPDw/sQp2BXt80a3HOAZ88Cg1oUU76eIG+gtdCv
         BjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7TvICYwRk1Vejx/U/wVkmgGqXBe+HeJGGBY6wd4YDGI=;
        b=Pb1X6qlr9sHVLmxhKhpzTLHjsKBacYhjeqhMheciRNkz8BrtsPsfuLgTMVBwkXPdk8
         MBvO4GN6+wmH3RoyvOxu37Cm++xsOu91NGw+plx9eHCNdRClivANvq7fzAFHW9vj8OlX
         MKd+8R9mlUOwq5S91NoV9HevdGpPVePl5LIzoNgAePAZMQM8XTY3gty9TJ38GAnPf5ir
         luPe6oQPyerIF+MeOCoyu9aSvdZs1/0Y3MXv4szhnuduDPI8+Z/UeRAfdSDXHgihEauj
         lVF92tCxuwgAbQE4egQSmtjQep3PO1ZUqN/wKX2z3YHReNCmzphbmOA8XhBlbkWkshJ8
         cwoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a124si5292203ywb.179.2019.03.25.09.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SOD-0001XX-8N
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:23:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGt-0004nS-Nz
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S0l-00055D-Jj
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 11:59:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S0j-000533-3d; Mon, 25 Mar 2019 11:59:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03C2A3082E0F;
	Mon, 25 Mar 2019 15:59:39 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 419FD8429C;
	Mon, 25 Mar 2019 15:59:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:51 +0000
Message-Id: <20190325155857.10661-2-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 25 Mar 2019 15:59:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/7] trace: handle tracefs path truncation
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
X-TUID: VFx1cOhct34r

If the tracefs mountpoint has a very long path we may exceed PATH_MAX.
This is a system misconfiguration and the user must resolve it so that
applications can perform path-based system calls successfully.

This issue does not occur on real-world systems since tracefs is mounted
on /sys/kernel/debug/tracing/, but the compiler is smart enough to
foresee the possibility and warn about the unchecked snprintf(3) return
value.  This patch fixes the compiler warning.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Message-id: 20190321170831.6539-2-stefanha@redhat.com
Message-Id: <20190321170831.6539-2-stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/ftrace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/trace/ftrace.c b/trace/ftrace.c
index 61692a8682..9749543d9b 100644
--- a/trace/ftrace.c
+++ b/trace/ftrace.c
@@ -53,7 +53,11 @@ bool ftrace_init(void)
     }
=20
     if (tracefs_found) {
-        snprintf(path, PATH_MAX, "%s%s/tracing_on", mount_point, subdir)=
;
+        if (snprintf(path, PATH_MAX, "%s%s/tracing_on", mount_point, sub=
dir)
+                >=3D sizeof(path)) {
+            fprintf(stderr, "Using tracefs mountpoint would exceed PATH_=
MAX\n");
+            return false;
+        }
         trace_fd =3D open(path, O_WRONLY);
         if (trace_fd < 0) {
             if (errno =3D=3D EACCES) {
@@ -72,7 +76,11 @@ bool ftrace_init(void)
             }
             close(trace_fd);
         }
-        snprintf(path, PATH_MAX, "%s%s/trace_marker", mount_point, subdi=
r);
+        if (snprintf(path, PATH_MAX, "%s%s/trace_marker", mount_point, s=
ubdir)
+                >=3D sizeof(path)) {
+            fprintf(stderr, "Using tracefs mountpoint would exceed PATH_=
MAX\n");
+            return false;
+        }
         trace_marker_fd =3D open(path, O_WRONLY);
         if (trace_marker_fd < 0) {
             perror("Could not open ftrace 'trace_marker' file");
--=20
2.20.1

