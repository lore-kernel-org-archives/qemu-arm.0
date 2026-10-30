Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881B606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/h1wpDh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMoNq-0006We-9Q; Fri, 30 Oct 2026 11:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoN8-0005oq-4J
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:26 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMoN4-0000D8-N7
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:18:25 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso1080702c88.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373501; x=1793978301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c4ZF6CX3HwMSnOXWr+3Or5e7RYyQ6c3g85+NgZehtQ8=;
 b=U/h1wpDhJ5WDQET81FzyAFPOBX+JmWkAFtAQ7da5FLH7VA4G0SSBF9dGQwimZMLbzp
 wYy2AywDuPuq+9GWQYmXU3w5WT15Jjzx76GSFwvJt8Zh1XAgj8YvE5ML0OtW5HxgEc6d
 CKUIqWPVPpbX2XSArDeTEp5imMucPiKj0S2vvwpVgyoilxNvB+Duvza+6fHTXENyLWkN
 FTcI24+Y7vl337pU+KnyntWOtdk7Hh8RJ7tbi7WtJJtysM1qkiHHlx9KhW/RptGnyu1u
 s18/egrjw5/QxhfCj0p3C43Ue/G/moaghNOQxn08dIUL/i1i5uWTI2fIXBRbFGzhUwye
 gNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373501; x=1793978301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c4ZF6CX3HwMSnOXWr+3Or5e7RYyQ6c3g85+NgZehtQ8=;
 b=VN/n1cbq9czK26Ew41YgdNJWuO+nzdrokHqavbhZea7Hy/QOSfEoBFlj7w7LLBY+th
 PdWRnloKr+YDQukceSRcmWI6zpWuQHUv+f8aDK0rgHXx/hZL7pp8tgjihues6+4kQyRu
 unpftTLSYiU8OVq47kQ8fvg+KWfRfLs/a5toaJROc5JkuBVBYb3OQL9QuICL2Z9KnKGL
 rkKQm9rdPE3fU5AhItwYtG4LBU7FJwmOjccHvUhya+UWQKp76Dyck+GFgMtPcOYuBLeL
 GoUSHrRMoniCprWIK+ImOqIZHSjRJaCr6IldZmWE12JXb0mGeCS4IeRi4pYuCIyw/4JQ
 ETqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgDQeQXgxcof1s5Hzqg9vXrZTorjoYfRZna/dOejnMONi5MfhhK0ppAsT0AsD3q0eHBCaXp4h3ZQ==@nongnu.org
X-Gm-Message-State: AFq9FYIoajNcmY+Yxvr3I3/8j1HdXhV7e2kqaa9bdNAWUtUsiIslXJx5
 ytY4r+fE7OJn5KA2/K+OHFkLFjhfQchpjJtCQ++tzA7r7ywR2SJMUYQE
X-Gm-Gg: AYBFou03mStgp7VWpe+w7E3g9cWTKY4FIIE2O92Kr7CEUunbEHjFeLsorbK1M7wxAsy
 VARFXaS4rx9zigVh5jCSN7n2FXCe2N/q+ve72gg40Pfw51yDbFbDSog7TRDBxfDTP9lFCHyjyme
 S8CtwvsJRF++7pc6IS8Xv1+wr+ArRmubB05J1391QRyWW+lkyDuFLpwZ+GkigOxl3O3G7HEES3H
 +/bEVbFFbuOXsFEOr/PHIX16cAe54i1Qv9WcXLna7VDlDAbhdoXXXFIooFADDlM0TlJT1y6QTrF
 5QBgFBomVdrHzGj4D1xciYEoY9yjNl9eWl+mG2CwmmsfrDBg4l0E6tLMAfjAnu1YRwq4zmt303o
 tifU3cUGZFsGAXwlH3w8HiRdvLd72S0NzlZYEJTwDqE5yIg5GC0SpWOgy9NXktCMTI7XT5BWN4b
 xMrFYePjxK237QwCumNYrktFyu1n68pNW8tI5X06w04zfCmfP79HWtvrmN3R+3rdmOtuPTGJVt3
 IlvGk98j+zqfdYTZplyaoxc/mC7br9mr7gRd1HWSS/LWKpgW8TYLrpWorBucgWfOam7BGbQZTVs
 5EN7P0dwWPAWTl6tmuRir76YvUhZs4Vp/uet87VdvFIpRv1wKw==
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id
 a92af1059eb24-1ac5e6007a2mr3303536c88.41.1793373501142; 
 Fri, 30 Oct 2026 08:18:21 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:18:20 -0700 (PDT)
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
Subject: [PATCH 13/15] hw/xtensa: expand DEFINE_MACHINE in sim.c
Date: Fri, 30 Oct 2026 23:15:34 +0800
Message-ID: <20261030151539.1872-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
References: <20261030151539.1872-1-luoyonggang@gmail.com>
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

Expand DEFINE_MACHINE() in hw/xtensa/sim.c to xtensa_sim_machine_typeinfo
and xtensa_sim_machine_register_types() calling type_register_static().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/sim.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 835cd04fe01..fd66009b950 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -121,8 +121,10 @@ static void xtensa_sim_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_sim_machine_init(MachineClass *mc)
+static void xtensa_sim_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "sim machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->is_default = true;
     mc->init = xtensa_sim_init;
@@ -131,4 +133,16 @@ static void xtensa_sim_machine_init(MachineClass *mc)
     mc->default_cpu_type = XTENSA_DEFAULT_CPU_TYPE;
 }
 
-DEFINE_MACHINE("sim", xtensa_sim_machine_init)
+static const TypeInfo xtensa_sim_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("sim"),
+    .parent     = TYPE_MACHINE,
+    .class_init = xtensa_sim_machine_class_init,
+    .instance_size = sizeof(MachineState),
+};
+
+static void xtensa_sim_machine_register_types(void)
+{
+    type_register_static(&xtensa_sim_machine_typeinfo);
+}
+
+type_init(xtensa_sim_machine_register_types)
-- 
2.55.0.windows.3


