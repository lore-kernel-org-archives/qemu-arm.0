X-Received: by 2002:a17:902:8548:b0:14e:e968:9703 with SMTP id d8-20020a170902854800b0014ee9689703mr1851898plo.148.1645655524992;
        Wed, 23 Feb 2022 14:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655524; cv=none;
        d=google.com; s=arc-20160816;
        b=uEc8+a+vJBIT4Zl2W6tbPlefwp9ihmjfLD2BqbcnCCRhmBmEy8q1Ru5h4+ZpXUYKbY
         HxGQne5aGf1L8l4HLRYnOskNGQMSVsSG/GtIG20XrvUAnNdL3Xn5tC4n5ZAEj+5Eo6IZ
         FRWmqXzgCAi80zlIsaz9cVvxZ/Y+LeHHbsQ8o2aTzhlx1PPVXRGOWjwVljrVjoBqchYz
         NSwUottgdLjn6w/PycQkR9fPMXOk5I8Ocx0/bv8YiOnMfsY9BngpTjwZxyr6w2OVUU57
         R9hkekZ4tr0Up2211SneSdvvL3HsK1LFt19q535rVWTTw3xKobnbCsTzVEtnkH9Ttr8h
         w7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=OgQYm2Z1LxVgFio+3tz86Ikc8GAK5p78aix0cdw8xcU5KSnToPaMzPi39EN6ap4Yg5
         Ug5Om0D86dQWGU3sagMID1qnqBj1ePvv91va92PO4hnIoiUoiCFamD7KRJe1SmlSE9/1
         ZppxytcJAV92L12Cmro3DqMR04h+8b1GWuyX5cEhyWhybTDc9RcLenrZZY5i+MBVTNpm
         Xht0hXgYnEov4zRAxPaQJS/sgcDOPoe3X8t+mKDg5fkzJK1VWlAl7hFbm5A9m3DMc3px
         ONqYIepS0fZf3Abm4OMN8KzZmA1/gi7Dfofha+c/cDiRPjyhBqH7kLRzStzoJxJtzIt5
         tlew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVeSSx7n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w1sor602209pfu.20.2022.02.23.14.32.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:32:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVeSSx7n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=NVeSSx7n9c7TYeAr0xNMSrZxIH+iXkMzh4tFFfdzOVote81ikFS6NSu1zhrfEj2MWR
         qW45y7kATahxyn7cv09cn6Z9+CQhvDeOgIo7UGiRY8T1cUG1/5pB+Iu3LCj7fJXzvDi2
         AdS+ILB/CGxaJTnwMMZD+nCzqGnLUXybvc7h9LYAz3YcSSA94mAsC7qr0E5Kz4iR7s8N
         QfGrLjcQBT6hL1BdXyLknqwbAmq7MPEx4b+JlHhXL/Bxj5tped3DHZjMx2vh41uP0oq+
         Md+3Y19yOF3EobkZq3Cu+8RSUN/QZ2mz4Ti1LrmI8cNfqBWF8NPrTH8TqvfhCregF5fC
         Cg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
        b=uhGoO34VgJvJJkXmn/TldnuhXyzO3ML6qc0Tet0oHqrfjGsO+DoFv4Cq8cP5Febqh0
         bv8RquOzdbQA9E2H+nqCDOyFAgtjWYnoacAK+05foJ/4yqLig11n1Pux01r3rWmeB11j
         oLa0x72ww7rUDFO5Xmrvu6cc2A0hSwyzdDeJAGc/2wgpNjcZK7BDoSUP5dKq2mojzlCC
         HZS5x24JIdstIyQHlZMZ8vM+SWki9pgtCiTKsPKMSNM2MWxEzG4jfLOTsR864QTd4sDm
         bA2u3letk+BU4dBbHV5uuFrY9CrnzBfraKXrwY9sbQfd6kpHJhLUuTXbABaxg91JDTrP
         cQRA==
X-Gm-Message-State: AOAM533cd3gKmu8ZLE3PiUcD58fy45tH9YZFt4bLycsrN7DsCjlOPVsI
	GtrnNI+GiY4gYGj337fs8WO/e6Dw
X-Google-Smtp-Source: ABdhPJzo92NBvI/eoVpVPvAH3E8aPZ2mHsYr7A8A2kRBfn2GYD+693QiWuuV57oPiTDhldbzGMkZsw==
X-Received: by 2002:a63:7709:0:b0:36c:8c3c:1199 with SMTP id s9-20020a637709000000b0036c8c3c1199mr1389383pgc.580.1645655524524;
        Wed, 23 Feb 2022 14:32:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:32:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 15/17] target/arm: Advertise all page sizes for -cpu max
Date: Wed, 23 Feb 2022 12:31:35 -1000
Message-Id: <20220223223137.114264-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iLFuot2innxV

We support 16k pages, but do not advertize that in ID_AA64MMFR0.

The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
to the same support as stage1 lookups.  This setting is deprecated, so
indicate support for all stage2 page sizes directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d88662cef6..2fdc16bf18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1
