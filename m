Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2385819ejb;
        Sun, 3 Dec 2023 16:28:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg7xTdsiqpHq14ngQu7vX1vpop9172APXvtI0oV+PPeqphvmQ/up9RNqg6w9QrKlP0u2P+
X-Received: by 2002:a05:620a:26a2:b0:77e:fba3:a238 with SMTP id c34-20020a05620a26a200b0077efba3a238mr4701672qkp.146.1701649709719;
        Sun, 03 Dec 2023 16:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649709; cv=none;
        d=google.com; s=arc-20160816;
        b=chZV4hOsiirNfVv0tTKc+XtulubVmbVgKt3x0csoN+LX5VkGIq+hflKp0Xp1JSbVRs
         JVJktcgmEUe6Ojz7nTVGo+KAOMh3H53NGdiJVPga4txFI4Uim8vPP9PrbVivGlHkmPhm
         YQmtUmunsWzfn7Cfoue1VEo0pj9XffCBURxhpc1zUf5SNkMu+nZddKbsME1nTLWz5ZNO
         cbWwgTi06kN7r2l3RvHgYm306pvV2sKNrPlLyZ958cPakqzZJ6gF675S/DOz03/YXz7C
         j2jXLaL/nsQ068WamC7lMZrHHl4omt1/UQdvjuCMstDSb5Zpn94YfxVTJTxqOmuT0TI7
         /S6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=AATgus20Gk9kFUZg44Km+pfJCNXtSgDvgWkx8I6Vv2Ugio+lR3T/HcMBvys+6uABt9
         I29gto4/8okUT7yDzXOCMXqzwkisywcvGYCeeZIS8N00qZPF37lsQu4zBSe1I0epBCvY
         CwGlktCBVnh2eYvpre/AE6Ty/OucPMWV6xhBvk1MQFZ8Bt/hRuByvqpT1VTpIqqQwx9x
         WmKe3V9ecNfJeHSvXw3gTPiIYs7tFtDIKQJvHlGebuiPoZzlMGbvYo/Lofi49JH3C0nY
         vzdbg2XEFsmtyKpfhriHvk5FLdi5zX+boUqXiQPGTv0GNjIj2iI2X1I0YeIQwXdSc+Vs
         LORA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNuQPlxd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os38-20020a05620a812600b0077f014a3328si3414552qkn.111.2023.12.03.16.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=mNuQPlxd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9woP-0006tZ-Jf; Sun, 03 Dec 2023 19:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnt-0004uY-E1; Sun, 03 Dec 2023 19:27:17 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnq-0000Io-Nn; Sun, 03 Dec 2023 19:27:17 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5cfc3a48ab2so40708137b3.0; 
 Sun, 03 Dec 2023 16:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649631; x=1702254431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
 b=mNuQPlxdHLfvyHKuq3rqUK3tPlI4YMcnlv2MwIOtXlvTE/bYCI1iYyq9NOOOvRZarm
 TKWFDMGzvVCnKhx63Rgo5aLXACXo4xg+gkPod+knDCc4kXIBO48cDaJXtrQXYFYfUj8J
 efMR/iZ3ObQVFAhhy/qUZFJNTgeuTkUYfDBaZ5qq0t48d0OnbsqFimttWbBRpxf0kAv/
 IC4XZdz0xS8h4raK6jLm7IiA86tSpKHkg5RNBOzLpcl/hGSXbIJz0j2eM9WwS7Ke6JNT
 0txcEuBEz0j0n9tXsnPlU127NXwqxoPfa+Hj20YpuB8d3Wz7ZBST0Whn7Q5HC8rlumcU
 sNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649631; x=1702254431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
 b=wEODaopVBDpBfU1aQlwg6C+x7ewpC3M9+n14gKRCXgfXFHd5QXmXmKQscBx6Vro2sC
 HJCb8dRv2ExaXKan5TfeV37jgc0fGY1Vr3e7UbAZP4hrdhv1WXBSaZEcHo6nd1LMTJ5t
 YjwTX9FdFi99gz6Hxvuz4s1yYnJw8bB9QbtSF08F0n8+5pDKAuBmY0UpWoSQtKoF0Wv3
 sw98H6E+H/4elMn6Xy5n3UGJFuXOJJvj27NPLjCSCh/tMAvXfNzMHNWd3HAbER3Ng65a
 /WvT7zcTVyHRUqhziS6l9nIg/gGUog+9fPUe9s97W1u27Wk9+uSonfo9FGzklUi65qH1
 ypdg==
X-Gm-Message-State: AOJu0Ywx+Bj+xkSzjMQ2Bej6hLwdMFrK5JQl9UjQtxUsIwpveG+Bwo1C
 hDCQdH7yORDzkSeaQyosekE4eiMdmx3ggA==
