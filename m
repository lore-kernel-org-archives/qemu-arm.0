Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2045786ejb;
        Thu, 7 Dec 2023 18:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNo4Ycd1zc7d1DskNo2grHzv4pV5OX1f3ES6edKtRp8ReK3YcwI2WF2qdzBbFGX2RYR8gj
X-Received: by 2002:a05:622a:653:b0:425:81a6:d40f with SMTP id a19-20020a05622a065300b0042581a6d40fmr3538739qtb.127.1702003055661;
        Thu, 07 Dec 2023 18:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003055; cv=none;
        d=google.com; s=arc-20160816;
        b=lPxJvgiWax5nUdfBf16HUnhTHA/sULkPhNiCixrM8wMMRwNIOmjzlo6QN1+hqpsK16
         WUYyYkKKDJDUvMD7+8UkXkIFOkPa0GboGbLuW3uBlIWtzpSupFtH7iUnRL80J/cC/lsw
         q1GYDTrOeUT4zkSHJOaIu76528mvhhK3Kx2wMmZg2yKSl44eQ5OJgwUi0YlUilyCuKeL
         +rksWkvKnZVAbKy5uB+ofdOaes7pQdka0HAMJqzMKMUSj3ICD1Vvlos9GJsG6VTd0zbt
         niSF741K0GakhDxaNs9jiYZwkAJbl6Nb7/UjSZdIJ1rZ+2qOIboDa3AWYR4tznHzvHhT
         IPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gY8sUeibQtSIKqZZj4hPgQKFQsYZHNo91+gsd8Kiers=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Gx36ftU4WY0pGw53WdPL3xHqhjFaoEaL6iiWd8uA/GW8qfHX4ROLU12Sc5Y3+jNZ3X
         +lLQ5DjBJOxtXolOGe+i6vCy0ykO1zbJ1Q/jTOX2z1+Fzn35/nN722IeU2TRz9iPS81v
         hAS9BdVRZZZFNBlHoyDrZolzZ32QyTZDjHfZkKtwfqVFWQmPOcP0ZWgjdj5edwm+yq7a
         pwnSeK4cmTpPEslrDRLOdOJewdzIN93PHWf6/8uh7uhcR6hkGXrMo2S9MN4gW4u2QI16
         7vilFmzaNnesIJDrb8KTilhmcZMIgvDIRr1Se+E9J9sowOnRsont4iJkkS457hYu7/yR
         gQ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yv5BscJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020ac86bd3000000b00417a09a99b2si1023202qtt.724.2023.12.07.18.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:37:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yv5BscJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQh5-0001Jz-0a; Thu, 07 Dec 2023 21:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgz-0000Ue-4u; Thu, 07 Dec 2023 21:34:17 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgx-0002qC-D6; Thu, 07 Dec 2023 21:34:16 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9fe0b5b28so20026031fa.1; 
 Thu, 07 Dec 2023 18:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002853; x=1702607653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gY8sUeibQtSIKqZZj4hPgQKFQsYZHNo91+gsd8Kiers=;
 b=Yv5BscJmN/WGKdqL9RvOSLfE7WpQTvozPTewkJ+2k97IjoRq0DFCz+Yi6takQ4Sh+u
 ABhIdvoW4Kv631nrbj3uXE/NZjcEGuoYNYwJvovvVELwWZe9ZwsffeMrFRhM5OKzbnBb
 qtOlJBbFNGNKoQVao9ZvvIX4f2/Aks5iDMs9yXUFUPPsf/fM9J11AZ35/DWZ/dRafMEP
 NgLqffGY82mJspx1+NZaWGecdNCc/MmJS5+gFCUDFl6A0iQbvkyi8yKdY7Po0qUIvofk
 cG3ZM2arkbZlK/oqCPPqeQIpGdpUTe5y5aeAEKTB7jkpH3QQbK+lVBr7jotRKY0HCzL5
 YK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002853; x=1702607653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gY8sUeibQtSIKqZZj4hPgQKFQsYZHNo91+gsd8Kiers=;
 b=iGiV5whQl+rWELZfVIlqepURm904VeenuPol6cOj6dOpx4QZD+IqGBR/Pa3xaqgt8+
 KuHVLbCXU93qyA7jDtBmcGcOIdoej9PmnszsFmw0DJYq7+XwMbHzQRQjEuX8RBJdTHVW
 B3Ln2p2UW/fql9wd47zNsPHguYlNvEk8rgxzjS2n8CIGbxcTEoIUmkOjx8/5lo59x/4y
 mcKGfUa6p1xtWfAbZMjFJ6X+aoXwGb4J6l3xZ2YG7Sr2S8tx2Ctnepn63VCYb7gsG6/f
 zAsOB95oLJSN7rzyqxw9xb6FRyqZFs+oUNHrxn5i7qwBFEokvrRvU0v0ZfTPyjAGzpjq
 qw9A==
X-Gm-Message-State: AOJu0YzQX6r63M24a7WODYjn1cIc0dZUEO4Juzol2DX07Sv16JW2fYAk
 N4MrCn8vBC+rST1PwEx6rhiy0H/s9PqgzA==
X-Received: by 2002:a05:651c:198c:b0:2ca:227b:7f4d with SMTP id
 bx12-20020a05651c198c00b002ca227b7f4dmr2327461ljb.0.1702002853009; 
 Thu, 07 Dec 2023 18:34:13 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:12 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 39/45] Add mailbox tests tags. Part 3
Date: Thu,  7 Dec 2023 20:31:39 -0600
Message-Id: <20231208023145.1385775-40-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22a.google.com
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
X-TUID: 8WGEKaqYlzjc

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 49668668da..2b140a5d32 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -514,6 +514,84 @@ DECLARE_TAG_TYPE(TAG_GET_DMA_CHANNELS_t,
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

