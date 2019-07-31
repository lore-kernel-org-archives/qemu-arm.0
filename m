Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071199wrv;
        Wed, 31 Jul 2019 13:38:23 -0700 (PDT)
X-Received: by 2002:a63:4185:: with SMTP id o127mr4496424pga.82.1564605503213;
        Wed, 31 Jul 2019 13:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605503; cv=none;
        d=google.com; s=arc-20160816;
        b=RvE0nmJqnbJI+Oz24x0lBHzVmyNY9KwS8EZRqp3HVs6CyHhEJQG2LXPYfUYCpSxFVO
         3XxWZQKxsVs/8/nGi6lyEFlAh70PfWb/SJI3U9P3UhrHcjv4xeG/WS0clCtusKzlAQZo
         +MOHgLPrQZfcqMxiCUCImNkPGywLGZ4g//7QmXL/s5jX+gUFWdPIObAfq/QXeiAFd6yH
         8lF0tIUD2lFQ+Td55cEDMIypTVd7ZbFgFHRkFpl8GW/wat0C2a1/QBcQEBMAmeK4sPs3
         3E9tfZaL2m4Ln8hkTFhrlG664wqae5/24qhhNCq/9womn5BQ3VrlJJhv8i7UhnpM/ITZ
         QG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=0Fs2QQ+uoJbN7ddJ/giArL8ohiWbP8KpOhL72vT5SnS7hcyLHxK764wpNVeEN9rdWI
         2fYq0BIFao+5RxL5DGaXw5gw6eqhnSPW0qG0KN5T/FGYj4tLeAZ/MB+houI3xy3Yecto
         480+kswYxij6Mfk9yUtybSkOr++3lTbxnGYAEK1JECOPnmJkgxzNbdi7syXWDbyeiIWl
         GeFuXNnqespLzCa4fI9AjifB6bSp5DstwFOtnLY+5tIpaox0OfGarY9UMjupCwsJM5xv
         YPH0qVkAz/E7EE1nXfpFs6lwnHjWBJnRrrv1dbsjNxV361hexv2jpge2xxQgEfM8ksVo
         TLPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/GWG1vm";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y21sor49900042pfm.25.2019.07.31.13.38.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/GWG1vm";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=O/GWG1vm0GYyFApT/JUxE06dQDg+BEu9I0fKzi/ASPf07ZtfGyq9opJRL4dUai0mux
         eU7ruZSdfVcqEFARLpd/rSUmTwckk6nwb8nEx09lZUMw99HBKO7ZeodlseN5m6Rsr3uH
         NrJCjDhHmDoLZ0APwwhUsUPv0BXorZcsVjzb4X8rp0Vub3WO2fZmfMpt/MeMbSi39hYo
         zPFdo3VDUCJGRtpohDA9p0gKBcFPkEJE5pFVj5dQBsuncOG22hO78T6DZi9w8HYcIYLh
         11FEbIo2DltQXa5cvKMr0mba9j8LftBQuF1tPblPELqpKDxUdJa+QXO4ifV0+230SU8d
         fR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IeFtwkeZbBPVLT5Rmllb3ExAsBhlKcdIq9EZhAeEOQ=;
        b=VLPHE8xjTnqoDpaoQH2okb9wK+U9QUrTTgWCFCWz2fi/TFZO050nU/ICy1Zph2AwQN
         y8lDdlLJc36Q8weggpGj3PVSBw0NvqQ++aOPM3cJMawslul3cG+2hJrsDa6ae2hUT5ao
         0xtwSyxkpCxtwY0RBunHbQTBcuIWNVGGhXVD/M/61sgscuae7lyc63AcXCAE7tCPkUGO
         b+MCv43gR0OOe6wsyg76gds1UMIfs21oGmPAeJwlOURGgp3sonq+NWQLByMlQSQr+mIE
         qJllA8o6D7ODXsdDT35SNdcuV71FMRFCet86PrgOKbe+yYzYtQHvFmVu2czJTsmv03Ui
         ENAw==
X-Gm-Message-State: APjAAAXRTPFZNShN9cfMHrXoIeUBRhgxUrZb6pYxHidYbNqwbiUynxju
	WuCORQX0jY9lCMENVi0WLQuAdYA1jxACvw==
X-Google-Smtp-Source: APXvYqxPcmvh5VYQWOzxJCBS0y9i2ckmXm+3TIue93ewDGEjwJkruVEQcz4UUPsK8Wr2AXnSKzDx1g==
X-Received: by 2002:a62:2582:: with SMTP id l124mr48886230pfl.43.1564605502801;
        Wed, 31 Jul 2019 13:38:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 06/32] target/arm: Define isar_feature_aa64_vh
Date: Wed, 31 Jul 2019 13:37:47 -0700
Message-Id: <20190731203813.30765-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PM383OP2qdjk

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddb..e6a76d14c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3573,6 +3573,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
+}
+
 static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, LO) != 0;
-- 
2.17.1
