Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493663ejb;
        Tue, 13 Dec 2022 11:08:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6z/kaLPle7LwUZpmdtWWpmxK/5GVQqZixUXvIfsN4XqwsDdrA94PPaOGOrGEDiL8gFyB9w
X-Received: by 2002:a05:600c:4e52:b0:3c7:18:b339 with SMTP id e18-20020a05600c4e5200b003c70018b339mr20769622wmq.37.1670958514368;
        Tue, 13 Dec 2022 11:08:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958514; cv=none;
        d=google.com; s=arc-20160816;
        b=u2kOPa02qTT8YnQAKDbLIKpzg0OXIAqNje5cYm0waYhZCQZZs0CwgO2YuvyFwhrStj
         mo1uZ3PJOn1AQn4Og8vu77PQNOy+aKNqsyhzNhii9ybLsojZSf8FIs+qiPasebu9lOQp
         BIXAejOxiKyy8zlMXxWRR+CYnroFjzb7Lf4fZjWY4rSVxQd8J3sZebkJfVsOvkWRl9/D
         E9wun6J2zqZSO2nu/IjqHAHakEk4JaMgLzY6pBXBLYfUiUBkS8JEi5S9wtHiOBq+q/CB
         NRVqXh7JhETENmJXLpOX0GkUSmcsZTmHEN8u6EOQ2+Vhsa3I6YvMugpxDXfxyylWW6Do
         UhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=aVAE2JUy6EcxWtpDuGqmi0x4GKXnpAsfErWxU7vEXJ0=;
        b=t6RDXskAAb6BtiQSVuWt4dW6y4Zpq2ZIl71Df416a/tcIVl2Sc9jQ8oLgR7lBsI3Qb
         roBCN5AIzgPyfETJ502shyMbJHdpC6la/yXcmTwCKofFkfHpGEdckTtgC8bTG7vka57y
         8SapsxSQwriP1zHcRlTtjBeaaXkVsRCXsDUODyyhPgkzxTNGT3fJPn3pfF76++rJFDrU
         AcVi0Q4MEPoYcrVn0uro4ReBOW7Pz3mndH4h12nYNYQlg9xEsV3S5nqsUxxLwcm+97rv
         I5un8IBGYcF3ociUIArAIrvzQrTvyg0c2osFQZk7MVnIZ+YxUdt4SQzN9i89XvK2PaDF
         x5yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NSaZRpbo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+q5kgEO+;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id x7-20020a05600c188700b003c6cd28c9bbsi6068149wmp.53.2022.12.13.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NSaZRpbo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+q5kgEO+;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04D0F1FE21;
	Tue, 13 Dec 2022 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVAE2JUy6EcxWtpDuGqmi0x4GKXnpAsfErWxU7vEXJ0=;
	b=NSaZRpbom36IuHzBCESSuxRdNwVQmRnIElix7Nvp3xxc5Dx54rVRlEgA+4gpIEKbGAmpRE
	p5cVZGQeDdHWqrUyGbTgYi39y4EaAh7WBawrDej4Nv+6wWJAHMQGrJHbZIRA+/FK7pEJnm
	56BE6D4IFEptklvIcVtC1Ad3j5cPD+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958514;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVAE2JUy6EcxWtpDuGqmi0x4GKXnpAsfErWxU7vEXJ0=;
	b=+q5kgEO+vrsJfN6MnnLCejBz02JY8nCuEYkIS9Zo3JEwn8maplt9HSVIn6Mhd95j/ndtQ2
	EEkCQ9JUu5DiUsDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CEFF138F9;
	Tue, 13 Dec 2022 19:08:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WKjLOK7NmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:30 +0000
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
Subject: [PATCH 4/6] target/arm: Remove unused includes from m_helper.c
Date: Tue, 13 Dec 2022 16:05:35 -0300
Message-Id: <20221213190537.511-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R9sOThVbj1bF

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This was extracted from the following patch in the series
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 08/80] target/arm: tcg: split m_helper user-only and
sysemu-only parts
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
