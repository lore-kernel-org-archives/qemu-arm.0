Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156A5D61015
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:50:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSPe-0007gp-V4; Thu, 29 Jan 2026 08:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOS-0006uv-0K
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:49:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOQ-0008WE-4q
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:49:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47edffe5540so12603595e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769694544; x=1770299344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mthODcg9hlTzsusCMXOwt1IJq/K8Z7UN2QMJwe93wI=;
 b=pcIBR0eA8ZulSmwe7R/mm8OWq7mkdyRcxiNQwPFolxy0+TripMVBMbTsy2NhrgXx93
 svLf0H04JfBzC5viJZTsHTOWbo1WGk/jhGeDTNFVQq4eQs5w73Z6PLTT4eG3ycj9Mcjv
 kQYmu9bgk8c1E75Ca1RMeSBWrwfCYDtfwzPhrbhoL9qfa5bAGR/3+iXHT/+M+XrhOX1Z
 jnpJJDJamgvguCSSnaPI0vV8RpzMJPtTBPknggDvVifFEuNNnSNUAi/wG0wS5O86hulH
 asxzBq2DAM5bjTMywnr0RlieAjGUZX7J5VYADoSP35xPuhxDtp14zY0zpM4+ED7p8HI3
 G0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769694544; x=1770299344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4mthODcg9hlTzsusCMXOwt1IJq/K8Z7UN2QMJwe93wI=;
 b=OTpU8M+NxQH5Z2Fkvkt1213VqsG1NDXkOOWvlxvgrW3uHvz9T5qI6S1W73HFGcnmDd
 gv8GLBkJdbJJuPhivu7q3u8X2gvKkoK492w1gIMmOl1opDYFzXiwcrEklbEWM+wKvZEk
 G+Y+LM1OvRH6KhvO0OOp/byCTRz8oU9ABR9TV8q4oOdJ5BFk0RqJ1jwEd3+4NPPi0Zts
 RE72Oxn4yye6XGJT9Z3BaQ0uVX1hP3kcldACViaN3YH2qUh3pIN38l3plHIcfq5sgVSM
 9M5d3Jv3qeyfmOWOS3hOnBH/iN5fNfkBEkK/03MiyU/bkAAHjAVH5bnrmwtJCM7FpCHU
 CQZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKWFFT8iOOdA5q66O0gxsPw2S99h4gTLl2h0a4MDNvdihpFxwZcw7p+35XuWF4BqosI5qFtyVGJA==@nongnu.org
X-Gm-Message-State: AOJu0Yy1tCKqMvZJj56xRSCty2Bb1FNPq55s8F8orQrk9AiOzXtMCb/2
 adBsYrVB6EYAFsOllBz8kzl6AVqaHTw8Vb2xhBsyNApyQlwt2jxQDQCUfomfcp+SQSU=
X-Gm-Gg: AZuq6aKgX50dEBcd2EtKGzpinaICzFakoZeUnFH31/m59Cd05tH71Yw6kQfXs+OiWJR
 tIFal56zbqVIE53dxqoQgeJUH1aj8DdNumV6k62FxfV2a7ClCxlUu0nykndGddYTC7jb0bOp4vt
 m2eAyovfbk6VMhNgZU75tUvLkEmhIBOIp5KGcbf4ZfQ4t02JmwZb+5RGa6Ae+8Nnq9+gEfm8+3+
 PevkYRu0nkCx1EIYDhh3GaT6v5RtLbFQnseXvpyOxjxvLHZr4TUYAeLhLrlUHs/oWq0cd4RrjNU
 3H8zzpTOOiCflO9RlbFTwPowF4KrZZYaF7G1h6V+UXFlNurXg2GstxhjUHyhvxAtGHWzrHPo5rW
 NuLcehLBBy11DSSH/2q1J91BsZDYt8zZ/VwdrLOUcd0gBtqY9qnf/iWtRBfzl+5H4oVC9GHXIQy
 PeiuLB8A7LkSNFFD2T8c5BRGyJFDg+VpeTJe1Y587WktIqsAYlHifK2z+KPNiI
X-Received: by 2002:a05:600c:450b:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-48069c21c40mr122609945e9.16.1769694544518; 
 Thu, 29 Jan 2026 05:49:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c428basm208152365e9.12.2026.01.29.05.49.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jan 2026 05:49:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] target/arm: Deprecate '-cpu any' (remplaced by '-cpu max')
Date: Thu, 29 Jan 2026 14:48:49 +0100
Message-ID: <20260129134849.36557-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129134849.36557-1-philmd@linaro.org>
References: <20260129134849.36557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Since more then 5 years the '-cpu any' is aliased to '-cpu max'
(see commit a0032cc5427 "target/arm: Make 'any' CPU just an alias
for 'max'"). Time to deprecate the alias so we can eventually
remove the alias code. Emit a warnig meanwhile.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 8 ++++++++
 target/arm/cpu.c          | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1d5c4f3707c..c544f23cab5 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -181,6 +181,14 @@ is going to be so much slower it wouldn't make sense for any serious
 instrumentation. Due to implementation differences there will also be
 anomalies in things like memory instrumentation.
 
+User emulation CPUs
+-------------------
+
+Arm 'any' CPU (since 11.0)
+''''''''''''''''''''''''''
+
+The Arm 'any' CPU is an alias for the 'max' CPU. Use the latter instead.
+
 System emulator CPUs
 --------------------
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6e1cbf3d614..2cf3273e8ab 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2218,6 +2218,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
      * which has the same semantics as "-cpu max".
      */
     if (!strcmp(cpunamestr, "any")) {
+        warn_report("CPU type 'any' is deprecated, use 'max' instead.");
         cpunamestr = "max";
     }
 #endif
-- 
2.52.0


