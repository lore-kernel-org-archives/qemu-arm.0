Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1857311ejb;
        Mon, 9 Oct 2023 03:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/1CZsPTyLLUs4HrPuxjhPk5cX6beXzFho18ddtMcWG8teBsj8mFsE3P2/l8zzZF2pFS8z
X-Received: by 2002:a0c:ab47:0:b0:656:1faa:e425 with SMTP id i7-20020a0cab47000000b006561faae425mr13620829qvb.39.1696845894806;
        Mon, 09 Oct 2023 03:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845894; cv=none;
        d=google.com; s=arc-20160816;
        b=IV1vf6cJEA1T10J4iHrJ0cVIKfovpHmDJ9liGuVOyFWGCb0gbUcyeVAq7ak053XrxM
         KmDtONAQ5rlqHSo61O0d8V4DMo73TrSiptAw5I+9+ub0mLQtzuSq+JZq5poyoYK2bDQc
         NXa2CBGgyjZC8BuLcMchGHRiS5OyDjz2eNSbmG+EryHov4i6rldpeVVpmv/KBJywZ9HS
         +LgjSB4iWZJjz+F6R0OUaf6a2WKF4UipTHVRHDeK3peB3ou05bM/3GB9ULjr5Xs3Evdh
         sIjbEAIigOBYXHT7ou4AL+Yaaplyoxkno0b1SHFJK11ho8vsIYmJAFtVzQO28zZqDvGb
         n6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vQJEL8vkJwny7eCI7iH0HAlqhSa/NiYKDVoeaT20KQc=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=di8rvygPQiUkyJdJjsumzpZlBuuxiLK7hGpvLhP/9JdOx0q6iceDnOXhLT6W+Ecj3g
         WcwIpzN9GQJrFZVpz+cj6TqlsxU4IsxP55/daFV7ZDMVgZNDioRDDJ7n1dEJtRz68re/
         hkahSKskNmJ0UiNzPRO/iW3m4S360sqSMqrdMxxunrLwROa15Wk+i1gsCGiO+H0hlgOi
         6kmN1C5XtwfE+jlZS7MzFDvKOs2bsXhK4U6P2QVg9EmdQC6kRJqp7o115lDyDkzQF/M6
         SzpichIKb0bEROY0QIdZlvXRv2+iglJQzMOehDKU/VoAdFg9/vKRm3ZiNYp5y0JYv94F
         Z++A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xBt0Ufe8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a0ce348000000b0065b2cca41a2si5782975qvm.110.2023.10.09.03.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xBt0Ufe8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qpn73-0003UL-KF; Mon, 09 Oct 2023 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6q-0003GO-Pa
 for qemu-devel@nongnu.org; Mon, 09 Oct 2023 06:03:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6p-0000E1-8b
 for qemu-devel@nongnu.org; Mon, 09 Oct 2023 06:03:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40684f53bfcso39820975e9.0
 for <qemu-devel@nongnu.org>; Mon, 09 Oct 2023 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845809; x=1697450609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQJEL8vkJwny7eCI7iH0HAlqhSa/NiYKDVoeaT20KQc=;
 b=xBt0Ufe8jh3S90b0I7EhTDz3tEtAQ2/ygTSZFL1Gbm67S6ZBlM9on06RuPrUicv00U
 wwBtMD9q+WEqiSY5lz2MsoLAoz9wJkMRiFWBSdko7geK31v8GQH7vCLhSSxlmDLP7lG1
 1jlVeqkOq0SrqYTHdIzrUKHWAup579NRPUOgvv2bMgJ9px0fmDhsJ8+gyjTyUKeu7g4F
 Ja9+hfrL+3D17c+RxDHBhijnBCH5bEpOnq5FPr8F451S7JG8H0Cg4vKwq75WdajtDlM2
 0spoxO/Ue6q50PKmG03EL8Fzy8y3uK6oss2X9fOj/JSn1yl2hjeiZbvAUDxR+6mEHlXW
 1eGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845809; x=1697450609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQJEL8vkJwny7eCI7iH0HAlqhSa/NiYKDVoeaT20KQc=;
 b=RW6aFVV9wmQCKNln6vCR05xJp9rmOHuU7jGcyCRnE588W56yJOxjEJT0YgwU/0SnId
 dd7n74pbDNTZrkQTZKlJyS8bT1AILctW8OtO5Hqq5wHuBr9TVBvRbIUfUpU8CCMi12SB
 0wjE5sWwJg54tg0vHnYyFPLF1p1kzen5hSA3muFWvlrj8h24EdBNVQfT+KlasMcx0e86
 lEIfq/RGL/+p1PIoZfe5PzJQEB/Q0xyyDbTiSzBMrCU1uXKStf5kYyR/5K9V633h7HO3
 tYEPxELQIxkTJaF/8h9b6nFvL4VOwVx3JHryS2N3Rhh9CKpBfK9gBJaAOU+SDnj8mNtr
 6F4w==
