Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp244152ejk;
        Mon, 29 Jan 2024 07:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN2K6dCHUjiP7CSkpfCSJLMU7CUDXPJfon5dFn9eSDDRuHASKmKnuGmu9XECIt9XoE3zlf
X-Received: by 2002:a05:620a:565:b0:783:6ab0:f15d with SMTP id p5-20020a05620a056500b007836ab0f15dmr5570464qkp.30.1706541638253;
        Mon, 29 Jan 2024 07:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706541638; cv=none;
        d=google.com; s=arc-20160816;
        b=xKlNoZT4EAKsXws2ooaY367o6D7E48pU/oaQmpFroxhYjIjfb3nof/4gLAcEx7MA+M
         oNCU3Je8GY8nl6bWyqiGZ5bZxGSk77tyNazAcEDAq9N/FSn7MGSZPe99N7zedYVrJDTF
         NFeXCnopJEDW+tiBq9hdPeh2nB66iVXJ8WrUBNu6LaRkM0DQfVzRuU/L0ITHW6KAOyHg
         pD8HoRSCbtFzcdSkFD8+CnyipYebX3Jt4zUH9YuNgMQOEmVn0uEIkCQCmcB9CTufG/Ip
         i+Sv9rAY5cdVS/1mv+Xs6Xo1Kh88pUKbJGj9gSBvEu8PFJu1s6OHwf0INzABzeDMI0A0
         as0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dcxTw0DrdmCPot2iJuF6Ul0G9M2q8XR4FUwWiq3hCFw=;
        fh=36wJ/nYrPLZmRQQgalgeL37C59AM5Zbikh1oCIbsvWY=;
        b=mi/UO4Rc44Vv1YH4XEOz4TrSgrbL3k3YR01ObzsKpKX+curQ+d8UI/Wscsox7adHyR
         KgzU88ZRuIVhMIDX3vp0FHpUFIFH0Dcs8x+RMDRuFUhRriIkpIyWK6tSTnHxXcC1Y765
         tRI1ExDF8XtKoylBYyumXgf0tTBGS4xCqluFoaym3VL7+MKf1jGaMbcrntRIjXM1scpC
         AnWwLKrplTSpEYWsJP75KXjMWz8GIHqEjjNzurvzoHjCsKwxqTXldd3zoWcz7JBBy+oZ
         OVnWGcW4RgbSpmhgwxndPaEUit+HJ0wMOfXzGv5l3z7ty842H6O+8s/jPHXW7ON3aXs/
         qA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kx01oTFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020a05620a245500b007837f71c062si3928900qkn.56.2024.01.29.07.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 07:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kx01oTFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUTPh-0007cM-7k; Mon, 29 Jan 2024 10:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPY-0007Wx-5I
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:19:01 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPW-0007SR-E7
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:18:59 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51028fadfe2so3118853e87.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541536; x=1707146336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcxTw0DrdmCPot2iJuF6Ul0G9M2q8XR4FUwWiq3hCFw=;
 b=Kx01oTFgCyTWmyW3LEUdvqAl4WHKUbrvMjaEyiZxNW9xIsriFzf2PLjvdPlLLSQlmW
 78lEMjdO6StqJ9vk7H3fV9RuO8LF2yVPTEDuR0Mzum6AcWsO5ZdllN+6LYoW69f7u8y3
 1O32nSXOpPAZgy0cHk9pVoJhB+hVJA4AbaVuuYhK0DpuRfKi41rGXYxp1H7jBdroGosh
 qCytnTWqtiT6WbsrU0x3lKVox6cXMuK8kGJfCN6g0Rk8zDJzhDwasmIem6cxf+7XxHB9
 6HdViVIuQAygjZGFbeqwr/6B8C0UlyemGje84RU7EajvOHgSZdfzZjgkr8PzQOT2bqlm
 xqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541536; x=1707146336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcxTw0DrdmCPot2iJuF6Ul0G9M2q8XR4FUwWiq3hCFw=;
 b=vDn5UvCmqFCUs+LYMrYMferK4L88RuRxSicKSosQMYZ5rjWa/337WRDeV8cLgD3WAa
 UKRnp6qmiNVWMVbO3OsBJNXzUgE5tmFjCxRN7e5Fx8NA4YASOsUM6aU31zoI17f/L/k1
 hRY7t3CHBhb93zePD92Qg2Zh/jm1waN4E2Hg8LyVzEg1pwZkUVluXmhUs9nO38pXyfMy
 LRnj2RsaZ8iy5xM9oM9PMD//xtVJY4WOJc6Zpz2smT+regCNrsrN/vfESacxRknN6eYi
 azpX7Coyoj8vYodMVoFBnDTS6y6/rJvMVFpghj2HDuU6fvnUA834CRMTqReXfZA1+v3D
 s3rw==
X-Gm-Message-State: AOJu0Ywino6PwZ4rnWgqmWe5EclrUCj0ilZqBOrs/y+E1+LD+qgS7DO/
 +VOZIZIk3KAcmO64ylW8MGn0ZoOuNVeRDJHn0hrAon2W2qteDSBYgrIhTvdHe0o=
X-Received: by 2002:a05:6512:1194:b0:511:f63:142d with SMTP id
 g20-20020a056512119400b005110f63142dmr2403017lfr.29.1706541536685; 
 Mon, 29 Jan 2024 07:18:56 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 fa7-20020a05600c518700b0040ec6d7420csm14208710wmb.14.2024.01.29.07.18.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Jan 2024 07:18:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 4/9] hw/arm/highbank: Check for CPU types in
 machine_run_board_init()
Date: Mon, 29 Jan 2024 16:18:23 +0100
Message-ID: <20240129151828.59544-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129151828.59544-1-philmd@linaro.org>
References: <20240129151828.59544-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IUdjEaS1uWj0

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU types.

Instead of ignoring invalid CPU type requested by the user:

  $ qemu-system-arm -M midway -cpu cortex-a7 -S -monitor stdio
  QEMU 8.2.50 monitor - type 'help' for more information
  (qemu) info qom-tree
  /machine (midway-machine)
    /cpu[0] (cortex-a15-arm-cpu)
    ...

we now display an error:

  $ qemu-system-arm -M midway -cpu cortex-a7
  qemu-system-arm: Invalid CPU model: cortex-a7
  The only valid type is: cortex-a15

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/highbank.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index b8d702c82c..0367050697 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -345,10 +345,15 @@ static void midway_init(MachineState *machine)
 
 static void highbank_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Calxeda Highbank (ECX-1000)";
     mc->init = highbank_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
@@ -364,10 +369,15 @@ static const TypeInfo highbank_type = {
 
 static void midway_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Calxeda Midway (ECX-2000)";
     mc->init = midway_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->max_cpus = 4;
-- 
2.41.0

