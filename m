Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117671njb;
        Tue, 9 Jul 2024 20:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM1F7P4plGTfct5jf7Ib/6Dg9m9bGXMkfwEpdZBKlNCAK695uC1NvURgXO2a3ty6ysdhgF+b+iAgqkuV5+7EOVEkkQ3IQR
X-Google-Smtp-Source: AGHT+IF4WqkIoojYyNkLYn1Y78GbCBEZm48DfNrsMqIInvJi131VyVKOCnH4cSZqjyJGM0V7H7q9
X-Received: by 2002:a05:622a:d:b0:447:e51b:60bb with SMTP id d75a77b69052e-447fa8b55a6mr54804681cf.1.1720582159529;
        Tue, 09 Jul 2024 20:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582159; cv=none;
        d=google.com; s=arc-20160816;
        b=qT/Qm+I0//L0KdtqdjiZeB47B9yiDS3S+TgMteCPqp8aySc1pK0BoW3wQh1X0DzXV0
         u0k9o4t7CZQe3xsLB7Zn3VGE3HIBtUYD5xi0dBBPXU/08tofEFEjMzJyZjFUNvLCPSAM
         9C3qW+Csd7MBeL5edpXILUbDHnWvzgOj+X+2wvb8NGUpDZwhlDMkvUQgwQKZpQoHAmcc
         SAaB24yopRI4Lag5sMsmVh1b+xjzNM1OikZVlJqVhfc5paqjf4Vopxuc76FtwDrQ9h57
         axoRqQH1+rxthr14hFrbrmR18HMoZY4w6SlzFzpiL1L4C8HR4wsdmqc8qJ4g6KOYTMVf
         LbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=58kkK6wdwKfqQgQ7rCeYXt0gAI3/Luy3O1KMAnd3I2Y=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=GPjfA1B6ErL7jIBEGI4YN09kT5JaYXZobrzZ/e7qQCgst0c6RLjkFbfwlE89dHwwoM
         hgmej7eUdcy8vH3h464U6qIEiTPzcvzapuulMx59IMadnfTy0oe+58CDC0+KkZFd8lmn
         dRrKlrxdE70JtUhCNFw6rrtoMhAwewoJfCFKegqeM0XzWWlAPV2QMk2EgcSqZERAM5ix
         gGEJtggDzxhw43lz8kRGeHyAU+oTZjoWnqDXw398IGZSr6SHBD3TMldnksPYxhVjr8dS
         WcHiVC9PrfefgofOe6q+OoSjzAMlwzWvAwxY5t0G6PHIBJgJAjEOZove5cyYIGPvbsky
         qlDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exjV27dc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c16235si36599991cf.744.2024.07.09.20.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exjV27dc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRO0a-0000zq-F9; Tue, 09 Jul 2024 23:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0Y-0000rp-Jp
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:42 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0K-0003oG-1h
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:42 -0400
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-381f24d6bc4so23227435ab.2
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 20:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582107; x=1721186907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58kkK6wdwKfqQgQ7rCeYXt0gAI3/Luy3O1KMAnd3I2Y=;
 b=exjV27dcGEKyxDKU87mNPd9cTNcnH5x1vNsz/EPFsxUbQ9mzeY4Wwuh3zf1o4FPGmm
 YNd9ZYqk1UVFiaBaCrNmJhVhTd8lvtGiuZnCU3Ek6OYZ4zdlJx6DwTPeo7J8ZH+GHWG1
 0MDp5uNraGw8g8jG6dWOK19A2cwmiWL2YYfd8MOJfunebhGoqxYNX4fSL3Iv61FDcGMz
 E6e9p+VF/MfA1NCVeNGvtWwBNfRilMExJiVWZABSpJxJeJk3+5xe6U0acU4rcUH7IW9a
 ga6lVTZietyP9AP/JQDpLF6PDENezElLax2x9LJrwnhqYOLxtWCJ+TFtFxOvsaD2caXH
 qsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582107; x=1721186907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58kkK6wdwKfqQgQ7rCeYXt0gAI3/Luy3O1KMAnd3I2Y=;
 b=Npu3Y0IEfEb8T4YVvMuZo0mu1mhkic5b7cdbr65EzGzSh9nFncQ06ywRima4eOtWDn
 Apf023V2vdrGCoWfqjNjapDI0Fi3wo1bcOoaAoef/NYr115EcyAV27csbFu/ucsP8RkW
 Lt2dRvWN8xtb+qk9oW3b+rCRk445GV2yLCWtgbiovuNzB8vWx9dXDStNgzmX9rIy4VSy
 4uoFnPDX4ifK0WlXJ8gJyHLe3oQiTzfBsvwDpwpNh29dCxbQhzzZh9DhwZ3Uku7Dh3v0
 +byCddMMzTs2HEfV9TDkttd/6GsBH6ayLkmsT8lLEUJoRHy0iX83lKkPFj0aUwmZnTu2
 SBbg==
