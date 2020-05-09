Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026587lfb;
        Sat, 9 May 2020 06:09:39 -0700 (PDT)
X-Received: by 2002:a5d:4443:: with SMTP id x3mr8252080wrr.162.1589029778733;
        Sat, 09 May 2020 06:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029778; cv=none;
        d=google.com; s=arc-20160816;
        b=QKnUuWjNU8B54DaYhjIayE/LB/1LL9GIjlel+c4/pqqqiK8LVqxSF6EMQgRlBPV2va
         VcoNc+K/aQ2+ejJXD6jcdUI8NX4np0gBlJWa7LmVN8MYc0lK/4UTHq2lOnWslKY8t2+V
         oV6QnJGaY6wRY9ee7LyRIhKuKLPltcfqUg7/wRqTuPBOG2ZW9yWmmDTOhJZGcYVKWUYe
         mM/s174LEMdQykTd2Vy/B5zRX1UGk6FT0jC/ryYabJtgtktitJ2biaGatJxr6d8xGTph
         oj0dfbMfBIzeiqe0QXR7HK6dp7udrUo4ccI+JvMS6m6X8vlcaR+7f1t/wzLNXvxzRMqB
         lQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IIEEHUjsrjg149IdCnCJKS5PWD554RDC6FHVKmSpxnE=;
        b=WOzrZIjyPUOmfFPWW4Gfc24tH6p/1//tgofnQ77oUggeu3pOUq1uVp0J+3RTvc6dbB
         MgOPw2CAtc6HT+CHbD4u+bXTTlkilqFPnQDYzVB1czB1GDIEzeI98nfhsqW8heW+MBaJ
         Z3TqpsU5EB21Ia6zC4SH6vjxDHh5Px2eIpiCpmXzAwT8pZKx8IaRaVdyJozARXonyPyc
         LwOzRwUYxWRQZOBWNgKnxZec3uz62otPopu8K+HrSCzyHuwj9vlYVesIlSLzwHITQdDi
         IBCRi2pNsplVKwg77hfnlEin78A6XAVW4Jt+H28xil5HGxNvTFm94PjbceLiJPn0madF
         u9Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nl0CXBPp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l21sor1326921wmg.21.2020.05.09.06.09.38
        (Google Transport Security);
        Sat, 09 May 2020 06:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nl0CXBPp;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IIEEHUjsrjg149IdCnCJKS5PWD554RDC6FHVKmSpxnE=;
        b=Nl0CXBPpXNxQ0v8jKUxF1Se16t8u56AbbYFOXIfPtb3ZUkfj0ZUg/dU3Thk8Lr1Q7t
         kabpZj03s+ZUNpvujY4Zy+nYe12FYxm2JYH0Sat58Kz7SFKvyQ3iMSG3y1MYqATHFUve
         XyfFNfP52J7d35j7A/kxh/ByzGKFK/Wgnz3+tTUgFcDTmF7jMtKEdpgxQ5PP4ZMZjUd+
         EH1224KiMOCijg6RGClqqyea+dKpk/2QfqW51WcpNx9UN98xYL+BD6Ueqm040CnlBCEx
         dKrqgMaikR6NN+CpCvHMTBA3/73OgPdGOl6ZD8FHNRWIL1RhGB+33Jxa+5cdqfwouDCs
         SHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IIEEHUjsrjg149IdCnCJKS5PWD554RDC6FHVKmSpxnE=;
        b=s3kuhhOkFODSKYtgOBV/2hx04M390Ik1Qd6tvSE1S/s/nJTsUX6D+ZUoNanD7NE/Ex
         52M+nJG3vluiR1QuVzaiIQQCIcdPOVN3vIAqxaK5PjoqEB09qQEjOQXv5cel8+QFlIgx
         Tpv9BcvxepDUGJDSzaM+Le7PaawKaJqYfVLxabK0b7mmORvsmoaaqaMr7X63xRphjawa
         vEIMpZjwkvFGSMntYk5wGs0P52oEPrgnTFkfAiNqlK2r/hq1EokGbyNvpTsgcBWKBPFj
         AIv3pjf96/B+jUFjuGf4vWOaL1lCbW+gLr5fq1CrF9hsgCQA2nWykhFpyAYvd7KY9DAi
         oMAQ==
X-Gm-Message-State: AGi0Pubkn/YvAT9W5pltw3lFX/+o0yMgKtVgxtbVlaiITxWKtq/4mp8v
	jivpdXUuhx5Gvy++E+BypT4=
X-Google-Smtp-Source: APiQypIQv5dktkJhLCJa+f5nseiL+K4OPMQciaBIjnNe4IrHVAf2DQjQGyL8101k14juuCgRuJvDfA==
X-Received: by 2002:a1c:2e4d:: with SMTP id u74mr22275473wmu.145.1589029778450;
        Sat, 09 May 2020 06:09:38 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/11] target/s390x: Restrict system-mode declarations
Date: Sat,  9 May 2020 15:09:07 +0200
Message-Id: <20200509130910.26335-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ZredYErXO2/0

As these declarations are restricted to !CONFIG_USER_ONLY in
helper.c, only declare them when system-mode emulation is used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index c1678dc6bc..ddc276cdf4 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -236,7 +236,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 
 /* cc_helper.c */
 const char *cc_name(enum cc_op cc_op);
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
 uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
                  uint64_t vr);
 
@@ -303,18 +302,20 @@ void s390_cpu_gdb_init(CPUState *cs);
 
 /* helper.c */
 void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
+void do_restart_interrupt(CPUS390XState *env);
+
+#ifndef CONFIG_USER_ONLY
+void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
 uint64_t get_psw_mask(CPUS390XState *env);
 void s390_cpu_recompute_watchpoints(CPUState *cs);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
-void do_restart_interrupt(CPUS390XState *env);
 void s390_handle_wait(S390CPU *cpu);
+hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 #define S390_STORE_STATUS_DEF_ADDR offsetof(LowCore, floating_pt_save_area)
 int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch);
 int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len);
-#ifndef CONFIG_USER_ONLY
 LowCore *cpu_map_lowcore(CPUS390XState *env);
 void cpu_unmap_lowcore(LowCore *lowcore);
 #endif /* CONFIG_USER_ONLY */
-- 
2.21.3
