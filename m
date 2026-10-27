Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ECD606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AO1T5oDM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf7D-00039A-2p; Tue, 27 Oct 2026 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7B-00037R-U0
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:14 -0400
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7A-0002u2-Bu
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:13 -0400
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-1a2761c69fbso2907032c88.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099591; x=1793704391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=32XnSUYVfaw8pDaSjJQ1TXRXq88HLrWvXnAIvNKMIio=;
 b=AO1T5oDMdon/62b9SZ4m8hmtO2jxQcSmgs3rBOehvGshXOOWGd4G4nVmry9rzLmJ29
 5S2fChuUHUj6BHgFboZs+U5hF+kWH4IkENdjOCeEAVhEEUiNfAvau0HIFe9W/wJ6BjlS
 HkoF0Km3bG7i9U9pl3I1xPwNGhoVuEYJsoNWfwy9I8+vQy/niXcf6lH5xspHTGTHYWnT
 KAtPwWiikjS1CW81tUIJk3vhzSIILKbYRn+2BHl8CBnM0pNvuvvNLrb0OBaE0jljOitI
 kON78j9KrJcJwTMVETpRERSbt28qWkmZCS/WYqSHjqiPymjr8byEbT8yS9IIy4T9KgUD
 P5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099591; x=1793704391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=32XnSUYVfaw8pDaSjJQ1TXRXq88HLrWvXnAIvNKMIio=;
 b=xILUd8kvgB2fWEgtiWHe5Ocri2ForVsXsz7Y+IdgdtNMkJNCYt+n2elmDiBLS2eGB5
 j9QBw1zsJ2/bP9aNwqA9as4UDWPQMXiPUg3QQUufXZls5n0nkGBwztQj2mDRRbp1tt5M
 GKW7t8KtuT6UxjgkqMJcqVzaCRjGLX5215IlyZye0IhvaimgK4HhcSCP3ky8u2Y3uGdh
 1UAEDMtn8TaSS/RVpUZinT3pJA3DoSfBqfhirZMpY9RxocEYZCoBqeqSAncKIJMBW1Gw
 HnaF1ARyc2sTCmLAQLaREmFGe0SOUA7uXCm7pWyNyFCYnl4xZeSTVsX/aDzFRd13Tx01
 UzDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByF+JEmOp1wyi5AYVHlSO+tfbl9SOfEPz19SFB+SN2yjJPYuH7yJEDC65oJAk/kymhayA11a2D/8Q==@nongnu.org
X-Gm-Message-State: AFq9FYKfUfHaG1vpvQ1pV4FsBqH4HrgYP4Dqx2DGU4grwd7iY9ogLHj+
 Ccf2gvXruADWQfInh4C5QLrZn2VcE8SUFIZr3pGhz4i+EZhfieuz19qa
X-Gm-Gg: AYBFou1UzVq5h2Ot2w+iVTxVvV8d8swOPH5cRIBB42D+WSBgTCFOP0EO5Y2E3KanAft
 sm9ZEdJjVN65WuaexARR4OL+os5go1GazrWdHtrAMnNd6eweKxiuZL+i1bQIi0Xhbg7b2hnjP3A
 okPFw3YYCIlnr7xZrpcBI2QUAQ0Qx10lDEbLgbkMUF4emlqUMdWTi7dqFFPbmtSizn42uNcqXR8
 KB1YiPtcnpcpip+jU7MKGk4E8rExB6wUl8803KbI7/dN6CmEGqy81h2xKvOYFkTXCNGJGokqgPR
 nlVlkzNXqcqKFhywxV7f1JVFynsWbNK+jSjZE5pXpV38j1tB55EUl+GC215UPf4Ihn12TPa+4/Y
 zgQngC1vHpKNtEAEjb3q+9dIE3nQ/LzpoPeeStEihNMLtf0C3nVaYHUfePpCUAMilNmVCqA7D6Y
 xDk2OzoxEGSzDxa0Ot/xHoctGv6P5MFSrQN3h6dC4KUjSzoWPrGX/S160sZs+8h7iDA8u9HpLnz
 CA5m750tfJvtT9z07W+kIYGg9SFFBCxxOzWQQHtWwp3VHdLcHQ8fRiuTbiNZgsbC8i3sgVswMuQ
 IT6qcpmORc2f
X-Received: by 2002:a05:7022:e806:b0:145:287:ce91 with SMTP id
 a92af1059eb24-19935625d41mr16005049c88.14.1793099590872; 
 Tue, 27 Oct 2026 04:13:10 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:10 -0700 (PDT)
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
Subject: [PATCH v4 07/17] hw/xtensa/virt: move virt TypeInfo into its type_init
Date: Tue, 27 Oct 2026 19:12:05 +0800
Message-ID: <20261027111216.392-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1231;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1231.google.com
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

DEFINE_MACHINE() keeps the virt TypeInfo at file scope, so
.name has to be a constant expression. Register it from
xtensa_virt_machine_register_types() so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..638007f6d32 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -115,8 +115,9 @@ static void xtensa_virt_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_virt_machine_init(MachineClass *mc)
+static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
@@ -124,4 +125,15 @@ static void xtensa_virt_machine_init(MachineClass *mc)
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+static void xtensa_virt_machine_register_types(void)
+{
+    const TypeInfo xtensa_virt_machine_typeinfo = {
+        .name          = MACHINE_TYPE_NAME("virt"),
+        .parent        = TYPE_MACHINE,
+        .class_init    = xtensa_virt_machine_class_init,
+        .instance_size = sizeof(MachineState),
+    };
+    type_register_static(&xtensa_virt_machine_typeinfo);
+}
+
+type_init(xtensa_virt_machine_register_types)
-- 
2.52.0.windows.1


