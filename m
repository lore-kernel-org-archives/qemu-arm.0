Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497957ejd;
        Fri, 19 Apr 2024 08:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4IspklxrDb55eQRMvzrpj+ZIMj3Jq5KcsZ2CT6/niGa6MKsZNzvWLBBBN0dcZg0PfeOnK+8h+nn+37rFDIM+o24KQ+pRV
X-Received: by 2002:adf:e58d:0:b0:348:b435:2736 with SMTP id l13-20020adfe58d000000b00348b4352736mr2140105wrm.51.1713542391984;
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542391; cv=none;
        d=google.com; s=arc-20160816;
        b=SZAzMpKiwYdJ0UBXodGvJQm+7FmiCwlmepg6OvCQ5EPKChwCCObZF6t1/EEg3nNwcj
         775YUMgBd2JMaxZmYiwbnDrzlLr2sMobfuclgqZKRgZgblBLm+RNMrB9grKDNeFjreTb
         tPvjy+4PjUudxWe6GaPVO55Fl7L2f4S8z4SvxMPlSrn1XoxNMGGXOnpd+ivIc9PrO1l3
         ToTbRTX3seWbkHwdCFDatiuuJXwuRMrtyEWKVi3EbTcS2RE73L6CiMomHqPaBjGsst74
         tD7bq0VHdL4avM0sbJ0LcPcByrzvF+C/1zDje0ULrbNHdgJ9sYc/7bKBphAOfFrIvxkK
         +x3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wGSOG2AohVyB+YklCc4A6nr7dY+0+hbY8R/nFstjWpI=;
        fh=a7d7Iv1MshUScIRERUqZNIVbLwdMyUBvhE/sIMuP6Rk=;
        b=tHFUII6yAiYr7OYqovGWCBA1I3nn+1ET6VdkM8MYZRfvoMpLEW7GnnZGyKlxXAqUH8
         BmNoqZiV2vNDRPi8nxihM9G1a95FATykxD/eZGZpPZ5aiZ5m/rYTHFP8GAk7Bow1JXAx
         Rk1xGf0eTs9QRigIfqwMyGqDkjTZOyqrrUVGidwL9nWgiGC6JVqP1ZeGI1xMiX0DUvBg
         DA1VjgZh0gmLP4cBSD4++Jz9lLhbrfHZjiMm5WdPqPa7wvNrYDHu3F0Ce2dOK5lh0Mev
         C8FAXSKhn3cM4a5qgYzVL27nvrdxrEZjC0NvPIs0ASUoE1csbntzjSsN54TCCh277WKy
         N8Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/0bSTjT";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t13-20020adfba4d000000b00346c40d96c1sor1834587wrg.7.2024.04.19.08.59.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/0bSTjT";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542391; x=1714147191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGSOG2AohVyB+YklCc4A6nr7dY+0+hbY8R/nFstjWpI=;
        b=d/0bSTjTG1XdfLj59MP+HLIaRkb29LZOhCGrxH4ndWRiDID3b0nBURU5rSEoPBrgM1
         dOD19q3sccwAQl/0+HZ3MoRRLNVK3b9m2NZaVhcvRvFm06AUib09TqBOIjfOc8Q3Xxeb
         6LN1Co7HmHN/VmFN2bu7Bb/gwRhwradXoDhRVR1NdYDxWssxJ0lc2dyjJ+H7JMWTQZKB
         BxtQ7/yUdl12xHFJw0/lFknxkR6jLbxCSXRbHzXxQ6DVe3n/j91qqGU5bWZTmY5kBM92
         PSYQ6JavhZ/AXf/0mgGDO9nvG/4ZJIF1JibnfrN/RZHLIqhhr75sXtJNbmyVnBkjnAD7
         2mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542391; x=1714147191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGSOG2AohVyB+YklCc4A6nr7dY+0+hbY8R/nFstjWpI=;
        b=shKFF5VaZbthxCstFGipXkqgicjnJKc8UJeQXXsrm6cZlRrOP/PlDYWEN9jmraAJHG
         0wJG1WirVQTi/mZ306xE2LeuVj9eb5Yv9MTU8HucBSI5/rxLkE5P3Zz5Aww+MjcXOwP+
         nILtyzgbCs1mh9BfJpRBdsEWjqU5jXqgCWhcW5JMnnEqnWLv5LjB2RNpj3vHjiICn326
         AmvHf35i11XMHM1aBZuUeJYlbxgkLi9ndA1/kakEllJrEloZ6IW9HrtDa2Wa5P+obJIa
         WlA9dJxPvyHa++HVCtcQrEZ6tuTyZsNxnSiyKD+g2NE+XOOa0gifRmBenehVJyi99QXM
         icrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOy+ZUU+1/atwYbuXuo+F48+H7AOHf8mqa/hnbphKJcA5HcbidpqDD2gHYqq5/taKD70e/qq2jkr+YxMWCf9CULoWXctqp
X-Gm-Message-State: AOJu0Yy+PKJioDX8GZ+oP0rYMZ4IsxHkKiVdrAcyl+/xpcbtc0Va0awn
	lcMzsp0kkKHSv7Ph6+0Si/bWJm5UxVLbOYFZasfc6Rc4Qdf7sS4JuLLgeL3UIQQauw==
X-Google-Smtp-Source: AGHT+IFXWXZ2doR638dGx4gpYpEI6Czh03A8U4tqNaQVQjbA9rRJGDe2do9bDxtdVxSSCJ0+axOIjQ==
X-Received: by 2002:a5d:4f90:0:b0:347:4484:4498 with SMTP id d16-20020a5d4f90000000b0034744844498mr1910461wru.59.1713542391579;
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 07/22] hw/arm/virt: Reserve one bit of guest-physical address for RME
Date: Fri, 19 Apr 2024 16:56:55 +0100
Message-ID: <20240419155709.318866-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: h/F9GvY9CVZC

When RME is enabled, the upper GPA bit is used to distinguish protected
from unprotected addresses. Reserve it when setting up the guest memory
map.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: separate patch
---
 hw/arm/virt.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f300f100b5..eca9a96b5a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2939,14 +2939,24 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
+    int rme_reserve_bit = 0;
     bool fixed_ipa;
 
-    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
+    if (rme_vm_type) {
+        /*
+         * With RME, the upper GPA bit differentiates Realm from NS memory.
+         * Reserve the upper bit to ensure that highmem devices will fit.
+         */
+        rme_reserve_bit = 1;
+    }
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
+                     rme_reserve_bit;
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
-    requested_pa_size = 64 - clz64(vms->highest_gpa);
+    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
 
     /*
      * KVM requires the IPA size to be at least 32 bits.
-- 
2.44.0
