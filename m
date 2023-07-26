Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp548757ejb;
        Wed, 26 Jul 2023 06:31:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHYEJEMnpwEoyH8C1+cXVyt0ZOII5iosRc+6aA48ARg3alfp2pwvDr1mFI8WBwxnfTTNnHG
X-Received: by 2002:a05:6102:11ed:b0:446:d8e1:430e with SMTP id e13-20020a05610211ed00b00446d8e1430emr1186880vsg.21.1690378261113;
        Wed, 26 Jul 2023 06:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690378261; cv=none;
        d=google.com; s=arc-20160816;
        b=qt5Lm/D6TYqltsJIO4ZbG7dfBrdaltnlilIuaERkJzqrX5mAoF80gHlb866CNvVUKk
         cR32Akgzls8UdkkuckqY/txPVJaMoqLqNnx8YdnfVwtroUGyEDF3gzwJbyxs6qiCGqGT
         Z52wNQHKMxilAmH0NtOHBow97TRSNDotmOhHmMEoIe9/5jSHpiPjYnaGctippRqth7tX
         no9MCNBLSbZyWK1kyqCzIel7KDTOUavs9tqACKLhNqIqy2h4aKSn36JPWkDNBw5dvxpx
         ks1PUh3D6AHH4vpVaz5SHRsNbM9idUdCEQv2+ZDMB3n0Wu1BcGLKCCKemccwyjVYF/Tm
         izmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WedD+Tl0ERg2wuK4KMg6yGLLxjEVeMgqe7LK+vlMzR8=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=V6XH3pcP53zam2kZ11qdUL0RIw1tviRFPNnGPI7ZVDhrfZ4DGCPHoAfPDMtuYa2bNg
         OB7TzZdvjRzuPPvpsKWN9Ig9nqnCuHnIv6qimHoggQZyEBOUeo/4Rfa8/S8GUYUkpLhn
         PAjDqQUFekoLK7YHEyeoNr+okTOIrj5OAjxMMljvSt1TLKREnVVxWfjZABvvWmfSHkYy
         A4dXPHrWkwQTeU3KGDkGCepxaJ3JZSyzbgBWtNsd7ZuZeDsMqbfnlMomPGieBDEt3vvr
         ZTud1QzupkKI7Y4ZaaQFPPtB/QW0Lx/4tXoHyIC42z8nEemWSITFccOmO61++2aV6wy5
         ZN7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=GJD2Ctpf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0cdd08000000b0063d20d01d26si1861688qvk.82.2023.07.26.06.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=GJD2Ctpf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeXF-0003FM-7Z; Wed, 26 Jul 2023 09:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWp-00032P-N7; Wed, 26 Jul 2023 09:26:11 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWm-0003V4-3H; Wed, 26 Jul 2023 09:26:11 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso10769769e87.1; 
 Wed, 26 Jul 2023 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377965; x=1690982765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WedD+Tl0ERg2wuK4KMg6yGLLxjEVeMgqe7LK+vlMzR8=;
 b=GJD2CtpfCUDpzmnKbziIN68F41zOWjSZ//Mjp61wzsSOl2uAdZ8arcGT73OCdxhpsJ
 vk8K8prOF64qpIOodr9JEoNSTpG+pzGSDzjIn/W9uDsJ18Eo/Ytdr0uUvjBkbguLcSMm
 4jQeY108RWri/Kzm/QvgLxjP7DzERYoJ0nOUQJIzEOxDbbLSeyTDMYXKPXJGfa2Nbld9
 MocWNNKiO0SKAhymicEcS94XY9Lnr2BuueJJxVoOjSMWxCAM866js1CIoWTlpOQhGlMY
 dESC/0eeJM0xIV175Cth3e6AV8tm+diA5PYjmipvhFbXRDXQCyw8rlns+yeidbabg6P7
 yD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377965; x=1690982765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WedD+Tl0ERg2wuK4KMg6yGLLxjEVeMgqe7LK+vlMzR8=;
 b=UeslxY1Zg9MU0XHoP7AgwCf/qkLBrSA58wM836R2efzTO9e4wDuZBouFAFGW/PLzfX
 J2Nu+M4jvbMYxetnPYqAqHipcYqSbrWPBipVCzbEyKUO9pwQOCqLOzavaeEJCzlaB8UF
 b0W8LkKGMl+R7nyedT+9U8zl5Ra0lSPEJ7soFhOR91qBTjK1h4ZQS7Asg1AGv0pRetAl
 iyOWa31wKpr7X7j2uHURNPFfwOfJXcFARoURWs1sO/Z9mRuFQV5yhOU6BCOGH1wrJy0R
 XKLoU4aJT5gtqRi4J1QBJgOUMyKprq7CqLGSD6vDGXrqUwpw4rELYK5YcNwwD7U4T5uP
 +TyQ==
X-Gm-Message-State: ABy/qLZfZQ/BvDvHqRc4MWb4pyVMTgpx+PmjekveAc5B0F1ZVOEFhOk7
 Cbr26HzqLu2aVrjDO0TY0xQxzG/nOzQ=
X-Received: by 2002:a19:500b:0:b0:4fd:d213:dfd0 with SMTP id
 e11-20020a19500b000000b004fdd213dfd0mr1338710lfb.11.1690377965153; 
 Wed, 26 Jul 2023 06:26:05 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:04 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 38/44] Add mailbox tests tags. Part 2
Date: Wed, 26 Jul 2023 16:25:06 +0300
Message-Id: <20230726132512.149618-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x12e.google.com
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
X-TUID: wcUYCt68dHUq

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 1fc34d092d..2231c2c596 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -365,6 +365,158 @@ DECLARE_TAG_TYPE(TAG_SET_FB_VIRT_WIDTH_t,
         uint32_t height;
     });
 
+DECLARE_TAG_TYPE(TAG_GET_FB_DEPTH_t,
+    struct {},
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_FB_DEPTH_t,
+    struct {
+        uint32_t bpp;
+    },
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_FB_DEPTH_t,
+    struct {
+        uint32_t bpp;
+    },
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_PIXEL_ORDER_t,
+    struct {},
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_PIXEL_ORDER_t,
+    struct {
+        uint32_t pixel_order;
+    },
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_PIXEL_ORDER_t,
+    struct {
+        uint32_t pixel_order;
+    },
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_FB_ALPHA_MODE_t,
+    struct {},
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_FB_ALPHA_MODE_t,
+    struct {
+        uint32_t alpha_mode;
+    },
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_FB_ALPHA_MODE_t,
+    struct {
+        uint32_t alpha_mode;
+    },
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_PITCH_t,
+    struct {},
+    struct {
+        uint32_t pitch;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_PITCH_t,
+    struct {
+        uint32_t pitch;
+    },
+    struct {});
+
+DECLARE_TAG_TYPE(TAG_GET_VIRTUAL_OFFSET_t,
+    struct {},
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_VIRTUAL_OFFSET_t,
+    struct {
+        uint32_t x;
+        uint32_t y;
+    },
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_VIRTUAL_OFFSET_t,
+    struct {
+        uint32_t x;
+        uint32_t y;
+    },
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_OVERSCAN_t,
+    struct {},
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_OVERSCAN_t,
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    },
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_OVERSCAN_t,
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    },
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_COMMANDLINE_t,
+    struct {},
+    struct {});
+
+DECLARE_TAG_TYPE(TAG_GET_DMA_CHANNELS_t,
+    struct {},
+    struct {
+        uint32_t mask;
+    });
+
 int mbox0_has_data(void);
 void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size);
 void mbox1_write_message(uint8_t channel, uint32_t msg_addr);
-- 
2.34.1

