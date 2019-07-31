Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071527wrv;
        Wed, 31 Jul 2019 13:38:49 -0700 (PDT)
X-Received: by 2002:a17:90a:3590:: with SMTP id r16mr4761566pjb.44.1564605528918;
        Wed, 31 Jul 2019 13:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605528; cv=none;
        d=google.com; s=arc-20160816;
        b=idSGXgLJ2NGiRYF21g0SyDgLl7w0Jn7SYEuNGNkfD9R7dH4+DZ/Cw6gqvFd7bX2yvO
         uwjVJdPtmWqs7XFez1JC8IePdVEL8U+HD5FcIH8Edx6/rSuMk0WP3HRYj0Z2frZtgzI6
         LOL8yoyuMQjc3o75BgpHgDUvzx5qw9CO1zWU7Rsz3UmL1jsTMSdHmSjGlzPEiOhoq6Mq
         fL5LCTunLG0o28on4StgS1N6c+QTXj7NOG7pQ6LJGigIXbiOMn6nC0yt40BGQaCAiAkf
         y/+tjFzKpViN9Hz8F2JY16dNQ+KGOxFnC9H7syfuusYbgVNi1I80sZzqUTXZFr/BGiIb
         0MtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=z5x3XqHQzkXZQb+8jCB+i1sKV2y2i8Y/ULFiYsKcHrY=;
        b=ySSWI1eriqTc5JKafwZ9mL2tJ++4ya81gWmr487sGeZTR+HGtmp+55CR0MRhOsy1Y9
         +JPITAsnZM3RYWv4SN2CUZnYCnuQQ04vj+/Zp54DfiElBJKgwbae5f/AzemuXaHtYZ3P
         vFIKF1mv+cj4eY5wwNoBmf6f5gjhw6WTpH7KY5XF15WJN6vkxqlzty9EbLuZV8kujWrs
         JclzNJpGH0VV26Ino8QUD0/l27GJ7czJb+Xt5JjCz8eLADDOuC//k1uEI7mAR38sUSoj
         3E6Zyfvn4gWFfMmOx5Vpmx7x7ty17tLCkS8JJaMXbBRW7U9cSY44HoGf8cg9Z98NeJJm
         0Dpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unuLZm42;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a9sor3565791pju.9.2019.07.31.13.38.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=unuLZm42;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z5x3XqHQzkXZQb+8jCB+i1sKV2y2i8Y/ULFiYsKcHrY=;
        b=unuLZm42rCfAS60ozJ8safaC8nD5g8e6LVR3KeYDg1q53pmRe0lkVvvNHy+0ERYAcr
         90sHJtzbhPU/PZeOJo6qqDShpBl+p8/30jic2Or34llqjfrj3godzX2M2OjfB1u0V2pY
         oCWfgFcJ6S22TBgXB/aPpe4m7Py+bf18Mi/IJNsteMgY+NveKvhnK2O0IDQlZirmys2B
         qwpYtL+JEumSF9rCTv6wkKAQiG0wPxLWPO3cs9aqw3n6IGlL7dbKdR9UfIQiWbx8T4r3
         p0EnhK8Ws5jBfxeOuzSB/nGPuue8PQzOlti58271GPmD0KdMIuaNsu09sutaU4oa/W6G
         WICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z5x3XqHQzkXZQb+8jCB+i1sKV2y2i8Y/ULFiYsKcHrY=;
        b=hWAYkEqm9Z2g9cOJHlcHTI0IfCRjgm6gNCFgIiPcCu29iK9sgkBPhyKB9Pr3fWjqYt
         dMn0s0yrL/We7MTY92I7Z5HTRe6LTrvMJzxbPzkRCHW0bYWiIhWVYxEBDaFRRzXKeFPR
         shu9N4n/svZAmONcA4Q+4CFL3tADlqAv1tYnleHfmiDmr7RY1bzp2qaPmVsGdDe45rTt
         3uYZRpZhPXruE6z/x2RAt+P9eJbhvjUKO2DU/jwShOJ2gNJj673cjEEPOPSwTOPp0F8w
         FQOXzh1W4601njrcN0PJg93AYRFzUcfAgnN0K05LKhUS6Pyw3rBH7ox1bXZIsW7b/tAA
         bUBQ==
X-Gm-Message-State: APjAAAVknu2UQB/ZkJWT1wRiy38lkQm+B4MmnV2T/GpamhxVicd3v71O
	sUz21YrSWSmz9qRibCTqqAHEnBH1
X-Google-Smtp-Source: APXvYqwKeOX88xREAURGqT8TV39GAj9Y+FheZvGgBkI7coD5tzOSsrTpB1fmstqXKVf5GIFu5q7ZsQ==
X-Received: by 2002:a17:90a:b011:: with SMTP id x17mr4737759pjq.113.1564605528486;
        Wed, 31 Jul 2019 13:38:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 27/32] target/arm: Update arm_phys_excp_target_el for TGE
Date: Wed, 31 Jul 2019 13:38:08 -0700
Message-Id: <20190731203813.30765-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: f601ePT9DvaY

The TGE bit routes all asynchronous exceptions to EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b9f0d387f4..c6b40a12b4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7936,6 +7936,12 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
         break;
     };
 
+    /*
+     * For these purposes, TGE and AMO/IMO/FMO both force the
+     * interrupt to EL2.  Fold TGE into the bit extracted above.
+     */
+    hcr |= (hcr_el2 & HCR_TGE) != 0;
+
     /* Perform a table-lookup for the target EL given the current state */
     target_el = target_el_table[is64][scr][rw][hcr][secure][cur_el];
 
-- 
2.17.1
