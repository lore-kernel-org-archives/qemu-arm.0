Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1856575ejb;
        Mon, 9 Oct 2023 03:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7iOjjU+8eSPe9f5Y/CWP/Jl9xJN/L8gwMZdH9sSvIgrJHuPYtGReKIeLg0sWraZnoB3Lk
X-Received: by 2002:a05:622a:148:b0:417:da5d:30e1 with SMTP id v8-20020a05622a014800b00417da5d30e1mr15636158qtw.42.1696845808262;
        Mon, 09 Oct 2023 03:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845808; cv=none;
        d=google.com; s=arc-20160816;
        b=K/PN1uhQ/m6ZNdmet1yX2yx7zps3vPwPDssuWm9ewqVHHFn3rIRKOM/iW2nERvNRWX
         ckrwqz5uRVoGDQQ04WpXfIj3w+AHBmNbXLPQEm72mg5OHnhH/NONkK3I7OaXvEYFXELI
         02m7zJ1tBpIcLAxfO9QGHpF1yDA4jcsCc71GQPDmjZ4tArLKKNyzT2OgVZuv7nbmbNmD
         5b/SqBQopeqOyKoDLo/QLAT8CAjOEZTIHnnqGVDyP42qvrsN/oenT1Y2+SFiMx1bYM7I
         A4EUoUTuSZpaks/nCF3jnqjlmV/mKq90dthDfGxtYONFjeU9/CiQ9GBQBapida7A/6Fg
         iBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wt6aiJAngF+1rHQyivcpsZ85UBVqDOe5WBHF8BS6ZcM=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=uO6DAK6LF39fcprbEW84FNLUvwpeK1/iM7d5Qxga3IJGoUQeRLtnHgjAy06HjGJEWI
         3PFYoh0laAYHqVVQk4FjwlZ3/IMAvgvb6jh/H0dWTypgHIFWpZuFXJm88PghoQ9cKckr
         yVcLEvMAM8N2S6uINy0CGxQ0h+wSTYwaVx+F0ovL6VnHwsZwt2MVZzfjzfjhwYMh2so6
         2yFIAv/0KJM1b5BOuwtX4SZBIGaFo8czGnh7pGTgHnpOZsF7VBeOx//4k1pIXb9N1ajm
         vsbm9D6lnkc3ndTUsV7ZKSwPQdQXB09DnIbO+CeghjWOkYTuZGXRdPNVBOd+vEIfF6LW
         Fi2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PaZFK/qW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020ac85d8a000000b0041813601690si6014398qtx.22.2023.10.09.03.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PaZFK/qW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn6f-0003A2-Sl; Mon, 09 Oct 2023 06:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6Q-00034l-Ir
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6M-00008f-6V
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40537481094so39768595e9.0
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845780; x=1697450580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wt6aiJAngF+1rHQyivcpsZ85UBVqDOe5WBHF8BS6ZcM=;
 b=PaZFK/qWUOpEWgz3aCM6roj84qUETeZCRrAWDU1Nalz0qMiavJQ/1fH9RCLgY1lvz/
 HxnUBE0zNeB1cMa+bSk1YJa9j2oT25GjfiQqQZpbyWk7LARaLkfgVjTjP4vS5n71/XhM
 3yGX2/r//zM7tMOL8Vq8PsM4MLEe0xoXk3WtB5OgXfU3Fva/NwEmLD9RhfCeGWnalYqx
 nRva6SoCPUXSwSKfBv9ZsF47p6+IgDzKCmNcZhU876+zTWRcd+LK1U6NISP1s9HtqdDP
 +5pXrn7aGXwRkPLMYfoyB4NGp7CAl1M/3HDJ5dpiHjUImCgTOZ3NrIadNBSiwlRBQuLG
 SZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845780; x=1697450580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wt6aiJAngF+1rHQyivcpsZ85UBVqDOe5WBHF8BS6ZcM=;
 b=cHgHbH0q4T7JRWGuxJMgOtww6HRTUlutSAR6dmT4VScZBCsVza/0mUXIsd6kK/qjC5
 NJkZlKJ9eIFz7zEdicxam/N1wqCaHNSp+owoHQ5hnS+exT6EaXx1cAnTK4kivGGTm27K
 WbKcy99bdJx6RiGyXmQ4/3jaa2VAQzryQV1B8oNMgXOMTzxoPFzpO46Fb/2mCUCnSIHS
 YDQ1Gm7o40sS6dfzxQ60FaeQP/1x1ksgNrAFgNzg9Q+NWC3vCycVA3CUOUBpx2CWpiHc
 bGltYkWblZxOKcOrjRe7Xi76toMA8bcdP/Ung7/IEusTeAZvOe2gdMFdYXORuKsPfdg6
 JKig==
X-Gm-Message-State: AOJu0YxcePCn/RwIPakDCje/wxNoLjSzBb/y7FQsaa4jnd19rj5LJyXN
 /SMBQ/RZGbPpR+RsczJSODTL/A==
X-Received: by 2002:a5d:4d12:0:b0:31f:f9a9:a742 with SMTP id
 z18-20020a5d4d12000000b0031ff9a9a742mr12146379wrt.23.1696845780208; 
 Mon, 09 Oct 2023 03:03:00 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 v6-20020adff686000000b0031980294e9fsm9054813wrp.116.2023.10.09.03.02.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:02:59 -0700 (PDT)
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
Subject: [PATCH 01/10] system/qtest: Clean up global variable shadowing in
 qtest_server_init()
Date: Mon,  9 Oct 2023 12:02:42 +0200
Message-ID: <20231009100251.56019-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uWY7m7pgNgNM

Rename the variable to fix:

  softmmu/qtest.c:869:13: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      Object *qtest;
              ^
  softmmu/qtest.c:53:15: note: previous declaration is here
  static QTest *qtest;
                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/qtest.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 35b643a274..7964f0b248 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -866,7 +866,7 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
 {
     ERRP_GUARD();
     Chardev *chr;
-    Object *qtest;
+    Object *qobj;
 
     chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
     if (chr == NULL) {
@@ -875,18 +875,18 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
         return;
     }
 
-    qtest = object_new(TYPE_QTEST);
-    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
+    qobj = object_new(TYPE_QTEST);
+    object_property_set_str(qobj, "chardev", chr->label, &error_abort);
     if (qtest_log) {
-        object_property_set_str(qtest, "log", qtest_log, &error_abort);
+        object_property_set_str(qobj, "log", qtest_log, &error_abort);
     }
-    object_property_add_child(qdev_get_machine(), "qtest", qtest);
-    user_creatable_complete(USER_CREATABLE(qtest), errp);
+    object_property_add_child(qdev_get_machine(), "qtest", qobj);
+    user_creatable_complete(USER_CREATABLE(qobj), errp);
     if (*errp) {
-        object_unparent(qtest);
+        object_unparent(qobj);
     }
     object_unref(OBJECT(chr));
-    object_unref(qtest);
+    object_unref(qobj);
 }
 
 static bool qtest_server_start(QTest *q, Error **errp)
-- 
2.41.0

