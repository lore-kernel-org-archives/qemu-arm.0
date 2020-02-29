Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1317285lfg;
        Fri, 28 Feb 2020 17:28:30 -0800 (PST)
X-Received: by 2002:aa7:80d1:: with SMTP id a17mr7170555pfn.143.1582939710530;
        Fri, 28 Feb 2020 17:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939710; cv=none;
        d=google.com; s=arc-20160816;
        b=T/QVfe4ClIK6QJX37vHMF9WOdu+7sgztpDc4RgHfkQ7eGp+Pq/7v8LJv+bsnYA7zaR
         h1Kaad2AVJ/Quo1jiJlBo3TZ+zbdc7XLIMamnRijjxdS9fKrkMIKR9xcv6XEVGI6GfJd
         c+Hhoqt9eZ35MrQ3Ce6HDkQkTmPCQvHdIRfw7se9JTW0lnlG7Z9BC34ePae8JNc+S+Do
         6KRV2ZOLUzyJ7UUGt1ucNkiOwYOi08Kdu1Wlw0n06SOSbJaA5rPe/EQOVAdoIhkBmAQJ
         tMe2lsRpgi+N8d3UxOMwxFLQ8rf2nvA52hSUanHiIfuUnIwPjzNBb9gOpkDKfChMpJDQ
         5jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=46JVchtXjykCWqulQO2w6tf7omk6UGW3sCrnOh12e0E=;
        b=qTELeyAkYLbH3V81HjaR133Qn47j2FC/EtdOAfYaZfwpZYT3dTkM1CLa91rqb84hGx
         aTONI8bg0MqI/03CuvysQg8UGX2vGwCsy4AbH3DAYH4aje4jZhdyXvwCrHefc0oNAt26
         eRcVZBIGQG2o1jutpR1Tp9dr66AylC21ApIin36qo6fiwPX3zbcOFeVzxg7w4CQOxqaw
         xjF5zYeZHbXAgBEdbIZL86qTMJQfgQODPAJrKM6a4G/85tAAqdwBvrOQQR6PETim1XpX
         q+65GdDXXUReqDlZHCreC3+HesMYTJLNjXGpYbPh8maEIAZdQPF5ehbvzHVlma6U18x5
         eZZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BoymvsOD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x71sor5079226pgd.7.2020.02.28.17.28.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Feb 2020 17:28:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BoymvsOD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=46JVchtXjykCWqulQO2w6tf7omk6UGW3sCrnOh12e0E=;
        b=BoymvsOD3qbq0L3fy/L2uRDzKeSoq5LrhJya1oN22KEaREmQ1/Itn49gglufn9laO6
         B+7CWTE4z5NUgz/+Zwb9y+0TQt0FY4fGlfiqzqwR1gWu+qfWyiSb/MAoBJ35RHBSiiAY
         kkyp2k2o2bmAgM+9w9xtPZ/TsgM2EFXD+UifSuiV0YcOaYaC5e6YM0O08Q9KaMUBjkb8
         SdSJq80tD6c69j5yFYcChUv0Jtg+6EZq/T1MH9KHl84HB0GnIpQLPjzE62JIhKHpXPrY
         nfl6r6eff3L5iPG5dPoTTI4cFT9LDAWmyByvILK1qPGhpKwdCUluy8C9sgR9viHGirrv
         Cqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=46JVchtXjykCWqulQO2w6tf7omk6UGW3sCrnOh12e0E=;
        b=JK5ps5U7nb3GPB+GVmI1UM2nHYZ/bbT1QEg6bgoOXmr6FxGJn4Z1l8JDMytOT/gszF
         FQzkmiNPwKHw6/6bdXdeVbN/XT6Kvu/19eB78i9i0gI+1nJJEQx+LHJk/963E2f3muUY
         yDTglqFLu+8bTfbdaToT9gLRHgJVAXMD2v0gJOsBMc9UoJASFTJ+TGD1ZD5M9JJQGc2J
         8ylM9c9ERwSQuysE1yAAx5praBWKTsDSXBHyYa2ofP4BJyBMKBo1WdaeCs1j6XzdKExj
         pvx9HDRWXHvwoliQrsQdpxek0jCJwwFgvSrA+smg2FBvHwOSNv3lRW4l3uHGiDE9aPZY
         wsuA==
X-Gm-Message-State: APjAAAWLv9CfdOI5ajCyR7zdtN2EV3759dr4zLgWTzyA9J3Ucen1kyY7
	2Y54n+FaGldsCWedyMhwzutc9UsN
X-Google-Smtp-Source: APXvYqxNbk7QHZqLzA8PZ56XbX3nena+9Mj48dMaZcAqkXlzrVGevQISRvkBk8WRXR6CM+r5LncGnQ==
X-Received: by 2002:a63:4a47:: with SMTP id j7mr7310472pgl.196.1582939710052;
        Fri, 28 Feb 2020 17:28:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 17:28:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 12/12] tests/tcg/aarch64: Add newline in pauth-1 printf
Date: Fri, 28 Feb 2020 17:28:11 -0800
Message-Id: <20200229012811.24129-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rKrMnc9iCKFx

Make the output just a bit prettier when running by hand.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pauth-1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/pauth-1.c b/tests/tcg/aarch64/pauth-1.c
index ea0984ea82..d3878cbeb6 100644
--- a/tests/tcg/aarch64/pauth-1.c
+++ b/tests/tcg/aarch64/pauth-1.c
@@ -29,7 +29,7 @@ int main()
     }
 
     perc = (float) count / (float) (TESTS * 2);
-    printf("Ptr Check: %0.2f%%", perc * 100.0);
+    printf("Ptr Check: %0.2f%%\n", perc * 100.0);
     assert(perc > 0.95);
     return 0;
 }
-- 
2.20.1
