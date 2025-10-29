Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76181CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE6x-0007ev-Ip; Wed, 29 Oct 2025 17:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE6w-0007e7-Lb
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:53:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE6o-0007uI-VW
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:53:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so1913935e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774809; x=1762379609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IuzXfYtFtGeolSJyrOSQ3n8KrRKZEFt8FOM0hiORo4=;
 b=ydDyWXK51Esb3SqVpBbkh9UWoURg/AqFGUuWhEVuWKMuh9n8rZUwPeTwfHfEb+gbKK
 8W2DCR2m7Sc0r9zbA0ysO3xUjwgGTrji3FoyStk2cFvU8aJGVe8A2wH6Me8iDuXtjNr1
 jDMxgM5/N7JB5Wb5ZmcBmKEOYk0HviIvVQAMG/021RTmyPi+GTChzXFNjS95kmJxel7V
 dyBPhCxPRMhW442PQvx81o3CBnNN1O7bATwewZMwdQi09ZIWGFWMmYZZIvp81a/bnvEE
 n34L66upcj/5PjpAGHalhrM5R7Apg+2w//iYPeCsLLOts0ctUcd3tkG6R0Z7Vat6Erg1
 n30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774809; x=1762379609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IuzXfYtFtGeolSJyrOSQ3n8KrRKZEFt8FOM0hiORo4=;
 b=R4dKMquWDyLnkEk2ux0N0wiqs9js5/6ptTr+Z7o56Qz94mV4m1gG/y+jDTPyY39plt
 1jwSUeU7x/pHfMJXbiuJB77ttYGN8qFRhKk8gz+YCJs2BqSOSZjKBZDCeOI4vSZwMVe0
 xz9mkKaFIEXUg6T14Ltdrh0aW+QpQkc/08ffgqWjorUjYe5Ocw0RNRrGv76tm/vZmj9a
 xT0j/HKzLhzFHBcEmbRikLG6tXEYDuho0D8GexhZyloKrTJd/r6FUlaZnCmubBtOK0Qw
 Qs+kKHFZCi9ofwgYilQPuTgpPBHcOmok+Z2G5Y/NtLnEzS75EyPxvAJZJl+6avhA97/p
 t1Yg==
X-Gm-Message-State: AOJu0YyxLLbXgXauUzYma1z9fECOCLB0dFJfpB2JvV28vsrtyojU7RcY
 SjgkHxPYSlUYptK49tW5pmGOol6WTSsCRZElso4RR/FL6P5kVNmM4MTkv19hhOO30jmWVyleptJ
 uX3SzG9M=
X-Gm-Gg: ASbGncsSoubrxSRr3vkHtJ4Je35DTmKS+5s44Owjgac6XelQRhfRFvNIFWNYgL3mMDj
 JBJNYQq+8ZGaHAF1wAG83oQD1215Y4QgTwwbhImWDD0Qvnp3HoyAgjCyHyUHGlnDPOs4YT8gA4+
 TCoEN0Wy91GrpIDh1vGcYmfv/xW06KWuGmdJ8wPuXdTwhFeNOLzO0uwL+17WeZSR9gAeYCHgSjd
 4kdEbGnGZBcnpdu+M1kQcb2d6lsHc3lLAVQXswI6nUEdqiX4VfoCj4Fkxafe8q4v8qlZf4LO1W8
 6sv+tsl1yUF3Tqjnc59y3BiG37G/jUctWE1bH7WqMTF9nA5SdTHk2j7Hjzyc1M97ee0cx/Sg90D
 OfIRHs2U+4cFWvuQzXD4ae7h2QsVW00aAruQU1hlYOrwaOF3CGUIpECEZnwyfPeGCUbrnvY4zUX
 FhRFcPs2VQwX5Oepf+Y201/13SrTUQJuCX/UOZbJgq2nLGvQUneg==
X-Google-Smtp-Source: AGHT+IEbCv9u46QjKnA4rQkkvi3GpFj/ow6eoLMh3K0PHF3wh6oDrcUw1YVhVtjAlpwb6ICi2ZtJIQ==
X-Received: by 2002:a05:600c:4ecc:b0:46f:b42e:e360 with SMTP id
 5b1f17b1804b1-4771e1f3e35mr37477755e9.40.1761774808573; 
 Wed, 29 Oct 2025 14:53:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47719004d79sm52860015e9.5.2025.10.29.14.53.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:53:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 13/23] hw/arm/virt: Get default CPU type at runtime
Date: Wed, 29 Oct 2025 22:39:50 +0100
Message-ID: <20251029214001.99824-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Prefer MachineClass::get_default_cpu_type() over
MachineClass::default_cpu_type to get CPU type,
evaluating TCG availability at runtime calling
tcg_enabled().

It's worth noting that this is a behavior change:

- Previously only

  ./configure --disable-tcg --enable-kvm
  ./qemu-system-aarch64 -M virt -accel kvm

  would default to 'max' and

  ./configure --enable-tcg --enable-kvm
  ./qemu-system-aarch64 -M virt -accel kvm

  would default to 'cortex-a15'.

- Afterward, -accel kvm will always default to 'max'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhang Chen <zhangckid@gmail.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-5-philmd@linaro.org>
---
 hw/arm/virt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dda8edb2745..d07cfe16512 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3257,6 +3257,12 @@ static int virt_hvf_get_physical_address_range(MachineState *ms)
     return requested_ipa_size;
 }
 
+static const char *virt_get_default_cpu_type(const MachineState *ms)
+{
+    return tcg_enabled() ? ARM_CPU_TYPE_NAME("cortex-a15")
+                         : ARM_CPU_TYPE_NAME("max");
+}
+
 static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
 {
     GPtrArray *vct = g_ptr_array_new_with_free_func(g_free);
@@ -3312,11 +3318,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
-#ifdef CONFIG_TCG
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
-#else
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
-#endif
+    mc->get_default_cpu_type = virt_get_default_cpu_type;
     mc->get_valid_cpu_types = virt_get_valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
-- 
2.51.0


