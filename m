Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EAB606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U0bgiJd8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoMr-0005XS-7i; Fri, 30 Oct 2026 11:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMk-0005N7-G3
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:02 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMi-0000A9-KS
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:02 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so1446540eec.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373479; x=1793978279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=unXNvMdiHSqKZbW2yjBCaHIctKeqs2ATJiqxjlNdZQs=;
 b=U0bgiJd8ZCnBTvR/aNG+GlfHeCc1BT4W490VlHoaN0QKXfvAleXZrOZIBbwn3zAUeE
 gKYLf3LtCTv4tBeztnUq+G6++VThD/PwY+zx4N+ReH78a3a6WSE3qJISS2zv0YmDY3Ng
 +m+TARHJR942KUHmkpEk1JyaKI47dYv+FPM0JeqcynLoQUkGpwU4KKyNLQhGdBPNhmiA
 CwN34uS6crpBRyLcRqITEyP5RcDrcCyVOOf7upwySE9S4sBENKKmLBTAJKzu9/yW1UnE
 ISULCGrEWIi2e/qvYiVDIC2bQg5YhsZStWkxD49lr3nY/nVh8Z2fiTjJM+cMlsMwZKXp
 DHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373479; x=1793978279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=unXNvMdiHSqKZbW2yjBCaHIctKeqs2ATJiqxjlNdZQs=;
 b=GooRH0m165rUrcKSR7QD1xXWALS7JPV4vtEebRuVqn1twVzhq9F8AK9Iu+gbVuRc9X
 paSUPb2NMCurJXoJHkgjrzadPZBipGgOM34wjM+k99i088qQuKpfD8Wn2S+8ndLNdLJO
 u//zB6FRZGWj9VjfHJMKJ539MiVyEC89hhZGE0oCbZ71g/78i8fVtvArfaowTsnuqWS5
 rs5dWdBZ30eNtJrRa1Qm9cz5UlldGXcOqDOY5UDnQ51dJ/vbximHy7BgS27E0E03zPxs
 Vq0R/y7kcCiXaNpnWYYc4/d/j59ZrKouB94lljYbepppHJeDkRKrXaKbA/nGAERWmgxa
 tWQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHwrcc2ucZ6N/8nK/OwDfJUL6Mv6AJkecDHF4mOurKYm4+k2dvJiZE5nSiX1PcxdKCJ4zQblNG4g==@nongnu.org
X-Gm-Message-State: AFq9FYIcruZqcWRlG9fTzK3dcgAKI5WTJVowW2WhngqhoWPDJ+YCeuYr
 l7Lrhsj+xBsk4a/xitWgSKRbgJ0MsR35x2PVodgavosvdRHNXqH55KQw
X-Gm-Gg: AYBFou27RlUd1Y+Pi3xsJ39DEkWw0gnswurGkPT9sPPuoUI/iw5PC/2wL6bS/jhuumP
 6tDrKMCXTuS3M+1ZOIlOzzGasDOX/F9lckzRLe158V7CGEOlrHrSKil2CrVDiffZ9AQulzNvh6m
 qIqtVkdTNdmMzWZ7elyrOOcVGNipjUflmVzwq4C4+yOfvGVnrtrD1xHg/lp679CsE++dfCnUCJT
 CKlY3p1OkbF4hdKQMb6tZhU6/Wj8tAfVqpkBAWDcrcfUO9BqObJg6upwtt3V7qkSr3jRg7p1wzQ
 caSOuOmIGNuxBjNqp58mWw6Avjbu3BFWLRgboBwESLRVcZNxqqnEss6S/fxccCq69Fw1J5om1yn
 b0ZzZy7D4n8+4w5/2sPvtBz7/W5yl5vD1mT4Cfs/gS9/RVUUF3aj0ElAfzrzoCKBfrMiICFX7dV
 5uFpcWqihEZ15afhHexJRaT8sY1q/intnX7wwonxFScPcLrmbuavqLm/RCnsbsLkPptEqiL7AcQ
 l+5zUvbDQiuer3Hc65TZKP4t5uexSXIiIuhfzUSantMOEsG58jhy+ICyfCG0EjDEXtMZ3C5FKZc
 g/ZiPrrfQ4dXioblE1e0r9khWoBPJRXSyBhQa3KvduVjFlKC
X-Received: by 2002:a05:7022:ea8e:b0:1ac:f84d:4036 with SMTP id
 a92af1059eb24-1acf84d43f8mr2092732c88.9.1793373478878; 
 Fri, 30 Oct 2026 08:17:58 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:58 -0700 (PDT)
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
Subject: [PATCH 11/15] hw/sparc: expand DEFINE_MACHINE in leon3.c
Date: Fri, 30 Oct 2026 23:15:32 +0800
Message-ID: <20261030151539.1872-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1329.google.com
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

Expand DEFINE_MACHINE() in hw/sparc/leon3.c to
leon3_generic_machine_typeinfo and leon3_generic_machine_register_types()
calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/sparc/leon3.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index d4a6e917598..ddc25f528ff 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -434,8 +434,10 @@ static void leon3_generic_hw_init(MachineState *machine)
                             LEON3_UART_IRQ, GRLIB_APBIO_AREA);
 }
 
-static void leon3_generic_machine_init(MachineClass *mc)
+static void leon3_generic_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Leon-3 generic";
     mc->init = leon3_generic_hw_init;
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("LEON3");
@@ -443,4 +445,16 @@ static void leon3_generic_machine_init(MachineClass *mc)
     mc->max_cpus = MAX_CPUS;
 }
 
-DEFINE_MACHINE("leon3_generic", leon3_generic_machine_init)
+static const TypeInfo leon3_generic_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("leon3_generic"),
+    .parent     = TYPE_MACHINE,
+    .class_init = leon3_generic_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void leon3_generic_machine_register_types(void)
+{
+    type_register_static(&leon3_generic_machine_typeinfo);
+}
+
+type_init(leon3_generic_machine_register_types)
-- 
2.55.0.windows.3


