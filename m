Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663369ejc;
        Mon, 9 Jan 2023 14:42:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsSbOAixkFXslTmgCJroSyftb9dHGjQi68dE8mX55kWnTR+bgcfdlv95W7JbtDbcW2XsaG2
X-Received: by 2002:a05:600c:3485:b0:3d0:761b:f86 with SMTP id a5-20020a05600c348500b003d0761b0f86mr47238299wmq.28.1673304164427;
        Mon, 09 Jan 2023 14:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304164; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNETy0GyvJtUIBipHXVF2bakLMDlBZo5FcpN7l79cZbuGn7wMcd/NLPSLwwnzhU20c
         rK8wL8SpKCLyJnXPMuJTFJo2emYOipmkljcVR5a1rG5b5+qc5UwZI3LlRypbnNYawEi1
         9RtrvX0AFodPEnGqaZfX0UQc4s1YtreSt18M7uhoGkWsKmvkfUeklDIx5rFgLIcENMeI
         IZ47gHywrHyKykJFNsbRTT6IDCnB7LPTgEJBPvtEnqIleHYj7//A6uwhC2UL8xzKxjzy
         V1s3H8Rh6q6rVA6UbOYrnDa1O385NtFM8557juwLt4Y4FSIf7emInovsM4BS92GKdnNq
         ++0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=i9+pzyUsDGtshwlle5j06h5MGSSDuJHxlDLTwBzpln4=;
        b=FJi4VNgFTihafbt50OqllR+IFSQOVYn+/vimBEIgsyq8EkXaULn17Xv58TaV7Vaqt4
         QoM8O+s+RlgVuPh/+ftoHTWAqCHHHPwVSDvdSHHkoOlz0iFtU7HZIC4JAW4/WZD8zsO2
         Q6nD82ElvMwTdJZFI07c+vlN9uKRiI1HP2CJASacoTi9Qwm1+5hBLcHwY9IcnnBcCbPS
         Mmr8bz1SVGCJguj7ATguZWu6OV7fEofg6EwqZU6KWBvYEUa18uBrJ6qmGXHmmerRE8yV
         h2ru/QbVU8fAFjNSBXWbeKL49sgrQ2uGWKhJ3dHJLMjVCUNJ7J+YDdpejCBt/SIcwg70
         67oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="z/hj0ZAl";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id gw8-20020a05600c850800b003cf89577240si7714743wmb.155.2023.01.09.14.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="z/hj0ZAl";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A5064039E;
	Mon,  9 Jan 2023 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9+pzyUsDGtshwlle5j06h5MGSSDuJHxlDLTwBzpln4=;
	b=z/hj0ZAli6eBXfcbKpkBdfgSIGhdULT5+C6E3eFxGBDFtisKFoiDsyY5k+Uvy2oNeppJ6d
	CFyptisMTpeQ1iSqHn+wIdHUkJEp9vH+qAkY2ZkWlAJEOVKJjfgWSElxRgxYUQ5WCLOPKj
	DC2vG7az+bw+VF0sydYjINHMtpfia2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9+pzyUsDGtshwlle5j06h5MGSSDuJHxlDLTwBzpln4=;
	b=Bn+iZOWPWX4Y0OWMV2gBGTQ8LbkJnM3YrWx0W6MZuFZ2vpgeIuBYiRFMk+rUHYahRsyDVI
	OizAaINv+ngyHhAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC6F713583;
	Mon,  9 Jan 2023 22:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YOQdJWCYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:40 +0000
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
Subject: [RFC PATCH v2 02/19] target/arm: wrap psci call with tcg_enabled
Date: Mon,  9 Jan 2023 19:42:15 -0300
Message-Id: <20230109224232.11661-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wXXCbtzgpRRQ

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
index e02a463d46..9cc136b508 100644
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
@@ -10814,7 +10815,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
