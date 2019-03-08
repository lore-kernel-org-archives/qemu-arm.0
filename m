Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7806357wrx;
        Thu, 7 Mar 2019 17:33:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJcyEkTdKXHxDt2ylc4BxVekwy3PiM5onslJwzzbDejsa37394To+9yNEKx64MLfxYHHgP
X-Received: by 2002:a25:8509:: with SMTP id w9mr14783450ybk.64.1552008825160;
        Thu, 07 Mar 2019 17:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008825; cv=none;
        d=google.com; s=arc-20160816;
        b=of1vkNJcHRWPEBOu4V0/dCF+eZ6ArlzzJLay/jyu9ZktTuE7WpQs/YbinnaNzuunmG
         hmZkKUlpWVRUfZq5pMBbVxkqO6G9+gdbRdU6QCOCDhFAGyB/sW0hueZPfZYXMh+MNGMK
         cPQe2X2n9ikpLXND3xNpJDe43AZk9gOomV1+An4kjKrqzajn5PzW22REaO5NuO1LPxor
         Ra3RjXpP2zV4fGmL45nEHWT4XPLnH1az+LSkv81JXSr+XQgLW/TU9Ir/ZMl8MN1OR6TH
         pBu5C/l5lrQf7og284Y5092x4mTVC05P0lVABEzkc1o3EzeS2iAnQqbIGZVGY9fRCwCU
         0A5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mcTcn0x0gb3cFdX73moCVIvu7JPcgP2NaTmQhBt+MVw=;
        b=I+G5XFShphchSj+r770+CcVmxU+kbDttcUdMRrBbahHoRzLc7aWyfGh1aDuwDFMoMy
         5ix2/vbUo10LwD0i0lIpN89/e6380r2VtYo/DWQqPLZns6injaldkWGTWYls+OuPQ7DC
         xBfavdQfL3ylVcEqMCxcgaKEYjj5o2/5ocvsp/CCeTHjlyotzEg8R3gLq7o4s4rQdRgi
         rFFlP9cte/+G06UY71Y78UOC1cyBh2V+5KZIRa27ZEnWhVDjjBUO3pVkzwwbujV7RfrB
         uxIh01+RmSQriiY6jFO8N7seKaBtzL4B6a1dEdY9n0hzyuHyly/GhJZjG7XMq3ev5I3u
         KRiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f192si3661828ywb.116.2019.03.07.17.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:33:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24OO-0002Kc-IW
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Nw-0002Cx-8V
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Nu-0000Bx-2A
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42438)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Ns-0008WN-1j; Thu, 07 Mar 2019 20:33:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F9293089ED3;
	Fri,  8 Mar 2019 01:33:06 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 942D160BE5;
	Fri,  8 Mar 2019 01:32:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:07 +0100
Message-Id: <20190308013222.12524-4-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 08 Mar 2019 01:33:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 03/18] cutils: Add qemu_strdup_hexlify() and
 qemu_strdup_unhexlify()
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
X-TUID: IZxgKGcNl6p6

Add two helpers: one to represent a binary data as a string of
hexadecimal values, and one to restore a such string into its
original binary data.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/cutils.h | 33 ++++++++++++++++++++++++++
 util/cutils.c         | 55 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index d2dad3057c..375a5508b0 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -171,6 +171,39 @@ bool test_buffer_is_zero_next_accel(void);
 int uleb128_encode_small(uint8_t *out, uint32_t n);
 int uleb128_decode_small(const uint8_t *in, uint32_t *n);
=20
+/**
+ * qemu_strdup_hexlify:
+ *
+ * Encode a sequence of binary data into its hexadecimal stringified
+ * representation.
+ *
+ * @ptr: Buffer to hexlify
+ * @size: Length of the buffer
+ *
+ * Use qemu_strdup_unhexlify() to convert the hex string to original dat=
a.
+ *
+ * Returns: A newly allocated, zero-terminated hex encoded string repres=
enting
+ * the data. The returned string must be freed with g_free().
+ */
+gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize size);
+
+/**
+ * qemu_strdup_unhexlify:
+ *
+ * Decode a sequence of hexadecimal encoded text into binary data.
+ *
+ * @hex_string: String to unhexlify
+ * @out_size: if not NULL: gsize to be written with the data length
+ *
+ * This function is the opposite of qemu_strdup_hexlify().
+ *
+ * Returns: A newly allocated buffer containing the binary data that tex=
t
+ * represents. The returned buffer must be freed with g_free().
+ * Note that the returned binary data is not necessarily zero-terminated=
,
+ * so it should not be used as a character string.
+ */
+gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_size)=
;
+
 /**
  * qemu_pstrcmp0:
  * @str1: a non-NULL pointer to a C string (*str1 can be NULL)
diff --git a/util/cutils.c b/util/cutils.c
index e098debdc0..bf324c0d8b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -779,6 +779,61 @@ int uleb128_decode_small(const uint8_t *in, uint32_t=
 *n)
     }
 }
=20
+static guchar hexval(const gchar v)
+{
+    switch (v) {
+    case '0' ... '9':
+        return v - '0';
+    case 'A' ... 'F':
+        return v - 'A' + 10;
+    case 'a' ... 'f':
+        return v - 'a' + 10;
+    default:
+        return 0;
+    }
+}
+
+gchar *qemu_strdup_hexlify(gconstpointer ptr, gsize len)
+{
+    guchar *data =3D (guchar *)ptr;
+    gchar *hex_string;
+
+    if (!ptr || !len) {
+        return g_strdup("");
+    }
+
+    hex_string =3D g_malloc(2 * len + 1);
+    for (gsize i =3D 0; i < len; i++) {
+        g_snprintf(&hex_string[2 * i], 3, "%02x", data[i]);
+    }
+
+    return hex_string;
+}
+
+gpointer qemu_strdup_unhexlify(const gchar *hex_string, gsize *out_size)
+{
+    size_t size =3D 0;
+    guchar *data =3D NULL;
+
+    if (hex_string) {
+        size =3D strlen(hex_string) / 2;
+        if (size) {
+            size_t i;
+
+            data =3D g_new(guchar, size + 1);
+            for (i =3D 0; i < size; i++) {
+                data[i]  =3D hexval(*hex_string++) << 4;
+                data[i] |=3D hexval(*hex_string++);
+            }
+            data[i] =3D '\0';
+        }
+    }
+    if (out_size) {
+        *out_size =3D size;
+    }
+    return data;
+}
+
 /*
  * helper to parse debug environment variables
  */
--=20
2.20.1

