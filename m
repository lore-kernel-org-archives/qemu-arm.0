Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424619ejb;
        Sun, 18 Feb 2024 17:22:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMxpPDYJs58n1f6MDRluOtIJ6gaBgzMdA7IEjRtvIXhRAJAuUsy0Ww0RMOEjt67ChHjOIlACXnqSiR4dYgXBXW/8gU43sR
X-Google-Smtp-Source: AGHT+IF3g5NSnWCUHgG2joiRCSq6THzmQgE/pn7il7okkVYEAqEBBr6qSMIpJip+If+G1h5Iy+zI
X-Received: by 2002:ac8:4d08:0:b0:42d:d008:33bc with SMTP id w8-20020ac84d08000000b0042dd00833bcmr10175687qtv.32.1708305750363;
        Sun, 18 Feb 2024 17:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305750; cv=none;
        d=google.com; s=arc-20160816;
        b=Jnm7xnDOaDidDvca6Bc5K7kEQTXGl6/ewn3ONFBT03eV7YOIYKEGIX3/kWssxUv5h8
         QC2RZWYp91UcEnxKaqKh+FGwxVUEWH4PauaJr340QS5fyYG66qGfNkQ90ojo/a2QjnCx
         ZdfqMU6RB0JMDRf/5Dj3nUGlu5tKoMjDI+ImA/aYfL9AB3FQi86Re+2Iz1sD1Ryx14tB
         U+2W/9IQ/Pv/PWHVjNTKzw0DvZGp0P2/PltZfD4i/TZy3M0B53OsnibG/2aGvqIPzz/L
         fdanzbdVybga6UrrwQpzDMkQ55ZTN1bBIELQ/+L7cTlVeOJOKvkjkWWZJDC+DDdVg/fe
         5MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xY4fZ6J1E5d6nZV14RhkO1nw2p+k/NowBgJrZNhXAdQ=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=vMiTMGo7R9il8gQ3q1Z5rpjLbqqYb+909km2oCz8QVRFB42BQ7UEuk0OkX6VfskS+1
         EtefbNVmdyaA0ndur+sbdSAQJioEcTs4Qd/xqowd8TFFvYZxsM9im74XZ28+ZzbnMwNU
         GX7osy5dMWJZ8y63VFbkFuY9oyVeVmzh2/e3iMCaqOirvIGVLL3w8uaLzMpG1uLUA+RD
         E/PLoWsU3MxrTNUJockqBGkXP/uWW+lVLN9XuMt6tpbHEAfRur7ZbmEgbvHiIIR/Zn9C
         PsEc3naxSG1YfbQKHcqMfkT5cFu/RrCohqd3TNNO4vEBLWmNd4LwOmPcD5Rt4CrTNz5a
         wt7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRiQFi9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020ac85416000000b0042c70895fbbsi4960506qtq.100.2024.02.18.17.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:22:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRiQFi9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rbsJJ-0004Zi-BS; Sun, 18 Feb 2024 20:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIf-0003YI-2g; Sun, 18 Feb 2024 20:18:29 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIb-0004K8-3f; Sun, 18 Feb 2024 20:18:28 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6082d35b690so4348477b3.0; 
 Sun, 18 Feb 2024 17:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305501; x=1708910301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xY4fZ6J1E5d6nZV14RhkO1nw2p+k/NowBgJrZNhXAdQ=;
 b=nRiQFi9ZLqfb//G95xagkMpY7WFF6fx/68Nk1mQfTl6eYEfuskNrlaNmdSo5l1eMCO
 4irhIqa0GQlGTow7pi03TwoJ+N8/VTPF7Ox6Z3noXiZi592KmNdfAjcOKyoMCUJnV56v
 n1VhDfZSApK9F/5ZrOJ/rWpb0CAeehh/mg16/pGVOh3oPuW1w4SrcIKm/e70x9G1pIjK
 fQjXsrRNY2fp6m7gC++mnq+Xv0ReMIkl5wiZC6PCkwsM//jRBnA4Lo3T3puQuSmaNT6x
 /oHZqnN3oR5Uk8Km+Op/ShahPoOPIZ0fzYIQpyjV4xq+GnfJwLdbm8U0+0xYdDE4tu1O
 tLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305501; x=1708910301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xY4fZ6J1E5d6nZV14RhkO1nw2p+k/NowBgJrZNhXAdQ=;
 b=q2gCmXdFppJ1vapDSHo4JFB9q4UVPyptg3+4D/3XAbemLsYwybOBEeBQXrQBoSj0mV
 h1pdEsjSqxRtA/P7bcP1Rpq7CeI95JKkYCy9u6Pmesiq+/3my/6+8XFgJHMH4fAXOS9T
 Z+lhCok5nY8ZCTb+s+y1X+OHFY0paHOuo2uAqMZjEYgZ96dHStkDw4BpY3xGNIe937oL
 N5RQ5S7M2H3IIlh0dy1FYq1nQqbz8aIjYYIANAgxtUv6zUwZ1BwE7Gvxr0R6hK+b7DYV
 r+2HQutf0EvEXbZT8EoTWFaEYVr6MCwukvqHHL4+JHsd8R9Vv90XF5QxbCihee4AIQ+X
 V6tg==
