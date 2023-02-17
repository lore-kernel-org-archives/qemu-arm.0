Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128175ejb;
        Fri, 17 Feb 2023 12:14:43 -0800 (PST)
X-Google-Smtp-Source: AK7set97NgjbYuQaNO0BUwGvSZgqwaX7PAtMjnECsuUW6IaREVZ0y8SNl0WvLHt2j+kwu0uJSsRp
X-Received: by 2002:a05:600c:929:b0:3dc:55d9:ec8 with SMTP id m41-20020a05600c092900b003dc55d90ec8mr1490142wmp.41.1676664882987;
        Fri, 17 Feb 2023 12:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664882; cv=none;
        d=google.com; s=arc-20160816;
        b=KEDMK1WiaDkaGwOU2HcR5NE75ufXlXnBnw3xoFDjWVAbRLUhew62t+qicxHrgBsJMh
         0Kh9ijNSCVJYMSmMg6dj5KigjsVGGmt3d4oM92uWzRWiTKXZH5MUG+d0m6ebu5nXJlFO
         r0Qe1Xt6HFzDegDUGrslbe3IOSTzI/CX46gbFgK10TVpmScOKGwrI1ufsGLgErWNiiQK
         wZZpnnRNFVzGA+3oVfhwWgsZatGh2jArjrMzUQ/QUF5GEUlRnqB17zuUTquJ8bk2dJ9a
         scqWE7LgkrxX1Utn4t6RcacvyuWurrMzpRnTQYhW9fNII41jP9cfqcp07CNxT+JzdfLb
         u95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
        b=mjt9W1ULSPTHx5l86bGf+s6qf40da4ez4nUFS+bfe23bKXr1MvtvfeyY1ENuZDfVad
         obx8NOZXmoAly7D9IyppQ6GdbdKNKHkGl2iIxWLzfH5NgaoTWHvSPe+6o8diZP/MTmdq
         b4MOy6qaMgsyi/Ip0eCGPmCyuMTaVtIrlGQ1vi3MjxJknNFz1+nt335y8RXnqBbjFffq
         CRs0kqJDGCysGAylOR1ev9PBLamljRHDNjFWVvXodfWXNla1xu3BUUmztQyncBgwwWCC
         fP8TAmxBG//UD6vLph3QMQYMB2pAsKqBiXkgbssrNHLPDcp8+vxXrIekNFIruBiAwUd3
         mooA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MLjVHSyQ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id p15-20020a7bcdef000000b003e2052d735fsi5143478wmj.63.2023.02.17.12.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MLjVHSyQ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BBE822086;
	Fri, 17 Feb 2023 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=MLjVHSyQO96NqvnNPrGnauCkmjYWx81ZUWislhhtOA040THzC4r+Y+8qRBrF8Tq9+xCEoe
	SeZoW302m/G/ZDFuDmnNMAl/j8yNKp6Acsley/GBEc/GvISS036kyPjMZl/hrsf5Yvi4P4
	eZBTdEP7p9xmO8/Gs9Bweql73P2Zy+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=eRzvlanYQ3DSr94EUuwy6NLmHNIDwxldb7nIre1tlb2UI1Z/wdbRdom9toDkfWXH+dgAra
	AYjAKnAR4nu5ctCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B63FA138E3;
	Fri, 17 Feb 2023 20:14:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +EBmHy/g72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:39 +0000
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
Subject: [PATCH v6 14/29] target/arm: Don't access TCG code when debugging with KVM
Date: Fri, 17 Feb 2023 17:11:35 -0300
Message-Id: <20230217201150.22032-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O/Uqs5PEhKTz

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..be0cc6bc15 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -254,6 +254,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
+#ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
         int flags;
 
@@ -270,6 +271,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
+#else
+        g_assert_not_reached();
+#endif
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-- 
2.35.3
