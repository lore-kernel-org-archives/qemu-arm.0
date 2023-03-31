Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp281700ejb;
        Thu, 30 Mar 2023 17:09:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bcSxRfNVdjiJZDwHifqwdLSNP7v3Drw05f1ymNF2Ra36VKEN3HZym1ZzOPegfFT6L98a6A
X-Received: by 2002:ac8:5a44:0:b0:3e6:365c:2bf8 with SMTP id o4-20020ac85a44000000b003e6365c2bf8mr5800672qta.47.1680221395329;
        Thu, 30 Mar 2023 17:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221395; cv=none;
        d=google.com; s=arc-20160816;
        b=1EY6sV4L11tk6rHGJsihXbUlzO4PKGloqMpIP0IG5gLQ5SLod812xklA493VhPV7bX
         MG9hO1VTRSNOCDibLJvQThO+d5ky7VXYcGKgEXgUa6rWnYizKl4wqI0adggEx/3OrpYQ
         BkhLbiCS5Vnl7CMEenQPZHiSXDLrQMg0p+xsitnSKDPmnuZD7Otdyp3aLBlRbQChNy++
         MCHtoebHXh/9sG7ZUuK4rdnivY8Of44usNISanyff3bJfOgjQ5REVbghbUPyqi/RPdEp
         6tKRlFS1lRSyuTt3qJ8nz1ZlYo/J6FugTApBMjwQCZZwhrmCzmgttStQSFcni+VnZQLE
         vFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=JVa+ysZi3CwbR24epjsK5up3WFbQnFpyGHTqEQOjKmA=;
        b=zHrkoEbbsS/g+yzSA1xgWMLINnOpU2Se04PboLVSR9O42wfobhS/4gITDK6Rlz/aBG
         jyUEb5JStmqN2or1JaiNBFbJ1IH7IslHKe46nN6NY++nVYNl8X+SHY6l6r8CHGHT8hsx
         Zym/ffGWrJOLQzYhwqIW7I8/1VSvN80UZ8YhP356RAjSI3JNhiIV7YDTR/yRZwEcKtBK
         4Kv9Qdrb7+ArjBxkzZi5zuz6Lpqtg1rgpJAdvC7kLpVAwNd9Agf17yjVyPVtrvF0VWyG
         dtJGjTTXCGvs6HpvPWdgcb4rakXTY62dVyIhUlrwArgfkhOY8474O1CYudRskR4eMhGL
         tkCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jS6OogHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05620a424f00b007063455e15dsi622332qko.34.2023.03.30.17.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jS6OogHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pi2KI-0007Kb-BJ; Thu, 30 Mar 2023 20:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K7-00078j-Ex
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:55 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K5-0005pb-Sb
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:55 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-545d027103eso160671077b3.5
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 17:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221318;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JVa+ysZi3CwbR24epjsK5up3WFbQnFpyGHTqEQOjKmA=;
 b=jS6OogHby3xJfSIk1dYJ483RUeggfOoDzT/xsIkiAGmJCb+bqVyfqLjss+Ba8PV8v/
 DnEMW8Nk6AYbeKd5E6Va7kGdJy1LE4n+mE5IrECeQDlP98g9NXDLXKQFUbwnQeWD3l58
 SfNDhOceC1xuNB3iPnYn/B7VEJ8uIGb5FKMVHUqJRImoYiSMsZpLF2os1l+8KVgUc6NK
 5Bhv7/cGty5/QwW64ozf8+rQJ2ZEXnHq4vEc9iOf4u2a4CEEHFBKX3KqC9Rrok5bCPlw
 25dn7vU8nlc4YfqOXVOmYAmCSEPyd+BMj0RSAo8sjwLbKlXGNlaEXXy8DIKJBvIQnO30
 0vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221318;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVa+ysZi3CwbR24epjsK5up3WFbQnFpyGHTqEQOjKmA=;
 b=CsOx3p69+MYfmS9fb7hMwaZmQgGsKcquuFZMW5vKch+cZ+RDUOHP8iG3bG49MookZi
 9EGYs3BjXNoqLzqUbthFpjcOW13unxJ2CI2a4s7lo5lSXqVcrEDFpUGhdfhN+mKlXiVH
 ZpmKkGHz4ItfmfArHCHgqWZ4tT+KOZoDl9Dt9B7waqTXlaOjdEtZqJ4JzdGAag3rp+Nb
 A2r3U+L8CTLTA9TO8ROwukdfm5ZSwJUuC/sojJ06v2mF5l2X5Cne3vbM8D+qniWJxNT6
 0NbMxucVUp4/EsvwUxv/aGmk7KNK2fWqjxxT2oADnIkCxmIztwhLNyUKsHvabpzSojZL
 fq+g==
X-Gm-Message-State: AAQBX9ddHCcmAR4BhxYhOlvwy1UUNAnPoEr+vsKN9Q5YhK8ijbY5x/d0
 +dV/wZeEAk0+psvBMP88FAEN0DohQgY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:2749:0:b0:b4a:e062:3576 with SMTP id
 n70-20020a252749000000b00b4ae0623576mr13087476ybn.13.1680221318127; Thu, 30
 Mar 2023 17:08:38 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:53 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-5-titusr@google.com>
Subject: [PATCH 4/7] hw/i2c: pmbus: block uninitialised string reads
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: WirEkQmKlLLz

Devices models calling pmbus_send_string can't be relied upon to
send a non-zero pointer. This logs an error and doesn't segfault.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index bb42e410b4..18e629eaac 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -94,6 +94,13 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
 
 void pmbus_send_string(PMBusDevice *pmdev, const char *data)
 {
+    if (!data) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: %s: uninitialised read from 0x%02x\n",
+                      __func__, DEVICE(pmdev)->canonical_path, pmdev->code);
+        return;
+    }
+
     size_t len = strlen(data);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     pmdev->out_buf[len + pmdev->out_buf_len] = len;
-- 
2.40.0.423.gd6c402a77b-goog

