Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357122wrh;
        Tue, 7 May 2019 01:20:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFQBPPBPxeSg20NieJHNrF2s8JmxZuElX2+LmXb4fNHQ9ylyzDoO2yJYKfL16f0lHgDs4q
X-Received: by 2002:a1c:a00d:: with SMTP id j13mr12075452wme.50.1557217222547;
        Tue, 07 May 2019 01:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217222; cv=none;
        d=google.com; s=arc-20160816;
        b=pC5ZfvXM6J5KqtpY2A7aDt0tQcBZH2/5tGbIMdHVbTSjYcTMG0U6zdGHpb6BWw8Fba
         7/Orjd/QP/mdJyfjEFN+ny40iT1/59bn+5geS8laIVRaqmTHLK+sSpsO4vMT90C87Wi/
         5u8A7t8GpuY3VuACsVAfYYoDzCx04TZEQ5E67izkaUT2ym5MJMJKjHwlJfIK06Xr8mz+
         RXVbU81cQH1nyB0ryFlEY9pUHEUtkbv/qlSjkszgPwLm9DjtRnL+U+EsOkhem/yIsYvq
         pgN+lA5iVlZ7+PXcNpT3aVMdn/Suri3NKffVyupx7E6cPsyUWDKiaGUidRpdDQQgBzg0
         8SMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8fE1A95Hx2odv+sVhf+dt/S3iKdzFB6EyC2GZZbFhOQ=;
        b=0ek8MQqCoilTBQLCRpdw9UupLXdPrWEioRe+CJKwdy5jMVyLqJrelUOJDzJ9gqoNSB
         ExPr/Q/hVgYVFjg+YLMv4o4evt0Tp7UhpumK8JwKriFLENOnm8fyWSpsTvKXLoNTYurJ
         IQnNbZ+i12E/47G8NkqmOKUK5PhQ80njaERbBQmim+mTNSTh91m9Gc3yXX71HAiTahCj
         KCrrA+z48Jd38SbLnB1ohPh0nefJRTUPxLLg/j/L27rzfvrBtyvuO8M7jdjzBjqrmoIg
         1iTY6qX1y2btOqYySDhlotjj4AexuPD++LU1bPOhjdqVswuqYkbKOeHYjNNUVtIBHafn
         4KEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si9190155wrj.214.2019.05.07.01.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvKn-0000ho-HW
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKM-0000eJ-C2
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKL-00089g-81
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKL-00088m-2N; Tue, 07 May 2019 04:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D20A30842B5;
	Tue,  7 May 2019 08:19:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82E425D9E1;
	Tue,  7 May 2019 08:19:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 887FFA1E1; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:40 +0200
Message-Id: <20190507081946.19264-3-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 07 May 2019 08:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 2/8] hw/display/cirrus_vga: Update the
 documentation URL
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
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52fVpUoDO4R/

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The documentation URL is not working, but is backed up by the
Wayback Machine on the Internet Archive.
Replace the outdated link by a captured one.
Add another link to the VGADOC4b.ZIP archive content.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190504121650.12651-1-philmd@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index a0e71469f4d0..a04440b3748c 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -23,8 +23,13 @@
  * THE SOFTWARE.
  */
 /*
- * Reference: Finn Thogersons' VGADOC4b
- *   available at http://home.worldonline.dk/~finth/
+ * Reference: Finn Thogersons' VGADOC4b:
+ *
+ *  http://web.archive.org/web/20021019054927/http://home.worldonline.dk=
/finth/
+ *
+ * VGADOC4b.ZIP content available at:
+ *
+ *  https://pdos.csail.mit.edu/6.828/2005/readings/hardware/vgadoc
  */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
--=20
2.18.1

