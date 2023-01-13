Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414296ejc;
        Fri, 13 Jan 2023 06:06:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVWsxcKhZv9OALiu4mypKbGGZEE/Q9s62GI/WaAIg0MK09hfMILtn/L46KaNjshAVezDab
X-Received: by 2002:a05:600c:54cb:b0:3cf:d0be:1231 with SMTP id iw11-20020a05600c54cb00b003cfd0be1231mr69536658wmb.13.1673618814371;
        Fri, 13 Jan 2023 06:06:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618814; cv=none;
        d=google.com; s=arc-20160816;
        b=NdWvrnLLaU2NZnB9Y46nzfK4bB/1Xe7c5vTG8c+poHiUmMvOQ5lwanQFbtVacvIjYb
         Wow+8tvZ6CEvIeKZQhUB0spC6LS72YpDPPJJ3nglrQYU+Ut3w6smzXW5MaKamoDzLo/5
         U912DM2afqAwMEjay/xFYJugs2Fec2ZLs3Y+rPQQwcxyCiHb+yl3dm7iY5Bg7+q7haO3
         gChNqihipqfzDMjRnwSYunv+I2u0CCL4XeE4Wvc6Xx1LtPfb5RsSxiuOKrjZC6ZphP61
         qK5TWtTCRGUnlSx3WsWvTuGKCQaejPelTdIF5aPBCimED7We3UjZP9/pj6B23NbSm/RX
         KSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=OfnT+Bc2iUxCNJO5zCn5iRzKggcmqpJtVaf6F22sNsk=;
        b=lUlFMmqEjQaMDXyDdgqCWJLlnYe5AMHp1N7MzhnGu3Wzecd4eIB94vHe/LDX/txCzg
         1lEUETlOzONNwKEWIOJ/qienKdcChCJKBsIGU6pQKdLaNwogs7UHmoK5xvlGkDkJciO0
         TocdRXlDoBBFIDjs4Ns/3aVkiVPuxaIfpPReTNXfMnAfASq2TlckBR9GIHASyTlQbMES
         nkf6ZO6kWdMBJWCQkoBHxKZ0/FKGwczY3kaPjRtYs5tl2xhSWGfGTHiXog3CO2ehCPr8
         /ss8DuSm5AEeOH987yAn+MA0vWgu3AOvjc+ZX643ra5ETgCKj7FUSQ/K8b6/Mcdmz0mY
         TYDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qkjFhs9z;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=U2lWOsxP;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id c63-20020a1c3542000000b003d35156ac22si17582560wma.76.2023.01.13.06.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:54 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qkjFhs9z;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=U2lWOsxP;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4FD14DE3E;
	Fri, 13 Jan 2023 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfnT+Bc2iUxCNJO5zCn5iRzKggcmqpJtVaf6F22sNsk=;
	b=qkjFhs9zZK+d11XZCFJPuAiRtV+eCnse7fIsXfYTwQvJiOZVypW3VAyTp9FyIGqzBkRg8j
	N8i7Tkg8j5yUWlvtL/TwNSEnsf0wAF6eVglG3TGnvMhgzUs+ULgdgUPuOJm0JXBN6k6HtU
	H9yAYj2T8STMTN+avjOl5E1pEESw01c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfnT+Bc2iUxCNJO5zCn5iRzKggcmqpJtVaf6F22sNsk=;
	b=U2lWOsxPYl3dHe6m4UaxbruKitlIFwCqbkmZR2XrDG1G3NRfPXviMHN7kG3tHq75ES8Bfy
	p9fub9VUupR4GpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 453EF1358A;
	Fri, 13 Jan 2023 14:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MBMiBHtlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:51 +0000
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
Subject: [RFC PATCH v3 09/28] target/arm: move translate modules to tcg/
Date: Fri, 13 Jan 2023 11:04:00 -0300
Message-Id: <20230113140419.4013-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xbnWs9zg3T0c

