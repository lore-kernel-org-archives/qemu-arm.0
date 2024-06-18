Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp822098ejb;
        Tue, 18 Jun 2024 06:56:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzIuUvML2NugMP96cCPXkwA1fwPF39GMlhrkZSvymR+L7BcAO17aMVOhd5QVHqc8MguHDBvk4M3PPl8AhcvUS18DDwm7vi
X-Google-Smtp-Source: AGHT+IG/YP5oCP4u91xE7jAeK6XCqbxYX5ZTqDAbf2GsrjBMMoBHr0T5p8Rp2sg9BETFs9GNlvCw
X-Received: by 2002:a0c:f9c7:0:b0:6b0:8bee:50f0 with SMTP id 6a1803df08f44-6b2afdb7e88mr131283686d6.60.1718718976256;
        Tue, 18 Jun 2024 06:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718718976; cv=none;
        d=google.com; s=arc-20160816;
        b=oYbIcGYAhaWCHXjJOVWD/rCI7SwNZSEVUdNqlnnf7KfQOz5mOg9HBhet6BB1Czet5B
         uScTzfOlrN3adwnzsvhUv6E9DdYvy/MITrGD1rK1jkSFr/YIZ5RqDbqW2h+WLyhmEkY2
         VYcvcaKa3ocWnj+1UJL6+mLFHGhZ/sKeYnxsXJN2dijxz3MhCmqW6yQEy4a1tYUMoYbV
         lEoVCqFay/nfneWzlYmjggnZJ0Lp5rMmurYA2qzSA1/mu2LWjN0+5rm3GVGNkyIEZBEq
         UrnFv8QApzw01t07cC78ndvNJZc4VQCA/NjPDMFkvdBdG1Wy0x3zfgRNUHoeEerZBJW5
         tkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=u1cyBezRJri5KnZVsR+MFjuxJYCacR58JRUFpBBdC3g=;
        fh=kaJrzy6pAYPJyTyv/rsrzXmdJx7Xd8bUKdVtDKxmloY=;
        b=WSkot2lfJeBpSJozbd2Q7pJGthkD4ot23KXFa7eiGKNQfsTxUT2A0dB0JhC1IWMWie
         ZA94iiz/hAx5hG+rBstRdfYSPyV9Vk9V5TJFy1+tiO5YxsO/X7fE7uA2wuPlTYOBkB4O
         zlmmx7DuI5fqwbXuRS6NCiE3nJWUXi8LO+b6yqVdXFP01q3PK18Fa/bJck7jE2ZCnal9
         ybNnxsylRnKR2MJC/ICoPsFX3G+mwIDM3LBqMVwwZ32fMC0pDO6vbQ5TRHBVz7/jGjzn
         u9tY+8PaYFxBp9feOomndQTfjz0edSyeSdb6bZXSb34TtinHb99E8axKfdFkMn1Pfp2R
         kk3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNVFQnzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5a35705si125590386d6.176.2024.06.18.06.56.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 06:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNVFQnzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJZJf-00087z-1J; Tue, 18 Jun 2024 09:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sJZJd-00085b-4c; Tue, 18 Jun 2024 09:56:05 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sJZJa-00022k-MR; Tue, 18 Jun 2024 09:56:04 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso642046466b.0; 
 Tue, 18 Jun 2024 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718718960; x=1719323760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u1cyBezRJri5KnZVsR+MFjuxJYCacR58JRUFpBBdC3g=;
 b=jNVFQnzrXOUt46rr/64ueaAxGBsKV81SwjuCZB7svoE+Tb1CyFWW3Ds6rp6eVLwuou
 v57DNbLUkOL/NL7l2eAS61xU97FHH54FKvkSidINA6HE56hqUVgDu3A4cdwyzftyEJf2
 T15+3lBUutL6jE2bM6bYewkFJNX6B/QIVT9RMrrl4+74qcYu3MdBTQMB8t/20tT6JYdU
 QAT9AGTil6yBqDLBm39IaLzSVySc/1FboRXW89giczqJjG38LCznHei+/LYZ+uR+iP1G
 8qdRyPt+NaTcT/NAoPoXvVBv2eyJZhvO5m/MRj9Ue+XmkyJZ3kDUA4lh33CqmYsYqdiJ
 bedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718718960; x=1719323760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u1cyBezRJri5KnZVsR+MFjuxJYCacR58JRUFpBBdC3g=;
 b=UWinD22m+nYOYQ58ScJwzztpv4v+a9XFHFtN5mqzdcfJSmvzFsVp08mD8mRF2yBDqW
 42VCgaUXV6bv0pfoislL+0trsVKn4Va+GjNrXEaox/oweB1CNsx3bfFPDMjHdWWnszFc
 N2Ebka4+MwIoFIACW4M3GYs2AR1OJL1ZMfOrUlncXmthvQm41otyTOu1bob1SNNHShk4
 BqbCEcZCWCRhdeFMJtf9x0LiTv6n0SnOlKIMTmIUOP3rgw3FlzeyMgjNLxvNB9uUqT4I
 hB8zVfin3g9PfhTFb5W4ntzdDlMLkgx9XDcciiggOqECUpqbkQjPyh7st+kgiC0w0HEJ
 +9WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB7umEBP9NGCamER/b+Fxp9RibgfTIQfZ8n0Pm0atLawRcIjDT3C7i/uJtXYAqYa8tsT6oEmgewh4uiO/DP/dkoI1+j1oZXoWRmmJdHfT+fM5NAJdIHmibELU=
