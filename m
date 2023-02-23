Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709335ejc;
        Thu, 23 Feb 2023 05:11:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8F9KtWZukaQNPbhlHO4AM8q/3MFyUBYTnLLuQCRNSQ6NkqfiE1eRTd7o/LivDAWyj024rP
X-Received: by 2002:adf:f010:0:b0:2c7:5ad:9c69 with SMTP id j16-20020adff010000000b002c705ad9c69mr7227818wro.71.1677157863879;
        Thu, 23 Feb 2023 05:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157863; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4kbykK0isRHfeccmHiug4YRDnYuXkHNMshEnrcTedLBvkxm6e/FsknF7vOGENy1mh
         uReL0/MSijDYRam+X49EjZ4+cIuYcyhiV0nMFp/VTV98yrKAuY2fK439xnUfdmazG3zk
         YSifjXBoPc2BqMShwKGkMCtjlYT45KVtqlJOpKlaye5eSbQaCCe9hX+dhfeuq4o2YLIM
         39Y7/Ho/YkZd8GT5ZLmfY/ZOnBdbCJ9keKHWiOgyE9v+ZmuzUP+Uq2ovM1agXnW29UuN
         LryP0CL2Na2fl4Ic3I8/Nr7ykzxlJQfGczEueuxzAC8eqlogJDt17hqUHw7KxKJ7iJcQ
         ILrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
        b=KomzgvjRlFAlHtbBf0UIpAbxmCG+EN4vnoyXwVGkG8vD6vcA3mtdx5hvtaXQoymi+A
         y7RTBKViAi+D5wz27hu1o/q1zve5ZN24zAWHlhMMwrgTYu0jZFP2k1Oh73lsRWzkt0j1
         zBMJCqrXcc6AxqgFv5DqQn2GgL2XoMKDztXzPRal8My0IBTfPH5KN/EpQlt4PN88tGdk
         09i3/ONR2Yb9GoFcdCayi6M4hZMYMDCOJM0wz12MMy64yioOPbI/ierRS2gWLy0s+Au5
         jlqf+4a0hZTannIispjhY5UYfOtXLv3rlVq6b7pbF/wVMF2YDute+oTCJYcOvYUvxS9e
         7KnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0cVGARZE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=pcFAbJtF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f7-20020adff447000000b002c5a1bd528bsi12920405wrp.903.2023.02.23.05.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0cVGARZE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=pcFAbJtF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80364209FD;
	Thu, 23 Feb 2023 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
	b=0cVGARZEYkPG9JVsJli8NSPP8xr4Y4DanqrJ+OI0xLCU1r9dVzSkfPqiGL4+9bWZbqtjr6
	Nb4rx7+ZybHIqrNQYrngtFsfvog0NCBzTgCme8o1NyWh4r54zX3o87SQkPySzc7KJVT1r/
	2l9j7omgL8+DVTXv2d+TTX5PQFiaMRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idMRdTknij5akfDpU2EHeXHT1plxdisEKd5SP6dUfeA=;
	b=pcFAbJtFbgL42lDeazECQdfxhJTu6JUrneJ0KGh08CJhq8eNtMpSU6oRL3HN65PeWU4Tm+
	If9kQEXoFKX4SDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2ABB139B5;
	Thu, 23 Feb 2023 13:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yJLLGuRl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:00 +0000
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
Subject: [PATCH v7 05/20] target/arm: Move psci.c into the tcg directory
Date: Thu, 23 Feb 2023 10:08:26 -0300
Message-Id: <20230223130841.25916-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VmVnkVybl3tV

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3e2f403005..a5191b57e1 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -22,7 +22,6 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1f27ba1272..fa8a9eab93 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -43,3 +43,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'sve_helper.c',
 ))
+
+arm_softmmu_ss.add(files(
+  'psci.c',
+))
diff --git a/target/arm/psci.c b/target/arm/tcg/psci.c
similarity index 100%
rename from target/arm/psci.c
rename to target/arm/tcg/psci.c
-- 
2.35.3
