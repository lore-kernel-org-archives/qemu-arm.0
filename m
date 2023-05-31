Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229923ejb;
        Wed, 31 May 2023 13:37:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MwIpi1gvwo1mvy5n9wLBjdTWrdiS6lY9QM23peGMrZBBZZpmedEhL3V5s3kMVJ9hUiAi6
X-Received: by 2002:a05:622a:13:b0:3f5:483b:7690 with SMTP id x19-20020a05622a001300b003f5483b7690mr7019090qtw.61.1685565465671;
        Wed, 31 May 2023 13:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565465; cv=none;
        d=google.com; s=arc-20160816;
        b=D7MoPvUk9sSguGzmKGWyfwpytMkA9u32VLCgfc2UXbBFBDRXSN0ujEfjXJx6dQpDgg
         M6K+b1PtP9koucF1RczbcHa05ReEH1mMGEzYj2rnSclJdPvFmMmJ6UppqYNZPFUppebK
         Idgf0ayFmqpSN7cFiPtCKhEeZ3h5+atd3Je5GbGNxwNWhaVH2RN+ysJgDzXdnkBT+7+X
         vAzlXRNFG0OgEk7TPMQTWZ52pbplvYcw3TweMZXtatANrZX4w781yNt80jH7ix26otxx
         uF3AQy1U5jjdkrG8dj27LEjvlIWAdEZ+/eqgfGSa8ofm1fuC3vAar5ArE4wIttO3YJNn
         3w3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E5b8V9q6QA/WPM4HyTDg8f1UskvZE7C+FUlDujJKJpg=;
        b=Fe3w7a++Qle6xCypaqdU3HjqQA04aXzT6pq13DcDnuJyKwf1ci4aUWOgfV4my5dWTK
         q9e22nobk5F4Hw9lIgyiNLI9YtuKnvONPP5L5+UDNcO/8PHH1db4+jPC+HO/CX2/s5IV
         yE6Lw+g2Ec7GO9hlD57DzGsqrScxYZz3fPZxfEPmEUDB5WVmZYC4C6kiTNTyebZOe1sQ
         GxpVGjybQtVU2Bbwe0YjYkSizC/2C3RPG/deX+9+3IQ6gDX4ve5/uZ4P3I1g4rHAfnUP
         5QkfAu1WLPNMm1gyIoy+WkmyoUefLvilkPLuul/Ktpdq6OwQ/MUK/9iNBQOysTBex+Kk
         rSbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5nVFwk1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05622a174800b003f53bb4c34fsi8228745qtk.805.2023.05.31.13.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5nVFwk1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SYd-0007YA-R0; Wed, 31 May 2023 16:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYT-0007Iu-I0
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYP-0003Ed-Uu
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30af86a96b4so47903f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565379; x=1688157379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5b8V9q6QA/WPM4HyTDg8f1UskvZE7C+FUlDujJKJpg=;
 b=X5nVFwk17NlI83u+mz3mJJemZFUKk5Ui803GxBDR5O0tTV3YOH9omve+U2DxMZxeDF
 RbkMEGdzE4znJvim3OhszWbHADWD/mqbUYyYvpnh4iFp+3VNH6zkqDb8GOhZqmuRNvye
 vShyvnlZPxA9j4+lxnvYPZYj1BA99VyHnRzd2ioDONjaHXniSeIxD0zSO3Jzj67hozrD
 W87QWLV/H8DtszAM+pu2U2CvEkigPj38ZEbsVWVVxlPg1f0xTy6DhoSSiTjG/epXUfLI
 QRvzoPJwnPku98nXWWzYlw0qZgQ1ZDUFs1A5/z/uhZlB+7b2hkHU0u/t4AQc3/YfRf8c
 lHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565379; x=1688157379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E5b8V9q6QA/WPM4HyTDg8f1UskvZE7C+FUlDujJKJpg=;
 b=OSeRagpHWrFGPXhajt1ShUSINB2Vg/qbGfsljanYhr3V+ghnf/GcF0x5d4v0c5PKtH
 476lrH6fQTkRwuDF+JH/+Kv9ssQk8605FPBD9PJh7iDouDJgchBBqptMnsuUhlHa7l9T
 XNZ+9u3mmAM2NF/h+F6vBYtvcy4BJ+Ynu7GB2e9APr+xLI/D/Yem5kJg/z2UmZpkBFVH
 tE6AfvrN84sTtJt9pv/rEINF7+mUT5N53mdQA/RvlcyP8c66o72+6MDuBbQULeDXB8BH
 NoW/ICQdIaD1BtBIBYN/PALPMl7rF2YyK0R4LNC8idbyXWKbGpNZCgCygIk1IQAd7btj
 FwBw==
X-Gm-Message-State: AC+VfDxWaMJmnc5wPrY8HgkJYwLSEEdk0kedMgd1IyxKCCBJm//jcm74
 szAcTeSeIZTx36EwL3sjiS5keg==
X-Received: by 2002:adf:f742:0:b0:306:297b:927f with SMTP id
 z2-20020adff742000000b00306297b927fmr154149wrp.25.1685565379692; 
 Wed, 31 May 2023 13:36:19 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 a14-20020adfe5ce000000b003078354f774sm7945369wrn.36.2023.05.31.13.36.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/15] hw/timer/arm_timer: Add missing sp804_unrealize()
 handler
Date: Wed, 31 May 2023 22:35:47 +0200
Message-Id: <20230531203559.29140-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: rQZA0rmz28BQ

Release the IRQs allocated in sp804_realize() in the
corresponding sp804_unrealize() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 36f6586f80..5caf42649a 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -309,6 +309,15 @@ static void sp804_realize(DeviceState *dev, Error **errp)
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
 }
 
+static void sp804_unrealize(DeviceState *dev)
+{
+    SP804State *s = SP804(dev);
+
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        qemu_free_irq(s->timer[i]->irq);
+    }
+}
+
 static Property sp804_properties[] = {
     DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
     DEFINE_PROP_UINT32("freq1", SP804State, freq1, 1000000),
@@ -320,6 +329,7 @@ static void sp804_class_init(ObjectClass *klass, void *data)
     DeviceClass *k = DEVICE_CLASS(klass);
 
     k->realize = sp804_realize;
+    k->unrealize = sp804_unrealize;
     device_class_set_props(k, sp804_properties);
     k->vmsd = &vmstate_sp804;
 }
-- 
2.38.1

