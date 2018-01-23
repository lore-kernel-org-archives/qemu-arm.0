Received: by 10.28.71.27 with SMTP id u27csp3769248wma;
        Tue, 23 Jan 2018 00:13:51 -0800 (PST)
X-Google-Smtp-Source: AH8x2275iG9dfPx1Zg4kgextPoiws8WPv27E3m0vzfyAixMfjxOtJph+cxmjGp+dkb39irhbT+u/
X-Received: by 10.37.9.81 with SMTP id u17mr1563921ybm.288.1516695231137;
        Tue, 23 Jan 2018 00:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695231; cv=none;
        d=google.com; s=arc-20160816;
        b=uG9gKpONoISHvqTBTyyvPbDeIwmMTPlXLJClq9NEzF49NlWZch+Rc3lNoD2yrMEBI+
         HcZxVHE9rEPB3aw4+zFZClDJ//pFosywYIMWID9D1xadEhpwIIw67QHjlXlppYNexhYw
         bx8weENK6640HiSbNZs1sTwwhlfSPnh5aqR71Oc8YRIjOkXB6qkfJka39vDhfsAF9ox1
         ZVpogwUnJUcsUbqcu1iGReIaNWOcNbOJilhKAOn0Pypa7VjT/Goyc0Dp8fElw6L1rwup
         GLL2uejhV3hxZp8L6OFOzdmn9hDUjutDKLyTX9jFghd1L9ENYbVdNyim/HqkkeKYMCKb
         zUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DOEoV7lJxl8M7DMc01zBsz1HuQXxun/EB3X8yXr5zNQ=;
        b=JcMLH3wcZUEGNOtEUwbSDBfJMfZckMx1vllRZcO3Cjr+rg5ciXz9ZDH2a3Mh/uzMSE
         EpURy0RaY1y8RD/7PEHag39h9kZUPtkc5QOa5qMyjgJhglCv+VatlafFFatL3edaJbLD
         Yu8OTNiifnMY07Ii251gl9rW/dgBQgbnagQCdWqDoe5mn4XvpOVV2wpQqBb0t8TecOl9
         xI1nk6imBN/mOoiYPAYNRTZ94/YL3h9vzUiCa91lybUjChYgbZ64YLS3h6HjcgacN1aW
         oLj7f3aatVzNIQsteEtJxgUDi3yqtPs8IDE36po/DolW7WiNTKqEAMDOiuNWtYEAkabN
         fadw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si2361833ybc.693.2018.01.23.00.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtiI-0002CR-GF
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:13:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edten-0007EM-O2
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtel-0001nv-F3
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43314)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtel-0001m3-9J; Tue, 23 Jan 2018 03:10:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33D572576B;
	Tue, 23 Jan 2018 08:10:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29ACCD1F4;
	Tue, 23 Jan 2018 08:10:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:08:00 +0100
Message-Id: <1516694904-64879-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 23 Jan 2018 08:10:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 01/25] nios2: 10m50_devboard: replace
 cpu_model with cpu_type
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
Cc: Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGc/eR3eduR6

use cpu_create() instead of being removed cpu_generic_init()

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Chris Wulff <crwulff@gmail.com>
CC: Marek Vasut <marex@denx.de>
---
 hw/nios2/10m50_devboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index e4007f6..42053b2 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -75,7 +75,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
                                 phys_ram_alias);
 
     /* Create CPU -- FIXME */
-    cpu = NIOS2_CPU(cpu_generic_init(TYPE_NIOS2_CPU, "nios2"));
+    cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
 
     /* Register: CPU interrupt controller (PIC) */
     cpu_irq = nios2_cpu_pic_init(cpu);
-- 
2.7.4

