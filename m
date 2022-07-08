Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349084lft;
        Fri, 8 Jul 2022 08:47:20 -0700 (PDT)
X-Received: by 2002:a17:902:6b41:b0:16a:55f6:95ee with SMTP id g1-20020a1709026b4100b0016a55f695eemr4452825plt.156.1657295239763;
        Fri, 08 Jul 2022 08:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295239; cv=none;
        d=google.com; s=arc-20160816;
        b=tk9YPDtBlPaEAAf7NFFYg8/aGft10L/mYE4+UTucd5+C1xDgzR00WH9aHwKiZJ7dkm
         DiInXfJDW3scHGmAQaN264cic59YFon9Fy6PE7JXwo9VIbT/SkfKz9MkVtnrlzCjd8F7
         /kqKxub8q2PigUL/0JkP50FI/Cvi144ECM0+aI0b1OvIYVabUijxiVs2jWu2pFsASP38
         e9R/DWTk1nUhhv00wrhe3rwnvOJVTUYCFLGAQ7A5sOb9NU0+ghalGzunwZyLoutif/tD
         VA3BFF2x7gCMZy77qvQcDbXv3rpuxdQxp/Etb38h30BdlpZcpXm2WUBMIlE4XHlkDnPE
         JzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=opEz47JE2jF71CZWR53DtauRYpdQpOBqzfW1h3P7OCY=;
        b=ETUDq1gZNUxHlxNYfXFATYJdwbK601byIIKD6dTvt9c6fELG403hdHl5KvdenBXd0T
         vKb0rAO2jbEF85iTBSTdMocSnmSsHToH/1vYwLvx80W7FoY7env0lWo3i3NQ4l4v9o6y
         6SQcVD7ZUjb2nIGF6qc4IQjIVbdp86ZqsEZRCoAM3Bjxz8wsxKbT4A/NP9/yRvt82I86
         emRawbFwtB+1T77PytI4NQN0rcnD8BptqW053PXtClUVHDWwBJ5Ntq80QXFVNC2kgZU6
         qOpT+vhM4mqN5p7WeT8Tv/xSYbXG0pHKXnFpWPNpaaJ1lxPkr8nWtEKYEskZ+mx0Chig
         kWHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzmrF8gV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e18-20020a170902ef5200b0016b914931c2sor13198295plx.57.2022.07.08.08.47.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzmrF8gV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=opEz47JE2jF71CZWR53DtauRYpdQpOBqzfW1h3P7OCY=;
        b=uzmrF8gVa/Q/F0vYfgs0h1pR8CtiCJAtSDfJEFH9PcSvREy69QAgJycgleaiZUzlmn
         7tvhoPKKVRA7LxK/BtnhlUyPcfRougztvfCgRNV/wVaYAYVxS4j4ybQlQDE4V1fdlLs6
         M5okr4wH0dJv8g15Zv0GQtIbTL91AcguCF51he06vNRVIS6jkJPHZLQnlJqQXhR3gukz
         J/hKH267tbhqnNeoHNzq4YhPGxVkch0Vyxh+2lQ4gEAZTVReVsiTCQ77Keyu6yc1KS5r
         lTKb9ic3dea3UO6WHYQcz7MviMKbsRVd3o+4VHyXCsp8c0bUmzJJtT9cTIftuYzOK/mA
         lmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=opEz47JE2jF71CZWR53DtauRYpdQpOBqzfW1h3P7OCY=;
        b=Cibk7VExpXCIPenUvY9fFfkaeatapFx0GpHoF203tLCdXOYB7/2AZWsBBIvrpuc+u0
         EOZch1MiKq4o69k4AEjfWMnFAHk5MrQKF6lOU9unWzz5A1/E5zfxgJancwDuoDNSUPv2
         XxZd4R8Rtkoe8yQwGL94NiQvSOc+oKcvGQgGgrzlxIl78EVj6132/h5ORvWbV2UjWgvd
         R3f29wLfXI9vDYJ+n0mOX3+cBJZ+z8NT16VeV8uTZJqgNmxw8w7C1pDK86gYj+1G7INP
         dhrTC92iVsEkbPq4eFWsQx9ax/Ar19Si1rGngBV42IS9G8ndk2l8S+X4rDMs6ANozks8
         mFUA==
X-Gm-Message-State: AJIora8UOWFiO6XTPEspozWCwgZq8CTYpDhE2UnDuQ36TR0t/sLMg7hk
	NlcK/EwPfXvStFwlH1vF4vvuOuvQ30MSmhAgo/A=
X-Google-Smtp-Source: AGRyM1vV9H43Wc+MsbTyEjIUDQ0dGoUzCl2Us9KOYlegG+fc641Y0A76lgFrF4PhvYMT0stkbL/Luw==
X-Received: by 2002:a17:902:ea09:b0:16b:a264:381f with SMTP id s9-20020a170902ea0900b0016ba264381fmr4256745plg.150.1657295239294;
        Fri, 08 Jul 2022 08:47:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 04/29] Adjust tracefile open for write
Date: Fri,  8 Jul 2022 21:16:35 +0530
Message-Id: <20220708154700.18682-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tzcab/mrqiAG

Truncate the new output file.  Rely on umask to remove
group+other file permissions, if desired.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risu.c b/risu.c
index 2f6a677..819b786 100644
--- a/risu.c
+++ b/risu.c
@@ -368,7 +368,7 @@ int main(int argc, char **argv)
             comm_fd = ismaster ? STDOUT_FILENO : STDIN_FILENO;
         } else {
             if (ismaster) {
-                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT | O_TRUNC, 0666);
             } else {
                 comm_fd = open(trace_fn, O_RDONLY);
             }
-- 
2.34.1
