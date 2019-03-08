Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7806440wrx;
        Thu, 7 Mar 2019 17:33:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKqRXMyuwcerLuKjfVdDj0MX2l6zqKDa4MejisUGgWXyMVhwBp8e6ccaaP6dfxzrtv5oLd
X-Received: by 2002:a25:870a:: with SMTP id a10mr13939525ybl.339.1552008830004;
        Thu, 07 Mar 2019 17:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008829; cv=none;
        d=google.com; s=arc-20160816;
        b=y2p2IKGaOaMwWYB8MwfqCFFjQjlGdzZ5Rq6UeEA0cf8tDFNZxhsEHHbS+in9ttFxVx
         t8BTMoypgElZJ3aeAJ5Xn4ocJUyrRcGAzzl1bzPIgf3RaSGbXl+QYZpfCwX24T2UAjHs
         YDMVhHnvGQING8MqwoHJKsso0MPC5JWgukXiJkYTh8sFu8jtMCTttK4f7wpoyaVAYiU0
         9Oxk/WHmZDXHIqf3783yC/SQxLjni/+qFn5+blWDueOZ6R2PexnoxCP7A2UOartmhLY3
         NKfrFfJpaMfKug0WPMLgRWAKW0kZK1KRJZQTERO7gohx4pww334pfQRr7x7ChiBQqDJr
         k3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Q1Df8eHlFJDJ75URzUUuJH8PQ3oUgTJbs0d+tJzTL1w=;
        b=B8iRVKkXRC1BXHRmOM3KabnCsJuitX9okWbJWDZGn+35eySiXBn44spMldgisSyAUa
         XUcDZsBf3JGS19QM0aTsC3MjKDpcQqRSLSDn+gV50/auhyMy1JITjvO+1cBK0kzz4T79
         nkj2UJUsDXtOYAKIfQuhRRCVXOJdBSgHQj5+iLxuOGgp2/D+HBhIcX79z9ZQCsnoeSNo
         dH9md56mF507xKTcBrzQYBQ5ydKVhm1QhpHEiQMZDlsZS+l63ayqO3QVmY63dlVWOQqD
         DvPfRbaiEuksqjjTrvruAJpQf0ATqIoMhfpbTLOD6iKEPHWlFHcjQkLTOSOhZOGx/yiz
         pSRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si3825343ybj.439.2019.03.07.17.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24OT-0002MR-D0
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24OA-0002KL-8U
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24O9-0000gC-GW
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24O7-0000b9-Oh; Thu, 07 Mar 2019 20:33:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E28B03099FCB;
	Fri,  8 Mar 2019 01:33:26 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C024760BE5;
	Fri,  8 Mar 2019 01:33:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:09 +0100
Message-Id: <20190308013222.12524-6-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 08 Mar 2019 01:33:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 05/18] hw/nvram/fw_cfg: Use the ldst API
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
X-TUID: KBZM04gryjKr

The load/store API eases code review.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 684c2cf00a..8eb76a382c 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -141,7 +141,7 @@ static char *read_splashfile(char *filename, gsize *f=
ile_sizep,
     }
=20
     /* check magic ID */
-    filehead =3D ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
+    filehead =3D lduw_le_p(content);
     if (filehead =3D=3D 0xd8ff) {
         file_type =3D JPG_FILE;
     } else if (filehead =3D=3D 0x4d42) {
@@ -152,7 +152,7 @@ static char *read_splashfile(char *filename, gsize *f=
ile_sizep,
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

