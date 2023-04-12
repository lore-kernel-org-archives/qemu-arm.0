Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281078ejc;
        Wed, 12 Apr 2023 05:18:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBTsoHYNjWZUQncCOFZth14Gq29PibXEMXdDu8e3Kr8MNzRs0HI/hRLNa9ilnNw5KBiaGG
X-Received: by 2002:a5d:53d0:0:b0:2ef:ebe6:d92 with SMTP id a16-20020a5d53d0000000b002efebe60d92mr9451221wrw.47.1681301923138;
        Wed, 12 Apr 2023 05:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301923; cv=none;
        d=google.com; s=arc-20160816;
        b=T7XWHjhZHxDoqKf24b6PrNGqWqHmKuK/+9J1ftusnSRi0YBUrRNz95Ei4GnTER9qaY
         P0tULj/s75d7po3PMTtZ52dZrsTCNrKR2YD/FhmI/EjrPLGMmG8ZLpBebavkRfzb77AI
         bjqQBGoeK70ga1a9avdU6g9C1g1Vgzuq/AvcmMr6Iz1FpQFXlZmDEXkwoHRDu0mtn3rs
         TYW1ygkHhnAzK/f3RoDRr/H7Cxea88EsiStdn0h/+qzv7fmNw9VG0VehTPr8aN200gJX
         hHNHXRiibxCaeehZMxE34xPD77xvygF94CNmtG8t8HeMV6wvB02v0dMmpYoy0sy43d13
         MMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=VGCbUEzChtUbhrQrVpqp86FoTCjne173/p1DBZAkO+A=;
        b=PZWZCUuiLmy+lhmDDk6YfwifwgvifdBnlTkMsBTOD3z+cimQDxuIPTAV24opqHKtJd
         giya1XZPUpS9JXRxPkb6DcVYlNo1vudcb2oK4wtJvlbgG44rJdynk5yOw88DoX6jnOie
         bEg6igV85zdFIv3Q6uPo+Bt5S08tHlXARW0OrGBQpgHoAgalAIJq9u/H08LXBkbJyWZg
         6QOSAJ5u93l6xVX1+BysYDWYri6YRD2fiHMGjF0hBDHM93Lxux6b5gP01yT2VE64FVwr
         sbmgClJ8+kDbKOI4aBpW6+y+v2BsX2fe83dA77m4ZupexrWbOIMAMP3iGcKdYazhDXTy
         fIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F0bfJBam;
       dkim=neutral (no key) header.i=@suse.de header.b="JZ74/lnt";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id t9-20020adfeb89000000b002dd135b33b5si11525985wrn.387.2023.04.12.05.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F0bfJBam;
       dkim=neutral (no key) header.i=@suse.de header.b="JZ74/lnt";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C69ED1F6E6;
	Wed, 12 Apr 2023 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGCbUEzChtUbhrQrVpqp86FoTCjne173/p1DBZAkO+A=;
	b=F0bfJBamU30Qp8s93nn9CdnYMip9dkmqp7vdjobwB2GIIPXn3JdqYC2BpTuXHThvtuVprM
	i7MpgmkcbMZQRPMXk5ai4Tk1p3vJhpNIclmQev5oeunIle+oL6YBrxnX1TVmbTm2LMCV2H
	wqESloTp6NVPuqlFOyMkFFdexj7UmQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGCbUEzChtUbhrQrVpqp86FoTCjne173/p1DBZAkO+A=;
	b=JZ74/lnttLkoIMCJNunha//B4zFfcssTFB1AQh90hdpZOVM4/rOIIPUxYtsB2oIzmZToUK
	tpLqeokOgr6p1SAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2594132C7;
	Wed, 12 Apr 2023 12:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SIjaHZ+hNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:39 +0000
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
Subject: [PATCH v10 02/11] target/arm: Remove dead code from cpu_max_set_sve_max_vq
Date: Wed, 12 Apr 2023 09:18:20 -0300
Message-Id: <20230412121829.14452-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dY2b7pGfutsZ

The sve-max-vq property has been removed from the -cpu max used with
KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
reachable.

Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 61a6b52aa6..f0dd041cfb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -336,12 +336,6 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
         error_setg(errp, "unsupported SVE vector length");
         error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-- 
2.35.3
