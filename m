Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287907lfk;
        Wed, 9 Feb 2022 20:05:09 -0800 (PST)
X-Received: by 2002:a05:6a00:b4a:: with SMTP id p10mr5703166pfo.14.1644465909497;
        Wed, 09 Feb 2022 20:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465909; cv=none;
        d=google.com; s=arc-20160816;
        b=04AZZj6wGdIamAlib4RLQv/GgcgWNpkb7w1izJYrXFyMz/rlW2fkJ002+YKWf0tToA
         KaO+KUN70WowPtMjGX5sIU8LxmV0jnXYI37BCBJ34v3fwRmXJkdbIq14+7BHUuPm+IkG
         E8dh0kw5OgBd8mU6Pcu8fTWrmypOzQZJQiqDbq65L+Tucecv9xyWzCimRgEbbd1DtMsW
         2X1hTbbzz0QIYbJRPE21xHhdd2StJF59cDuu0/d1L5ANYXE8Ctqmiy8QvH4CB3Z+EW84
         TWZJImgy1IL0bg4S6HyjbIPzyPzKOUSfVZXxHyvNWhGOaJn5onTJS3Xj4YDoqekeiGnP
         PfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ySk6DI87bH3eZGMitydYEQW5NydufZmFbEicSz0knRM=;
        b=YWfe695FawN2R1l2fejbn7s2MXTxEuc3YdCgnUhPW+RO3qeO8KPyG/d/3RwCNpdD8X
         KQGHnffIPWvwYRe3u0vA7q3bzkDASHCxQOpyrJZ5lMYkGMIlCmVFB4+p3p+rPhErIrnG
         GjQV1o8uiaO6jPTxFP1Wu/jNAjxMWS1LY97+fkw67GunyKt6fUxL8sUotENWUZJkMckO
         FCTP4Pn00OYmqTE9/NT3cs7SKC1C1lFouoovYgQb8TxwULdZKmredNPlqRcxfiYt7Z2P
         O70U9TxPLSdSXPYVoWhFgaQLGTJj32OYoAEBnni7Qw0svjqCClD2c41AuC6cdKEBr2IC
         0Rsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dpyNdJ/F";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f65sor9145723pgc.84.2022.02.09.20.05.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dpyNdJ/F";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ySk6DI87bH3eZGMitydYEQW5NydufZmFbEicSz0knRM=;
        b=dpyNdJ/FKi6Zmei/B8RXxNVHE0F3dnzClNKC/Chn7jfsgSbMp3Z3ZHnZzZhJi6TYeU
         Y4qToCWUSvQpHzFZVHK/yPcNTMajdFG80e0m8eYIg8Vldv/tZrVXdvjhYGoPpyxSVw3w
         PBSgLGUdJjLsOfADwOPKNzXFuoNOSbVihRAfWsKGoKTzlIUDl1JQ4BOD3/pi4Eqr62HB
         tAoFBAcWnn3nG1W32czzvmMVzyTz9OFd41t2Chl6k5tWichkJmpJdiI8BzftUMpzdNW7
         qz49lRXNYlCdYFZ6x9CcYFG71NNNp5VuMLaUwB0Dm6ieIYqfwhWuMsht6FvFha4mygMA
         Qetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ySk6DI87bH3eZGMitydYEQW5NydufZmFbEicSz0knRM=;
        b=m6kjClQ3QCo03HXlQju6fAIJB78N/e0k5WsxYNAAwfxRvzOqkwwXomvBUn5FeSOrlb
         5+cbaeyz6q59fG4BI5LAbe5IavGesF8eO+xJn5yxU/ARpfH2y7huVOFO2gZNw83/AWSM
         cB8JZvYJ839iNxzfQQJfSsbukuPLyBq4TkHklIamlMDjBbgTthWd0PApFXF9JPfyAPw2
         7qPnhydGbvoyWTmwPB9Og8tbxpxgmdqI0fLnD6h1lxuEduPhK5F+0p+SGfdliv8ypmub
         18AaYOWLTms2w4XYgTqHDVYSzMpn04ea2fl3lLfz3fbfrh9oMMBEyeKCVhAzin7Y29HJ
         SJ5g==
X-Gm-Message-State: AOAM531ReLLE9eMT6Uh3XnKgJe3QJ/v77IyT3VnjNctcG+lS9j3v3Jwn
	b50nM15pj+YoQrk3z/gzj8wT6wJ1
X-Google-Smtp-Source: ABdhPJw8KonN67F+wAYkGlmu4ESxVSktkJM3Mp7G2/79M3cEf5Cm9/v1Ugatsx2uNXDd6S8ol8yx3g==
X-Received: by 2002:a05:6a02:195:: with SMTP id bj21mr4545558pgb.277.1644465908969;
        Wed, 09 Feb 2022 20:05:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:05:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 13/15] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Thu, 10 Feb 2022 15:04:21 +1100
Message-Id: <20220210040423.95120-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Y8E1RSVKC+yA

The shift of the BaseADDR field depends on the translation
granule in use.

Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b1899ceef..e2551e693b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4536,10 +4536,11 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     ret.length = (num + 1) << (exponent + page_shift);
 
     if (regime_has_2_ranges(mmuidx)) {
-        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = sextract64(value, 0, 37);
     } else {
-        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37);
     }
+    ret.base <<= page_shift;
 
     return ret;
 }
-- 
2.25.1
