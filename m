Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806285njc;
        Tue, 5 Nov 2024 05:05:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjYKG8AlYxtzgJyeV5Yt15kmdARE/s+pCi3hussNufaP2bfTlh2b6qfsfYDOYwT4y/+SYKumKM83zNyg==@linaro.org
X-Google-Smtp-Source: AGHT+IE22fAkkNC9OOR+2hjJgG7uZefMA0p3L48UxNplnKarVSM1o+L9d1MfRuHKRMOj0beQeKWf
X-Received: by 2002:a05:622a:1b8d:b0:460:e9ce:7629 with SMTP id d75a77b69052e-462ab2fcf6cmr296549331cf.42.1730811947426;
        Tue, 05 Nov 2024 05:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811947; cv=none;
        d=google.com; s=arc-20240605;
        b=N13PPZubPGKS/O1hqga0QW5QLLOk4tLrJZAdHt8p+6eECi5PVL+zSF/6mBVIwmgyb4
         BwEgZyHdHQkVvUWkWIbOmkRREVhfElgdaTJo3YJtPohM7MlMLnLNTVndfG7XeKbDdQkB
         yn5vgyzbi2lGa25+YV13Mu/MPVVN8JsCDMTAspEo9eJ7bFVQGN6dTKp2LeLqwTPiLCIm
         zUJN1jcqt2RASNUYZLMhahgHIe9yLOJMZZWg561PYZKQ7GavII6/7WnAVbOve7xU70mm
         i6vn6wjJfJtoWdUxrXJauSBASVO/BZ4JxbipDOWSs398KHNDVl+SgAEKm4pZGM+Buw29
         ZjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mc9pl0ol0oGGc5F+E40Idu3stjpto+GEuMxBJrUIFDk=;
        fh=t3XyJLi79GAl74vwjx9CHyT1q7cQJdnSqFDS2FXNV/w=;
        b=YqoPD8XtoI10KQRFlCqdwP3/gLJ5BX6Dyii2o5d86To8PN8rRyhCo++3BUkLLgRp0q
         i4p9BG/0/2L6SnPF1iQRftVa7EVIPjworQHR6EI0vBeYJ6Qf1qo2vk6A3cMUX83yQxkM
         vM7r2upvrbzR80s14P19OifVsA1K03/RoIzHbAYXzxpWyfisVb+O67ueZHpWVPcXqoFf
         VBzBQ7jAzknt6/j7SiNZ0pAOrfFIx/2D1zeM9UzX5pwaFqvlK+K8OO5DGpBcBPMPZvBU
         qXZRilsNs2qWC/igzbMH63jxfsYPASu7YRZmFJq8Hf2kDH/ScjsSO+1SFoAVyEx7ju5L
         mPDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXUPKuH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad242475si141693851cf.547.2024.11.05.05.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZXUPKuH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8JFT-0001rL-LJ; Tue, 05 Nov 2024 08:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFS-0001r3-Mj
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:05:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFQ-0002So-P6
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 08:05:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4314c452180so39888015e9.0
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2024 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811927; x=1731416727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mc9pl0ol0oGGc5F+E40Idu3stjpto+GEuMxBJrUIFDk=;
 b=ZXUPKuH2nZ3Ilyz61KkXvGPVau33Hs/yuV5kA85T4MUP/n6OpohbGtypeHVoFJl+O/
 qCmEoqqd5s0Rr3nuXxP2EmlnFBN2QM9O/Pasjd5u4yVyyRfJEjoiXdy8LQPvNSttF58/
 9JKwHnVmmrpaztslo4n1wrm2IkimVc7h+Cr9y7fEIZ14vc3dEO25Kohlqs8y+Yub6MZR
 7v1HzENrFq6PWfVU2M9mh54TXkIcMoO0M18HhgBhjInaw3F4Ctl2JfcWL4JuU/MNjGXH
 UK1bJZXFo+e641BOKtuyi2z1mtPw5uiNHBAriuwRvfnT3GMmydCfHAWb0YsL1AJ4yvNs
 ZUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811927; x=1731416727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mc9pl0ol0oGGc5F+E40Idu3stjpto+GEuMxBJrUIFDk=;
 b=XWnBGsjmncUDy33it+wP8crR+FAqeu9zoKTQq4/NRHpHdp6KfvvrVkv9DOm1hqn/EJ
 M+Hid4hJdNwpZJjfeIDhw1bDrhZ5gw/cSAUVB+qrnEC/8qXlldW/7+itCHufDNGFeKyI
 L7sN6d8c+fndsNnJ7bufaj2KJiB+3trWDgNOJcS+clHyiFAZemoOsCd8iYtRbzhZqGhX
 KKfLobRff+m8aj5v/bFr/wL6p1/hEo6N6Jfk6yfoCWFu4cXB6ptriqRJN/odg4c2e+08
 kAtPDjGaJOVbpcSwRmTelXk8LbXQsp/WPA15ZWVXCWRk8vC0phqn/quW22ILrnY0BTHM
 owvw==
X-Gm-Message-State: AOJu0Yw1SvaaNABwz7NqHcxTwOx1lcG/bI/BRdMYG0/ADmLFlW9mbSfQ
 LPz/cGfggNr3SfV9xLlmGl6oQ/7zBnUoKz/TDdy8PxZnzn1qPwAn00/f3PmuRyQUtD5YuuVB4Zr
 107o=
X-Received: by 2002:a05:6000:1a8e:b0:37d:2d6f:3284 with SMTP id
 ffacd0b85a97d-381c145bd78mr14773058f8f.9.1730811926954; 
 Tue, 05 Nov 2024 05:05:26 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116abdasm16358789f8f.97.2024.11.05.05.05.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:05:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/19] hw/microblaze/s3adsp1800: Declare machine type using
 DEFINE_TYPES macro
Date: Tue,  5 Nov 2024 14:04:17 +0100
Message-ID: <20241105130431.22564-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: DspxhWZRxZM5

Replace DEFINE_MACHINE() by DEFINE_TYPES(), converting the
class_init() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 581b0411e29..6c0f5c6c651 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -55,6 +55,9 @@
 #define ETHLITE_IRQ         1
 #define UARTLITE_IRQ        3
 
+#define TYPE_PETALOGIX_S3ADSP1800_MACHINE \
+            MACHINE_TYPE_NAME("petalogix-s3adsp1800")
+
 static void
 petalogix_s3adsp1800_init(MachineState *machine)
 {
@@ -132,11 +135,21 @@ petalogix_s3adsp1800_init(MachineState *machine)
                            NULL);
 }
 
-static void petalogix_s3adsp1800_machine_init(MachineClass *mc)
+static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
     mc->init = petalogix_s3adsp1800_init;
     mc->is_default = true;
 }
 
-DEFINE_MACHINE("petalogix-s3adsp1800", petalogix_s3adsp1800_machine_init)
+static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
+    {
+        .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .class_init     = petalogix_s3adsp1800_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(petalogix_s3adsp1800_machine_types)
-- 
2.45.2

