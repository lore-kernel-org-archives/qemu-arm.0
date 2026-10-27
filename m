Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719BA606A31D
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jfn6TTjR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf7q-0004PU-UB; Tue, 27 Oct 2026 07:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7p-0004NS-TI
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:53 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7o-00030c-6Z
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:53 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-181516de561so655757c88.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099631; x=1793704431; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=btLk+S0aD8e45UQK67teiRaxfy02k4IhOuVdPTMsEiE=;
 b=jfn6TTjRSHDNUFL6XMjU6G6lAhRa5t5o4jgez1eTZRhWdMSVcm0l0fmYkCQ3J0fFoF
 fRyLv//84caN3ONjGJrgSuJgbnork6RbVlhOVqV/5kabWXvlcJ/E9FN+JQQa90xugNWs
 g31mQTFJ+uTgzRM0t8yDm4dSfQIKApizCBFUKXL0KZWKkVIOG6WE9hn0EEeDOxcaIZ/K
 9q+xWQQqj+4aTdDthQPOE0BgVz+wi5hrkQGH3RqdIDHAznRnqPSpD+kDt4GYnOQ717Jo
 5Xa8f9VlukJJfYlIIynkt/2EaICnLmryFbENAA4OjtPgX5xElOsMOy1SgCR9LXdzbqRW
 YZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099631; x=1793704431;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=btLk+S0aD8e45UQK67teiRaxfy02k4IhOuVdPTMsEiE=;
 b=tiMF329wCqzYxn+p9XdxzG4d1rwYJzjKFnbb833kpahNyMspXfHP95z16hv4kjMvUe
 VmDd4tOsh9mETQ4f6UVHo0W2wei0ByLgs2CE31SGmKHEUPFBtD6rKYgU1udcYpOupRsm
 kQ6vqCMAE/7bdGJwqr9TvOGZ9AW0hCv1EhXugCgje27h7iDqRpkRpZPCUgVkSeol8ey5
 IWOZR/dXXohG3aVCnDukNupQmpT9TRbY3DC4hly2Xg3n5pIKSNo46FzdsXPpYmNMtHpA
 IxZGhneYBd+eLex7AD5eFU8xs8ELfcpZGIT+4kYukJ2V2PiAS+Sp5N8yeoLsgpOeNTgm
 ZFSw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxbYhukd47EshvTnFxQFdgvZP1xZWleruzZQgWgYoC91Na+X2ovzk5BWR71k2bviOXSIeiTRmbcw==@nongnu.org
X-Gm-Message-State: AFq9FYJiJoxfVvW9YI7+yKDIWeyhkE9nSlV/17tbMIoj9tfovTDA6p9J
 72f3Xmw175eCY+tJ3KWoY31KEeAEu4KTgvX2+MHkagVtOB0UimytU1+g
X-Gm-Gg: AYBFou2X6h9QFbDobDXnrrvnLH9VhcPie3+rntULr0Nm3kqMgFDP6zYsTiAr1f5Z8Ff
 Cw/vvZx6tHmqJWui7fsTTfVmB4QmFv4x8ppUXXiqSnb4iI44MhglIGBk9/HYrM2z62R9v6MNiOO
 HIODJwsXUJO7jh8Fgnl8vOO3Cn0VRQlzlhBKAvwXegJmIsx7sDavc91YZ94fiUGqBs1ABNek+tM
 ba1a+IHbwVFursRDqGEhn48STtwpIPk+AbGY+4sLz8DbDfbPbt+wWMFysJQ+QNNTvkoj6e3Jn86
 3XG5LgAfIrvzdprijQJUnExg9HSjL8cxIWAjER5TJ765zAd1qeNiIZ/C04FrUhFU7h+Hxoc3O7u
 iumAkOBtEAk2J70fcyvtJUMYMcscLQE+NMSD0ObSoJnUZ103U2vKHJBSrZTRyg6KXnFZ23P3lYx
 rx3v5Mn4rbj0aWWZuNMaoKBDFfoCl6BaAecPBLhTgB+cVNz4SgCvDycDBCdSvVUfHJ+sX2iwcj3
 Hg2tDXmzCKU6KA26w0rgIccksjvUphRDZzcXYP4jLsEu85agrsskM3erJdwUYcoWksYGorm3ORU
 zKL3fe1bvUYcR7vy6RocXbUZOh8hAuLwkQ==
X-Received: by 2002:a05:7022:102:b0:196:7590:8bed with SMTP id
 a92af1059eb24-1a3c3240338mr5063470c88.2.1793099630674; 
 Tue, 27 Oct 2026 04:13:50 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 13/17] hw/loongarch/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:11 +0800
Message-ID: <20261027111216.392-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set TYPE_LOONGARCH_VIRT_MACHINE and the versioned types to
loongarch-virt when target_heterogeneous() is true, and to virt
otherwise. Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/loongarch/virt.c         | 9 ++++++---
 include/hw/loongarch/virt.h | 5 ++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 83badfbdfb5..be4e519ec50 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1543,6 +1543,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " LoongArch Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
             mc->is_default = true; \
@@ -1550,14 +1551,16 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     } \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
-        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        const TypeInfo virt_machine_info = \
         { \
-            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .name = target_heterogeneous() ? \
+                    MACHINE_VER_TYPE_NAME("loongarch-virt", __VA_ARGS__) : \
+                    MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
             .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
             .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
         }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
-        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+        type_register_static(&virt_machine_info); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..92b09e7ac8f 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -9,6 +9,7 @@
 #define HW_LOONGARCH_H
 
 #include "hw/core/boards.h"
+#include "qemu/target-info.h"
 #include "qemu/queue.h"
 #include "hw/block/flash.h"
 #include "hw/loongarch/boot.h"
@@ -130,7 +131,9 @@ struct LoongArchVirtMachineState {
     bool highmem_mmio;
 };
 
-#define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
+#define TYPE_LOONGARCH_VIRT_MACHINE \
+    (target_heterogeneous() ? MACHINE_TYPE_NAME("loongarch-virt") : \
+                              MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
 void virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
-- 
2.52.0.windows.1


