Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F875606A321
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/a0C0tU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoM8-0004hd-Ti; Fri, 30 Oct 2026 11:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoLY-0004Pm-OU
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:16:55 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoLU-0008Sr-Ls
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:16:47 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so1420466c88.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373401; x=1793978201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zA4vatNcIKJhE+Eb39umMv/j/wzlc1JpQpFuLfiMq1c=;
 b=K/a0C0tUUuO6kNQZf4bTC+W1V6fsZtma4zFADfaRDP/o0WNzWpbkhaJqJL1EqkmMSa
 nxqes8o3pJxyj2CRDcfW3yD/T6fJSpAvEap8Sc9qQqnvDsholViI5jXLQ/M7mX3ak2J0
 vqViKaCYSgBrsMBlKN8QyYpUUOxNN8NReVh8avw8W89CeS9/6HdZHUakxXUNMVXd3DWP
 u1MKsW7FUSFO1Trw8ohc1na0+B97NbcWGVPLpeI0z5dP7nTIjmuE4WDDvNa5iV0qxNWq
 mj52WWPs+BrIOgUdYIw6xVHvuQe0Plin/66wXTtSK7jxVcYq3Fbuv+fGLY6I0+EC6AZ5
 t6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373401; x=1793978201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zA4vatNcIKJhE+Eb39umMv/j/wzlc1JpQpFuLfiMq1c=;
 b=QdCTHRadFiX5S5G2IJLqIzqj0a6L5dxB1jcgd4bLVGzvpBEQiEberfSCRnhNmujGtW
 nFSzHMB/c+f4+yQw5uGSTX3sYg3s4W5UKvfhmVyR9a5Dt6SsuegPk61KCCdpwK47AKs7
 9RXhQ/eM/jZSrH9/z124pFPh7hcyZ8Q5dz0rx8zosJ9llBn1TsKlXuwWMXdTE1OYr/CL
 Wj8+pOs8wYc9LeOvrt4eHgZdaxzfXiV1MadkK6fbkIh2CQ4wKssZ2tMebCcQ3iyeaD7A
 cF5KqR/fIa+4q+lALmnnEVfqAwf8Tt/UUGxzVzekH6hhIfmutSoRdjJ64Kns7kD2SWk5
 mrVA==
X-Forwarded-Encrypted: i=1;
 AKwUvByT4249gcma/POXXvyXNoHFOr89eS1dB0Y5lM/0T4KBJ4uNMgKAWvB2PfQx4DgN9vjqI0kbQ3LRug==@nongnu.org
X-Gm-Message-State: AFq9FYLOdj2q1TaypPqROx8pmftEG6gAdvkltKnajn8t0dX33Auw27mt
 z4kfEw8w2TRgV7oHGWlNM2W02KnUvSC1Dh2x4IsO9DYV9LoqHUpXT+MI
X-Gm-Gg: AYBFou32Bs2SE3z/dpG3kWArl8NmhKKpKEK/fb8AwtflddTXhc+DzyGVNKz0qO+GAtp
 3ImlXBFF2kiOzzD19IYO55TBLewVTaMsuTr8ZC66+Yx7LZhz6n9NSvDNJJsVQRrj8HsH+ojSRC+
 KVToUjnqQvNOU0mykgSkuO8vqIHefnWJEIm6UckXGx4SObN0GUBo/kDsd4eu3bi2TPR0ms7MRML
 I/5r93TnQli16944JBtDbUeqlTjZzn++LUA/Aj/JBWEZw0UugLemXM3fYfzHyFNMcqZrlGsc/lT
 mYPU0JaXaPL2Qywmq6DMpqRpMxbZbRweQC0btwJNg2A4Qee2lJ47T9YbgYpt7BA6gTLDs85fFJA
 CXbQitwvw0nqwtaeyN+dcmWy0iOEce7aDyBsUG3lKgBiMocLeaQBbTcifQgHixN/sqZCfUx1dvb
 pcuxYDx4HoPJGW/i1D46wAlylH0d7UqrDoL2LBkvcZUMFk6vDjcoWGO9mhFGP7lX8krbN1LKSNo
 ZmuLKN4/BTEJ2vCcEavmQ7xEa5rgNgwLF/yBSbC4UU89UR5YDDwd5NLvN//AsHu0sv7+zbYGmMj
 iH5zq7gG7cn0nouuCyzNpVbrRlfwPJ6dn5yUHirouBfH++FGjQcUKpwlNQ5hFWqyK700IA==
X-Received: by 2002:a05:7022:ea46:10b0:177:9a5b:a89 with SMTP id
 a92af1059eb24-1ac5b5f270emr4076428c88.29.1793373401184; 
 Fri, 30 Oct 2026 08:16:41 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:16:40 -0700 (PDT)
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
Subject: [PATCH 04/15] hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
Date: Fri, 30 Oct 2026 23:15:25 +0800
Message-ID: <20261030151539.1872-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1232.google.com
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

Expand DEFINE_MACHINE() in hw/tricore/tricore_testboard.c to
ttb_machine_typeinfo and ttb_machine_register_types() calling
type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/tricore/tricore_testboard.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index d5d796c8eec..2a25f090520 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -106,11 +106,25 @@ static void tricoreboard_init(MachineState *machine)
     tricore_testboard_init(machine, 0x183);
 }
 
-static void ttb_machine_init(MachineClass *mc)
+static void ttb_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "a minimal TriCore board";
     mc->init = tricoreboard_init;
     mc->default_cpu_type = TRICORE_CPU_TYPE_NAME("tc1796");
 }
 
-DEFINE_MACHINE("tricore_testboard", ttb_machine_init)
+static const TypeInfo ttb_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("tricore_testboard"),
+    .parent     = TYPE_MACHINE,
+    .class_init = ttb_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void ttb_machine_register_types(void)
+{
+    type_register_static(&ttb_machine_typeinfo);
+}
+
+type_init(ttb_machine_register_types)
-- 
2.55.0.windows.3


