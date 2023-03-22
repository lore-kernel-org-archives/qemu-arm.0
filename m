Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5584417ejb;
        Wed, 22 Mar 2023 10:58:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set+57aRg/sLv2ga5dxIsZMTvbwwDuCUgkQ8EQ19bIujVYsP0XJiLET8n8AZ0K9QwRWnFBBG/
X-Received: by 2002:a05:6214:29e1:b0:5c0:51f0:eb45 with SMTP id jv1-20020a05621429e100b005c051f0eb45mr7068870qvb.15.1679507897794;
        Wed, 22 Mar 2023 10:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679507897; cv=none;
        d=google.com; s=arc-20160816;
        b=1JphAgO595ztUNCL2qAkJM3Hy5VCHOkh6VSVPBqHS1/oNw16Ev5gFlqhbJXGTQalvH
         46HiAacYgKQS9JNiAUqQzqy6gaacQlCPunmtor5K+ERVBeoxWiI2RIp9sx64DODPUDZa
         3OAPW5QzxjTGasQmMVJtNfmjXy0O3Rmbkb4rOwLbnIpFIzaWtabunmL2znOBmW3OulFq
         jqh3mThWqvnAnk9uUO82pvJ6vQb5CU69b34+640dypT9UMYGCXALxtH6S2ycXeV7BLBZ
         8U3f29/B/1dBpczBgTa9ff21uYGGrrCgBLj5xEyI4JkWkfrqqgFGXiJBdhwyqSl/umHa
         qIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xgLuRZVtqHDGrFFer+S3EY1A5uZ4UquNrXBrasz7AHI=;
        b=fqrOUOx13UdX4xmi6KKYSO7mNcaDkw702zGPEab3P4dThXE8kWPqNNQN9fgqk2pn4z
         RkXFjGceqJyCmcqR9oovgN6G5IP2+6cHUxSP28Rg2xkddQvGMJKjlptIoeZpaPxYQTIw
         6l5vzoM2ZuKgH1w1WtM+0NaCFRxLdFfYnIQzx9iChK2JXUecFuMkmysv8oq5s+mejTOq
         fSfEoPPP2peKlhSnkheAiuCqpPHbLqz4NkwYXt/ppYDBeP/1V8E9bO0PtFXdjXURJeHN
         Zff8+MBTKMo7c08FOeYREOpf6prKd0QB00mImTrSGQXJ2RojWYNm9IyEJv4LEpqzRiYd
         Q5Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=f8AR9nKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6-20020a05621407e600b0056bfa655111si10879521qvb.27.2023.03.22.10.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 10:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=f8AR9nKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pf2hW-0000An-TU; Wed, 22 Mar 2023 13:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U0EbZAYKCGobQbcaZOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--titusr.bounces.google.com>)
 id 1pf2hV-00009V-Dq
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 13:56:41 -0400
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U0EbZAYKCGobQbcaZOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--titusr.bounces.google.com>)
 id 1pf2hQ-0002GT-F6
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 13:56:37 -0400
Received: by mail-vs1-xe4a.google.com with SMTP id
 i16-20020a67c210000000b00425f051bf84so4180929vsj.13
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507795;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xgLuRZVtqHDGrFFer+S3EY1A5uZ4UquNrXBrasz7AHI=;
 b=f8AR9nKldyRtL/nSHJK8++JGEBphRh9At6FYSeu/uzGVIPQtKB3PCUd9R35tLjv1IV
 8/QxdI0MHCXgUwBIKjo9aOmJibUJhL8AsSSI1DoiTvhC2DO6lA2FcP42XFs0eAHaDVBN
 i/ZYf7wcnHWMjF6Ze0qon1GdHm7JQJp12Qp6b4+COAI2WN/d4vO6MWhmw6+mgUMzijQ2
 mLVjeFPyEVQcoaJO4FbXt9nh/+ASQR1kc60Jp3aW0frCAqbRQoGNk8CYESskrQwfZ0d3
 bBX2acVQEuBJu17WL0mTXG3NCwMJWoR1qg4DxE4xoZuD91fYsSdmo1AgbaSq+Yy1pxXh
 ecbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507795;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgLuRZVtqHDGrFFer+S3EY1A5uZ4UquNrXBrasz7AHI=;
 b=CKpV2UdcXAc07rN/q81dLq2+eqkEgmPqMK5mTjpPEnUBvQIwnqYbCXhzmVdV4K+U9x
 zAen7dnfnFxP/G57Qv1AybGXyhozp4ezFX0SvoTiyNvA0tTiHEPla0bbk1qbFBt6zJhY
 ZQfsvaq8FJpl+BlfHeo9JPAfo+Tm+6/WnTwO4TNYbny6xabjesIpJxcGkevc/o12KaJD
 ixCX4QgASeIg/yoMslOON+0Aucm+XTvmN/xL+xj3/XFSLigvr8+EtWWevu6AVLKr7qxT
 1SdejYOhz2MGOrRHjuwMMvq9kHhFuvvywG+X/Xo0XLMNiXa8WbJc+OjCMGqaluO/zFEY
 DU+w==
X-Gm-Message-State: AAQBX9cksDnkkwDv9eiAdI53Dt1nkFf7xRvd9M3wDU7Wd41kjkEBbHH3
 eYWHIcJOsjZ+wpl0AzRUUOJpA0Mo+Ds=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6130:312:b0:68b:817b:eec8 with SMTP id
 ay18-20020a056130031200b0068b817beec8mr3924877uab.0.1679507795269; Wed, 22
 Mar 2023 10:56:35 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:12 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-5-titusr@google.com>
Subject: [PATCH 4/5] hw/i2c: pmbus: block uninitialised string reads
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e4a;
 envelope-from=3U0EbZAYKCGobQbcaZOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe4a.google.com
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
X-TUID: A+3s6OjiRz6U

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
2.40.0.rc1.284.g88254d51c5-goog

