Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413984ejc;
        Fri, 13 Jan 2023 06:06:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfHV9IaTQwxYnkOSdglzmOoIWN3IF7bYWDmieQeofOS4EqoIWLkIqN/7n5v740Gj2xZRsu
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id bi10-20020a05600c3d8a00b003d344068a37mr58648371wmb.41.1673618798343;
        Fri, 13 Jan 2023 06:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618798; cv=none;
        d=google.com; s=arc-20160816;
        b=Ew35Krgaa1SxC3ySYDcmO2GTnWtMgNKToiyrTwbmZxiQ2IOdupFpTMwvzM2wv8GvZl
         bphyGAoPoUE+4OmupIrm1pptFH5kJ0SvmYXuZRwgqNzE/DYf8WlMTPxrmCc5eVyTnfxS
         tyFU0t9R1jTXoKrxmyZCtsNRJ0x9Ef+pNzP1RfmIF3PdIbzDASax/1x34E+YCdsCWo6q
         s8XFchAL7+5HqVbekfxcxfg8S5HM1bmGTpvUuFjRC883UWIdS6xIWHEakv4BSiFD70Nm
         OO6Aj2j3vCs6gWddLqFqcABfq5q4TzivCefV/6j9KiNQGLlFG3inuG6npmTdN2yUrEEK
         IN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
        b=mQ3HOwkXMhs0p4QJRhzabojGvwnSCyKWg/K8pXszpbNGBrSWnAhUxV8MJBLouoerZH
         s8Nf9UPjKliMh0XIym1lBM4j6QUWlL2icTvP0drvITDbonDvM3mkmSjJb2QUIMeRt1BS
         phf9qBh97vNIYmz5qSduqMmhBM7XQ+UfUT5fn721qEaeLVzdo3ncagg/4ais+swHEuGz
         I7ioEi7fwz0ymfxyRL0WiSbsC+RLX+KquFlrY1hEaC0LCU4hMJ23I5wwz5yl5GCuSEyA
         in2gxHnNlZ7wkbQb1ZEuitQSGNdxVBAcDZk6v7JPeyPp2sHbA6+h3hhOAVC3B6zbhONx
         dMGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=dmPHGm2t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id m10-20020a05600c3b0a00b003b476cabf10si22885256wms.230.2023.01.13.06.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=dmPHGm2t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52CC3256BA;
	Fri, 13 Jan 2023 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
	b=dmPHGm2twQJnWf51JeG1LLLSV3rW7Fvi7ecHezmM3GnhGvyDfHx8ko3LOWycF8iUK/WenR
	PgvYpW8MYvizdVP8iU99GPLBsAo6xbqrioZRaLFJL31Nu7WpugnJUoAIPilZD3Ic2c7iML
	ahg20g8DIZv/3pfZVeFXh2FfQoSxoYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
	b=ISORwn25gRR5Tx8CsWx79gBZg/6Mkp2nl1XV8hanX02wJaYqBktt/8SJi+QIaZVSIXb/6D
	+8dylyQcFDZyJGCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1B9B1358A;
	Fri, 13 Jan 2023 14:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qD+fHmplwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:34 +0000
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
Subject: [RFC PATCH v3 04/28] target/arm: Move PC alignment check
Date: Fri, 13 Jan 2023 11:03:55 -0300
Message-Id: <20230113140419.4013-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7+9qq93NFTM8

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5f26152652..b4c3850570 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -839,6 +839,15 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
+    /*
+     * Misaligned thumb pc is architecturally impossible. Fail the
+     * incoming migration. For TCG it would trigger the assert in
+     * thumb_tr_translate_insn().
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
@@ -856,15 +865,6 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
-
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.35.3
