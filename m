Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1856801ejb;
        Mon, 9 Oct 2023 03:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKIMY+Nbbwdy5+D4SQIaPgiL8P2HKTdQBsBssLPUf2s8WipGh9N7sLHOyI+dErCbkvMciN
X-Received: by 2002:a05:620a:25cd:b0:775:6650:bc54 with SMTP id y13-20020a05620a25cd00b007756650bc54mr15907806qko.28.1696845835925;
        Mon, 09 Oct 2023 03:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845835; cv=none;
        d=google.com; s=arc-20160816;
        b=wJls+s6cskdqWdO+4euTAKhIPvH6JDR7AQosRcNf18CKXvhtg6RTsoneC8QodFNqws
         0CQRpuHX6MGlSIqrHo0RdXamz863pp2YqC6JVzmDRLppPOV9vpRBNlKQqbxbSQsB2PI0
         ChJwra5wDkCGiSOda0eu84YA1SJUaBT5QbF1jrSkKa1/h62btwSh8qBj10WbjchugzS8
         MKa5blcjD0QKyCmIqJU7kUtFgBQkuQsVg5iHqYiytHcu/FbHikK8FuN5fTUd3aVN/Sdt
         sdv/LvmSsUjbGTxKo7j+kL6bTTfXu0tHz5W+j8ExqxmWOXO1csf7vm9d8ObqJGCvnr7K
         HF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iSzCHIdmj0ACDSZfJdt/n9uVk8fHj/Z/ypjnOvyiyyQ=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=IWMZNql72f34Og8GBUEXfmtC7+bCWuPBgNTyxomuywBhH8kPydk4ZefpaDI1+vFAcE
         Bvqb6gSVWvM6NXbQFKiP5dFYeClVc4flRDuSNtlSsrAbUJt/NKKmPyywjN6rl/AItcHi
         CCwpZpHH9K1z2u38nWpPhwlbWZhLS6LVwdRLubKqGqOrKcYzLJG9Pf/ezIKcKc9Hal0M
         reXHMGcSl57/4v6pWgZ/URHIWdMOx91eIu7FKO4OI67S1IMYS0NYd6IXnCMwO4evyYbQ
         KVzmy4L1gl7kXDIqFg6aUHtL1D9knf+j3ug/1G2xcPTdulauyGa/GxaGZGuszqfsaa9J
         z37g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VsSpVz3q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a24c700b00773c2e5bbfbsi6136437qkn.530.2023.10.09.03.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VsSpVz3q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn7B-0003mr-MQ; Mon, 09 Oct 2023 06:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn7A-0003i2-QD
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn70-0000H7-7B
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-406618d0991so39962015e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845821; x=1697450621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iSzCHIdmj0ACDSZfJdt/n9uVk8fHj/Z/ypjnOvyiyyQ=;
 b=VsSpVz3qWINYyFrX77Fht7WUw7EvnZhqvO1AWsKHj+npp/+nYRu33J9Ezl6w9RS18X
 Mcy1gJY5+J82CrV72YFFBltIZ4QR+F5CR8/LR9pc8To5efN4pIFRGGKG7sU9tiwe3E6p
 OjoKTDHvOjKxlefmec8u672hBLwTe+8C4rIYga72LqJ4TSreDITNR/IKnInNqlvEk4h1
 T7Y0pLdyvD+4+3w48Eg/NiHN+uH+TEE1yG8r5q7gNpmLBYIKptA+W8g15bknEysL+Jvt
 A1Gr02BoiA54lWWiuhknD3l54xhFf6gc166QY6okWVH7jmbo9fRJEXjwpd1IWNeKshYW
 YIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845821; x=1697450621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iSzCHIdmj0ACDSZfJdt/n9uVk8fHj/Z/ypjnOvyiyyQ=;
 b=PaHPV6JoZLSKHs0lEv3nw3/O3BZ010uI+Aozd5kqXRApRTVb4HFVQcB7jYL/n7ArCV
 e8KCbwqLZ8XoU2lTCvfeeByp/WamLn98gUBsgCsfHMgPRdnrmY+UOponBduYrQXdta0Y
 dI7KoWGTlVYJh1W1a9y+79IazcvkSyF9lVnv0CitLdWm5W7q621JL3ZHG4zxKi55rsVZ
 /k/JZImna8x82wTvlfMJRuInmNATC++BgZFjFDV026agwNtfBX9bcyTwORe1ViAQTR1V
 X42Ablkjapn5qRbnx9EuhuavD2AfSV3tx8hshjk4ELrFyYh11dKDbvun/Lig0/bVA80Y
 MVbg==
X-Gm-Message-State: AOJu0Ywpjei1M3/9wkditd9La35TRB1kf3ZgBM/kgpuINla2dES5oGxk
 cMhURHELwVU60B5rsGIZ2/Ks1w==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id
 p1-20020adfcc81000000b00321597123a5mr13194274wrj.20.1696845821011; 
 Mon, 09 Oct 2023 03:03:41 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 a11-20020adff7cb000000b00326f0ca3566sm9100072wrq.50.2023.10.09.03.03.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:40 -0700 (PDT)
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
Subject: [PATCH 08/10] tests/aio: Clean up global variable shadowing
Date: Mon,  9 Oct 2023 12:02:49 +0200
Message-ID: <20231009100251.56019-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bjz/u21k9Nqz

Rename the argument to fix:

  tests/unit/test-aio.c:130:44: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void set_event_notifier(AioContext *ctx, EventNotifier *notifier,
                                             ^
  tests/unit/test-aio.c:22:20: note: previous declaration is here
  static AioContext *ctx;
                     ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-aio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 71ed31a4db..337b6e4ea7 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -127,10 +127,10 @@ static void *test_acquire_thread(void *opaque)
     return NULL;
 }
 
-static void set_event_notifier(AioContext *ctx, EventNotifier *notifier,
+static void set_event_notifier(AioContext *nctx, EventNotifier *notifier,
                                EventNotifierHandler *handler)
 {
-    aio_set_event_notifier(ctx, notifier, handler, NULL, NULL);
+    aio_set_event_notifier(nctx, notifier, handler, NULL, NULL);
 }
 
 static void dummy_notifier_read(EventNotifier *n)
-- 
2.41.0