X-Received: by 2002:a81:451e:0:b0:5d7:1941:ab1 with SMTP id
 s30-20020a81451e000000b005d719410ab1mr1858342ywa.76.1701649631031; 
 Sun, 03 Dec 2023 16:27:11 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:10 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 37/45] Add mailbox tests tags. Part 1
Date: Sun,  3 Dec 2023 18:26:11 -0600
Message-Id: <20231204002619.1367044-38-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0Xikprkc/HD0

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 195 +++++++++++++++++++++++++++++++++-
 1 file changed, 190 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 8acc4bd2ff..04472fe23d 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -147,13 +147,21 @@
 /* Used to test stubs that don't perform actual work */
 #define DUMMY_VALUE 0x12345678
 
-REG32(MBOX_WRITE_REG, 0)
+REG32(MBOX_WRITE_REG,          0)
 FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
-FIELD(MBOX_WRITE_REG, DATA, 4, 28)
+FIELD(MBOX_WRITE_REG, DATA,    4, 28)
 
-REG32(MBOX_SIZE_STAT, 0)
-FIELD(MBOX_WRITE_REG, SIZE, 0, 30)
-FIELD(MBOX_WRITE_REG, SUCCESS, 30, 1)
+REG32(MBOX_SIZE_STAT,          0)
+FIELD(MBOX_SIZE_STAT, SIZE,    0, 30)
+FIELD(MBOX_SIZE_STAT, SUCCESS, 30, 1)
+
+REG32(SET_DEVICE_POWER_STATE_CMD,        0)
+FIELD(SET_DEVICE_POWER_STATE_CMD, EN,    0, 1)
+FIELD(SET_DEVICE_POWER_STATE_CMD, WAIT,  1, 1)
+
+REG32(GET_CLOCK_STATE_CMD,        0)
+FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
+FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
 
 typedef struct {
     uint32_t size;
@@ -176,6 +184,183 @@ typedef struct {                                                        \
     };                                                                  \
 } TypeName
 
+DECLARE_TAG_TYPE(TAG_GET_FIRMWARE_REVISION_t,
+    struct {},
+    struct {
+        uint32_t revision;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_FIRMWARE_VARIANT_t,
+    struct {},
+    struct {
+        uint32_t variant;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_BOARD_REVISION_t,
+    struct {},
+    struct {
+        uint32_t revision;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_ARM_MEMORY_t,
+    struct {},
+    struct {
+        uint32_t base;
+        uint32_t size;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_VC_MEMORY_t,
+    struct {},
+    struct {
+        uint32_t base;
+        uint32_t size;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_DEVICE_POWER_STATE_t,
+    struct {
+        uint32_t device_id;
+        uint32_t cmd;
+    },
+    struct {
+        uint32_t device_id;
+        uint32_t cmd;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_CLOCK_STATE_t,
+    struct {
+        uint32_t clock_id;
+    },
+    struct {
+        uint32_t clock_id;
+        uint32_t cmd;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_CLOCK_RATE_t,
+    struct {
+        uint32_t clock_id;
+    },
+    struct {
+        uint32_t clock_id;
+        uint32_t rate;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_MAX_CLOCK_RATE_t,
+    struct {
+        uint32_t clock_id;
+    },
+    struct {
+        uint32_t clock_id;
+        uint32_t rate;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_MIN_CLOCK_RATE_t,
+    struct {
+        uint32_t clock_id;
+    },
+    struct {
+        uint32_t clock_id;
+        uint32_t rate;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_CLOCKS_t,
+    struct {},
+    struct {
+        uint32_t root_clock;
+        uint32_t arm_clock;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_TEMPERATURE_t,
+    struct {
+        uint32_t temperature_id;
+    },
+    struct {
+        uint32_t temperature_id;
+        uint32_t temperature;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_MAX_TEMPERATURE_t,
+    struct {
+        uint32_t temperature_id;
+    },
+    struct {
+        uint32_t temperature_id;
+        uint32_t temperature;
+    });
+
+DECLARE_TAG_TYPE(TAG_ALLOCATE_BUFFER_t,
+    struct {
+        uint32_t alignment;
+    },
+    struct {
+        uint32_t base;
+        uint32_t size;
+    });
+
+DECLARE_TAG_TYPE(TAG_RELEASE_FRAMEBUFFER_t,
+    struct {},
+    struct {});
+
+DECLARE_TAG_TYPE(TAG_BLANK_FRAMEBUFFER_t,
+    struct {
+        uint32_t on;
+    },
+    struct {
+        uint32_t on;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_FB_PHYS_WIDTH_t,
+    struct {},
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_FB_PHYS_WIDTH_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_FB_PHYS_WIDTH_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_GET_FB_VIRT_WIDTH_t,
+    struct {},
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_TEST_FB_VIRT_WIDTH_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_SET_FB_VIRT_WIDTH_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
 
 int mbox0_has_data(void);
 void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size);
-- 
2.34.1

