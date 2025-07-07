Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CAAC8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 17:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYpXr-00038i-Pf; Mon, 07 Jul 2025 13:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWl-0000v4-Mp
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWf-0005CJ-7E
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:21:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so17673055e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908863; x=1752513663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqODDGmVZwWpLG85t5AjRhEjZXJgSLCLXmN69PZ4Bno=;
 b=zYT6tcE9nRHOtCk+jYfqKkZZ+8G6aPt22pNdoezSBiboDiQYRiqksYtmhvCUikolNP
 GLFCj1q754AzAOPSFs1FhSjSnY1Un8QBpPlt9Ys68b2W4g3EXes5aQtsirHvkuBsUUzc
 G6P2mAKXn/CzHwb5wNeo0DbJQiiWk0miFn60tVXC6XnP0A3jh+irRArmAgIh/dYFbZ7J
 zbEr0VMJ59ppcXeoVE3fvifa2cy68x5ABybjsz1Ip42w3oPfEOX2t7kxcl5jU3QADsVX
 EgvR1umfKKUSP/9W066kafJL/3Au7FkcvZZ+XqIomE5kTlQ++NKwRuZYEscnspUltgOJ
 b+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908863; x=1752513663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqODDGmVZwWpLG85t5AjRhEjZXJgSLCLXmN69PZ4Bno=;
 b=Uq9tShfvKqUTfQ1TGrhLP+Jta7t0IJPDCPqZ/Q61kHpga0U5o9rbgtBNbwBAE3t66B
 80DqJXjabBTMxKhkPHl0wKdWLTSGZWCzRNqhYMKGO8Zwrpi2V0dIJq8dBN1Uyt/3gR6N
 5DZ9MFiIB9VyDSQtvb6/Va2eGUA0wOHkBYrqLO2ofwYU+uXLbB3DKDjQrLkozNBejYIx
 gIEQlMg0hZynQRhR53y6JmntQa8JmfckLs8d3W1xH2/2GjUAGd5LTnuJj3ROaSJ07XGV
 Xc2hJitvNHnsoGnmc9b/uHqdHETBD6FqU1I915zF34sfYYOs3IrqE8Jt78pk+25pwbUA
 IErg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/88+NseTrzacdYy45fM56kmrmwkv4ls3HrHWqmZ5TZkj1yxXSAg5Y31iS87JykPTs8G8aUJjR0g==@nongnu.org
X-Gm-Message-State: AOJu0Yz20H/8x3A5YaG6CZpVNFsn7ltj09XVXMeRANyYHi0Emq9WdynI
 hg/m0onjt118V8+ivyqaTBHk6gJupN3LJSG9Lp+UeKa+8kdy9wU4qB2Lgf6otWk+YSo0mI8ytbI
 /WW332go=
X-Gm-Gg: ASbGncueDkZXzKAhtHdcDRGyBh4/KolL+Z8xhmGsZaaQ2yNZ0sEUDvITkXv1VFEIxVa
 cj8fpxS2MbHl6BqUfEY35aLjrJVNkB5/LJTOWb8SB1wQeM5CRigywibh2KkoI1NpXc2UOM0UIPE
 DhM2AkHXc4oCro3TibBA0s91qFbWMqjxHkS360wWacqkHlkAbrHe5Du/ZuZIQtDnfqQe2Qzl73C
 BNEEO2ehvrIcsVP2yTYHzXMuLnktgc8YtcyVo3ED6JlMaD8wZhUtUUHioX3zEguaf4mav2iFrvN
 SUTuAQ1UxviwPvb7V4FGk6CSRQSlb7yz6+kbkD3KPo7oJL6QDJmt0CuUZIiOix9SyUYVCwv8yfj
 SwU7QfHwEMnDr5njz92qkWOk7K3wc4tVBykyZ
X-Google-Smtp-Source: AGHT+IH4AKONYKk8WayseeK6glA6RWMBLDwrfBPAg+NlginweazDCvf0XL2oKfGi1AQj0zCr2pB27w==
X-Received: by 2002:a05:600c:8885:b0:450:d5bf:6720 with SMTP id
 5b1f17b1804b1-454b5e9a2ffmr100958275e9.3.1751908863459; 
 Mon, 07 Jul 2025 10:21:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8fcsm122271075e9.7.2025.07.07.10.21.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v6 10/14] hw/core/null-machine: Define machine as
 generic QOM type
Date: Mon,  7 Jul 2025 19:20:04 +0200
Message-ID: <20250707172009.3884-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/null-machine.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index a6e477a2d88..3e03771d570 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void null_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,12 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo null_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("none"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = null_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(null_machine_types)
-- 
2.49.0


