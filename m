Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E69FC982D0
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:07:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7M89-0006eM-Ng; Thu, 17 Sep 2026 20:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M87-0006di-Vd
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:03 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M85-0004s9-6i
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:03 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2dd88a115ebso1150335ad.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690020; x=1790294820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uW6FZ1Hr/xnFGp6V/UXuRySYDmLzTaOM2yV3AYLNlL4=;
 b=DHgpaMCgl7JO2aeeg8RcrwWhM67S6LouxaP0zonBqZ6eIeTJYSxr9hKpIXkcQlUHeO
 8xf20Qbc81ia4AufPlt8NZh7G0qJMTKiFssERUvoQhPxCEKOjSpMbemZGniAeCg5bnd9
 S4+GAGbBSicfu1hDp+qXShbpmoaifjPixAu1etODzUb4iMJfCC4IxkKC2o/mh212u4Bs
 CuJjNPLpguYr7gTViU7SlrOA+2cG8b19pqUcagEJSvnyXKJXAFNxUJ7x/WoIu6IQf0KR
 grAnzA/iB9E5xsiWj3breJQNOyAT64NoQCt7P5niXXNKFYJKaxuXwBIapODvi/Eci48I
 Y9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690020; x=1790294820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uW6FZ1Hr/xnFGp6V/UXuRySYDmLzTaOM2yV3AYLNlL4=;
 b=ZjQvWrnHIZvAaYmC5pvIRwrbLD7drVLH587MgOP1Xv6OFjfdNfZt9lthXDXb2YzX9W
 XtPlk+vFm86LwEecNJPc3RJ7aFpXOR5uCO1GWJ5oKiOL02wgFjbF8S1Lu6EDm8tcihNR
 wbFJ3H6fhOup+wp9+tdp9URnTEdxbO+dZO7+e6HBMluJ55+BEVJ/DPVKMI3Io/T+urSz
 ZauGbxNx66jDoVhU2rNGd9nZK10VTFPr8uGrNP+lBz+oaIZ6h1y6mzVg1mGYPKZ4t1SX
 NIZ3M0+8TFC4GdSlbNk2IM/kD1CPH4dEE0vvonuEiDkYbnP1ioYynqdyxlG3CDCZfCbE
 Qw5w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9j8WuZKf5mRXbH+Iji3VD5usfAnx08+qZSF9wuDwMLcdW50NK5IGJg6/ElWymZz+5TweVK5FKyQ==@nongnu.org
X-Gm-Message-State: AFuF++n5qbTorts8gyfhdk7NpAKzKZlUmv10ygDmCVxLMM6paPDP2sYw
 j16J4kiSUOViMiINFtzx+nt2zrZQiwWZV6eNYMv4pqvyBu+4xy5A1aIV
X-Gm-Gg: AYBFou1eoNvHmRF+3klQ7hMcThhoeWd/Pr+iCOq0t2Pxsulme+rKhVRpJdG0a3xKn24
 jdR2W5wloS84rZUoc60aGm+VUs1H4hpuIkxwpgJ5bUEYIERu3QSLJe4AB5e/zb7TYZurbWB3xqh
 GLTOkqnghlALUH/MVMTZVeF7OD7MWEameDbVgJaC6npcYDBkd2JpVscvLQFDlZGIyiTSu4tHSsk
 5yJHDsA0MPz93rM5wse+cd72+OgD07rpj9+js2x9wKIfs+r/yIUofZ1wxSVMnSbZbGaN7WzKjy6
 a3397s6GHS1sG8Nj4D0E2ce7b5FbI3tuU2zcpgFiopG5zGyZajPEI6XnK/1HmOcwO5tXJraASfJ
 ooDJc/xwYgrYuiXOxyxnNtpuquHAYYlF5O7IcR/2zHWGbd2+DaByAb1HUU2bFdGVEWum++iK4fu
 JoP+TFYys2dv/iwwzxo1FWUg2ua5ctqdmIp1yefSPwJJUO84gEHJsYydEoSIgyYmZYIkpu2pZNK
 lC9wKv5irfX7PpjdjZ9iSBrXC6eiRD9dVQJEBZ7zlY=
X-Received: by 2002:a17:902:f690:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2ddb1ab3becmr16179265ad.2.1789690019662; 
 Thu, 17 Sep 2026 17:06:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:06:58 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 2/8] hw/riscv/virt: use unique QOM name
Date: Fri, 18 Sep 2026 08:06:33 +0800
Message-ID: <20260918000640.1001-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918000640.1001-1-luoyonggang@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x10.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use TYPE_RISCV_VIRT_MACHINE so the RISC-V virt QOM type does not
collide with ARM virt in a combined qemu-system binary. Keep the
-M / help / migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c         | 3 ++-
 include/hw/riscv/virt.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f6..b29182cb39b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1134,6 +1134,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->desc = "RISC-V VirtIO board";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
@@ -1197,7 +1198,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = TYPE_RISCV_VIRT_MACHINE,
     .parent     = TYPE_MACHINE,
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e516898f9ad..969aa5866ee 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -30,7 +30,7 @@
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
-#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("riscv-virt")
 typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
-- 
2.52.0.windows.1


