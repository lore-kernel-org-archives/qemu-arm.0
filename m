Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305469ejb;
        Wed, 4 Jan 2023 14:00:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvmNmKBo7kunoP9KFJrJw84KSFUy/7SNIzzw5WLINw89ovCXxDb4BkIMA0jNJH0f43/NDr7
X-Received: by 2002:a05:600c:3b87:b0:3d2:813:138a with SMTP id n7-20020a05600c3b8700b003d20813138amr38171614wms.35.1672869658279;
        Wed, 04 Jan 2023 14:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869658; cv=none;
        d=google.com; s=arc-20160816;
        b=mI3vpbOxLTzMgmuxl23rM8SZKNQFwpBcIOuZyv9/Iwj5+M4EauNVBI5DQsd3K+jaMM
         U5Jb8ARFMYHVO7r7QWpyl2o5H0ll5D32ajKe4yhggjVKU8vmr86B5gtSGAJ8xo4yXXvD
         K8k+cx05wJRBNUENPc2FE/n9rLEYEFwMfPQC0d9dbpg4Pesrl36zsP7hAJkwT3zseubd
         ryojmFEBQV+l2YbxLBy6ASvv/+luhvM0tBQYP+JsJxdswAPlNIIVfC6mvJDYyR4aszrh
         +DdWIhaqfOUMuAaSdqc0SNmSwruh39rUJAW212L7n0PwyBiBnEUs5hkgVZ4N8pEH3QaV
         whZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=SohJXh2a0enjLrudWooUmVZlYTIt3WL8caWaqH8Sl5E=;
        b=cy3TXYywj81X/aNzWtfB9qlNBQ6cpDImgylDLDQckUit+W36/3VelC4A0kf3KdznUY
         2hmGKtNlL4Hyu5Jw4DeSxVttWvMsYow/3s20ag8q1KQ474v15waEMh8+g91r+Bjgloq6
         c0AEo8w7pqRHzO3SxoAAIXHthJY7c5Ju19wFhy+eOQZPsdxBHuQXf0kK4vivRKqzGDEn
         x120qCfNoLKKTyhhn1Yx17Si/Vpwz4gQ9XgW08Wr1zgr7R3KR29PzeqzmE6BhnsHLkLY
         NVTK7PaAU9GAlc8vkocPdbsXn//lwgbZ4+4G+xiy0L+ou6Pw2mf08hKdn4Rnfgw1QPuP
         7JEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XtQbavAt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id z21-20020a05600c221500b003cfa2b10b9bsi52406wml.206.2023.01.04.14.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XtQbavAt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCD163E8C4;
	Wed,  4 Jan 2023 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SohJXh2a0enjLrudWooUmVZlYTIt3WL8caWaqH8Sl5E=;
	b=XtQbavAt2/LKxjOTU4GPts2PGMvcGYtgsSPDJI6KmRtDC73flZjNivoF39FTs+t7fPKzGB
	zIKQrqc/mNBMblhSKr4RhJMsYWcmrmpPlNLPTK3L5AWtTq8qB2WLsV7yoJhOl26D9hCi/h
	Tfp6yiUwr0IEhCCfOyy+5pCSrlly6R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SohJXh2a0enjLrudWooUmVZlYTIt3WL8caWaqH8Sl5E=;
	b=SL+BMIXngfksc7ynrJhe/esrdqTlZ591QIwT9OcPt67WJZXID6InNhz5AO8RRpHLwPfFRS
	P7NAka71wMyhi9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 060EE1342C;
	Wed,  4 Jan 2023 22:00:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ICP2Lxb3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:54 +0000
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
Subject: [RFC PATCH 05/27] target/arm: Remove unused includes from helper.c
Date: Wed,  4 Jan 2023 18:58:13 -0300
Message-Id: <20230104215835.24692-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: m2F/GyE4/uJ2

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ed3da5ada3..6b0840ee31 100644
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
