Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794776ejo;
        Fri, 5 Jan 2024 07:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG79LBWPEJlptussFDvA0fTwFit4jzrJx/c/CqsZVRyvlvA/xiqYLbGN1rEhQq5u0H8GLN+
X-Received: by 2002:a05:622a:450:b0:427:9a7a:2c72 with SMTP id o16-20020a05622a045000b004279a7a2c72mr2600156qtx.112.1704469766706;
        Fri, 05 Jan 2024 07:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469766; cv=none;
        d=google.com; s=arc-20160816;
        b=RqfAPLd73PfC6RkPefPjDa0LlCg/c3WIG5mxGiMTeOwqhM16bJ/lHxBPr6pnqs+2lt
         gGcxBUbw2uxeTS4h2bAsVAD54nITwzSWIDS9c3JrXsc87JLbmM1wr1gqC4CsTzfH8GU9
         aBu7kCQsTF/R9DtAcFPpbJJjaR/J7fk3NPNse0MDANHHu3b+Ckmr016LlFn/dK7FFIVN
         Noz3iYet3ZJYhrXe0V9/7Lek96nePKmUJ2vIjHlnphsiJNCxazH4EKRh3zAyMIGdmvzl
         462jZBet7YbADifY/bFfWcStjHVNZEipzD3ZcC9pBtRpL68BwfxytYR39zbSCJ1ClWdp
         wbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MxNkugF37b5fEcbJO0/Zfbyy2DcJjrIhzRUUZIZhOZ4=;
        fh=RHvafWDgpoEf3dpMj/nX1s5Lj/g1hoSh/j4YvQR2jco=;
        b=vZaA4R+zwpcfnMMyYnWekBxN6j8qwGStsH6SoHPawRtK2E4w7sHbCgW94a/zGleIlz
         pC4/0jgVJb824Q+M+qp3Ujtpq9EA0QELHoreiG5smiFW4928D1YEzYVt9ZGVASzKjLZ2
         5R0TsgEA+zkhPqHPbDhX9SM71EXDoQbsBflZ15Xv89ZRn+sdg70BMxKuenO4JOrJSf/L
         fVY8LAs9ay5sxMB0+Im6UzMWO1mzwbAogziVctHnSIKhzNU/JuwSqh7Y/QKkx+iFJ3Ne
         23foBAvow2pFYrl10E1rqqQP2bYKYrp5m7arykHpeGOUFkysv6tHHOFSlP/XqmKhV3st
         CFyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYLmrPiF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020ac85787000000b004277d662d67si2026323qta.512.2024.01.05.07.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYLmrPiF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmR4-0002YA-Mb; Fri, 05 Jan 2024 10:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQE-0007VR-6B
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQB-0004R6-3U
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so4035035e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469661; x=1705074461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxNkugF37b5fEcbJO0/Zfbyy2DcJjrIhzRUUZIZhOZ4=;
 b=yYLmrPiFphG60m57lWmC4wzmjjC5wVNp3yXqvYn5hD2n/4yIBy7JfY251rW0btPeVh
 K8jX2XUEbDcJJsBNOYaM33TPegWCZy6Db1d2U7ge6EKZQ6H9yhtAPOwYGJJrwdWAdDyJ
 SSksFTsyvOlezel6aiee7zY+Pfsf0aDX4C0W2Aa4/J9dgq96kepL0zHsxZC7lcN3bpNM
 ZuxqOz63Yr5gIr/EuCp6YDRSBvOFOVcf1FVuneMfxkwwqxVxLi3W5PXHJPtpW6Cbidis
 9xLUSHsHjlTeVj4cJIb5Hhg1xKaJFikrm/5YS773otLAsL4Yt7do9EUMZoHQJZI3ocj7
 uFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469661; x=1705074461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxNkugF37b5fEcbJO0/Zfbyy2DcJjrIhzRUUZIZhOZ4=;
 b=VfE+dowLyZ7XABI5RPTHm5/qm7ffZLTxHv/OcV/XVx6EJwq4qC920DB7HDTC9zmxpJ
 za0kof+EXDpKj4wNb//DNdYB8RmInNeBkPpOScLq8dfKQVuG7j1b6v0gSrICn/pRVa7y
 Sw2JIjOrJ+oqdurEE+V9wmpRPi6q8OSM4lLmE4qbhDBX76pxXWFyJ45OYUvppyuYU9h0
 70RSVVsK3CtG1It6G+KDNPM48yUtUohke3juBJGYqBDiezbx9dmzidoZ1SMRVrf3P1UQ
 Bm700qODbjkE/9rWxfdkcNuFHhnFhH+fu3nHBtE/BBrlwP98x67K9Qb3gUVp7hL5wPFN
 u94w==
X-Gm-Message-State: AOJu0Yx8HrEkvJJVjm5C3HJMf56GpAZ4zLSCUfRN4jKCRguj7SkLW2pT
 ol4SAda6PGMOT8YgSrg+lSysmzcu8JGy8Q3bq4nPPo5JwdU=
X-Received: by 2002:a05:600c:1d0a:b0:40d:81bd:9d12 with SMTP id
 l10-20020a05600c1d0a00b0040d81bd9d12mr1310560wms.147.1704469661441; 
 Fri, 05 Jan 2024 07:47:41 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b003365fcc1846sm1605027wrm.52.2024.01.05.07.47.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 42/71] hw/ppc/xive2_regs: Remove unnecessary 'cpu.h' inclusion
Date: Fri,  5 Jan 2024 16:42:35 +0100
Message-ID: <20240105154307.21385-43-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bxV0dlGbsvj4

xive2_regs.h only requires declarations from "qemu/bswap.h".
Include it instead of the huge target-specific "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id:  <20231122183920.17905-1-philmd@linaro.org>
---
 include/hw/ppc/xive2_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
index b7adbdb7b9..816f5d0e84 100644
--- a/include/hw/ppc/xive2_regs.h
+++ b/include/hw/ppc/xive2_regs.h
@@ -10,7 +10,7 @@
 #ifndef PPC_XIVE2_REGS_H
 #define PPC_XIVE2_REGS_H
 
-#include "cpu.h"
+#include "qemu/bswap.h"
 
 /*
  * Thread Interrupt Management Area (TIMA)
-- 
2.41.0

