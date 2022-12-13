Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4493689ejb;
        Tue, 13 Dec 2022 11:08:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dRDQFC6AjdWfLRJsEhTpAb4mzfREFs8RUSqwqLHnTP5dXOnIjvttcous2TKyDVbO/TGPf
X-Received: by 2002:a05:600c:1e01:b0:3cf:a4fa:510 with SMTP id ay1-20020a05600c1e0100b003cfa4fa0510mr16838032wmb.30.1670958517653;
        Tue, 13 Dec 2022 11:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670958517; cv=none;
        d=google.com; s=arc-20160816;
        b=Bd6H4Yk9XDeLF/+zVUkJ3jy+MHftdFPEqF5atm8ydPJKt3cGt5go2ix1uw+vE0pqAd
         0kRM1JjCASn7AGZxhvHn7S7YnYYEvmteMWt9Sgcg5qYOJwPXwfyjtGC+AnPtF6VD9J0N
         T6kb9knP5lz7pY4LSSaswz9gUq40XbENprIFK2OP7IKDTq2eJ2YGFiJwil752+gaIkUH
         WtVPEYReRbVWsNq34WDsxog0uTDn4YA5Pi62VkDZv40wKEBQG5bYe3gBBvYFnq9lSeVY
         5WYHyQlczjWfkxTuambRsS5NGvAJPuswRmereuhUgomt9C9uGN+0v5rphKXJR31gmkU0
         8r8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=H6/ZaorSex3TZvFckQlmMo2I6cmRd34OrBEGNHWWxIY=;
        b=x71so8d92tp55ndUKoRh53wK+S72t6ABch/cDcogXVl58RW0E2qWdhBSvdVmSimCdQ
         KfV6R4M6zKBNVYDUSSwkT6CxNIw5ClWRo5BgfPCNqYW5ZwihLriV5/S+cLg75iS5uIp4
         vQFlH0y3qlEnZxR8Y0Sv8bjMsVlDwhk1xCQ4nYaTSyIDBc8PPBEmZchiqAdMxpaadAoF
         Fa1lzVlky/m1WMScEFMV2OTzf2YN628SJw+iIBb5ZORrQf61+B3ApdZ3ipFDg655XaCE
         RDMPSkFNXsSrOLE6ktPMTCQj+EzNiFuz87OGRELQDlYMGSmRZfeWsAgxnTw5eyWDA0u3
         a0Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Tx3ODwPq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id iv17-20020a05600c549100b003c6f690a584si7236491wmb.16.2022.12.13.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:08:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Tx3ODwPq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F6321FE3D;
	Tue, 13 Dec 2022 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670958517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6/ZaorSex3TZvFckQlmMo2I6cmRd34OrBEGNHWWxIY=;
	b=Tx3ODwPqo/V+orOdfvygAlaVvRLcoGvPZhB//pHtV4PnRZeUSyT+o2Ha+CfeXcb1oIjerX
	JRpjbkMli4v3WXglvDNItS0L1lrM/wMfrCpagKxFd8If8cE/8ZUc+23PMZzcSg1yKXt/kj
	TzL0qFI2djE+0W5z7mCRtfm4MfT7LRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670958517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6/ZaorSex3TZvFckQlmMo2I6cmRd34OrBEGNHWWxIY=;
	b=/o+lec2cUtpPlhtbHTC9vSlk04SuxeD1/p2KVx/WN1jgZXzvPY7jTgrGawzn+lqPSTUWUT
	XfxMIBhaVuBQRtBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7169E138F9;
	Tue, 13 Dec 2022 19:08:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MK7hDbLNmGOcBwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:34 +0000
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
Subject: [PATCH 5/6] target/arm: Remove unused includes from helper.c
Date: Tue, 13 Dec 2022 16:05:36 -0300
Message-Id: <20221213190537.511-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LoM+oaFwOhBi

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This was extracted from the following patch in the series
https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 37/80] target/arm: move exception code out of tcg/helper.c
---
 target/arm/helper.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3cf978bb93..7baa94e42b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7,13 +7,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
 #include "qemu/log.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "qemu/bitops.h"
@@ -22,17 +20,12 @@
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/irq.h"
-#include "semihosting/semihost.h"
-#include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
-#include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
-#include "arm_ldst.h"
-#include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
-- 
2.35.3
