Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201202wrv;
        Sat, 3 Aug 2019 11:48:41 -0700 (PDT)
X-Received: by 2002:a62:1c5:: with SMTP id 188mr63183139pfb.26.1564858120868;
        Sat, 03 Aug 2019 11:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858120; cv=none;
        d=google.com; s=arc-20160816;
        b=j6qEubkg6ZTaw2xyh+T+GRE9veGmYOKoJfDW8qFg0tewSCQ6SmkzgDmzlIIY2BmBA/
         CJdVoJEP8IKo0QUC1vKVqXBMDktnPjeX4JaJb5bwN4lWCu4y+orvnGzD+Rcif0+oFzir
         6OnMzBfGVmvAkTPolrv8chRvqow/1KlR6RW7Bu/40CIg0+yELZlbjSDfcX+OTYk3I61u
         dwBvqxiUOCv84FdOyLd7rBD/2FvtuxPfyHfPsoQYLK2mNDf2KCNMJ6bvvLVkmRX/zk9Z
         ZUnQbmeSNeeHIqzKKevlyXBKz+lmWgDDIeQqcaBXaC1qp1DLCCozg+uP5EUg7fQNBJeV
         yraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=Jtguv/14nM5Q5SltLAXvUYA4ixsmT3+yOiZ9oFywWpI419PPiA/If2a+6ATkRjE1s4
         n7C4lZI+sGafYs+30PwNTw/VgVSy6X8jDTiao71ndI6Gqwmtc/dionFNm5Mpr6vwh73n
         6HdeEVnEwG9ywucltCvM2rjeEqVH+F34DVMcIPePGz7B37oSTLi5GF3z6akg3jCk1GEI
         M/M5liR2srHHeOFCfLZ6OK0qEMKHAe8oX0Ds/ZzAbccQrvaARi9DIS+0wAGfbRXiAOvt
         zwewHnReBiB1+XZqDBkuwEN2JhmO6jDdZYbTY7+2UuLPoNm9et7oLF8U086ZDjm9Fcum
         IFqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWKl0+P7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a9sor14693510pjw.26.2019.08.03.11.48.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWKl0+P7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=QWKl0+P7ZCOzrJrGAAa335JojcAeKlcVoNs1cAydwjDyaxukqGtQnw6FMo6klTTsSr
         V8JrdKdrddDhr1/jqvOmEUZOrm/NCNmkWtc8YEsvczoU0dOKyATP6Pzc1B01JyNL34dN
         J3mwHRjHZGob/MtP/AJsmyZpX9MFb2OXxjLYg7rPRwIJkEK2p9CpM/ojJYbxjJNjJvej
         YEwlX7vtKw5QXwXU+l7G6J7yC5ppYyeCTRz+COZRCf9UjW6lf2K0c3AeYlyNvlA6a16X
         /lHkMqyLXBtduo9etkcuJU4JK7ICQiik7TISJxmCSAZlFZDX6l65LIBrGBUCRbwafi81
         337g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=Jxooml3gMX6OYiBfrQoepcarU14JJf6LUu8bMKsn8r6bkPE4/sYXnp0Ult/WwhJsfU
         4mnIwNQtZtjdGLG/3q+Bh1Z4tpG6gZUrVE1N7+cjZcRwbYw7UpFtjCCodhp6FcReBVrH
         n56HrZJkeGGxrlUAURKDO40hD8zjhMiDyfBqcyx3d/DwwqXAqLenkcOwYgTzebNA2bk6
         VdBb2o6xr6QMQkkin/OzhI1qWj0FSLXfwNk7+Q/2tFrRTPc7/TXwQgMltPcsG/P1PRUX
         bPJfDYhqB2AG16WpCOKE0yfESg35I8GZblY9TbxU5ozojDH46Zv9lJc00Jpv7ePl3/Sb
         qwaw==
X-Gm-Message-State: APjAAAXawPKYo9UeV84gY4MB1tSZIMcLMo4iQBt1Kb7vjes7VPGoofJz
	dTepihpM0uk1FiJod2JzcIL/3JB7
X-Google-Smtp-Source: APXvYqyw43hH5g5+9yj8il4fBZ/JqVWEEe+LCjQgr0W4w2DChR3Y+K97beq7ZV93AlZ4kzUNQG17aw==
X-Received: by 2002:a17:90a:2525:: with SMTP id j34mr10667580pje.11.1564858120445;
        Sat, 03 Aug 2019 11:48:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 32/34] target/arm: Enable ARMv8.1-VHE in -cpu max
Date: Sat,  3 Aug 2019 11:47:58 -0700
Message-Id: <20190803184800.8221-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: P0h2hpL36siQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1901997a06..b1bb394c6d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -337,6 +337,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.17.1
