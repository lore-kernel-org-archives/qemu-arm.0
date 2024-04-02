Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3990557ejv;
        Tue, 2 Apr 2024 07:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjMrFKTsxrD9s9ghxUq27juAThAQMKZhJiVaxfUteQS5ksMQzpgnJzckO+2aLM8AF1J7B5RbHQp5ueRF2aVr5nx+2GYWQ+
X-Google-Smtp-Source: AGHT+IEy1zIiLEwYb/ZDD9Pq0bq3Xs3vXA1O9aK0gfqHizCGYOVCWWVctCpsFTNH0cFedXLshwfA
X-Received: by 2002:ad4:46ce:0:b0:696:b0f0:393c with SMTP id pm14-20020ad446ce000000b00696b0f0393cmr12210587qvb.20.1712068051721;
        Tue, 02 Apr 2024 07:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068051; cv=none;
        d=google.com; s=arc-20160816;
        b=zWFdD5QaIFlf6gPUXbvDg/5QMn8lJndFl8kwkq08ISyiL3nMX4o1mbRRjTCMEpjals
         8CqWYhDyVtNuQ2sKcbtXJYDzUg1kToPAbaYeKwjQHIcmC0vl0wz9rImTtqVR7rmd0p3+
         zo3qSoIux48XqrT+ICzI++fFjCIfeIKTtuNOMtio431LB2/L4IwoZARMfUryknk2bWrY
         9aVAr6K8CBV5efygyt/PtxjPluN+zajJjWcZlX8T1kXcPaYf9Ba5jkn6u6Y9DdLmIueA
         jadcDpB1d69FhTGecqclQH1hkJ9RctAj950/83HxXFWO2xAmNJ5e5fVYlmk5U52v1yYv
         Taiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xwZDj6i22zNsshQLGOawEr+LQWS78suiJsL8DAY6t9k=;
        fh=dEBg5/6XC6ZgFoOk77kKW1PgQPOKltIupEfwG2MrDEU=;
        b=X7oY9b3YlIxItGSq08T5KsHmV9nFKQZdZ09rM5A+KGqmJ6OamaWfdzMkSIPRvbc34C
         0AWRNvs8hwJIFEXu66MhiIMy1gUYSD4A3VLQZzeC9ipeYG/j8N35hgyGxMewSYpQSgU6
         qoBgrcVyxDM29QEu8sOIU7H3ek9Hsmu9VaxjETWW1CXE3sXgyazbKGPGwN25l1DJverY
         dWZNipZvcWVVf6nz9IWQ5Y3eoZtnaeVVZxdQdz6BwxYPx8rkwHvf/YGu8EBO3nBUvc5T
         oEz6CC+CIT9u+85+seGK2vhqrp9pGUZJOiPNwmsHaTbh6Vy/Dop2O8ykjcm9kJE4CgkB
         YsLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQmoSM6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020a056214028100b00690b24d21d0si1532169qvv.519.2024.04.02.07.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQmoSM6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf4v-0001JQ-RT; Tue, 02 Apr 2024 10:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4p-00015f-Mv
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4l-0008AU-Fn
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3436b096690so511580f8f.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067922; x=1712672722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwZDj6i22zNsshQLGOawEr+LQWS78suiJsL8DAY6t9k=;
 b=yQmoSM6HZNtRTueqG4mllekcPyqjFnjLlGmJXY4ArLegJVNFO5rpEpfYQ9jMKlgnnZ
 AQm50fvAYZngiolXvSUKHYrOEmVlP9fPejU0oAaWLRibFYw+GJ34y7waCymZ4NOoO5no
 XFNhZkxEql+3CsfFqYY1UfEHLdmZFilbJjMPy5xWcZlVkuLXBDnmGnTtj7RZLsTGUGqu
 oiju77rYgzVvB2eWQd2IBRhhXgVDzmdJ95hKjwF8MnQv95UcWhAoLS34zETbTHUV78fY
 AMy3xqUKomla9NsfmNZMdXaBWYVjxdkbO/gZnkWcaDA1HJRP+pZOOe3Z54nnEwoaTEyh
 v9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067922; x=1712672722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwZDj6i22zNsshQLGOawEr+LQWS78suiJsL8DAY6t9k=;
 b=plRPx16JZ6CP+LLnGESmeCQu6aJoJ3Ejej6b/HOu3TzRceqRiutHSmwYnKEDh2OsmA
 owXoiMIUVlq4qpkb12Mr9s4RoWJqrG0wW5sx4qRBCe3MB0BJ/K4AKH4uQwEEIgw4xNQ/
 fO/Zu6vX7i5mytsXw74JjtRbAvGM+FN3C27XeiScD7H0kLxJWFmK2Ykci1tVTxka6IJ7
 AC5Tal42z3zPbM2pL7aSgNJX4KLz2utYDV3aD7ToaIrjEKfm236oxCcGWVKVzQexRWG9
 24Hh02R/iyENmwHcPb+Ml8mX3qH5v+zrpwOoF3ZbEu44tryIN8j2UEdcF03W6lNdliha
 V/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8WKaZdBeOYtgwXAosFyQ2rqVtZmmiNcLZ9NK9+jgOfX34jEYCsJkKLhDgBcp9GanJnlGoPDME0/TlmC0FKZoCCX6o
X-Gm-Message-State: AOJu0YwJPRQAsUKOjVYaF7hjGfu9Ge/aHgVAebG2JLi8Fp+Ym+5P7TxX
 K2AEeiVxX9WIptatl85ngxoEOjsGlWSChBKYRnHvWoOltYWYsnZgE1P3nMH93VA=
X-Received: by 2002:a5d:4ccc:0:b0:33e:c0fc:5e4b with SMTP id
 c12-20020a5d4ccc000000b0033ec0fc5e4bmr12886979wrt.2.1712067921877; 
 Tue, 02 Apr 2024 07:25:21 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm2909420wmb.6.2024.04.02.07.25.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 07/15] qtest/libqos: Reduce size_to_prdtl() declaration scope
Date: Tue,  2 Apr 2024 16:24:22 +0200
Message-ID: <20240402142431.70700-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: g1KK5FItL/DL

Since size_to_prdtl() is only used within ahci.c,
declare it statically. This removes the last use
of "inlined function with external linkage". See
previous commit and commit 9de9fa5cf2 for rationale.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20240326171009.26696-4-philmd@linaro.org>
---
 tests/qtest/libqos/ahci.h | 1 -
 tests/qtest/libqos/ahci.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/ahci.h b/tests/qtest/libqos/ahci.h
index 48017864bf..a0487a1557 100644
--- a/tests/qtest/libqos/ahci.h
+++ b/tests/qtest/libqos/ahci.h
@@ -599,7 +599,6 @@ void ahci_port_check_cmd_sanity(AHCIQState *ahci, AHCICommand *cmd);
 
 /* Misc */
 bool is_atapi(AHCIQState *ahci, uint8_t port);
-unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd);
 
 /* Command: Macro level execution */
 void ahci_guest_io(AHCIQState *ahci, uint8_t port, uint8_t ide_cmd,
diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index a2c94c6e06..6d59c7551a 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -662,7 +662,7 @@ unsigned ahci_pick_cmd(AHCIQState *ahci, uint8_t port)
     g_assert_not_reached();
 }
 
-inline unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
+static unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
 {
     /* Each PRD can describe up to 4MiB */
     g_assert_cmphex(bytes_per_prd, <=, 4096 * 1024);
-- 
2.41.0

