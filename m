Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5584108ejb;
        Wed, 22 Mar 2023 10:57:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set+YROMrExPxvIPTDHEAIseZcffSfz1dyEu5f4Cd9VxRkv372kcISA9e5Uy2JR3W7EZoi3cA
X-Received: by 2002:a05:6214:407:b0:5bd:4363:fbec with SMTP id z7-20020a056214040700b005bd4363fbecmr9202340qvx.27.1679507876539;
        Wed, 22 Mar 2023 10:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679507876; cv=none;
        d=google.com; s=arc-20160816;
        b=w/mJf4E/ai+149ER0U78EDmkjf1TOEdH7TdvkQK+hiM0ithAVvCf+rY79ZSL0FYU32
         pyMawpX8iMlFBPYUDl+ptkTU+3RIiUKm5psPpDSc2AxkdCLi0jpJilNAaBa6es1334qG
         TMSzdKca5eWK6TpC2k8Ckkuyvu5uJlFfEkPJhY2SwLK0TVyTTJL0H+bOQLsw6eAZPKj7
         6+6gnHdvKlBEljrtQ8Tv7qZXcpGAo22WtziUbkRwqo6XSLva1zU6zChjE5nxyn/e8lDA
         jcl+B+GADHXEWJH8QmRkkT7+Z9h1+ypHrp/LzLrxMFYZ+gkzwW+r0NonAvbuvXoCa7v5
         gkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=kSd+tzkdOJAC3FzLgq2ZSZ8SsB0RX5ytiYdlGTCKyFA=;
        b=INq5PGpYUnUo2OQvsznW+7nMuNakJAK3GwhNCW2nFqXHMpijTqjhRXMqJNmKTIV6Kt
         xeSi9Vdo5QVAca4kg/uXeBgbTF3KumHWJkBn3JEdVbeb/CaowWxgsoMqWQlSz16eSloN
         xoerBQgDGOLPhq7ltMTfN3wE3bT+eUeuIvKBlPTyqLxiKttwizN0LWaYPEZC9p/TlD+9
         5972O3LtmzMrqr4syI43Ncz/ElyNRQjV8vbqTXIkkSHRE+xMbX6WPQoqJFFILicc/Av0
         2HfoeIFBrf9YK3p35zLL1cJYp55rGovu+TKcgl910VHWGj9zltiLfQVWYVoYBgQ5JdKd
         Ufgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N0xT4vOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a0f0300b007426e636dc4si11848861qkl.93.2023.03.22.10.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 10:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N0xT4vOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hR-00008Z-KI; Wed, 22 Mar 2023 13:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com>)
 id 1pf2hP-00006h-PA
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com>)
 id 1pf2hO-0002Fn-Ar
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:35 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 j11-20020a25230b000000b00b6871c296bdso12952516ybj.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507793;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kSd+tzkdOJAC3FzLgq2ZSZ8SsB0RX5ytiYdlGTCKyFA=;
 b=N0xT4vOETnrFNGMRqljK9WP/cKl6H6zYW/fgDL86zMLz56KvJIulslJYzNPhC5TLdp
 /rMrCo3mLTJa4ghvc93LNfn9OTM4FVeu9GmwbgMQ+ZykTD/OT2eV6gxKnHMHjaWoi3pM
 UAxEjA0jYJoKBOswagoVfbHiiBziBXVBNY3q7fly4tFyy901mYmYV8wfUtXHJ+03d62D
 Q7aIhGXz3soQJ9xl8iJPzV0IchOqy+BROmcCIo19KMIcsmuh+vs3d7jmbpWy15ToPRa8
 UoZsbJbE+uz231zcxyodcDVN/gqSb2GjoHiGXlA3zTQVtXfhRMtRLo4ydU1ciozINAyz
 QqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507793;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kSd+tzkdOJAC3FzLgq2ZSZ8SsB0RX5ytiYdlGTCKyFA=;
 b=ZcNYtcjYeL4YzgHpr8fO7QLBAARfKib1hB0jtaLcUUCt7GwNzrHTMUaHCjNx59M9sf
 mF73YHuzVDdJ+BzeZmHJRh8TQz/w8m+Us880Q1xuFfuAK6OunyDvhndacsPV7cPsPDdk
 /cK6D6jGJz6dOowehxOJ0tiFTDPS0yJh5Hw0DWmd3/o8pd+Tj66bqsRYehF95P7207qF
 KihmVEYG0UU/ICHXAWy2oiTfQ3TkQ9S+vq7hCS6TPGzHwJsO8hrsAhq1tCSiOwPWGV20
 dVDtu7pSju0D73pCf6H6Ys/li1cSW6BnhytYeFl3xKXLVRPZwQj33QHNitNJrZMFR0Ut
 v8og==
X-Gm-Message-State: AAQBX9ePKV5JaHuLz5dQURMLnA814A6Rwqna1/EKAEDhdyMCKK1PuhyO
 JZ9ymFqqDscHstdIvtdlW4VN8LtVZdM=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b611:0:b0:545:4133:fc40 with SMTP id
 u17-20020a81b611000000b005454133fc40mr357418ywh.9.1679507793108; Wed, 22 Mar
 2023 10:56:33 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:10 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-3-titusr@google.com>
Subject: [PATCH 2/5] hw/i2c: pmbus: add vout mode bitfields
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3UUEbZAYKCmgZOZaYXMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 91LLHtWW7GmZ

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.40.0.rc1.284.g88254d51c5-goog

