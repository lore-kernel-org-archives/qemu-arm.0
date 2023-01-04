Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305596ejb;
        Wed, 4 Jan 2023 14:01:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu4S4IHrPt3ImeuOPvjzJFf1AJULWYeFyhSjTTBwzbYBYIYnoT9PPixPpaP9l6GUfS6GgbT
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id h12-20020a5d6e0c000000b0027da1eadcfamr21251300wrz.19.1672869668199;
        Wed, 04 Jan 2023 14:01:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869668; cv=none;
        d=google.com; s=arc-20160816;
        b=JUXoisFA1VGqCGcaBxdsymyjXm5AW4HtemMubt8PtdMpKZcbNbgG6hA0cotJtR5cea
         jN07JkHOhmHCCr6fgSFq8XdsiTCqLBj1beIkrVycZBpVqfy893J6l6exh7XO7QovnsB6
         nVgSl/zHCIVLiQEmR6dd/a0DgxCmcwSxPeY6h3tMnCJD5gD71t0CpNqnMEoPAiuNgtpH
         bogSs0oRH30suTSDtexh/dImp5Q6rMdnJgZHp3lQ/+nqaZWquN8GG04mCtEx6GAVVauT
         iCNSEKehT7wGAgTCH23/He/Z166uCpHQj3IBkOSQpq6WNYm+3e6WObsti7gJjKcuY4q5
         7lGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Guge+O/GBbYiaQ0nlfN5YiqBc6MS3hXX77WELf1ks+I=;
        b=vNgIUpbbywtV/q0kcDqDw3CE+iI5TQsSgIKbnnNYzNF5SuM4Tc9DTLRqHGi+0sfUdK
         z2gAePfbpuLhIx4F5yJcpf7k2P5SpSjrNwoMQWQr7NvZumuGZrtNJeXDXA77HP5YAkiN
         cRJ+zqzmFemGtUkp8rRmq09jTc2knkuKw45x2GzJLYCtLFVlBuAyv6tEbgfr9ETvq3kN
         iZBAt05+VpwDdhhdPSZ+Tf8xU8T0pcopgUvbRqYopx5XlJV5DjseiiJp1fgTtRB3fg3a
         6UPR+8aSQbmYOxw3HxNFgcOosOKH5gnzM8isPSsrvSjUe/T0MlGwlLgZNgfreEa6pK+L
         G46w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lIJjpN+w;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=1f8zRh9h;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id o11-20020a05600c4fcb00b003cfcab4a408si66529wmq.196.2023.01.04.14.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:08 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lIJjpN+w;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=1f8zRh9h;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 858AD3E8C4;
	Wed,  4 Jan 2023 22:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Guge+O/GBbYiaQ0nlfN5YiqBc6MS3hXX77WELf1ks+I=;
	b=lIJjpN+wxEycCRe3KVRu4sG/8l15SB+NZFsY1AgqFEdUf6SSi9OIaRXtwYQVApLgfYP9iV
	AqhOzta0OaafwsgROkkr2Wz2ANtK+gzioqvf+7idhtPXxALtInSFslO1HC/UeQ3ivS35/k
	A47iAIJgw5hHymylql66h1sFcYNhnfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Guge+O/GBbYiaQ0nlfN5YiqBc6MS3hXX77WELf1ks+I=;
	b=1f8zRh9h2/0gdEgV1Vgp9DgKEiUTNEA+JFr1Fnw9AGQdtGgDhpzw6jkMNJ1atCTpV+vCpX
	uZF3EI6h7sfY4pAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D06501342C;
	Wed,  4 Jan 2023 22:01:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cMt7JSD3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:04 +0000
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
Subject: [RFC PATCH 08/27] target/arm: wrap psci call with tcg_enabled
Date: Wed,  4 Jan 2023 18:58:16 -0300
Message-Id: <20230104215835.24692-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /l9E4ofifl0M

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci check if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 89c07a88ea..2bb302e5d2 100644
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
@@ -10438,7 +10439,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
