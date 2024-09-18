Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp979016njg;
        Wed, 18 Sep 2024 12:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkXtMREvE+A/zPiY/TNmcuNQxz9yq6Uwf2sR88BsCnSanZxAItRPmwcsIQOf0AXTXXKBHYoK+ulEScBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHzA/h6iGAagC/VqfLtpLRPCUCIhP8eavNShM5/T5Crrg+lAGVfEZ4DWHYPT9IBLM+a98Si
X-Received: by 2002:a05:6214:4188:b0:6c1:6a71:970e with SMTP id 6a1803df08f44-6c57df771cbmr286062896d6.5.1726687574324;
        Wed, 18 Sep 2024 12:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726687574; cv=none;
        d=google.com; s=arc-20240605;
        b=YymZPiNzUv2kG+H6Kj88PB96DYsmpk5Xxm5sSHxSZBkG2N/H52zPUKabtfgAlgLRBL
         otHSaZaDOV/ixJXFX0BL7po667kRLnkZ3obpTDgo76DZOnMClTcYtmY3luWP1hjdYPvr
         ls7F4Ox4i600thl+nsIpbqfDyr7EDd1ZhgJWw6k5F3ClHbb8qaILKKr3u1wrtkR7RDXi
         UV9wZI3DysVxuowL4etWestIFHlnj8Epy3fnfo4nRWs9jiSLiqq4OsjPlKr+RtFOZG/W
         K9piypnYy7b9S1/iQgO4WZZny6YCeAX2Xmj+aRUJrA3bJv8RB+7wo6pInaDxkk1djTH1
         XH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Is1Pe9Ut7+FUOXRSBGio99L8BWy9EslIqrLBu7QfCA8=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=UdW9qpCqXdMbF44e1fuWlL/wOoe0ZLL0hXDrrcddL0ra47D4vizp7Gsik2m2+kARmv
         Qx5Edy+Z9rzfgmIIoj13gaj/T1zJ0DlaUEm3lrKzoZw9eQ1n8lmyyrY+eCHuEPV2eIXh
         xJxQ6cNou6uMGVnuISUgvRdJr7orsKj+Ff3DceyXgAmsd+cOizK9KZhelRk1xhJt4a6T
         gAoB+fvHer+6mc+trUhUHnu0HRkfAA1LKel9vvKxZ4UIZNW8YRe/7a+Ddem7YBnfECKA
         hlRbj78U6FTno/p55OmHhL2vWPl3iSIF8jU9GMzyZyUrHrCNO8bFeHtO2Qg4wY8ulqyy
         cdHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WjILLj7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e47cf90si1188396d6.142.2024.09.18.12.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 12:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WjILLj7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr0Gm-0004iU-GE; Wed, 18 Sep 2024 15:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kyjrZgUKCM4DuF2908805y.w86Ay6E-uB678707E.8B0@flex--tavip.bounces.google.com>)
 id 1sr0GW-0004S7-3u
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:04 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kyjrZgUKCM4DuF2908805y.w86Ay6E-uB678707E.8B0@flex--tavip.bounces.google.com>)
 id 1sr0GU-0007I7-Cv
 for qemu-arm@nongnu.org; Wed, 18 Sep 2024 15:23:03 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e1a91576564so175389276.0
 for <qemu-arm@nongnu.org>; Wed, 18 Sep 2024 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1726687379; x=1727292179; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Is1Pe9Ut7+FUOXRSBGio99L8BWy9EslIqrLBu7QfCA8=;
 b=WjILLj7Ruw/JJSrQodORkveUsYfBJWbnaR3rnO8uAMBYXfxvSGJ/6vV0n8uCPN9qyE
 zKw3FWgWhHUEWKlfmr1rmRMaeshZbKXVN+4CFImJPwK2mKqDzlWgU32mgRlqSeS1P0xE
 bwN25QkZ8Az8W7w+qs3mMrsIJt/OHg1pxt3awmxEBYbcobF3wwCdwC9yytCTawtCCZq4
 Cz6ibBSQYrBqJycBLTbVTKMfFp0MbCSYNoFfZDN2gEsT9kLm/KQT3LuW6hBz9VdH6zTT
 ZzNFdh+1CHiTUqc6WWKJstbxvgwYT0v2ABzftjb9NZ+/6hyN4mwtFrU8TGc500HFmQwo
 aOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726687379; x=1727292179;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Is1Pe9Ut7+FUOXRSBGio99L8BWy9EslIqrLBu7QfCA8=;
 b=Wm3t/A9V+zD16cgp7pmhVG7TgpeZoxbUq7Vwmg/lUQFcserxZgTPzyaaQXDFVepnuP
 7HWATUJ7jiWRvglYwBrJqnTjT3BHZdHjO5No4aggGwnZ4KfkVSCeN7v6yDtb35/lslGi
 V37E0JFvSh7cQMq5+pSE8HKkRBQXy4B2R7Q3fl9YEwOHDRR6REj/fDP//XsUZCj4TW/G
 yvKoYBux+4zy0OdKZNhboAvW40kKbqw3FPH54jG5DmihqnJ/s9uE2SckFLga5Ng8j8DM
 zQRLJc89jvhpqTHWPaxg4PGFg4awgyFnC8OBULZtjRWUJJP0d2PaoLNUMbbJclPfyfZT
 ckdA==
