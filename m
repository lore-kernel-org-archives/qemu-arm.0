Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA52C54FCD
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 23:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpDT2-0007Ca-0x; Wed, 29 Jul 2026 19:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HolqagYKCDUkZkljiXffXcV.TfdhVdl-RidefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1wpDT0-0007B1-Ea
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 19:13:38 -0400
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HolqagYKCDUkZkljiXffXcV.TfdhVdl-RidefeXel.fiX@flex--titusr.bounces.google.com>)
 id 1wpDSy-0007J1-Tr
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 19:13:38 -0400
Received: by mail-pj1-x1046.google.com with SMTP id
 98e67ed59e1d1-38ea32e57e2so2520427a91.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1785366815; x=1785971615; darn=nongnu.org;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JVD11tqubf/ZoFd0+u8pfU9HDmID5aXBVmA5l13Z7RI=;
 b=HsBunJsYifMjzgbuPZoYXslbsRwsdswRy5m6V6TPzbtVU/xZJNz9t10rbz9G7X2Yqo
 RLKauQN6cIkMUbHsBPgqe9z8OalvKE3W2MLjqF/Accuxv0zWqXoRnaae+q6JqkE7c+gs
 h/Dkm02GqKB2SdtpJOqCFQnRA4EzZ/JVyCrHZFRtGbR3g6pCFE/hQy+bnl5K8oiivHBr
 ZYxYqBol4Y2AyC7vOmhjPsfUFYpDz9C6wJJfic7SJharcUdntom8YD7NNi3dXuIbsFV+
 TkgJzQImr3XwR02HxDD2K0R8g64pL3xfPENsMPoESESC5tmKQcANvphYQxplzcdsAzAc
 q8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785366815; x=1785971615;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JVD11tqubf/ZoFd0+u8pfU9HDmID5aXBVmA5l13Z7RI=;
 b=fUF8EkdIv1wogCw5SVNi6pGaTYd8hHqIrX1HYThiIYXgGtGEBIir5UzxnQ8hgc1fre
 4aml+sFZZdEo7G74c2TUQ15Rljncj3lp6GsfHaAku8OvlYl1HZA0TM/6/ejY13bwh6qv
 HzilQtvRjn6+pWbW1JmwNpzVRoy+TkdDLhQEGGhist0MSEmswEL5ly3QS2xbj47qBmZD
 MYdCGSSw1ej4nzuHVdjnYobjv8Yj4yqL4q+FEKMs/lzqJTjgtqWLJJzESOj+/Qn33TUa
 tFVA3AxMddHQuVByyON1ru/Y81bGnkwOuv9kqhnSmIi/1q1yDfYQYgsN8SHORbPlQFM6
 aSvQ==
X-Gm-Message-State: AOJu0Yz0ZarahGLUaugocCEVk5LSohtVh9BbABGm1Vot/VBeyryFqqFW
 Okurl+P0L3OiiufN9w+aGqLVBEZT0LnQAZ0fJingTOBvOg03ECPuO+WaY2jjj1DfFlqswiZFqp3
 +C5e8HA==
X-Received: from dybih50.prod.google.com
 ([2002:a05:7301:30b2:b0:314:3eac:8ca1])
 (user=titusr job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b84:b0:38f:5801:dc0e
 with SMTP id 98e67ed59e1d1-38f9bd8723dmr202745a91.15.1785366814582; Wed, 29
 Jul 2026 16:13:34 -0700 (PDT)
Date: Wed, 29 Jul 2026 23:13:21 +0000
In-Reply-To: <20260729231325.3808993-1-titusr@google.com>
Mime-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260729231325.3808993-7-titusr@google.com>
Subject: [PATCH 6/8] hw/i2c: fix VOUT_MODE representation on little-endian
 machines
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1046;
 envelope-from=3HolqagYKCDUkZkljiXffXcV.TfdhVdl-RidefeXel.fiX@flex--titusr.bounces.google.com;
 helo=mail-pj1-x1046.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jason Fan <fanjason@google.com>

Even though VOUT_MODE is only one byte, bitfields are allocated in the
order specific to the host's endianness.

Signed-off-by: Titus Rwantare <titusr@google.com>
Signed-off-by: Jason Fan <fanjason@google.com>
---
 include/hw/i2c/pmbus_device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 9f3569e997..03b2c21c19 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -449,10 +449,17 @@ typedef struct PMBusCoefficients {
 /**
  * VOUT_Mode bit fields
  */
+#if HOST_BIG_ENDIAN
 typedef struct PMBusVoutMode {
     uint8_t  mode:3;
     int8_t   exp:5;
 } PMBusVoutMode;
+# else
+typedef struct PMBusVoutMode {
+    int8_t   exp:5;
+    uint8_t  mode:3;
+} PMBusVoutMode;
+#endif
 
 /**
  * Convert sensor values to direct mode format
-- 
2.55.0.508.g3f0d502094-goog


