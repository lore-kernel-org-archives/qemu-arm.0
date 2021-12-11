Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583390lfk;
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
X-Received: by 2002:a1c:a503:: with SMTP id o3mr26152965wme.98.1639249907828;
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249907; cv=none;
        d=google.com; s=arc-20160816;
        b=vPSIhnrckGdhAhxFLKyLzmpxZyv4u9qowaPGhwZcEukwdBXEw0oilhFZWHEsjFC0r/
         HTCQXqCOVMEgZoq/BaLFFAtHAmo6h5uI65wK98M9mMv8UfgEAox/1supBocjww7znhg+
         t9Vo6YVICpSC8B1SVmbGR1QOrqhhP1UdQqAAnil0v2XTcjIjgrrzIoX0JxZxHd0ywPOt
         VU2l4I7iCF06k4r8PPi/wa73BK3hq12cMfQEiKKhKrwuP/ycaNlDHdX74qeObYd7GhSD
         42OdCsWecAXVNhb2YhRA26u+RlPoQzr3u6rFnK61MbZSQ89lyFjN0o360/c/DTgFZcv/
         qhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+/b7SIR6GyfeO3Rjl24BM+AWJSlXd6uCCkfVTpffz54=;
        b=BXZ/BuxIP/CR+7HPiO4u+fg6JqFE+sVZS6eMPB9R/3sMqRtIaFb47G77SoRKIvPkVS
         BvkXRYItK+GpVl5HwEWVd+SqxPssqsyzL3UpNkY+CTU18ZyWYWlojDfBIOxvMk5CiJhi
         0zy4T8VpGOr0o0DedjJFAWfc5CQASub1B0upDzE3C60HUwc73lEYuLKroFWRuSN2jFwH
         x/F/M67nhfAkgk/C+sGF4uR0RQXRE/nJpP1kEKglM6MZufXJ8KnV+CqvTftbl8KIWbaP
         9R/dtTTGntkxWcn8DpyKaYsnEmand2/4JT0BjEmyVcJinNms7GJcMnmDD9V1aL4XK2lR
         NlRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XV3D5SLF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1sor1039451wmq.12.2021.12.11.11.11.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XV3D5SLF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/b7SIR6GyfeO3Rjl24BM+AWJSlXd6uCCkfVTpffz54=;
        b=XV3D5SLFtPCRovaseJujyrjBxNIEQNROmwdh2PDwaCLfv9yuug8va7qoIUN98c5EMo
         D102IERkyVofJzK2uFFGTniwU2CvI7abBmSJvIdAZGuNw/brbF6zOxZ7DcsCdzSHN7PG
         /yuENdUFDefspKCOO9RRbWYJ9fVRikILLT94NRs5/uAXD/zh6U614W9rCupzJheyETl1
         Q91G5NU7jocEs71q08jUsAodx4Ad4GBqfqgpEwYW79j0ZEWnTX8Kh5AOecV2hubP5TZj
         22lcHxq8q9Q2Ik/N9CwzPGo8ada7tXpepLwvBzt4curvh6G04mwHspGKIHbPhL8/S2vd
         g8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/b7SIR6GyfeO3Rjl24BM+AWJSlXd6uCCkfVTpffz54=;
        b=Rgc8XfJEulxcxcVI/J4JD7UCg162K0xIS/d1uJbwwDca0oChTNG1VSi5mM/ZpikiLK
         9IW5nY1LqJglydm3v7CB9elP/n3ZlNYla4t5sMVzExT8cFgYHaPQwWOfKjGScUmPZGp2
         St4tzftG5aV4o/9ZCFrt+27A4h/z5y9v+bKVVYc0JA0ntxMfkih+ypg7naHDjSO+neyX
         UsJvg1x7FoRewXqRZjmXnKdQPG8XrfF2UuBgezTEr2fktMz9pxyGG7kAIVLO3ha8XXoj
         yQSlp4wxKV0WmsmhT/A0Kiv+vR2sBmzYCrNw1xgID5daD52wJ3sUAoxTG+3pD+9rCUDx
         DeOA==
X-Gm-Message-State: AOAM531HLoBybB6b7ybpVcGnjilqp3yjsC8+GW7VHbBMT180Vg2mSE/Y
	MqIjezyX4KHBmAbmKLx26SUYCT+d
X-Google-Smtp-Source: ABdhPJwC7ZvI3h0UGwfeI8upp3qN3R9Ge3Z3nwr9qFf5ymXftbKNnU1dvgREDXUIjZboDqc5M1jzGg==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr25198845wmi.173.1639249907587;
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 12/26] hw/intc/arm_gicv3_its: Correct comment about CTE RDBase field size
Date: Sat, 11 Dec 2021 19:11:21 +0000
Message-Id: <20211211191135.1764649-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z13+ST8EGKe5

The comment says that in our CTE format the RDBase field is 36 bits;
in fact for us it is only 16 bits, because we use the RDBase format
where it specifies a 16-bit CPU number. The code already uses
RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
to match it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6a3b145f377..14e8ef68e02 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -400,7 +400,7 @@ FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
- * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ * Valid = 1 bit, RDBase = 16 bits
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
 #define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
-- 
2.25.1
