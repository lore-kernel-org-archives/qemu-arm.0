Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709559ejc;
        Thu, 23 Feb 2023 05:11:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9xpY4uc0AdyvOkrPcZ5q0BfvAJ/dQ4C+Bs8OyGLW8/UWKtx6dY9JaVItIyirR9N3LZxUmI
X-Received: by 2002:a5d:5106:0:b0:2c5:a742:5721 with SMTP id s6-20020a5d5106000000b002c5a7425721mr9444783wrt.34.1677157877372;
        Thu, 23 Feb 2023 05:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157877; cv=none;
        d=google.com; s=arc-20160816;
        b=IkUUxlF0HxJBIvuD8ibaXHNSp5sZqB+JZ7b0MJUXAHSlUqLCgpbfKxVYI9GWdtaPIY
         Gz7PFUHpqvjO6iZCLhbuQpxDZfPVnqmb9/ww6ioALMBBnvpuKgfydeOc8AjFE/wajzy9
         Vmy03GanR8GvbNjora6H5HLGFqKC2AF5kCyTJPAMuCgi5wFOiOf54EpxXybld1AEVQBP
         W7kbBV4lq7/0m32GAbhL5ZM2k7lckNOA593L6YaUQL3JMICryrp2v+scWFNGDnxzXFuc
         k2idE7+Q9qL7sCkhYwd+0vncZ0/ktZMpvMvujsyPAGhy18ph4qxdIU+B0BvY+SKYhJ+q
         751Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
        b=RGuy8SXSZ5XPW5FmIPe+9gngTMkwD/35ZAH6mnM3QhUZJDLwNeWs4AYfnKp5gYpW1e
         2sGSCIxiXoSDfpZUIBCKrNO1ohss5DaOIAVJVvpuXVeW3PU4at2GyOW2xRQ3dxSv61TS
         LKqi9i55z1qhhzi296BOEsc0UmWSaMrIBSa2wIvni+jIY1bLF17qA//wuAGPxSA+6nDV
         T4z5WUfvKepTlokOPLZiDqts0uxJEWzg7njmnHWUtCP4BZgFabp5bJIgE2At1HVHUHjX
         uJQufSjTsacXLll2kT2QJICHNsmSpsgqJTBiZmbiChJqLYOSPG3qp80mzCzgzy+GzcEi
         3ojA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ac16KWGB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=qKWm3JGv;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id j16-20020a056000125000b002c5512a60a7si8046382wrx.39.2023.02.23.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ac16KWGB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=qKWm3JGv;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0033120529;
	Thu, 23 Feb 2023 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=ac16KWGBE+P+hSRCbIhxbKe60xrKBDiVBq7capRP9IWtiz71AAeF5hJmTDpgJqWo9mOPd6
	bVVpuDWdqRYx9tgU38Quqb+RJnb7Cmoe++ghatt2tHQzMd0G2MgiXrarH3U1XR6dTuWdaA
	L2sdyCcvoghNGAHVUcY00WW8tq960hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVRXNM0AgsWsO2zpgPZaekbf//B8pg0/noEILVOS+ac=;
	b=qKWm3JGvBn1TYOpKNVGVtPNW62WPveBI9Xtk4PCZ8UWuoQKpsnwdhTeaUaU7/xH8s4oSuq
	dqVc9f/TTMFgCSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F8E1139B5;
	Thu, 23 Feb 2023 13:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +M9WNvFl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:13 +0000
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
Subject: [PATCH v7 09/20] target/arm: Don't access TCG code when debugging with KVM
Date: Thu, 23 Feb 2023 10:08:30 -0300
Message-Id: <20230223130841.25916-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eBzrFWxoFaWP

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
