Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp424656wrt;
        Thu, 3 Jan 2019 01:16:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6J7JpoXbk3doQ4FG8iNxSqDHZA3HSDQqHB3/wNMc+0heQAT6TdLbvz3z/yk0+ezB5BPB2p
X-Received: by 2002:a0c:b28e:: with SMTP id r14mr46045468qve.241.1546506973486;
        Thu, 03 Jan 2019 01:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546506973; cv=none;
        d=google.com; s=arc-20160816;
        b=ZiQ8UddAE9zcIRuvMBN94TKfYdrBX/jdmTR03j0rbOr73IcrUoRrQfMMa/EZVuKbr0
         fKnsaCbgajohA/F5818iyVSZixwbANCRy7YEUujggu0IOsLpD5aHMA+t+b9XxPl61XR0
         KVcQMOnxJrmPgZ31JOgJNZslkAh569ahWeQlDonKKsJQcxXgRLnq/a81il8Gv+nQrXUC
         1tUJDt7CYlbFDJEGJDpBcrYTMR2TsaWSS7zrrsMeRxrRLVc69amrdQJ1OL0F1tJ/cvXy
         aWx1FRhNtknhzWhoRcnM5cSAe/yKvi2tVTIZJSMNN8ZmpcE3MnK2GV+lXys5TaLkDDtK
         RlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=AG9tXivF7pDH4GMn2gBfdBfBYCUhK6lMljzN42F8CEk=;
        b=S1Y83NCCfxGQHU5Myvi5SWxUTzWNGKmQP2CCtTtKU356jvdoGEhqdf3fZgA0wnS7kv
         KoLbLUhlVKUGe3QotayKMH4jSD+FRVfJcP6k+v6uOKIeytJ3GgS6XMsUT9UjHWbO/x8Z
         NryygL95V963YBD+2buqYhbRcj084y29L9J3LOH9vOuPITCqoWK9KHNOYOofFBGZnbvY
         yfjurD7r95WVo1CzDZLfD4TiFO2MLN9osIHZ23CtM7juUvxsirlAWwqdK5MA5uUjzwBT
         bhiQ9Lv4Shfrh10NS21dTIMRDk8c1wmBF6CqUArx3TPv3t8vM7FfbvifUJmJoPb3oysj
         oXVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m43si12379671qvm.77.2019.01.03.01.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez6q-0006k8-LL
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:16:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3X-0003Iq-My
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3W-0006Ui-Lk
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:12:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3W-0006UP-En; Thu, 03 Jan 2019 04:12:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99EBD12039;
	Thu,  3 Jan 2019 09:12:45 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF3C5D757;
	Thu,  3 Jan 2019 09:12:42 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:09 +0000
Message-Id: <20190103091119.9367-2-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 03 Jan 2019 09:12:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 01/11] qtest: Add set_irq_in command to set
 IRQ/GPIO level
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tAq8CT42FTde

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Adds a new qtest command "set_irq_in" which allows
to set qemu gpio lines to a given level.

Based on https://lists.gnu.org/archive/html/qemu-devel/2012-12/msg02363.h=
tml
which never got merged.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Originally-by: Matthew Ogilvie <mmogilvi_qemu@miniinfo.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/libqtest.h | 13 +++++++++++++
 qtest.c          | 43 +++++++++++++++++++++++++++++++++++++++++++
 tests/libqtest.c | 10 ++++++++++
 3 files changed, 66 insertions(+)

diff --git a/tests/libqtest.h b/tests/libqtest.h
index 9758c51be6..7ea94139b0 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -230,6 +230,19 @@ void qtest_irq_intercept_in(QTestState *s, const cha=
r *string);
  */
 void qtest_irq_intercept_out(QTestState *s, const char *string);
=20
+/**
+ * qtest_set_irq_in:
+ * @s: QTestState instance to operate on.
+ * @string: QOM path of a device
+ * @name: IRQ name
+ * @irq: IRQ number
+ * @level: IRQ level
+ *
+ * Force given device/irq GPIO-in pin to the given level.
+ */
+void qtest_set_irq_in(QTestState *s, const char *string, const char *nam=
e,
+                      int irq, int level);
+
 /**
  * qtest_outb:
  * @s: #QTestState instance to operate on.
diff --git a/qtest.c b/qtest.c
index 69b9e9962b..451696b5da 100644
--- a/qtest.c
+++ b/qtest.c
@@ -164,6 +164,17 @@ static bool qtest_opened;
  * where NUM is an IRQ number.  For the PC, interrupts can be intercepte=
d
  * simply with "irq_intercept_in ioapic" (note that IRQ0 comes out with
  * NUM=3D0 even though it is remapped to GSI 2).
+ *
+ * Setting interrupt level:
+ *
+ *  > set_irq_in QOM-PATH NAME NUM LEVEL
+ *  < OK
+ *
+ *  where NAME is the name of the irq/gpio list, NUM is an IRQ number an=
d
+ *  LEVEL is an signed integer IRQ level.
+ *
+ * Forcibly set the given interrupt pin to the given level.
+ *
  */
=20
 static int hex2nib(char ch)
@@ -326,7 +337,39 @@ static void qtest_process_command(CharBackend *chr, =
gchar **words)
         irq_intercept_dev =3D dev;
         qtest_send_prefix(chr);
         qtest_send(chr, "OK\n");
+    } else if (strcmp(words[0], "set_irq_in") =3D=3D 0) {
+        DeviceState *dev;
+        qemu_irq irq;
+        char *name;
+        int ret;
+        int num;
+        int level;
=20
+        g_assert(words[1] && words[2] && words[3] && words[4]);
+
+        dev =3D DEVICE(object_resolve_path(words[1], NULL));
+        if (!dev) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Unknown device\n");
+            return;
+        }
+
+        if (strcmp(words[2], "unnamed-gpio-in") =3D=3D 0) {
+            name =3D NULL;
+        } else {
+            name =3D words[2];
+        }
+
+        ret =3D qemu_strtoi(words[3], NULL, 0, &num);
+        g_assert(!ret);
+        ret =3D qemu_strtoi(words[4], NULL, 0, &level);
+        g_assert(!ret);
+
+        irq =3D qdev_get_gpio_in_named(dev, name, num);
+
+        qemu_set_irq(irq, level);
+        qtest_send_prefix(chr);
+        qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "outb") =3D=3D 0 ||
                strcmp(words[0], "outw") =3D=3D 0 ||
                strcmp(words[0], "outl") =3D=3D 0) {
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 1d75d3c936..55750dd68d 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -753,6 +753,16 @@ void qtest_irq_intercept_in(QTestState *s, const cha=
r *qom_path)
     qtest_rsp(s, 0);
 }
=20
+void qtest_set_irq_in(QTestState *s, const char *qom_path, const char *n=
ame,
+                      int num, int level)
+{
+    if (!name) {
+        name =3D "unnamed-gpio-in";
+    }
+    qtest_sendf(s, "set_irq_in %s %s %d %d\n", qom_path, name, num, leve=
l);
+    qtest_rsp(s, 0);
+}
+
 static void qtest_out(QTestState *s, const char *cmd, uint16_t addr, uin=
t32_t value)
 {
     qtest_sendf(s, "%s 0x%x 0x%x\n", cmd, addr, value);
--=20
2.19.2

