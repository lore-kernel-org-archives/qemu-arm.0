Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1856908ejb;
        Mon, 9 Oct 2023 03:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPu4DXf64FFAE4+hTZ1CpZpUX1s5ZFfiGRCnxL7qvCrVfsLa3emBrO1jCHVsAenQ5pckoJ
X-Received: by 2002:a05:620a:2911:b0:76c:e2db:42b0 with SMTP id m17-20020a05620a291100b0076ce2db42b0mr16795228qkp.64.1696845846991;
        Mon, 09 Oct 2023 03:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845846; cv=none;
        d=google.com; s=arc-20160816;
        b=B23xlxUE/cAg5bqcbYl3yhrNdekxRfV+vonqPGd1AtUH6IeeDzbM3/6/EU3nYdVDnI
         OFhN8HfbV6SZVlWK1/nayWwChJBpZElGKdTEl/I3Bc6a97HZ2qhrOdGUdyngvkZJ0Eh2
         wGsbcIRxKXC8PmukYedAO1JBlB4dq1B90Fhy8JGjyy0R7kjaR0gxCmSdIp+ED4PlxQYI
         MoK2O6Ko3B5FgPjP0nIDt2OjDULMXOntMD5VlnagJYErdmsbvMlLQ6LSwhhxty2zbcrF
         GSNyaUhkVuMach4L8Yx83BrHbMGfUu78bqnubQcluYxy8qzHCE1BpxhdpVgCoX4ZgIcf
         ccqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j5BNGs+G3EOO05KikjnRTYDtKwetCUKmXOLb4daofrU=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=NXSibisJtW3svodTooDN8F/EblHVt2+ufxPZccLAWOinLDPR1E8X4uw5WBr3zxFzR8
         t4OK+0SW848CYXq0hOsX4HI+amPNnrwtbV+Ez++WJNbw8rLRxWrBNLv2yqNUE+b0V91f
         wv4bwg+sYfOJafWy92kO4fzY4mbCRULfmziDQM2+ZqFQat3VMoY5IaWghz2XyznZxxC4
         M9tso76+t+osLOsNpG4NMTfBpptPUDCqusllHI8w+DY95sAgZttf0yngPfYaM4Dw3MA0
         t/7EvgIoB96ZV8B7uep9MkziHlXwn45HPkoSpwtzKZjpvvoh5yG4Nqd2HQrdJvjxeQdQ
         EJ3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfbbI8yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl12-20020a05620a1a8c00b00767fd0121f4si5836043qkb.236.2023.10.09.03.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfbbI8yY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn7I-0004AL-Si; Mon, 09 Oct 2023 06:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn7I-000483-B7
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:04:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn76-0000I3-AA
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:04:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so4156575f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845827; x=1697450627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5BNGs+G3EOO05KikjnRTYDtKwetCUKmXOLb4daofrU=;
 b=qfbbI8yY8NqDqpTFU+Q0fKIRBefTR95t+xv8lSMJNuXM5bOZLA/wKOQgh1SutgezcJ
 ZQehS0at/51Tsq0c3w5NdIc7wgTqcwv98meR9oBYUGmTXfNy5tYMZDHI96d8MyjJMzD+
 NmYfEoyPea9/Hcgfz90JIyirbMgnv9cDwswcIxiui3rfGMAyzJtr9R6StzrB6GhiT42V
 M53BmAeLf16KmoXUVFXt+aCy34XUzfIO5lJor9sa9DOE2ZLDceUPySlfhYO+zNmQrMVl
 HsDq0PW7Si/l8LZusI1Xb3eQ6gtPlBKWQvoeLNG/VVdjQWSsLKAyLTtiRN8DSNzV7Ibz
 bSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845827; x=1697450627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5BNGs+G3EOO05KikjnRTYDtKwetCUKmXOLb4daofrU=;
 b=hSsJfU21K0J5zsyZKG07h2LFUrJPTlwO4ub0C8t76GmcSWVTKa08nD7aWUph77ebp0
 MZ4BQOt3QUtOBelYMtgsoIMrI7Dz6dMopSFSfqM63owoBbO4IF2B3eM8oUYPGkjDGfun
 uVAlOy2hlvlKsYOqrZE9qBW594s7HsxUpK0FOVT5aDkGNEYB/kPn4tvXredxH5FYBMjN
 ZqTxTYohgio5bJiEx/VHKPBbblBsaTRt5UEQOnuR2q69Tfwf0zKYJRPIT177BxtIEcfm
 p7/rQT3/80V4qnF1JGM2sCEZzBrFkDx3QXr3hD2ouMGR5/QZjILN5SHlE7S/82f/Y4sw
 lNvQ==