Introduce the target/arm/tcg directory. Its purpose is to hold the TCG
code that is selected by CONFIG_TCG.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Also moved translate-{m-nocp,mve,neon,vfp,sme}.c
---
 MAINTAINERS                             |  1 +
 target/arm/meson.build                  | 30 ++++-------------------
 target/arm/{ => tcg}/a32-uncond.decode  |  0
 target/arm/{ => tcg}/a32.decode         |  0
 target/arm/{ => tcg}/m-nocp.decode      |  0
 target/arm/tcg/meson.build              | 32 +++++++++++++++++++++++++
 target/arm/{ => tcg}/mve.decode         |  0
 target/arm/{ => tcg}/neon-dp.decode     |  0
 target/arm/{ => tcg}/neon-ls.decode     |  0
 target/arm/{ => tcg}/neon-shared.decode |  0
 target/arm/{ => tcg}/sme-fa64.decode    |  0
 target/arm/{ => tcg}/sme.decode         |  0
 target/arm/{ => tcg}/sve.decode         |  0
 target/arm/{ => tcg}/t16.decode         |  0
 target/arm/{ => tcg}/t32.decode         |  0
 target/arm/{ => tcg}/translate-a64.c    |  0
 target/arm/{ => tcg}/translate-a64.h    |  0
 target/arm/{ => tcg}/translate-m-nocp.c |  0
 target/arm/{ => tcg}/translate-mve.c    |  0
 target/arm/{ => tcg}/translate-neon.c   |  0
 target/arm/{ => tcg}/translate-sme.c    |  0
 target/arm/{ => tcg}/translate-sve.c    |  0
 target/arm/{ => tcg}/translate-vfp.c    |  0
 target/arm/{ => tcg}/translate.c        |  0
 target/arm/{ => tcg}/translate.h        |  0
 target/arm/{ => tcg}/vfp-uncond.decode  |  0
 target/arm/{ => tcg}/vfp.decode         |  0
 27 files changed, 37 insertions(+), 26 deletions(-)
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5606e5dbd2..0c33bd9307 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -161,6 +161,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/
+F: target/arm/tcg/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
 F: tests/qtest/arm-cpu-features.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index aa5aae9888..6dc7b800e6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,22 +1,4 @@
-gen = [
-  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
-  decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
-  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
-  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
-  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
-  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
-  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
-  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
-]
-
 arm_ss = ss.source_set()
