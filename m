Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787696ejc;
        Wed, 18 Jan 2023 11:38:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtss+rZYYLKWgAcLK2CkZNZvyXiDPHfIKGxfvwQru485ytA72cTBGWO7J1IgKIX+BqwJv3d
X-Received: by 2002:a05:600c:684:b0:3cf:5d41:b748 with SMTP id a4-20020a05600c068400b003cf5d41b748mr16404872wmn.36.1674070691719;
        Wed, 18 Jan 2023 11:38:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070691; cv=none;
        d=google.com; s=arc-20160816;
        b=jpe75rIzsW5GmrOl383DsFAfZ8JAsIISnM6J9DG8pg6RtYcYu9lxCkh80mGOkLN5N4
         DI11DoV8HoNmR9QlYJ3j4e5XF9jjJkPKlafGgiMlyYFXEv+smz4XDo/+YK+PZxuYfUSk
         ff9BNWM5h/t00VMugbCMGP5WpEpkaBbNJkQx0VP9faVdb8qmJJeym+rBCRxXB0+EQ+p6
         9CbBwzR37rRsUqIQeGFwUF+3jefniVWzPl9RMIaHF+II9Fv0SP8ROQ4WggktGCi8KnY3
         pbbqjgw/2dkb26YcWW8qSRraZ4qYawySXL3GKmRZ6xmsfHQ3AKbfEKxP4Dyy66IW71ef
         XH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
        b=HEgxM3a/3TC4CsRTzatfAMg4VzQvkVNiJBQ+L4u9deKn+RtRQxNMuATVGTJxVoE+dN
         W2alg/MqLc5b85N9GTPBGfts/XnPPFnT0WoLQgcYZJEQpE9b9HXcR6ZmamYEDPHkgZIB
         rTGxtkwl16ao47MdSEvbuTpuCYCLcx3Vh0n17cLEdenPrs2cPpVAHRUGynNuuCt51/nr
         mmA5+Ht3cdj92bIA9HWihxvFlNF9QxosnW1WYkCvW+G/++pd2r7YnXpzSvWq993bAsIH
         VZTH7TfPrhmzR985bg7PzCy5QULT9gCtillk60PCr3PPIJqQA02oCHHUc6xdk8N9aTjI
         OasA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Mt1ckD7h;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=vJqpwSJQ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id v10-20020a05600c444a00b003d0359fa609si3176421wmn.185.2023.01.18.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Mt1ckD7h;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=vJqpwSJQ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AA093F683;
	Wed, 18 Jan 2023 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
	b=Mt1ckD7h1fdKZdTq8KQwqjTdm0gjEem5HDl9uMxZK0Rzc8oYRcUt4ahBOzdq9HXs1pfUjN
	BnpL6fDUQHK6j7Q4THCdgEteGZAVUwSTk8O6i1+g/+HM+mkyBNdikYVInTv85c+HClyHF6
	JE/lGDv8ztZMtcjYjfprf13pD5yDFfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
	b=vJqpwSJQD3SHstpO3fjEZdiA8jBr/1KZW3EAgHa8jh2Kz36t6aT2CXYd1Z6qY2IqBS5D+J
	mtn4rkaqn9x4XeCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA7CD139D2;
	Wed, 18 Jan 2023 19:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6C6bIKBKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:08 +0000
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
Subject: [PATCH 15/20] target/arm: Don't access TCG code when debugging with KVM
Date: Wed, 18 Jan 2023 16:35:13 -0300
Message-Id: <20230118193518.26433-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tDIPm5qJfDKS

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..2af75d0904 100644
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
