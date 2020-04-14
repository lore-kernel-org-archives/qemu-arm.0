Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1081733qvm;
        Tue, 14 Apr 2020 09:55:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIywYaDo3loBfOcZfxrCaXZNUqTq+hnfzEnoDTWwL9xqUjn0YyKPMeMSPVfYANhBKbsqky
X-Received: by 2002:ac8:7396:: with SMTP id t22mr17157143qtp.15.1586883316226;
        Tue, 14 Apr 2020 09:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883316; cv=none;
        d=google.com; s=arc-20160816;
        b=NHn20vVXakhJgS9Rs8vDTT/Lpd6yJzK47shEnG7VZTw4nDotNYKBpP5AY23apL3jul
         uBW/pCBTXVGLjW1rZ2evMYxW7jG3wpuRZzZAoeubjfDTu+PM0c3v8m/blSyQB+FrOufr
         Getxy0vsOek2VHFwouIEyyyMLu+HO98JbuZz7ZRaNxK4bpu77aLVnGIwgI503eTsd2WZ
         TcXmavJBwwDZF+Nd4Eh0MVn115aWmYidfqhW5x85rd+vRNUw1g/eK2DN5q0SJ1wgDDlb
         kWBMzzQ34YkXCTna/XrC7MTUp+FjUfSetX80ae7lvrFb6faqAYPRyt7YJvo/BnmN3rHM
         Joig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fu0f7k/a61zvNy9hTYFT7tcEyV8paFWKyShaFKjjtn0=;
        b=tXpcvVeRPmA6wgNnW9eCDDxNrwD5gakHenYppOAvVQeWskOiO2ik3DUUXrMV/gIEjH
         3jOQsMlW3/JJHOsiouusm1hDs7yR6jOlV0V9fOwxxedaMX4eOtg8+llElAejvG1YvqAr
         BezmHnilSz90ZXMqQNhl7ZWdAUmVv/ex/tUKv5ionIEWCKM/uC5oOOfYzTWrZ0fJI6eE
         qk/3rzAdroxAUJ/tEhfuUPRPDgTSpS9FcAirLR5KqWJPAuy6cd8LXazH4qHahtXvwLzw
         nZT4A4fsw2mD487oNECH62W3g0Q9vBDSIUlQSHuXq9DBCGoJE7mWO/uPeMxc6tENO6m4
         O0ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DkdPImi2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si5443315qto.24.2020.04.14.09.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DkdPImi2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35119 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOqB-0004OP-LO
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOkg-0005Ji-98
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:49:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOkc-00026K-Bq
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:49:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59325
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLek-0008EP-EL
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fu0f7k/a61zvNy9hTYFT7tcEyV8paFWKyShaFKjjtn0=;
 b=DkdPImi25Yx0rxdvRS2vbzv6AsYCRKSfK3hnM2Fn0mIm4TD0EuWjOze74uxLqjyquQl/Uy
 30JJXKoZ5uZ6psykKBZQcZqsO2dCR2PV3ALYIw5dpLaJZBUQlpF3Iz68xlmJQ93xuxWlcs
 tJwME0ikVV72ZYWkhWRemMMv4DnNvu8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ehF3RQ63M1y0rsxjqtJCkA-1; Tue, 14 Apr 2020 09:31:12 -0400
X-MC-Unique: ehF3RQ63M1y0rsxjqtJCkA-1
Received: by mail-wr1-f72.google.com with SMTP id m5so5560665wru.15
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFub0oIWRGuMfBgpHGkeKThVa6ZfWPB3Vt4l4sK5QOw=;
 b=AwmjWCJFz0FeTmOvVzrLt1D1cliv2L5tvpe97wy4Mmr2AyKV9veOYaAJFrQlEZNrjB
 KdmOvQB2K4zKF4abDgY/wRoenMYGb8xrKoQMy3xTDLjlgGO4ftKeCX41KakXkQJNCQuw
 YJrsCabN2++gLSYGPNnoqjmbwZnvYBdycsHJ+hkn7253i3UaTnqQS7Vs3JQ3kaagvFPP
 aJW/tpQ3UOE1xbK+I+gA1gNuxJa34lSTps1R0Ie5W/hfYQ8zHX4i6kGLww7kLMWcQrKK
 KzWXESFAc6tl3zMjWGYKbk65nogU5/5O1UkYiEo/RoJ9TNgfMQ2BncpjxX/RUSLk6jPu
 6wSA==
X-Gm-Message-State: AGi0PuY1/z4das87R0Dym3AM1dXlEuWLBVMvv0JVEHEdA30YJz5gINgt
 9rd9iYtVzjDbC5l8OWgCvEfMyuo7C31xFKTWWPXE3JJsCBDe2rXr65C/nwhgvdNJ8GOPf5ybT7Y
 RWNBwHYzqH0Va
X-Received: by 2002:a05:600c:2645:: with SMTP id
 5mr23428263wmy.168.1586871070896; 
 Tue, 14 Apr 2020 06:31:10 -0700 (PDT)
