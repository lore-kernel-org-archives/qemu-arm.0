Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp595810ejb;
        Sat, 2 Sep 2023 21:31:25 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:1bf:193a:70b6 with SMTP id i7-20020a17090332c700b001bf193a70b6mr9107537plr.5.1693715485443;
        Sat, 02 Sep 2023 21:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693715485; cv=none;
        d=google.com; s=arc-20160816;
        b=NdsJWY/KivCBr3FXKl6UHGlhIBucAGxc1qHdK8zqOp5vxIDZ03eRcdQVGaeQ6bSNzF
         l9h9T2h+1EPoJLHobRF/giAX5aj9GMsdwYpr59Hrt3UaL/C3/5g2YwP/uWfqdmhjoIzE
         aQGjmhezpB2G/ZhCbWaKEx1496hHaj7U+MlFcOSCgAddWMc0jXteOkCi69dGYHamStdi
         IUceefKpj2UMe8sunbAj8KkV+7xe7BootMx++7iCOZPPED2o5gcm6TlMkR0CTxA9jZoh
         zveXeSnBC6mqw2eU+tj3L98+BM01R0vmFU6AHK1ZJGraglfNzliqxR4COWgNY/cbE3kF
         3bjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=f1OoGlAFSrsHe5yxYX+ZMvZlZQ825ETdOqmrQ0CIV6k=;
        fh=YpTETbZtebhjC8z2x4gkua4FkcYm/rAkTkMi+6D+Yvk=;
        b=C5bmvDn2oKnD3kBR7VXval3so4X+zhAa/EV7HYjO2FcwB8ns/3M42iydkURQ5j3e3o
         tgIAwj+pIdEvvO/gpnIyuWo6pT65OEp0dH1x7bDxOmnseLBNFNRK8roG24/xiGoSUt5V
         +Uf+nvgmdnAepgOXcUh97/Kwwq/jpm26P5F8YnZFXGxiTpC104E+Pz3pBeynZsik64xT
         86Jr9vUSPbOd6OB+kAql1LCWEq2vSTJpeVOC74FY7g83aPbUFVjqvoz43wY1yHvQm7XT
         qDm+d6bhmr1Bu0RI96yrapSlrKSharw3ugC8tUCAGcMvOq5QWFDoJVKNKGX8umBF90Zv
         8H7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=aLU03jxE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o18-20020a170902e01200b001bf13209741sor3309753plo.2.2023.09.02.21.31.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 02 Sep 2023 21:31:25 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=aLU03jxE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693715485; x=1694320285; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1OoGlAFSrsHe5yxYX+ZMvZlZQ825ETdOqmrQ0CIV6k=;
        b=aLU03jxE13JfDmFO4KaLD0tABA4LFtSsM7lMuJE/BXHyP7da+wrGCQEsUmLMhkfU+D
         +aK1z8xyKXRgwyGKeTZ2TzRp6i+ZeWLYzvleba6IQYe6M3dQLx6ZYCp0aSMGpM6BlMmA
         H2C10TN3tBju/cgQgkPH857dmcKIcRvTEEzfgyu1G5zKXl/3WBObSPQ0cuH1rpcSh6e8
         Qb1mj5/LvJnbUBjcOvna01qTTb9HlqUel4Gm+mKigmcfg84icZVQqDIpz/dPipwQ19g4
         lM8eLruG1Q9rRQJJGBq2ptC8F5PHcJat2009BaiXoU6WWFPUBar7Rxcq8hsWckdvll6K
         2U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693715485; x=1694320285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1OoGlAFSrsHe5yxYX+ZMvZlZQ825ETdOqmrQ0CIV6k=;
        b=KrAJ5octHLwb5oxDt0Gczr8tsRNEI1iL3yTqCmGR/CLLveHi0ShdUL56fc6JuIaE0N
         cWw2wOxhPQY9PwmOTXAnFs+Wi2qBV+WVNWco3oXhWPesdCIeDyvMJWmr3qn7tgwP0WF3
         y8e2LXdE6itIr6uT8ZhnvPuo3MXWGDGqs4saj7m7VOVLbkCcVlYXKlQNmSgIdZDBHrS6
         eRXq1RovhB4qytCSD8LaqHCq/BXXh9TdhsmlRMluEkiiWRBuhgmidkpHoaWksJHA3gY1
         mTL+Vw0V2KmuYIo0D+rc5ReFzbKs9GhYQ/jwYQlig/gHuk+NMR7Chl/66NmFfH5wn16V
         AUng==
X-Gm-Message-State: AOJu0YwxP+Wx1lNoSq2IdBdotkLCzYRR92te38AefiWOH1XmTTMCLaiD
	nab3KCg3aW7Rh0gCks9UwcFAGrtyFw8OJJI6YNg=
X-Google-Smtp-Source: AGHT+IGdm0kRAJURqufTgnNRidPox8bHlYkKt/8voSC1xGfWCJaCI3aeIWpP1XeXTFJk5XvdAstKBQ==
X-Received: by 2002:a17:902:d2c5:b0:1c2:193e:1126 with SMTP id n5-20020a170902d2c500b001c2193e1126mr8068868plc.28.1693715484818;
        Sat, 02 Sep 2023 21:31:24 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001bb9f104328sm5295792plb.146.2023.09.02.21.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 21:31:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 3/8] target/arm: Move the reference to arm-core.xml
Date: Sun,  3 Sep 2023 13:30:13 +0900
Message-ID: <20230903043030.20708-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903043030.20708-1-akihiko.odaki@daynix.com>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LIBYbLwEzfRs

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..d71a162070 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2354,7 +2354,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2376,8 +2375,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.42.0