X-Gm-Message-State: AOJu0YxknAwHyKUYOlpyCyteqSgwNuWioMjxMc0b5Kxezj4mF0ATe/J1
 vZvcN3zvB9LAePWCJe7lR5agdYwYuc3MfFP6oyWatX0pdWoCwK+r1rHJKEcx+/OUuuGDHy+0Dg=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a25:e090:0:b0:e11:584f:c2ca with
 SMTP id
 3f1490d57ef6-e1d9dc3c15bmr55129276.6.1726687379366; Wed, 18 Sep 2024 12:22:59
 -0700 (PDT)
Date: Wed, 18 Sep 2024 12:22:30 -0700
In-Reply-To: <20240918192254.3136903-1-tavip@google.com>
Mime-Version: 1.0
References: <20240918192254.3136903-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240918192254.3136903-3-tavip@google.com>
Subject: [PATCH 02/25] tests/unit: add fifo32 tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3kyjrZgUKCM4DuF2908805y.w86Ay6E-uB678707E.8B0@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: uDzvnPsbQakB

Add push/pop and peek tests for fifo32.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/test-fifo.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/unit/test-fifo.c b/tests/unit/test-fifo.c
index 14153c41fa..d0e05ba95c 100644
--- a/tests/unit/test-fifo.c
+++ b/tests/unit/test-fifo.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "qemu/fifo8.h"
+#include "qemu/fifo32.h"
 
 const VMStateInfo vmstate_info_uint32;
 const VMStateInfo vmstate_info_buffer;
@@ -432,6 +433,53 @@ static void test_fifo8_pushpop(void)
     fifo8_destroy(&fifo);
 }
 
+static void test_fifo32_pushpop(void)
+{
+    Fifo32 fifo;
+    uint32_t e;
+
+    fifo32_create(&fifo, 2);
+    fifo32_push(&fifo, 0x11121314);
+    fifo32_push(&fifo, 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_pop(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x21222324);
+
+    g_assert(fifo32_num_used(&fifo) == 1);
+    fifo32_destroy(&fifo);
+}
+
+static void test_fifo32_peek(void)
+{
+    Fifo32 fifo;
+    uint32_t e;
+
+    fifo32_create(&fifo, 2);
+    fifo32_push(&fifo, 0x11121314);
+    fifo32_push(&fifo, 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_pop(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    fifo32_destroy(&fifo);
+}
+
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
@@ -445,5 +493,7 @@ int main(int argc, char *argv[])
     g_test_add_func("/fifo8/peek_bufptr_wrap", test_fifo8_peek_bufptr_wrap);
     g_test_add_func("/fifo8/pop_bufptr", test_fifo8_pop_bufptr);
     g_test_add_func("/fifo8/pop_bufptr_wrap", test_fifo8_pop_bufptr_wrap);
+    g_test_add_func("/fifo32/pushpop", test_fifo32_pushpop);
+    g_test_add_func("/fifo32/peek", test_fifo32_peek);
     return g_test_run();
 }
-- 
2.46.0.662.g92d0881bb0-goog