X-Received: by 2002:a05:600c:2645:: with SMTP id
 5mr23428234wmy.168.1586871070661; 
 Tue, 14 Apr 2020 06:31:10 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id g186sm19354552wme.7.2020.04.14.06.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 03/12] qga: Extract qmp_guest_file_read() to common
 commands.c
Date: Tue, 14 Apr 2020 15:30:43 +0200
Message-Id: <20200414133052.13712-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yVI/FK8MlJ7y

Extract the common code shared by both POSIX/Win32 implementations.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/commands-common.h |  3 +++
 qga/commands-posix.c  | 22 +++-------------------
 qga/commands-win32.c  | 20 +++-----------------
 qga/commands.c        | 26 ++++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/qga/commands-common.h b/qga/commands-common.h
index af90e5481e..90785ed4bb 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -15,4 +15,7 @@ typedef struct GuestFileHandle GuestFileHandle;
=20
 GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
=20
+GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
+                                      int64_t count, Error **errp);
+
 #endif
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c59c32185c..a52af0315f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -461,29 +461,14 @@ void qmp_guest_file_close(int64_t handle, Error **err=
p)
     g_free(gfh);
 }
=20
-struct GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
-                                          int64_t count, Error **errp)
+GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
+                                      int64_t count, Error **errp)
 {
-    GuestFileHandle *gfh =3D guest_file_handle_find(handle, errp);
     GuestFileRead *read_data =3D NULL;
     guchar *buf;
-    FILE *fh;
+    FILE *fh =3D gfh->fh;
     size_t read_count;
=20
-    if (!gfh) {
-        return NULL;
-    }
-
-    if (!has_count) {
-        count =3D QGA_READ_COUNT_DEFAULT;
-    } else if (count < 0 || count >=3D UINT32_MAX) {
-        error_setg(errp, "value '%" PRId64 "' is invalid for argument coun=
t",
-                   count);
-        return NULL;
-    }
-
-    fh =3D gfh->fh;
-
     /* explicitly flush when switching from writing to reading */
     if (gfh->state =3D=3D RW_STATE_WRITING) {
         int ret =3D fflush(fh);
@@ -498,7 +483,6 @@ struct GuestFileRead *qmp_guest_file_read(int64_t handl=
e, bool has_count,
     read_count =3D fread(buf, 1, count, fh);
     if (ferror(fh)) {
         error_setg_errno(errp, errno, "failed to read file");
-        slog("guest-file-read failed, handle: %" PRId64, handle);
     } else {
         buf[read_count] =3D 0;
         read_data =3D g_new0(GuestFileRead, 1);
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index cfaf6b84b8..9717a8d52d 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -322,33 +322,19 @@ void qmp_guest_shutdown(bool has_mode, const char *mo=
de, Error **errp)
     }
 }
=20
-GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
-                                   int64_t count, Error **errp)
+GuestFileRead *guest_file_read_unsafe(GuestFileHandle *gfh,
+                                      int64_t count, Error **errp)
 {
     GuestFileRead *read_data =3D NULL;
     guchar *buf;
-    HANDLE fh;
+    HANDLE fh =3D gfh->fh;
     bool is_ok;
     DWORD read_count;
-    GuestFileHandle *gfh =3D guest_file_handle_find(handle, errp);
=20
-    if (!gfh) {
-        return NULL;
-    }
-    if (!has_count) {
-        count =3D QGA_READ_COUNT_DEFAULT;
-    } else if (count < 0 || count >=3D UINT32_MAX) {
-        error_setg(errp, "value '%" PRId64
-                   "' is invalid for argument count", count);
-        return NULL;
-    }
-
-    fh =3D gfh->fh;
     buf =3D g_malloc0(count + 1);
     is_ok =3D ReadFile(fh, buf, count, &read_count, NULL);
     if (!is_ok) {
         error_setg_win32(errp, GetLastError(), "failed to read file");
-        slog("guest-file-read failed, handle %" PRId64, handle);
     } else {
         buf[read_count] =3D 0;
         read_data =3D g_new0(GuestFileRead, 1);
diff --git a/qga/commands.c b/qga/commands.c
index 4471a9f08d..5611117372 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -18,6 +18,7 @@
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
 #include "qemu/atomic.h"
+#include "commands-common.h"
=20
 /* Maximum captured guest-exec out_data/err_data - 16MB */
 #define GUEST_EXEC_MAX_OUTPUT (16*1024*1024)
@@ -547,3 +548,28 @@ error:
     g_free(info);
     return NULL;
 }
+
+GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
+                                   int64_t count, Error **errp)
+{
+    GuestFileHandle *gfh =3D guest_file_handle_find(handle, errp);
+    GuestFileRead *read_data;
+
+    if (!gfh) {
+        return NULL;
+    }
+    if (!has_count) {
+        count =3D QGA_READ_COUNT_DEFAULT;
+    } else if (count < 0 || count >=3D UINT32_MAX) {
+        error_setg(errp, "value '%" PRId64 "' is invalid for argument coun=
t",
+                   count);
+        return NULL;
+    }
+
+    read_data =3D guest_file_read_unsafe(gfh, count, errp);
+    if (!read_data) {
+        slog("guest-file-write failed, handle: %" PRId64, handle);
+    }
+
+    return read_data;
+}
--=20
2.21.1

