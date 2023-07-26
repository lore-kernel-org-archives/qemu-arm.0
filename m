Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp629083ejb;
        Wed, 26 Jul 2023 08:29:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmYIg+86jj4kcsUpFMQEuk2qHH6+DURYdMnWzRujKofj3fUsE+gu8M+TLPu5Tin2Xqp95f
X-Received: by 2002:ac8:5c02:0:b0:400:97c6:b40b with SMTP id i2-20020ac85c02000000b0040097c6b40bmr2954875qti.48.1690385379835;
        Wed, 26 Jul 2023 08:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690385379; cv=none;
        d=google.com; s=arc-20160816;
        b=O55rIKvGKy8Hc88Mp0zhuE7pQxtZI/RD1Eg/YqSIwZ8fk6KZdYgCUdpwRxRHVf76bs
         GkYJ+dKbtPKu+waMHEZ7JPdtzmP7W//Hwv6KPgz2F0hldryQjbzSkTyS2uiwwiHmdU0q
         Slyu/lqbW3VVUXH+6MPhpIGeUKiRR0ccxr1HiVbWmsJ/Keqncp1VCEcj+kZ/B2Kg1pjx
         0uuF8eCjicvL/XbbKdZrWnl/WqXE5IipVndl7VngB7hKgd/ENCmTpaW9kaUSZwis4yQa
         IL3VS4W9PXFR7gyNWOUmLUiXecHk6KWigpHf4m2OdjOVlZVQTu1/1bMlMCYWPORAfGSc
         JOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vyTHZGGxbLPWI0FvrSa79BpO28HsE6/50F6ZMjomrIo=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=KI+XC/Rk8TBVxKU0l3MEEXmcAh3Bvs3rm3BbMF6+8HiMoriiPeam4bQOYvv11TYjPN
         M+P7j0CA336NCBrReYdCrlO+e6eU0zKPu2hvSaQGxia0MgqMtSxFpgSryqgAyvma/b7g
         ZSpy4NbFjMuJk7uOTZBw5JibXLWpoVWSqbvsRhqSjmqQvU/uWaBqKDng8d2+dz/kxnJb
         SPCet0pP+O7q3bzcanU1pCDYcVR0y2MLDd45QRvwf0ZYEENutQt/4Gr/mzTFEXzx0F35
         WC8d6RukbhPU3vZMgzqyn2lxgZea0DNq/OvKqfOmCtBk9pv9eBZUSjdtjzpkpoZyhbQp
         ubzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dgc1Euir;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020ac85889000000b00403b10c3cc9si7981172qta.270.2023.07.26.08.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 08:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dgc1Euir;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeWy-0003BQ-7V; Wed, 26 Jul 2023 09:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWq-00033Q-HN; Wed, 26 Jul 2023 09:26:12 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWo-0003Vx-Fc; Wed, 26 Jul 2023 09:26:12 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fbaef9871cso10548597e87.0; 
 Wed, 26 Jul 2023 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377966; x=1690982766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyTHZGGxbLPWI0FvrSa79BpO28HsE6/50F6ZMjomrIo=;
 b=dgc1EuirtZGRo5OdsZqD961u5zhqk0SWQA/DifwBIStLgNeVzRi9IRhfHuRJnnF87S
 tAEYlwoRl0cgApZLHH7GzD03qalOgNlAJ1jpMa617iajeXb8ekX2VEoxypYCtXIarmtp
 jW8nUR7Zv5iJvL2kQbTJBHNpyvgMWpbMLA5e28sENUwBrMtobAhS2FTLdmRIZMrhygeX
 oX2Nxc911U2HVOh4FPdb7gpKw+AILdnybXsa3aeEeCI/YRpuxyUGWCCR2NVI8lNpPbLN
 b2bfuPMJ5zjwZasMNVS3N5HMekUtqpe2TM3okT45r6s5lGPTN/R18VbdnljlAR2S+KJ9
 3O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377966; x=1690982766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyTHZGGxbLPWI0FvrSa79BpO28HsE6/50F6ZMjomrIo=;
 b=UgRXjwXowVt53sCMHG6K3hWWgSEZtRTw9dAgFp1MUk3btMEES6XUHsfR+MEhvNVhVv
 y+LAONS4YFllkES5ak2YPllIEvMlbf7SD5+x4l8eGqXKiR4uVMi3a+/K4opDQQnDTBso
 4D7ttCaPeZjteWDJmxon8hkQpN0eDHot43VvbnpvE291rmW3PjeZJP+Ie7tkYeqWeFTX
 8DTNeWHw7PyXETFhvosKJ2z/Zg2xivMJfbm3yABjmOI9fVtYYwh/hkOwwetic7OgvB0o
 34tDQZdDtucH15NexG1FtRN9Tmgbk4TchwBn1zhonN+DeeCSozacriGSl9c8aKYRFOCk
 NCYQ==
