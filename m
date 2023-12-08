Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2046134ejb;
        Thu, 7 Dec 2023 18:38:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoZZvNWoRcMS1slfMzzRe/XSv4T4YKLIwkAKDOAwnEWmhDE5oj7EJQYtkgqHizC4ImYEN
X-Received: by 2002:ac8:57d4:0:b0:415:1752:1be5 with SMTP id w20-20020ac857d4000000b0041517521be5mr4079793qta.31.1702003124972;
        Thu, 07 Dec 2023 18:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003124; cv=none;
        d=google.com; s=arc-20160816;
        b=rVny3gAJAvS5Hm60DRyKvRTfaNRUoPOxDTJT2CQEhH86uT67uT667ignv5t0N6Kaso
         9Yzdb0H2ZeMyVmRhbTNDEo7fucf0OeFY3ccg4I8NBnV/6lZcWHYfcGDo6N7Ng/w0YQrk
         gas0wPobw6n0ItPHGjPbReZbz5C1QVSPtqqASttVBdS+0N9q6/hVyAa6soTa0ifQcmCw
         C67+fDVlyVy8fYMGcAGcB7lA/2ma1LdhpELU8zcff2uvoGdJ964gCxhRVJ+blnuKMr0C
         MfQQhtjUQ2MIuWRONE7pL5Jtvr5JF07dTiNHh5lPnuAAuKyZIpp6QgJN0dZtBmpe6S+S
         jPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=yV1M3/vGiYHENrONzucCNwWC2MLHXb41+FmQNjv/TeDiLXbjQ3bjH91u1gUHkqPheS
         nAC4Ua1F+Y+ERjXpUctOjlr4+OchfwXMJkwy1sp9jh7tLRmz4aeoT/5axeNYOw3vAefB
         G+e1BtQvoQe3rt2HyBr+ebN4Oh5cC8xMcu78Uwjiibpsh1jHL2t67tKzFxT0k2+G7A9i
         meEFxfBUlivqPthRMmOG78GVb+jeL0/wAhrv8dOUyZgA/USvOLOXpAQcHtLOsEX08/De
         AoVacOvdXXb75gG5zvcTFWJXsRyN2UBYss0Qampri80dI/cENMVeaKipDT9lcjqMvaki
         3oZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fiD20TfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05622a124800b004259cfddfc9si846521qtx.627.2023.12.07.18.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fiD20TfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQgy-0000KM-9r; Thu, 07 Dec 2023 21:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgs-0008CP-B9; Thu, 07 Dec 2023 21:34:11 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgq-0002p4-I0; Thu, 07 Dec 2023 21:34:10 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cb21afa6c1so1426031fa.0; 
 Thu, 07 Dec 2023 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002846; x=1702607646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
 b=fiD20TfX3alHyl8bPfidxokjcr0Bw3eLnOKyqMsaMAOb5307wSXfQtomWMOgEmStyM
 f8HvkZFJEFzExbgmcmpv4AtsqN9gncYvcl168y9G7e/e+tXQddMMep0a1o6+5JH9dpTz
 Obp8rEIGJKoQ8lDmTa7bdQyvugjysZQWFul8Mm1yhXfJzrpl1uqam78HMhTImBRfNNUw
 GIkktVcBdJOvR9oGn0+YzvhLS1Ghg8qXy3FuLfrAwVukZG2iKHb3sn8ekkz7QIW21pAg
 HSUuK9QmUhLqrxJIJZnAvy2ongo/RMYXGUQ4ffjHfsul64sYZCOdaSnVAt0/0ILISpRj
 lBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002846; x=1702607646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/krSYU1BfE52MIIAgN9xYHAgzoYPsQ2UC+lvFrcJE0=;
 b=EAZIynghPLASByRy25EdUvwADOUsC/Ua6EulYn965BRDnh+mRLk6Muw5r4/TtSuk5I
 NDNT2uzMGnv5cLZWeqaz2yVYYVr57BO85Ta5dFnVaBihwqVZbtrn12dMn8e2YRKi2tF8
 DlZYKzz5i8639Y33ZtV5gYNw5e8SEhDICyvztClyTrUWu+5PSSQrTUvTYP7QSM87HFDN
 BrFShuJsJAM4VDu/nuGNreQSgLhGWRb3guOsWxFUa5TGUAgrfwzW1laCCohTRnwf5pKv
 aBj0jQYQr4n6KS5E8B02/DNcqMI5Vs2Ld92FrrRPrI2wbYEPfNEXPTfSer+FO5oYsstb
 TZFw==
X-Gm-Message-State: AOJu0YxSdRNMGp6b55CLZVw5DYmdH+6CGi4jKErdKZPLeSfVil5W1jYJ
 8SytWRfbGK7M/bcW4EccuuySEGPbFLE/gA==
X-Received: by 2002:a2e:2e04:0:b0:2c9:d773:7dd0 with SMTP id
 u4-20020a2e2e04000000b002c9d7737dd0mr2286800lju.4.1702002846109; 
 Thu, 07 Dec 2023 18:34:06 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:05 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 37/45] Add mailbox tests tags. Part 1
Date: Thu,  7 Dec 2023 20:31:37 -0600
Message-Id: <20231208023145.1385775-38-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22b.google.com
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
X-TUID: vbmDuJ/tC6G8

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

