Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127558ejb;
        Fri, 17 Feb 2023 12:14:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+LQ+2vYlYSg0mJk6jeC5ldYdr1D/+k7evzHzoML8ADmzFor3LZNSsmUim3U5VGDxchgMFX
X-Received: by 2002:adf:df0c:0:b0:2c5:58fb:fa8e with SMTP id y12-20020adfdf0c000000b002c558fbfa8emr885849wrl.32.1676664842656;
        Fri, 17 Feb 2023 12:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664842; cv=none;
        d=google.com; s=arc-20160816;
        b=tZlekXbOJqJNAxI1BPyaYYaA7HxqovKPXcC/+BZ2yGS1rpqQMQgu4xsUO5NkizzhCB
         HW5puiR13IdYgQgBZ4lxqB2h39ogh6EgX3jfinYjjb6iWaPLxqS5cNxP4qkq+MKRUKW2
         NMyATX6J37FiEXY0oT/dgM8LxRXksW+W1QuPdRiPK0ScExky0BUpbUtJOYXOa/RVjY2J
         3m2c/qpZmN87fmoz2QwluaO5lsyDIsrFhYgSqi+c0TL8LnJS6ZZ7/jPAlNkfENifuOxk
         Tyw7/8VbROD02F4sDGscK7GQTf08uwcqSysvKT6R7a9YjqdE2zbKYVYby5DiaWdKwYYU
         nQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
        b=adKH6ZEeIn5ACEd6dgeJBfKZj9LGCQW+a4rD2OEDWhNKGo3+RZwZpKHhNYdnb085Zp
         8/SarDxUgfF0SZDkAExwDacXv0WIp1m+veu5FjW37K+cUpsuGF7AztXajXiBBhWGpvSF
         mrv+n00TOXDBOrnNF6G8V0+RaCBj++/qNw/u9bdBFL1HeJMoMFSVUCdv9/5QWoqy77dC
         AOOoow2pOCJpnqZ9OxlDZcYJqeFCibUeQecGM9ZOaV7fmAGLoUtHG+dG8fjOMcr3hoBM
         2rao8f+pIuthWJva+y9H+Ms1k8lWKHrX/027w2Ve27f++a1ejP9DWuAuOjogX0PIgff3
         pSNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OZxUxAbf;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id x2-20020adfdcc2000000b002c54cd4fa9bsi5737072wrm.126.2023.02.17.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:02 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OZxUxAbf;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A49720FAA;
	Fri, 17 Feb 2023 20:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
	b=OZxUxAbfS8kwpUUT88u+mZT+Osx8j6Gp9m8qatkB7D+kNyqKb1fPu6KnGGwgW1s+dhJtM5
	npJ4hoSucHUFa33DMMhg4+5DJwpxKQt+knxp9m9XGp/P/X/2rPCYtkEM0aer6RpILqcVmk
	bgndtZkFJIrOtmA7UEhUA7GxM0AtXJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
	b=XIJnwO7b0SxRSQVU2gePv+OLBK5BKoGebSQD/WT5K3UHCJwgAY0B9W5mwIquuNFyTVIiht
	PHZbTMHtPP4xR4Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A783138E3;
	Fri, 17 Feb 2023 20:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yFj/DAfg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:13:59 +0000
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
Subject: [PATCH v6 02/29] target/arm: wrap psci call with tcg_enabled
Date: Fri, 17 Feb 2023 17:11:23 -0300
Message-Id: <20230217201150.22032-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1ATREdDrMXV+

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci check if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 190be1a64d..1fc860e039 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -11055,7 +11056,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
