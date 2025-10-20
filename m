Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD1BCCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy4k-0006Qu-SS; Mon, 20 Oct 2025 18:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4j-0006Qc-U1
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:09:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4i-00063D-93
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:09:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so3175429f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998194; x=1761602994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6P9UIa815BoFMfvuHAe0eB6WpnwGzSLVK/UX/75kvXQ=;
 b=e5T6Q8+mRt2OLkMW7564zXF3+ViSizdSHncBEIq7K8Xe6smPwhxnUK9cVv6whLFLbM
 uRdW1q6X9eCK1AHrPFm03NXFGdaOZBtpxevw1SV6lxnh8gBXnk1ivxPpECvIy/Ow28JU
 NK2cn7Kd4thIvSwYcTqPT1reps3OcCazCWU7pSazN532A9AJgQll+PzJM4rzWaSGINM9
 akW9ODFr8ILLMvGPJNwbFKa0411PEbha2q6yq0u/F1JNqkZUJZhmaRRgQQqSdHkqNtv2
 uIhi46tsLcUI3v7R1SI5eO+bcelVzoWJTxY8prrkxPMG0n5urV3sK4LurB4MI8ryektf
 SXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998194; x=1761602994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6P9UIa815BoFMfvuHAe0eB6WpnwGzSLVK/UX/75kvXQ=;
 b=xGH8xzbpJ8fbOqNmCG4EtjI6qe+RBngnE77vdtpV+hCzOPHjmY29MD/iG0lRXrmOrj
 PNt3zKlJowV669NPJf7XCvOUMGXJ++CBJnFLjDHSrHiA6ihJLMZDhHIX4Nl0urWcP4Uf
 H8soIZrwiqk0CYVArgQVzGll1ei91IPCHbuiMScofQ49ogF6N9qruD0cvGHK6T4fHkQq
 biL/ysSTA7GDfxRE76GEy1Ztcr59b6SLSnThpvPVeDm0/Gq/1++L9k85cC3Mv2AJcWAg
 GY4lR0B95AwV8S3q4+BNzvpExqYRlVS2hhiD6FYr0jqb+XPkxAdZ6tqM2VV/wn4zlfD3
 icYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGbwflPh4gQSy7hYBY3/Xv5EbaA455Aou3zqDM/LfHWUIqAr48UcOCyWuLdPej+HFHi753W969WQ==@nongnu.org
X-Gm-Message-State: AOJu0YzqGu8Mw4E7QXdqU2mlzntWIVvxZoWuov5EwzeXVfABxvy37D71
 fRhH5pffeLXsuLym/HfB1xow8Wz6IbfiucoTdfUJkM+fKxYJO2/3luYdOZZKf+YoGlM=
X-Gm-Gg: ASbGncvGNX8QSfz5MQZevIMhoxZECj/iR5zyeTdGHGjRfmy3UEsNtowOUdMjBhM5fjY
 ZzKgj3kII//lSsVLhULPhifX8H0zvph17p/+ldOyXmWu9M4V/DBHwSvTadPml1OU+78DOlx8Jyo
 4mIlbgZzSxGbo8qk3Uv33aq/8c7M3PFWpRgnU6nlb8JCr2lvuxLU2WIau9VmEIzMZ4/kZoNwXHL
 g3TSgUd9DMLqYtpywPApBvW5sRrLb112CXhHaZHylC2Du/HWOBD11bwoaXs81E3l++tsQ5zV1ih
 T8kh/u4otN7NvzrFZ7NvY2j2xNKkEx9Bjof0mkjer4541NFLPpFlgTnjITcvR7Xa809u9J7ytLU
 +ORCmlf047Bn+DvIWLfJBk87Cr2hGYpkHIT7xwCUDEfGoEFOf/UEpW9FyxCgY3gxV4VE1A6gyhX
 Gjyyhs6HYhkWHJ4SuEDRzm290ghgZhE04erfMf+d3pREwa+5aYgg==
X-Google-Smtp-Source: AGHT+IE2Uoq5hN4doKbSKcD358Qkz4tLJtvkVmPAjMVM//DTLHuBjmNj+UMpaVMK/oUu9y3zX108+w==
X-Received: by 2002:a05:6000:2384:b0:3ee:13ba:e133 with SMTP id
 ffacd0b85a97d-42704d83e59mr8910249f8f.1.1760998194608; 
 Mon, 20 Oct 2025 15:09:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f19sm17335233f8f.9.2025.10.20.15.09.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:09:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 02/30] hw/boards: Move DEFINE_MACHINE() definition closer
 to its doc string
Date: Tue, 21 Oct 2025 00:09:11 +0200
Message-ID: <20251020220941.65269-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Code movement to have the DEFINE_MACHINE() definition follow
its usage documentation comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 665b6201214..67c94bff1c6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -503,6 +503,23 @@ struct MachineState {
  *      DEFINE_VIRT_MACHINE_IMPL(false, major, minor, micro, _, tag)
  */
 
+#define DEFINE_MACHINE(namestr, machine_initfn) \
+    static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
+    { \
+        MachineClass *mc = MACHINE_CLASS(oc); \
+        machine_initfn(mc); \
+    } \
+    static const TypeInfo machine_initfn##_typeinfo = { \
+        .name       = MACHINE_TYPE_NAME(namestr), \
+        .parent     = TYPE_MACHINE, \
+        .class_init = machine_initfn##_class_init, \
+    }; \
+    static void machine_initfn##_register_types(void) \
+    { \
+        type_register_static(&machine_initfn##_typeinfo); \
+    } \
+    type_init(machine_initfn##_register_types)
+
 /*
  * Helper for dispatching different macros based on how
  * many __VA_ARGS__ are passed. Supports 1 to 5 variadic
@@ -762,23 +779,6 @@ struct MachineState {
         } \
     } while (0)
 
-#define DEFINE_MACHINE(namestr, machine_initfn) \
-    static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
-    { \
-        MachineClass *mc = MACHINE_CLASS(oc); \
-        machine_initfn(mc); \
-    } \
-    static const TypeInfo machine_initfn##_typeinfo = { \
-        .name       = MACHINE_TYPE_NAME(namestr), \
-        .parent     = TYPE_MACHINE, \
-        .class_init = machine_initfn##_class_init, \
-    }; \
-    static void machine_initfn##_register_types(void) \
-    { \
-        type_register_static(&machine_initfn##_typeinfo); \
-    } \
-    type_init(machine_initfn##_register_types)
-
 extern GlobalProperty hw_compat_10_1[];
 extern const size_t hw_compat_10_1_len;
 
-- 
2.51.0


