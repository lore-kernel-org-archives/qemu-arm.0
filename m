Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546579ejb;
        Mon, 13 Feb 2023 12:31:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/JoXrjBnu7BiepUqyZw/8300jXaokDM3HS/GLbwWiO2D+jMT6ohfDgWhVdoQUH4NmOuBMV
X-Received: by 2002:a17:906:444:b0:8af:a53a:189d with SMTP id e4-20020a170906044400b008afa53a189dmr178561eja.44.1676320300790;
        Mon, 13 Feb 2023 12:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320300; cv=none;
        d=google.com; s=arc-20160816;
        b=eqMceWC3WelCI29+2ag3oT+9vCb7TDltGWaMX0bs0W/rjoqKWQER+smWDyYf20CMqY
         dLSGyyL+Jt1pEMXIXO/S+yH9ERQ0QPghaal3YvOt+/wUJPDdzFLx1GrL1YTQ2VQFKJ4T
         7khX+aWzxvGX122bRJPStpTh7tI+iZnOrWzu3DxBp/QtwGfyLOiVFO38oVAg5szDGvUF
         Q/kqjdeEX39egST9ZHnck0fs5BLFoywnkXN1D27H6Fk/f371ylD+eVU549HQMHyzUI/Y
         Tm9J91UHG3Vc7XYbCDg85Zg8cBIDJrWfND7UuNjpOKspJKpvY8GrSCA72SCLvkM7nh/n
         kV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
        b=qV8vGZoY0ByS9zDEdbc/6cdzc7YdwdHyPSx3zmVnLFQFdgC8zDMNk01r8mEuClkxqY
         4fdvrWrTP4wdYOVguRtka6XLBl47Z1YPdEUqKtJXl0jisYsbpHWVV65NflRRxMcjX/6i
         BKxNEdFfDBMbIcJE3vuCpPstFJ/atsfiKwYlhX5mhgM6HPU7t39fBdL74VkWcenoI1eP
         O1cknMO6HyZZ6vFoJTkECT3DKSZiy1SzJcZHDTI1bAKQ3OmdknSaqf49Uprhb1VQ6IJp
         vSNSBP/OmEoghTk3rJPyg3WXMjxdtz6GL4H/Wb77Q/7i3/uK1gok6RChqvZ1+5m6vV3p
         rUbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Gxe9+DbE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=w5edDbVZ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n28-20020a17090673dc00b0087b6bbbcfc9si19500993ejl.373.2023.02.13.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Gxe9+DbE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=w5edDbVZ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E52922337;
	Mon, 13 Feb 2023 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
	b=Gxe9+DbEujEn7Kxy/hVSzBwiFG0kbas2kYHk63udfUn4/nJiuzTOnqxVwytmY3l6uJdMMi
	y7HWX3t2NZ/4EqZR5fkDvgw4WUEtojWJ7uATLOv+ziJ0r5BfVebB1TcSms6LG8VxtZH0ki
	/lhLrCcjvZJk1cFHM8I7JwQsuUj3PBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRSaU42EJuvkn9pnSLpVvyMLr2VRhkEQPYljGo21NaY=;
	b=w5edDbVZ0FGcVpDO6fxFjCPjEaY5wOrIofesN8eaTaAh6XXyj73PIweTJnTbNaTUXH9pWr
	4JFhgNZoTzEDPBBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 605831391B;
	Mon, 13 Feb 2023 20:31:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2HiqCSme6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:37 +0000
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
Subject: [PATCH RESEND v5 02/28] target/arm: wrap psci call with tcg_enabled
Date: Mon, 13 Feb 2023 17:29:01 -0300
Message-Id: <20230213202927.28992-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MMFQXOXDqYgk

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
