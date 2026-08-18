Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DFBC5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 00:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww7f8-0002K8-4B; Mon, 17 Aug 2026 20:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f6-0002J7-Dz
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:40 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f4-0004IA-VT
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:40 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4b1fcd3b1a9so1643048b6e.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787012798; x=1787617598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jl6LTei06PFLBixWeheCfjJtohyjel6JsDpqWhRIxJU=;
 b=PYf4nUgTpQ70yC2Q9MzW41vQcqKv6PVKjBLzi83er1Eq5yC7YuEWhJt/6Y+FliaMyP
 QLHemF/9MXy979vSbOqPNDi4icMw7egRM2bxM7SId5FZ1wi8eSNNAzzFoSDeEdgisjNc
 os2Qy6OY8vA13fx3jHmRslrTZvhuhtZ9O1XxkXAFFSbo3CbpFJclF5MvoXhNCmtTXIa2
 jmz4zzoaCLgquR2dSNSnfWiY7B3DpuSRls5lygoS+b5f1WQvNt0uBKwyADVRR6EBGBtk
 Jta3+/hOn2/BlKdEqbhJgtbp28rG0Otdn+xDMhM6FilDI5ZssC7Y4wTRbCoPe7vLbEcs
 FQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787012798; x=1787617598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jl6LTei06PFLBixWeheCfjJtohyjel6JsDpqWhRIxJU=;
 b=D4nE/ul59qDkTepgIOubmi+L6Ml3BqdxL/ZFzlLRna1NPW5QKzuScK6q7cda9fcYBF
 UM5xG8ng3vqK2coig9B1AsTcShFrNuxR8EedaGiWfmv35wC3Jm8XdHD2Lw926kLfng9M
 j2uiZmaIbq7XPAmYkCVFqf7s1dBTmrroiqtvHReW1G1nqqWEIVBZmhNtajqzK6Lt5HgK
 ZeEvnX5HbGFtE4JyDr+ua9SgJEs8tC07/ivKOmoCaguGAEdG2Er8j5xujsRgTmxKIU0j
 lg+wxvWMnMWRfk35yYmn5PMx8wVSh0n/plUzingYK9U3/ShNnrrAPFmaHAbvJfwP03KM
 W9Fg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqP3+BMvwZyx5de4FrkehU3WRgJB7bLCNPCRoL1Ek+zd6PH80Gmz4tUgQGSALHeeu+bUYVI7Gch/g==@nongnu.org
X-Gm-Message-State: AOJu0Yzk9R7rAugbfOsZdaJzm5e2xbwkrw5ujLoDeHbD0yDyhPztFOkR
 vKZvPEDks4H5G5AJ0LbwIqTRDmIF17RSE1hwP3g7HYi1uCkr3xJdQCzO
X-Gm-Gg: AR+sD136374XwQYXdtNqkRwf1R6sRPnFjySlWFXNjm9ZwjKAUmFACKhsKWaLbmLr3sw
 UBTnwV/IWVhQDMFd6CeAmsorBDE12xWrmdOdPVV6C3hPrFKyx2WjOOIGrmuJ78LmV8sU7C56mis
 LfZGYClXRcdolWuNiefgMsw+AHkgnQPqEKPvD304lmJVqyb3V8tzjqGTFaYzEV0BAWoUKhFIl3k
 npvtMJStgX+gKOxcliNUKO8VVVVsN/s45s/XnB0DDbwflcIvWn3N0+j2S9DSXqT0RLH3msAkyBG
 EUau8rBpd4K5pURF3/QneqIeAQxS7JaxGs3yDYJSr1xp4yprHKb1BaM4WOo5q2NR8/OjnWldygc
 nkHXin51hLBJSjS49OC1Z95mSR5cbK4ZWfAU4EL+4kV8fvFeakgQ6OeYA0u9lTXGicngFlZ07ir
 8jTaeV/OSJGCi27F6hU7OJjOD0bQs6s6t29DIHzR+zeMY3lMVbbrGrSLRyTqtzr32+PIgRSR7yf
 CqlsEg+eqruVQ6Jh9pivw==
X-Received: by 2002:a05:6808:23c1:b0:495:e0a9:8c0 with SMTP id
 5614622812f47-4b241bbf01cmr27545700b6e.11.1787012797975; 
 Mon, 17 Aug 2026 17:26:37 -0700 (PDT)
Received: from LAPTOP-86EU4LQA.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b2960dfc9bsm1715165b6e.14.2026.08.17.17.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 17:26:37 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>, Owen Giles <owen.giles@hpe.com>,
 Robert Elliott <elliott@hpe.com>
Subject: [PATCH v3 5/9] hw/misc/iotkit-secctl.c: add SSE-310 support
Date: Mon, 17 Aug 2026 19:26:25 -0500
Message-ID: <20260818002629.172827-6-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818002629.172827-1-simonxhy0404@gmail.com>
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add SSE-310 secure and non-secure ID registers.

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20260805153005.9989-6-simonxhy0404@gmail.com>
---
 hw/misc/iotkit-secctl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 93753c2ced..9f6fb81088 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -109,6 +109,18 @@ static const uint8_t iotkit_secctl_ns_sse300_idregs[] = {
     0x0d, 0xf0, 0x05, 0xb1,
 };
 
+static const uint8_t iotkit_secctl_s_sse310_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x52, 0xb8, 0x3b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
+static const uint8_t iotkit_secctl_ns_sse310_idregs[] = {
+    0x04, 0x00, 0x00, 0x00,
+    0x53, 0xb8, 0x3b, 0x00,
+    0x0d, 0xf0, 0x05, 0xb1,
+};
+
 
 /* The register sets for the various PPCs (AHB internal, APB internal,
  * AHB expansion, APB expansion) are all set up so that they are
@@ -232,6 +244,9 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
         case ARMSSE_SSE300:
             r = iotkit_secctl_s_sse300_idregs[(offset - A_PID4) / 4];
             break;
+        case ARMSSE_SSE310:
+            r = iotkit_secctl_s_sse310_idregs[(offset - A_PID4) / 4];
+            break;
         default:
             r = iotkit_secctl_s_idregs[(offset - A_PID4) / 4];
             break;
@@ -499,6 +514,9 @@ static MemTxResult iotkit_secctl_ns_read(void *opaque, hwaddr addr,
         case ARMSSE_SSE300:
             r = iotkit_secctl_ns_sse300_idregs[(offset - A_PID4) / 4];
             break;
+        case ARMSSE_SSE310:
+            r = iotkit_secctl_ns_sse310_idregs[(offset - A_PID4) / 4];
+            break;
         default:
             r = iotkit_secctl_ns_idregs[(offset - A_PID4) / 4];
             break;
-- 
2.53.0


