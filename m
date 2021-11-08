Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp71431lfk;
        Mon, 8 Nov 2021 14:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyItiDLC7jhcimH/hsqMfH2g8lXhnJ+lys5819KzfVHJGOtj83yIkuH97oEPmOdHNYbHm78
X-Received: by 2002:a17:907:3daa:: with SMTP id he42mr3255565ejc.160.1636409185350;
        Mon, 08 Nov 2021 14:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636409185; cv=none;
        d=google.com; s=arc-20160816;
        b=We2y5MfuE80tl/ooHDeWNaxVV9cd2atmqLZ+o6smBVjFTsxoqU2JoDwIUlBEublIqd
         WyTRiY32cO/hXR0U3j+9xI1C0owOqEsIqlqTne0Aa+g9t2HMFjMULKiMuw07d/NzUKTv
         DjMy0kXXcEdE4sknmjLM0OitKrKJ1d5zSwP3Q4+a1bc3IKLRu3zU4irLzbt1/1mKPS1Y
         YxbFPLL++PIIOoMuxVzuBV091EkI4WZNNYmKZ+7oU1Mo3PFLOUiCWmHB2aDjfDTa9Txc
         K675dh7GE8jxiNZbuLAqLaym9A6e0NWxfL8Tra1lGA7WFq/rR45eRmiGsOUSmvCa/8Ts
         Uyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=lS+5dY0vABAf9ytyvQaMm0iXm118bFgbByQxEckQLe4=;
        b=UcOtaBijQCGgoODB5Z+S3ALry4E37kk9wvJl1zaFAIu2x5MzZPysXsNg6Au9zDPgP9
         0AOmLMfH9iYIlFPCWUxQN9Av1bQbzZpcf0wLf23zVLHJC1tC5bs4CflXX7CBy3XVO0aQ
         eMbXFecPKFJ2X4zfP4XcALfqP6CuY5QCiDRUyzIa7orkBWojZAA/h4qnm8Ys3X+6pmXl
         F/OX0eDUz2fy5/zy9YuMVT6N4O1t55c8Us/TnsNjMU1jkIKdQ6sd1V1ilqaL+86zJtsr
         c4FhIyEmrdL8eMW3oBnxeTfioNafW8Lt/c/BYUCu0h/aIW1cJy5NZwSxvqjOSe+aOzp1
         ruKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gp5JySE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si36783197edj.222.2021.11.08.14.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 14:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gp5JySE5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mkCmW-00057m-DW
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 17:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l52JYQcKCAw7qz563qs00sxq.o0y2qy6-m3yz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1mkCmF-00057P-1S
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 17:06:07 -0500
Received: from [2607:f8b0:4864:20::349] (port=54818
 helo=mail-ot1-x349.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l52JYQcKCAw7qz563qs00sxq.o0y2qy6-m3yz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1mkCmB-0001y6-N3
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 17:06:06 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 s38-20020a05683043a600b0055a6f3f8c26so9775154otv.21
 for <qemu-arm@nongnu.org>; Mon, 08 Nov 2021 14:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lS+5dY0vABAf9ytyvQaMm0iXm118bFgbByQxEckQLe4=;
 b=gp5JySE5hvHPY0HoWcTAKvRwIz0T9/0X311bCjZaw1uQUsV9bKoM7Ess+stJaU647J
 8MHspm0NAxr/U8Zth8OONWgYHUi6TpTYsIi9FQVDfwz3wmc574LITwQ37hocADw0/Wng
 MEV0uBKk7bEIRrAr6811alhWnZ3jDPCV2J9VaPcE5RyhF8uxdtirILRZ10wJZ/elQjnr
 FYphHLvUU03vGLPuFO1hBpiXrSaMo5GmF1CR7tLrOau3v+0lCWNkMraZ0TuHmMreR77+
 NGQHTiDwxj1QZCi+QoGycm5PrzT7mdJ8/upLpIx7ijY1hjdQz6uksI+vzceoSng4+j67
 jDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lS+5dY0vABAf9ytyvQaMm0iXm118bFgbByQxEckQLe4=;
 b=B1Rx9p96/atBaa3SKAfULv/+VWpdn1GQ+wnD/bNVwQeHgOE5LHDOyPt+PZZKBpEels
 1I74i+3iEeY908MlXhnT/9yJOXcXGWy/zf8fdKHh3cxPootesHA8LZt4myjemLk0ItjN
 6Wil2+nyHgvjWfGAAheZWz7gJXpoejEYXDsdEbxr4J19Rn6jAcNTEu84w8zzFc7reu7c
 wXHeWjdmQ2LMSSHTA/rckyPUBPLtbkqRB80IV1E2lq9x97/L14oWVv/kcvTiqnfU3Cyc
 ElQCwzkHI2OrliSkLwFeu1i7JkeBudqTok35HxlTAiqEzIgH5mak+Jg9x6bI36ckI0XU
 uBVg==
X-Gm-Message-State: AOAM531tPo0yxjNZORULevZtDHj/Jw37ekmsBzFVNAsgZ4MqyRPqnHjk
 ELLO5NdSmj/86ZctwQnygNKblHKWxo73
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:68c1:eb69:1a8:1fba])
 (user=venture job=sendgmr) by 2002:a25:b809:: with SMTP id
 v9mr2634542ybj.56.1636408727113; Mon, 08 Nov 2021 13:58:47 -0800 (PST)
Date: Mon,  8 Nov 2021 13:58:31 -0800
Message-Id: <20211108215831.2162883-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH] hw/i2c: add pca9543 support to mux
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::349
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=3l52JYQcKCAw7qz563qs00sxq.o0y2qy6-m3yz0zsz6.03s@flex--venture.bounces.google.com;
 helo=mail-ot1-x349.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cPkPLlwRinXb

Adds support for the 2 channel pca9543 i2c switch.

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/i2c/i2c_mux_pca954x.c         | 12 ++++++++++++
 include/hw/i2c/i2c_mux_pca954x.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921c..36a5c8cb31 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -29,6 +29,7 @@
 
 #define PCA9548_CHANNEL_COUNT 8
 #define PCA9546_CHANNEL_COUNT 4
+#define PCA9543_CHANNEL_COUNT 2
 
 /*
  * struct Pca954xChannel - The i2c mux device will have N of these states
@@ -203,6 +204,12 @@ static void pca954x_channel_class_init(ObjectClass *klass, void *data)
     dc->desc = "Pca954x Channel";
 }
 
+static void pca9543_class_init(ObjectClass *klass, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(klass);
+    s->nchans = PCA9543_CHANNEL_COUNT;
+}
+
 static void pca9546_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
@@ -268,6 +275,11 @@ static const TypeInfo pca954x_info[] = {
         .class_init    = pca954x_class_init,
         .abstract      = true,
     },
+    {
+        .name          = TYPE_PCA9543,
+        .parent        = TYPE_PCA954X,
+        .class_init    = pca9543_class_init,
+    },
     {
         .name          = TYPE_PCA9546,
         .parent        = TYPE_PCA954X,
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 8aaf9bbc39..91e2ffd0a2 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -3,6 +3,7 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_PCA9543 "pca9543"
 #define TYPE_PCA9546 "pca9546"
 #define TYPE_PCA9548 "pca9548"
 
-- 
2.34.0.rc0.344.g81b53c2807-goog

