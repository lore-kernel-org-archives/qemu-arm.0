Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088197lfc;
        Thu, 12 Mar 2020 12:43:13 -0700 (PDT)
X-Received: by 2002:a62:195:: with SMTP id 143mr9902432pfb.17.1584042193598;
        Thu, 12 Mar 2020 12:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042193; cv=none;
        d=google.com; s=arc-20160816;
        b=KAWwJmLMfOgyXQGOvaYzecjE6CtWjkh5RlbY0n2d9dzrbfVYxVW21PZ4uh7VGTLN2N
         P8ncFOkcBHrZObx/wZOoUrxSuG7GNsTFPUi876nfpLMWxI+WJT3Vo+1Alauu0eF+b0bf
         RScZ0sVGUWsHvqehMv4T2B0RVr7+mL/LCrRX8kaYDPzTf3RsTkfqKklJ1Qbjh3RlhFmW
         oqcuTWoGCGcvJfIrbfdg45ASUhtUgqKJobreIYOQNnXhfPjQ9sXDPKhLjfxRa54XdSIE
         yGVcrf8E//MsPKLR9K5b1Kw6lKCouW7r7i0qLgDZPbpeEDB/nfhGtBBcdOhSDgtjKJSd
         ZHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qowSUw8JkODxrAT/95Utumdgqt7+zNqoGPlNwIcI9dY=;
        b=Wd55uLYudUbt0DiSqlry644so/rhQ67wQjXUlDFKPHr6INLnvQRhvXg3Zw8eK56FEs
         kIt2zS4bip5o6WSu6kb4DhpwhwqGsImICy0OpRwiFBMoNhknXRMLJ+A/tRILoIliQWx2
         UvZwfVbx+Cs9MiC8UQYJIL3CePTZZDzZHmkcZhiSifY30eLjgxoevniZ2RYEcV/g6oCh
         MQNJhLDryr5ykXLX/sivfb+uGjVz8hjjCKLWLR2fSgYm7Uf+E0B6UgXOhE+LZ08zGtLl
         iyJIUx0aMjDQEgb1RoMv1faINDgRs5QC5PLV8vw9uk17Zwjt84icfkvTq38L16hPTVkl
         Pz/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6Ep9VqN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o13sor10430040pjs.1.2020.03.12.12.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6Ep9VqN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qowSUw8JkODxrAT/95Utumdgqt7+zNqoGPlNwIcI9dY=;
        b=G6Ep9VqNxI7wLJ9RSdQwi+xiq17SmKOusrDTFlytaN6qVssRu0WtSj8u+1AugJ0jTH
         Wpar/LFslKixRmmDioyUgfWHpUnF/93kHRBhvi+0krkRsC8lVzQqjAeKWQhH2VjgOCFR
         Gvp40iYDkpVeiQ1dwpT9sKT2/HYTyXedrKMVSCA6UZt60/zc8hM8CoMs/itKgD2il0Gr
         KYQg4PJihNYVRpp0b+x+57RIbirDXLQ5Xwv6ataNLOlKxeWfokaUX4TzweDXvnKSz9Fa
         Ps4h3CWIRYMMvPMOHjCZJjeR5OwYfvPqJT1tvZxRJ/NM9mByzAw6Kmo5mwX8XOi09dOb
         Ph3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qowSUw8JkODxrAT/95Utumdgqt7+zNqoGPlNwIcI9dY=;
        b=W6xUBz0L3IaFIEDmK6Lr09AQQE3OLmmC0TNQjkj6ULMv0QHOfuKtbJJ2WnkEfT3htu
         TcNgXTg7g59zexIj+n2grtAeuwd47Vjxqc7GeoPo8bc7Zi7g1c4IR4xRd8ndwsZjWv9F
         uwlsg9kF9bldUrFYYANdgIyodCgK0gxaB5FUYxU6gKe+GAj6rs7mEvhDEav9rXV8/P37
         krJMwJ38vKpylowFYt0pmc9VjCLo0xs3cpUcWiVzi3WRqFFRNIdL7crhUMbUsn6Ikzdm
         J7yJj0ss5dnZg7iWUeQS7KJUrz7FB03UtBBU9+86Oe0yWkv0x6UujAydPGCqimt0befy
         bDzg==
X-Gm-Message-State: ANhLgQ0hnaXXCmixqAKtfyqNEcwX8ecoL522EMons+KnTqVR+dL8D9ng
	7rEuJ9r7LTVxMh2KX0QrpiUhtzlf
X-Google-Smtp-Source: ADFU+vtpaIe6RJNVNUlJL0DNJKduwLIvCnfEClJ0oQlAGCuJ8XiZdQaCwGSkM4m/x4m6OU/VoQxxnA==
X-Received: by 2002:a17:902:7003:: with SMTP id y3mr9875557plk.122.1584042193138;
        Thu, 12 Mar 2020 12:43:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 39/42] target/arm: Enable MTE
Date: Thu, 12 Mar 2020 12:42:16 -0700
Message-Id: <20200312194219.24406-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: APZ1fkJ4VEOv

We now implement all of the components of MTE, without actually
supporting any tagged memory.  All MTE instructions will work,
trivially, so we can enable support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Delay user-only cpu reset bits to the user-only patch set.
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 62d36f9e8d..94e83b8487 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -665,6 +665,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.20.1
