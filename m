Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4974181lfb;
        Tue, 31 Aug 2021 05:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyREI/xKJB+ACeynufOL92BmoPu56DwwEfQH0wVyFiVpRGDqXMkEEaRgUan8/tUrD/DJ8j/
X-Received: by 2002:a17:906:12c6:: with SMTP id l6mr31628202ejb.373.1630412235743;
        Tue, 31 Aug 2021 05:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412235; cv=none;
        d=google.com; s=arc-20160816;
        b=OtAthxFufakDATqfvKKfe/hMlYuZ49UqDnn9kTR03TAbOUY2SwXHURiK72JaUYlNeo
         N7HlTCNkPtcUDbii9dpZllsKAbgYaLngAPeG3yL1Y0yY17ADGIC9+/4H4cg575pmOTuD
         P38TDL/nYKrOIzmx1mjpOktf8Qbf3TBt4i0AqDWlRJ15poVVSnoNShK3YR0xO7oQq6EZ
         0LOP1pNHezmIKePtsgm9wznf5hiN1S35ISUHDPRpnMqWSjd7wGfja8Sfp5xsXX/5fg3M
         Zgy6yAkgHCiDiBNThWcgHvA76PtdD3kA8LrwDWylMX3Nugu92/4l1Mop5IVmEscoNitW
         vHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kj6LlpYEBQqdR9FwoSkyHmihGdt25q73/5GxAYqyAUU=;
        b=Ca/v5+pHaUsPrZ8u+6wEOc9J/laf8zznMrXEd6eRN1xi7C3hgTIRawrgfFQ0Ih81nu
         RJQP3J7OjoCRAMlK3RqtDq5bTtMdwlQlzTkNkfQSdcqpjUy/idhJgZksqPV39Jk2iP3R
         lNs/iPPMye9SjnWwpJH/Ux2e8g1dpuC72vdSqK0z15feviZwoPc5m8o7xT2SdCTj72S9
         c8fqLcuPQ8iHCFmzLQvU1x3YVyA64AkX+Ttt+/urgftsh09p81jAaVrOYOIknRmTt69x
         ptfA+uASUDx3SeYv/KuDk+T34nTfBOehA7JOKARiq4o3XkuS0OpV4EPBT3I6OYmJ9RoP
         DIbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jz2Tid1i;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b15si236282ejl.715.2021.08.31.05.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jz2Tid1i;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj6LlpYEBQqdR9FwoSkyHmihGdt25q73/5GxAYqyAUU=;
	b=Jz2Tid1io9jxsgBLIt0zsIWPT8BBcpT38Gn8IgqwkIr3yPBHx97DuAOqak3VgwAEkJThh6
	B3EIADQRwdwoitu+H359d0u8FZ1kJoEcP2HsrWmSM7YR8+wELZFgmTVXR/SZXaW4RQOFxy
	SVReCqRs7Ms4rWQXGcgGi+qUaJYIO9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-RISZKiG8O1CaodTctAuQpg-1; Tue, 31 Aug 2021 08:17:13 -0400
X-MC-Unique: RISZKiG8O1CaodTctAuQpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AD3F92500;
	Tue, 31 Aug 2021 12:17:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC23E226E9;
	Tue, 31 Aug 2021 12:16:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 82B5B1800992; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
Date: Tue, 31 Aug 2021 14:15:25 +0200
Message-Id: <20210831121545.2874233-10-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: 0fxC0JcoO6/W

Add TCGModuleOps struct, empty for now, followup patches will fill it.
This struct has pointers for tcg functions which are called by core
qemu.

The struct is initialized (at compile time) with pointers to stub
functions.  When the tcg module loads it will update the function
pointers to point to the real functions instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module.h | 8 ++++++++
 accel/tcg/tcg-module.c   | 5 +++++
 accel/tcg/meson.build    | 4 ++++
 3 files changed, 17 insertions(+)
 create mode 100644 include/tcg/tcg-module.h
 create mode 100644 accel/tcg/tcg-module.c

diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
new file mode 100644
index 000000000000..7e87aecb2357
--- /dev/null
+++ b/include/tcg/tcg-module.h
@@ -0,0 +1,8 @@
+#ifndef TCG_MODULE_H
+#define TCG_MODULE_H
+
+struct TCGModuleOps {
+};
+extern struct TCGModuleOps tcg;
+
+#endif /* TCG_MODULE_H */
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
new file mode 100644
index 000000000000..e864fb20c141
--- /dev/null
+++ b/accel/tcg/tcg-module.c
@@ -0,0 +1,5 @@
+#include "qemu/osdep.h"
+#include "tcg/tcg-module.h"
+
+struct TCGModuleOps tcg = {
+};
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index ec74e17a8285..93cbbf9f3926 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,3 +1,7 @@
+specific_ss.add(files(
+  'tcg-module.c',
+))
+
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cpu-exec-common.c',
 ))
-- 
2.31.1
