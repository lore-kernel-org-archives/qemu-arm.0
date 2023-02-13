Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546547ejb;
        Mon, 13 Feb 2023 12:31:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/oN53d44o+UZNloamnOCPS7KQ3Vv17zM3GeA9ilVTxkWs4hnCZ6wbYCymwi1s+zli0YPxw
X-Received: by 2002:a17:906:d114:b0:8b1:22af:7d5d with SMTP id b20-20020a170906d11400b008b122af7d5dmr163575ejz.70.1676320297314;
        Mon, 13 Feb 2023 12:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320297; cv=none;
        d=google.com; s=arc-20160816;
        b=IxWPFMo6ZnYq96eSMcllCVqF2O7WYTTeON6euLcoFBGg+tDcQFlSnb+7sYHvbJ+2MC
         dBL/MMWHaUvyZ+H9HSTq9BoIAlkCXJjk4bGRceryQjmbE21iPbebqouW1lE9wlhchbis
         yfjKzuJPCfq+rF7ZcEZzPryiEmLkhhVsSP3z3aHvXzMjzLH38ZjpRgFXFLIE1HDwAIn+
         Z52DKuus5K9WHyaSLd2Qc2AtIbZ44hWpgGxk3+xu5jfkzmVQWbOeJNGOpdm7jHgUe9o6
         4xtFByhgaVpcwhm3a7xmmbHAa8PYglpAqDlRCFK5EzQqLK5UiqVubXdz8cgbMuwdx+lk
         rlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
        b=pgJjvew9FC7LNwUDbTJ6jeulJ6ExX4FB8pRrPjmrHoyoZRlm35Uxyz+d65XdP0prKW
         ILLVxpn4VjNEXva/mqe2AkYk/6CZZIv1feVPE/EQTL94NifTgeBo0FgHM4nQK6baceFE
         MC/Di9LX3UKZax9lc9zsPfpRXIJ+rVfjbk85VjW7ZGGH448kvpbcRvL8VPZMMaLWgGts
         UH2cefb0EFCFWZg6ZNCGYBH6vAVjwKxcqb+XfLR4tDtSBB7rLMfXw6jBpo5OXzE7eV4N
         O6agnu9uxzdUQatJRQ5Xqoy+f0h/XazETFChROzKwOd7z0H0RnU0LdWY0z3rGzHAA4OW
         jylg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=D5ON7o8B;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=7Kklxcw7;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id w14-20020a50fa8e000000b004ab4cef81fesi11534073edr.638.2023.02.13.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=D5ON7o8B;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=7Kklxcw7;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E203C20004;
	Mon, 13 Feb 2023 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
	b=D5ON7o8Bl+Zv4ECF6AGzm9h5Xg1DIY6PPzDCGlA1aziaEVmUXSCS8K2h+/5xfB8Hf6PEtm
	rpCVhj5ejaSm5Sit/EYP5p4bzPxGuoyOLSqjLS+I62XV48xsk/tBNZoz6LLNy5TGVzipSj
	zLTHUEbjHt07zMOLZrFrbac8qv3/a88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
	b=7Kklxcw7yzBO2ORECRaEQdwdR8hFVCfzQ4dBCU9wDBjFII9MlCrYs4nrv//GJB5fz8YlDx
	v7iPzGb9GDKDXtCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA0961391B;
	Mon, 13 Feb 2023 20:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0Nh/JyWe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:33 +0000
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
Subject: [PATCH RESEND v5 01/28] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Mon, 13 Feb 2023 17:29:00 -0300
Message-Id: <20230213202927.28992-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lk+ZgrOWMc8S

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..190be1a64d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11006,7 +11006,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -11068,7 +11068,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
