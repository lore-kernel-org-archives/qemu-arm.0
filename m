Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1003385wrs;
        Tue, 12 Mar 2019 15:57:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhTiswPmDDmvIr3BIRVNnlnEJ7HzGHTU3Y7t6TVsQRbKJFrOB1+xSXU3StCkZOQbRGTddq
X-Received: by 2002:a25:6652:: with SMTP id z18mr14770883ybm.146.1552431421642;
        Tue, 12 Mar 2019 15:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552431421; cv=none;
        d=google.com; s=arc-20160816;
        b=xw0KwGXTg5zROCIllqJqDStSiaOkDr2Kq4Hxd9k+KSK21mnEjqkD7mtH1vZdeT/ZOS
         Xe13wZjXH9nSJW71QXhmBmmHc/MROSa12K/RbLiHxxamdB4BKSRjXAMKKiItRIizZO6A
         i0uNTlYXbVYXrBlBaWzQpAFPGGB1yMG9w5iAL9SvhDInO5m6XX2qfHvz+8/QkRsdJEDc
         iqgY4uSaFjAHNTZMIHBNaiD0DadN497GsLtSJyfCNfT2y5iE0XcdNxRQSjZdRl4+IvS0
         /pIG1wiNAN3b+8zWr0em9EC7qhCTgPXADA++uzgKpN7CksI8JFlq44mWXaVVjJdAE/3Q
         kYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=g4D/wo5pDMP5FnF1xhTKCQe4I7k4hkzBekAB2McLOao=;
        b=Pkr+adDWbfiAqt0QZOg46Vllrn/2qmHfhWoxgPBZkFRGovPhOKxVkywTa7WjWGDgDQ
         1r5bxjxpaOen2b+E3k0SUYfgORkHegTo/nmUEtEUPdG0uZp0medWgqbpxNPRxFgw4AmK
         gVo+G4QOfNYNRT5NSwT585CMBQAz2tYN0hCdqTwqVDINV6meWCvj5hr/cy0EClCMnz8t
         FCykdaKjyNeJTpovPlpphOvRanJunpUDdUL71fYL4qnQFTPTpCCYV7oZGQ/R7xhYvG+x
         1QP3X88pqyG0/9+mXVgjPA7IETm5+qz+4v4CUNwjZOtkWpN95+5Y+sA1QyWyuxgGuUD/
         W7Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b66si5605281ywh.398.2019.03.12.15.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 15:57:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3qKT-0001kW-2D
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 18:57:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKL-0001jN-Ao
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKK-0005fc-Es
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:56:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3qKK-0005ey-5e; Tue, 12 Mar 2019 18:56:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66633307D90F;
	Tue, 12 Mar 2019 22:56:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2432F60C1B;
	Tue, 12 Mar 2019 22:56:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 23:56:29 +0100
Message-Id: <20190312225632.29777-2-philmd@redhat.com>
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com>
References: <20190312225632.29777-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 12 Mar 2019 22:56:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 1/4] hw/nvram/fw_cfg: Add
 fw_cfg_add_file_from_host()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4vTq45Z6HqH

Add a function to read the full content of file on the host, and add
a new 'file' name item to the fw_cfg device.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: s/ptr/data, corrected documentation (Laszlo)
v3: inverted the if() logic
v4: does not return pointer to alloc'd data (Markus)
---
 hw/nvram/fw_cfg.c         | 23 +++++++++++++++++++++++
 include/hw/nvram/fw_cfg.h | 25 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 5c3a46ce6f..a8fb829162 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -825,6 +825,29 @@ void fw_cfg_add_file(FWCfgState *s,  const char *fil=
ename,
     fw_cfg_add_file_callback(s, filename, NULL, NULL, NULL, data, len, t=
rue);
 }
=20
+bool fw_cfg_add_file_from_host(FWCfgState *s, const char *filename,
+                               const char *host_path, size_t *len,
+                               Error **errp)
+{
+    GError *gerr =3D NULL;
+    gchar *data =3D NULL;
+    gsize contents_len =3D 0;
+
+    if (!g_file_get_contents(host_path, &data, &contents_len, &gerr)) {
+        error_setg(errp, "%s", gerr->message);
+        g_error_free(gerr);
+        return false;
+    }
+    fw_cfg_add_file(s, filename, data, contents_len);
+    /* TODO g_free 'data' */
+
+    if (len) {
+        *len =3D contents_len;
+    }
+
+    return true;
+}
+
 void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
                         void *data, size_t len)
 {
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index f5a6895a74..4c8cdd89bb 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -166,6 +166,31 @@ void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uin=
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
+ * @errp: pointer to a NULL initialized error object
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
+ * Returns true on success, false on failure. In the latter case,
+ * an Error object is returned through @errp.
+ */
+bool fw_cfg_add_file_from_host(FWCfgState *s, const char *filename,
+                               const char *host_path, size_t *len,
+                               Error **errp);
+
 /**
  * fw_cfg_add_file_callback:
  * @s: fw_cfg device being modified
--=20
2.20.1

