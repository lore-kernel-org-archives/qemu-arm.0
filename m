Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FDEC982D0
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7M8V-0006ne-8o; Thu, 17 Sep 2026 20:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8I-0006gJ-3J
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:16 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8F-0004tw-FM
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:07:13 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d8fbef5018so2258405ad.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690030; x=1790294830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=CbirgYWo/IaNM6BqSpiIi2al91SlJlRMMol9gJsHm7A96+QmMsQVD6V/LI537MY31G
 BEZf3juv52688sY+tkUlc/quCJKuPZpeLTJW0k656iP9mUqq/kEfh51/34okcQjsvJmq
 gMUreU3TQSLofCADezP8o5FHgxS1co1n+H9kTROHk0aqxIqr5gLlRqaqaNr6zqN/DJPY
 mGy8UTGf8/dLJK7Nt/WCCw38q7+MoCCnv9qjIkAv1Xd8J3Hqmmp6240X9ckIAS8IaAj9
 B+OCJUTVoGkbUpX6cjkIZ4XyCbbtBd6z5PH6sJykmZKsfxl0rqC818l2yOYdWm9J4jhf
 qrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690030; x=1790294830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=QTPAkjuh0CS2OuuqCx2KMX+V7PKpolzjV8GBVsic71WLjEBwSG1lkR4zeZY3fkuTeX
 0JBsg+WfX3h48aQ+hW0YlxDs39/XFgGrLYu+aXJGQPyl690am2OPc+Jnw8pyGF0pzxAX
 B4pQ+sSmmBw0hDmcFm5L4D8dFdmLdWTVW3j+rmvHJJB9ocakcMJpW7iaypXsbQi4nliU
 /Rl8lmgVlRMQyTl8DLKzzPzrVGHCuCQ69pjO8ryVjmhWMTZu+Gt6JqScHC10qipJcNxU
 KoKTm1jEfp0gvTBglaEdQFVzYsrwv3if9TG8TIG0m36E11dYOs/CBZOgy4sklLx+k/z6
 Ayhw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEhibtnXa1w4lsdxux+qlMxG14hSPn2qOKmuxGhz4EVGungepYoM9iUU6k2IC2H1e7V4V4Lu1u3Q==@nongnu.org
X-Gm-Message-State: AFuF++kypk7IP+qWYlEQzmouhZ5dXAvBaCdjU90+vio6JgjlzAzTbNxC
 I3PueSP1pYB4+CYg1i97XuCrXAZS+HMmVHWdIRC4Z/MJlMbfWTfujAXg
X-Gm-Gg: AYBFou0EBZxbBsxWnuW3qNY5RmWrpI//NS0BBXipGPHTnFd7sWq+CzbfAvu2PtXyZNq
 VK/bdkr7lbdePL9HMf6pox6iFva7dgBoXEQ9FI6ElqFnL1CiwFJMKkJ+wSW8XVv4mVsXZ5Z+Fuz
 jax/a9F9SlAhLlGWyWDCuKWjhL+aHID3S5WGbKcN1GRjQwEQSesrQSrdfDxSnytNcC9RRakBryW
 Sj0uEx/rMuDvelnykE2yWybiGRZ8WyJa3BFBZ5BOl76micKa8yndeYfSV0rLR34U2RhFPv4Iwoa
 s+V9LHuXUDjsZRRqsnZhK/r1Gegft5xK/nFkXFECNV4wvKHjHvYojaXoS63PedHSwWxgpD01nrM
 0jS4MdSz+jiqaT+PAD4T7ExWRaHI0IKtv7LKJQPpJWoTbgh6NpNqwBapjqIVKVmHjr2jLZJdUbe
 SeyWDESygNlq97zWk1N7MNSLqdrNQHVWGlUW4AKXZ2vjyJIppmUB1BNgHvphv36sbvrWfRxsYWL
 am4piSivLL6xUSENIzmjiSwv1eoAON9bix37uOPWls=
X-Received: by 2002:a17:90b:224a:b0:39e:4c81:6c99 with SMTP id
 98e67ed59e1d1-39e54fa5deamr1509803a91.31.1789690030121; 
 Thu, 17 Sep 2026 17:07:10 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:07:09 -0700 (PDT)
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
Subject: [PATCH 4/8] hw/or1k/virt: use unique QOM name
Date: Fri, 18 Sep 2026 08:06:35 +0800
Message-ID: <20260918000640.1001-5-luoyonggang@gmail.com>
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/or1k/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index 2ff5c084a2b..35884252379 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,7 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("or1k-virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,6 +548,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
-- 
2.52.0.windows.1


