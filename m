Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378749ejb;
        Mon, 13 Mar 2023 08:11:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set8OHMJrU92AOWXN6wrBBWhjLUlsNl9frm8pvVJ72ZPBD9ct+VC2g02ickeiKaHlulpUD4qE
X-Received: by 2002:a05:600c:4f02:b0:3eb:39c3:8844 with SMTP id l2-20020a05600c4f0200b003eb39c38844mr11757022wmq.12.1678720278795;
        Mon, 13 Mar 2023 08:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720278; cv=none;
        d=google.com; s=arc-20160816;
        b=o3zc4MxWTwNo/GWu9ntrxj9xfSjZtKktgUrnNtQPEImHDDyCtzOCfez/hr0zz24f3k
         jv1LwkDYdsYb/sWabCy5W3qxj0H8Lq7wV2bolej9F1yit6QN5vzK1IjQTfpG1GFyG2kc
         ljcga3DdTULJSZWSHxUVX8KP4z5vqq7E5YTzCFWhFh8Y0Bc8abBeKEohcG0nvaFdLINN
         Y6zZ5w4KMCVJ07VzmMW1+Gh1XIQK9NKpeGIvIF0L6TeM2aFEz9DUyWtj1GOx44fGFHEa
         EfMGnboOjVjZa21RdqztN4EuU6JD5X42gmDVGNxc1f45zIzMRqjXV8fa/R889BfKa1EX
         7AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=PSIQn4qmrmgg/w3VwS88pHN3LpWrryUnRIkyIj+D7qA=;
        b=Jwd+Gh0fT8Ujx3ft9YLLIKJogpOOVAmAd25G/IUUY9TzZoLT6wGP2bgrid9JLhHWzB
         jd8WJGsVNAC35/H+rGPrW8uBNP2K2IbmCaHEMr8aOg0E987JssRtda+pzB0K+obGkvjc
         n106ryFkFdNjCh2QiW2k0j8f9fK39B5vDAXRRO7+KahLx2XrCnUq9yr18c8tH5UQV2tU
         AsLDwwxdguQDUFzz9I68hN9GTqI/sNs8mOlur+9/1oGcUK5yXYWAZkFF3i9NGB/bCiAD
         oSbSH+ml6+upwz5UnFzL+khlO9poDOlMKFZnthjgNYGeU19/lUmTDCJFB3Gx6KTFA0Da
         54mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="MnyEtKH/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f2-20020adff442000000b002c704c5038dsi4508509wrp.456.2023.03.13.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="MnyEtKH/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 735BE1FE0D;
	Mon, 13 Mar 2023 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSIQn4qmrmgg/w3VwS88pHN3LpWrryUnRIkyIj+D7qA=;
	b=MnyEtKH/Y0E7d/fZP33vu0sQXX6S9qUY3aj6KuBLp32B0w4y329sbHiZpvLpvkWIbxQ3jz
	J41Ud2ca9Qn0G/GotzIeORzsEeUpYCb/gh27DwOyyqiUwtEgJc7w2NA5uWrH35ozMoKXc4
	HosGK7+IPM6AqzCauKzhEh5jUz8lAkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSIQn4qmrmgg/w3VwS88pHN3LpWrryUnRIkyIj+D7qA=;
	b=aeH39iMeuIOUCgK/5L3NDiY3wfihuyVqXAudzVXeNKQk02ZLRcsEtvtvk1VHabDHauNgvF
	xWGUUn57fO1MWVAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9452A13582;
	Mon, 13 Mar 2023 15:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gEBGFxM9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:15 +0000
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
Subject: [PATCH v9 04/10] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
Date: Mon, 13 Mar 2023 12:10:52 -0300
Message-Id: <20230313151058.19645-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bN/VcwKW8qsO

This code is only relevant when TCG is present in the build. We're
about to enable the build with --disable-tcg, so avoid the error:

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
`m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
`arm_v7m_get_sp_ptr'

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/gdbstub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 78105b8078..36a1d7dbc5 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -323,6 +323,7 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+#ifdef CONFIG_TCG
 typedef enum {
     M_SYSREG_MSP,
     M_SYSREG_PSP,
@@ -480,6 +481,7 @@ static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
     return cpu->dyn_m_secextreg_xml.num;
 }
 #endif
+#endif /* CONFIG_TCG */
 
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
@@ -554,6 +556,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+#ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M)) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
@@ -568,4 +571,5 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         }
 #endif
     }
+#endif
 }
-- 
2.35.3
