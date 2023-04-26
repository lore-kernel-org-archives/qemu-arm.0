Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593328ejm;
        Wed, 26 Apr 2023 11:00:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzLN83fW1GKe/teUWTGEtFc17gBU4QTXHVThdYE5ztOK76vzK5sQr/LO+jtcF503X+cZ4R
X-Received: by 2002:a5d:56ca:0:b0:2fb:cbdf:fb48 with SMTP id m10-20020a5d56ca000000b002fbcbdffb48mr14656066wrw.3.1682532032527;
        Wed, 26 Apr 2023 11:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532032; cv=none;
        d=google.com; s=arc-20160816;
        b=sp1vYafleXJtka59MNf310S9tOG9Lk7EBXp1+gZ3BoWH+2UHKE5tHgx3B7/QvsZaF3
         AEpZWqv34Vur3/eFds9rf++7Mh4tYoNDTbLbocePghhiypG4Od1gSI/ZezaIOMDn2g3/
         fxcO3Klz8sbfDuabBp9bUcCPhyuUZHO1a1VDKpr+xIomWfHrqOKLU2vkkbMVWUuR338N
         vvZ7MdM3BBCiBx2hjYUGpe96MU25IhpheCY4dO5Ip9rODXyp1EeE/ba+U4Vw6ILAjf/3
         tdPpoKQCqzYHXe7klPTopXlXq1l4dwDjF+tiOzbvccanU/1dFQEDbJUFnjJsIqi/xC6V
         4+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QZsgszOmKN+TOr00V41iXdRp0Po3EfpgeNDnCG8eRXM=;
        b=vGNkdywKAyUbT78Tgs/REzsm7anPJWocGjv92u6zUu/ukVtwaSS0wNpyopySYe+08k
         TSji0vnkk6SZALeGPSCM4xqE34c7+n7IrRTahRDMNYp2bSfrTvz5Df/PI7AW0h/7h+II
         MW6ZTkILOHlLYjuW6ehkMLUCSnzP/T7s7+V435WbPKD0hoaIG1Zry7HhU/g1+Y8/Fz0D
         rH4ehAnozHbgdFX2OKlZd0Z8pdW4SUHmOFvyGAerO+hr/4QHz1S0sq595e1KktRBGaXC
         b9m2LqtW2ZNgjMO133Xx7hSBTNooqvnoMEW5TOY+vGcXjgwCpgfS3o8xL3GyABIEz/h/
         HoGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=imifkWha;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3yLnN6Tj;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m15-20020a5d624f000000b003046e253968si6474932wrv.249.2023.04.26.11.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=imifkWha;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3yLnN6Tj;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3633F21A18;
	Wed, 26 Apr 2023 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZsgszOmKN+TOr00V41iXdRp0Po3EfpgeNDnCG8eRXM=;
	b=imifkWhatvl4MMytNx+Cr7HPF/Vs2Ji2gDJEW+ZbuSrTlrXSbD5qT1e1VD0Pdr9TZi3S7f
	ABrKfort51NmC3oIXDrwPlZWPSV5a36+QBW7vA8rORlwEA/Wm5lMslC7ltDBcIpe/5tB70
	TMFfGdOgu7dw8zz+NP3hFJGU6od2CE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZsgszOmKN+TOr00V41iXdRp0Po3EfpgeNDnCG8eRXM=;
	b=3yLnN6Tjsh9B3HvOURmgxjL6AMMLsEz3Ct9Sga5gJMsmGkWcFr61RA/4G607arDTIeQVrD
	rorH3YH5yH5xuiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F30D138F0;
	Wed, 26 Apr 2023 18:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uGA2Br1mSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features to qtests
Date: Wed, 26 Apr 2023 15:00:04 -0300
Message-Id: <20230426180013.14814-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fjrFaoIEh1G1

We're about to move the TCG-only -cpu max configuration code under
CONFIG_TCG. To be able to do that we need to make sure the qtests
still have some cpu configured even when no other accelerator is
available.

Delineate now what is used with TCG-only and what is also used with
qtests to make the subsequent patches cleaner.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e9161522b8..6a6a2ece2b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -25,6 +25,8 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
+#include "sysemu/qtest.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
@@ -1365,10 +1367,14 @@ static void aarch64_max_initfn(Object *obj)
         return;
     }
 
+    if (tcg_enabled() || qtest_enabled()) {
+        aarch64_a57_initfn(obj);
+    }
+
     /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
-    aarch64_max_tcg_initfn(obj);
+    if (tcg_enabled()) {
+        aarch64_max_tcg_initfn(obj);
+    }
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.35.3
