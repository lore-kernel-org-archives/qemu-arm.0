Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp195467wrt;
        Fri, 11 Jan 2019 06:24:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5EBQXvOo25SeOri+3TmVuPJFe4yXB86Ik4wicmhFjqiLlRCP/ZLJOjF6pqTRrMGwFOELYl
X-Received: by 2002:a1c:16c5:: with SMTP id 188mr2578446wmw.69.1547216649599;
        Fri, 11 Jan 2019 06:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216649; cv=none;
        d=google.com; s=arc-20160816;
        b=oX1wKOqkftdxxDJ2xO9519MW3c12UjwwlSznzfPpLP+B0LEoFhtBbObYFeUKPqHSaW
         pGmjRq38c4hcU0uVVlDzP539IlsoXTCEBvnbdoTW8E7+FXjlw8P+gnqUV3GpijAECuky
         USlv5DQvflB5ETcNREFrIQ4txqalgEcwbY8vvBkbVnP+02eVbuodI5Pr5Jskna0CxJbM
         Dw1MYDMA7Tso5QZQERZMG/mMB6YEkVSa0BKm3ez6vn9kkvbk0tJUfwmIVrShFTTFJfvS
         Ty3gNaLGoNLkbuuHut1b04TznFahB/nFKeJjkOqqPqGv4M1Vs+bkp/0WnM2XnJVwnleK
         jT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7NiOPdcmNrYu44kMPmBI2FDl7Jb/cx8AQLZ/VbRU9TY=;
        b=p/d9ihTLkZNgptqeg+jYT+R3fjSMtToDNDvJXDWgJakMIUwxPlt7MHEqvruJyh1Ire
         gZge9IMSG7Tf+WwirfkJEUbKa0BkHKhEm9/CzQhtCnU5DC58y4l9HCFvr7vukvu/tHr5
         SxSuzZnr4GTvktYcJ791jnkuDthm7XdUzw+9nKJZk+I+mhDzUU4FP3+xZUSrFSPli6su
         Y5zoSOunIKakrM068SylXWoObgGMdM6VAtVjD9rlrOOAsMDrj3KqvKc74xHdxnDxVLQZ
         3oOoWshS59dcbaoVu0CDtNcaLXIGvgey1s1kgUrcQVnlwhdtlSioEOBwIt8qMt/Mb8l6
         RE0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 200si13391537wmm.114.2019.01.11.06.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxjE-0002Es-LW
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe3-0005uM-EO
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxVi-0002Cr-Co
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:10:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxVi-0002Am-6i; Fri, 11 Jan 2019 09:10:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F0DB7AEA8;
	Fri, 11 Jan 2019 14:10:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909D45D739;
	Fri, 11 Jan 2019 14:09:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:46 +0100
Message-Id: <20190111140857.4211-5-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 11 Jan 2019 14:10:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/15] hw/ide/ahci: Remove AllwinnerAHCIState
 from "qemu/typedefs.h"
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
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FzWap5NhKgSk

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Files requiring AllwinnerAHCIState already include "hw/ide/ahci.h".

To clean "qemu/typedefs.h", move the declaration to "hw/ide/ahci.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/ide/ahci.h   | 4 ++--
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index b7bb2b02d6..b44e3000cf 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -73,13 +73,13 @@ typedef struct SysbusAHCIState {
 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80
=20
-struct AllwinnerAHCIState {
+typedef struct AllwinnerAHCIState {
     /*< private >*/
     SysbusAHCIState parent_obj;
     /*< public >*/
=20
     MemoryRegion mmio;
     uint32_t regs[ALLWINNER_AHCI_MMIO_SIZE/4];
-};
+} AllwinnerAHCIState;
=20
 #endif /* HW_IDE_AHCI_H */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c026229573..3a5ca74bd3 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -8,7 +8,6 @@
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
-typedef struct AllwinnerAHCIState AllwinnerAHCIState;
 typedef struct AudioState AudioState;
 typedef struct BdrvDirtyBitmap BdrvDirtyBitmap;
 typedef struct BdrvDirtyBitmapIter BdrvDirtyBitmapIter;
--=20
2.17.2

