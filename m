Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114078njk;
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgj3V+mF97GAiRaa4yu6kv56ORAyxMYvkAxk0Q1FhCacAln/QIywX6HZIdy1PRCXTFPIwKuZWI6Itf9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHsZ5LIp/zZ24v9X5pSn1kjKkg0x2pQqON1yPSQt4Echr7RwbE3AAnPkRyBj4nLg9jCLyG5
X-Received: by 2002:a05:620a:2890:b0:7c5:9c13:2858 with SMTP id af79cd13be357-7c927e525a4mr133013685a.0.1744934345090;
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934345; cv=none;
        d=google.com; s=arc-20240605;
        b=fiSsNBX7SFM6//PgPjVDPqS8yTSPKEiRMtYTLeo+uCwhLjpm0qfiXT9Khs2PsxOfYU
         /29w3mGp0xmLPl/j2V7C1vygF1GjoUkChR8lRPObGpS9UlaNpMhfmcvQ/4P58yvQ9Dd+
         foxtcc4tTpIPyaPR4+flMF6sBGNqZIaxR+7sM8UDbOWWXljNiPnobPWnp6tfk5fBr3rm
         fM/wXL591gQ4hGfQOzwpo6/r3JwvSXtcFLi148GcOELcdxL5KkWdDpm1LYUi8hRdNFVR
         k7VRhol2BuijHsRcUuHZEJ+ptIEbqXFzEG11OvgtlLiOOZrOUZzUwplyDycMuPwPWCax
         b+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AOUZObtkL1pnrtX/HUZz7JN00TbmXk0vW2RpCKqJB7c=;
        fh=WFwUGmGYmncExvQBJsU6UTDk6GMcZbek85cNJsMLDI8=;
        b=SXsAlGWkpK54S0I9ovK9zGRJIYWD/5tNdytAWh8VhwVEdiD7mvp7yRarTb06v1kiUD
         TNeOXCnGOwjDMnz/LbqYVfec9ZjEm38HBRaTeVraS5blTdd8SBo2YzNKdzfzVfIkVRYu
         nw6V/L6V2RwS9DMz1pExHD860WX4fTM1UcQTsOdz6D7zg3IgcVvwUFaLBByaaTO3E8Wk
         p3ZS0Eatlcp2SULGv5naJyYT304wBsOUfJOLLA38Ow5w+59xhSJ2wNPtGfAzaJ+7OZlq
         PZFHBK4UAOhBpXNizBzmvsGc90dkICEVxHGYAyIkuDn1c1PxsTGndGNs4iMoqUNyzMEn
         to8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAFAo2Pp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925abf17asi101443585a.59.2025.04.17.16.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAFAo2Pp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z7y-0006uw-LM; Thu, 17 Apr 2025 19:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7x-0006ud-Kb
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7v-0003sP-T9
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso1332135f8f.2
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934318; x=1745539118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOUZObtkL1pnrtX/HUZz7JN00TbmXk0vW2RpCKqJB7c=;
 b=PAFAo2Pp0wgCkq+BChyAr860QFHxBpZWeB7EPQAsx5igLUkJjy6m6FrFRhmUQlon6Q
 9tmYyjKCjhUXsWyqwGOuRS3mCLa3aoqwXWPjzP+vqbo22VG/Aj7fJKm/LwEzUyI8BMhS
 VcerR7gzOxY9S9YXANUFDAi7svQQBXGJ9l/UN1fAOM7yvjyAP2cZVDfvWxtu/qJ1HvaL
 OIyHGq9ATeCpnQExpK+nMdJgNdguB7Y4ZOrLbKGXDb0P9Vlg86t+/ZDDo0ycpRZOr1yk
 rSvaZHlnvWqTnN1+0EZsMdlsJrRD3vTZgFAo5xHM6Z5eXBxx3+Jlp4WsKqieL6Petoae
 RNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934318; x=1745539118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOUZObtkL1pnrtX/HUZz7JN00TbmXk0vW2RpCKqJB7c=;
 b=Lxrv5KUO19FI3Tj3eoQWJM/7O96PyGhbQ5nWvs1kNaz+iIrdGoQtJgznYAYLvDZ+t/
 DkOReh5mLNCI8pffLWe7ZH3jqvHj/t7tzzm+Ix13bgh21kPAwugqvzwtOFtHiSK8qqSz
 83IX4NKt0GPF1fC/DfkgGiDKNOE0KIbTf0Lle42YxSLH6d+KQWCgCnOjLcbTrmygjxv1
 xfrBC6xRIrJhp0oI/AOtJhsd2CO9lYg+coPV6bwLaZ6XQ9Yl19lyabzWr2oQZ4zlTTJj
 TjSUA50R2XH6iZbBBjcSJ/ZkpratcIahKoKGjnR4XLIdvgl8YQgPkaJkycgSBHh1DEJB
 ZmsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMM8odM4ZOG9zV8Z2YEJqkNd1MMzSvbtVz+IS3yb9Ech36QFi/2VrFcp/FG3kjwrNZ2Brd9dC6dw==@nongnu.org
X-Gm-Message-State: AOJu0YymG8xyKgzncFk1x64zw6ku8EDrQwG3BhAeGwpJDouIOTMkQ1pk
 IXbPO71VgPNAF5NwiL5fEQkQGf+QjvGKz2S3LAzY94vYR8x+YckFjGARmHfrI0U=
X-Gm-Gg: ASbGnct7f2ttdvasqJAsv4C9YLCeebozE9mSSL4x6hGy9wuPKoSDFRAfRTP//t4Nkqz
 nmPNmI0JPeWANsvJhBGM5aeuNiu3Cg8vtnvBvRh4CNEiMGybwFVNu7DzvsuHBvYTXN2Iqkm2t/6
 LInGdwJrFUnWwz01/BVNYIP2n3n57gCCEqtHeD5KsxSVf/OfpBulixYBi5rGLKcyNwLmJtzNFS1
 NIJtHXCSG+9kKpIwc0GfSkmzyoGed0wJSfoonSVFq9R6QudRnBW1L/haonZX9Fjhip9JE3W13RO
 3gkajCizOiDbJNaocu5xujK8Bdh8J4MhFcg0OcgNESsK8sW5gv3KPfHNzTu4l07kyV2l1LhaerC
 JIJjK9Qd0VBMmdsMm1q9u
X-Received: by 2002:a05:6000:4006:b0:390:f4f9:8396 with SMTP id
 ffacd0b85a97d-39efba5c77emr501897f8f.28.1744934318310; 
 Thu, 17 Apr 2025 16:58:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa49312fsm1045268f8f.70.2025.04.17.16.58.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 04/11] hw/arm/digic: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:07 +0200
Message-ID: <20250417235814.98677-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 4/iVEpbl9WBk

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic_boards.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 466b8b84c0e..3c0cc6e4370 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -136,8 +136,10 @@ static void canon_a1100_init(MachineState *machine)
     digic4_board_init(machine, &digic4_board_canon_a1100);
 }
 
-static void canon_a1100_machine_init(MachineClass *mc)
+static void digic_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Canon PowerShot A1100 IS (ARM946)";
     mc->init = &canon_a1100_init;
     mc->ignore_memory_transaction_failures = true;
@@ -145,4 +147,12 @@ static void canon_a1100_machine_init(MachineClass *mc)
     mc->default_ram_id = "ram";
 }
 
-DEFINE_MACHINE("canon-a1100", canon_a1100_machine_init)
+static const TypeInfo digic_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("canon-a1100"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = digic_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(digic_machine_types)
-- 
2.47.1

