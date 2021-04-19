Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1506629lfb;
        Mon, 19 Apr 2021 14:00:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOiH42MX2NTr8JBJaFD9dajklX5MBHkDPY6cN55N8khXvu60k4u4rWSR8gEYRxfdMJG14K
X-Received: by 2002:a05:6602:179e:: with SMTP id y30mr16322133iox.130.1618866041840;
        Mon, 19 Apr 2021 14:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866041; cv=none;
        d=google.com; s=arc-20160816;
        b=q/saYNtq3j0863yrLb7i0MyYSepqHwY0jUj6f5E86wYs4CeM3C73VABnh1J8KgzjUT
         B7aXWfJ5rRvnF/Y1iK4ufnDOInMoUXrYPKx9XbIVqh274+Xup+NnLcCmOrjvp+8dKsbJ
         gD1ds/Bw1djOs6azJuOw2qUCdCX5E8x44HWqX0JejALLcMi7OhVBV7pwxUf4sUqkakKC
         Q7Vh7EewaauGZ5y64JbUhyPpuiL1rXPf7mljUOGuqpfLqqjwcYRhE9cd/0uCyA4Su495
         2ODFHqJpQIX1MqSng4cludIVU95pq9DlFw+maFyh27ZYuXhOejDUq/FpoJhJTRJunH/k
         LJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
        b=toVjH3CmjQ9tjwPow/kASZMfFb6XBkhwcg6Py8iSZoQcIpEDlDObeIGy8tZQV16soa
         iBEwJTasw83iZe/wgAzJ2tEkAWvWY+wBTMr+luZk0ACxeesmFhYklM1Cta3hsi7KZ0lA
         k0Nys/WimoCixRqrRyoO3fQ7c/2SAEekaeHD9LWwLGTolDDefzYH7pJ5dDdJNrUJmEbX
         tucq2vzGfgyaMsRDQtR8pcF3v7RlVd+QLxL5d12TSJF3DI2X6w4zGlkirS5h+bREQVof
         VjZm1c28SWxCh8EwylwssQGJPfAu8m/Co7i1vcupvprP9U6EO3/TNTT3ulBPgJ1krzQ2
         OjEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XDUsdbSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si8970725iow.89.2021.04.19.14.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 14:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XDUsdbSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYb0Z-0005lw-QW
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 17:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR3-0008BK-Qh
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:57 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR2-0002qt-7R
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:57 -0400
Received: by mail-qt1-x835.google.com with SMTP id d6so8845552qtx.13
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=XDUsdbSak/GS0x2v6QYq6AGcprdt8d0R7yZZ+Quly9i+bySRPxbZFp5A8/CZYmkjyL
 s/UEfmjYZ5VusqiFoKalcYXbBXSs2I1xzzenZCjSXk3xVm3QnPVXH1M303d7uo/qs9gZ
 RRrOHsik9zOeVskI64YaYu18eU7mjwQJP0e/H07qCu/VcdqBd/5VQ4oBfNbOYzb2gttI
 uCYrGSoeveaGekiWES0v3YnP1MiIKbKo1bRG7bhwDyuTHBa+SUtgGsyWCs4K2nDAywO4
 E2U5jneDWeWZ5M8guEhuyGYjGzti7DXsqQHPn+ZQHFCSP7CV8fPdXTlLYYn/LMkqry3Z
 1nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=PVqCBQMW/6/4zHJ2VsqcnpfqANSFVb1uxZjI2Mb+JzikEG+wtUL00gStkmJQNy2wXc
 B4lza4QbLsen3CVaMdFK86L2yjMl6oBIYaT/JHKzdKgXZMitXOfOxzkfBAI2hlVE+VEl
 Nh/3cTGhBaqdPYn7aFrEwOL4K2cxespy9PhTjafGeAm1hPggHOB2BSMvRsQ9JkYyNFVl
 gmAWN3PsEgcGSpglQqXwFVuRwSvPlIBQNhKN1UBdiVqujF/LSaBzTCzk+c4bR4IUiFLK
 B0BfKDDG9XdLxOHPLQGpbjfDMI9iwCiRtMGaEM69Njo04Na6rCzbGhpEOQa00L4o642P
 3QLQ==
X-Gm-Message-State: AOAM531q6ObbKDMS8SFmiQDLzoHRhLmHmfE6iYfDuXVQKS0N0H4iXdsH
 mX7vWip/4d/9CeYOBmR4fa+GdA==
X-Received: by 2002:a05:622a:100f:: with SMTP id
 d15mr13862247qte.2.1618863835257; 
 Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/31] target/arm: Enforce alignment for sve LD1R
Date: Mon, 19 Apr 2021 13:22:57 -0700
Message-Id: <20210419202257.161730-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xv3iE4ErkkTK

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 584c4d047c..864ed669c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5001,7 +5001,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1

