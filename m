Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp423920ejb;
        Sun, 18 Feb 2024 17:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXdWg3WQwGYbXJzL4UMEjVJNkAPHSKvoUmFI3Z/NIvt4nd1HClqjgIsr/ptBS0WgxAnzCNxMSDpj6agk0dOvzCdXE5VLgf
X-Google-Smtp-Source: AGHT+IHKfcZsBZjBdT8LEL5vdbgtpFTugzgvjDl47srPbHwdWbk1fgrVou0m4pedg+QFsLKkMIUD
X-Received: by 2002:ad4:5966:0:b0:68f:5ba5:5e02 with SMTP id eq6-20020ad45966000000b0068f5ba55e02mr3282935qvb.23.1708305604024;
        Sun, 18 Feb 2024 17:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305604; cv=none;
        d=google.com; s=arc-20160816;
        b=lmnfUyJd1nQDiIlh03mu3AW1LYw/0hGg2nWwMgPwuBl/rf0Nc2aN6Mao5gHhY2Uso3
         Um/74JO4gbuJ5GookWTrC5qP1M1z2pq5gAb0s1jhWL7IIAyrZnlK+U3TeXdMJNFhObbD
         8XnsEwz0ZNPzptErZ+/Jx/2sRCT6FXIhcYs88CMxO5LVfTtD+q7CsB1r0ZfHXeoPjVu+
         5aTStBRvPza1nr2FGsZRVAC03EeM9IHwslf3RAkwdthAYg+egoz+Q+/lPPQvCcMEb+iZ
         RT06s86/INcsw+QRtQzBRjy5GdMId1pajrUZPzHUNFZD9zOc+aHU5jxwHRFZNTUbdGY5
         qOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R+5nn8hCwpZzaVfTQwWnore40MHayijwV/Mz9d7pKPI=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=NyvZPyxZNBLvIINbdP5+PslRnlR0OrV6JRIswziu/YY/R7/Ef3Xpd/n7bcy6mNxpl7
         3OKGG8rl4gFTlwyfoXuTdA5DfKENKE0OgJh8JnZWGAXgfTBw+7qK3+NmO2zgGMtnkPdK
         I8AGS7EejRXJbQjUVzJUy+iAi7SuMHC5dp5UUCxzR4kSWRIl8by4aquR94Z8N7fdtQUU
         m3whuXfRkhPhbFLcv/HNUFMhihD+carT1BwoXfx7uqYsowg9AykMchNGURqY04+MfVV0
         kejGdWj67coJ7B6yu5Hz7b69G2NecxcxGbtHqOIw5f83lbGgsBsRyXiD2CgydeFgvZ2p
         /LPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h07NzF1s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05621419ee00b0067ee3520aefsi5166825qvc.151.2024.02.18.17.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h07NzF1s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rbsJb-0005aH-1a; Sun, 18 Feb 2024 20:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIg-0003ZN-Bh; Sun, 18 Feb 2024 20:18:33 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIe-0004Kg-Cr; Sun, 18 Feb 2024 20:18:30 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-60495209415so35370687b3.3; 
 Sun, 18 Feb 2024 17:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305503; x=1708910303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+5nn8hCwpZzaVfTQwWnore40MHayijwV/Mz9d7pKPI=;
 b=h07NzF1s8Y8JN9zd3Q1LvgtxBXOnoGO/oAcYB9PCvgkzxAzo14nlNtBcdGO/WDHrCS
 keaRe3FMgXtexQxknIL2teDM+oZpUOY5Iwo3QbZMwrbKb2cXWTZEfy21gepaZRLaaNOX
 oF9za0VtQMlwldkHUhGzNjNnZWyrIxG9bSn8CwePr8HtVkIFuDnhakUjpc3u9YeSWpOL
 WlKsnB3EZGmnZbSYtewJK3P4rrA5RyQSL0ox/DrbcKVy8JmVEZW9aSo3aD/q4EMuYn25
 5maQwM2TYeFx8aHadx2pYNEO36+kDHwVkzJWXBFcSA1lu696V1j056iJq8+vCILvK9ge
 L5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305503; x=1708910303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+5nn8hCwpZzaVfTQwWnore40MHayijwV/Mz9d7pKPI=;
 b=fQOypyykzk7lY1hq6KygWVOPdvYggfazm0FpBI3Yuqrt4AR1pHAZf5dfUfpbj7Y7np
 1xVxi/3yz+bBnmhCKohTQr4TBLH2Din6+Q1pyVksXajXAmgWtgNg83PaS4y6hRCHnLEL
 IppcvKmvIQveEv05PZ7taKubwq/JevS/1UrNvWJEq9OtxSyUNJ2lIL3ghZVtXttNacKF
 CSxYQZwmg1eZ3rBREoWJtcyMTnEQow5Fo5dVuqXdsVZHgXnmoMmjc7jbYKSx21e9RpP2
 9aaJyksqyAZl3lO9UHImPu22zomYexVAod+AYdVHgcbd2mBRxxr1Q5oClo31muDQ+6aE
 EGIQ==
