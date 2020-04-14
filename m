Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1078643qvm;
        Tue, 14 Apr 2020 09:51:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypKUvf4oo0U0YuCqCC5M5oMNhcuH2fGYrvphleFL9K7f+AKQ7M54tX62vD5JFkRaNgLN4j18
X-Received: by 2002:ad4:42c9:: with SMTP id f9mr873128qvr.228.1586883094599;
        Tue, 14 Apr 2020 09:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883094; cv=none;
        d=google.com; s=arc-20160816;
        b=iWaJst5DoWz5OWTSDEVGgGfdo1sSIP5P7kuZfRx00LkhZEbp09ykbeTjWYR8KgacxT
         8/rpJXidsiAmyHAbjPkuv3vbYtDQg+on/l+kPLZwFEg6oNWH5HG45xUo+jvOMzs1YvUl
         bWOIcmPXPEXdaCILzxfOYYCs37IPFEBmUB303AVIEqayAcgF36oPcOJgKWpYxggq/lZI
         V/T585QIuqywmXTKa5PIOFBgY+3XyYGzgseG3Hu5STfm+2bp6sfBnv3JLqHR3zur96lR
         Q8IV70UOx6iFbpohvGk5WQwtvjRqs72g0Gi+lc7/Up2Hm6R0zECfX6sQUCD9TmOqQi7O
         kNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GnJYBUthOsce7NJ4xT6W5gmharUMTFvzDWfeqO/U2B4=;
        b=e9ba/RF9x08l1pPcLBvhJ+xY1I6IAq2unD0ZJE+ImCzWPsmiF3jdHPzKc8QQuk6bYV
         tBY7dhvUxlC2W+EFf2UlQjw4wz+VH8gpHOKIFyDz3nJiZfxD4S6q4SYngmxnj7B9rsKQ
         9XfNaPZIHn/iuQnv0ZGe1F4NoLQ1HtZb2gBIaoJd65//TD6sHFW6gCPMW1CmJvHEz7Zl
         3gK/hA/74ng7BiGMPWWVxNc2vQad+9wQISrGLbrQLvHQzuO0vVGQua5tmV3WG/sbaFq2
         5734nXdk/JEDiDhRDf3GmPUKwHldMuEk+3fCcmV12y4QywvYQU0i/WZk7TfQqkc5hu4i
         OgNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PKrk+PfA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si851630qvf.177.2020.04.14.09.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PKrk+PfA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOmc-0006bN-3L
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOln-0006Wr-3e
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOll-0002rs-1p
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:50:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29123
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLef-0008DI-6b
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnJYBUthOsce7NJ4xT6W5gmharUMTFvzDWfeqO/U2B4=;
 b=PKrk+PfAQAey7pGbNH4bRmsEQeG/8WnmpFMcQh4+HzwxZ26sj0jLKaURiEwCxvlpeOSBVs
 /tfgLtFMbzobr1ccNnYAEL5y5EqLpZgcXKlbWEf+/IfGW/WEMFp5yleTd7TB+51VCZPqLY
 bq4qMcFblG36m3lZZF2nMZxFdAYa3vk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-zDdda0cnPhuMJAx74_G21A-1; Tue, 14 Apr 2020 09:31:07 -0400
X-MC-Unique: zDdda0cnPhuMJAx74_G21A-1
Received: by mail-wm1-f71.google.com with SMTP id f128so2617095wmf.8
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6idqut0mU47T5T/l9mhwNn6dpgHJZBNeGp23JGNjmX8=;
 b=fD4pnzakIDJGsaxiirmmi8LNvxkHLKdNDNyaNPi6Z7F5HSVkcAATwi76uXAjoXk/bi
 u/P7tJ8uWreHPFE7XzndfK7eCbzLU+plYnTcT6NiqHcP4K5otND1st2h+gybUemHbtMC
 ymTSvjQDMqphimSRlhHDwD3/8uU3x8T6BqSIaKZSsO6Grk/aIoBQlaF2wLT+ZNW/+GP2
 L3uu/znZ/2gTZgVFYCjwr+6GVud5zyjr7XyzpaSkRn9QxSTHOLuTxL0T2MuVCK4Qa37x
 nkq/ArbJDATIMnl+K2/0vOZ91FCOzWoEdQyepvnsric5mR7P0gylhxCUvROzmmBDrbqx
 EhJQ==
