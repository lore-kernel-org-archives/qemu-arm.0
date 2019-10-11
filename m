Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp870953wrm;
        Fri, 11 Oct 2019 06:58:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGWzmt+tZoVtrjZMG4DAvAydFz76g8eeyL7gppsZ+FFB2tzGgsZ/8evW3rYTWcbvlIaBM3
X-Received: by 2002:a0c:e982:: with SMTP id z2mr15557475qvn.58.1570802314616;
        Fri, 11 Oct 2019 06:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802314; cv=none;
        d=google.com; s=arc-20160816;
        b=Gy+zuBwQRU9bz4iO9buZmvlqDcbhE03BdPljt8dl4sOhmX2AbGsfRaB4fljZ6KFxVt
         /wO4sDkXfUa6qLqGz0MBxH79jTZI66QAbk2FmO68PtltTSjuAzZOf6d6J6BrlCaX8fw7
         GUjZyXRnQ2c5EIIxUiBWt0EMpTHmDkw22AxDLC8F9AClHpVHyjn3HBMQsUobaMYvdkWp
         vbxXt/kdxl7GS+b4lN0zz6+tLhB9thMpvT6qkGp7FQhBjj2Et/jHqp1HjDi35IHKUin4
         H2MLtipnHZwv4N1t5Re7TEYHB/0HJOr2eNVMbKA44zWMw1DLyjryzO+byRrgVIXV0Gca
         CbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=PbD/qSofe9qS2Crqciyp9o1Gyg/ozYNCw40WhU0Rn+Y=;
        b=C952LkYKs7yVEDDQ2vv9SwLUqNO6n1rgAFZfmf0k59PVu6YJqcAsWoK4kwbCJprB7b
         VylcpJ2BVgF4Sgb/KKgXkQY6nxCOEWFTvvfJ9Aiya731Ip+jq2m3YpPs644CP0eG4iHs
         LSAqoOiSuXrtFoJm2R9DliwhJRPyjZkWbZ6pmTxV0horJxuemjVY71OgGrppwFU7hsT9
         F/IkE1KPCsZT3iwbiXDzGkNTAvytmaig9Jac4qGN0AxpsRrlMWBLjUo5rSTCrPSMup5W
         65cmbl2dS3kFmHV3mBwbD87gg+YV6n1GZLT/pqn2Ruz3G6U12+4UWza5kf9aTvqzL/0E
         Gymw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXc73B8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si8989655qvw.97.2019.10.11.06.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXc73B8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvRB-0007oT-QC
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJI-0005yd-9x
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJH-00045a-A1
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:24 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:37193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJH-00045R-5i
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:23 -0400
Received: by mail-yb1-xb42.google.com with SMTP id z125so3119788ybc.4
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PbD/qSofe9qS2Crqciyp9o1Gyg/ozYNCw40WhU0Rn+Y=;
 b=fXc73B8+k/nq6C0jV0T+9RDjmtZwkSaAJcevw8T9qek2cPT7phWzjgu3x3ojXxeHpT
 8vN9UMJC1TqRKKSvbsvN2FZCgpcJl9fXvTUfoaxxCTV+/GzYdAP57bbwryHLZi2rhhG2
 PPlT+mAqQcY2t7mGVenTGow044yRhNUxtBheGETiYPlmptVmt2Ljbh/tOAE46SqAy5fy
 uzxAVIVbjDXRjnyrXXvvXmKxLlPiHH3JzR8mjcA/yPidE5lzn5IR3Hp6C/k2HiPg4x2t
 ShoHMfZrYcbopFmDtyFtKnakdF00aH3gbdUzMNgYbiJ/oK2jqH+CmaOUjucI0AGcNSf9
 HBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PbD/qSofe9qS2Crqciyp9o1Gyg/ozYNCw40WhU0Rn+Y=;
 b=RG+ETvNm9WbJ5PXFBKq7HqhhC1GntQSAnjXaLemE199X+gehg4FDZU15fjOsmZwDAX
 EMvfNLdxEU0/k9ZZ/5OW1UqqiaHlapPSCv/pEbT8aeEuXyHg5pEi8RtNfF8ewQhh924k
 ocQOPDd4dAnn62/IzK2W4byWO4JY7oyoUVh9VlrOZu/b5oOHZNonj3sXN1fxafFC04f5
 JIrQlBO9k3LDM31VkKYVan0kTU9AxQWgAFEVZMSk34yLpy8XY7ECgmgvu0mkGn0ehP2C
 77B/SZi1x3D16PKQuysqWObT6TreD42F0e/5JJrxXmJdcc2u0ctNx5ECRe59D+hPUKcR
 +GwQ==
X-Gm-Message-State: APjAAAVOoAhZGb+BvSMN/yr+oIplG/Lj/otNHglZyhlz6HIHbLf5yf4m
 pgO0EJkxwGfK8KwqnCgitzvRKz7sYFg=
X-Received: by 2002:a25:770b:: with SMTP id s11mr10337635ybc.373.1570801822605; 
 Fri, 11 Oct 2019 06:50:22 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
Date: Fri, 11 Oct 2019 09:47:37 -0400
Message-Id: <20191011134744.2477-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kVLICiEiR8l9

This data access was forgotten in the previous patch.

Fixes: 3a471103ac1823ba
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4e049bb4aa..49817b96ae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1766,7 +1766,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = cpu_reg(s, rt);
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.17.1

