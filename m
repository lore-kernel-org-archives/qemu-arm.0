Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305548ejb;
        Wed, 4 Jan 2023 14:01:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBY3kh2GBBLTIta+HPF09x04hTLrRAe3xpdVZVP9dKmpg0bCzqU9MIPQt2NEbDD7RvJGn8
X-Received: by 2002:adf:fc09:0:b0:242:4990:b751 with SMTP id i9-20020adffc09000000b002424990b751mr29291288wrr.34.1672869664803;
        Wed, 04 Jan 2023 14:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869664; cv=none;
        d=google.com; s=arc-20160816;
        b=AZ2ZdRSRHqGoP5iIFyoYpj7PjohWDX0+2aHA+gIBoaMHuo49yVuLCaLz6Q7rBCKrZh
         4eSOUKUE6GJRNWra7/QibsT+RJlrJgpOl0JzJgrMmpZXv4uhTCEd8EEdloBicZGjdSyJ
         vDqZl3iIwIZHF6LsHa1grBS93q0y3Sq1BQvpN3HTdEI4mSPADcny9qHwpWNLN+t+TxCy
         duuzfgy/tNVW3FbcymPHPkAODQOefOeu8+X7FCdSPvIIcb2HUoA3OCrf/rdsKwSxjG61
         1aSq1TW6wyPdaPoUVSxdbZVazMxVyKEEoXTYtAxImWd43PmQAFSELihVVW8rzUWZOUkY
         p7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Dg5K6X0YNafBcih8BSbYM6qg01UdMgO6xS1j6qqZVRI=;
        b=tII72wdm9jjavwpojjshNk8BoI/wjawIi1luOPyNuCGCbLHdE2TpYkehtQhP3XWAp5
         8ngVgRUdVSuZhJFGZPCcuZzE/PGVtri7SYaZq1ztHY6XjeU70gf/xqix4xBn5fizZiWU
         OULr1jruSWfEB2SnxNpwLqjgDs38Yn5ekGuOkXbRUr22I+tcyWZIyNwSzATdcncEmhzx
         UJPCMhnkt0mmQfq//uy9m4+RsRvMGob4fOTcOqUC1M5Eicx9ccJ+KhrQ58uYrVJe5dEP
         gd0SvLK0Zdqv2nks+p+0IV8gZiUmpfg/+wqCEwcBaYcvE8JO69XxeBupr4Woye7pBN5k
         NDjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=v7AEvMMD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="ufUD/HSY";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id u11-20020a5d6dab000000b00228c68047fesi24119035wrs.999.2023.01.04.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=v7AEvMMD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="ufUD/HSY";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 678014D7FC;
	Wed,  4 Jan 2023 22:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg5K6X0YNafBcih8BSbYM6qg01UdMgO6xS1j6qqZVRI=;
	b=v7AEvMMDZ3K3LO9jlhkdDx1d4D4HLuZwCR9fbXqfpn0kqfGcYvs7RdpfgAs9ZNG+ecs+0y
	y9sxSb19jVJ1CzuEttvK1qJTSmed8jMROn66644wcgEkCHHWUcrhys1CG1vAt21x18j6e0
	UbJyRjUAcAotnK1eMNeh/v9kqH89yoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg5K6X0YNafBcih8BSbYM6qg01UdMgO6xS1j6qqZVRI=;
	b=ufUD/HSY55TSD7hT+CN1SdT8bd+KpKRvJFniz6c8QAsiFVpBrC4QRZzLsqXOkZCJHe8P2p
	FHCfygnoIuUuibCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9B0C1342C;
	Wed,  4 Jan 2023 22:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uBMnHB33tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:01 +0000
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
Subject: [RFC PATCH 07/27] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Wed,  4 Jan 2023 18:58:15 -0300
Message-Id: <20230104215835.24692-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GRm5yKW0vEr6

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6b0840ee31..89c07a88ea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10389,7 +10389,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10451,7 +10451,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
