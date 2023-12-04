Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2385719ejb;
        Sun, 3 Dec 2023 16:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSS8SRrmxoOK2wyJhaws2Po70JQXvJ6P/zTrqjdzTW/1ud2FvCn0k2CedwDcRjuETO5NDW
X-Received: by 2002:a05:620a:4587:b0:77e:fba3:81e4 with SMTP id bp7-20020a05620a458700b0077efba381e4mr4195936qkb.122.1701649689387;
        Sun, 03 Dec 2023 16:28:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649689; cv=none;
        d=google.com; s=arc-20160816;
        b=jSPttnpH/vW0LEPGYbryKm/eA0dNQuCmp6cU1RERYiQgMx4PhIyeNcpEoSSwiAAZya
         7iQjsNp6J1WRPzCbVbxFXDAKQ1hdqiGtopSrTdWxTWKRdqoIcqKSZ5iaQ4A8s34Azwl2
         KvovXCdFt6FgEQWN4cdLgZB6xrDLbMxzGZ5HljAVili2aCwX+xErVCE7ZnSz2dCLFYqk
         yjbp0JlP84AlpmT9IhUjZYvf893/F1GyNCMU2hV10/kvbVttrtU8cr231jhmmNOpyK1z
         n0X9br61KCP61uX8ZkVYfgbbJEQJ/wLLjRzUcIIueCj1wDm61sBP8RV5eSOU50yzZw/2
         yaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=JP/3eQFZNekQ0BpgETPJawLMYHgHhqA9AcXIkTYMUNysnFC2FqtVLVfuUFAeTsknPk
         1EIYRuwiKvTbHXETgJivYkoWIhgvt0C7CTFxhfoAzW5O/4nrBFyjsAjH75QCEG7IWa4T
         SuqipVKPSod2yhWCAr8wq9+2QxEVWNq0sCCksh3M8oTcvymq10VfNNjhjvffS9O6ZXjn
         BR9xBX6itGZEdECSkkLNNiKczVHD+Jdv4TtPwotOUCzh6S/rmQHIUN7v5EGj9WNT+ILA
         nXB/eH0XcPzVeIP53cYZeZQWDuVC1XN4iZ933NrnvlXYJnRAv/YUBZreNScmXfQ/SzY5
         IKkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QsDaL+S0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz35-20020a05620a36e300b007759f94721asi7796757qkb.209.2023.12.03.16.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:28:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QsDaL+S0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9woU-0007BD-Sy; Sun, 03 Dec 2023 19:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wo7-0005Nl-S5; Sun, 03 Dec 2023 19:27:33 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnq-0000J3-TF; Sun, 03 Dec 2023 19:27:31 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d8e816f77eso303787b3.0; 
 Sun, 03 Dec 2023 16:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649632; x=1702254432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=QsDaL+S0neIuWCUdfd11FR+lpgoGAErP2S5YT4EFRkWTHDuCgFpOBkWrizEXWsXEuN
 4DMBiqK0Tc8Pt3/0JZL2rFVMpIEoSmQ+64P/bO2cm1Q1l3v/UiZBYvOhKS9SlWaV1YR2
 v9KxDaiRiF2XmneSe9VOSsw0u+tU+Hr8jByjO6czoPbdYZklYRGdu3KFAyQAVIm6YeJ9
 AReM1dGvaFrge5ryA0gBv354nsDIMX6mm+1UaamjPHaJlhRE2FuSnyQ/UQGwOSRrCOEH
 0/EvZOF1gb501n/NcwlAD+N0a/vlP54rz+AlO8gMVfM/Cf7KD/pTitUp9nw5x8eCgDG3
 WKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649632; x=1702254432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=EZafVdtlqrUYgP5k9Gb27bWX7B2KWw9QBesTcySKQc9GKJO/E6K81MPUNvfrVkNvVP
 4Gs9P/hSLglnApLMP/XZn9eEkdDsKNl7LNmP8rjOw7ZgCNz+uOmQDvLwMbaEJZGASLxD
 uYx/YVOr9ao/xKn6hQqh8+vQaUaJQ6aBHA4E9cc1vVqv3Cbpjis/taUcGFpDAmSOh7BP
 iqOOwAaRZwOr+kG9WViCrWDZXb/Gh4WQ596oQxpB4feVMxozEStDtthV7CmJue6BThL7
 zBELa6dl29W6eNxRmrS+t90rRmbUvpKDtuVFuVO4h25Oz7nBpjoEcri9W9Vmh+0rlFhp
 //mQ==
X-Gm-Message-State: AOJu0Yy0R9aisVQHKSZCrT59OdZvLBgprLUupMqi3r1hzwnZq8tnwyPY
 lQj5AuFe2hJlAPXX3oUMudK9ef4DMBjZqg==
X-Received: by 2002:a05:690c:fca:b0:5d8:f0bd:e440 with SMTP id
 dg10-20020a05690c0fca00b005d8f0bde440mr2685ywb.27.1701649632214; 
 Sun, 03 Dec 2023 16:27:12 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:11 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 38/45] Add mailbox tests tags. Part 2
Date: Sun,  3 Dec 2023 18:26:12 -0600
Message-Id: <20231204002619.1367044-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: b6eZa9wwY4B9

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

