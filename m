Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306362ejb;
        Wed, 4 Jan 2023 14:02:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+phBHj37VNc1GToK7Lp2oR78amfdGzFbV0GTdj6CEyMdF2yCMC4/TTqTBwIeGoBD0a62N
X-Received: by 2002:a5d:4a47:0:b0:268:170b:56fd with SMTP id v7-20020a5d4a47000000b00268170b56fdmr33217759wrs.0.1672869729386;
        Wed, 04 Jan 2023 14:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869729; cv=none;
        d=google.com; s=arc-20160816;
        b=j/7nEl7v6bFWUHRWRlWzXY0iNeLg1dhhMJKQDo8E2EaHpZbkU6H2V8MJtLIKYC+FLy
         uDP1EBnJGuY+nD5zILmvmLmgl9AOQLnxOMnjX4/hRPG6JFZSy0fUDONDw0F+cPYmJY/O
         jhUt4+IxtiOB+vgPkZzRwtD4bR90xC0eSDgmtvmGugSONRUWf9Tnd6khBkXY6+3/ICk8
         A066gDF8vB6aKDininSRFXRGXusi48ryPQ7Gp5oU+dnojSw1JB25iE2gPu6s2v85CcD7
         Y/TRwe2IYgoKSvIALsmgXLjV3azk/6WknSlAM/lf/SVTMmZhuc2dsicRebCQVznUO3mv
         6h/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QnVis98vx60sXf8bSnXtdNnFjg5jfGQ5kovfBx5P2qA=;
        b=glS8Zl987QADmRJ39mHubEFgGQ6B8bcReBIAwnG6G11OWOyj9tz612i31mgLE7mxC/
         IQ4xDlS8+gVa+En9qWspmJ6rhb9aJb9XeOwazzRgz7vxvG5YtySKvNa03j4EUylTpnKe
         1HAO4pgD0A2hX2YYgMN8kC1Hnf8aX5ntddca9YF1SgYKu5wYY1CbUOM6L5ZzAiNZaXrL
         ki+SAWunczF/dfCJrrtvxNaxNRbYyR1o2BcLN1w5+tLKZvg6HRkRDqKYP+PIdZdWxl4W
         nXUfZJYhAlvRrC5I+agBJtESubUU+T/+c6IjRBOab7smo3hrASz88ts428bA/xXotyWb
         Y+lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="f7a/RMB4";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id m2-20020adfe942000000b0023671484b9fsi20201159wrn.223.2023.01.04.14.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:02:09 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="f7a/RMB4";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8C5D3F182;
	Wed,  4 Jan 2023 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnVis98vx60sXf8bSnXtdNnFjg5jfGQ5kovfBx5P2qA=;
	b=f7a/RMB4UH+uYmriYchitGJGABHYto+sQPGUMgB9We3JlETJFfC8J8sdE2B35eFlIuyaUk
	TrMriFSwJgYRvQodfYX/zMyuFrSi4ynLRhLFZYCQ7i0yg8azjA0E1IJnP4GUEP58lyQwWW
	jKlE0ewHP1ALS5masFZVoi7Ghenm7Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnVis98vx60sXf8bSnXtdNnFjg5jfGQ5kovfBx5P2qA=;
	b=OG2t9rcegXBHKiciTxdre2Iat3aPGRkeGpAgIoqPRXJT+1O8+ZiAsmnpTQy9zZlg0o8+ir
	gerlrOChOLEj6SDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CF9C1342C;
	Wed,  4 Jan 2023 22:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yPqpAV73tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:02:06 +0000
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
Subject: [RFC PATCH 27/27] target/arm: don't access TCG code when debugging with KVM
Date: Wed,  4 Jan 2023 18:58:35 -0300
Message-Id: <20230104215835.24692-28-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HL5Z4kdhkthm

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

This allows us to start using CONFIG_TCG=n (--disable-tcg in the
configure line).

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
As I understand it, only a small part of the ptw routines should be
necessary for use with KVM+gdbstub. But I don't know enough about arm
MMU yet to make that distinction.
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb..a85eba101f 100644
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
