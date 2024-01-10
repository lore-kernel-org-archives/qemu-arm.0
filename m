Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258967ejs;
        Wed, 10 Jan 2024 11:54:43 -0800 (PST)
X-Received: by 2002:a05:600c:204c:b0:40c:708b:cf41 with SMTP id p12-20020a05600c204c00b0040c708bcf41mr838121wmg.7.1704916483766;
        Wed, 10 Jan 2024 11:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916483; cv=none;
        d=google.com; s=arc-20160816;
        b=mRpPhe24HiKdxWMNhUovvFLRsosMdGma5D3Egz4oEYwxZgk7ZkT2BW1Crq8JeDED7i
         fI2cCxSHEHdgIG7eUyR1rNSWxImQvUA+dUcZ5X2igBNRq8WiX1LctqZJ4WAUU1HjmRmh
         60EKaX1rGihsmu9yQnhMB1/ciQ/OsIg87eVHD7esabQweMqN+xf21SG6kTR/vihF8L97
         cQ6tgcjL1WbhnQ6HwRT2ZrWNp8iF1WCw+t6iUrgslfFUllc4fGrMRs7D+jPpgc1jSmJ0
         UPf1Te6DzFMk8BAqEyFbUAiQ1+Y57DpDL4yCgGhL2cOf3Tjv1mdcmvHQmtyp+9/UBfz2
         xx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=IVwezhGwmqZy3U5qB1ZczvHaRlq64KHb0jZ+cLN6sKxN3wxIwQWLeza2Ca63SL+La1
         IPGu18FGAU5Pud3NJj1nafeeTlUtGWl/0lzZJ8fdQZTTCOZY9OfOGvZjaUNYZnp3NndF
         lg3zDPdDXEHVYUimecATatKVMa1aC6yveLb/6LgYF86ZO+McVRg2I4VQp2qgM/aenuCx
         esiQhji5mSk2wE0mhUpAh9DXnRBHzXIgRycYh1XPoaCTKu5tj3gr5JYLgOE/WzFEQHpZ
         qdEECsd46lsETJKdkpVDkkVhPx6MoL5iUDAPpH0VMdI7DIlEWVtm/xu8tY+XySXLHxcA
         XXTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXRje6us;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n21-20020a7bc5d5000000b0040d86ea6104sor366105wmk.6.2024.01.10.11.54.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXRje6us;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916483; x=1705521283; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        b=RXRje6usvUm1N3SVjDEKlHBJBykflogH7VsaivsG5gg305ZgQ7ZDpfGxAWp7PqyZVF
         Aq1Ft7YiRgG7ZWlNP6LTAw6BELzpFq4gOH7iRSDSZZAPcH7sUUXoFdtYuRinX3VuVeq2
         Rlrd0JGGw71RXbbqRwjp8FlHWFftL4bwfzCHypkCTObRjCZHTmehnF2VpazqJLlHJgea
         ewupvp+nyvaA2R/9BZ7wmLQ4SKjuBeozxBaIwoNJxbtKMxwLH50qSZbbAtF7RLvkLUmt
         pJrJfEGenlsX7fcFNUrcVRDhjwcl+0p4gWoNZOHkvpua2wGdyEO25wUGrZDiHQ8+dbGs
         kO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916483; x=1705521283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKXURkFhsCy0V0ubg/nJYR4pTGn8xQxbtylatTgX1X4=;
        b=uTdDdQRzzSEfXPZWT4KQxB7vcWWHfqMGW8yBLtOWVdvHZZ4NtMHGatb/rpOxcGRsPM
         l5FiPGBO7CkNi/0HWjC1/q8CR6ILL/B/ODhqLHNUf3NkcsY6R6UPzj2gC7EKIQkeQD0G
         ML6ljVVqUzfD142HDOlHPfOZJHxEajwpxFAiUUgwO8gVOOilIwmazyFh5MrTXG1iTUrs
         WhE6e+aDD9Ey0gn4GEtB0jOV1yNEOttDucl5LFcChZrl9JWLxAE+n4f9tzhar4zyIJyg
         BXplK/08TaAzxffclBYG3AjQsTmATvN6KfJ6FAacR/GqThBjoqIXMhT/RCbTeWnUK0c1
         oKWg==
X-Gm-Message-State: AOJu0YyyxZ3dbqh97KvZRd9MHeloivr7/9TB+tsyCCI4ARsoVAJQ/wcq
	N1fbc6dbukuzbGJQ+/2yuNQ0b5lEnmKPn0wq
X-Google-Smtp-Source: AGHT+IFow5aH/cxXlfW34HD3g8cDhzSgk52saCbfY8RrKlXKt9CSLCukyjZ6ZAJolaf+X5S5w2rFiA==
X-Received: by 2002:a05:600c:1908:b0:40e:44b5:511e with SMTP id j8-20020a05600c190800b0040e44b5511emr830051wmq.99.1704916483457;
        Wed, 10 Jan 2024 11:54:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c4f5600b0040e4561e231sm3234605wmq.17.2024.01.10.11.54.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/14] hw/arm: Prefer arm_feature(CBAR*) over object_property_find(reset-cbar)
Date: Wed, 10 Jan 2024 20:53:24 +0100
Message-ID: <20240110195329.3995-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CPcqMvfL50hB

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
