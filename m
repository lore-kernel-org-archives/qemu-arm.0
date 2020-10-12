Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1147839lfa;
        Mon, 12 Oct 2020 08:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFMFnKDf4B5Ml2Y/WAXaI9agUzns5LQNnqhh+uNyLruV1NNBSmDv3rH5mGSL/W1e7Aepgl
X-Received: by 2002:a25:aa4b:: with SMTP id s69mr14155203ybi.435.1602516869721;
        Mon, 12 Oct 2020 08:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602516869; cv=none;
        d=google.com; s=arc-20160816;
        b=KCMX/8qzLZUpBUN4y6FZdEjYeAilPrdMuvP3FBsIaabHJnlpefbdrwvmJe7pFrQwZr
         OHBbGO9bU0U80smvyWEgpDSXcdTS4QHo+OfGaNQEyO/fII9Ah3Lt/jZch14ww5J0EntR
         I7CfeKgCtLarGOjiZ481Ko9diSDcMVOPKNQFhwgcf/rv1azieaK5stVM6rRstHm2IezU
         cHmgUuNqIoh47zzJMbcYIe8X2kFs1vdvjx/CPAO9q8UHan2iFhTrOTmHlb60/VQL++Eu
         iJGgabQjMKlT3tksOffZpV1BsD2E06HMrBLeQqDwts4wGdXA0CxpZc4xIDXJkre3Etw+
         Snug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jFGBpg8QTM0wW80ptrMfB2TplDyv41drpm/PS9njFvg=;
        b=zxItIb9QJS0QYNK1pExnqOecsdDllpWD1oIcRaUm9QxAlvVwTNduacQWBwEWg8brYr
         ILfDLY+ABVSIOR2O39DSo6c+O7dohZnv8Rq+cOgPzq6nSm2E5L7s4hwzATZ4Mwhy0Dih
         BJDyDV2GVvQyZioraJbXVIm0eZowZtKD+oLgGSUUCS4O2ygJ7oYYtvSqS9hyOeUyXgSP
         jZAi0SIO0O5iu7avVvfHyKiiXr74lYzPLf54FMQDa1IiQzf4wYFEa1sYg6jPFyNkMdOD
         gRuRjb15phfyCYgYL4MXgd0FHG2l/4rfSSapm276erHWjxoS3xCc8HgwjfnM9pus4w0S
         12Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XV8umfJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si16021890yba.139.2020.10.12.08.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XV8umfJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzqG-0006Os-So
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq5-0006M4-0h
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:17 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq2-0007DT-Rv
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:16 -0400
Received: by mail-wm1-x343.google.com with SMTP id 13so17525043wmf.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jFGBpg8QTM0wW80ptrMfB2TplDyv41drpm/PS9njFvg=;
 b=XV8umfJvSJXqFbxT3gHEcYkxjJhgGsSJq6EUVHE9M319Gvvb1wDfJmmkKxohnrRNGx
 FPZ1Q6FopWRAyyhooxMI7rkzsbyfGWh7XCFH9SVl4jWNsGBd6m6hAl7AitZ01bH4tliF
 0Y9ZxQ7Zlg2VPH1LW13E3B0Cxo5qU9mRgMvmn3GZBhQKnTaG8TkG7diEOmZEshogJulx
 SE4URXaOVbiNpM2JC+SICZ2chVIXIexHbm/mq+OsrGTn4RYVTMsniN+MlXEjeD883ynT
 /wE/TQSt2dkUsVg8Ka22il4bVeASf39mFNmmOZQa8qno2xzXzeWl/FlvX5xgbJ0UglLa
 RJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFGBpg8QTM0wW80ptrMfB2TplDyv41drpm/PS9njFvg=;
 b=ZWH5HtjFbb5cOG0xyQDPtqRfl/GxNzoC2RbGTiVNumH4olt99ayif7ucHTUr5LKMzV
 XHw6yrmrmaQtDNnEDv7uiekjy+lRlA1YAl7QB7ut7sLGU6QYbKRwkP8VA9JsVoMmKK1r
 5IBa2K8qfWy06ddhMRH+XZuapqhj2uluql2Yql5G2BX5byFLNw1cvJggtcN87lU0WO81
 zeOQRkYULRsEjrZHeaHmCt/VFD7lO7wz7tZHEIJzrM7cjV5vVjDwQE1LBYOOmGMsFYiE
 A2c5P1JzTFyVEGTo4q4x64oZUFe7WiZcv/XN+sgncC3yySGPLBchyrpPDJq4cSe/vcH0
 IOKA==
X-Gm-Message-State: AOAM5302XwsJhJ2gb+H/2xk76xKG6ZfIZk2H9FyGT0cVSJbzWh5PjA6v
 hfCJCAZd8mVTlK6sNA/2MFJkEP6Af/QtOE5F
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr10758173wmi.29.1602516852533; 
 Mon, 12 Oct 2020 08:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] Deprecate Unicore32 port
Date: Mon, 12 Oct 2020 16:33:25 +0100
Message-Id: <20201012153408.9747-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZKIp0G/GpgoT

Deprecate our Unicore32 target support:
 * the Linux kernel dropped support for unicore32 in commit
   05119217a9bd199c for its 5.9 release (with rationale in the
   cover letter: https://lkml.org/lkml/2020/8/3/232 )
 * there is apparently no upstream toolchain that can create unicore32
   binaries
 * the maintainer doesn't seem to have made any contributions to
   QEMU since the port first landed in 2012
 * nobody else seems to have made changes to the unicore code except
   for generic cleanups either

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We last considered this back in 2018, but in the end both QEMU
and the kernel gave the port a stay of execution; the maintenance
situation doesn't seem to have improved, and now the kernel has
dropped support and especially given the lack of a toolchain
I think it's time to start the deprecation process here.
---
 docs/system/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 851dbdeb8ab..4c52098c707 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -416,6 +416,14 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
+``unicore32`` CPUs (since 5.2.0)
+''''''''''''''''''''''''''''''''
+
+The ``unicore32`` guest CPU support is deprecated and will be removed in
+a future version of QEMU. Support for this CPU was removed from the
+upstream Linux kernel, and there is no available upstream toolchain
+to build binaries for it.
+
 ``tilegx`` CPUs (since 5.1.0)
 '''''''''''''''''''''''''''''
 
-- 
2.20.1

