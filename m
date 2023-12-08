Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2046179ejb;
        Thu, 7 Dec 2023 18:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF2u7Qyr3uCSF2tT7Xvag5xce1J/0baXhsH9y1NdZ+Mp7f3sfrNvEb6Ulr4RBKw8kAcWJG
X-Received: by 2002:a05:622a:1452:b0:425:8468:bced with SMTP id v18-20020a05622a145200b004258468bcedmr3751939qtx.60.1702003136171;
        Thu, 07 Dec 2023 18:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003136; cv=none;
        d=google.com; s=arc-20160816;
        b=isQlicNBTWz/7hYXe8JHPyqOXLFBGckddG8GTBBuqLxwbrJmGaDab8uRA1iGUYyCRw
         bIspRy+obCOsiWBy+L0krz62JgyfpVq8Qv1cnvKjLQ1M8dZoe4Syl9D0iTqKUkrv+TVI
         YtRLFEX+Fc8RZ7fMcnwmCofGe6AZgPuyfUwqFfTBiq79guu7Q0zPKA2EZUE3NHnpfCfk
         mblOzJ3ryuIjM53GP2GZx7BAIY1OcHzV1VsVPaZKcPWl2HkM5Pet9Bdnf3Z9C4u9aqb7
         Ev34TD9TyfY0AxDesjcLmw03yo7JhWvWK+z/eel3y6xwlYmaVxKRNzewIAsbJajJ29pq
         5wvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=dQc5UYHJP4YbuTHOfjhjROVHySAuUGWZlwCRzzZPRbpNsWT82ofo0gOmtn21R+nNKO
         qPyH5v3Nn6eyj9wEZElIfJq3qM45Y9nHdPRXNtJavUmRrFzTgvyI/SLHbWsucBxKtG7X
         8bcDBEI0HqN4a63ID16+5/o6yQXRpcsN1qlJVb2qfS6+IDB/wFSL4yVEJ2wvpTF/j/nd
         WrMaKYJ7cwAQB0rb6nmP4reJUWx4jfCcwJk0Q1LsX6c99+o1wBkphj30Yhb03b9ehRmi
         nweECOWKkwQUI5Zt+s7dKxYDl6Z6lHdThKVSKjpBYstcd+Zbc1s+1uKiMCZcm8WZdNq7
         UO/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fifZCz3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd21-20020a05622a5c1500b00423a141ebfasi1340170qtb.111.2023.12.07.18.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:38:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fifZCz3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQgy-0000S8-TD; Thu, 07 Dec 2023 21:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgw-0008Ug-0l; Thu, 07 Dec 2023 21:34:14 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgu-0002pZ-6W; Thu, 07 Dec 2023 21:34:13 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9f72176cfso19260801fa.2; 
 Thu, 07 Dec 2023 18:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002849; x=1702607649; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=fifZCz3+9cWxchpvYE9GQRvzWeqYnj1JAaU0Ji2nAwGpvFIjFQOrGRsj1BmjF9eFla
 jsFKCyEhYMmqBk6VENGUoNS6li3jEsKXT4uh+bms9nGTJm5xXveszg2gfU3r3YjfF5fN
 eW1y0GJomrhwbgU6iGC3PH0XJHS3Jm1lIfPTNSZBstkOUInwQEBEXAquq3ndEFaipCh/
 PM9PPUI6RRXVcnqbUa6gNbuysnn+gBVx73+Wa0MtqzRdcPE07o4ppb81s59oFMJfEPMu
 yvAHIZzn4q1vDVyMXtm9zF7ku+Cd214thrfEoOrESYnG6OPO5+6VOQKl7ULJmGWI0iqb
 6z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002849; x=1702607649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=ARz8q5SmO/iG8DKNnNRLC8w/oEt7cMHyGod6mXMZBMfWaEuQmqGFONMGFOV8QZeRXQ
 fx6ZWDBM+tcAYW50VynZRLglJaPqESLUY/DCM0HyBBqUH1LnMkFxxyFfZALkVrYmmERo
 qQA39e1pf9ZcbkxYrehRrVGzwW8Nd4Ix4CBMjllZWSDAkRDYCwT7L4A+lEoeLtLpFHYy
 Xg501bumzAAauxUMNuo4G78CEUVMdwv/jvN8KXitlq/05ODXDyDO7vICeOYC568S9KTJ
 7+eBCMJfsRwLkvGJot/5W0/1OgJ4Qy/uVUZ2leJklCbAjAu39DsU997VkrVn1YdTfeeI
 e5cg==
X-Gm-Message-State: AOJu0Yxft1bmo6TJ4As18O8vvP0eW7ln8mTYQ1PcrLu7iSptdvOOv4zn
 E22xUYMvG1EeetPWTbn5OtjdPhHOZOShHw==
X-Received: by 2002:a2e:a7c2:0:b0:2ca:2966:e750 with SMTP id
 x2-20020a2ea7c2000000b002ca2966e750mr958739ljp.40.1702002849409; 
 Thu, 07 Dec 2023 18:34:09 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:08 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 38/45] Add mailbox tests tags. Part 2
Date: Thu,  7 Dec 2023 20:31:38 -0600
Message-Id: <20231208023145.1385775-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x232.google.com
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
X-TUID: evDyjtn1fR88

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 04472fe23d..49668668da 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -362,6 +362,158 @@ DECLARE_TAG_TYPE(TAG_SET_FB_VIRT_WIDTH_t,
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

