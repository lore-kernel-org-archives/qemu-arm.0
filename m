Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4044321wrx;
        Mon, 25 Mar 2019 09:18:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxpfLPvCoOnMakG/R/25Yc0VxIsjKnC7iFttzhzG7sz/7hqUwnzXA3dy+aeXFgEtXfmhp1
X-Received: by 2002:a0d:ea84:: with SMTP id t126mr10549227ywe.114.1553530724255;
        Mon, 25 Mar 2019 09:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553530724; cv=none;
        d=google.com; s=arc-20160816;
        b=r0xkpFeqih4OkrMOWRiMob37eI5c1Xq7CkweYTU1QCcsB/Uu8GqEWxz57v6iN2TPZX
         Ak95j6T4xR1JOh3EatKXd1kCs6gF/nFmsu/bj4pko6jNJBzRTnWfwNJ0OA3PsG7u1RG6
         BWwo9i48LFD/6yXtIg0upkLEkY0cd0l+WLCBe07YZLP0IAR9HCNs+N15KM24EdG94wT/
         DaZOPFeqhCLjAZC5ItfPYNCDDaQZGCgd4nDRm7I+lTmPDIRYCN/3uEWCzRGO/id30XLj
         WY66QLTn1tY5zfV2U8piwlzy5M3yztxKL/TyRbElYEY1USMQkum2eViuAm7mFD3iLV+S
         +KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Y7WDmyBvcsh2hIBV5TsZTawqUA2L5qDfZur0hqkmwZI=;
        b=qy69/UivTu7eF8rqTCQ7bi9IYMmv8yRF8APc9N1dXKQczDy8sUgUrrU51waaAuS1T1
         Ayq/G6wTelHloKqbxszqd9Rve4eZcdxQ5A6Z6Gd9BeNB6YgkvkxDdOYzG3fg8Hlw6jLr
         ponxGnRcFlp8sgH9IvPVahVLiRXw98AtCTA8o6zTzfgk02fVzAh779vh3eMSJyv7HVoG
         /nrUgb7tPs1I0yzAu5Dtt5OVDAQh1bRKXLEYM2VnByA61PwPYdi5bq7BjhryYCWUQ9bp
         h5ckFgCL4BG6fMmlEtJe0Gbcc+dKQVnfq+DmRvSkyQL0SbqoyDwyHVvfTSLcQniL7kG0
         q1ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si9372629ybw.88.2019.03.25.09.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SJ9-0005l4-KO
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:18:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGn-00046Q-L7
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S1B-0005IG-Jp
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:00:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S17-0005Cv-5L; Mon, 25 Mar 2019 12:00:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6BD13092651;
	Mon, 25 Mar 2019 16:00:02 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AF335F9CD;
	Mon, 25 Mar 2019 15:59:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:53 +0000
Message-Id: <20190325155857.10661-4-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 25 Mar 2019 16:00:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/7] trace-events: Consistently point to
 docs/devel/tracing.txt
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
X-TUID: fY5Bz4AoS190

From: Markus Armbruster <armbru@redhat.com>

Almost all trace-events point to docs/devel/tracing.txt in a comment
right at the beginning.  Touch up the ones that don't.

[Updated with Markus' new commit description wording.
--Stefan]

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190314180929.27722-2-armbru@redhat.com
Message-Id: <20190314180929.27722-2-armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 accel/kvm/trace-events   | 2 +-
 accel/tcg/trace-events   | 2 +-
 hw/i386/xen/trace-events | 2 ++
 nbd/trace-events         | 2 ++
 qapi/trace-events        | 2 ++
 scsi/trace-events        | 2 ++
 trace-events             | 2 +-
 7 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 8841025d68..33c5b1b3af 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -1,4 +1,4 @@
-# Trace events for debugging and performance instrumentation
+# See docs/devel/tracing.txt for syntax documentation.
=20
 # kvm-all.c
 kvm_ioctl(int type, void *arg) "type 0x%x, arg %p"
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index c22ad60af7..01852217a6 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -1,4 +1,4 @@
-# Trace events for debugging and performance instrumentation
+# See docs/devel/tracing.txt for syntax documentation.
=20
 # TCG related tracing (mostly disabled by default)
 # cpu-exec.c
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 8a9077cd4e..8732741541 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -1,3 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
 # hw/i386/xen/xen_platform.c
 xen_platform_log(char *s) "xen platform: %s"
=20
diff --git a/nbd/trace-events b/nbd/trace-events
index 7f10ebd4e0..6db8375c3e 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -1,3 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
 # nbd/client.c
 nbd_send_option_request(uint32_t opt, const char *name, uint32_t len) "S=
ending option request %" PRIu32" (%s), len %" PRIu32
 nbd_receive_option_reply(uint32_t option, const char *optname, uint32_t =
type, const char *typename, uint32_t length) "Received option reply %" PR=
Iu32" (%s), type %" PRIu32" (%s), len %" PRIu32
diff --git a/qapi/trace-events b/qapi/trace-events
index 70e049ea80..b123c5e302 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -1,3 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
 # qapi/qapi-visit-core.c
 visit_free(void *v) "v=3D%p"
 visit_complete(void *v, void *opaque) "v=3D%p opaque=3D%p"
diff --git a/scsi/trace-events b/scsi/trace-events
index f8a68b11eb..499098e50b 100644
--- a/scsi/trace-events
+++ b/scsi/trace-events
@@ -1,3 +1,5 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
 # scsi/pr-manager.c
 pr_manager_execute(int fd, int cmd, int sa) "fd=3D%d cmd=3D0x%02x servic=
e action=3D0x%02x"
 pr_manager_run(int fd, int cmd, int sa) "fd=3D%d cmd=3D0x%02x service ac=
tion=3D0x%02x"
diff --git a/trace-events b/trace-events
index e66afc59e9..b48f417225 100644
--- a/trace-events
+++ b/trace-events
@@ -1,4 +1,4 @@
-# Trace events for debugging and performance instrumentation
+# See docs/devel/tracing.txt for syntax documentation.
 #
 # This file is processed by the tracetool script during the build.
 #
--=20
2.20.1

