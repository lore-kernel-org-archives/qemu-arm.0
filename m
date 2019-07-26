Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206827wrv;
        Fri, 26 Jul 2019 10:50:45 -0700 (PDT)
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr43754695pll.310.1564163445329;
        Fri, 26 Jul 2019 10:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163445; cv=none;
        d=google.com; s=arc-20160816;
        b=TCVS6tcLcO5emExbcdWSzKmJO9kqdeVpXyb8ILNH6XH49Xi/cLeOl76WR8j0N90niI
         o+Ohpco+M3u3xBlPpASNFVvlEBd+zBcND2w71QYGRlSh/KGM7cT3nDe1OMOZhFgtlggt
         PiWZARo2VInKVchFQKHnuCjOBK/OR4HReaODjpBTlzcKazoARpmcssWh7eetuP72LPhx
         dwasPdSnXLokWocp7nSqylmSnNyqDrH86Btt39Z+l7pe0phPOnzO1D1tgfpjVhXpJyJo
         4I2hGoTGZMKMbrIgmuBYEL1kdwgtJYBzt+HgT7ebr3HQmI9cT8WwH1TYF4UFUD7E8tfe
         ffpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Za01uaUS+E1JffTVMwXCPiCzGTAwavbcztjEMPVjIIo=;
        b=lQqiY0BzMPIQSHvoEGjmP4vMXcjTn5PzrvPyTW49hXwZSN6tL2DHqvHOHVaUKxfh9l
         jzb4DtgCH7goShUPNrUGwLOTtpshcchvGVLXqPdvvjcBmPVY0kuMN+E4jvP7r8ZAweU+
         XiOR3cI9Qsqc/O1obS8Ul4PWAWdf8XN4Hpm/2hXqELPc+w3q9EnqECqfcvvZQe8wuVGu
         BbvLbRQGjY2dIKggonA75t8H0N/4QK16YqrXN8N87hGwDoPeoix7g0WME5MSRWhYQwCT
         oEx/A0P+hWFlLIxwvCYEi9MTTNxWMPUP4rlUSAldrgPAOgGUd12NKWLeOjmISAvgZ3kE
         J32w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTQ12VGS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r140sor24268729pgr.22.2019.07.26.10.50.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTQ12VGS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Za01uaUS+E1JffTVMwXCPiCzGTAwavbcztjEMPVjIIo=;
        b=HTQ12VGSu11D/hpOGCcoiE8mxbiVZ3ioQ3SLZdSbQEZH39gCfmq0Mh5LPP8IieKPXp
         0isbaob2Qo4YwKI6fZVEtrdoD8ztCbcZGEtg8pMg/d4o18VvoF8xfao3HEFjMbdVYf9Q
         mfy4XWlk/VlSJQbiP1T8QlHLUbK/1k5ORD96UxIbYWkz9qg6PnvZ89eFsHrBSwzSLmFg
         g3xkzZf86Ctk+l9grsBxtF4joI1GtQ2uqIOUrOVYdrbtgh4Ud1hhsGvZ0ABp3OOCuPuG
         hazMVjv5wzqDF+g6/aPVeebrWcoJLlw5BdXdigpaO07muKqZG7XRnfc0Pfv9OJwQ8u7k
         fHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Za01uaUS+E1JffTVMwXCPiCzGTAwavbcztjEMPVjIIo=;
        b=qCBMOWfjePQxdapsTuuM95go5fkwXunHZ27SMypaR+Q+/Yae1EiaTIwpVYtJwd8gtk
         XdT4i1eq/XloqAoRD+j0/b/KWkB/ch+ZT/M0nI3PtoOtu6pIdSJpf8LeL6DhVmDs3vAz
         vYGwRiw7GlSOynTl1o7dRRiEFzoj+X45jw4Vl0h9YIyHcn45Z4JlAJSxyMOpCrNR134w
         +c0pVlnWIQZ3Y8CLzSffKI/UiCJGEAS00A+vwi4Md/upw1/tCx+w1MP3iAdG2DkCgu80
         x4LyqeScCYfozHuj7fXHsFoF9uQhuHF3DDif/ZDgv3bEb+yjs1F1vBz/9qARVFq5xwWo
         t9rg==
X-Gm-Message-State: APjAAAVrZEOJpQhgrEIrNzEGqOfDslcxzBklYgISeknLTqfq+KPQp4e2
	sibY+hG512vV0W3jTpkopHs5SJ2c
X-Google-Smtp-Source: APXvYqwBWcHYIwS/IdbUWVqFtATsgzmUsVfYjdZWMUAXDkCDDdDlgl6R6/jLMKRS8nmuubRpdnRF6A==
X-Received: by 2002:a63:b904:: with SMTP id z4mr90747529pge.388.1564163444774;
        Fri, 26 Jul 2019 10:50:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 09/67] target/arm: Fold a pc load into load_reg
Date: Fri, 26 Jul 2019 10:49:34 -0700
Message-Id: <20190726175032.6769-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 4bW6LNlDhvE6

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e316eeb312..53c46fcdc4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9161,11 +9161,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             }
                         } else {
                             /* store */
-                            if (i == 15) {
-                                /* special case: r15 = PC + 8 */
-                                tmp = tcg_temp_new_i32();
-                                tcg_gen_movi_i32(tmp, s->pc_read);
-                            } else if (user) {
+                            if (user && i != 15) {
                                 tmp = tcg_temp_new_i32();
                                 tmp2 = tcg_const_i32(i);
                                 gen_helper_get_user_reg(tmp, cpu_env, tmp2);
-- 
2.17.1
