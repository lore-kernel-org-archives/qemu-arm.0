Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp797993wrt;
        Tue, 11 Dec 2018 08:39:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WzklEpjnEuNoAOFb36xq5Wmx0j3aZ1HRXq/FcL1CFprmgu2d8l9jxWLZ2aii4njFaTRgSf
X-Received: by 2002:a37:380b:: with SMTP id f11mr14807369qka.309.1544546384937;
        Tue, 11 Dec 2018 08:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544546384; cv=none;
        d=google.com; s=arc-20160816;
        b=SXmHlvuJZf/EwJeOkIAJXqn0AVvMIbi7vFEtKmohDXkEeeHzUR2gTWa0uGuV/ymopx
         WzKR6rHtdJeUWze/eRaFhIqqdvCdcV8oXDkyGFWIMcBe3y+Vuqac3MZGyl7Mk3BZKCWZ
         SSq9x36Q0q3aaA/Dm2fz/+a7i7NS9zkwonxTU+f/s18J/HkbisMY9kRq7NbJgKeJu+os
         M/16Q7sSC/1ZkLbOckb4Bpa4I/EWAECtrrCUd5q5EimhJHgyxA+4FCbeG6Q9UdsxIS85
         /wXCUdEO7bVkKU2p3f2mYzVSeoTp9c8rAKLIaaJuNcUyEex9t7osMwud5cOmgh8lpLHV
         P9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BOTJxZOOETN/GgZ7pwd+5DFFMl4yqzdRZapxH41RaI8=;
        b=pw9pKAc/v2iPEKKaOrDZPAWyFfM+mVOGIivojdktK9Np2KTw+M6J8LCvNcFw2x+S8g
         xLx7002tFxIep5jhWShxGXupa5kri5DWSPZYd0g92Gtcacykq88098eip1Xm/9ocSa1t
         HUxvO2cR05rUZSir+r5AS/su+UUxg9GebHyroXpuFHhrc6VbIS4H/5h1n6n3QH6rvzFe
         Y8MWOXw17Q5E5BRV+lOE63tCuSvT8ukcDdNT/rH/+22c93sf8Q9KSBuZ07vcIOWF2mnT
         Udk/rs+MubELbVCAzARbowb+AumzELfHAELZDNR31U9QRRtjIYRh5jdIw2gHwSN3lYHL
         xpKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si1572083qkd.172.2018.12.11.08.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 08:39:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWl4S-0006rK-C1
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 11:39:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzo-0002u3-H5
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWkzk-0006dP-Mz
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 11:34:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gWkzi-0006bm-VA; Tue, 11 Dec 2018 11:34:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC36E307DAB2;
	Tue, 11 Dec 2018 16:34:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-183.brq.redhat.com [10.40.204.183])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1261F18EE7;
	Tue, 11 Dec 2018 16:34:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 11 Dec 2018 17:34:03 +0100
Message-Id: <20181211163406.3322-2-philmd@redhat.com>
In-Reply-To: <20181211163406.3322-1-philmd@redhat.com>
References: <20181211163406.3322-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 11 Dec 2018 16:34:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/4] tests: Remove unused include
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
X-TUID: UWZZZ6IxCN5+

The "hw/smbios/smbios.h" include is not used, remove it.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acpi-utils.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
index 41dc1ea9b4..297af55d39 100644
--- a/tests/acpi-utils.c
+++ b/tests/acpi-utils.c
@@ -15,7 +15,6 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 #include "qemu-common.h"
-#include "hw/smbios/smbios.h"
 #include "qemu/bitmap.h"
 #include "acpi-utils.h"
 #include "boot-sector.h"
--=20
2.17.2

