Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546937ejb;
        Mon, 13 Feb 2023 12:32:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9ULZZwKHlCW5lpLAq8fIXfJEKli1rOPb/9fjFjyjKITTihYNsJUPJBO7vBunGSn399kZtM
X-Received: by 2002:a17:906:4685:b0:8a4:7fb9:5658 with SMTP id a5-20020a170906468500b008a47fb95658mr235896ejr.55.1676320334085;
        Mon, 13 Feb 2023 12:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320334; cv=none;
        d=google.com; s=arc-20160816;
        b=SqZ3x96aTTp5Cn8GozNYTEgdrgraVmSsMwj4Q5TBvn5uOQeV+xmn3i4rcavM/MuvrJ
         lQ/x0d3aYfYZ0mjBk7y1gxpT4b6YTHN0pdHc4MGqPNcojEwyJSw3PhvdgSl6Y8V4SDuT
         VitVHYQuReKLcv6MsD4gmXUhK44zJLMaiz937dCscZ8iiE66vth0Mx4wt3T10GScHVtG
         +xz8o/Br8wyO+57OSPs+rvDwtQ8EpnV6jE3wYyUSBd9VbpCDVOZgWH96I5zTOqh57uND
         Y1RHsCNAyPcjzV8kV3ZnhtcnfCmpvI99gBZugOgGgQVlt9aozEfjjvQAtRbhKBiwhMMk
         MhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=6x7jGZazPmoKErIMGJB+L/hmaUCom9Nn1EWXvza/M2s=;
        b=XK/TWhVpO+AY3a4REIfyNsk1nMSnshNfdEyQdC5Q69CjPQoP0G6rxakHCU9cmzPwTq
         r3/jgtLq25BcD8NyMqTckLpLEbB04biZJBNDP37ogh7SB8NtpXmZotFEMlzYzsliq7y2
         N1QSHlrNRHeINJkOGHQPpW4Q2gaRnDcwCiIJBtl5AYLsWIZXYuukChcwi9eA7cHb6N6t
         DrSTPBb9MRRBxUPtJTO7OOPDs2pu/BOrTjybmM7bxHP+7Xh9ifZQSGR/mRm2+pQv/QGo
         oU2SCUPgpoG3j74sfJQwDyiZYX2INNt4FzY+6UAhxMlhAHwhlHKBT8nYTvK4A/eQUyvg
         yhzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=v9NVY5Gv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=C6g8ml35;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id wl3-20020a170907310300b00870ed0f7caasi12053550ejb.362.2023.02.13.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=v9NVY5Gv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=C6g8ml35;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0E8B20193;
	Mon, 13 Feb 2023 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6x7jGZazPmoKErIMGJB+L/hmaUCom9Nn1EWXvza/M2s=;
	b=v9NVY5GvCK4BT+pXR4ktNcWOqB6vdfZNZjD6ErF8awVnxnksE5kbgNgPO8wTaMqo74aqgC
	t0G6sV24UYE3gbbhRMxjxwJVTJCzRo3c8VTETLC9UVQ72DQoEWnFg8bdk8m4ndQHjxaXCm
	V25Dgl/WeSrD0FbsDKrR4n59gpRPboc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6x7jGZazPmoKErIMGJB+L/hmaUCom9Nn1EWXvza/M2s=;
	b=C6g8ml35/pSPOJ+h13J3cl/dLSjRd2UeM8VidcJ1F3wXUMC/qT7RJUhIDSajPFKxwRhqRb
	eUN/PNIJ93NIabCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91A061391B;
	Mon, 13 Feb 2023 20:32:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CBqvFUqe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:10 +0000
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
Subject: [PATCH RESEND v5 11/28] target/arm: Move psci.c into the tcg directory
Date: Mon, 13 Feb 2023 17:29:10 -0300
Message-Id: <20230213202927.28992-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xe583qPsXVg1

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
index 01143a805c..595d22a099 100644
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
index c27ac2939c..47006f903c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -44,3 +44,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
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
