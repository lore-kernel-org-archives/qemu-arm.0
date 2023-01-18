Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787229ejc;
        Wed, 18 Jan 2023 11:37:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmxC8v3jV9jHKqt2fk5lASz9P8XQy8x76VhHFrc6BRrdTKF1FlBo5/8gXdi0mbP1vVzw+U
X-Received: by 2002:adf:e9d2:0:b0:2ab:80b3:67b0 with SMTP id l18-20020adfe9d2000000b002ab80b367b0mr7282502wrn.61.1674070650381;
        Wed, 18 Jan 2023 11:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070650; cv=none;
        d=google.com; s=arc-20160816;
        b=TyWoaETWt1yFfcomd/Yxt3E+i4lzVvAgbou4ym8v8gSpCnxl/DjTvwmap099c2mb25
         1f+N/zNWA+hRsoiTp9Gn2ehal/hghGZKgI9LKS8Bn31wmMLz25rzly6mn6ueBvLVvvGG
         4Lwz+hX93tJTOXcSiKNzKJNNK14+/Uwb2ftPY5ruy5nbPWnF/lryfZvEdHfAJwuCkHnT
         /ZnE6wHC8QdIIWK3+CL0kOykcP4BJHvH+Md+R4049C94vdpy8egcwBi5YUNZ+u9ZnslK
         pXv6ZvnrTFC/0QFWyjrKl88TGkZTCHCTAWNseLdgbF0z1dxSZz283BI1rR4HEBeL1bL7
         wTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=paJgP+QiG/EwIIxiB4Oa6lWh7hcsCTHjlQELhIqjQXI=;
        b=Thb8IX+4S22010pLbIM5kWsvwCquSUoItZGDqN3dTALZkN4iGbCDwWntR+MeLwBTMB
         AxZKH9i+aB1AQzSqfJA5s/N1XbhT/I4VjQvn+3nK/r+5UUTMwGEJfW8r7WA/6iP3QHE6
         5fEvRT+JH4VX+nK25Imi7trIHs8T/+n2RTrQT0DbGD32MFMv7t7yRlhG6p6rtw7Tey7e
         JfgCLhVBFBwV5zEEgIEdOh3/NCtPRRYgtGUK+GiaIrhwFlZtkL8N9Ss1TVZNFyIqJMAE
         SATFiGDzCi5vfuO5sg1Nk8cX59ehau3RSXkKACw5hRNuYr0hN9uK92k3FJRm5ESuN14Y
         Bc9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Pm3AQolq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id f5-20020a0560001a8500b002a4507a889csi35452324wry.257.2023.01.18.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Pm3AQolq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 070C83EEAC;
	Wed, 18 Jan 2023 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paJgP+QiG/EwIIxiB4Oa6lWh7hcsCTHjlQELhIqjQXI=;
	b=Pm3AQolqWgKMPvkPoyhYPugelM+gZKYIfafcJeS5gKvBHG37r6ENNJ86fIy2O4oZN+7/G2
	L279mrZdy2NrBCBKRyMAAJ9QO4A7FHPV+hIxd94vjCGQtebMsPQYdLEu6SuhJST3KpQIl7
	pgqTnISLeNdrccAWjAaaGYckBunV1Ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paJgP+QiG/EwIIxiB4Oa6lWh7hcsCTHjlQELhIqjQXI=;
	b=0GAgb5Ukje5NX0RLNVyue+5cUlKtOo2vXpKN2rm27N0XYJtfnDP6CV8hpdjmiiA2yhWXX8
	22Uf2KUZQQhpd4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63C47139D2;
	Wed, 18 Jan 2023 19:37:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GAt3C3dKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:27 +0000
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
Subject: [PATCH 02/20] target/arm: wrap psci call with tcg_enabled
Date: Wed, 18 Jan 2023 16:35:00 -0300
Message-Id: <20230118193518.26433-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YCzi6bmbj2Oa

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
index 45b5939676..7c39280a83 100644
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
@@ -10852,7 +10853,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.35.3
