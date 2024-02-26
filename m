Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1763553ejf;
        Sun, 25 Feb 2024 16:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7WoKyDBVW/S2+5LiVrK1DwlpFzI6bDUsOeYCVYPIzB+TA0Z5wRYHr8R73m2YGKhTd9Pu1l375fJ5KHlPGVuFXtNcjqD85
X-Google-Smtp-Source: AGHT+IFjW3cXPM0VQWELOlQO8YHiPry2F9uovZZ3sYk1/zcKhlw0i+hlv2mtj8vSHIb1U/bj3UJh
X-Received: by 2002:a81:b203:0:b0:604:a75:4274 with SMTP id q3-20020a81b203000000b006040a754274mr4220866ywh.51.1708906081511;
        Sun, 25 Feb 2024 16:08:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708906081; cv=none;
        d=google.com; s=arc-20160816;
        b=ai3QUKrh9MGkbu4JFN7Br8A3hrXuG+hNwfoNh36TGWJd9S2/VZ0of5yJdBMBfVTiYh
         GVYwW6IPd+DmqaYtBKrROAnEYYrJhcHpuhlBMLo9e2pZWarga1LwxObSbn9lAk7gp+hS
         elaOjh98o87q+tiCKuRFkaG/j/Ru+mhmQMYGxPN6bho44mTN+ccVU7EOPy4gwGU0Ozet
         aQ+C+IVA69zC2mYrtsqKCiXs3Bmvsv1rsDPD2y3C2mW9SzEDiwtAl3VIHyjJ7VrPbPIy
         5tmj0Nk4VG6/7FAertQZawpcyAXf51soGa0LR7pEsIqq0kDd3azbkJ5p8RwxtyZ57XpZ
         RGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UgxIa5HOf2s4PxPeT+Tes/SCgEQfKR5FNbiYSKZGSJc=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=MECYje5cqTmG/42sXM2GyR0/azJtvH8a7Golarr4MDf5XvqhLy8d/gNIdlgDfQEbOd
         SoPSLt5QMgIkZv4fQGeZS7r4SloQRxkjz+VDxNvyqIuDu5k5Qv6eLARWHl69ie6MR9Ju
         +aN6CcHXtJmN0zX4XcrrpV2KH9iPrKoPfAMcCzYWJN6OxF1uLKoV8wZhi8NtLG1Afk3s
         yvYo+sKwhcFvhUQnX26R8vPN0v+xv6teeoz1AB6LJLsUl3PNMDa1FcItvPxw76Ez/DED
         Gh1SRfM5eK4npDeGdYuJgxpF3f87nrvdCT3E70irvdG/YuGjdBlzztyBCldKmIBlkLH7
         Cnrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0P18zD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t30-20020a05622a181e00b0042e724f7f88si4434176qtc.274.2024.02.25.16.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 16:08:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0P18zD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reOUQ-00007D-8d; Sun, 25 Feb 2024 19:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOTI-0006yT-FD; Sun, 25 Feb 2024 19:03:54 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOTD-0000aN-Ru; Sun, 25 Feb 2024 19:03:52 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-608f5775ce0so3106767b3.0; 
 Sun, 25 Feb 2024 16:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708905824; x=1709510624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgxIa5HOf2s4PxPeT+Tes/SCgEQfKR5FNbiYSKZGSJc=;
 b=U0P18zD8v2rNXTJeDWFGPJtLjo6XvCexFZeu5DvSq3loWjH68xAxIfRGYfM/93SxGL
 wVbd9Eh1jkuVnOGn9NhreKSqSzkYW6F4zG3PCJi26T0hDoMwAVMLvHjklQCJgfwCr/u/
 brnhNTLYaW9bbwQ5mRU1w7eZ0Urlo1abXvI1xELcYvpmvN3iSNN9ImWo2yn631wI8vS4
 vf9w4jyUeX+zkcGZCyEJGbMCVbjqRa4OqnJG0O8DeBoSM8Us9veXDGQPJa/ZQftgiRDy
 gIJ/kybtNC8AkuTjD4bvKJsS5UiKYYQK93pGh0jmbGievyobNp7ofUwP+bK7HYMTQjQ3
 b3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708905824; x=1709510624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgxIa5HOf2s4PxPeT+Tes/SCgEQfKR5FNbiYSKZGSJc=;
 b=rLtBM9zZv0OQ8JZYFEP4UXcA94PyCJlnCU+lYxAasFPHir4FhnVosevwDO0QyIdpSY
 KjlrL6AY80CYBHdDVtHBiTHjebVPoUyY0mdIEir+L87LNml26FOuL4jhIBHNAV6FUGa4
 Slq71YWH+mKjcGW1z5ohvxzw2aiGm4t60aKYqpQmDUZPW7V87j03yIS1tnMpKINkBiVa
 buDIN9wdo3SDGinJHE8Cs2b4vIVZ3AZm53eNmT5WR1wfRZ1TwJtETq1417OfDPBrPVW0
 d5O1s88ZPijMW9Xt/GK1Js+OSbhGblbrmpS/Q/b+JL+iFfn86GKvw6RA48z33BSCSrfS
 PgMQ==
X-Gm-Message-State: AOJu0YySJH9DIJXWJiF5Nhftq7ZqCn0hb8eGYcIEv5Qk379ttPX4eUcf
 RPlIIWl+OkF3esb1BJBzlKPIX1Zv+b9SnHObgYh7ZbgVX5PrcxLVz1DCXJqiiNkstQ==
X-Received: by 2002:a81:8d4d:0:b0:608:218b:54a1 with SMTP id
 w13-20020a818d4d000000b00608218b54a1mr5075736ywj.7.1708905824659; 
 Sun, 25 Feb 2024 16:03:44 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm938171ywf.114.2024.02.25.16.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 16:03:44 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v6 35/41] Add mailbox tests tags. Part 3
Date: Sun, 25 Feb 2024 18:02:53 -0600
Message-Id: <20240226000259.2752893-36-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1132.google.com
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
X-TUID: Q0cGK4UD4lqg

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 78 +++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index b4f7b7b314..d753f17fb2 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -446,6 +446,84 @@ DECLARE_TAG_TYPE(TAG_GET_DMA_CHANNELS_t,
         uint32_t mask;
     });
 
+DECLARE_TAG_TYPE(TAG_GET_THROTTLED_t,
+    struct {},
+    struct {
+        uint32_t throttled;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_NUM_DISPLAYS_t,
+    struct {},
+    struct {
+        uint32_t num_displays;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_DISPLAY_SETTINGS_t,
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
+DECLARE_TAG_TYPE(TAG_VCHIQ_INIT_t,
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

