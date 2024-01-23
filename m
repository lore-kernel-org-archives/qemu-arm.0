Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp136315ejc;
        Mon, 22 Jan 2024 22:40:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoK8a/14jYF+JVHyC+pUMLTTk4t1O/ohPVTn19ad7BFHXCUUhSh/zkexRrlFKKewEgYGg
X-Received: by 2002:a05:6214:d6b:b0:681:7d78:6a48 with SMTP id 11-20020a0562140d6b00b006817d786a48mr385627qvs.103.1705992033725;
        Mon, 22 Jan 2024 22:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705992033; cv=none;
        d=google.com; s=arc-20160816;
        b=a+Z0XufUeDXHvPgpIhD+2ud85Ms3GsjsZ+6zH1CuJvBrWqeH2fsyn3tWRjlO0pdfsd
         Dp4RwNhC2sADzR1WMEwRXsNspYXx8/nepJYKcqsq80IHZ2R+eoPsC0ZZoj/pcvmIt2RJ
         j0PbBQ7nDJvSJamVdymUdN5yb+mZ3oGR4M6zX6OM+ZsHOoqM02CthD8M5kSYPDyNY3r7
         fmtz5inDVsnwCyiVScsxCBtSLeu7l7vIRJy+XDy6aJbnzhldCgcH2M8tJnk53AlKKpTz
         C7BsKT8tQ0EHpRyFz/DIyQh+0jKMJJWUUxtczdZCb8BhXVk992kvPsrLpQCKY8Qjo/rF
         2DGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=FyPUG9gNnYJ0jjDC4FiyhKXWgMhzGPrQ9xqUpXi4/ROIO4Cv37SEQJ99mNHwIPkMaZ
         EfFpuj+UAFk0yYUbFvav4sYkufL3uRvDpJJWviNhQCbi7ythw6gPydpr1+IjeoHb8T9i
         mao7J42xMl94TVE+zWBKLAj79a94kqTRKGaeRZjQl9xEkdC54k4xoq2kXnNPw6LneCQ+
         205Hr4WhjoV3C5K/3u/6R2BFWo2LylN7hqBQVZLJLeK7T0TrZBufR77yaber8yEw+O74
         xM/lAAL9Seu1r7bpWSE4ZGIT7oOJCxpD4buZpDdbJ6/ixjRxeCnT3EhPGBj/5Mf9Bxsz
         DtPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUtvC4xt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020ae9ea02000000b007835bad13eesi7117190qkg.736.2024.01.22.22.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUtvC4xt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSARL-0003kB-IS; Tue, 23 Jan 2024 01:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARA-0003Xg-Ew
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:12 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAR6-00084v-Sa
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:06 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so433118466b.2
 for <qemu-devel@nongnu.org>; Mon, 22 Jan 2024 22:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991943; x=1706596743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
 b=bUtvC4xtbaL2Z5BRd/WvRIMcbQdHCbcbdut6pEPkXQhjVttlsfAdN9HACh5f96SLc/
 Bb9d9pL6TRMs3PeUpZngTNxbz9QSWlE3mQZumdfqI+Y98+KwZ4FSi6tmsTUe9TAwt7Kd
 E6//oY7dkAK5OIaUaehWOaasXPzeT1JMB7aQ8zY8yrTRDGUf74nYav4bJifP8LzhPeRX
 DNOKblEF9g7tUPn2a90gcn/97C1GEcW+sIXQCftAnFxbSSVXdxJV1XsfMODf8ZoVIebM
 xMnnLDWC7oiaH7cTTBDyhCUBJdavBQ1oUXi+3t3/9gD1ig65q/CL1Dsi8UoGG2E0FfIb
 G00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991943; x=1706596743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2RjX1tFrRGVlM1BwnlKhE6JoLvLjIml7FEvFQ9cMoCw=;
 b=fWudRwvK6W9ixZgQj9kegYhIwLL3Wa5UVIgpW6Vl9cM8f31AJXFOeGuxZTq6y7+JKL
 2ex7K7le2orLikQ5OgK6Y/GHDNbUEqopePfj5u5Z0A/lbB08BD6HaHEo014dzcgLoYxL
 v7kTrxSMOqDCfw8qQevJAPPPc7IsANwhPqoOX0Xp3a7CfPLSNAwoTUqVfwl5WElkjYZs
 ppAEHAONcCVQE2i3VO27J2/mRUuoepcJR/fCN9W3uAU0T2Ht3o/VQtqqPnQ2lgTp0Ojh
 4JtLzWIUkkgyBa8YSyjJ5q8IYPdPbUrqUhKw4VAP+fWNGcIWR9fVFI0IUEcrIxSYc5C4
 9n4g==
X-Gm-Message-State: AOJu0YxqirAqifCjG7GKcnXNQ3V3Hp5gdL5itKan/IlzL3YTJkWu0R07
 uf3tJ6v1uNkyYusWAV1g1iseX2xLvgSU7ByF6Xt5YGLUUdsRgAo2oRGuNWKOq+KJBnUB4gi9c/I
 O/WE=
X-Received: by 2002:a17:906:ba83:b0:a30:d603:5ed0 with SMTP id
 cu3-20020a170906ba8300b00a30d6035ed0mr34022ejd.144.1705991943341; 
 Mon, 22 Jan 2024 22:39:03 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a170906271300b00a2ae0aa9002sm14101678ejc.40.2024.01.22.22.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:39:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/arm/vexpress: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:37 +0100
Message-ID: <20240123063842.35255-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UDm09mFQxCSt

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU types.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index f1b45245d5..a3561a1b56 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -783,22 +783,32 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
 
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A9";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a9_daughterboard;
 }
 
 static void vexpress_a15_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_CLASS(oc);
 
     mc->desc = "ARM Versatile Express for Cortex-A15";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->valid_cpu_types = valid_cpu_types;
 
     vmc->daughterboard = &a15_daughterboard;
 
-- 
2.41.0

