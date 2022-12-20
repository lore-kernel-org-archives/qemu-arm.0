Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678579ejb;
        Tue, 20 Dec 2022 14:06:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mvAZeWkp/seH0rjvDOc/wssvqTdGxgzpHPKTjRbooeu5qyPSC5GY/JnkM3qu4EM1QPmGq
X-Received: by 2002:adf:e3cb:0:b0:242:1e0a:318c with SMTP id k11-20020adfe3cb000000b002421e0a318cmr29858492wrm.47.1671573998832;
        Tue, 20 Dec 2022 14:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671573998; cv=none;
        d=google.com; s=arc-20160816;
        b=RIzvYd8R+G1jZ05TsZHdH5f3bQ7Rg5SuXakVBj/4ptref8JAV5TDTr2ML8oQNCmnht
         PVUWvpHxM+afSdl2B+p1XDrlO0XcqC8cDf4i7RlIGj8mZnNUVS5szFLMi+WMloviV1gv
         asbBwlyWjGd5OavDJupt2dWCKqrij58IzkXdP+iqsLAU7FtvK68m9etF9VdRKY659LLZ
         dMh0OLEQ8iLuh2VupvRPDpKi+mcZLuxRB+50IJOKSk1czooUlh9I1FjYlv6CtQnzaJ9e
         K2t4VtNY9WSPip1d3NpYOdxdUwZbqIgpMDAEdY7ZqGz5+w+pHDJXiWilDa6V4e3Et3qC
         TfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=4l3aPimV1WvtceSCfFT2IaNHN1avZuclDPHJDPo551U=;
        b=ocDNdY224DAZt8uL/kZlRBfykyHx2WarF6M6Aoi9KemkI3NTce5lLSgBhEqsU1pRfG
         bkfftk6UERai9ocykJoob/wX5LPgEaSbwqpV8C/7xD+V5nUo1aigivPvCkl3BmFcGA52
         GOVX+23v4kPpaVq19C96LiZ73j0VR9HSnrIqKKOpbyhj3qBL6Aa3/rj6Tah8q6SHos+n
         BjcMfzmdMyOpAPFOckKnM1lcbbEdM9pQGre6p7d9Nyr+IzQOH7agDdLz+oTKI3zxGOoP
         6VzrABaAXmsa0OeoGuqUmskQ647LNAagXHbGmIyp/GOWfuAOgPRO1S0DkaLog9z9MhDH
         dZkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kjIa6wk0;
       dkim=neutral (no key) header.i=@suse.de header.b=mfWdZ5xn;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id cl1-20020a5d5f01000000b002420fb9cf24si10014495wrb.377.2022.12.20.14.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kjIa6wk0;
       dkim=neutral (no key) header.i=@suse.de header.b=mfWdZ5xn;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C1C476A44;
	Tue, 20 Dec 2022 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671573998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l3aPimV1WvtceSCfFT2IaNHN1avZuclDPHJDPo551U=;
	b=kjIa6wk0MMYoHaTXXilaZXHvL6c85VSGjWF9WyTxCLc8uQGGO6J+iPvKkfxZq+40FtmX5z
	me1SwqXfhNJjT3ZplREBTwr3yb99m2t1C8kJ45k0Wz+zp361nm0eGg615eTKstVLfD1GBz
	18s1FSag+6W7l7wDiQQ/eE//UbQLhTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671573998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l3aPimV1WvtceSCfFT2IaNHN1avZuclDPHJDPo551U=;
	b=mfWdZ5xnjwxxNS8yXf43GOZHhlMje+57lU327Uw/zT02ppNhIQI1dASG+2C+R2jPLrZDto
	+rOy/AqJjRIpasCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FD0A13254;
	Tue, 20 Dec 2022 22:06:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QOkHFesxomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:35 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH v2 2/5] target/arm: wrap psci call with tcg_enabled
Date: Tue, 20 Dec 2022 19:04:23 -0300
Message-Id: <20221220220426.8827-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LOk4TH0ipReG

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci check if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Originally from:
[RFC v14 39/80] target/arm: replace CONFIG_TCG with tcg_enabled
https://lore.kernel.org/r/20210416162824.25131-40-cfontana@suse.de
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa741d5175..193e0ef8fb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -10341,7 +10342,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
