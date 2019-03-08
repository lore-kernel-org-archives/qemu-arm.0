Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7815372wrx;
        Thu, 7 Mar 2019 17:46:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEglcNoRIdjgE1bDKJViYSDk4nkP3pWaSmmtQfsL9DwCtVBDmgFT5DKftFgS/1MAdLeAYo
X-Received: by 2002:a81:8a87:: with SMTP id a129mr13134418ywg.161.1552009599106;
        Thu, 07 Mar 2019 17:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009599; cv=none;
        d=google.com; s=arc-20160816;
        b=JQwSVvyHwczRsEf6JfqNiKjsnZv1ojmDCDGzb3IdFS1ZkqW2wOGba5WhfMN+B5XCpt
         GJcMLlmjJUDyuL0w1rMH4132ewKQGZn7WOMMu30ovXBg/oSuN90F4FW4h9bOz2ErKWMe
         Og7xLQZkgGR5G9l0ZVayfJWYXD7KHmTRTDutUYe89zibDZuCZQbrZmxAAPENFlAHklqf
         su7dMwBiGLu6NrlH4sMCfCHEiGhiIT7UcnmWJQN5yJElWIyB87VCofuj/symsl4nZ9dI
         21LKMmUKXcHOuCUD82b5jsiG3kUKbIV1gv9C4DgCuWsYuHBT8ldMS5VI2f94TmMswVV2
         qPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2TJaBI32E8Un8eCTV9TjOlYe907znlCRu01yzSDV0Rw=;
        b=RTl0CrAnv6s8E2UvazURUcAEfpA2wRiHxQLN/Yw2Gr0VnovB/dQn4PWe/fo2Yka0WJ
         Hrp0G9Bm9xF4L9jGONZ4F1gB51nNI+eHLSeIDWQUbKje70oVfPmeszWAaH4BSAaTPTdW
         W4JhwEO8Ic0VXPt5msso3RH0kl+k+zQ1mELzUoD4q779loqQth3zXbcKUF8RHBvf8ktR
         VAxO+0IkrXYQlH+J6EvBCMpoxwgWZbP1SfIMif1+W1rj4IztWR2rlUMnbNjJVVX7mX+r
         tzpKX2QWgaw+fOEB7SxOEufFMyqmQnRP7LGursBR4LB4ZAjdgZN7yUNzzitGzm4bemjS
         Nuaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si4018408ybd.460.2019.03.07.17.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24as-00055B-Hq
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24QH-0004QU-3S
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:35:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24QE-0003L8-7P
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 20:35:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Q9-0003Ae-VZ; Thu, 07 Mar 2019 20:35:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F423B307DABB;
	Fri,  8 Mar 2019 01:35:32 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B5860BE5;
	Fri,  8 Mar 2019 01:35:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:19 +0100
Message-Id: <20190308013222.12524-16-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 08 Mar 2019 01:35:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 15/18] hw/nvram/fw_cfg: Add
 fw_cfg_add_file_from_host()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9MUqkR/YfuIb

Add a function to read the full content of file on the host, and add
a new 'file' name item to the fw_cfg device.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: s/ptr/data, corrected documentation (Laszlo)
---
 hw/nvram/fw_cfg.c         | 21 +++++++++++++++++++++
 include/hw/nvram/fw_cfg.h | 23 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 4c82dcc125..a46a7c8f06 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -890,6 +890,27 @@ void fw_cfg_add_file(FWCfgState *s,  const char *fil=
ename,
     fw_cfg_add_file_callback(s, filename, NULL, NULL, NULL, data, len, t=
rue);
 }
=20
+void *fw_cfg_add_file_from_host(FWCfgState *s, const char *filename,
+                                const char *host_path, size_t *len)
+{
+    GError *gerr =3D NULL;
+    gchar *data =3D NULL;
+    gsize contents_len =3D 0;
+
+    if (g_file_get_contents(host_path, &data, &contents_len, &gerr)) {
+        fw_cfg_add_file(s, filename, data, contents_len);
+    } else {
+        error_report("%s", gerr->message);
+        g_error_free(gerr);
+        return NULL;
+    }
+    if (len) {
+        *len =3D contents_len;
+    }
+
+    return data;
+}
+
 void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
                         void *data, size_t len)
 {
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 5ac9adfe1f..75a29858dc 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -172,6 +172,29 @@ void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uin=
t64_t value);
 void fw_cfg_add_file(FWCfgState *s, const char *filename, void *data,
                      size_t len);
=20
+/**
+ * fw_cfg_add_file_from_host:
+ * @s: fw_cfg device being modified
+ * @filename: name of new fw_cfg file item
+ * @host_path: path of the host file to read the data from
+ * @len: pointer to hold the length of the host file (optional)
+ *
+ * Read the content of a host file as a raw "blob" then add a new NAMED
+ * fw_cfg item of the file size. If @len is provided, it will contain th=
e
+ * total length read from the host file. The data read from the host
+ * filesystem is owned by the new fw_cfg entry, and is stored into the d=
ata
+ * structure of the fw_cfg device.
+ * The next available (unused) selector key starting at FW_CFG_FILE_FIRS=
T
+ * will be used; also, a new entry will be added to the file directory
+ * structure residing at key value FW_CFG_FILE_DIR, containing the item =
name,
+ * data size, and assigned selector key value.
+ *
+ * Returns: pointer to the newly allocated file content, or NULL if an e=
rror
+ * occured. The returned pointer must be freed with g_free().
+ */
+void *fw_cfg_add_file_from_host(FWCfgState *s, const char *filename,
+                                const char *host_path, size_t *len);
+
 /**
  * fw_cfg_add_file_callback:
  * @s: fw_cfg device being modified
--=20
2.20.1