X-Gm-Message-State: AOJu0Yy16yf0apmUhwkzPJpfG/+Ofcz5rvzgbyJP5KsGxT8IBefzNVZ1
 Oh6qDgHrOCL8gElPyzclc+Llpw==
X-Received: by 2002:a05:6000:186c:b0:321:6779:944d with SMTP id
 d12-20020a056000186c00b003216779944dmr19360377wri.47.1696845826765; 
 Mon, 09 Oct 2023 03:03:46 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 z3-20020adfec83000000b0032327b70ef6sm9238656wrn.70.2023.10.09.03.03.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:46 -0700 (PDT)
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
Subject: [PATCH 09/10] tests/aio-multithread: Clean up global variable
 shadowing
Date: Mon,  9 Oct 2023 12:02:50 +0200
Message-ID: <20231009100251.56019-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0vO2pbUy4Gvf

Rename the argument to avoid:

  tests/unit/test-aio-multithread.c:226:37: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void test_multi_co_mutex(int threads, int seconds)
                                      ^
  tests/unit/test-aio-multithread.c:401:34: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void test_multi_mutex(int threads, int seconds)
                                   ^
  tests/unit/test-aio-multithread.c:24:18: note: previous declaration is here
  static IOThread *threads[NUM_CONTEXTS];
                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-aio-multithread.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-aio-multithread.c b/tests/unit/test-aio-multithread.c
index 08d4570ccb..d587f20667 100644
--- a/tests/unit/test-aio-multithread.c
+++ b/tests/unit/test-aio-multithread.c
@@ -223,7 +223,7 @@ static void coroutine_fn test_multi_co_mutex_entry(void *opaque)
     qatomic_dec(&running);
 }
 
-static void test_multi_co_mutex(int threads, int seconds)
+static void test_multi_co_mutex(unsigned ctx_num, int seconds)
 {
     int i;
 
@@ -233,9 +233,9 @@ static void test_multi_co_mutex(int threads, int seconds)
     now_stopping = false;
 
     create_aio_contexts();
-    assert(threads <= NUM_CONTEXTS);
-    running = threads;
-    for (i = 0; i < threads; i++) {
+    assert(ctx_num <= NUM_CONTEXTS);
+    running = ctx_num;
+    for (i = 0; i < ctx_num; i++) {
         Coroutine *co1 = qemu_coroutine_create(test_multi_co_mutex_entry, NULL);
         aio_co_schedule(ctx[i], co1);
     }
@@ -398,7 +398,7 @@ static void test_multi_mutex_entry(void *opaque)
     qatomic_dec(&running);
 }
 
-static void test_multi_mutex(int threads, int seconds)
+static void test_multi_mutex(unsigned ctx_num, int seconds)
 {
     int i;
 
@@ -408,9 +408,9 @@ static void test_multi_mutex(int threads, int seconds)
     now_stopping = false;
 
     create_aio_contexts();
-    assert(threads <= NUM_CONTEXTS);
-    running = threads;
-    for (i = 0; i < threads; i++) {
+    assert(ctx_num <= NUM_CONTEXTS);
+    running = ctx_num;
+    for (i = 0; i < ctx_num; i++) {
         Coroutine *co1 = qemu_coroutine_create(test_multi_mutex_entry, NULL);
         aio_co_schedule(ctx[i], co1);
     }
-- 
2.41.0

