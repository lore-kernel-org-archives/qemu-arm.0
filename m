Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413857ejc;
        Fri, 13 Jan 2023 06:06:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6/m8UnjP4+rdxJdDnprF1tRnIy9rkqAXVHYilCLjVcbE5UKj3bvmN7N3wSYkntAPPGmHu
X-Received: by 2002:a05:600c:35c8:b0:3cf:85f7:bbc4 with SMTP id r8-20020a05600c35c800b003cf85f7bbc4mr58814414wmq.2.1673618791919;
        Fri, 13 Jan 2023 06:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618791; cv=none;
        d=google.com; s=arc-20160816;
        b=N6K8X/EMC6i8/249ptAISlEJ4fnQ0ia5ePgwq9ETwPTCCbiR/QLul5jABue3UXqgZr
         G8iLPaP1HkqQ5Ll5p9J9+bkcGDZcOy4ssQ1ZHzGtEI016vGURf81MqNPMT2nHCXIwRSO
         9osA8jXERqpGrS2scOAIEoTLM3yEbVele0DCqPDoIwel00Mj5NDnXXcZQ7hseqQPG4Gt
         F8qScAl3XtjAoblYA3rIrMUFUIztrz/NtGIW9LoJ9P7n1VGD7ba/G8j4b4dFVkPf26w8
         YSvxARv9hygMnLsbz8dC1vx/emMHxQsHT0Zn+BnaUHDXTvECWzNFWM4LuLTsr7I/o3c9
         seyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=8VkcsjOcYfEJcPf5shAyiVqcXsjyikptWgexiskY/gI=;
        b=cfF4HTLcnag7B15fLkL7/2jnbqfFXT8GskwradFjpldQYzVoRbTDXGWt2GOgHHRZmw
         9dSbZiTI0OL7xMcQVVD48kh+BbJZkWCx98ETgPnF1O/7h/X5FfYvjawofvdfVvcbe31p
         /SLT0Bos1zCpJUuU0T3uP3ageuGV03kT8LF7uL2+zbU6gmRvS8LIfLLo+gfoteQmtla2
         7HCSiFY2AgP8cIr7Ko1SUJhfRTJJg067IYgFfmSr6N/2O/mlPAq199LI/1idXX0ODjij
         PZjQQFgJ1lXQCXdnWOEN+GjSU0mtE8gmfAcJNi7QQ3NwAa+BXtkHdaqUX6FjZSDrMrjy
         LG0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SVv4iFzI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=wbjYDvFp;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m10-20020a5d4a0a000000b002bde1669054si1285735wrq.346.2023.01.13.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SVv4iFzI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=wbjYDvFp;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39F2D6B4ED;
	Fri, 13 Jan 2023 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VkcsjOcYfEJcPf5shAyiVqcXsjyikptWgexiskY/gI=;
	b=SVv4iFzIOY78wxkBcAXj+M6zg/9E2I/ht0+Hh6tq/KC8seC/zGA/rkTi/Hv1OSkQXfWhmr
	Atog3vlTsA3oq0kBgutj+gqD0mdPtmJ8yo3X4JPR1yfBXdfq+7o+sfEVvn6GpxRFyuIHKi
	T5q7kdpfOwvq5FWTYBluwyx/c/RU2f8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VkcsjOcYfEJcPf5shAyiVqcXsjyikptWgexiskY/gI=;
	b=wbjYDvFpSLVCxF3nltCth1GCC49HPyf3q2KFN07/NykZxr3T6s/NFhMdu1+XZANWDeQhS1
	7wS6HaqqJeecSfBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A1591358A;
	Fri, 13 Jan 2023 14:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mB3XGGRlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:28 +0000
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
Subject: [RFC PATCH v3 02/28] target/arm: wrap psci call with tcg_enabled
Date: Fri, 13 Jan 2023 11:03:53 -0300
Message-Id: <20230113140419.4013-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xE4AltmYTnhe

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
index ebf70777d9..562da41e73 100644
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
@@ -10849,7 +10850,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
