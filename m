Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp800403wrt;
        Tue, 11 Dec 2018 08:41:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U5JV647zE+DvO/GMI2jGi2W0qm/AyP9sdi0qSycRuSyNfnk/75VQDJ0xlri2hYv7BGBNtf
X-Received: by 2002:a0c:9384:: with SMTP id f4mr16361182qvf.239.1544546499500;
        Tue, 11 Dec 2018 08:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544546499; cv=none;
        d=google.com; s=arc-20160816;
        b=A2XryNT7x0zFGffLf+PZT7crhYagU8Rn1o4sHO8Hj/5yCYmaTli6ZonuwRS0dVxknY
         l+t4Ca4Pa78QL+H8qyncUkfAY7ygxPAKwY0kksRaelksQgcGUDkSNhxi8L0GRlk0TRzi
         sxtxfet6CXI6WHqivgJTjkq4afGLVObaqRdcnFM13+JCusbaiz3YgHKVS8do0LWu1t4y
         LU+N5MeR8wkGGx688qrFvYB3GFeLVqUAzpGNMVmEOMe4GMDCDb7yZFyHPmc9ADKmGloQ
         nAWLulDv19oTFDQ/VpCs1AVcQZmDcuHcCyVnT2j/Eemze4eGQEFNDxA8LnzZcVlNuW3I
         8qNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZDeICyj0lDo34EimzK+r4HPJ+FrJq1df/tXdX33Dk4s=;
        b=bjl4G2TuzeLAREZPxvgaQIt5leo1hOmYus6CvUXwmsHPAu0n6V4pmOsMLOqZ9QjEj1
         ysIM1dWrttkKKYWpO5+j2iOw4U9e9Mdcb/RwEPHkG/8H7OPTvEGBo4AHoHnulA81f5fr
         BL2ztInKT2ULBaJm8RtfeXij0qr2Z8GcTo6GENAMTYKRF6uLALhpaiwFMCHNgjFhFfxz
         wH8beLch5CceHCIvWZzqEpRJ9U4dPuPo+TriibNE0icTLymaUASXHr/GKHMjEFlIK24P
         nVK0y2GSlEvb+Ee3gxsfHNtnuRVRZS2Cj0pFngsSYitotcDybYXZVvxSo4sryMVp5+Hx
         uhjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si5291253qvs.160.2018.12.11.08.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 08:41:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWl6J-000069-0x
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 11:41:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzs-0002yK-A8
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:35:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzq-0006hv-Ml
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:35:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gWkzq-0006ei-Dx; Tue, 11 Dec 2018 11:34:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DBE0C0587E5;
	Tue, 11 Dec 2018 16:34:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-183.brq.redhat.com [10.40.204.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B575D9CC;
	Tue, 11 Dec 2018 16:34:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Dec 2018 17:34:04 +0100
Message-Id: <20181211163406.3322-3-philmd@redhat.com>
In-Reply-To: <20181211163406.3322-1-philmd@redhat.com>
References: <20181211163406.3322-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 11 Dec 2018 16:34:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/4] hw/smbios: Restrict access to
 "hw/smbios/ipmi.h"
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
Cc: Corey Minyard <minyard@acm.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uH3EG9PA9/L6

All the consumers of "hw/smbios/ipmi.h" are located in hw/smbios/.
There is no need to have this include publicly exposed,
reduce the visibility by moving it in hw/smbios/.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/smbios/smbios.c                                  | 2 +-
 include/hw/smbios/ipmi.h =3D> hw/smbios/smbios_ipmi.h | 0
 hw/smbios/smbios_type_38-stub.c                     | 2 +-
 hw/smbios/smbios_type_38.c                          | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/hw/smbios/ipmi.h =3D> hw/smbios/smbios_ipmi.h (100%)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 920939454e..30bd4731cf 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -28,7 +28,7 @@
 #include "hw/loader.h"
 #include "exec/cpu-common.h"
 #include "smbios_build.h"
-#include "hw/smbios/ipmi.h"
+#include "smbios_ipmi.h"
=20
 /* legacy structures and constants for <=3D 2.0 machines */
 struct smbios_header {
diff --git a/include/hw/smbios/ipmi.h b/hw/smbios/smbios_ipmi.h
similarity index 100%
rename from include/hw/smbios/ipmi.h
rename to hw/smbios/smbios_ipmi.h
diff --git a/hw/smbios/smbios_type_38-stub.c b/hw/smbios/smbios_type_38-s=
tub.c
index 5b83c9b1f1..fc4516bc8a 100644
--- a/hw/smbios/smbios_type_38-stub.c
+++ b/hw/smbios/smbios_type_38-stub.c
@@ -8,7 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
-#include "hw/smbios/ipmi.h"
+#include "smbios_ipmi.h"
=20
 void smbios_build_type_38_table(void)
 {
diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
index 56e8609c00..d84e87d608 100644
--- a/hw/smbios/smbios_type_38.c
+++ b/hw/smbios/smbios_type_38.c
@@ -9,10 +9,10 @@
=20
 #include "qemu/osdep.h"
 #include "hw/ipmi/ipmi.h"
-#include "hw/smbios/ipmi.h"
 #include "hw/smbios/smbios.h"
 #include "qemu/error-report.h"
 #include "smbios_build.h"
+#include "smbios_ipmi.h"
=20
 /* SMBIOS type 38 - IPMI */
 struct smbios_type_38 {
--=20
2.17.2

