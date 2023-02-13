Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547113ejb;
        Mon, 13 Feb 2023 12:32:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/Q5bjbKcYDu6CAKWXzTSdJYXdC/rx5mN9HxcRJ0hXYKn5j+gufUVbhL6CFVTZb8RDAGO4L
X-Received: by 2002:a17:906:d8c5:b0:888:9693:fb18 with SMTP id re5-20020a170906d8c500b008889693fb18mr237646ejb.37.1676320348283;
        Mon, 13 Feb 2023 12:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320348; cv=none;
        d=google.com; s=arc-20160816;
        b=wiCbDXYV8PIeLkNUGMGZ94uNowl7fsJfZ+yYkXS8BsQQUY6ZMtTscBXqDnm2LxdcD5
         cscAyGYT6KzDFhuynAIdagK/1jau3UROIHDzOtncR2Xn4doZWIpvWY9XFc4jVK0P4I0/
         mfHLlmJjcy8EN+Op/4FMefQ4jI5WjU/ewIJv9EAqOnfeTxfVEq+XzmHUaooinae9bFWw
         T7kYghPGZx2J9BDFT2a/8Cpkdvf6tQPHJItFZnz0kD3SoRhfhrp3EEzPU2rpDmtllH8U
         n7YH0IMqEdZPjOUicxJ+Slxgc4372kWFSeZO0M9upN316dSHQh8FRxT4+nQxAkl1loJx
         rwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
        b=GB9ZAWDra1l3NxWlrpfengCbZGDsu8t8C68M6j7+D222oxKPf8W/uh8QFumSM+KpdQ
         90HJJtZjv8RMYsz3VvO+m/9OnQr8fkEUbqK/7rQvDxwVTsfagpYB8AK6aNGzS0NtSRAX
         Al+4BSuX5F2EccdAIyv4EgKHW5uwneSofvtKS/cSVe+N/ZH0HG1bLFt/TvPxnlaFUqgc
         Gu2X5ELzAG5/kDcG3eYXTSWLfC7zu6Cgw/aevkITZQmwKWbIGOWHfmDfZ0XuS6uWTsm1
         lh7ahXbcRUbMOVV4X9Zms5ReZvkroN3aWWO0jTzTDlWsWq0wJaWAf88IqdQYIQdNKjpz
         cy3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E8gg5vQI;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id y13-20020a170906518d00b0088923c701d2si20135673ejk.399.2023.02.13.12.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E8gg5vQI;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C79BC1FDEA;
	Mon, 13 Feb 2023 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=E8gg5vQIiefqVJohjV9zNKtnQseGCKgt+75eGRpWU5GmQzcZsgKBTBPZJw1zPewDWdSaSn
	uaM+ybagOPAj5Go+cW3tLUkF9LlhzDlUJA/Jafy4nERX/6EBvBLcvy3G1P+AlfrPAgHNXa
	qZ1vPej7PmordtXl1ubxsLPaWWxy0VY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=C4z+2lSEbzOl4R/qLeKQZ7vKaeDw7yREQtIPj2ohfcScmgG+rnIvdy+Q0TGPU+SIb5S7bI
	fLLA25sdR24h0QCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD1DA1391B;
	Mon, 13 Feb 2023 20:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MJ1dIFie6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:24 +0000
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
Subject: [PATCH RESEND v5 15/28] target/arm: Don't access TCG code when debugging with KVM
Date: Mon, 13 Feb 2023 17:29:14 -0300
Message-Id: <20230213202927.28992-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KExyW9W3rG9J

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
