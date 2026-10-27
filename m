Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DB606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDEOOsGp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf74-00031W-Ng; Tue, 27 Oct 2026 07:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf71-0002zF-3d
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:03 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6y-0002sD-9B
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:02 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-14394530ec6so4801961c88.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099579; x=1793704379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/3SGS8X+t8HUgxydHksGLLUEFv78DWEwDvhaYo9qUS4=;
 b=gDEOOsGpmVJsTRhgYEswi35Cwzvf1UeX/VpjzTprLzYTwo1zUm1xhkLx1rm2Rp2gMq
 G9TcUV1CxP1F3ROc9So83rm16d1NF7qGQ8QltCmYlFQksm1fzIkYeZyYMlHpvAlmF0jK
 f2n7dAOstNFKUv2u5WQjWuQejoKZKbW6pVbdrImnOfVlLJma53aX2LKhExQrLIGe/aNb
 /L7cHMEnQBKqN+9WOmCXLZxUKJBj75L/yqi8FENS4aMtPaN/VbNILlVLb0wTy6v/rHvs
 AifbNeRTw5kvZE0Wc//Pwm0zBKu+9pRe31PRL7AyDTJIAAQNnmzZHBI4i6/kbRuLcD8m
 8+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099579; x=1793704379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/3SGS8X+t8HUgxydHksGLLUEFv78DWEwDvhaYo9qUS4=;
 b=Ofvz9wAnfXCpdfjv4w7lmLKpAQP9wL17wbGAMKG5BoE4vtHcK4nZ8ZJPu1dU2uHqhG
 Dg0N7rknoqk+gLEsP9VgPf1AKB4KZbx3WwcpnU1E7/LHWtl6vdnYM+l24fiZG5l3q5FZ
 EfDIiY294n+ec/BS9ozMqAq8F5f9BY44wH19VShLggSilDNaT1rw7daR+iN+RzFqvBUW
 qwXh5MMYMebsW7PhAfyki0aAApkAAseOmoNMGS6jM4OIm0vV++jBiHLAEeWgrb0qKkvc
 lHqF8x/sGh+iCFhx75/5gFCr4VXNWZHj2yYWTLWAfCpw0+mdsRMs5stdrWkR3pEpso2m
 WSTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxklQ3Wf1dzviiL7PCKZuIilBJFpYgrbx/dj6ubRECjSzFskJyLcD3pKO5BMk066BBhq/7eiQ7jdw==@nongnu.org
X-Gm-Message-State: AFq9FYJ43+XbKJ6XsatNRQ9x1YqxtacT8U6/e1EFx7P2/GZZ1Z8et2Eb
 8wKjNnVVk1yDrTzvR9gagUnXK8BZFJE5R2k0+jC+ceREXcllw6cZdlLL
X-Gm-Gg: AYBFou3UJ+bXmjGq0hoRDQKKyTRghNr5SIEj4bsdjo8seuy7yobmNnNbNlancf8Uodg
 hpPmoMDq2vbx+nltatmfDHHW9/cX/C00sR2lNm4HEEsKTiyVZLa86Jy02cEIp4uf5CSEnGrDewt
 +QB1MowlKAZhYhC0ZiXVo6slFWTKnWzL6gvE6278YF9ErRLPpPl2yjpNZEpg4s5UGAA/yztzg3e
 9zcP3KL3YhfhJZpY6mtp1AMgK10XXTSgLenxebnIYwRy9HhsT+Hv9r0pfPf/AlQDtFzNrG+wG5s
 c3SoArP6hd76ZXzelsdy9Wm0txJrBG15OAcYxFX/XmvU3ofvCWKCShU15/CGySI9zxZ2UUFxsGK
 0uHwiNdRrKrdP5Li+F0JC/KFXmevCHf3MCDfIqn6gBtRZ86l6PYgbRdZLdQXJDbP2YCZioKmHBt
 UCUKP2VWBBBeyF0cbuVfYVAx7hPshORZ//TnG/UqWwQ2b63z3IssDm6Uf9WeHeMNMBBxmn8AmUX
 IHZPGxb4TAQwofgYLQrRUUNK3hgIfyWE9/nS9avgwBcHXpYN+Nc8xVE9rkq4+Na83ZySRnw7kBq
 8af3BtfJGF6JAEvHEv4csqURJXgX+JxO7Q==
X-Received: by 2002:a05:701b:4549:20b0:144:fdf0:9d91 with SMTP id
 a92af1059eb24-1993552f1d4mr13029185c88.24.1793099578543; 
 Tue, 27 Oct 2026 04:12:58 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:57 -0700 (PDT)
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
Subject: [PATCH v4 05/17] hw/loongarch/virt: move virt TypeInfo into its
 type_init
Date: Tue, 27 Oct 2026 19:12:03 +0800
Message-ID: <20261027111216.392-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The base virt type and each versioned type are file-scope
constants, so .name has to be a constant expression. Move
them into the type init functions so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/loongarch/virt.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 9c5371af9de..83badfbdfb5 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1548,14 +1548,14 @@ static void virt_class_init(ObjectClass *oc, const void *data)
             mc->is_default = true; \
         } \
     } \
-    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
-    { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
-        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-    }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+        { \
+            .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+            .parent = TYPE_LOONGARCH_VIRT_MACHINE, \
+            .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+        }; \
         MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
@@ -1579,22 +1579,21 @@ static void virt_instance_finalize(Object *obj)
     g_free(lvms->oem_table_id);
 }
 
-static const TypeInfo virt_machine_info = {
-    .name           = TYPE_LOONGARCH_VIRT_MACHINE,
-    .parent         = TYPE_MACHINE,
-    .abstract       = true,
-    .instance_size  = sizeof(LoongArchVirtMachineState),
-    .class_init     = virt_class_init,
-    .instance_init  = virt_initfn,
-    .instance_finalize = virt_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_HOTPLUG_HANDLER },
-        { }
-    },
-};
-
 static void machvirt_machine_init(void)
 {
+    const TypeInfo virt_machine_info = {
+        .name           = TYPE_LOONGARCH_VIRT_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .abstract       = true,
+        .instance_size  = sizeof(LoongArchVirtMachineState),
+        .class_init     = virt_class_init,
+        .instance_init  = virt_initfn,
+        .instance_finalize = virt_instance_finalize,
+        .interfaces = (InterfaceInfo[]) {
+            { TYPE_HOTPLUG_HANDLER },
+            { }
+        },
+    };
     type_register_static(&virt_machine_info);
 }
 
-- 
2.52.0.windows.1


