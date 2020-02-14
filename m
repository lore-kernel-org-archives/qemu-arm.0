Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2312060lfp;
        Fri, 14 Feb 2020 11:50:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6otr4wSg1IP6QMcrKk+SWE6vdn9DS/XfWIcDtgu9w51B8D7qWCqL9ZhoaJLYB6WH3H6Lp
X-Received: by 2002:ac8:51d0:: with SMTP id d16mr3984796qtn.170.1581709859118;
        Fri, 14 Feb 2020 11:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709859; cv=none;
        d=google.com; s=arc-20160816;
        b=o6YGZacpvE9+GM5Mkxk82/ngu8QkrMV8c2bH5FL9v7VnmD9FgezFjZ1+vevhrecaLm
         QdS8GyMijpQg/iBdExUyxiSDm59RZLCEXRrBPNI90XwKJ2dmj4Hvyx+7D1OOfAFYE7H5
         yOCE4Hlwhs4R5y+HXnqwLEEmYBGSgUBqggmAR8V7NpWcbiHnD4KsJjjXEvm/HCMVbNQW
         kcYBklH1i8Jv8BZzOjF6j1OKl2ZpHVDha77VIxmgRmNMQZ2q7qKaZHARF6h3/G6SC6Bn
         yhqPLeK3az6/xpdE+5h/uYp8OXaSUlojdNKhe+Ex6rB01oQkt638fCRznQhfw63yHkre
         zvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i9ICx5m4aSdGj4L1nDxzhVPY7OzLfpXf253QffS8JKA=;
        b=o/CkSXlAaDdbsLJ6V9LgbX1z7wxvf6R8pt8AQum27UMMUTgEecjv+jvEzXddhHf5tz
         hD+mfXhqg3Z3STkYXqucsdgumEouzXwXvD4ZXlsjYdyNAj81XEeG1Z6kENgwaAQMTTBK
         VriLqSDL2MTKfC66+cV8cbBNnlP8ivzovL7cNtsWnPvDzejOm2KttzyYkpJv6BAaAI5j
         Wgj1tDKFLNU80zUGRCiWCKxNQlOpxWKyEmLrlMHX5jxzeM8B6kJ4/R8hckVq8S4pGZs2
         UeI35tg27ryRvs55OtCSxtUJRjvlRMDYx3Dr5xfwc21buScWlfVHcBetqG2KPlhdMeQ6
         5DMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8LGnh84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si2832981qvn.162.2020.02.14.11.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8LGnh84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gzK-0008RS-Kc
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvM-00036x-Kf
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvL-0003ic-LQ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:52 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2gvL-0003g4-FF
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:51 -0500
Received: by mail-pf1-x444.google.com with SMTP id 2so5348551pfg.12
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9ICx5m4aSdGj4L1nDxzhVPY7OzLfpXf253QffS8JKA=;
 b=K8LGnh84Nrrd3nE298GCfMR7/6BL24/VIp8w9aPH9mR54ArbMql3BGbqShY8hNjdCY
 ZwPold/9ESpz9ACocA8pwtBe/+DpQ0R2iDc3yLlBidS+++0WNM/NUW+UFW+7xuvtp+4I
 rYt2gCDOkLgr7oB/gni0wkskQBbIVuqI01OvnKPehAOAEnKjZiNv9PzDqNdwjWMh7eML
 Sv/vsO8RucydO1QXf7WDY6mQXXAZxLriZT0aSqf63vUdIIlUaW5YsevK+KRKGB+ACvvN
 yl2SwHtChrEi2iltQzi/HaPQ10bAApuK9fVFHIugVPDjMKDSyRsF6S08GacRkfQyo7jE
 BdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9ICx5m4aSdGj4L1nDxzhVPY7OzLfpXf253QffS8JKA=;
 b=PGQy1HxiSfLj2Z3gfFirnjCVnMXh6B7YWDgD+ytXWD1AUvZA4y/Inyi+osfV9ew+UO
 NV9UoriWhLw2hly2O20L/Jg+7LZyjvbo466V+mkzmK9W/SagvM0t+aiQzaBGBTMCLLcf
 V3BHcaKavQOsuEL4fVJRgrIRhgZ3b8R4mOxEWgIns2MY6pVcWpkd9zHD5exEeBn2VdEN
 m3EpnkwjfmDjCqb76QYSu8qojHoLpkcD4mlSk2fXdLo0pHyUARzxmt/eALx3uLbBzmUc
 gfvnsgn2ZUpHaxJTUKkqqCRl1LSShXDhDYjK47Rvsxk/q9oEdvPHj16ecOacO3Su2g8U
 3DxA==
X-Gm-Message-State: APjAAAWtE1S3gBdek5pgY24t2RVc15r8SFpoRu6xXmCBS4GEqSKbiAl3
 HVJ+7Vz4Qzw/8GjTCvcEXUUMQ0ztDzg=
X-Received: by 2002:a63:b047:: with SMTP id z7mr5172631pgo.431.1581709610587; 
 Fri, 14 Feb 2020 11:46:50 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g13sm7558851pfo.169.2020.02.14.11.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:46:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Flush high bits of sve register after AdvSIMD
 INS
Date: Fri, 14 Feb 2020 11:46:43 -0800
Message-Id: <20200214194643.23317-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214194643.23317-1-richard.henderson@linaro.org>
References: <20200214194643.23317-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-TUID: 4KEXdyG7gm5+

Writes to AdvSIMD registers flush the bits above 128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b83d09dbcd..bd68588a71 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7412,6 +7412,9 @@ static void handle_simd_inse(DisasContext *s, int rd, int rn,
     write_vec_element(s, tmp, rd, dst_index, size);
 
     tcg_temp_free_i64(tmp);
+
+    /* INS is considered a 128-bit write for SVE. */
+    clear_vec_high(s, true, rd);
 }
 
 
@@ -7441,6 +7444,9 @@ static void handle_simd_insg(DisasContext *s, int rd, int rn, int imm5)
 
     idx = extract32(imm5, 1 + size, 4 - size);
     write_vec_element(s, cpu_reg(s, rn), rd, idx, size);
+
+    /* INS is considered a 128-bit write for SVE. */
+    clear_vec_high(s, true, rd);
 }
 
 /*
-- 
2.20.1