X-Gm-Message-State: AOJu0YxOcUwIjdE1CMZqg8pBLrcZK7R3qrOjB196adxQ5ThQUoYueOp1
 ZoRqnup8If67RDTPWMFfFCBoS+z0BnVGCk7EFwWsN5s7jU+GQezL4t/ybtfueDU=
X-Received: by 2002:a81:4417:0:b0:607:82e6:aa40 with SMTP id
 r23-20020a814417000000b0060782e6aa40mr10016833ywa.27.1708305503167; 
 Sun, 18 Feb 2024 17:18:23 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:22 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 34/41] Add mailbox tests tags. Part 2
Date: Sun, 18 Feb 2024 19:17:32 -0600
Message-Id: <20240219011739.2316619-35-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112e.google.com
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
X-TUID: 4X6BSTn7wT9y

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 152 ++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 1360fbb8cf..b4f7b7b314 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -294,6 +294,158 @@ DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT_t,
         uint32_t height;
     });
 
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_DEPTH_t,
+    struct {},
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_DEPTH_t,
+    struct {
+        uint32_t bpp;
+    },
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_DEPTH_t,
+    struct {
+        uint32_t bpp;
+    },
+    struct {
+        uint32_t bpp;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_PIXEL_ORDER_t,
+    struct {},
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_PIXEL_ORDER_t,
+    struct {
+        uint32_t pixel_order;
+    },
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_PIXEL_ORDER_t,
+    struct {
+        uint32_t pixel_order;
+    },
+    struct {
+        uint32_t pixel_order;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_ALPHA_MODE_t,
+    struct {},
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_ALPHA_MODE_t,
+    struct {
+        uint32_t alpha_mode;
+    },
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_ALPHA_MODE_t,
+    struct {
+        uint32_t alpha_mode;
+    },
+    struct {
+        uint32_t alpha_mode;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_PITCH_t,
+    struct {},
+    struct {
+        uint32_t pitch;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_PITCH_t,
+    struct {
+        uint32_t pitch;
+    },
+    struct {});
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_VIRTUAL_OFFSET_t,
+    struct {},
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_VIRTUAL_OFFSET_t,
+    struct {
+        uint32_t x;
+        uint32_t y;
+    },
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_VIRTUAL_OFFSET_t,
+    struct {
+        uint32_t x;
+        uint32_t y;
+    },
+    struct {
+        uint32_t x;
+        uint32_t y;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_OVERSCAN_t,
+    struct {},
+    struct {
+        uint32_t top;
+        uint32_t bottom;
+        uint32_t left;
+        uint32_t right;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_OVERSCAN_t,
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
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_OVERSCAN_t,
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
+DECLARE_TAG_TYPE(TAG_GET_COMMAND_LINE_t,
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

