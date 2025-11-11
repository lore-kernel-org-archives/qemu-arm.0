Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2717CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIlcg-0008OA-Rt; Tue, 11 Nov 2025 05:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcL-0007d5-Gy
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:53 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcH-0000HQ-B1
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:53 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo728698966b.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762856925; x=1763461725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2R3zKrQT8zFcXqdr8zmnfkYZDb9c7Kd8HiPSpJXcco=;
 b=cjaDFLIRMQTtdcakvbCXnTNix97XOywezGK3hBpuokwl5bm/GgfJCDHacxqarSnsIO
 CUeO12DUidZcWzRCkEkTSXRJ3Y0IcU27ZEZA1q80hdTnAe5HVnpWSysZdCuebZxP4Wt2
 er9HiG+cxBNJQ9om+fTllyq4ZFgVu5NtIqJcstIZ2t0K8KmZOYK3xT98grJHLpjoNc/Y
 KVFIwWjmm/IhBRT9uOqTE6Sw8pBhkqMuiwKBqln+4MwQfZgIaaJFhCX3PczXvYtLz+3w
 VLN8W0Leq/CIeDOkb1M/HMDIb8SKX/vVKVhBYlGEdWSsxieIo+pFEKBAy6E95bjef14i
 7dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762856925; x=1763461725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a2R3zKrQT8zFcXqdr8zmnfkYZDb9c7Kd8HiPSpJXcco=;
 b=LvqF7ZPAxms+Ru41IHq+Mr+mAPISxxLsi4rGvqRr9m8jkdSRAmZtYtbM0VDyjlvFKx
 fLVpFYev42gRlDo2au23nV47vMg9bVEq/KuykoQHDkXRhj6kVmazu1QWmJB3FNc+cKqB
 b7q4Yuzuf3zzts0LVUw1swMrW1/1xOHoLD6AxkE0nsgkkFEcX7adIi3uPaZYU+0c/OZE
 BTazov+S0ewAPP0w86ZeaLpq7Gv+MPvChG1DZAr6siN/oQ7WVYL8slYhjLrVRf77/ewT
 k/o93Q3Qv50n8A+TPGNdJG8pwbEr+lMADXz/A71SCfgzTT8y2sMcRtQ8ptu/I3dsfyVo
 9Rsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX74wimfiOa/NiQx9hEy7UDH8LAK+TzZYvwOKp6Zp1GcwmQu9Cmc4q9GW2aRthNGIRzM4wY5FHkOQ==@nongnu.org
X-Gm-Message-State: AOJu0YzWoyvidrMzR/uncWyy15Bwo3Fk7yAReCCFT/zmYawJvqFLmWS4
 JcguLjLM+4e5qRZrZ3E2R+Fkx03xjPWgiNIJNdYhD2AIjpcm59SJYN0WGWMBK0Fm
X-Gm-Gg: ASbGncuHtov+zCYIzVK4oXqUi5StraWbOZfJHAWDWpeI4DTQL1skxli1bMfxrpGu195
 z1tAszN823C85i6oSBZgoboFw9qSQL4y+ow0azLOWif9oB9pJGgpiWQpYZa05tZSOobMKP1tRtQ
 a4AU5zSI1h42qybhFk4T3A9QZQVl02wUqtJISYS2Hh6c+UexclCJR431YMJsjKgJe7tEkLsP0P+
 j6+EHnl8f9hMtDc34GJCXJDkHYIbiOdFx1YqWICsOiHLrs6G2IpDJffwsc8IonBZM96SfYB2UX7
 4eYCPNYZXa6IU7BcchUhOXXyHH5HBEVH1e9UHqcSBm9TMT2zwZT95AQVWtO2Hu2Z4YAAxihe298
 L1EeRwXlgzhQQRruI5bTJjfbNfpWp+UtkzjQcN7No8JMhNPBEIFhRFFI5i2j11qqGzfO/kpboch
 CHV3+7WYjsvm0WdlDTCw/vVg==
X-Google-Smtp-Source: AGHT+IFo8fxqj1exL4ue3grGneT6lvsp7VEqKFt+Cv/hUix1gwdWzS9XnInAcAemmSZKksNl7CXiRg==
X-Received: by 2002:a17:906:f590:b0:b71:cec2:d54 with SMTP id
 a640c23a62f3a-b72e04e4ebemr1208186166b.57.1762856925194; 
 Tue, 11 Nov 2025 02:28:45 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc12:ce00:ae91:a1ff:fe8b:15a7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbd1ecfsm1290619366b.10.2025.11.11.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:28:44 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v4 08/15] hw/dma/zynq-devcfg: Fix register memory
Date: Tue, 11 Nov 2025 11:28:29 +0100
Message-ID: <20251111102836.212535-9-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111102836.212535-1-corvin.koehne@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

Registers are always 32 bit aligned. R_MAX is not the maximum
register address, it is the maximum register number. The memory
size can be determined by 4 * R_MAX.

Currently every register with an offset bigger than 0x40 will be
ignored, because the memory size is set wrong. This effects the
MCTRL register and makes it useless. This commit restores the
correct behaviour.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 512a33b066..abb8c419d9 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -393,7 +393,7 @@ static void xlnx_zynq_devcfg_init(Object *obj)
                               s->regs_info, s->regs,
                               &xlnx_zynq_devcfg_reg_ops,
                               XLNX_ZYNQ_DEVCFG_ERR_DEBUG,
-                              XLNX_ZYNQ_DEVCFG_R_MAX);
+                              XLNX_ZYNQ_DEVCFG_R_MAX * 4);
     memory_region_add_subregion(&s->iomem,
                                 A_CTRL,
                                 &reg_array->mem);
-- 
2.47.3


