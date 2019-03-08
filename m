Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7806102wrx;
        Thu, 7 Mar 2019 17:33:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6B6VWr4k+/DbXs3a7tUxVbGL8g4p/2rFxfhwiyMkaAViGXDzMShCWuFsmVpliYul8L5+V
X-Received: by 2002:a25:3403:: with SMTP id b3mr13883335yba.164.1552008807787;
        Thu, 07 Mar 2019 17:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008807; cv=none;
        d=google.com; s=arc-20160816;
        b=eszSoeacdN2hE8ybuwPrWyvzRhSzpv4vFQ6ARHWigyNNqXG15Rlt4QVRvRrjtV2M5l
         ENqjVZWUEBLVCK+eOSYcbfvTWdxeapDewph70z/Jg5R5flWwBfgddtsT4ddbA3RuWdIe
         avQe8HsHOoQS33R30N9TPXl4IpOHPDQRLiqG7uFXUYjSG0mWsHzsIjG/whNHf5cvlxM1
         YVTzPijJ6SnxqrUfnLUAlJBklcTkex+9k0HCsOK8k40uIAlY3HG283KxHqDvFM+480tl
         Dkww7b+vm5L8XH/tBzRsIdpr5y88cG6DbgKF+GsZu4+bvzF10hBw5+CNhp5vQyPqSrtf
         OxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZG1B8chLZUG96AN6fjA56AsKwe0+VkqdbSnHhmDS4sI=;
        b=IvMb/yG6rwnRXtwNoSudssulYvKsq18cml81fiWEf7UdiSyAC9vH9s5nNj+xvVr7qf
         MYf8GshqWv6Wqfdu90oO9VPikcYyUxZTwA85tPHSuG+z1qAC3FTuWLsbobcgi0cPjeeQ
         mevHI6xwvik3Z2gzkXRUqJgpZMAS38e5KSEE5f1jfoU0+3RxrFTmqerrxlVPVg+GtxQN
         QdrhFQCavAcvjaY01KyLla7MlkYfsxlYL+GNjfJ+J2EjWVM8W3rDvBIic12jfwsTJq1Z
         nqwWiNmDxA8YuFYUR/IKwul0oPPydYeGhB2j7yU0dREsyCXqE/AC3XpE0A2xUuDqYEJS
         AQqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si3687845yby.384.2019.03.07.17.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24O7-00025x-81
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Nm-00022y-7r
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24Ng-0008Pf-AA
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24Nd-0008JR-9B; Thu, 07 Mar 2019 20:32:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A313030718E7;
	Fri,  8 Mar 2019 01:32:55 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F70860BE5;
	Fri,  8 Mar 2019 01:32:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:06 +0100
Message-Id: <20190308013222.12524-3-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 08 Mar 2019 01:32:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 02/18] hw/i386: Remove unused include
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
X-TUID: UMpudvY3Yqty

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Drop files that do use fw_cfg (Michael):
- hw/i386/acpi-build.c
- hw/i386/pc.c
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8fd25a5926..7b98121070 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,7 +28,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qemu/range.h"
-#include "hw/nvram/fw_cfg.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/piix4.h"
 #include "hw/acpi/pcihp.h"
--=20
2.20.1