X-Gm-Message-State: AOJu0Yxr6G9GeyMqIyJJKFFRUCl3bZUwQAJj1vV2dFWyhBYDLfwILv4d
 UNOTRF6QeWgNqn5FGCZLORMZJ7uHbnhXmqVNy4s=
X-Received: by 2002:a05:600c:1d8f:b0:407:3630:f35 with SMTP id
 p15-20020a05600c1d8f00b0040736300f35mr8285061wms.9.1696845809280; 
 Mon, 09 Oct 2023 03:03:29 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 z7-20020a7bc7c7000000b003fee567235bsm13006999wmk.1.2023.10.09.03.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/10] tests/rtl8139: Clean up global variable shadowing
Date: Mon,  9 Oct 2023 12:02:47 +0200
Message-ID: <20231009100251.56019-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1lDle1Ok2nf+

Rename the variable to fix:

  tests/qtest/rtl8139-test.c:28:33: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void save_fn(QPCIDevice *dev, int devfn, void *data)
                                  ^
  tests/qtest/rtl8139-test.c:37:17: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      QPCIDevice *dev;
                  ^
  tests/qtest/rtl8139-test.c:25:20: note: previous declaration is here
  static QPCIDevice *dev;
                     ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/rtl8139-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 4dc0a0d22e..eedf90f65a 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -22,7 +22,7 @@ static void nop(void)
 #define CLK 33333333
 
 static QPCIBus *pcibus;
-static QPCIDevice *dev;
+static QPCIDevice *pcidev;
 static QPCIBar dev_bar;
 
 static void save_fn(QPCIDevice *dev, int devfn, void *data)
@@ -46,7 +46,7 @@ static QPCIDevice *get_device(void)
 #define PORT(name, len, val) \
 static unsigned __attribute__((unused)) in_##name(void) \
 { \
-    unsigned res = qpci_io_read##len(dev, dev_bar, (val));     \
+    unsigned res = qpci_io_read##len(pcidev, dev_bar, (val));     \
     if (verbosity_level >= 2) { \
         g_test_message("*%s -> %x", #name, res); \
     } \
@@ -57,7 +57,7 @@ static void out_##name(unsigned v) \
     if (verbosity_level >= 2) { \
         g_test_message("%x -> *%s", v, #name); \
     } \
-    qpci_io_write##len(dev, dev_bar, (val), v);        \
+    qpci_io_write##len(pcidev, dev_bar, (val), v);        \
 }
 
 PORT(Timer, l, 0x48)
@@ -189,11 +189,11 @@ static void test_init(void)
 {
     uint64_t barsize;
 
-    dev = get_device();
+    pcidev = get_device();
 
-    dev_bar = qpci_iomap(dev, 0, &barsize);
+    dev_bar = qpci_iomap(pcidev, 0, &barsize);
 
-    qpci_device_enable(dev);
+    qpci_device_enable(pcidev);
 
     test_timer();
 }
-- 
2.41.0

