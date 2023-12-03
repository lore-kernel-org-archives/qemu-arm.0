Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2329706ejb;
        Sun, 3 Dec 2023 13:34:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRnXe0pSyYgz5x4q/8SQwRGsop8JqhPlDVg51emrnPJKgwN10rCBcS7XesrYl3J7sQIoZv
X-Received: by 2002:a05:6808:180d:b0:3b8:b402:74de with SMTP id bh13-20020a056808180d00b003b8b40274demr2447488oib.32.1701639293199;
        Sun, 03 Dec 2023 13:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701639293; cv=none;
        d=google.com; s=arc-20160816;
        b=CUZTxw0Q3NUq6N4JdqN4GH3+jisGKqRPXGeSEGXaX9or8DViLLN9cfPWrrLbi5rX6A
         ErmJSEeme0Hd9J6uFOAgLkwY2PooTATkYzZ26VRZxhW1X13/v+7DC67TTDAU90DzXHaQ
         3mP+8bS5wdT2Qg4yEKQcK0T/OUJRHByeSvL54yzu0mJBzM4h9elZwKhK7gluCpziCJ/l
         vEFmzH1MdJoYW5Ls29eggOjNBo6PS36Y8GwIBadqr3xCERVB4+xQDEQLRoRLekB8GQp1
         yLiwMvk4ew1paa3HfGbnb04hAbmgfQScEqG4Ni3ll2g2dCbsrEpBpPLtAALpyyzcVJC9
         RFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=ad2ZozK5WnxDlQv/OCt3MTPzdkeyHMAcqbLWtCLzYO/ffkDDXUYtf5PmNYGFdJrKAB
         Pl05pLtpRmsi9kOebZTl+MiXj8dn8qlunxIjq17vqfU6BLrnU3/G7ZuCXPMuo6+IJOTM
         SlKgPa9nCDfJsB8gxrJCBbSkI/HiYs/0YNPkSJbdjCIKRzairMjyjLJmMWHYTuuziIld
         6XuVatoyA7WzFRxIQkrsS0rIb91uaFsQpSI81+KvejFB6dw/L0EtTvaeAqZp9igFYRLL
         E3UL20VyviX0fk1u+4VdQiKFZCdozXf0+/4fMqENZqUygQl6gGYkykxlxAFNelstuCrh
         MsQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwB3UOKR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b0077d7eb1f670si9118562qkp.381.2023.12.03.13.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwB3UOKR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9u2P-0002St-Ru; Sun, 03 Dec 2023 16:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u2C-0001oG-4i; Sun, 03 Dec 2023 16:29:52 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u29-0005Xw-IZ; Sun, 03 Dec 2023 16:29:51 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-daf4f0e3a0fso1989504276.1; 
 Sun, 03 Dec 2023 13:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701638988; x=1702243788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=FwB3UOKREYjnz8BW61DvSL9xs98W2OjJ771DvFpG0msLbsj7krU1k1RedQvZ/6Uz+d
 8VISb8ihilVS+ZMc9JU/U7VWHEdG9E/SvLNqZByBMQPADTRO4LR1+vBfWQ0GNHX0wvM8
 yUtarkxXVaJ1fbbAGamTkoamKXxN4cnLC3wvJeHBEsTWxY/2hC1CSPSknE5gSXAAqmqO
 XpOkfYENNsAQ3wMlisDkMOvNS8ZLY7OjMavFnwcyNp6QCrBSGV3MHd17H0lnmbT6hV0A
 ntvi7gsF0UYmJ1GR3pNZOjvQ1ZquOYTjJOUT5GCC9TlWrWnRI8m6qWk9tktW02c/3lnE
 Cc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701638988; x=1702243788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=cDu0cGR1r6+Et7BqIkXQydoG1IrT14P/XozY8mT4VoHi1i3x5j89twsp/33rKA9awp
 Er+rNgxnUm+5to4t2BENx2gou3KGh2n4S37hnsHEYEbPfiiGlgpNVXmfuYe9wjyPfExU
 ZuLGwrd3k1Hk2sEbLgQjxgFH/V9kGLKtYwcyXgLhblcYUPZ7dcAkST/sA4m1dDMyOI2J
 A5003bNM+5tbZJ6+RpQEtE/dl6fqx0ZewKFxaOxV3tq5/jZMeDQFMoo69QIuZiNqCVwP
 cOfQbItqyLg9qBrNmbAdnfA2DIwQiRXcKI71ebQ1Z5RAlVIVO95gmu86eGdMFMEALA9Z
 aNqA==
