Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5961649lfc;
        Mon, 15 Feb 2021 13:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7OQoMX3U/FpjwZ3WTVz+OmUezHwobi8iNr1wgf5Y+9tqIVNCY5tpgBbl5PMqd5hW4XR9D
X-Received: by 2002:a25:1e42:: with SMTP id e63mr25409619ybe.270.1613426341793;
        Mon, 15 Feb 2021 13:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613426341; cv=none;
        d=google.com; s=arc-20160816;
        b=jy3s0GEC/PbVrMjtoEZMrhLF8VO33nBb0MOaWlNrGrQywpn0aTqktteXl50lItf6eL
         tvQUmy1mBZZdDBNn/w83vMRVZ8D4wv8yE9D/QCWD8lPZa2XUx8Xyk0J+SPXtl00BFw5H
         t6OEGrBcMMwlBw2Vs9enbYGYQ158QN0UVVDvMfakaUiXjSjiFUNaCyVj/IYuvdi04GTC
         3ZraZWLzoAASZHNIt7MDHawqS67U75aI4NlSE+eE8t87xOgixhdxGqqFiqQs3pFZwkV0
         dj5uG37ZSsOpCrorL5xYFQnmQAJF+aWLvGuUw7EN7t1dWjwmkAdNnKWt1Z6WYvCS9/R/
         ALGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AY0JUC3KB08rT1AI068cSkWI8i34wh3yvaVkhXHWL8Y=;
        b=T3H3INBKyaBJPLBCXELf8g+4HZzDktgw3xJw4FhwLgl064i4yL4CtSL65OnP8KIwU8
         9BqQH9uLiUiYf05TdyAmDwzdqs8OXo7BV1gJDL+1ZBhLTA2cx9b+0dQgvs6Po36ufEOL
         q665dBp0AzqwbwstkuirVBPPwrudfoy7flJ98WxJrjBTGU6oRjL/x4eCcfJvKcfFidtZ
         eNqJqswIxFXs6B53kXAWhdu6SLFNfUA9CkGMG2GXJOtAVuxGJrsZYP8eQAi9IhHFzKnL
         dy3CTbDuLZuj5l9HPhEqtc7e4z771GALuV1yGJAs5ZkJDEM20dv9QTcrd5mpZUZpZoFh
         odDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=SkVw2XH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si18136774ybt.404.2021.02.15.13.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 13:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=SkVw2XH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBltV-00070F-64
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 16:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt9-0006Ow-6Z
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:39 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:47040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt7-0007pQ-BI
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:38 -0500
Received: by mail-io1-xd30.google.com with SMTP id u8so8173622ior.13
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AY0JUC3KB08rT1AI068cSkWI8i34wh3yvaVkhXHWL8Y=;
 b=SkVw2XH31K6ikyCvmF1DNjGgisZlZkiZC0mXlauRtKs/w1ONH96w0+LL4wff9QMz+V
 cvg/Qmk1/K37GYxVY/LtNpOh4x+6OWOIa7be1v+xaHTBK9ogo9SaQj1h6noNzjOzR4OM
 qV+QhvgYGRdxuYMbwyDOCB6UcguCidjS54kp5bp4Qa9WPTuPY6aOcHcpWY1KipaKdVd6
 JrFXumtNPc8ntijlNs6+TcTRC71VzfJBoxwUxJoV4+Dnhh/Oeuur+uozBpEgugUdI+OF
 XYMR2IJkHiZQAzXGOpSmAL65fuzxx0pn5WbY2703Kc20XEHWdAscW5qV2ThMtiXQDiKb
 oi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AY0JUC3KB08rT1AI068cSkWI8i34wh3yvaVkhXHWL8Y=;
 b=gpytGlMsj83FjYMm+jWl7NUlkE08QV6PAzgEbuODoSHNnY0gC/DuAacD22xPIU5cpI
 /ZaLeWxPJh90EqycJnAhKRXBN2Ls0VS9+S8ro2aafpNx/rydr7YKXbMr+0x2ZKwQ0+zx
 GMmKMOJPkLeHg1uvDWpRNlLRZmYhsFljXSVHeCpOUT7WzgFdBGiWrATv64qFn7hqh4hX
 qeLtMkmr3M+FTVdRNGLCH0vHG+PWrU47CuyJhgbpvJ7i+XL0mksevESiFZWg5m7Cg5j9
 ops24Yc0QKQur8vGpUnvtLt6MgM9Naq8w7V3m0jlXOFrM/U4D2jHbM5nLzFHIwi1UuvC
 EYbg==
X-Gm-Message-State: AOAM5325wk2cyU4RwlWT7areB6jX9Y2oD3UvGJBWa0k4NQXf1/2USShs
 Wuymn5J2QLWHax4vJ2KYwcjMOQ2xCJVl8LshP+x7wT9xfSi/qhu4WsaPqG3mkKT0UuYSbhdfhwO
 w/Wz5v42sv6/CbTJtffCXMYmc8pl3PrF/O/QLsaLyCvQNTt8AC3Wpqo6pFFp6to/inKVC
X-Received: by 2002:a6b:d207:: with SMTP id q7mr14444206iob.42.1613426316126; 
 Mon, 15 Feb 2021 13:58:36 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:35 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
Date: Mon, 15 Feb 2021 14:58:19 -0700
Message-Id: <20210215215819.1142-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215215819.1142-1-rebecca@nuviainc.com>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NT644VUJ+fpp

Enable FEAT_SSBS for the "max" 32-bit CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50f..88a6b183d325 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_mfr2 = t;
     }
 #endif
 }
-- 
2.26.2