X-Gm-Message-State: AOJu0YxnQm7LZIn/DhNvhESnV1thGGwqagmEoXqXchpGIdvw/vOFtCzm
 j4cnga32IxeUi+ZrPIdLq209yIJfeEuwBifdkd940oUsGJrGu2XR0CdeBb9B5XI=
X-Received: by 2002:a81:b04b:0:b0:607:ec83:7447 with SMTP id
 x11-20020a81b04b000000b00607ec837447mr8413784ywk.13.1708305501268; 
 Sun, 18 Feb 2024 17:18:21 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:21 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 32/41] Add mailbox test constants
Date: Sun, 18 Feb 2024 19:17:30 -0600
Message-Id: <20240219011739.2316619-33-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1131.google.com
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
X-TUID: SRUHY1ZuQzjb

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.c |  1 +
 tests/qtest/bcm2838-mailbox.h | 88 +++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
index 0928a3dff8..1efd3c628a 100644
--- a/tests/qtest/bcm2838-mailbox.c
+++ b/tests/qtest/bcm2838-mailbox.c
@@ -11,6 +11,7 @@
 #include "hw/registerfields.h"
 #include "libqtest-single.h"
 #include "bcm2838-mailbox.h"
+#include "hw/arm/raspberrypi-fw-defs.h"
 
 REG32(MBOX_EXCHNG_REG,          0)
 FIELD(MBOX_EXCHNG_REG, CHANNEL, 0, 4)
diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index e9e1f53bc9..9222b38bad 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -7,6 +7,94 @@
  * See the COPYING file in the top-level directory.
  */
 
+#define MBOX0_BASE 0xFE00B880
+#define MBOX1_BASE 0xFE00B8A0
+
+#define MBOX_REG_READ   0x00
+#define MBOX_REG_WRITE  0x00
+#define MBOX_REG_PEEK   0x10
+#define MBOX_REG_SENDER 0x14
+#define MBOX_REG_STATUS 0x18
+#define MBOX_REG_CONFIG 0x1C
+
+#define MBOX_READ_EMPTY 0x40000000
+
+#define MBOX_CHANNEL_ID_PROPERTY 8
+
+#define MBOX_PROCESS_REQUEST      0x00000000
+#define MBOX_SUCCESS              0x80000000
+#define MBOX_ERROR_PARSING_BUFFER 0x80000001
+
+#define BOARD_REVISION    0xB03115
+#define FIRMWARE_REVISION 0x548E1
+#define FIRMWARE_VARIANT  0x77777777 /* TODO: Find the real value */
+
+#define ARM_MEMORY_BASE 0x00000000
+#define ARM_MEMORY_SIZE 0x3c000000
+#define VC_MEMORY_BASE  0x3c000000
+#define VC_MEMORY_SIZE  0x04000000
+#define VC_FB_BASE      0x3c100000
+#define VC_FB_SIZE      0x00096000
+
+#define CLOCK_ID_ROOT      0x00000000
+#define CLOCK_ID_EMMC      0x00000001
+#define CLOCK_ID_UART      0x00000002
+#define CLOCK_ID_ARM       0x00000003
+#define CLOCK_ID_CORE      0x00000004
+#define CLOCK_ID_UNDEFINED 0x12345678
+
+#define CLOCK_RATE_EMMC 50000000
+#define CLOCK_RATE_UART 3000000
+#define CLOCK_RATE_CORE 350000000
+#define CLOCK_RATE_ANY  700000000
+
+#define DEVICE_ID_SD_CARD   0x00000000
+#define DEVICE_ID_UART0     0x00000001
+#define DEVICE_ID_UART1     0x00000002
+#define DEVICE_ID_USB HCD   0x00000003
+#define DEVICE_ID_I2C0      0x00000004
+#define DEVICE_ID_I2C1      0x00000005
+#define DEVICE_ID_I2C2      0x00000006
+#define DEVICE_ID_SPI       0x00000007
+#define DEVICE_ID_CCP2TX    0x00000008
+#define DEVICE_ID_UNKNOWN_0 0x00000009
+#define DEVICE_ID_UNKNOWN_1 0x0000000a
+
+#define TEMPERATURE_ID_SOC 0x00000000
+
+#define TEMPERATURE_SOC     25000
+#define TEMPERATURE_SOC_MAX 99000
+
+#define ALIGN_4K 4096
+
+#define PIXEL_ORDER_BGR 0
+#define PIXEL_ORDER_RGB 1
+
+#define ALPHA_MODE_ENABLED  0
+#define ALPHA_MODE_REVERSED 1
+#define ALPHA_MODE_IGNORED  2
+
+#define GPIO_MASK 0x003c
+
+#define GPIO_0 0x00000080
+
+#define GPIO_DIRECTION_IN  0
+#define GPIO_DIRECTION_OUT 1
+
+#define GPIO_TERMINATION_DISABLED 0
+#define GPIO_TERMINATION_ENABLED  1
+
+#define GPIO_TERMINATION_PULLUP_DISABLED 0
+#define GPIO_TERMINATION_PULLUP_ENABLED  1
+
+#define GPIO_POLARITY_LOW  0
+#define GPIO_POLARITY_HIGH 1
+
+#define GPIO_STATE_DOWN 0
+
+/* Used to test stubs that don't perform actual work */
+#define DUMMY_VALUE 0x12345678
+
 typedef struct {
     uint32_t size;
     uint32_t req_resp_code;
-- 
2.34.1