X-Gm-Message-State: AGi0PuZpaWN26cOZLl6UykAT1+g8LC3ExOclDYehaolwTa1k8V1LWxjO
 oZwqNWQ3ahzYBR74ZFx+ovMvD2ISoi9+tqGSHrNi+jTMwXl2bc+pSrGxdHBOU2CeHB+Fu4opMNP
 SWQqlFaAw01Ru8eE=
X-Received: by 2002:a7b:c399:: with SMTP id s25mr11080821wmj.169.1586871065894; 
 Tue, 14 Apr 2020 06:31:05 -0700 (PDT)
X-Received: by 2002:a7b:c399:: with SMTP id s25mr11080797wmj.169.1586871065711; 
 Tue, 14 Apr 2020 06:31:05 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id q19sm19299307wra.38.2020.04.14.06.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 02/12] qga: Extract guest_file_handle_find() to
 commands-common.h
Date: Tue, 14 Apr 2020 15:30:42 +0200
Message-Id: <20200414133052.13712-3-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GeQsn7rft2IE

As we are going to reuse this method, declare it in common
header.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/commands-common.h | 18 ++++++++++++++++++
 qga/commands-posix.c  |  7 ++++---
 qga/commands-win32.c  |  7 ++++---
 3 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 qga/commands-common.h

diff --git a/qga/commands-common.h b/qga/commands-common.h
new file mode 100644
index 0000000000..af90e5481e
--- /dev/null
+++ b/qga/commands-common.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Guest Agent common/cross-platform common commands
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QGA_COMMANDS_COMMON_H
+#define QGA_COMMANDS_COMMON_H
+
+#include "qga-qapi-types.h"
+
+typedef struct GuestFileHandle GuestFileHandle;
+
+GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
+
+#endif
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index cc69b82704..c59c32185c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -26,6 +26,7 @@
 #include "qemu/sockets.h"
 #include "qemu/base64.h"
 #include "qemu/cutils.h"
+#include "commands-common.h"
=20
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -237,12 +238,12 @@ typedef enum {
     RW_STATE_WRITING,
 } RwState;
=20
-typedef struct GuestFileHandle {
+struct GuestFileHandle {
     uint64_t id;
     FILE *fh;
     RwState state;
     QTAILQ_ENTRY(GuestFileHandle) next;
-} GuestFileHandle;
+};
=20
 static struct {
     QTAILQ_HEAD(, GuestFileHandle) filehandles;
@@ -268,7 +269,7 @@ static int64_t guest_file_handle_add(FILE *fh, Error **=
errp)
     return handle;
 }
=20
-static GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp)
+GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp)
 {
     GuestFileHandle *gfh;
=20
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 46cea7d1d9..cfaf6b84b8 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -37,6 +37,7 @@
 #include "qemu/queue.h"
 #include "qemu/host-utils.h"
 #include "qemu/base64.h"
+#include "commands-common.h"
=20
 #ifndef SHTDN_REASON_FLAG_PLANNED
 #define SHTDN_REASON_FLAG_PLANNED 0x80000000
@@ -50,11 +51,11 @@
=20
 #define INVALID_SET_FILE_POINTER ((DWORD)-1)
=20
-typedef struct GuestFileHandle {
+struct GuestFileHandle {
     int64_t id;
     HANDLE fh;
     QTAILQ_ENTRY(GuestFileHandle) next;
-} GuestFileHandle;
+};
=20
 static struct {
     QTAILQ_HEAD(, GuestFileHandle) filehandles;
@@ -126,7 +127,7 @@ static int64_t guest_file_handle_add(HANDLE fh, Error *=
*errp)
     return handle;
 }
=20
-static GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp)
+GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp)
 {
     GuestFileHandle *gfh;
     QTAILQ_FOREACH(gfh, &guest_file_state.filehandles, next) {
--=20
2.21.1

