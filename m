Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp423888ejb;
        Sun, 18 Feb 2024 17:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTx/Dxt40X8OoXb+3TyBNX3V7vjTuipwsQiZrDlQv14xT4kAANJt8XZomoVxsOsuQk0gXrmamyIa7hjxx7hQSPo/niU+el
X-Google-Smtp-Source: AGHT+IG3Q+ttrL/cWHq6tYVxJrk9vhI15dl9lkifhSPyN8tVKSKeEwQP3NzuJQxDFtCetQ7/pH3x
X-Received: by 2002:a05:620a:1013:b0:783:bfb7:77d5 with SMTP id z19-20020a05620a101300b00783bfb777d5mr13056971qkj.78.1708305596997;
        Sun, 18 Feb 2024 17:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305596; cv=none;
        d=google.com; s=arc-20160816;
        b=bF9AlQFlGBD6dZunN5OV7XH8RWcCZ/I3pWJu1h2uRMRuyAOJjbcaeF6O1RKTwFMT3Y
         a0WiXAgEwsu1qlDs2sQBDorRutI2shF6XT8ObFa7JxZWxdPuZRappMNwLhU2yMxR6Jtx
         RWx6XpiQLB+KPIyP7g3BAahtI0xH5VjwNgprlQquxdDcPnnwN41QitLRrSRdNIH4kh8k
         1hustl80hKqRXfG7X5HfB009JRq5U3yL5WHRBBBOoOylBffW8dG+zcr8NMuqEqIScrua
         ZlCkuM19S/4mXHxSmDRftWQz+1IJhI25uAxDLhK+DUSu50vvao+SheZ1dgUOsPJ2q8Q9
         NWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xDMTaxB0TWxp4LTnEEK1r7+Pg3vnDkkuQfxuwY3SDHI=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Aa2vZFW6zrLj8Mu8ZAtQbbq7rL02rjDi4DLTMe+7/klEHOeDbOwLl858yKUt6Ln1Ii
         wD+M4V/jkjPUSSA23W26soLQiq64jTX4woScs4hhX5YENXNySiXC1A8np7Lf/wbhEW3S
         x2lEunLFrYbYe9q5JiVhk10f1YVY2NesbX4D83R+MZ72yfg4MMXH9Fd5vjSUSXUt2eMW
         bmQP1LA4qeWNyZog5l0ng/6YK8QuycrG8nd1tKIztL4Z3A2aP/Bt2SY+2t2cPG7dHB8z
         gPBy8nqjxdA69Mw6gZRA3gkZiKZK9vsp3sqYaDO5BINn7DYB+jFJg0EhTnQwHDHaXWIE
         DFFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KVY0Fvdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18-20020a05620a24d200b00787354bed11si5661460qkn.413.2024.02.18.17.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KVY0Fvdc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rbsJJ-0004as-Eq; Sun, 18 Feb 2024 20:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIg-0003ZQ-C9; Sun, 18 Feb 2024 20:18:33 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIc-0004KU-G4; Sun, 18 Feb 2024 20:18:29 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-607e707a7f1so35130597b3.2; 
 Sun, 18 Feb 2024 17:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305502; x=1708910302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDMTaxB0TWxp4LTnEEK1r7+Pg3vnDkkuQfxuwY3SDHI=;
 b=KVY0FvdcdqDPSOx1XRiJC3YuOQqyVY17pJPlHQt+RzvOM6pdecQBjXEfrTi246IHR+
 NT6j5NtgkqycVm2UKp+vs5WP85fSH4UpsgRSnTJ8PKPcuLTPZkYl8KWfnf6CEv1JgCbO
 O9zO+8kRw2dNZOW3+KAaD0P+xaP9AcQIHLZjqR+Ew+RQQ5YUYAm3AMC2UGaJn2FJKwMH
 9G0ngEQaxZ/XS81PuvCLYghCsFRMV/Hff/s93FR3MXDyly2HqyrqjRH/IwJfujAeGN+A
 PNAKOfnw9WW9IN2gzItRdSsj+u8kEx+QJ4cjv48VL9YTIk8ZzPmbTVTF8ukbL9SOWGOM
 2R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305502; x=1708910302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDMTaxB0TWxp4LTnEEK1r7+Pg3vnDkkuQfxuwY3SDHI=;
 b=Y/OZZCsaGadjhQBmW8DR3LGomEP43bB9pDF1OhNT9IGKLqkHYAMkDLYU0xHs4exTn0
 AfGQJ3s2qi5/cJ8jixr1SdRWARegBwrWd7+vpL1e6OkUIeR9sGiz7IyEDHmxAojPF+7B
 ihPRjKpVVzKMGzeLwDbBqtLcyjpL4AganLNWyLzZy6xgFoWBW0qa15+aolJzU4nW9yLH
 roWIeNo9VZPe/xdxVrKdAuF/j+0zE33rOXh/tNnM2YLaOgjnTYHAWWNY8r6VnQhXifnM
 Dol/dbTSnze/T2kx+NvitowkPLFrZFkDSEn1PZ0JggPyHWscBQY2mW9xvgKc6uWjPmYQ
 x21g==
X-Gm-Message-State: AOJu0YzZmwv3EucjrHWGujBtnRmHZA8xIdrOJzOOZiFnregA6SH2Y2no
 gXfGvTrwgWcdGYUZA2MnQJTzj9V28L8fzV4gv6FwRoukruChsv4Z6JtD93uLcbY=
X-Received: by 2002:a05:690c:f90:b0:608:ba4:1270 with SMTP id
 df16-20020a05690c0f9000b006080ba41270mr5907465ywb.13.1708305502183; 
 Sun, 18 Feb 2024 17:18:22 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:21 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 33/41] Add mailbox tests tags. Part 1
Date: Sun, 18 Feb 2024 19:17:31 -0600
Message-Id: <20240219011739.2316619-34-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
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
X-TUID: jlPYgmUStepE

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.h | 177 ++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 9222b38bad..1360fbb8cf 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -116,6 +116,183 @@ typedef struct {                                                        \
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
+DECLARE_TAG_TYPE(TAG_SET_POWER_STATE_t,
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
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_ALLOCATE_t,
+    struct {
+        uint32_t alignment;
+    },
+    struct {
+        uint32_t base;
+        uint32_t size;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_RELEASE_t,
+    struct {},
+    struct {});
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_BLANK_t,
+    struct {
+        uint32_t on;
+    },
+    struct {
+        uint32_t on;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT_t,
+    struct {},
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT_t,
+    struct {},
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT_t,
+    struct {
+        uint32_t width;
+        uint32_t height;
+    },
+    struct {
+        uint32_t width;
+        uint32_t height;
+    });
+
+DECLARE_TAG_TYPE(TAG_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT_t,
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

