Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B154606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Is2yst8E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoPD-0000GY-7B; Fri, 30 Oct 2026 11:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoNS-00067g-S8
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:48 -0400
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoNR-0000Gb-3P
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:46 -0400
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so1023237c88.0
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373524; x=1793978324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D80p8QWI+5BbGopzHjtSexJQceQpYTApqX3mxRXadD8=;
 b=Is2yst8EyHFOaiq/1yRYZe7mjO2GdcYrlmk+rQ2cyHn67iT3DlRc5p9Idhd28zg5Ty
 fUDVsS5BvuNzeUkLuDKPunILd9Q5Meau+IuU3xqNXsNOMW/QgAae3nN6uF0AIDTAw9+q
 OjFU83MeShbejIYDWgs8Sagxpmf/kbt6GuONrNAwTWwNmNbmkTM0jk4CjmQn9QSdsyAJ
 S6EuFMwx9jrynG3HZeOEcs7PPmmv7u8dMuL+Gsf5Qd4XYcfkIweb3qit4av5QPHvuVRo
 AuljmWINgV40iL7EWhj40UKZC07Ng/0jqBPcsORi98JNumrKkJ8/0B6TOE55QeAxUq9n
 mK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373524; x=1793978324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D80p8QWI+5BbGopzHjtSexJQceQpYTApqX3mxRXadD8=;
 b=cGtaYzbhQJK9pAOu1+4wQxXRX63hi37SbQu/iQP/c1PH11hk6G+WzVHba/GZCCr845
 kpqK3n2D5GS02DiJ1mgJG0jgFq1M6lT8JemjtWvdKqTgpFGQ4BEWJ9B0mk3n7ML9dm3A
 Xh9TRSIoI3dl16fNAfD19PVBdy3Ibjd0JHzXExHPkf/9Ph2pkBtFIeWj3IkoS+kyeuXm
 kaOexQm+mj0ZE86SIfAGZMAt6Wqe5pF9fByhcCsK0P3Wm8fCzVHkq+GEIaltGFpUMSyG
 QwccOjEaew34CRtxpPRyZmhvh6zM9mmOdwcZhe62X5BrRCXCiAly1O2C7+aF4GoNirXZ
 /mWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwT/ImOHAlkzDKw1FNAvZH5l5z9Izhw+rRyFYPQ3fUKw5OcX9jXaRbHdYOBNt+nfw5Lf01CuXxVzQ==@nongnu.org
X-Gm-Message-State: AFq9FYIpxBXdngcfvF5Yt+EhQn1JGJT6mIzW4lxJALAeh29tL2F0KBun
 VPd9MzqTGU5b6z7UipSBvS+l9PBbSvfEfmlD0LhgZ7oQE5GDQq5vVyhz
X-Gm-Gg: AYBFou1OzPIO2fg7zyJsFOrZP1HwVhllbXkRa9BcPqhu+5vpdF2oYK/WYu4d9ZT+F08
 0BH0zL61PzEm78uMcZZz07QNaUc/9MR7TaQR6bB+iDkUdlUNdUKSDTb7vhGH+jK/VabofkXcdqI
 Xbkc1G9twx7Z4VrRJSeVrKQWQKjx847KgYTn/wcOYVEyY69jHA6W2IUO9WDXVYy4bM19p36U5u1
 qXw6RtBCgFyaXvtQ/DbQJoz0i4PqKvWamD9BM8stBM5idsLBqoBynm00Q/UzvZdhBTClVNbRgmE
 jeucFJXyH28Pyt/44obs99Vw7aC66FZOVPRjZk+yM+QIVOYaSGWqJ0NgTqm8UHsJnsZez3SjR1x
 ym7Z5HfnYu0wGK7aVS7kKPmWY/0mfLVtuGv8ctqhmQR/LZCzrtdjY33x2fkVFFCloIowBhmpZ+2
 C3+QcBTSMBAPEDzNswoK7F0KPkjA//3N6JgJpQTWRO5uWDOyZfJvViTTbn9RV0ntI3ra1UHah51
 9I9obAkxIvLkSrxtcjkEwkJLvHxhs1D4q+X7BQs/l5EM3HS3gzhqsU0f/KUSQaVMIn/8YsT7Qos
 qVltBEkL0xZjRSPnUm5lzdLugRogw8ximDLHmvNQB9kpcZPX
X-Received: by 2002:a05:7022:7f13:b0:195:76af:b810 with SMTP id
 a92af1059eb24-1ac5bf91b35mr3525078c88.25.1793373523578; 
 Fri, 30 Oct 2026 08:18:43 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:42 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-ppc@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH 15/15] hw/core/boards: remove unused DEFINE_MACHINE* macros
Date: Fri, 30 Oct 2026 23:15:36 +0800
Message-ID: <20261030151539.1872-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1235;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1235.google.com
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

All DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED callers have been
expanded to explicit TypeInfo definitions, leaving DEFINE_MACHINE* and
DEFINE_SECURE_MACHINE* in include/hw/core/boards.h unused. Remove them.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/hw/core/boards.h | 48 ----------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index d0e4ad98201..8af927e9b7c 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -513,54 +513,6 @@ struct MachineState {
  *      DEFINE_VIRT_MACHINE_IMPL(false, major, minor, micro, _, tag)
  */
 
-#define DEFINE_MACHINE_EXTENDED(namestr, PARENT_NAME, InstanceName, \
-                                machine_initfn, ABSTRACT, SECURE, ifaces...) \
-    static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
-    { \
-        MachineClass *mc = MACHINE_CLASS(oc); \
-        machine_initfn(mc); \
-    } \
-    static const TypeInfo machine_initfn##_typeinfo = { \
-        .name       = MACHINE_TYPE_NAME(namestr), \
-        .parent     = TYPE_##PARENT_NAME, \
-        .class_init = machine_initfn##_class_init, \
-        .instance_size = sizeof(InstanceName), \
-        .abstract = ABSTRACT, \
-        .secure     = SECURE, \
-        .interfaces = ifaces, \
-    }; \
-    static void machine_initfn##_register_types(void) \
-    { \
-        type_register_static(&machine_initfn##_typeinfo); \
-    } \
-    type_init(machine_initfn##_register_types)
-
-/* Implicitly insecure */
-#define DEFINE_MACHINE(namestr, machine_initfn) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, false, NULL)
-
-#define DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, ifaces...) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, false, ifaces)
-
-#define DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ...)    \
-    DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
-                                        (const InterfaceInfo[]) { __VA_ARGS__ })
-
-
-#define DEFINE_SECURE_MACHINE(namestr, machine_initfn) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, true, NULL)
-
-#define DEFINE_SECURE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, ifaces...) \
-    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
-                            false, true, ifaces)
-
-#define DEFINE_SECURE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ...) \
-    DEFINE_SECURE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
-                                               (const InterfaceInfo[]) { __VA_ARGS__ })
-
 /*
  * Helper for dispatching different macros based on how
  * many __VA_ARGS__ are passed. Supports 1 to 5 variadic
-- 
2.55.0.windows.3


