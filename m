Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2211263ejc;
        Mon, 9 Jan 2023 04:27:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuq6gsjJwlcQcGmRSfl5laVb2Z6uGXAHsRdnFw3O/txqwFJY0qYlvuyKQzUibvHMBrgnH82
X-Received: by 2002:a05:622a:5a98:b0:3ab:8c3f:328b with SMTP id fz24-20020a05622a5a9800b003ab8c3f328bmr76592109qtb.4.1673267262997;
        Mon, 09 Jan 2023 04:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673267262; cv=none;
        d=google.com; s=arc-20160816;
        b=ptUbaPPIh7+siYvaNr0o3TfxX20+c5N0Ya32ryIEqaI8BiO3ngMsUlbzhzhbbZwRdU
         Od3fQxiuWYJ5w5/KghZfzhfG3niFDCkqPlo+AD2McObmNaPj+5aMKL+f6cYifPppMBkM
         TyANCRxH1YxTXpmWLbyk5sATVz+rr4C8x7Qj18h+pZ4XOnk2ZnVwBi4LvfZDgwfHJzXE
         dMv6N0mu3uAgnn60c01A7Y0gD8vqZgOND0LMqbcdRSMFZtM/jtBtMFNG8dFjyj+utt6y
         PyLbmX3HQ03nUn8+xqFifau7T8IKUG8DowC/5Ky1ey1rIyhLkHbkMisZOerFgDIDfVy9
         sftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EJ06rBglje6LQ6jpsdeFNJpw4LirYI6I0MIC3DLWsPw=;
        b=lyfcIUOWr18reg1Oq6bPtLqXIOUaNop8RXmraNTnD3tTkxRLzbHnRjZEwI6V1vLFrW
         ctzkKBY5W3CANLs6l4XN8jkwI8honbF7gykzv7PnbLhyjtIBEVNbVHkCe94z05ClfgWn
         pEBtckn2P96NZ+P+OUk4hITrh9Kep6Xb6acCK6wVwLXml8E/JxfAtqJJq+bfg+GXADyS
         EJ40gkKdQKO91oWmqKBXcZOGMfiNU8cM/fe0edDGwwioBRXZDqedibnguMLPKt8pSb5P
         YIF3Gw+7mGBEfROQbXRz9nvYhfRkSPJ4pd5sNj9yWKoLcUDSsAVWqQ+Hn2+mMOcIvptG
         4aOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PamQoxSw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05620a430600b006b5f48a986esi4728661qko.84.2023.01.09.04.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PamQoxSw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqiw-000340-3O; Mon, 09 Jan 2023 06:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqin-0002wx-GB
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:50 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqil-000854-U0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so6057773wmr.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJ06rBglje6LQ6jpsdeFNJpw4LirYI6I0MIC3DLWsPw=;
 b=PamQoxSwf3OOa2/AyFS9ESEXv6sXNnK+HmuzgQl1ERFY3ruy7tMea17qpNwXFcK2om
 L3I1FWzbFrQITkkvliS9NTwjo7jTPBegBF4QEwyTNaXer8dyXQUoP/Z4e5yZAgKGuRFX
 KtGGsNAIjcodQI8KVOFHSi9DB5PKTNIUYDiT8OaAUEUSw2dG59nNSG6jlJhSwcu5lqrU
 J5Qu85sqil+MWOsZL25p6r7ly/46IKCBsPF9eL20d/Tto7qC6e7XQDlERVlBpS16z3xs
 qtZirSuHPZzXGIixUi8bCcjAD5azcLbiEeHcTC8c2+CTz85zkKBQpwzhHNbLaNlRYTaQ
 +kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJ06rBglje6LQ6jpsdeFNJpw4LirYI6I0MIC3DLWsPw=;
 b=a68iuZbFNI6D80NUqUh6Ot9Cq6moMotnQmeidTBIjzXLFRO27qfPBezCCCDOqgqCsq
 CoYj9SN4uIGwTw0S2Ir6ViZAXDTC9BgfIhziEImUlIsYiL1zOTzQWw0PsOH+wF7qd8YU
 UTzxGpzFl4Mi3PWJ4D0e9oH2Unxlo89XpabFOVi+4zreN7MVtaWmRMfoulgs01yMDYnB
 xOaBe7WKndXfs7ykDhEeDPbznoISUCGPGDfR4I4zAPhalW1NFZQbibA6REfBGyEUTCM5
 SQij19ZmXeU8OFKAcOVi+774EZd259bfDuEsGc6/orcqm1j8MlXVnaAQSQNlziDph8pC
 jXOw==
X-Gm-Message-State: AFqh2kocGMQAXgDC78o7Y1Bpnq/x4og05hBak0NUkOp6paGb4xOGKulX
 8N9VVe9jHHfBIet2j2yzumbeIziL6Pxv4Wh+
X-Received: by 2002:a05:600c:3490:b0:3d9:ed39:8999 with SMTP id
 a16-20020a05600c349000b003d9ed398999mr3425285wmq.35.1673265222407; 
 Mon, 09 Jan 2023 03:53:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm12616481wmb.16.2023.01.09.03.53.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 05/13] hw/arm/gumstix: Improve documentation
Date: Mon,  9 Jan 2023 12:53:08 +0100
Message-Id: <20230109115316.2235-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 2GeNYhjSnPuc

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a comment describing the Connex uses a Numonyx RC28F128J3F75
flash, and the Verdex uses a Micron RC28F256P30TFA.

Correct the Verdex machine description (we model the 'Pro' board).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200223231044.8003-3-philmd@redhat.com>
---
 hw/arm/gumstix.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index ab9b0182f6..89c15bee75 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -10,7 +10,7 @@
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
  */
- 
+
 /* 
  * Example usage:
  * 
@@ -64,6 +64,7 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
+    /* Numonyx RC28F128J3F75 */
     if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
@@ -93,6 +94,7 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
+    /* Micron RC28F256P30TFA */
     if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
@@ -124,7 +126,7 @@ static void verdex_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Gumstix Verdex (PXA270)";
+    mc->desc = "Gumstix Verdex Pro XL6P COMs (PXA270)";
     mc->init = verdex_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
-- 
2.38.1