-arm_ss.add(gen)
 arm_ss.add(files(
   'cpregs.c',
   'cpu.c',
@@ -30,11 +12,6 @@ arm_ss.add(files(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-  'translate.c',
-  'translate-m-nocp.c',
-  'translate-mve.c',
-  'translate-neon.c',
-  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
@@ -51,9 +28,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
   'sme_helper.c',
-  'translate-a64.c',
-  'translate-sve.c',
-  'translate-sme.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
@@ -68,5 +42,9 @@ arm_softmmu_ss.add(files(
 
 subdir('hvf')
 
+if 'CONFIG_TCG' in config_all
+   subdir('tcg')
+endif
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
diff --git a/target/arm/a32-uncond.decode b/target/arm/tcg/a32-uncond.decode
similarity index 100%
rename from target/arm/a32-uncond.decode
rename to target/arm/tcg/a32-uncond.decode
diff --git a/target/arm/a32.decode b/target/arm/tcg/a32.decode
similarity index 100%
rename from target/arm/a32.decode
rename to target/arm/tcg/a32.decode
diff --git a/target/arm/m-nocp.decode b/target/arm/tcg/m-nocp.decode
similarity index 100%
rename from target/arm/m-nocp.decode
rename to target/arm/tcg/m-nocp.decode
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
new file mode 100644
index 0000000000..044561bd4d
--- /dev/null
+++ b/target/arm/tcg/meson.build
@@ -0,0 +1,32 @@
+gen = [
+  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
+  decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
+  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
+  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
+  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
+  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
+  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
+]
+
+arm_ss.add(gen)
+
+arm_ss.add(files(
+  'translate.c',
+  'translate-m-nocp.c',
+  'translate-mve.c',
+  'translate-neon.c',
+  'translate-vfp.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'translate-a64.c',
+  'translate-sve.c',
+  'translate-sme.c',
+))
diff --git a/target/arm/mve.decode b/target/arm/tcg/mve.decode
similarity index 100%
rename from target/arm/mve.decode
rename to target/arm/tcg/mve.decode
diff --git a/target/arm/neon-dp.decode b/target/arm/tcg/neon-dp.decode
similarity index 100%
rename from target/arm/neon-dp.decode
rename to target/arm/tcg/neon-dp.decode
diff --git a/target/arm/neon-ls.decode b/target/arm/tcg/neon-ls.decode
similarity index 100%
rename from target/arm/neon-ls.decode
rename to target/arm/tcg/neon-ls.decode
diff --git a/target/arm/neon-shared.decode b/target/arm/tcg/neon-shared.decode
similarity index 100%
rename from target/arm/neon-shared.decode
rename to target/arm/tcg/neon-shared.decode
diff --git a/target/arm/sme-fa64.decode b/target/arm/tcg/sme-fa64.decode
similarity index 100%
rename from target/arm/sme-fa64.decode
rename to target/arm/tcg/sme-fa64.decode
diff --git a/target/arm/sme.decode b/target/arm/tcg/sme.decode
similarity index 100%
rename from target/arm/sme.decode
rename to target/arm/tcg/sme.decode
diff --git a/target/arm/sve.decode b/target/arm/tcg/sve.decode
similarity index 100%
rename from target/arm/sve.decode
rename to target/arm/tcg/sve.decode
diff --git a/target/arm/t16.decode b/target/arm/tcg/t16.decode
similarity index 100%
rename from target/arm/t16.decode
rename to target/arm/tcg/t16.decode
diff --git a/target/arm/t32.decode b/target/arm/tcg/t32.decode
similarity index 100%
rename from target/arm/t32.decode
rename to target/arm/tcg/t32.decode
diff --git a/target/arm/translate-a64.c b/target/arm/tcg/translate-a64.c
similarity index 100%
rename from target/arm/translate-a64.c
rename to target/arm/tcg/translate-a64.c
diff --git a/target/arm/translate-a64.h b/target/arm/tcg/translate-a64.h
similarity index 100%
rename from target/arm/translate-a64.h
rename to target/arm/tcg/translate-a64.h
diff --git a/target/arm/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
similarity index 100%
rename from target/arm/translate-m-nocp.c
rename to target/arm/tcg/translate-m-nocp.c
diff --git a/target/arm/translate-mve.c b/target/arm/tcg/translate-mve.c
similarity index 100%
rename from target/arm/translate-mve.c
rename to target/arm/tcg/translate-mve.c
diff --git a/target/arm/translate-neon.c b/target/arm/tcg/translate-neon.c
similarity index 100%
rename from target/arm/translate-neon.c
rename to target/arm/tcg/translate-neon.c
diff --git a/target/arm/translate-sme.c b/target/arm/tcg/translate-sme.c
similarity index 100%
rename from target/arm/translate-sme.c
rename to target/arm/tcg/translate-sme.c
diff --git a/target/arm/translate-sve.c b/target/arm/tcg/translate-sve.c
similarity index 100%
rename from target/arm/translate-sve.c
rename to target/arm/tcg/translate-sve.c
diff --git a/target/arm/translate-vfp.c b/target/arm/tcg/translate-vfp.c
similarity index 100%
rename from target/arm/translate-vfp.c
rename to target/arm/tcg/translate-vfp.c
diff --git a/target/arm/translate.c b/target/arm/tcg/translate.c
similarity index 100%
rename from target/arm/translate.c
rename to target/arm/tcg/translate.c
diff --git a/target/arm/translate.h b/target/arm/tcg/translate.h
similarity index 100%
rename from target/arm/translate.h
rename to target/arm/tcg/translate.h
diff --git a/target/arm/vfp-uncond.decode b/target/arm/tcg/vfp-uncond.decode
similarity index 100%
rename from target/arm/vfp-uncond.decode
rename to target/arm/tcg/vfp-uncond.decode
diff --git a/target/arm/vfp.decode b/target/arm/tcg/vfp.decode
similarity index 100%
rename from target/arm/vfp.decode
rename to target/arm/tcg/vfp.decode
-- 
2.35.3
