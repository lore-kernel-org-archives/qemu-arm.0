Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2371345ejb;
        Sun, 3 Dec 2023 15:47:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNFc/puWk4LaL/oUlE95lTrZZ5vy8PBGxI8mw+vblo/U9VLWbK5iz4LkKPhmIllnRzdu8s
X-Received: by 2002:a0c:fa4a:0:b0:67a:9171:b0e with SMTP id k10-20020a0cfa4a000000b0067a91710b0emr3538824qvo.13.1701647258445;
        Sun, 03 Dec 2023 15:47:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647258; cv=none;
        d=google.com; s=arc-20160816;
        b=d1m6mxpRg70qcwX1rKbvEYQOpgicFp073l91tqnuUssXl49VxDvp855hBgyYuODyx6
         Gy9PqAer+KYQnYI7m26/wUF8W+VU46Po9Fy6BvWrqTh1mByimO0MEyjMGPuiqvRJ9w43
         Usj8Wpmeq/hL3/OxdgVZP/212gKGNj3OMJ5bF3Rl2480VEKo9lp5wg69ru6JDVB9G1+I
         ybjlOuAempit0Qk8r3RDEq00KMlZVQ2Qc8gattFPc9pnVgsYdognLUbTyLxFMrxQ9BGk
         5L0wbcp75g0/NWltCTXvMs3kx3CrVVcscIu1QRzv/q+z1iAGmFSDA1JkDZn5HZFQthgZ
         Ye/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=bRfoFBO23Vf4zjdsK9mHqrSlyFfQ/Hpjlg2Q8siSlRpIYJaspEUGtxRvP8AqDNB8Bh
         vlr2WT+LP/SFmxWiV1JCy8sIKS7RwsCUX8rPr8cIP0VHl8wlN41h8Lx8jivAyerz27zN
         BKsb0GJxmxHWDlPJ6SjKr4A9N3uRadnWcYiJa49f/My/Pg2ccio1PA1KkA3sH9pSSOFE
         U7Q5/S65gcd+Qzjxhmm/mKMI8ORrdCS2d/i8tHGV96L6DlrKcRYaz6VxsTqi/i1szCzK
         EPi/8Xj2g2gGDwtsvvZgUj/4XsoGnSS+gPq3tznVTDHFXolFvSby6PIeFMgXmgOvNrfa
         HHjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vxycesly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020ad457cf000000b0067a98d5fae3si6174455qvx.82.2023.12.03.15.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:47:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vxycesly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w7y-0008V6-Hx; Sun, 03 Dec 2023 18:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w74-0007RT-T1; Sun, 03 Dec 2023 18:43:03 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w72-0002qm-Nf; Sun, 03 Dec 2023 18:43:02 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5d7a47d06eeso11694157b3.1; 
 Sun, 03 Dec 2023 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646979; x=1702251779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=VxyceslyfUpG5EX2z513nNqYMsnWgxGew3byKzCVWYwgl2/KC/CXEgC3vWdT5ANnqZ
 hbLTledc0S8sC4iJDRGjCXsrkzeRPfIQNlj6g8cbwxpQM8pK67/F6tmqc5EjbVMKJRtn
 DS27FaPjxGb0qLifXIP5URlfyfgQEUeyZm+egHHhA+OIWeZd/FamjrwHf9tIH9yahncf
 RWlBycuJnOx43Oe32skqPH3A2488TbJ6JwcMxca01yHbzDYXfXJQvLJax9jMUh2nRmnG
 XoWB6jZJdWmJWahMuQErnGHlbAeLzcDazzzgnpfhn9T1DS1AygR+b72KaTmNmY2spZJ1
 fRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646979; x=1702251779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laWmoNjX7Q2VjrFH6E3XuRIGiJEarrDw3NKpsYtiHac=;
 b=oHcVAipZdZwOr1JvI+P6nQ+U4KIfwMRBhTXeYy4a/saSKHCJtLf8X4EtJjiFQyFb7S
 F/PWx/2o01+w7mU0XfqY+5+GD4ntRpwWcpcrtcdYLHCzWE5E5flzUTd8FVjdg9VhIcx3
 bRN8+bTLmSiUKJ9NuUx7hjwqwSiVRkvmlGQ3RCTV0M5uyBu6IHkuCdH/G0NmJ6CSrZbn
 MRj/pqPggPFRT01047eqqeAx3HgI3R9aOTiIVtSJy8+0xXvpqoFjEoTXzElBH5pZxDrC
 VTlb1VyOOO1LkJcpVJ2luYt3+Lo0doSO9YFcZnqq+7+KF8WBcpU2T5SNiRFdccOqY56m
 lxFA==
X-Gm-Message-State: AOJu0YwqziT+VqjqWDJyJ51LAAJhy11b0yDI/cPYRB+T2M44+TjzdFnk
 DUIYal1Zf4TPbmgXaBMSe21GxyrfB7ojlA==
X-Received: by 2002:a81:99d0:0:b0:5d4:8806:9885 with SMTP id
 q199-20020a8199d0000000b005d488069885mr2426015ywg.42.1701646979314; 
 Sun, 03 Dec 2023 15:42:59 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:59 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 38/45] Add mailbox tests tags. Part 2
Date: Sun,  3 Dec 2023 17:42:06 -0600
Message-Id: <20231203234213.1366214-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1135.google.com
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
X-TUID: /gYtWT7AirNE

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

