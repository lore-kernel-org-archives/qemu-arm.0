Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2062303ejb;
        Tue, 5 Sep 2023 07:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDpSBR8xKDnGy1eCJ/EYTzwiSpcvSLHUDRMEFjmYeSj7X11e4WMucW79S0rLxssZZ8Ilr9
X-Received: by 2002:a05:620a:414a:b0:767:1d7e:ec40 with SMTP id k10-20020a05620a414a00b007671d7eec40mr17556167qko.1.1693925851411;
        Tue, 05 Sep 2023 07:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693925851; cv=none;
        d=google.com; s=arc-20160816;
        b=CqCZ7J0ke+VMe4P/VpmEEaGLz+m/cZprIDk75BzuY5TuSGc9COcfMxCffWmUZCqG70
         rE65eMEWkQRIRzwSuvyOCD1jmt3SSxald3OJQOPSIy99divxJw8z+ye496PbJIJsWJ9n
         ZVsXABV+LIIe6zC6tlNNOrI5P1Z39PN1W4SykMTTotx+OrGI9yW3q3IE/NPZ133dLzxj
         h2Ehy3izFm81XRwu0vY7fRF/DMA4SOCPaK3w33Ab2+YR6qbQuY2nHg++7ToVY2sgcNgt
         p6T13hiEjUMSdb8be6SPVIcEutcv8+uN2yNxJZxgjlfUmh5bs5i5JeJWTwufGtTJ3ktr
         do0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2K7Dxy2K8CwrBt/sLg+giXPMeT4e/F4Re5CMN6L3iEU=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=LOW/DjfarTBzb7HmN+1wza+lu2R1ULcnXfyUiCxFNogsFfloSP6s395uhsyavDZTge
         u3/QxZueb9/HAvNgFdGDJ5SzI9ywYDrVhQKvaDJE316jJodGvSUtvYGtJA4BdQY/D/aA
         iK2dGymRNLppXQxiE4wle0LD7VyaIk3DINywoHID8QLIYPL5WYysgNPSm+4yGCdzh8DH
         x1dSggxu9sNTp9PuWVq6sJsAZZWycvdYddR7dhRQuDBYIA5lu6RiTpchDUaigaBzLRO/
         b12rh8yDzHS7UW/wy4erPsVCcc05eODlT9+7Wx+H8VTR2MAR6APJIStD4779BWRajFeQ
         gQWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3y7EOkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn9-20020a05620a3c0900b0076d8fba842esi7611472qkn.112.2023.09.05.07.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 07:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3y7EOkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdXUA-0002u5-PB; Tue, 05 Sep 2023 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdXU9-0002tk-Se
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 10:56:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdXU7-0005fH-M4
 for qemu-arm@nongnu.org; Tue, 05 Sep 2023 10:56:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fef56f7223so24492865e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693925813; x=1694530613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2K7Dxy2K8CwrBt/sLg+giXPMeT4e/F4Re5CMN6L3iEU=;
 b=i3y7EOkVAHEv47Mk8BKRdye7+BnYbPIiO2rhok5Gv8rweU95kfklBqRHZK6tG60R3O
 0N65du/362TKfHY151WtWy86BPBWFsH3lBQhRDKP3DkPvUvSorzIKF++CfJ44LRPef1G
 ktpTTYn1glTybcKl0m9TynoRipo+m+Sj3jl0P7/aSI2Dz4q/yLd8ccOxpITdJF9JKRQ6
 87yXNCtpt5IaA5hIjdFa0hnqPQFeRtcZA8amnguxkHrMNCT8tMWXh3PXYa/Uh0DsSghc
 JIWLzCAFM48e9mDQRBLq3kBAGUbRLREX0qvblLKsUcpWcx4bQYOAk/pZX7kas8+qZdwX
 3poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693925813; x=1694530613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2K7Dxy2K8CwrBt/sLg+giXPMeT4e/F4Re5CMN6L3iEU=;
 b=GEuWJDZRyqon52bHbt6jsyDVQS67AqSgERstcOTiLh1CrtFcDRdB9CXLCBo/LFSqd7
 +V4QIpn4mDpu+aUMhXp0p8j3AddC0TXCnhbdKrMN9BtXhZmVJR7NK5oGcmBOzrsMZaLy
 vjFbMTxtg9kLYBhx/NDNmvzJd7tQiDq0sVlTupBP7p7g6fh7Fs0KH6ZKHlGsWiBu5xbX
 MlFsofhXOlMwTw1GAW0stRva6uUWBEVreJ9PgUlxIZpsex17TjvoTh//Lv2saf4RMGSN
 9cqZmQ7XQi+rgGdXlEhz2hANfdKE7TWyeayr4rWlQpPEHzPxMGIqIu3yv4mZl4w6mVl+
 w3+g==
X-Gm-Message-State: AOJu0YztAZgKZvxzieqZTfLKDGBYtlKjzA3RQsCpNEiTAwTQZyes+w4M
 bFn0ah7ybIvZ8NeTJudewufd5g==
X-Received: by 2002:a1c:7905:0:b0:3fe:1b4e:c484 with SMTP id
 l5-20020a1c7905000000b003fe1b4ec484mr2935wme.5.1693925813433; 
 Tue, 05 Sep 2023 07:56:53 -0700 (PDT)
Received: from m1x-phil.lan (mst45-h01-176-184-47-79.dsl.sta.abo.bbox.fr.
 [176.184.47.79]) by smtp.gmail.com with ESMTPSA id
 f22-20020a7bc8d6000000b00401c9228bf7sm17072083wml.18.2023.09.05.07.56.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 07:56:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/intc/arm_gicv3: Simplify gicv3_class_name() logic
Date: Tue,  5 Sep 2023 16:56:51 +0200
Message-ID: <20230905145651.8199-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tbJ23qdRMZxl

Simplify gicv3_class_name() logic. No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2ebf880ead..8863f06b67 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -612,13 +612,12 @@ type_init(register_types)
 
 const char *gicv3_class_name(void)
 {
-    if (kvm_irqchip_in_kernel()) {
-        return "kvm-arm-gicv3";
-    } else {
-        if (kvm_enabled()) {
+    if (kvm_enabled()) {
+        if (!kvm_irqchip_in_kernel()) {
             error_report("Userspace GICv3 is not supported with KVM");
             exit(1);
         }
-        return "arm-gicv3";
+        return "kvm-arm-gicv3";
     }
+    return "arm-gicv3";
 }
-- 
2.41.0

