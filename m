Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4345508wru;
        Tue, 14 Aug 2018 10:49:09 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwvpaVdFh6iy/geICzBBrdsoeIfM+0mperGMNnyQCJp1nryArZ+/S1GzXbmRw7clegmbeyJ
X-Received: by 2002:a0c:9666:: with SMTP id 35-v6mr19900884qvy.137.1534268949209;
        Tue, 14 Aug 2018 10:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534268949; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQS3JvrErWzcoUptSbFNCVZIn8jZUzlIvlpEvglzmQViadusuLETedztax8H4cOvEl
         TK2dgR/cGsf3o6oLfC/LdsQMnZ32FUCqfccqZthRbZBdvsqyRb+lTEzPX+owb2ljdfUa
         cXnY5tZsgxa/TAjYtjD67qCsokgii/O/szjFS7qpfAKWGl8KjSNE+GS464NN2F4V7P9M
         w2ZjRj95ymOCvbDBMv6sD5GMR00dzjShbhugwTgJShzHWho6f43Zs0pE7L7GVXltDnmT
         FZPl+R6m5n+MbIF+VyJ4aMsKX858BUM47ZsrRfByn2vDAHNr52R3njRqHXiFgIrLm2M1
         Jiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1fpZSc02p3xpkmQt562B0E41qf3TEgZ+kED0Yz3XgHQ=;
        b=rf7DcEwm9UgyzYNn85zOubAo14mrFN3npixchtkLoYjy69Ziw2d3ckD6GBbJt5arHq
         BfPvEVYFuearAyMBTb9OxhvuGPK2PgzwlKU0vq1JDn3Flzt9nelhtAGtYtycgNKRP9sT
         WntcPD6a+zZF+Usq/wmkDA5xToWFHTZOqkSZsHQ3gI3Qm6lqd7fV0waK5VYlNpO9C08f
         vVbn+CVk0AgeRHfQtJEulUv5G0rIHFtLr646Beikvma1mHkBnPX5F2bxjmthZp+y2gMp
         ewLUNLZxSd6XFftr3hx64OgqNvMBwHpppCociDFdfzrQO7ZTaUBCZ2f2/5DD0Luq0TFm
         R1QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o64-v6si3161230qte.153.2018.08.14.10.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdRM-00087i-Kz
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:49:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdOY-0006Fl-LN
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdOJ-0002TF-Gj
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:46:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36788 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpdNo-0001Nl-Qe; Tue, 14 Aug 2018 13:45:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8926ABD98;
	Tue, 14 Aug 2018 16:29:52 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1494F2026D7E;
	Tue, 14 Aug 2018 16:29:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 14 Aug 2018 17:27:36 +0100
Message-Id: <20180814162739.11814-4-stefanha@redhat.com>
In-Reply-To: <20180814162739.11814-1-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 14 Aug 2018 16:29:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 14 Aug 2018 16:29:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v6 3/6] loader: extract rom_free() function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3l0Tx+9ZNUH

The next patch will need to free a rom.  There is already code to do
this in rom_add_file().

Note that rom_add_file() uses:

  rom =3D g_malloc0(sizeof(*rom));
  ...
  if (rom->fw_dir) {
      g_free(rom->fw_dir);
      g_free(rom->fw_file);
  }

The conditional is unnecessary since g_free(NULL) is a no-op.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/core/loader.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index bbb6e65bb5..0c72e7c05a 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -847,6 +847,17 @@ struct Rom {
 static FWCfgState *fw_cfg;
 static QTAILQ_HEAD(, Rom) roms =3D QTAILQ_HEAD_INITIALIZER(roms);
=20
+/* rom->data must be heap-allocated (do not use with rom_add_elf_program=
()) */
+static void rom_free(Rom *rom)
+{
+    g_free(rom->data);
+    g_free(rom->path);
+    g_free(rom->name);
+    g_free(rom->fw_dir);
+    g_free(rom->fw_file);
+    g_free(rom);
+}
+
 static inline bool rom_order_compare(Rom *rom, Rom *item)
 {
     return ((uintptr_t)(void *)rom->as > (uintptr_t)(void *)item->as) ||
@@ -995,15 +1006,7 @@ err:
     if (fd !=3D -1)
         close(fd);
=20
-    g_free(rom->data);
-    g_free(rom->path);
-    g_free(rom->name);
-    if (fw_dir) {
-        g_free(rom->fw_dir);
-        g_free(rom->fw_file);
-    }
-    g_free(rom);
-
+    rom_free(rom);
     return -1;
 }
=20
--=20
2.17.1

