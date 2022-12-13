Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493725ejb;
        Tue, 13 Dec 2022 11:08:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Vl/W7R5rdhxGwW3QrLi3Np7mqu4O+lv9/hJrRHPl3rzBBpZ+A/STKuo2XrVO9esRMEQR3
X-Received: by 2002:adf:aa8a:0:b0:242:91e:6a78 with SMTP id h10-20020adfaa8a000000b00242091e6a78mr14616926wrc.34.1670958520888;
        Tue, 13 Dec 2022 11:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958520; cv=none;
        d=google.com; s=arc-20160816;
        b=1G/+q4Cqk3uIy0mxTb5ZdJg++Ai6S8+HvhuNe+NImlgO2lT8J04sE1Y9MysLFIcj+K
         zJ2opWO1ukPeZS60+SM+6HA2wQBxFj7K+GrDJ9iiIEg/1XAt/dq/uoNkcyj48Oki7Nq2
         KUewRI4dv8dkL1uDZLmzR5ZmY07aksJTkGQEp2RBuMbHWYmkDXyRd2LKk4P2ts7zLJON
         eKKhtkRg7zou25rOJzwBic34NhMR1cy/rEPXDOakiAWG4U/mauICYVt+TzYahawitY3X
         PRHxZcbXYAiJMpMH1zJWpMm6D/tOPwYYCgvHzJx/uIDeX63IZkWF5HLEpGMW2Fz7Vqix
         Q7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=wRXZFTKL9nLSzPS9nIZA64DhKhT1iA29WEygE2gGquk=;
        b=dVRhBm08NIBWU4/VEULt2wYLKuZY2yLnvRjrf79QSFimM1p+yHGr4b9QOVLq0EIqbw
         60Yk/rt1OW9BfBBd3Sqh+X7u53IL04yVmUG3jveYEmoNkSr9+x7ecXwiZdUZjU1VDhV4
         aWmCAetFWibQvbN9QPum1MqFwBfCQRN2glQMkQrLTGDaKNAGEeP9335uJuaV/2gZJzkB
         Uyb+EICvHcAyXt/VVmVLLvS0lnjSrwKEzgUeJMe7z4GmVCnTgUrLMyKKR7I/IngABuXT
         6bI0Lf/7gCsjg3lLnaHECgUQYT7hZmzCgVujmBbtOjv3se13O9khhKrTCL+5uYlDUgeI
         9/fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wsPkNxQC;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=o4JPFhvf;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id n10-20020a5d588a000000b002422f5dbfd4si410227wrf.12.2022.12.13.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wsPkNxQC;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=o4JPFhvf;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E2131FE29;
	Tue, 13 Dec 2022 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRXZFTKL9nLSzPS9nIZA64DhKhT1iA29WEygE2gGquk=;
	b=wsPkNxQCqpgnH7ChddBaFN0BiWf+jEKpVRZ9+S2opNrsJzoCp7/PyiINcE7ibkNApHAlCJ
	5QzI2JDDqrTMPbnharY8xpQ6gQ8oxYgWpvmqHEJK/K9XQi55cocmcvo4krt6A5imMD2XAk
	7wLFGH0U8KxItpA4WN3kIwoizlVEkrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRXZFTKL9nLSzPS9nIZA64DhKhT1iA29WEygE2gGquk=;
	b=o4JPFhvfEs3IRxko/uVzsRgMk3H4vMueku7d3RSmzG/TGUyJSMwbJYcGWEvR9J7xaIfPMT
	VqC5g/+Ns2SLTIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC2E2138F9;
	Tue, 13 Dec 2022 19:08:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eP5OHLXNmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 6/6] target/arm: cleanup cpu includes
Date: Tue, 13 Dec 2022 16:05:37 -0300
Message-Id: <20221213190537.511-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QjwON05q524/

From: Claudio Fontana <cfontana@suse.de>

Remove some unused headers.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
[added back some includes that are still needed at this point]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 46/80] target/arm: cleanup cpu includes
---
 target/arm/cpu.c   | 1 -
 target/arm/cpu64.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..2e59d16529 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -26,7 +26,6 @@
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3d74f134f5..fe231f3d7d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,13 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "kvm_arm.h"
-- 
2.35.3
