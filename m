Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp190194wrt;
        Fri, 11 Jan 2019 06:19:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6dqbWG+eoN01wYKUb4DenoeVYV/imNcU8xwfwzw3+aA9JZ0XA87u2xC3eZeHPiQv9Llg7b
X-Received: by 2002:a17:902:2c03:: with SMTP id m3mr15407188plb.125.1547216371085;
        Fri, 11 Jan 2019 06:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216371; cv=none;
        d=google.com; s=arc-20160816;
        b=hJyUIx4mDg8UH0O7NrOMYh5SxWqGT6odopt4YJgOFfs2b0cjL7t+SKnK9uYAZYpv4a
         WT984eB9269uSwCP5jUxSNoQsbU6OXvWIKPix/lggwdzjBq7/gdXM2E7d8Z2qaviW8/k
         9aSpUPlPAoA2ee88scgt14v7Lh+zYkd//B9s3ZTbE5p+Z4ITXgY9cmySyNnC/rcxPcK3
         uXXdUFIPVp1ZwvAa1BtXrB3tbHlyZ2ra1LN4w/jsoGbHCSxVNTS/AdrX9tmgmgOaSh2Y
         O82cxzQ9d2bapslFB8yud8nlJfKANx18r4dvBzAVsWUEuTc2hTbgu4ucmwQ0lOqUvJco
         aYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ITGs957M455l80KtUIaFzResTCrAbRsu/T7LhRN8m98=;
        b=a2gPk+KdHbvHuuwAIY3JW20fpM6XuqIbMpwsFA6qlHzdagME97dEgqesJa2ILNWu3c
         681iU7DG9tk2WiYRho15JOa/GMJcraL3rT3k2OtxiErS6JB9s4r3aCteKW90uMS8rluO
         BMvGf2l/Fdvu+crbR5suWGeqdAwWVWzR6qDzKvtzpurtprHZv7s2DXG/plF2EyBrLm9m
         FGV40v5rNMC4Bjzr85K2oR15XBC0dwJqYffalqI9j3d58ZOcJEf7KAPc8kXO38alt0xU
         bOny/gSPDNcwRk7EJiAXr2zzgNlsiEIam6Y9k7TVpdgNWbXEZL4VcIafzMD1PLgcSxrZ
         dubg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si20453967plp.137.2019.01.11.06.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxeh-0006Jg-KM
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdt-0005cP-Ds
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxXW-0006sm-JM
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:12:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxXU-0006n8-Is; Fri, 11 Jan 2019 09:12:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8BE332FB0;
	Fri, 11 Jan 2019 14:11:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9AE65D6A9;
	Fri, 11 Jan 2019 14:11:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:55 +0100
Message-Id: <20190111140857.4211-14-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 11 Jan 2019 14:11:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 13/15] ui/console: Remove QemuDmaBuf from
 "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HlAN3s9E+f0j

Files requiring QemuDmaBuf already include "ui/console.h".

To clean "qemu/typedefs.h", move the declaration to "ui/console.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/typedefs.h | 1 -
 include/ui/console.h    | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index e44f1473a5..55f4de7259 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -77,7 +77,6 @@ typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
-typedef struct QemuDmaBuf QemuDmaBuf;
 typedef struct QEMUFile QEMUFile;
 typedef struct QemuLockable QemuLockable;
 typedef struct QemuMutex QemuMutex;
diff --git a/include/ui/console.h b/include/ui/console.h
index b74246f0f5..8396387c47 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -179,7 +179,7 @@ struct QEMUGLParams {
     int minor_ver;
 };
=20
-struct QemuDmaBuf {
+typedef struct QemuDmaBuf {
     int       fd;
     uint32_t  width;
     uint32_t  height;
@@ -187,7 +187,7 @@ struct QemuDmaBuf {
     uint32_t  fourcc;
     uint32_t  texture;
     bool      y0_top;
-};
+} QemuDmaBuf;
=20
 typedef struct DisplayChangeListenerOps {
     const char *dpy_name;
--=20
2.17.2