X-Gm-Message-State: ABy/qLaAgJZVmR7YLHvqy2uWXTWOrJE4eXoGg9T54+VrQdfOO2GrivIz
 eN0zL4Z8iidzoPZUBXIh6osDL/RlNe4=
X-Received: by 2002:ac2:5312:0:b0:4f8:bfb4:e4c4 with SMTP id
 c18-20020ac25312000000b004f8bfb4e4c4mr1487745lfh.19.1690377966278; 
 Wed, 26 Jul 2023 06:26:06 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:05 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 39/44] Add mailbox tests tags. Part 3
Date: Wed, 26 Jul 2023 16:25:07 +0300
Message-Id: <20230726132512.149618-40-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: KViRFBphbwtz

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 2231c2c596..d8975b11ea 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -517,6 +517,84 @@ DECLARE_TAG_TYPE(TAG_GET_DMA_CHANNELS_t,
         uint32_t mask;
     });
 
+DECLARE_TAG_TYPE(TAG_GET_THROTTLED_t,
+    struct {},
+    struct {
+        uint32_t throttled;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_NUM_DISPLAYS_t,
+    struct {},
+    struct {
+        uint32_t num_displays;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_DISPLAY_SETTINGS_t,
+    struct {},
+    struct {
+        uint32_t display_num;
+        uint32_t phys_width;
+        uint32_t phys_height;
+        uint32_t bpp;
+        uint16_t pitch;
+        uint32_t virt_width;
+        uint32_t virt_height;
+        uint16_t virt_width_offset;
+        uint32_t virt_height_offset;
+        uint32_t fb_bus_address_lo;
+        uint32_t fb_bus_address_hi;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_GPIO_CONFIG_t,
+    struct {
+        uint32_t gpio_num;
+    },
+    struct {
+        uint32_t zero;
+        uint32_t direction;
+        uint32_t polarity;
+        uint32_t term_en;
+        uint32_t term_pull_up;
+    });
+
+
+DECLARE_TAG_TYPE(TAG_SET_GPIO_CONFIG_t,
+    struct {
+        uint32_t gpio_num;
+        uint32_t direction;
+        uint32_t polarity;
+        uint32_t term_en;
+        uint32_t term_pull_up;
+        uint32_t state;
+    },
+    struct {
+        uint32_t zero;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_GPIO_STATE_t,
+    struct {
+        uint32_t gpio_num;
+    },
+    struct {
+        uint32_t zero;
+        uint32_t state;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_GPIO_STATE_t,
+    struct {
+        uint32_t gpio_num;
+        uint32_t state;
+    },
+    struct {
+        uint32_t zero;
+    });
+
+DECLARE_TAG_TYPE(TAG_INITIALIZE_VCHIQ_t,
+    struct {},
+    struct {
+        uint32_t zero;
+    });
+
 int mbox0_has_data(void);
 void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size);
 void mbox1_write_message(uint8_t channel, uint32_t msg_addr);
-- 
2.34.1

