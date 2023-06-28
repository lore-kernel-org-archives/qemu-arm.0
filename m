Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp2075928ejx;
        Wed, 28 Jun 2023 09:48:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75S3mLNGNXhF2fRIOiJTjeUt+UrZammHsC8ek18nX8hw2Vqp1U/KoytWC6e2tkJSb7wEK0
X-Received: by 2002:a05:6214:529c:b0:616:5f27:b96a with SMTP id kj28-20020a056214529c00b006165f27b96amr17669067qvb.27.1687970931818;
        Wed, 28 Jun 2023 09:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687970931; cv=none;
        d=google.com; s=arc-20160816;
        b=CSs/4XRGMEW1Q+rLBLq/1h3N6rMlDBNC3hADj1KN1kZgz6LG32brekmG2tATOUXMj+
         i0ViOaSb+yt9ZyT95B021AATOtDDyBVjDV/uh4sZENQH7YUPSJJK2rnoDHSaFDKsj7Tb
         pH4a5iK4nf/5VGd9UVxBYfZSbH0RZgPZIOM1hTpQOLLgqhOu//qFscuJwRQAbcwWAmfK
         IkTxke0cNc5Ci5iD5EtZDfW3zk4xS0GZWx0DxhU8Syrg0XJV+MSPfgpVRgvxAQvfd98o
         RGTT/ejJSgioJVMOlkvxMepfN8eboZvwhia+8r0QMlgB5A3tqD2/EzP8SIBZiEvEsgN9
         qxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=GKtSAjY/gybSB8YQ3UvrdFZTDzcvViwaB6S+q8mdJM4=;
        fh=43DvHf0CYHyHySlgiz79WhwfEp04lL2eCOCP/N0rpss=;
        b=oSpdxFM0xfV/siAgwSZdvqSp+rvMpWJWX4XR2kvy2IWtKX5NGldXknqkCcvRVAycO3
         v4qNCVk1+d9lqAEY6n0A6Xvy42pHjkjOEMeEWF1LkIuSUtgYeP3jVMNHzPvlQ3vjPe3b
         8xI3KUIJCLntkU4WFmT4hr1Z3GPSvC/ADQ7FA+9Jhn2/J63jbesFm+G3//WBGzkW0cPZ
         cgXxbnFRXsDniwlOzzdLLRnwCuSpVhORVZYozH7QdsvtaQhL5jD6fnIHdZ0J9d8RD5xj
         bx0asEWbJUdbXZrQEQ2vx+wEXuV8EuO7jMUba7sHkTqTRg+CdPCXu1VhaNCkeMfa8CMm
         LwRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Qj5Am9D4;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05620a204900b007671891a139si1726647qka.477.2023.06.28.09.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 09:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Qj5Am9D4;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEYLH-0000IR-LC; Wed, 28 Jun 2023 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1qEYLG-0000Gq-7C; Wed, 28 Jun 2023 12:48:30 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1qEYLE-0006YF-EL; Wed, 28 Jun 2023 12:48:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4EC3A2187A;
 Wed, 28 Jun 2023 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687970905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GKtSAjY/gybSB8YQ3UvrdFZTDzcvViwaB6S+q8mdJM4=;
 b=Qj5Am9D4o0JzWr9PCO/hJFW+Q7e3jTe1icbxvG5/zj4Q//fjLbpRngEyo8ZgXnY8F0Z4T9
 9OPcpelDUOBdU3/5kYMAysBJg2m7QLNy9ogn8wxfAw215wF1i4081/MQ7i4I4AJgSBOR8x
 H21wMRT5hJv28/2qM2qpLKOjjAEH65Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687970905;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GKtSAjY/gybSB8YQ3UvrdFZTDzcvViwaB6S+q8mdJM4=;
 b=JCnH6XOQW2i4rzp8TpNJ1Fl/AiAPmYgx/6nB+tmf9VDWDcI5wEqj+DAPoBXIOy/3YAtxQG
 XSTuWR6Uo3e6BDBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0F07138EF;
 Wed, 28 Jun 2023 16:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6d6vIldknGQjZAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 28 Jun 2023 16:48:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
Date: Wed, 28 Jun 2023 13:48:21 -0300
Message-Id: <20230628164821.16771-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jIGz7GDxxxRI

This code is only relevant when TCG is present in the build. Building
with --disable-tcg --enable-xen on an x86 host we get:

$ ../configure --target-list=x86_64-softmmu,aarch64-softmmu --disable-tcg --enable-xen
$ make -j$(nproc)
...
libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sysreg_ptr':
 ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_ptr'
 ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_ptr'

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_gdb_get_m_systemreg':
../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_control'

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This is a respin of:
https://lore.kernel.org/r/20230313151058.19645-5-farosas@suse.de
---
 target/arm/gdbstub.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 03b17c814f..f421c5d041 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -324,6 +324,7 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
     return cpu->dyn_sysreg_xml.num;
 }
 
+#ifdef CONFIG_TCG
 typedef enum {
     M_SYSREG_MSP,
     M_SYSREG_PSP,
@@ -481,6 +482,7 @@ static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
     return cpu->dyn_m_secextreg_xml.num;
 }
 #endif
+#endif /* CONFIG_TCG */
 
 const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 {
@@ -561,6 +563,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
+#ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
@@ -575,4 +578,5 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
         }
 #endif
     }
+#endif /* CONFIG_TCG */
 }
-- 
2.35.3

