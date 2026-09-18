Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E261C982D2
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:09:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7M8f-0006sM-7A; Thu, 17 Sep 2026 20:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8Z-0006ow-2a
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:31 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8W-0004x7-BQ
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:30 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2d9004a1ac0so956585ad.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690046; x=1790294846; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2QNZBjooEwaWCMUyoLrrVewBfsIr1xO0E5E0pjxZJzw=;
 b=SVSot5PSq62zziBGNgg99RY2Z4BCUPzotCvLZb4cSLIHZfkd537YHAbQsLMq33sF9R
 /wog6PJR7Es8OE+MCewPiNZbypv7U1eb9EAbQUkzINGltIsMaVJPmeSkwxvWenCHAfgJ
 i2iCbiF93vDttFlSefZI73YiW7199Q4ZwI9hL4OasmlE2/yqBQf0qhetH1d5TTw1Jlfp
 mDQJnPN0DbUmNOBfsWEf+dzyQKRaYzCok607jjWJ6KlRlZvnze1I6EjuFEzxcYpIB6x7
 fCWO9T0FbJWMMFi4gVwS6+7Lb+lJMKLNEr4O4FIuEzqdOLXAFMm3vKS++WAsJrushuqa
 uucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690046; x=1790294846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2QNZBjooEwaWCMUyoLrrVewBfsIr1xO0E5E0pjxZJzw=;
 b=oxzWyv07yqJdeMCD6ledryA+6GcO+GJEB/KpoComZ3HQamgORgJu5/41Di6ScjTSD7
 n6cQ8LIXbt9HqNp0pAPxXgaUS0psuNPtTc+AkhlCJDcf8joOFxx2LlWxJLomfXKuAhpY
 F4na5lxqlUoQUDw2DowQQb9XIeZEVsc6DMwCIUmk0D+Ckw7JF8GcXsBSBlDn+TXFbM4D
 PbXeY3eg5cxpMr6iDFVmm6dsGMkKYdhmuHDBJzVfVORah2qzchCmJud7bwjInSPSOmXY
 4gH4FRsetGI6fp4FK3mPY2V7ijetnURdfjijU35yzmVDzLTyplWov6cw9BZ7InBYrm+R
 lziw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+p4tI+7gwanADxLYI7tTyJsLWluKhyRSl/gunQoB9ylNw7EX+G53+t5Z3YZhKZQ2XYHHOWPJ8Gg==@nongnu.org
X-Gm-Message-State: AFuF++nmTszGoQys/JSKiJCxxH2k5g6JI0zgY3yAcQ8/2iz4nK5EJXKz
 Fun/hlIVh45VfiABY1p2gb0gc58SFN8220ooDtaPkPREy84f4+gE0W7h
X-Gm-Gg: AYBFou2GgpLHihYGpJhGBeQV+WyIofOJ3ZP0MHyTP/QMFz1raNxvE36s3RE8ftcqM8Z
 HoF+Ud4Rb77KVPVYA8OYn+PJCeFpM/TS1S2vrec290fLPhwfVRf8BUC2yHpUCIH9wv5y1LDyxyU
 MsXH0ol+zllP8xmItltx28AeTsW8xYkyvfg8lzSskgD8XWatlZstsY0+mOCmQx1G3Ags56MqCkc
 JJJDYLfwMev55/hrx+4UquNlGYQ17BJlCvvx47o+cou7+FRPrdfOAOMTNqdB4V/K+oVJa2DTa2H
 0tZ258qNcIxm8PxWkvwGBEx2noFK6kPCxkFX4tfYdzZo5b4lBOQXllTWuiTWWo6o4wJ22wCOMdj
 6BaazOFjs+s+rHmttt8dmAoJYNqfmElKUwvMcutzbSlopa/EPjuogCkskMq+vzeq8ORCGN8VZ9A
 toqK+KX1fM66G8X6/tAMsODFmt2BVnhKAo68Ef2zQOaWRBFskneJe5wKfiIFqlxoyY+fuQ083vK
 TWjAS4pbVF7F4bEVWHxALzHuMlP9tul
X-Received: by 2002:a17:902:ebc7:b0:2d6:ff5f:eeda with SMTP id
 d9443c01a7336-2ddb1a90bfcmr16101145ad.6.1789690046041; 
 Thu, 17 Sep 2026 17:07:26 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:07:25 -0700 (PDT)
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
Subject: [PATCH 7/8] hw/m68k/virt: use unique QOM name
Date: Fri, 18 Sep 2026 08:06:38 +0800
Message-ID: <20260918000640.1001-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918000640.1001-1-luoyonggang@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Set the parent and versioned QOM types to m68k-virt so M68K virt no
longer collides with other virt-machine types in one process. Keep
the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/m68k/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 274970978ff..1faa178bdfc 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -323,7 +323,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_info = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = MACHINE_TYPE_NAME("m68k-virt"),
     .parent     = TYPE_MACHINE,
     .abstract   = true,
     .class_init = virt_machine_class_init,
@@ -345,14 +345,15 @@ type_init(virt_machine_register_types)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " M68K Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
     static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
     { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
-        .parent = MACHINE_TYPE_NAME("virt"), \
+        .name = MACHINE_VER_TYPE_NAME("m68k-virt", __VA_ARGS__), \
+        .parent = MACHINE_TYPE_NAME("m68k-virt"), \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
-- 
2.52.0.windows.1


