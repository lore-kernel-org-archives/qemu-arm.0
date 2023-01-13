Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413820ejc;
        Fri, 13 Jan 2023 06:06:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHZwA0EieyuOarQ4QwvQ9QB3roYtVLX3NWZ2ljiJiv10SE+5+kk8GIjhlBBrRjVwFttWZo
X-Received: by 2002:a5d:6b4e:0:b0:2bb:3208:993d with SMTP id x14-20020a5d6b4e000000b002bb3208993dmr16176259wrw.63.1673618788772;
        Fri, 13 Jan 2023 06:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618788; cv=none;
        d=google.com; s=arc-20160816;
        b=eTEbw37bqHkOV3+uL0slircbsn+aosFon3M2ltKMjOWT3XbGxusAf2T5j2hnG659nl
         BDv44ItDV3IC/AfeQot1eTCImcAk636seZOUHIcuVi2DXEzDhujzcnSXZonU0LP6Es3I
         XR4K8Lmx7L1GCSsNHYNF7jOWeI+W26GtAZNALROcDrGQ3u1Ct4vRM8qcL6qpCciw8y03
         iCU9c3hsL6LLNNRzZxJ8ZFy9vPVY3JpjHg3EHJId4iUVG9l0s+WGglqUlbd1KMgu0IAC
         AmtvfevabZCk8dKhVm9hLfDvX9PHsCAYtzaHWB3T4AWEzaEeaGXWMWD7iuvUOA7J0pkS
         GRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=JwdP6UWB79glgm/mrxaIUx8FIz/hhphXguMFYhSgE18=;
        b=oX+a3NoEpaT+uEUHty2VBZVV54NhsrixmMSk2ZbjbIWegQzmfhOVxZ8zrrr92km76m
         qE9zNEYe1sFUrZqpv6uvsHrix7sj1mS+RO0LiqfZTjIcRB1CKltFApYFLQIqEKer8O9c
         7rYNoC15ZKMoLmMpHVRs/w5stLBnOLPbqwuJF7xxcGo0Y2LjPUw6/0UfJn7aMU9gN7Y2
         qHS7zwuelX3P+SSwrK4N03L7XPTRfZEW569npKUcxKjvh25GDC1KB751nxoRq7Kmj6G8
         tEDHq75c+zdT42pkQXYiOsK0Je/cvtXCwM/vGlQpUwK8I6FOrg6yKanrdG9Qa7xx9Q82
         gotg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DEbKx5Km;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id bt4-20020a056000080400b002bddacea882si1220707wrb.1018.2023.01.13.06.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:28 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DEbKx5Km;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2DA3F6B4EC;
	Fri, 13 Jan 2023 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwdP6UWB79glgm/mrxaIUx8FIz/hhphXguMFYhSgE18=;
	b=DEbKx5Km/RgUkYNzCA/z1Qph3YM1BUD4Iy0aK4VmsnWCJH8WMXUPWp0luYS16DP6e/9sJW
	UgWF0ffvj1yHGBs6oHzhvNT9fJpDRvTHqSJNb24MPlXhchwUImIFyqLzVhBYr6XviVC1WD
	VGdClupuk0KqiuqkzGszeP9Fu4S7qoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwdP6UWB79glgm/mrxaIUx8FIz/hhphXguMFYhSgE18=;
	b=nASaTQ1OTz0qddQnzi5YKK+iYsIIU0bUn23jKtPvXKKpoCj0GihuikihZiVntQJ8v+CZl5
	o4QdGOyS2CrBgxCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FC5C1358A;
	Fri, 13 Jan 2023 14:06:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aKupFWFlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:25 +0000
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
Subject: [RFC PATCH v3 01/28] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Fri, 13 Jan 2023 11:03:52 -0300
Message-Id: <20230113140419.4013-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XqFNI/gfBVyG

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
index 1d74b95971..ebf70777d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10800,7 +10800,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10862,7 +10862,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
