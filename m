Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990298eju;
        Fri, 15 Mar 2024 06:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOvCZ9Kct6bAVD4PFhUFwp/+4JdDTrQJ2rorh9C1CaoTaKJsdmjOmx4d1+njbn+waiNgSI+Qmir2BHmgbJVDlN+PLB4cxu
X-Received: by 2002:a17:907:728b:b0:a46:94c7:49a5 with SMTP id dt11-20020a170907728b00b00a4694c749a5mr713278ejc.40.1710508276158;
        Fri, 15 Mar 2024 06:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508276; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+Nql14pbCg97Dvx5npznPvsWTZwQQ9t3PXR4sOo8lS86vGcoR+/AHkc4QTGAr2vFd
         3B5EwNts1nxsKR5vnTI5ZdGIptZo54Q6YHbiU4E8COJra3d+joEBegflAztIfcEMm8BP
         CbM3gp3Kkul2arI5lT4LiDK/OGRlYkiKK7BpZsjbTHuYK20Sm6ID/VmTDXa2BqaERjaK
         q0a6VH4lFaoNbE9SZcdUzRMwg5z9nG0XWd45qRfAG6uEJZpXyVyuqWDPjz3IluuqQdlv
         U3zFtMYWuZP7gC2MTflzZ4FG2mAtu3rufxwkTZVcaaI1lcDdqnj/ceJem0Qj9QwykJfg
         6B0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+0JRGXmaH9yCo1gEGbOzPrdlVZvoU4tW4IJan5xxXVU=;
        fh=KQHuqoplcFz26i1YU7UkVbvJnWv3i+XSPpG0i93J/ck=;
        b=d6SQxeJE5qLSpseUqm/54YfYRFGW6IWAXi5eVwqQFCOYJxJo5kd+TuGKQXA+oVU8DG
         mmKUvzCXv5VhnFuhyPS35VKuETrg+266pPItGZfzJh9AUd1idOv30x7c4HBybQA8OWK8
         udIscnuVwyQJcdycYcje7V+uvEP25oThqtQbl5SzizWamQYJwn42ANWop3THz3wAX7j2
         xOXCdJuqOtn9I67FZOiFG76JvG9mQpCGoiSDljk6mVsbYLNY/oY00ixYNWxyob+tpq1m
         Cvi7wz9sicX5kL05iQsCYFTdd49StGbTb3evx/y3MVC7rQZVfC7IkYt1b4dH0Yuuz4Or
         hJdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6NTmqxR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gz7-20020a170906f2c700b00a469604c46bsor232891ejb.19.2024.03.15.06.11.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6NTmqxR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508276; x=1711113076; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0JRGXmaH9yCo1gEGbOzPrdlVZvoU4tW4IJan5xxXVU=;
        b=c6NTmqxRuN/Spt9XulLuze6abOydTb4K6MV9ChiT9UaxpOL6kxQGUXOqNrlLCfxVEY
         Sd/cMutfDTd8t3gNzCsicZw9gV7UvWOlnOEazIkGx1WmT5Hhjs5VodQMWFowzmd3SKaN
         BNV7iK+li3fV1ImQG8yyRNTwHGSEtST1AiBZ4b28zhNE/E3GO+DJWd2wNnYrMYXNzQiK
         u5qeH7KgZ4DRMhW+9ZstXBXzzOlYz1MdbhgtjmjNqNJaVLyph56TZ/uCccJxJi1BTuDw
         Pnm/JSU1QlzZUlt4hNS2elnCuBTYeMjXt92DbuuETL2MlJ9swnMCbN70qamsurbPaHNa
         0xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508276; x=1711113076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0JRGXmaH9yCo1gEGbOzPrdlVZvoU4tW4IJan5xxXVU=;
        b=cQOGsI++L9znHC+Q9SccNdp4nj78SHO1zvV+NQOHecpsTVRzUp0IMqQtef3aZiBJEJ
         CG5KCTJYQKAza6xfp1jkvDjnHUCypLr677C5vqBrnRQ+EEpjga5z6el7z24q/b2gKeX3
         YKiQ50U/dq1qD3xmH0MqFqxT8GKvl1JZ2yUkH96O3/7MR9pXy9+v5LFZEYTW7wb/ke5Z
         2itxCdc+OzRjXwqyX98+eLoivJpbsAftRPUhiQPA/mIWB2eFh0exTW3mXhOoe6MtyoIf
         RBC5bnRPE/8DPwIkiIrWO2nGznXTTFE6ouHENZy9gT1eFPwF0ABPs4vxJVj1wBoRQo1z
         n2qg==
X-Forwarded-Encrypted: i=1; AJvYcCXV1GSOIw4x/GxcDMRWvld6Gpe5vo6X9hfDaJ4Xa/A8tebuJqvc7DoKQdx+zoet1Ets0GiaeYOr/x4Y/fEsg0WlGC4407bE
X-Gm-Message-State: AOJu0Yx6FHbXkEr6XwqtjFE89PHCuRQHUxvOFCy1ioApfwrjRP9GliNe
	hexEh57UhxN+f8AfoDTaJo4GJivTtn5ojGPCyZo9MOzq0DNbw46WyrqzqAEzqanbOorqWT7ePmM
	Mg+E=
X-Google-Smtp-Source: AGHT+IH8DC/lPhj5k3DkFaXoEv+D5iiSC1Us/4T3OryunIMlcb3vrVAMN7YjcE7wkczxqJzYpIahqA==
X-Received: by 2002:a17:906:29d6:b0:a46:bb:c4e3 with SMTP id y22-20020a17090629d600b00a4600bbc4e3mr2733759eje.32.1710508275761;
        Fri, 15 Mar 2024 06:11:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id dt22-20020a170906b79600b00a4669f6c2e2sm1672024ejb.44.2024.03.15.06.11.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:15 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 18/21] target/i386: Use QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:06 +0100
Message-ID: <20240315130910.15750-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o43IaX4Wm2a5

Register x86_cpu_definition_entry() and x86_cpu_list_compare()
as handler so we can use the QMP generic_query_cpu_definitions()
method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 07f64c1ea5..e5dbd307d8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -38,6 +38,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/commands-target-compat.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
@@ -5667,11 +5668,7 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
 
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list = get_sorted_cpu_model_list();
-    g_slist_foreach(list, x86_cpu_definition_entry, &cpu_list);
-    g_slist_free(list);
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
 
 #endif /* !CONFIG_USER_ONLY */
@@ -7937,6 +7934,8 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .add_definition = x86_cpu_definition_entry,
+    .cpu_list_compare = x86_cpu_list_compare,
     .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
-- 
2.41.0
