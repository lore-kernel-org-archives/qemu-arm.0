Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp259782ejg;
        Thu, 18 Jan 2024 05:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxZN3XlYsTwfdVaAqgNlhGdxRR/XmOa8W1PFZPDhfKWGMQv9fbA3z8w7l+AnaGRPe+nwi0
X-Received: by 2002:a05:622a:48d:b0:429:97f2:85cb with SMTP id p13-20020a05622a048d00b0042997f285cbmr860345qtx.64.1705583830842;
        Thu, 18 Jan 2024 05:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705583830; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub3QRpAzHXV/sJDyXNggEJoM9Y2JVRWTanBFDe3A1T4hEDZTaWpil1Kd/LciqevtXS
         Yw8uBUb9aBm1RqZb7XQ1gTTXlnMz07xdn6QVByDq4UIKN9S0NDdzw9qjRXbl+j6AKh6L
         afxWhMwbbzUjTndZ0cSfY0Kzjet0WqWlKrP70DhqACT2ZeQhLWrPWjTcL0ScskAeL7LU
         CJ3ccmHRNEJ1k99NTwJt1nPFpKslLRuEE/AseLmmAqDGmZhwivjv46QGRjWCFU8rqMrb
         P0LUZbPzrgX/1UuwE/y1YPEBy/YYyEi/dloV/NwczI3QbUDSWu4MHgPJcMPKp9ApC7+/
         YPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jXuzdDHoDfS1SMEKlLWllgS9IfT5ukyEOa75Rlj3kHM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=mikQeBXC1iOoEwP3xbfQTvsUbX7L1SW0GyRKNlcNvx9LR0I+pq6+B02wQyZstLhdf6
         qnCLEnHuA/ne3YJ/N6Tg9Zc3SS0RItpU/pdvWDFPhK1uYapq4zucRHUNbbdL0ehk+EYd
         yoT4CvG+ow+bFplaNKQ6d+61Pr1aHoR2ChL//4ra74H0CQ/cPJ5ORr/eeLUCMLzjt04t
         Nw12jvX2sZ2a6N7ydtzzFGTvYumsuG6jqpPBUkb0wVAaIJXeVwb31kP+gY+0gtsJM5CP
         7zAHpdMRoQzrULLYF+jJt6v7XLueBpOSHauXd25YECSTsZ31hLim1l3Mb66KZGMIgFAs
         ct5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqM5mk4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u33-20020a05622a19a100b0042a1a88e1acsi1156653qtc.394.2024.01.18.05.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 05:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqM5mk4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQSGP-0005Y1-0p; Thu, 18 Jan 2024 08:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQSGM-0005W9-Hc
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 08:16:54 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQSGK-0004DN-Rc
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 08:16:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so49539445e9.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jan 2024 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705583811; x=1706188611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jXuzdDHoDfS1SMEKlLWllgS9IfT5ukyEOa75Rlj3kHM=;
 b=jqM5mk4oUYoH2mUbwftBX2mwWocmhWGwIVSpSUkESYHgyOWoKoeUIeIHA4pZd1Eq+o
 /7Y9jRTX/tZ8tgGGQuGb+0QsImSC4iDfzgZs/1SJ8MGVLPoNLTwyuca0mjqdCjfQz45w
 pmY0xDa922Shme+9cLL6HI1C1K6rN68eBeJrT/zSUePnZN2BkCbbcORcawgN/9379qZJ
 mf3PlnyKX8nxR6Lrw+ODk3vun/UJyl9g5Cs17yuQXp3rljFtmWBdUSJ9gzPkA7k5EfpJ
 flvXgOclSDmqyEV84OWDgOU86hP2o5MBP+gLEnw+ij0/FMZHrf+tptEP3c4xZYLRymZ0
 x/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705583811; x=1706188611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jXuzdDHoDfS1SMEKlLWllgS9IfT5ukyEOa75Rlj3kHM=;
 b=vAy9/gBCojvs7AhnWtWOdoHZbXgWd60gNRBtRdGE4MnoesP6UhSDFX3EGG+zyHfOcn
 xdNncTtVuiA679H6ZGjJygkPffgN5Xpq/NHnOdBhgD3dhUA+IcSDb20xxdOaowvdxefA
 WjgHkgrpYurcRvTCkFkwJM/KDQh/tlCVUSdVfUy32KVTK+ZA5aL5J4Ysahywcrvbr0DX
 lAcsPqSEnRdus4b2DO7acQ/2fTzxGzWx5XFW5br9XYcqgp5xikvcrtneHFusKelH1f4w
 68Cso8hRx1QYJOnuZaYDsycMLJ4hlNXcYVf4AfXl2zwoONcY55a7NbyWzNAvBcNSToUv
 JOog==
X-Gm-Message-State: AOJu0YyAE0sJRDMAUPNnvIcZVIwdJ5plpwxS3uKxwFCYRR3vSWS83OTQ
 WAdJQQKMyXSVSu2DNO4T947CupueNqbA7eHOpg/ge2HgcVN0jl5DTVNkvWp0rfxblc4nesTaf0j
 7
X-Received: by 2002:a7b:c392:0:b0:40e:6a93:1c42 with SMTP id
 s18-20020a7bc392000000b0040e6a931c42mr534135wmj.26.1705583811035; 
 Thu, 18 Jan 2024 05:16:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b0040d4e1393dcsm29277526wmb.20.2024.01.18.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 05:16:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/virt.c: Remove newline from error_report() string
Date: Thu, 18 Jan 2024 13:16:49 +0000
Message-Id: <20240118131649.2726375-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fm1InhwL/sgh

error_report() strings should not include trailing newlines; remove
the newline from the error we print when devices won't fit into the
address space of the CPU.

This commit also fixes the accidental hardcoded tabs that were in
this line, since we have to touch the line anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2793121cb41..da6cea30534 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1771,8 +1771,8 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     /* Base address of the high IO region */
     memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
     if (memtop > BIT_ULL(pa_bits)) {
-	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
-			 pa_bits, memtop - BIT_ULL(pa_bits));
+        error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes",
+                     pa_bits, memtop - BIT_ULL(pa_bits));
         exit(EXIT_FAILURE);
     }
     if (base < device_memory_base) {
-- 
2.34.1

