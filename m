Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801724ejb;
        Thu, 19 Oct 2023 14:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGSHSks8/DSv2zBxJl5iIDYX2svOm0gT27o7qeRVqnFnm1hH1f/P3r7kDYUlwaE5RK42Pm
X-Received: by 2002:a0c:f513:0:b0:66d:3314:f7be with SMTP id j19-20020a0cf513000000b0066d3314f7bemr92881qvm.3.1697750579987;
        Thu, 19 Oct 2023 14:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750579; cv=none;
        d=google.com; s=arc-20160816;
        b=CnJWePvXh0UgXPTbinviSyGMyBh1AZPW7+e3dk6oU7s79JZRSNqBATds3NxSN6Wkvi
         N+8EV0pt9GqNXCUgXQrJMXRRQ6WZC4hpRb8mj2mxKGlpNYyo1CZHeVfZ1At417jrVg3c
         8QJevTtUItTxaFGw8VwAWhA5WJhWeT5ivvbOev6+gOTIzNpPZrtklrYT3PXQQhGb6vtC
         hkzXbf+g4yat1wNS7QNbu+sNigv7n6a067ReLm2sEUF6aLcsLl6oAR17Jm/kvIXCNBPY
         lzP6NOmXrgyJhBT8ZQZiMya8XOIo3CLiiGLy9FPArpZheSYtRalU6gLiMBepLYRUrXdV
         Etqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+goD7LWLLFlekg91oCfVK0c1MbYgJUFGIQyLFSXN/qg=;
        fh=pVLM9laBtsWiOgnviUzK78NWnadIGpJJW4/pVzh5tWE=;
        b=c8fQot8DzmZJhUbXXvoU169nzksDRHM2s/+nz9R12I3ZF+sWP0wVIN6scE8P/Igi4T
         OL90Pu8GtC/kVDziHfmHheUnE8SefD4XH5kqANdSESzKhCqkuuHk00y4iK+DHdqxK30S
         rjn+q97VyH+rNjBHaPyT18XYscg7O7ZL1fbAL/Hfky/fT9bFfKS+0Rz4CIiWMLnNEvv+
         gBLKc5fy12wDhjdoJbcPfNBD5ZyI6dMXXVodb2c74ghU8SgUVHM12M8OZziDFZQRuaUL
         ZhAY4ndxRiJV509TQ0hapvMSaLc2V4glSsPWhwsf9TPjvHuoN8kj5q2CuAANK5C7JYYJ
         T65Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqWe5ihy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05622a058a00b004197364a643si259308qtb.189.2023.10.19.14.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqWe5ihy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRo-0000tU-6I; Thu, 19 Oct 2023 17:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRl-0000iD-Gu
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRi-0005bw-Pb
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso1011065e9.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750442; x=1698355242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+goD7LWLLFlekg91oCfVK0c1MbYgJUFGIQyLFSXN/qg=;
 b=xqWe5ihyuk0+TNFL5KnXF2wwqxS3v0AJvdzp3rw95bQk3FssjmYF9m3nz6rAJBI6bv
 PnOa13ojUMHUtUMfOHm0Qhp6KbuhMPW+nAsl3E1vvEuThYa0ir2z4DpVOAm52W7M/VIm
 5vre2mF1ReaTR4Ns9yZWcFNIuQilw48YdO2reuh3MhHFAK02TgCzxGQ439mdugqmSNlY
 anIspcu7Ra9HBES2fWlK+uaP+x+sF9fTtVs/kq3zRx6z9vQdodSQpJEvJFfbKuvBULO/
 HYa/oIz2drtoHaXPYlsSETyaCS0vDx0dnnvCQFG5JJ0Vw5tulTEel/rSnETs+WcPwL5h
 Phyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750442; x=1698355242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+goD7LWLLFlekg91oCfVK0c1MbYgJUFGIQyLFSXN/qg=;
 b=pxoB+w+aDrHTujbXJVHvb+qM9EqeJq2oBwgQTkRKADAgo5wn3avAuv3IdMpF6SgzY0
 NUWl3nA4pZ0oomgfmiO5kg2FB0gvwIIvgfSGtSJvGfeCSPmWMQBP00j8vJa8TcrBSZJI
 qnQvUnKE5SJtH140UjOGjA9e/EaLzqlBRpwnurM+XRJR6Cmnl1V0AVLsOReKz0ho3+fh
 7YQbxebWy3i3Bs/tAIcFu6JvuAekgVS3ey8cyXwLvwhomQVIJFnZsUskSjuRalFjE413
 wThukaZaBxA7HlgrUnyx3gAha3xk0g39+UUg6AthtCn2Uar0c/TAxYrahjwfAK0l/5b7
 YkGw==
X-Gm-Message-State: AOJu0YzxuFhcDnH/sZ8PxS8YkXWJUdPibO+0GJ05cxCkPIkTHJcGOIME
 j39FN0zE4x8AOec6d1716ipIrg==
X-Received: by 2002:a05:600c:35ca:b0:405:3955:5872 with SMTP id
 r10-20020a05600c35ca00b0040539555872mr15966wmq.18.1697750442279; 
 Thu, 19 Oct 2023 14:20:42 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 fm12-20020a05600c0c0c00b004030e8ff964sm5346723wmb.34.2023.10.19.14.20.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 22/46] hw/intc/apic: Use ERRP_GUARD() in apic_common_realize()
Date: Thu, 19 Oct 2023 23:17:47 +0200
Message-ID: <20231019211814.30576-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: KfjPnAj0t5wx

APICCommonClass::realize() is a DeviceRealize() handler which
take an Error** parameter and can fail. Do not proceed further
on failure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20231003082728.83496-2-philmd@linaro.org>
---
 hw/intc/apic_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 68ad30e2f5..bccb4241c2 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -257,6 +257,7 @@ static const VMStateDescription vmstate_apic_common;
 
 static void apic_common_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     APICCommonState *s = APIC_COMMON(dev);
     APICCommonClass *info;
     static DeviceState *vapic;
@@ -267,6 +268,9 @@ static void apic_common_realize(DeviceState *dev, Error **errp)
 
     info = APIC_COMMON_GET_CLASS(s);
     info->realize(dev, errp);
+    if (*errp) {
+        return;
+    }
 
     /* Note: We need at least 1M to map the VAPIC option ROM */
     if (!vapic && s->vapic_control & VAPIC_ENABLE_MASK &&
-- 
2.41.0

