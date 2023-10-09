Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1857316ejb;
        Mon, 9 Oct 2023 03:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6VnIrPaoWBABgRX9q+c6tYGNRRmPPvOMm8xja6V4SwwIm+UTTVFu2zMyOyM31W1Ego/Dy
X-Received: by 2002:ac8:5ac9:0:b0:419:6954:3ba2 with SMTP id d9-20020ac85ac9000000b0041969543ba2mr19010240qtd.43.1696845895475;
        Mon, 09 Oct 2023 03:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845895; cv=none;
        d=google.com; s=arc-20160816;
        b=mfvtjXbrkBbncxO47Ua/OZNUldJbp0Y41daDqeLL/MhXZMJ7R4JvIEJNBftTQuPLiK
         B5XUNu/QibBhgMc0nPwmFwmg92OtGAY5RSjLx8YKOwjNWMBAk8q1kG1gHCjdtA3K/Rpw
         mre/OgvjAkw6vi6ETMpb0VQqo7K2rAhVZen3aiTUCvzHU3ylJQdsblcDtIuiESIe/42u
         VzAwZx4nMuKVE4v771Xop0uQqW21R8QWTdbqmji8pZLaFZR9VnntXXw6H+FryVFEO6dy
         p7Z0aTN7CgkHoWhm3AyCD7gvJa5fWRGeh67WTXCjimWBfTEPL+4v+ATNjMv1lDCNk3Qx
         waOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yM3tQ6WCStP5GxgcqqxDxvp5O7sg3JFTcxjMkWzVHZg=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=rgWpEAH7bPb6/dJneypIGbL4dMVcShyX40+YLtwhxxgmGnwXa7AWjd9mEBJk48dmKu
         RNpasZ/tyFQ96HWs5OBPem0RbeEZVgLdAYbx+GMOqB1Vv/mqjKf6X4DQ+/aKCzQkQo3A
         lJmAxg9UC2p+/yVagxBirJk+HlnnMmT6g3JM879Kkhk5qbHearOwBOfxQt/U7I3Rzlad
         dQl7Ew5KD/NxuaKb5hRE9OnXPLXWnN61CPu9twE/72MpzzMTwMwcNI8jWrLX4PszLzDx
         KHJUr4n/liCEzLYw9qJcsB53IWHEgRwGEcNKMfLx7RiKa18uHvLF0iDjrRnRlslGrX3b
         QE+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4U1KfQC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac85dcd000000b00412058a36c2si6011213qtx.324.2023.10.09.03.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4U1KfQC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qpn7G-00040F-QV; Mon, 09 Oct 2023 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn7F-0003uB-2F
 for qemu-devel@nongnu.org; Mon, 09 Oct 2023 06:03:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn7C-0000Im-4Z
 for qemu-devel@nongnu.org; Mon, 09 Oct 2023 06:03:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-327be5fe4beso3952376f8f.3
 for <qemu-devel@nongnu.org>; Mon, 09 Oct 2023 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845832; x=1697450632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yM3tQ6WCStP5GxgcqqxDxvp5O7sg3JFTcxjMkWzVHZg=;
 b=G4U1KfQCJyhWiPQBVyEuh7xX0UYNW+SmaGsAIL4ks0WZNNFKV4umm9c+USn5nsmT25
 npSi1o0RR89dLmUBVd8l4b9DCS5tRshEnEGWNuXHIh/ajgkI7qEtpRb9ujHyeo4fZ0ef
 mfCQE1eUt7169TM8rYYKtgF3JZkYfK0xUGwC9KMzgc6kYkrwz4tVfB4iaWjKM3w8qHPn
 zvuBefJ9hN1SoA6LmNZ0ifAAHo8ZiYxcS72OlWyZuib4kNbUGOifiXYoBGudKsAebYnu
 kASbaKC/MOmL95yAMx8X302Mm1+UAIMFskXqQlKfvZWTrmDrIhJR9L+saJ/S/NXxh/oL
 ostw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845832; x=1697450632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yM3tQ6WCStP5GxgcqqxDxvp5O7sg3JFTcxjMkWzVHZg=;
 b=JZndEEAb6Nlf+3PBpufMKFFCJ1F3T+uEaa2G5bLGDjt5kh4ULlU7T289y5iaY+cdNi
 maIDO3L8GZXezvCW+IWPqOcvP3xpIzrH5go8OzaFI5unozALdNNrmb1LpRa/0l+KJPPi
 s/TVf3IFFvlx5qS9W1x3M9WJgoTUKp52xtOmQ5C67SRfs/p/olDkOLzPCNe/j3VyGo7H
 CZnAzprQ253FzlSuf8GUSWtnTn69t6qpil6MmFY7Y5GTcH5SlN9ecDOai6dzx3bLI088
 hrrRfDUjJIsBtBDldrlGSFmCRGFwpfHJT9uW9gElQgst8j7dbFI+TZwL6IuZIDoc3ac9
 NcqQ==
X-Gm-Message-State: AOJu0YyDF87WI5R4vTmL60JCMTWDASvoSrclr764/8kiLjB1BSd+gu4a
 Ei4xswATOLNKyS6Ds0cIDYk3un+zg+R2TLDTah4=
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id
 l16-20020adfe9d0000000b0031ff432b541mr13007184wrn.69.1696845832575; 
 Mon, 09 Oct 2023 03:03:52 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b00326dd5486dcsm9172575wrf.107.2023.10.09.03.03.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:52 -0700 (PDT)
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
Subject: [PATCH 10/10] tests/coroutine: Clean up global variable shadowing
Date: Mon,  9 Oct 2023 12:02:51 +0200
Message-ID: <20231009100251.56019-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: B+52KieC9SuF

Rename the global variable to avoid:

  tests/unit/test-coroutine.c:430:11: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      bool *done = opaque;
            ^
  tests/unit/test-coroutine.c:438:10: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      bool done = false;
           ^
  tests/unit/test-coroutine.c:198:12: note: previous declaration is here
  static int done;
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-coroutine.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index b0d21d673a..29695cbdcb 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -195,7 +195,7 @@ static void test_no_dangling_access(void)
 }
 
 static bool locked;
-static int done;
+static int done_count;
 
 static void coroutine_fn mutex_fn(void *opaque)
 {
@@ -206,7 +206,7 @@ static void coroutine_fn mutex_fn(void *opaque)
     qemu_coroutine_yield();
     locked = false;
     qemu_co_mutex_unlock(m);
-    done++;
+    done_count++;
 }
 
 static void coroutine_fn lockable_fn(void *opaque)
@@ -218,7 +218,7 @@ static void coroutine_fn lockable_fn(void *opaque)
     qemu_coroutine_yield();
     locked = false;
     qemu_lockable_unlock(x);
-    done++;
+    done_count++;
 }
 
 static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
@@ -226,7 +226,7 @@ static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
     Coroutine *c1 = qemu_coroutine_create(entry, opaque);
     Coroutine *c2 = qemu_coroutine_create(entry, opaque);
 
-    done = 0;
+    done_count = 0;
     qemu_coroutine_enter(c1);
     g_assert(locked);
     qemu_coroutine_enter(c2);
@@ -235,11 +235,11 @@ static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
      * terminates.
      */
     qemu_coroutine_enter(c1);
-    g_assert_cmpint(done, ==, 1);
+    g_assert_cmpint(done_count, ==, 1);
     g_assert(locked);
 
     qemu_coroutine_enter(c2);
-    g_assert_cmpint(done, ==, 2);
+    g_assert_cmpint(done_count, ==, 2);
     g_assert(!locked);
 }
 
-- 
2.41.0