X-Gm-Message-State: AOJu0YzWqQr46DFrPv/QBGhGB4u8Q/4e7d3crDzfTROhZYM+71Lhw0kL
 SUk6+57+iPoJA7IowNQTMhbD+Te1SSmSiwj1M0AkrHEZGp92IXI=
X-Received: by 2002:a17:907:874e:b0:a6f:8e42:b794 with SMTP id
 a640c23a62f3a-a6f8e42ca00mr273324166b.26.1718718960238; 
 Tue, 18 Jun 2024 06:56:00 -0700 (PDT)
Received: from wing.epfl.ch (dhcp-122-dist-b-021.epfl.ch. [128.178.122.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c858sm617015966b.206.2024.06.18.06.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:56:00 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Cc: Zheyu Ma <zheyuma97@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/stm32l4x5_rcc: Add validation for MCOPRE and MCOSEL
 values
Date: Tue, 18 Jun 2024 15:55:50 +0200
Message-Id: <20240618135550.3108739-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=zheyuma97@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: 8rOfXt8HprGq

This commit adds validation checks for the MCOPRE and MCOSEL values in
the rcc_update_cfgr_register function. If the MCOPRE value exceeds
0b100 or the MCOSEL value exceeds 0b111, an error is logged and the
corresponding clock mux is disabled. This helps in identifying and
handling invalid configurations in the RCC registers.

Reproducer:
cat << EOF | qemu-system-aarch64 -display \
none -machine accel=qtest, -m 512M -machine b-l475e-iot01a -qtest \
stdio
writeq 0x40021008 0xffffffff
EOF

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 hw/misc/stm32l4x5_rcc.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index 417bd5e85f..59d428fa66 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -543,19 +543,31 @@ static void rcc_update_cfgr_register(Stm32l4x5RccState *s)
     uint32_t val;
     /* MCOPRE */
     val = FIELD_EX32(s->cfgr, CFGR, MCOPRE);
-    assert(val <= 0b100);
-    clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
-                         1, 1 << val);
+    if (val > 0b100) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid MCOPRE value: 0x%"PRIx32"\n",
+                      __func__, val);
+        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
+    } else {
+        clock_mux_set_factor(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
+                             1, 1 << val);
+    }
 
     /* MCOSEL */
     val = FIELD_EX32(s->cfgr, CFGR, MCOSEL);
-    assert(val <= 0b111);
-    if (val == 0) {
+    if (val > 0b111) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid MCOSEL value: 0x%"PRIx32"\n",
+                      __func__, val);
         clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
     } else {
-        clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], true);
-        clock_mux_set_source(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
-                             val - 1);
+        if (val == 0) {
+            clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], false);
+        } else {
+            clock_mux_set_enable(&s->clock_muxes[RCC_CLOCK_MUX_MCO], true);
+            clock_mux_set_source(&s->clock_muxes[RCC_CLOCK_MUX_MCO],
+                                 val - 1);
+        }
     }
 
     /* STOPWUCK */
-- 
2.34.1

