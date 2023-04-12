Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281137ejc;
        Wed, 12 Apr 2023 05:18:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5M79BE4kMCsM2DtEdd69d+Nn9Er/SuK6uk6kbK+TwQMdJDWFgDJLHmbJmJRuEsKAhZteE
X-Received: by 2002:a1c:ed08:0:b0:3f0:9f9b:1665 with SMTP id l8-20020a1ced08000000b003f09f9b1665mr1182622wmh.3.1681301930274;
        Wed, 12 Apr 2023 05:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301930; cv=none;
        d=google.com; s=arc-20160816;
        b=K/DWTo8wYznADcs/yN8REzUiahCv65LLPIP7oubizc3EPKNRs3Qdt9fGDpUvP8wF+h
         ODJahNNhuSspVwj7paG/RfgBn/nslywWkckWJWlKBtOHrxFwL8/f4A03/jpY25DDl592
         noLvD9/3STHo8SO9QgfoKcVyMLCYPKfLKW3O/CEMOP5Ce+ibFt0kiflELPNCvlfmjoYx
         iBOxVQ7UPMEAkiKovpX4Pzq0PMuotIAS4WJjRp4CDe4akwiFY4Bq551deRsppy/G3mPm
         43JxVl04GDfKelq0q77SjoYLk3qEunGqwfq+HmmWWubjHovuAqeAoZ2Z4i/D9JMMXpse
         mdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ISs1dDcqBnJkL5ZyU7VfbtWOIJOkBTltBOlhGZ9Av88=;
        b=tvqskBxxvDPgw3R/ljLNG+F7cDsF7dw88phalOwFw1cxs0WK7cyu6xmarFm4XlwzOL
         O2V5xzrjVvcNeApWAnsy0C6cbm/C54izCaw/i7nGMZZUboWcPwCAPTgjlRG/u6nPInpQ
         5EmmNcj0FM85O0knIOK8tGgxC1lw2TzFgnvNWEgR1ontj3l3UE5OlPAdR0KM4q1ZX/Xi
         Czr4DldMrX7CUBus2ZI1O+Xitc4bdXs5zkSez2x2K+1AlvsEGzrPnRBW7LTgWt5QCZaf
         hCt4fi6tzXVWoj8BCANUigt+mXdEyi0VGMKsQAEgKmySWPfc0/WsRvIvgfgutmyQSuYF
         2qiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=PEl9DIn1;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id 8-20020a05600c028800b003e10fda6511si1308807wmk.193.2023.04.12.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=PEl9DIn1;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E62841F6E6;
	Wed, 12 Apr 2023 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISs1dDcqBnJkL5ZyU7VfbtWOIJOkBTltBOlhGZ9Av88=;
	b=PEl9DIn1JOmOa3kNJyEoRzIHC4B0HUzGYbJL48V1pGEN4X6i6VquLnzcCLaVcMqJeNOZ9H
	IExRVKQtlc9T+XjxAhIxv/DZ/fZDx+gd8cO9SksQeSLlj3G4aqCscGAycfrRm5S2Jw7jky
	BNl0quFKCIryYky0pJNupTz6vltmWdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISs1dDcqBnJkL5ZyU7VfbtWOIJOkBTltBOlhGZ9Av88=;
	b=x8PZ7+Yj7G2YRfiVDiEKdSuyw8oR492O2A9aEfu7zNuyVWOALw+G13YbS/0Ow2FoQ2+0x3
	eyRPCIdRXctO3JBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9776132C7;
	Wed, 12 Apr 2023 12:18:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6KdgI6ahNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:46 +0000
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
Subject: [PATCH v10 04/11] target/arm: Do not expose all -cpu max features to qtests
Date: Wed, 12 Apr 2023 09:18:22 -0300
Message-Id: <20230412121829.14452-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0SodJYndOuhw

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
index 4537aec141..b3a93e7aa1 100644
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