X-Gm-Message-State: AOJu0YzxIFDPSrSqnlVzEnhUK58ac1RV77uW6yK9clstABng4fP4eJMY
 uyOvUSRGaVrcKGMyHT0+WFQpDeB+rfdpQA5+OIMf+bwhVgPk2WXUwDYEWCJtLv6bmqpA/5AH6Zn
 0Wjc=
X-Received: by 2002:a92:cdab:0:b0:375:a3d8:97be with SMTP id
 e9e14a558f8ab-38a57213d0amr52860625ab.9.1720582106761; 
 Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 11/13] target/s390x: Use user_or_likely in access_memmove
Date: Tue,  9 Jul 2024 20:28:12 -0700
Message-ID: <20240710032814.104643-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: SNilNbEM3hUn

Invert the conditional, indent the block, and use the macro
that expands to true for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 54 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 5311a15a09..a76eb6182f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -296,41 +296,39 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
                            S390Access *srca, uintptr_t ra)
 {
     int len = desta->size1 + desta->size2;
-    int diff;
 
     assert(len == srca->size1 + srca->size2);
 
     /* Fallback to slow access in case we don't have access to all host pages */
-    if (unlikely(!desta->haddr1 || (desta->size2 && !desta->haddr2) ||
-                 !srca->haddr1 || (srca->size2 && !srca->haddr2))) {
-        int i;
+    if (user_or_likely(desta->haddr &&
+                       srca->haddr &&
+                       (!desta->size2 || desta->haddr2) &&
+                       (!srca->size2 || srca->haddr2))) {
+        int diff = desta->size1 - srca->size1;
 
-        for (i = 0; i < len; i++) {
-            uint8_t byte = access_get_byte(env, srca, i, ra);
-
-            access_set_byte(env, desta, i, byte, ra);
-        }
-        return;
-    }
-
-    diff = desta->size1 - srca->size1;
-    if (likely(diff == 0)) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        if (unlikely(srca->size2)) {
-            memmove(desta->haddr2, srca->haddr2, srca->size2);
-        }
-    } else if (diff > 0) {
-        memmove(desta->haddr1, srca->haddr1, srca->size1);
-        memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
-        if (likely(desta->size2)) {
-            memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+        if (likely(diff == 0)) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            if (unlikely(srca->size2)) {
+                memmove(desta->haddr2, srca->haddr2, srca->size2);
+            }
+        } else if (diff > 0) {
+            memmove(desta->haddr1, srca->haddr1, srca->size1);
+            memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
+            if (likely(desta->size2)) {
+                memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+            }
+        } else {
+            diff = -diff;
+            memmove(desta->haddr1, srca->haddr1, desta->size1);
+            memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
+            if (likely(srca->size2)) {
+                memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+            }
         }
     } else {
-        diff = -diff;
-        memmove(desta->haddr1, srca->haddr1, desta->size1);
-        memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
-        if (likely(srca->size2)) {
-            memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+        for (int i = 0; i < len; i++) {
+            uint8_t byte = access_get_byte(env, srca, i, ra);
+            access_set_byte(env, desta, i, byte, ra);
         }
     }
 }
-- 
2.43.0

