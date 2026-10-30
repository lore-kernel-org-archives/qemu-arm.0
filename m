Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672F606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDpN7ieB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoMj-0005L9-Uz; Fri, 30 Oct 2026 11:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMa-00057w-38
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:56 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoMY-00008f-7j
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:17:51 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so1423109c88.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373468; x=1793978268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BKYw1CARIGHPsFEBA2gFzPiJ4otfJ5ejgAQP620fQvg=;
 b=zDpN7ieBPGb1meNIlXSLJodqWAnJc5w1DmOGH1kH2lilKGL3X8okh5vDnSdm6Z6klR
 vwcDzP4MsfBblqqNEPGWIZq3Ig3K96hTvhFmtqCGqX7QYVwoKR/4xBD3z6zQVWBIyc2Z
 jIzC9Ky0g+7IuO6L3FWgAFOpDK1ioNOywn43qAG2rdZgU0n1x/FfsVxiNo7jkt0yhDoD
 b/Uu643H69AJme5HjzUxdZEog/pUWleMkfvIzSXbnbae/8n/rVZlqM939kzFujJlTLop
 EFevZT+DfRpFPyNbv4Xi5jIusYZWq0hr9jZsGQeoG/cqe3x2ohI+Lpi2c9wCk4cepiit
 bhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373468; x=1793978268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BKYw1CARIGHPsFEBA2gFzPiJ4otfJ5ejgAQP620fQvg=;
 b=Dpe8RC6JqYO3w6zZRJDtgc+r0hZUo6A8u9SFTmJ63p9OeN0wWMQaZNoo8ZWoWi/ceP
 fAFLSPdsVApE5fMNzlzukkEYo7wJyBGYkgiUd5fD/1FGtqFK5MV8ma/BMX4287ykrOot
 ooGPQQO6kfNx/j+lhC/i0Z2Bi0Y6zX5ahOhJvC+O4MDJcLR/WLIIrHFHd3Gl1I64Bhwy
 LsCjBpUp8h4NPARXwWkmvJGRxz6lfHnREOKa23wXJRUEAFsHK/D6h4yFQLulw0c7jm2a
 PIW9QHHHw6j778LkLnYJGkJiFRGd4f14yGLGsu55w8McKiEv86mrN/rzjmNrIZ7hrkQF
 z2cA==
X-Forwarded-Encrypted: i=1;
 AKwUvByF9aB/yXKwYmo2XhGBbnFbXZQUwME/98QskL94j3FNKMjO/SDpg3fjjho2PGAFhNP7IFohOB8x8w==@nongnu.org
X-Gm-Message-State: AFq9FYLXBAapGWBErX1fYeePEIX2d3qwKh01z2geITD+SJ40o8q2GXrS
 3U+8LRZd++DRtCOI4CgcYU6rE6pvPfeDEr9aT8to8V8abrlUd8tWKQ8j
X-Gm-Gg: AYBFou1aWRnxjK233F08G6gZm8OD0L3yjAMrk6mXlp8MkDaogS/Y0Kd46hp+UNSArNb
 1yAeAAe37n5ppCT9Uq0oAFDf8GqxdeHHbOsAHo71/tuCjUK2i8IV9DHNhIlNkgeFXUz/1jxUURp
 hyi2S3EtVfi1GriZwxAiwBddODH+d2Rryqq6N8YHtxF1/EF5iLNbO4LnsAyEL0m6Cyehmh9dFbm
 QaheSNykWcOLIJwm99itDSXhD5v3JyB4bmUA+6DK746EMQJOTQR54YLLuaixBgwBMDZ+OMD56eU
 pliF1W+aRTOVNr+rUgtICgKAbdtxnVcunDaGsmX2l0GZj4J1jvJ1naQHxTcyp1QwuQ1BXlEIojK
 jy3LrNhOEulUqSx0XGf6mmn32ntOtBDy0mP/0A/Ogb+2MtGBdaCqnzghz0R0EX8YqYdFSTbDvr4
 nSBqP+3I7IVS/skybukaCATMwYFpaXRN8hL+UZEPziy0Y7g3SPr1ncR/boJRmD5yjzAb0zzuLIJ
 IFd628Wk+JX2si5BpKi1SB1B3scQo/OM4Kb1728ITzXUr/zti7A7dY48Tdg5EAEH4PcqwjQRLR8
 58TG9Jjeg5BxOKQz1MmYtXp5sqIQXSQ4YSMFIKDShoQhWgUf
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id
 a92af1059eb24-1ac5c272744mr3802599c88.34.1793373467893; 
 Fri, 30 Oct 2026 08:17:47 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:17:47 -0700 (PDT)
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
Subject: [PATCH 10/15] hw/sh4: expand DEFINE_MACHINE in r2d.c
Date: Fri, 30 Oct 2026 23:15:31 +0800
Message-ID: <20261030151539.1872-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
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

Expand DEFINE_MACHINE() in hw/sh4/r2d.c to r2d_machine_typeinfo and
r2d_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/sh4/r2d.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 99afe3618e8..fb80c935ea6 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -378,8 +378,10 @@ static void r2d_init(MachineState *machine)
                        SDRAM_BASE + BOOT_PARAMS_OFFSET);
 }
 
-static void r2d_machine_init(MachineClass *mc)
+static void r2d_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "r2d-plus board";
     mc->init = r2d_init;
     mc->block_default_type = IF_IDE;
@@ -387,4 +389,16 @@ static void r2d_machine_init(MachineClass *mc)
     mc->default_nic = "rtl8139";
 }
 
-DEFINE_MACHINE("r2d", r2d_machine_init)
+static const TypeInfo r2d_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("r2d"),
+    .parent     = TYPE_MACHINE,
+    .class_init = r2d_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void r2d_machine_register_types(void)
+{
+    type_register_static(&r2d_machine_typeinfo);
+}
+
+type_init(r2d_machine_register_types)
-- 
2.55.0.windows.3


