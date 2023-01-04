Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305513ejb;
        Wed, 4 Jan 2023 14:01:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtXyuiuD5q09rcUG1zGOyTfPh2fDjmQUnjwyWkboR9OuC3sCobvEZTa0CCMPtxWPEGWqBJa
X-Received: by 2002:adf:fb08:0:b0:29a:375d:4c41 with SMTP id c8-20020adffb08000000b0029a375d4c41mr7457418wrr.14.1672869661747;
        Wed, 04 Jan 2023 14:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869661; cv=none;
        d=google.com; s=arc-20160816;
        b=i+btqMeceHv8kCqRW8+uCLOYFt6k+Eh8ff/PW6rKAHV7JqvXLIr2td/FRMi4v3Hhq9
         2IzQDAvFSHON6s2ajntYOfbld4ki2QtcPfXzFnLB4yuw4HDQB4FYqlhYN1EIylrYpVi2
         du3C6PkHW6zJH0vZqjDaDW9Clpm157mdm5GrVsY13RYDZzsZXYC2EISzbTNhxkYHDjKc
         nVXt+pRZOAcjQtL6CP1lXpJ7k5luNI1UJyqUXn61d5+QZG0Y7tuf9o0XPQ2ooUqool1J
         wGrGS+Hjn19M1kPe4kGTCCvrZPmlJ10Vm06GB8l8Gdj/fgKRoCsgJQbZLNMamiEH6S3n
         d+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=C1hL4Gw2y899DgYAb8lhVbTfRziHTpBfg0eV1lSRKY4=;
        b=hOWh/yXpgrqiVodUE4RtOuNqXLKNpGkSo1sKLDQ2yxbZ4EgHAfwgb+25fd4muBClTf
         0dePWEuivhQ3bElri0qkOpW5e/p0UlT/XxaycMshJkAFS1zpXi5uCBj/yRTU23F5Hhm4
         s2gN/zsMbSX3m+JgjBjXsH50flC1slp9fdUVspgMCNGMqJTELoC27jbO+zHK9zm1eztu
         FKn+hWSbQeq9XmYRdDh1j5wJvMiMSmMX+/HwBg2hj9YD5xf1phaWXtsy0hbVscUx4tvL
         CUs5m3rPtjhztJQ61GYVwIPQcLljjM/l+SoD+3uxAScXTivo5YQNV7gWHIxX2SLfTw2X
         P+pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UhAYJFhL;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id o13-20020a05600002cd00b0028525561e3dsi17630403wry.466.2023.01.04.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:01 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UhAYJFhL;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 415954C89;
	Wed,  4 Jan 2023 22:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1hL4Gw2y899DgYAb8lhVbTfRziHTpBfg0eV1lSRKY4=;
	b=UhAYJFhLvm5H1eCgXFj1a4zp06AcCGM/38wBJyphuJyzFCDQ9ltzjaCJOuydjvb9ZBV8J0
	RawvLKsDa5em720bFcfY74TwrPDqMb+9Md16uaJACl0643NZUOJRax1BLrX0FI8mh5DhWl
	gLu5Q8cpZ7XgsV6zIHZmCFtoVf15clg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1hL4Gw2y899DgYAb8lhVbTfRziHTpBfg0eV1lSRKY4=;
	b=BsGy2uVA2YoEpnHnuWfNGPwRuReWC5vGf0Qr4rZOHuoFsSecRzYP80NO7DbWNYozGmsoKX
	EJJKItPcT4mWAqAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 525491342C;
	Wed,  4 Jan 2023 22:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SDXgBhr3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:58 +0000
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
Subject: [RFC PATCH 06/27] target/arm: cleanup cpu includes
Date: Wed,  4 Jan 2023 18:58:14 -0300
Message-Id: <20230104215835.24692-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 57S1JzHvFO+T

From: Claudio Fontana <cfontana@suse.de>

Remove some unused headers.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c   | 1 -
 target/arm/cpu64.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2fa022f62b..f5381af437 100644
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
index 2cf2ca4ce5..0e021960fb 100644
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
