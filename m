Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122351ejc;
        Thu, 9 Mar 2023 12:15:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9iuuttQ8Y09hI1DajukONjI/xFAhdr3BbJTZpanMl9NdrZcqSxHdopLEjztjjtRJDVPXnt
X-Received: by 2002:adf:f483:0:b0:2c7:46f:c410 with SMTP id l3-20020adff483000000b002c7046fc410mr15641864wro.36.1678392917153;
        Thu, 09 Mar 2023 12:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392917; cv=none;
        d=google.com; s=arc-20160816;
        b=NUKbsGpUgVuvQFmC0yvnOwzVzqLTsOvXfFxs5iDxqM9g5unpv2pSPWmvN8M4CAItYu
         bhCLGx/SIqUF2t5hl6bFqTS2zEPOzPIS+GLcw2XdoXwyTUq+OLvEh7vxtq3fT5Bfa7aT
         /4yDUgGX+kQysZVMDVTn+D/1HzFgfUpWK9hAQh5UCqn/VPSRKzx6/XolsSxp8kNBoCZw
         Gbv64FEgn0rv8M3q3z2qFID2YJfMak5XWVfYIjctQ3zyR95RHR9TW++VRdWlwltGP9OM
         7DWtniIr7xiESK9XlLGHMrcmHTJ6Awzf9ukRi8zwk9oZdHgZncBagzw8GQXUdvYAsfmp
         qvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Qp1zV7PiZ1mjCYLbNiX16Xw81PbK5WfPRc15DxtV7UM=;
        b=q70derFWTBRS5Rh8PDEowwoQXlsfJXvh35mRvGQSOHYnJjm7EepMNvymayyGrwdyLT
         0+J4W15e2gtytWCnEIEpq2gOKMIgAJKPBPr2sVUKgfQDTSwx6W6yzBtzTQZmW5t9H2sa
         4ZEEi9zbmuZcSVqUxbOr+k0m/teRNVnTc7dyNiFkHJ5X9DRigwvG984azHDnOKwCFJeh
         IGlEaY4uiauj35f+eqV0z/bPfpcI/P6wvlGuhrfrZ/8ci16qlOwwqjOvHgLq5OAxigJQ
         iJtyvABkhGx+0UgMVkH0baeMTTza6HAFVUavd+7l5cubzCRgm5G0WLcRGOd85fhZZJzH
         m++Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="cgJws/2h";
       dkim=neutral (no key) header.i=@suse.de header.b="tWDnS/69";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id h8-20020adfe988000000b002c7045868e2si295315wrm.662.2023.03.09.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="cgJws/2h";
       dkim=neutral (no key) header.i=@suse.de header.b="tWDnS/69";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C115B21C0B;
	Thu,  9 Mar 2023 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp1zV7PiZ1mjCYLbNiX16Xw81PbK5WfPRc15DxtV7UM=;
	b=cgJws/2hjrTlx2GVxs7SdBCJ1T12ORu139fvVQHvKuhukoXOa5OlbXmluJE4wvZEQaAS1C
	rvf9VOndHH2yFo3hSeC1VNb9JkOHpCNVu7JCF+eNKRhKQXgwqlgKnmR5ITwjW1o6Gv/oyM
	w3hIOhkcJGBDCa7qHHa8EE3n0e+EyKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392916;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qp1zV7PiZ1mjCYLbNiX16Xw81PbK5WfPRc15DxtV7UM=;
	b=tWDnS/69Ve5jja4VE8Knf7caX3kCfyCvdZzegU8d/v+NJnUrsg7FCN5GLBsDmFbQXSgZ+B
	VUlIF0S69iYvA3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9A611391B;
	Thu,  9 Mar 2023 20:15:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CLamJ1E+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:15:13 +0000
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
Subject: [PATCH v8 10/11] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
Date: Thu,  9 Mar 2023 17:14:33 -0300
Message-Id: <20230309201434.10831-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: li9r+ldit70z

This code is only relevant when TCG is present in the build. If we try
to build with --disable-tcg we currently get:

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
`m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
`arm_v7m_get_sp_ptr'

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/gdbstub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3f799f5d05..2ecc362ac2 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -322,6 +322,7 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+#ifdef CONFIG_TCG
 typedef enum {
     M_SYSREG_MSP,
     M_SYSREG_PSP,
@@ -479,6 +480,7 @@ static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
     return cpu->dyn_m_secextreg_xml.num;
 }
 #endif
+#endif /* CONFIG_TCG */
 
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
@@ -553,6 +555,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+#ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M)) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
@@ -567,4 +570,5 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         }
 #endif
     }
+#endif
 }
-- 
2.35.3
