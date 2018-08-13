Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3237325wru;
        Mon, 13 Aug 2018 12:01:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzz6h0QB5g5P4lIVQLYpxMsiqP2jNOTpFRnlpYdskSTak3/J3r8BRV7oYfAEMik+Ul46CTh
X-Received: by 2002:a37:3447:: with SMTP id b68-v6mr16763371qka.171.1534186903541;
        Mon, 13 Aug 2018 12:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534186903; cv=none;
        d=google.com; s=arc-20160816;
        b=SpLMyG17wQyKaRJ19mS4f1r/PSGEeaTSCdbo9a+BGCpVECeELMMSzRtFYIO/C8alzh
         dieM4hpGXReM+MH1I/1WtIUJNjAKYWjuHOs+qLXHT0HXjOmsN8+1fudpR7pPUSfSZ9FV
         Vf2RLVLBCX1A5PV6vcA2izW5/bh2e0jz+HWyD7jfTNONCVIuH+eR+iePm2uCepFratIl
         jRNzx6W/3sDK4/wrJ6SO0ERojSbVb0O7L5umzSTFoGxtGnXhoDGdwSaRRmChfBclJaiX
         abKpSnZNDQbq/boOuinkIEu/jDCt0KwtSM/F4KUH6ZiDpk6xyU7rA9VyxOiuGm3m0T5Y
         Sk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1fpZSc02p3xpkmQt562B0E41qf3TEgZ+kED0Yz3XgHQ=;
        b=ERxWpJKFeDaowg6hNjqSYknWYbsgP6bx/y3ami5ZmR9WVwrvQohU8Yw3quHvnjEx+V
         1fqpJpoOumAJUUA4hxqMCixP2xW37mMcV9oImBmVuRO1wpoFoSb+tqg6fTp9S+YOezAJ
         5+8TonIGfGqRQ8G6h2ZoBmW+0kMm9lYVV3+TA63o/uHtT0CadNKhi2jyT+0+ajyxaUHf
         YwWIR7yHksK6M2ii2gXWpEhZi/D7aYZoERyJrRJHCzHKBeSx1ZAs/MUQF7IIIMb1zyyG
         NoXQQ61dsbReM3a/6oBqtVodMrhawgUO9NhXI26MbR9UpOSd7xY0Hf7sb9Lblppj5yt3
         3iaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10-v6si11347493qkj.165.2018.08.13.12.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 12:01:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpI62-00085E-W8
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 15:01:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsr-0001xt-Ga
	for qemu-devel@nongnu.org; Mon, 13 Aug 2018 14:48:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsq-00041F-Mz
	for qemu-devel@nongnu.org; Mon, 13 Aug 2018 14:48:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53520 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHso-00040E-OD; Mon, 13 Aug 2018 14:48:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BF6040216E5;
	Mon, 13 Aug 2018 18:48:02 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE5F22026D66;
	Mon, 13 Aug 2018 18:48:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 13 Aug 2018 19:46:21 +0100
Message-Id: <20180813184624.12071-4-stefanha@redhat.com>
In-Reply-To: <20180813184624.12071-1-stefanha@redhat.com>
References: <20180813184624.12071-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 13 Aug 2018 18:48:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 13 Aug 2018 18:48:02 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v5 3/6] loader: extract rom_free() function
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
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B4QEfj+q69n9

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

