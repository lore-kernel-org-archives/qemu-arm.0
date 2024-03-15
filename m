Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990202eju;
        Fri, 15 Mar 2024 06:11:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoSt/9K1pGlx80YrMhWGoPgZRDcjtOsXQq+EykpqtHt7bySbBOMJ4CeKV6Qk67Bi3bo5cowCDfIPqs0xOnlJl3/is5vb2I
X-Received: by 2002:a17:906:4a10:b0:a46:8ca9:eb2e with SMTP id w16-20020a1709064a1000b00a468ca9eb2emr932757eju.38.1710508269583;
        Fri, 15 Mar 2024 06:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508269; cv=none;
        d=google.com; s=arc-20160816;
        b=jvIRuefIHZ+KWEHTmVtGNxhW/41qcmF2rB6lEkwjj81aL1oVu2aiZ868O6Dfg22diW
         imeey0f5gMTXsGCs01uEqcfoF8QEHmWHI7FeO3o5N+nyFjLDluzo3fPWEkoygnBPXTsV
         m5C5wjc0+0X9LfCZ+UisXOAG4XKD4wHW05VHSG7g02GDfAOtIhN/phZF5v7H3buOS7b3
         GTacC+b7UJveSlORM/EGjKXrxxInJmzcNKXAbLhr/WQmM0ag9AnTlfhT8WLnDVDtuplJ
         VlFmlfApK3XMFrE3jNmXOoTwDHYg89xmFtxg3JB43P+5myn9OImck0950rd8JvwhKNVq
         ncig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oFQX8aoXPy4f67f4Z4hL1RP4Zt/8Mcsow7bhGPOckjM=;
        fh=YI2CTO0hmpbsYGzGcljF012zMh/l/hxAOqxXpG3duNQ=;
        b=cMKa3MEbIZRAluk0i3Z7tLHoRy8h7o7akVRtlZgJdQ/RMo7+sHjKHBTnREvxv7NIMT
         3e3+Dp7VdO9x19dBfP375/KjX44jMuEbv4jhlmGvqbAm3FMfJNqmokUT3YD6y6yFG7rR
         klexTm3Oqg3oU91kkZYbLa5HJL+nMaRA5FR4wYCnosjuqxrEFdgj6p37P0J1bsUYnzWO
         r3hM0GmRDKgcFvp1u0c9NxwndIrCpM1IdFqZCDvFE93oGma3fLLDY3bxWRXL1mk3+KJp
         yk4i7Gj9L3Z3aPE2oeWOvcvrD0N9Yz7iP1VUq2RXXNw+vnnStt+bb8l2ESR8w81B/3KL
         Pv2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fkk5mb+8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pw21-20020a17090720b500b00a46635ca209sor1271694ejb.0.2024.03.15.06.11.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fkk5mb+8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508269; x=1711113069; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFQX8aoXPy4f67f4Z4hL1RP4Zt/8Mcsow7bhGPOckjM=;
        b=Fkk5mb+8mYNTws8Et3b0wkcoGMZNrU2zwaZXvNib/VDlp91mHSEYFrN2g1PIzXDvJe
         5MPXZzu+UzMfxrFX7MVIKgp0q03B7szqHK7A1TLt1T1qz0B061ATJKWvirVSvyhu2bmH
         y4tj9bZi3q9RLMZEKfJdfFmAaywrfrWkADvAC50hlvSnnFwRk+gm8tpFXIGKrnTiumHx
         y1xxLQdqpoMGbbDUrJ+kjf7TYtaM+8dkEe6pqMlU5wf47TLDVCw7d4ukN2UipdtSMiLl
         bjBqgYrc0fMMVX7SpcJeMTFJl8wj1Jmggn28Q/9Ga12aJg91qAW8LagraDAEZbw5dYht
         e7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508269; x=1711113069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFQX8aoXPy4f67f4Z4hL1RP4Zt/8Mcsow7bhGPOckjM=;
        b=exFt3nh0BUqFVqYxomjIL1VzjMtJ95ToOt+tmOC02lFlb2xlRAdOJecmAO4hO/g5KA
         xBUokiVeC5szy9E1PLhsLaC5O/4UtNU3qx1JD/G8Qc6WYcEsHlPC1EHBpipixJUeUseC
         EsmUneXT8RMKkC/dLLJm9I9PyN7eg2ImruNXsWIApjdbF14wOrx+qOIexRqxQVJTJA8e
         16F+SuVcE805GLg3Peyc1lYoISyc5US0je2cfAjPTlI2fefMFBTglJnnHb7G+XeZRDjX
         FDNIJHbl7Dt2tciqAr7VWFxqFH7CsYi5gOodT90GJFHyn4FhqJUO6o4iYRWOCT4g3w2T
         U85g==
X-Forwarded-Encrypted: i=1; AJvYcCWLKxRHc6D8OlEpgs9ZQXnXglnDl9MJLl9anV8Z0f3pincVPVNbAUMwQzgPiIFqnFhy/omE3ScJ3eXieATzeRAk27oF2hwX
X-Gm-Message-State: AOJu0YxMvwoKmxo2BaNvkCVWqvlicCjzM4cHWzfR8+BW97n4kDC92I2E
	/Me1BBBnixrWcCbt2yhwrWbtgf8EmRll6SCwxkqsZwOpRDus5MMbEIOObL1R1fjbMA==
X-Google-Smtp-Source: AGHT+IF+MuEc059bBpNi8Z/N4PGDT98KYLptzGgGl6UNuatWgPqddtvCqzOiCyAHdP8HEfeppGnxnA==
X-Received: by 2002:a17:906:4a10:b0:a46:8ca9:eb2e with SMTP id w16-20020a1709064a1000b00a468ca9eb2emr932738eju.38.1710508269218;
        Fri, 15 Mar 2024 06:11:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id a23-20020a1709066d5700b00a467a129104sm1183953ejt.173.2024.03.15.06.11.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH-for-9.1 17/21] target/riscv: Use QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:05 +0100
Message-ID: <20240315130910.15750-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4qguvkHTosG6

Expose riscv_cpu_add_definition() and use it as add_definition()
handler, then use the QMP generic_query_cpu_definitions() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h            |  2 ++
 target/riscv/cpu.c            |  1 +
 target/riscv/riscv-qmp-cmds.c | 11 +++--------
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3b1a02b944..15fc287680 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -824,4 +824,6 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 uint8_t satp_mode_max_from_map(uint32_t map);
 const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
 
+void riscv_cpu_add_definition(gpointer data, gpointer user_data);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c160b9216b..2da9364335 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2341,6 +2341,7 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .add_definition = riscv_cpu_add_definition,
     .get_phys_page_debug = riscv_cpu_get_phys_page_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index d363dc318d..45adc90d3b 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -26,6 +26,7 @@
 
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/commands-target-compat.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
@@ -36,7 +37,7 @@
 #include "cpu-qom.h"
 #include "cpu.h"
 
-static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
+void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     CpuDefinitionInfoList **cpu_list = user_data;
@@ -55,13 +56,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list = object_class_get_list(TYPE_RISCV_CPU, false);
-
-    g_slist_foreach(list, riscv_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
 
 static void riscv_check_if_cpu_available(RISCVCPU *cpu, Error **errp)
-- 
2.41.0
