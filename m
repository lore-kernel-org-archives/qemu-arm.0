Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721274ejb;
        Fri, 16 Dec 2022 13:31:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nNij7xDpEP2efJ2oYvfj/NJjfqnC69s0uSam3kEG9d2KUZgD9/yZOCZVrfBkMpaBucIYS
X-Received: by 2002:a5d:5a1d:0:b0:242:142a:c8ba with SMTP id bq29-20020a5d5a1d000000b00242142ac8bamr22960455wrb.52.1671226316383;
        Fri, 16 Dec 2022 13:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226316; cv=none;
        d=google.com; s=arc-20160816;
        b=qT3OA4/sUzM5tWV/aTDS82J54JRdTSf+4tnM7QdTE906uSpL7mkZ67sk9qUU0Uh5SR
         pgafgEWVEYVS6s+sfxzWyD8u89W1Hp2Ibmi/Y7rAUxKmmv6wIQpauutVFr3FEuqJ+RGY
         b3sqB55Um9+CWcYkeEeL67/VSiKKiPrQNtRMidwaRYgSu2VUUEV+qBYrbRU8pQHA+JDF
         4eIriplvTqqPrP8tWaeiu1VyJbkqLybI8J8CnbHGCZQVN3MKABSr7XcI9nOVHCzjT2aS
         aD7hAKZ2xee0whSC8nhcCcXRUSy4GDyH9eX1UtP140yheB6pzXcgRYLbR3TYT8NHojEi
         vkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ds1kPSfkEJo2lcQkYVoMrIv8lxj7zxQ5fmyLXqmUynU=;
        b=Tof8oiN+t/oUXHsbQ1PEgZMlPmQjQmbwUZy176czh2fRZnb6wJYdj5UOL2pJdj7Agj
         M969rZE7ACrBbJxLk8yJ+s90gKBC6+prncPryWMduYLsjFbVZ57Z8tYVprSFfO2zbl+a
         IFLSLQgUxAA0/NIUHAof9YJ/973KiDeJ9M5dBxF43tdLl0k5RD+8gh67hWbvRLqEGhbA
         ZU+uzo18vYPEaJQyJLoQGP/tmt5onTDvdCV7nk5ZVvKZQwGgyEIyQDrRyys5b7MHhf5s
         x4vGRdk3PvO3D7ipD0mbhnWm82IC+qZmklhiXqCKrwS47b3TKYaXPZVdMTHr0EDiS/Wj
         IHHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fsGZSr2c;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id by1-20020a056000098100b00236582ae15asi2942808wrb.559.2022.12.16.13.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fsGZSr2c;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CB9F634BF5;
	Fri, 16 Dec 2022 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ds1kPSfkEJo2lcQkYVoMrIv8lxj7zxQ5fmyLXqmUynU=;
	b=fsGZSr2c4g5YOGAHzwttRaaUiMG9u+9+H9Q00ViuwgEnuRXH4qS/br+4BjYwvdbFvyfZJs
	pEuN8+ohbNK2y500Qerujmwo9XRLswDASUo8uEsx9cWVLT2ozeUjziAtxjw6ZF9qPQxvux
	cLSHv2WRwudQiHcbMHfR/uI2Mk3+MfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ds1kPSfkEJo2lcQkYVoMrIv8lxj7zxQ5fmyLXqmUynU=;
	b=A+2cIceqkC8D0ftqaHBEC3JQVMYBFXXL//9xUzjKeJDcRfmNxv8baP90wyT1sBw0gT7htJ
	jT/U9+a+zU0RLhAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35ED3138FD;
	Fri, 16 Dec 2022 21:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0IfWOsjjnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/5] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Fri, 16 Dec 2022 18:29:41 -0300
Message-Id: <20221216212944.28229-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QFglaF6k6h60

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This function moves elsewhere in the original series, but the name
change doesn't need to wait.

Originally from:
[RFC v14 38/80] target/arm: rename handle_semihosting to tcg_handle_semihosting
https://lore.kernel.org/r/20210416162824.25131-39-cfontana@suse.de
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c8223ec3..45bf164a07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10252,7 +10252,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10313,7 +10313,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
