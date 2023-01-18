Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787191ejc;
        Wed, 18 Jan 2023 11:37:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJnHMmMevytjwIvdR/xLu9df+b3dH6qy8id5ICfusNYymcaBCX3IUdih8UyRdQAr4Pvxo4
X-Received: by 2002:a05:600c:3b07:b0:3d9:c6f5:c643 with SMTP id m7-20020a05600c3b0700b003d9c6f5c643mr7833794wms.29.1674070647345;
        Wed, 18 Jan 2023 11:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070647; cv=none;
        d=google.com; s=arc-20160816;
        b=u7VuxyclJoeZn6nd1bBg/BACObwOOnviJndk7Oj9u3x+F7sitWaotPAOsQXabxOg0+
         oUBQ2RKy0rQxlJYIaH678JcUlggLKfwuU3gbmriP/O5hPSn170HYCMFxPjK+SZZKAb/w
         FN3lDu4WF2w36l/ynen0JgUx74dV3fBA0u4ljh2m/frVeLyJGo1/RZpd6HVYOF2zwbQx
         orEDfNdBIFGB/d1dZvlQfCRoKKEv6U+hECrcXa2cJ/cOdmqppgXzBkYoNjLSEMZzu11g
         hZdR0+uEJwdrMmbUCV9ZKV06To1KJAJr/AoR97BnWd08P2YUpXI3OTdvmuBquLnnBEXO
         //WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HhbJpNHW+Lwvhi95bxflLe8LTd2aqZyacCsLiXDAYs4=;
        b=ll+GgpI2yJTthBRb7eYg5P99E1WJtuwaxiCbNxRQ1CKWeOd+2JnjrOWs2ewYZwjJSb
         FdvUMM1Iy9dtDigof/XCgjtNeASxw9fqUNOoiPcrS8dtFD+ceusnhseMcFO7VIIdkQBa
         h5O4Yhra+Xzavp7w18AdUUtKXOTC2zcYulqHhBmPdrf4oKC/pqu4kjN8M28I6YUXZNIt
         Uq3rv81SxAnOWujebpSTuS9U6H9hv0J3nOZLMT78g+QJtA5Y+SkDV8RTUh3mGNnmZr9f
         FWcmZt+oh8+qONd5BRvpWz/LdC39iFf91TUwrP+8nWtj9jvltf4Gi2nuLo3USAQUhDo/
         EqaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z5BakPBg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id f12-20020a7bc8cc000000b003da23df7f39si2353113wml.137.2023.01.18.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z5BakPBg;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC9D920DE8;
	Wed, 18 Jan 2023 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhbJpNHW+Lwvhi95bxflLe8LTd2aqZyacCsLiXDAYs4=;
	b=z5BakPBg8MzQ4dL/ah6suzOMlR4nKnixHsAUI2FQjij4IR658WUUDLZNBzf3PVEj9ONHdy
	BwDEBVgKnDm28wNJeuekxNAQTHAZx10qp8slY5a0T7yDJJn6MN0BxROwInbMNMB1r5S8w0
	sqfHLUhpqe+z7jbwP8dolPVDJf+weEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhbJpNHW+Lwvhi95bxflLe8LTd2aqZyacCsLiXDAYs4=;
	b=ZPlWdZ2NR0HMZrPUB5Dlp87ndgfENuoL0FoMbknOpxr/MP5U0nnPfmCnD3e8Ghk8lPCgmG
	L47cuyBSH4s25VBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50768139D2;
	Wed, 18 Jan 2023 19:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CA6OBnRKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:24 +0000
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
Subject: [PATCH 01/20] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Wed, 18 Jan 2023 16:34:59 -0300
Message-Id: <20230118193518.26433-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jkFg8b2i0fBg

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..45b5939676 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10803,7 +10803,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10865,7 +10865,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      */
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
+        tcg_handle_semihosting(cs);
         return;
     }
 #endif
-- 
2.35.3
