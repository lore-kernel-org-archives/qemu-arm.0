Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9724510wrx;
        Sat, 9 Mar 2019 10:22:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKnnnbqjrfNkVjqTVSvPUB+x3oXDHe5FislimvOA5EWqVqW2D0iinltcLZBCFIwiv4tMMU
X-Received: by 2002:a81:120c:: with SMTP id 12mr19345583yws.147.1552155729602;
        Sat, 09 Mar 2019 10:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552155729; cv=none;
        d=google.com; s=arc-20160816;
        b=Dbj/ay8ce1gnl3PMfOd4MpWPPv6mYRDFGpXM5WpCYF4LXbYfVBef9x5rocBKxgNnT7
         3Wf9FJHkRNMA1Vj2UG0iUSIeqOZ9OJdWFC44qEvPCaInyB0mAh7Mgn/OnsMkauMmuqdz
         uYNa9dH5d3wrr/wewTaXlsbBiRSxE3Zotuthe1b14jA6jaZV5KVcqg4yWnpSAmmrrpkt
         gqoeILz8STDeQQSRJJ9oyPMkqiyBZ7O540crdjASuKBcAhPycMccgF+3nUhYvBL86lIz
         yEZfz6EKvHScHOyHbDuGQwo74YXiEkyBMOOlMVYnd6leepj+LiqYUMMay4E+lqGeEKPJ
         hiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uErEsPBqd7xST30Z8N9lUUChd9O6ZzkH/LHUxtTVeD8=;
        b=iv5j7HfjKlIY5TWkED2JGGAm09QwJorOz7/3X86c9p61utCF2hLuSZ3p4adydXHRSq
         isyNNDo4UnMpP0zDlFnUhSDgOYM2LzVkPKZFzbSIklEhlRsqBWdScs0YuQ2TtwyR+Ynp
         KIbvO1rmN7L92hsC8z0qDOQuVza+uAz2gGJC2C+VMOGOmmYsegOeyxkuH0r0VmfeoFRH
         A7wvpTrB8aSFwbTpnicZdtz9bRUDLrRDrdSY//hKcXy0hY4vg50vEz6ulezuDdGQBQK8
         omT8J5QJHLOgbomuZckb1SpUqpL9d20oE86Q0YK1AAazUD+WkUk9tOL87Xw0pABGEAc8
         s7EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si538315ybg.181.2019.03.09.10.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 10:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2gbp-0002d0-3B
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 13:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZQ-00012G-Qa
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZP-0004Cb-32
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h2gZO-0004BY-Hw; Sat, 09 Mar 2019 13:19:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D5DE3082B4D;
	Sat,  9 Mar 2019 18:19:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9214611A6;
	Sat,  9 Mar 2019 18:19:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  9 Mar 2019 19:19:20 +0100
Message-Id: <20190309181920.30553-3-philmd@redhat.com>
In-Reply-To: <20190309181920.30553-1-philmd@redhat.com>
References: <20190309181920.30553-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 09 Mar 2019 18:19:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 2/2] hw/nvram/fw_cfg: Use the ldst API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8XVSGJhExly

The load/store API eases code review.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 7fdf04adc9..3d8859e333 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *fil=
e_sizep,
     }
=20
     /* check magic ID */
-    filehead =3D ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
+    filehead =3D lduw_le_p(content);
     if (filehead =3D=3D 0xd8ff) {
         file_type =3D JPG_FILE;
     } else if (filehead =3D=3D 0x4d42) {
@@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *fil=
e_sizep,
=20
     /* check BMP bpp */
     if (file_type =3D=3D BMP_FILE) {
-        bmp_bpp =3D (content[28] + (content[29] << 8)) & 0xffff;
+        bmp_bpp =3D lduw_le_p(&content[28]);
         if (bmp_bpp !=3D 24) {
             goto error;
         }
--=20
2.20.1

