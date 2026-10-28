Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAD606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m93TdaKW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4k-00058M-B3; Wed, 28 Oct 2026 16:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4h-00055e-Hb
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:43 -0400
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4f-0002GY-AB
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:43 -0400
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-36661f953e4so2232837eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218600; x=1793823400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=obAwicYQArWnw8mdM95mb/RZp67/7GPYWgLKlbu+5L4=;
 b=m93TdaKWpxlq1SrL06/yZi3GhlLaT46g/ce3U12RM5aCmVTZ3LFuUEwbhCANuuO9GH
 4fvcXB/rOavcCzaHhmbsAKZhE7Mz1f6gVeAmCgQRPwChGhZWL1uqPPl9uka356ZE8kb6
 a2mAFe5uLjV5Lhv2LxHR5dVQO1rHCfWAEXIQY3OzMnjBZUMppuVPCs8YI9QTF64KWMCs
 Th/pQKSP8vCaxDjEfHvV7d0h0dq992102eDbR43GS30F61P7cmT2ht3JIODjBZPHd1OG
 FnGTpFjY7ekY9M73Fgs+wPLQmKzpwFfIuFcV/V7cLm3TJ1EOyp4kEysacE59chgNPAlx
 KERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218600; x=1793823400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=obAwicYQArWnw8mdM95mb/RZp67/7GPYWgLKlbu+5L4=;
 b=btGZpfzTKoRMZwKDpNGnt2Oz/mLQxxcIMwwATc44Tf5B0mZyHxJVgB0CkQCgQ5HFi7
 FWIfUhZeOqK+JcVpDaaQMZHrstViOmfdqrcZNiAjMdWo1Uwyxpy4ea/ws89a/P3jCWvf
 waiAZqHG2+oiT2u5qm7f2IzIbXnn1YM7IAfd63Y8BmOTIIIEbS2oLJeX+8tFoy/SiuYB
 qai2SJhOUu7RPpPhCKrMDA6yawzqQTMIsZ0zNEdzVgoPq902flmlHH8wcu719Tofl26b
 xXBzvA5XU/q6KqNX9BbpdrUpgN839UQ1L7OfnFc6EgTD18+sxICvXQKi91WsKC6awTBq
 1KZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzp3YZlpEzazm0lYSWr81aaCj5zPO5cIls9XTpyEeFOLEbYp8BKgKXvuL0nfqbz47PBiTq8525RRQ==@nongnu.org
X-Gm-Message-State: AFq9FYLAgN6+JvFyan6gDRRl2NcIpYMng8Nu0OPiix2mzc82r7d7/VW6
 EkxVdVEgiXU5ZbdY//2b2cHjqEyjFNEgqyp0ZBBdx6Ba8AshfLCJNAbJ
X-Gm-Gg: AYBFou2gb3isSbo/T4sB/4jkAaDleh/P8zWhXhIGIHvIQta7RsB4+H6A/8KlQkmCgQH
 KRdEz9o2KS4LziZrXdXBJWxaVHQtyZMBkbF7hp6sKHe5UVSlcgkkJwL9+xb3og3/h5vop6LFoV6
 846oxPanAV+Sw8bmS+LAc052J1S9qJ+na8xKPlFBLuq7PdzN04aqcJLPtn5BelPBs1BnTeS4eFe
 Ow9a7Wc8N2vfoEX3dcSAeTHg0dE+eXbySsmCKpj+9f3jJmvbMuXGXJACTfMbzIoUpXG8m1JVrjA
 +oF/7E55AYLpHZhVySVg2d/jLtt+ou24QjkMpZKYJsWDNGuG0/9pJDFtOpTCs7yhufB2elApgy0
 TtSYjkAGER3+VNLYgPCcAbqNYr9Nml7dqbMkzOUmTmF7clMCI4uBfgVz1k0toHl4i8KXXWBmrWZ
 //ePhYPg29oJbQXJrlcCP9e8ehMYXB8gShQjMt9F4pVOF8vn/D0+svsrHjv6IC3LaNepYhGRBbR
 B0x459uVkOA0OQiG9IbeddoICwKfePTWtegxhIlDEF8iduejUzly83iebWnMLI7njLJYBYFD201
 a7UyzDm6jGsRFBnock26S2BB5hdqATw8J/UdqQxAkZQ7j+yu
X-Received: by 2002:a05:7300:7312:b0:358:ec5c:bef1 with SMTP id
 5a478bee46e88-36a204773c0mr6758751eec.39.1793218599863; 
 Wed, 28 Oct 2026 13:16:39 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:38 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/12] target/arm: register separate max-v8 CPU types for arm
 and aarch64
Date: Thu, 29 Oct 2026 04:15:49 +0800
Message-ID: <20261028201557.2688-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132f.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

max-v8 was one TypeInfo whose instance initializer was chosen from the
selected target at registration. Register both initializers, and let
target_arm() and target_aarch64() select which type is available.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/cpu.c            |  1 +
 target/arm/cpu.h            |  1 +
 target/arm/tcg/cpu-max-v8.c | 16 ++++++++++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 510fc9eeb3b..6eb55242980 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2695,6 +2695,7 @@ void arm_cpu_register(const ARMCPUInfo *info)
         .instance_init = arm_cpu_instance_init,
         .class_init = info->class_init ?: cpu_register_class_init,
         .class_data = info,
+        .is_available = info->is_available,
     };
 
     type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index add993ef101..3240a8633ee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1203,6 +1203,7 @@ typedef struct ARMCPUInfo {
     const char *deprecation_note;
     void (*initfn)(Object *obj);
     void (*class_init)(ObjectClass *oc, const void *data);
+    bool (*is_available)(void);
 } ARMCPUInfo;
 
 /**
diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
index 65f851f2006..e819d07e6ce 100644
--- a/target/arm/tcg/cpu-max-v8.c
+++ b/target/arm/tcg/cpu-max-v8.c
@@ -121,10 +121,18 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
 
 static void cpu_max_v8_register_type(void)
 {
-    static const ARMCPUInfo max_v8[2] = {
-        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
-        { .name = "max-v8", .initfn = aarch64_max_v8_tcg_initfn },
+    static const ARMCPUInfo max_v8_aarch32 = {
+        .name = "max-v8",
+        .initfn = aarch32_max_v8_tcg_initfn,
+        .is_available = target_arm,
     };
-    arm_cpu_register(&max_v8[target_aarch64()]);
+    static const ARMCPUInfo max_v8_aarch64 = {
+        .name = "max-v8",
+        .initfn = aarch64_max_v8_tcg_initfn,
+        .is_available = target_aarch64,
+    };
+
+    arm_cpu_register(&max_v8_aarch32);
+    arm_cpu_register(&max_v8_aarch64);
 }
 type_init(cpu_max_v8_register_type)
-- 
2.55.0.windows.3


