Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806741njc;
        Tue, 5 Nov 2024 05:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAANFHKx2uZEDXNh3AY7VONbv/ihOYHQZ0sPKsVurW1LSm+NytfdptvHiChAdrnsQZbB2T5a5wjevRHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFcrAV7X16U7UcU2tF+yJ9Gksz3tf+jiChgUQ4gbc6jNhrsgagMR2OAi655C0HfHrPiUwci
X-Received: by 2002:a05:6214:4890:b0:6ce:2357:8a2e with SMTP id 6a1803df08f44-6d351af4ca5mr288270666d6.37.1730811986692;
        Tue, 05 Nov 2024 05:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811986; cv=none;
        d=google.com; s=arc-20240605;
        b=beXdSq/7DiHkHtJQNHzSnIvec+zUisMpySJEHgGkBksbw25HCWz2atJrBXaHQWMOkH
         nZDsI+F9YHOcHm3NhvWaNObDCIuCNdVIak99uZRPjLvvHFpUZaY4H0yeoixhByiieGJV
         ZbTYolPwldm5T5ZM/uhIMWn99yEZHVc6tX8YQN01gH48IgtKM3RtU+77zvC2Dyx1J4zP
         kGjnJ7eovz0oqLfn5Rfm0osMtJ5sBjCEXILV9AQmbDXktXV2WJYbbI9Pufkfp2GVq+g9
         HdvQxxu2rdgJNUiPLeUZOCe47MT/dd4S8VxcEbgCGE+6JhdV5wFFqSs1zGlGqiJfyT6G
         oVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ofAZFiczDEOu9xgPawLxt48aoodtpVY0sVqQebDNA74=;
        fh=7/xUCc+qURA3+x2MLo/W10NpHXGkIBUdwPfZdBgJKiY=;
        b=Pr3u7s1xfo6VmjYVM1l46AjKJUpLkepA+17T/U4LBM78jjvqGSRy8geLzqhxEcbIL/
         KZqYuEIOYL1Oh698xjMbcAGfWPmAt6Ml7Th1LenSi+orlD7/nZXS6h6fEzl5R+5k2NCd
         HdnXc9TXzBRL44wE1csuCb37E723iUPcxDAr4ZPF62XoYRqgKo6G37GTwFyN1lZDjNhV
         6bRTfFwMMPrjg2ojOQjbNl5QEBfziDkSu+r1jevzXRwjbsSKr7KJaXcI5YchomG9dlkN
         UFS1nNRzJp0Tz5lhLoQ8i/l509eE/tTAcBpzbPnqFP0CoSvM6w+OeAHq63jYIvJv7mFX
         zW5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeSG3ZtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416aa45si133199526d6.270.2024.11.05.05.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeSG3ZtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JGJ-0004bw-3l; Tue, 05 Nov 2024 08:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JGG-0004SK-UW
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JGF-0002aV-3p
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:20 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso46044855e9.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811977; x=1731416777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofAZFiczDEOu9xgPawLxt48aoodtpVY0sVqQebDNA74=;
 b=XeSG3ZtHsbO0F6EF9/mYVy/zZKIgeVbGJxqwyoPI5lmtzGuoVr3mAIg8c4LoiLyoHS
 +p8v4B9IXZJEGRxJq/YbjxFGpWQcE/wSHhc1iwvtFjLuGyg7h9lEMOrcSplz55+Zi6YR
 5b6XpZUYsGoCGGArYTS5WWRGrR1VFQmDnlUnlB1Oc+0izmis8HiLmUElsmsConxNxa5j
 u7lbaeAPtdVHEcZCgH4IKYBxCEQMcGBT+FZlP1PhEDyc/YJFgCZ+KFzRnRhYGqe500zN
 vupHAQCNvokEnfHWo47KtrZSDcv+Del6bnJITDvQDlCuFUD0G/7r7y2PeDt4AaF6nXvT
 QjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811977; x=1731416777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofAZFiczDEOu9xgPawLxt48aoodtpVY0sVqQebDNA74=;
 b=DTaPJVSHcFb4Ggyx7668JJ55AnLe5ELwNwMiP+Mzw4KM95XCojl4cd/t6QwqB7GnZx
 pFwTwr4JHdnX1sUeByza2IODFE2pMOhEY7zGmaRpxE/488kKkFylBAyZXLc/zboesHwC
 aabb4LSA94b6G2yv5+S/H5xa00YnMa2R4awb/7/POuStZUw/mh9BRdCsu0nT98yQVg+d
 vUE5vOzRYmqxoRUBgTaV6XXiNnTO+26nw4uPyXKotwJ8SpL66tWL9F/TTQ8lUhZme4rY
 FTacT8ewmPO3lVYbWBZ+7ahdYST5g6jFYsAWMvbIfrTSIA0SArMGdciC8UBkYWFmVC61
 WcPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA+L8D/dedyY4AicyW1f5IFhdchk5UYBTKtxqinwP1IRAWVtJ9L76Ir8JSdzR8Yza9uA0RQYHrHA==@nongnu.org
X-Gm-Message-State: AOJu0Yzo5nDEBuUwW4TOLwH9G1BdWtREB9YWucitPRjHUjLITPQjK6Cg
 XrhUd3sYHMxZdgMgU1pdPy8jPU1XRnQ7u7g0NEPuhiDpXrvexm6Oi1bOXthWX/Q=
X-Received: by 2002:a05:600c:1c15:b0:42f:8fcd:486c with SMTP id
 5b1f17b1804b1-43283297a37mr131910645e9.33.1730811977415; 
 Tue, 05 Nov 2024 05:06:17 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e7c8bsm193062535e9.26.2024.11.05.05.06.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:06:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/19] hw/timer/xilinx_timer: Only expect big-endian accesses
Date: Tue,  5 Nov 2024 14:04:22 +0100
Message-ID: <20241105130431.22564-11-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: BUdLm01aR2UJ

Per the datasheet (reference added in file header, p.10):
'Register Data Types and Organization':

  "The XPS Timer/Counter registers are organized as big-endian data."

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/xilinx_timer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 28ac95edea1..3e272c8bb39 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
  *
+ * DS573: https://docs.amd.com/v/u/en-US/xps_timer
+ * LogiCORE IP XPS Timer/Counter (v1.02a)
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -192,7 +195,7 @@ timer_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps timer_ops = {
     .read = timer_read,
     .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.45.2