X-Gm-Message-State: AOJu0YzoZvhNDw86lPQAgjMg8RB9Us0noezJbkThJ2YSUDh6K6n1Y3ny
 08Udf9ZA95Ro9SskRdZmWBnUWl15PH3OaA==
X-Received: by 2002:a25:bb05:0:b0:db5:479f:93a2 with SMTP id
 z5-20020a25bb05000000b00db5479f93a2mr1883844ybg.34.1701638988118; 
 Sun, 03 Dec 2023 13:29:48 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a25a291000000b00d9cc606c78csm1807318ybi.41.2023.12.03.13.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:29:47 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 38/45] Add mailbox tests tags. Part 2
Date: Sun,  3 Dec 2023 15:28:58 -0600
Message-Id: <20231203212905.1364036-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203212905.1364036-38-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-2-sergey.kambalin@auriga.com>
 <20231203212905.1364036-3-sergey.kambalin@auriga.com>
 <20231203212905.1364036-4-sergey.kambalin@auriga.com>
 <20231203212905.1364036-5-sergey.kambalin@auriga.com>
 <20231203212905.1364036-6-sergey.kambalin@auriga.com>
 <20231203212905.1364036-7-sergey.kambalin@auriga.com>
 <20231203212905.1364036-8-sergey.kambalin@auriga.com>
 <20231203212905.1364036-9-sergey.kambalin@auriga.com>
 <20231203212905.1364036-10-sergey.kambalin@auriga.com>
 <20231203212905.1364036-11-sergey.kambalin@auriga.com>
 <20231203212905.1364036-12-sergey.kambalin@auriga.com>
 <20231203212905.1364036-13-sergey.kambalin@auriga.com>
 <20231203212905.1364036-14-sergey.kambalin@auriga.com>
 <20231203212905.1364036-15-sergey.kambalin@auriga.com>
 <20231203212905.1364036-16-sergey.kambalin@auriga.com>
 <20231203212905.1364036-17-sergey.kambalin@auriga.com>
 <20231203212905.1364036-18-sergey.kambalin@auriga.com>
 <20231203212905.1364036-19-sergey.kambalin@auriga.com>
 <20231203212905.1364036-20-sergey.kambalin@auriga.com>
 <20231203212905.1364036-21-sergey.kambalin@auriga.com>
 <20231203212905.1364036-22-sergey.kambalin@auriga.com>
 <20231203212905.1364036-23-sergey.kambalin@auriga.com>
 <20231203212905.1364036-24-sergey.kambalin@auriga.com>
 <20231203212905.1364036-25-sergey.kambalin@auriga.com>
 <20231203212905.1364036-26-sergey.kambalin@auriga.com>
 <20231203212905.1364036-27-sergey.kambalin@auriga.com>
 <20231203212905.1364036-28-sergey.kambalin@auriga.com>
 <20231203212905.1364036-29-sergey.kambalin@auriga.com>
 <20231203212905.1364036-30-sergey.kambalin@auriga.com>
 <20231203212905.1364036-31-sergey.kambalin@auriga.com>
 <20231203212905.1364036-32-sergey.kambalin@auriga.com>
 <20231203212905.1364036-33-sergey.kambalin@auriga.com>
 <20231203212905.1364036-34-sergey.kambalin@auriga.com>
 <20231203212905.1364036-35-sergey.kambalin@auriga.com>
 <20231203212905.1364036-36-sergey.kambalin@auriga.com>
 <20231203212905.1364036-37-sergey.kambalin@auriga.com>
 <20231203212905.1364036-38-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=serg.oker@gmail.com; helo=mail-yb1-xb35.google.com
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
X-TUID: GPEcz75eRk8q

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

