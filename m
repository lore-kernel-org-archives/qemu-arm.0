Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553334ejs;
        Tue, 9 Jan 2024 10:10:45 -0800 (PST)
X-Received: by 2002:a05:600c:3b25:b0:40d:7691:d056 with SMTP id m37-20020a05600c3b2500b0040d7691d056mr3042086wms.38.1704823845650;
        Tue, 09 Jan 2024 10:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823845; cv=none;
        d=google.com; s=arc-20160816;
        b=KFkEoEE7q1ygV8y4D+nLwg4TuYmce+TokyplUEnHzQ+xIRgOT+Q82a7RxGZLPk9Uq2
         T5rsNu4MF9zFhVFa4aIKrpgXEc9NnN6QwIbQz8MsHmup99EMc+5dtmF4D6hJt6bu1T3A
         S3VzVrzZPgf3vbJP3Sw3Tu20eCcTyeje7E8zpunktyFSEAulN4WgYw10l8PFBYljHjsu
         tkQndZDrQ/0rv0Wa1yTDvdrIh72T1xBeP3IZA1QHyaFMIB2a3dFUYEL3vkVBprmQyQor
         7BbzdMqLiSoWFyNQLLl4DlnAzzGS11hvEKERtA57GvXtp6BXj4CuoggwwY5tynfMz1wZ
         qCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=TJQnxedDHy9odarTy5VKT3pqhxtkrpAbrrNKA+v6w/AhFKA6OA2N9P17MPUIdp6OIp
         hGDTUEfxaiAc9EjtlwagnyozSL5kZ3AWYRCy3XCCki40NKPQIieGPMTEkB34/v4THMHA
         faRCPPzLyzzKj2/Ivo9qHWP2wCA2Pvy+vbQl3hkP97nK2Te8aS0eHluJMasYPwaxKyp5
         CmM8uXA/QuMIkMHhhzFJU44JxIMuB5k6pJbST6NygqOq6ruKkOb3uqPQTqPuOv3bFhPA
         UZoSvkyQv2DUb7PSpFFwkcXoMy6eLslb8keueqyzaQ2lGJvP0+IOqtuoYCO7vyfdiKst
         DxhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WbtbWJJo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x14-20020a05600c21ce00b0040e49212c39sor1158176wmj.11.2024.01.09.10.10.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WbtbWJJo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823844; x=1705428644; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        b=WbtbWJJov3KA3WYOTo0hhP95eI5d3WkuPUSllhD+MD6YFH9ozQL5w3UCxKI1Fo0sjX
         PpnGSk2kmFHASBNWS+ugAs2GvFeRX7t2zdY6kxjfhBR0LuaZipN/bD6ppIsPWd+J8VHT
         6EdhE351xiHwVI5LyJxVkb4+r29DxBWc4JbQNtQfmD0b22XytklTuxrR7HVKXd1tQTnS
         0+XQO9aIZVn22YGbzyzdrvAXYYnVq3zSeY8B8w5DmtvUyo4RPy92fqRvFe1db/TqobL/
         sWXu+uTJu6SI5nAD1UOugX4fx8EoqZKWvz9dkLcCuHxUJQIB23trvuBrOTlL7WAqZQSp
         C/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823844; x=1705428644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        b=YBfFBxlQ4VrxKFfBngHl+AHl5PRC3izMoJr+z77B7RD2jpPUmah9GpgqWb3exiFw0O
         vXKD3dsDUE8qyJ5CC6y7Qbt/0O5DYiVCgjOXK10cvkil7gZW85xFWH8epbkpRlq00P7b
         TblRZJv9hXdY8OYp/c1ylTyPzuOK9GSnpYTe5B+aZ4H4JkXjsmD01fhibhNA3parPtWW
         PkYJFv7RZXD6cLCvm3LxvzhBMTRFoJ41OwHBGGobqoH6SAOBf//+G6vn8cLjiJm1hJRq
         6V34TeXCPMqxItDzZEulPTCvjqQbwMT4Wpg2FH93O75KmNQXI1lMvNMFPm4ffMusyM1n
         Lxmg==
X-Gm-Message-State: AOJu0YzQ60GXk2OLG23Bh6Z51J4oD20sDqAn90biBLZlZTaBAzJsKfYy
	ECqx7nfs2dIdKLPFU89gpzCpSlyiugQKfGse
X-Google-Smtp-Source: AGHT+IHjV0TvmBLA9WFnSsyWWHMR3APuO4MZjZIF0jPXU/Ws3vRpGE54iQvFItP+9NQO3t8cNQKgAQ==
X-Received: by 2002:a05:600c:154d:b0:40e:3dad:efe8 with SMTP id f13-20020a05600c154d00b0040e3dadefe8mr3265076wmg.87.1704823844642;
        Tue, 09 Jan 2024 10:10:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d59ab000000b00336ebf93416sm3047825wrr.17.2024.01.09.10.10.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/14] hw/arm: Prefer arm_feature(CBAR*) over object_property_find(reset-cbar)
Date: Tue,  9 Jan 2024 19:09:26 +0100
Message-ID: <20240109180930.90793-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LdT8jVcIFxdf

The "reset-cbar" property is added to ARMCPU when the
ARM_FEATURE_CBAR[_RO] features are available. Rather than
checking whether the QOM property is present, directly
check the features.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/highbank.c | 3 ++-
 hw/arm/sbsa-ref.c | 3 ++-
 hw/arm/vexpress.c | 3 ++-
 hw/arm/virt.c     | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c21e18d08f..b06a727c06 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -211,7 +211,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
+            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
                                     &error_abort);
         }
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 477dca0637..c073c462c7 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -770,7 +770,8 @@ static void sbsa_ref_init(MachineState *machine)
         numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
                           &error_fatal);
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_CBAR) ||
+            arm_feature(cpu_env(cs), ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     sbsa_ref_memmap[SBSA_CPUPERIPHS].base,
                                     &error_abort);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 753a645c05..ea3c76f3e1 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -229,7 +229,8 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
             }
         }
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
+            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar", periphbase,
                                     &error_abort);
         }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 35eb01a3dc..7e7350fec2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2168,7 +2168,8 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_CBAR) ||
+            arm_feature(cpu_env(cs), ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
                                     &error_abort);
-- 
2.41.0
