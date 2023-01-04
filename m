Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305435ejb;
        Wed, 4 Jan 2023 14:00:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5tfTuYNM8RpRYuB5KIjqNSx6bPK446tGn6Qb1RHLuJfjOhXuNiIJdWtH9nB3RKqDurUSV
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id a11-20020a05600c348b00b003d22a722577mr33793619wmq.27.1672869655025;
        Wed, 04 Jan 2023 14:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869655; cv=none;
        d=google.com; s=arc-20160816;
        b=BQowXfXbnHIJJn/AUc72JPegPcXBq11It1ZZzcw4FJlBtZcAQJGmmLWchD11eNGDLN
         YBDsFwMvi2vQCpRBuzWaa2V5pbU3PLPjDpcQBt6EJ7rHnyjwkPtaq5HRRWMVnOWtssNw
         0G4hSSMQXCXtBqsuQwxihj0BoMfT7ZaoPHsImQFrW91FCtzmb3XU6PchWXGKnZPmneh9
         VY7ESLMshm3eOGCU8+FAWXpNxOPpLOKacq2haS9s6fUNh2cZBzEIwyQtYm+KHSvfXd6W
         ksNdjSPeltTqhYSfPfy/0HW2Bri4Dy3gbT9F0s32LYgh9bGbGZwGoafqB7rQ/rq8r6nH
         bYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Jyl5zyswICImBYc7g0EU/1QRFQ6H1877GALP3ky11eQ=;
        b=TavT0pHBhKoVIHKHfYxSdk7FTLII4fFec/2P4kJkhKp8lQ1/t2B/GH5UwGJIhfOFbY
         WcbJT7b6y8KT480zHPoAXG6/R1+lz6SUPuI9W1P9VwWB6TDQOXcJeyk6t7eHc/kz5Iit
         5sAJbrhNB0fK831nXJeSdCoipTCl3H/KC13p24qXb+mMsqWCVZbqJK9BgVmIWSulb6kd
         WlH8Aqqf0Oy3XGuX8Gs25/7sQkZ/QQVE/Xpb2/31eh8jEQF/wbsLk4FX0PaPfgQGv5nJ
         J4OhWdMECZmIErpF0HN5lr7JU/A/iDeJfdy/Qbk//ER03Lv8XCZL4n4W34uEzHUW3Me6
         YgcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LczbWaV2;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id n21-20020a05600c3b9500b003d34eafab28si101562wms.49.2023.01.04.14.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:00:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LczbWaV2;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92BA93EF41;
	Wed,  4 Jan 2023 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jyl5zyswICImBYc7g0EU/1QRFQ6H1877GALP3ky11eQ=;
	b=LczbWaV2nJCYLkvr/bFJM1jR8eEbtQTS/RdpUXYkzB3WZKkzi/8zKR3fy6S+E4OVD4k87l
	4EI3euP2OR3DLps5DszCHAEOyo3aNphphvowui0WDLWuuQ6vga2RdrmSEaA+Y0OG/P7Tvg
	qrbEerbP4V/L9Hr06nAvmGyglRCrkFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jyl5zyswICImBYc7g0EU/1QRFQ6H1877GALP3ky11eQ=;
	b=rg5Lj85/NldawP16PRE4cwsiuX9Az3j23NMcPmKakm7DZNTDyW07v+DIaNx3U8wEiWDOBi
	C54dR9fk7cyasHBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABDE01342C;
	Wed,  4 Jan 2023 22:00:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OD+8HBP3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:51 +0000
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
Subject: [RFC PATCH 04/27] target/arm: Remove unused includes from m_helper.c
Date: Wed,  4 Jan 2023 18:58:12 -0300
Message-Id: <20230104215835.24692-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oFVIPNWDA6W+

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/m_helper.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..033a4d9261 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -7,30 +7,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "target/arm/idau.h"
-#include "trace.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/bitops.h"
-#include "qemu/crc32c.h"
-#include "qemu/qemu-print.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
-#include <zlib.h> /* For crc32 */
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
-#include "sysemu/kvm.h"
-#include "qemu/range.h"
-#include "qapi/qapi-commands-machine-target.h"
-#include "qapi/error.h"
-#include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
-#include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
-- 
2.35.3
