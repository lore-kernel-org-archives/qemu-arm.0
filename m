Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529854lff;
        Wed, 4 Aug 2021 07:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycJfO8y2WTU9047FckGXy1OO3rxaqOAPRvJ5WTQ6/9diBaMIEcZGiiSdR5ccuZnMYEBQap
X-Received: by 2002:a17:906:309a:: with SMTP id 26mr26222688ejv.153.1628087951605;
        Wed, 04 Aug 2021 07:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087951; cv=none;
        d=google.com; s=arc-20160816;
        b=yXOPhkQOlboiHIj8YxiGoOiGNo8GGts01tpfvyMO3ipCdp0nR6FxgegPKHUuXA6J/0
         fHRBbLYPhrunWeViLWEKd5glcmbfA6PVXdBhJsGdsJOr9Ep+bwfyX+Q7S7ySPBBquXv7
         RNeOtBzYi9V1XsO8KKEx8v9DkuYgY6EOa3czqenb5q2Hnj3hUwExMSjv91qVzEHhhI6f
         fkaOlKV4O4PNytY9KzZ73QVIS38moQQeSAUGZEnbqfDr9kLCTRWBkZC0pnn4MDDi4Mzd
         i4iOUXyou/HroW/UiXvLMnN6KjyUyob/R7A47/cYAttpXWppTImUgr+E/PMHpZgDEJEz
         KgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v/5yJ4dUR6Y5xKen0NrSuTLIszSPFdr6hFKaZrrITNQ=;
        b=I0//y6IBVHM6Qkd+k4qz3tyAUE5xH1N+tAfc5wd6jRsBf5KijnaXqPuAPDeG2dlfBI
         zt4QZzJn98415o1OWLhVrF+oOukTvTNF2tLNcOyPTRltsTpiX309jMh2jtWCz1K63lcT
         VyPiCFRCeZ6qly8CgVWyvcfeYuaOwLjf8HarILzzjHZwUAlgJzuAZf9LB7gA3CoXYpY/
         gIw2+JkW7qj1qToYmZn9yaC/vcazdythNEFUHcitIwBY9GpatNI9zqRnToHCa06JlYyH
         OwmkzYmwVLxlPZV95kftK/TKmLfahyE8zQZr92Ol9LbdblNPNWrsVBGQiAmi3FRE1GRz
         /ZUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTI+jRlz;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y1si2397438ejh.613.2021.08.04.07.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTI+jRlz;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/5yJ4dUR6Y5xKen0NrSuTLIszSPFdr6hFKaZrrITNQ=;
	b=jTI+jRlzk1JuliJmH8CvTXof5q3jhbCVnrsOdYNNezOFY4HBNNc2KkOEJpU/MiA4sD4ezQ
	mRlFSZHQVQ86ykFhzU1Itqa7QLefi/4M6XF7vcOXX4U6EYQmZePyccN5EE4IYmonL1x6qB
	Z9y5JAS2M6SdSzhsRCjzzoSx+DGW/Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-KfxzEZ11Mo-zPgRTXBPo-Q-1; Wed, 04 Aug 2021 10:39:09 -0400
X-MC-Unique: KfxzEZ11Mo-zPgRTXBPo-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8ED487D541;
	Wed,  4 Aug 2021 14:39:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DCA81981F;
	Wed,  4 Aug 2021 14:38:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5F2B2180098A; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 4/7] tcg/module: add some infrastructure for modular tcg.
Date: Wed,  4 Aug 2021 16:38:23 +0200
Message-Id: <20210804143826.3402872-5-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: hyAY0kCDshvD

Create tcg-module.[ch] files, with struct TCGModuleOps, empty for now.

Followup patches will add function pointers to the struct and stub
functions to tcg-module.c.  That will effectively will switch stubs from
compile-time to runtime, which is needed to build tcg as module.

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
index c1ee9dcaed1f..eaaf7168ffb6 100644
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
