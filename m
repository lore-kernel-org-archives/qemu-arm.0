Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2100438ejb;
        Mon, 20 Feb 2023 01:16:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8NLEOwmWMILfCLGXYyVVwCwc/YhoDqSelmin+adzE2c2es9IW9lAOnNzxbdfJUz6ll2Ktw
X-Received: by 2002:a05:622a:50e:b0:3b8:6824:e3ef with SMTP id l14-20020a05622a050e00b003b86824e3efmr16485321qtx.48.1676884607745;
        Mon, 20 Feb 2023 01:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884607; cv=none;
        d=google.com; s=arc-20160816;
        b=oZBfR2HZlzzGXL4pDKs/fXOUktkGpLDH/Abs8UcfMHZuiBnDpeR3Hs2l/b7ivdQR0g
         bPVn9qq1x4dgJ0Nhn77hEXw70GMYQGXi1EoDHY1Eg04EA7k3oAqHIKdUE/Cj02rmcIBT
         BJY9cXhKzkDPTwAPccSTBaHW1J09bJhtzlfNTqy4CjXk7Balws+VWUulG+NXsToGwxUT
         rUbBjKlJJr1H7PzshfSju9tYqdSA8oYSDY4Dv4xDyq0oJcSjQOV43m4M/Dx0ZOGAGCkK
         /atwEm/0ciclX0BJ1BceXgshP+wvSZHgr9lqc3JyoFcZYs+dBdLaJKLh7KwlmAJSyam+
         AmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4A4SsLrMuIwbak6pyt/+cbMSuHTNMfA64YSLVmLb5ZM=;
        b=isB+5f8RpugOCGSGBnh91efI+mO7kvDVyPYps5Plz9Ks0TLMi5/eZEQ0eaH2ImPwyQ
         Y2nsTL9XBIMDcANV00K/EnOIMylWCf/HzkLVdspzo344Erd+RPO4VsBeYxSK9pcy2BWp
         FZ/Cg05ZiZSgntZuZYfW3ByUyjVr/a5GXHQU9sy35QmC8E5jU24KaZi4xfL5On+nUaYz
         ir93wMEbNxgPYmnpT0wZo2dIAxq4QS1F0zgyG+r5kVn7Eg1LW1Akzqh0TziPX+KQbgpu
         I2s9t0cA+cGdc9yPzuaWwhmduFBfTxSP0yvU2wkh6gaPtyAmwB9k63AQ30Q1sT60vTRO
         cdzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6MUYLMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020ac859cb000000b003b63cc0efabsi9634297qtf.510.2023.02.20.01.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6MUYLMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2Fw-0005qB-F5; Mon, 20 Feb 2023 04:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fv-0005pu-K3
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:43 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fu-0003ie-4t
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:43 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c17so1874965wrx.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4A4SsLrMuIwbak6pyt/+cbMSuHTNMfA64YSLVmLb5ZM=;
 b=e6MUYLMqWdLWeqQZMf2Hw3csPi3Px7nSr8ih0whFq60tzAMtGHRUyodHL8wHXicFOV
 bKYGQRAAGCNMxPxIjBhVSPDrfQ/M1FA8qpG/ntTPviYpvZTk79xzeCgSfWBywi8ygDNu
 AUMvrirJJ3ZtmOZXW4EvGXG1DV9zz113BIL7Wb0NE8CGT1QIPlx98MlV9X/P2Gs/wHjo
 1LQcULiZ12JQSkKT3bSwAMkVEimTyo1qQu5AVBoUaFZUgnvFq+7JpVcibM64+XshDO/H
 VXQ/ckZZbzlmd4YQK/im3Q+pwlXKGImTlQRgKUTWNZrIwb4ar0+Ymm56CSJWTRxUqUaI
 8/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4A4SsLrMuIwbak6pyt/+cbMSuHTNMfA64YSLVmLb5ZM=;
 b=xzY4TKXPLayhZA8HLTfSe2c+phH/ZPIBEPyyZb9ghDBYlZdaQGN1RSwFLR1+2QIpup
 zqH4c+mfxoLz3ukXzVSf1DVPY7D/B8qyPYC/Ev8jtbY1BMsIbbu/RYpxq495i+L5R+Rb
 Cihii+eD1sLxOt1tk9hmtI5NhPC7ALyYvGD3ik0SZgd1R3MuBKbjQkJTASXSwU4v5wgn
 4GyK0MoigFYnUeBRZlF2YsrYH8hxuy4vKsSXyOEjEL/m/crzsyhg9dPqBrXrz+Gdh6Fc
 DB5QHVvkyI6Ni52JwiAlDqRCRMix3UbrM438+FZ1ieGBlXOd61WutTqxCpfzYyFmICJX
 jFog==
X-Gm-Message-State: AO0yUKXgKaUkQBcP+NVrlOx64sC5WYKYe+O8YdIlsSX9JMTGvdYDIEC2
 JFQARVvFS5LBoGC4pdSaUkB29w==
X-Received: by 2002:a5d:6548:0:b0:2c5:54fd:265e with SMTP id
 z8-20020a5d6548000000b002c554fd265emr974190wrv.70.1676884481451; 
 Mon, 20 Feb 2023 01:14:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c410100b003dec22de1b1sm13328503wmi.10.2023.02.20.01.14.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/24] hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
Date: Mon, 20 Feb 2023 10:13:42 +0100
Message-Id: <20230220091358.17038-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: Asdtdbv9Zhh6

Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
DMARestartFunc typedef") which removed the single use of RunState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-8-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/ide/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 29a8e79817..e6deb1c5dc 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -7,7 +7,6 @@
  * non-internal declarations are in hw/ide.h
  */
 
-#include "qapi/qapi-types-run-state.h"
 #include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-- 
2.38.1

