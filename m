Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1333234lfg;
        Fri, 25 Jun 2021 02:29:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/D98MV1snnwCu9rijzY23/Q09jUdqGqbJvHDb2Z82oZu8ObLtMRMqdYLIQNVwAWcZn5rv
X-Received: by 2002:ac8:7f94:: with SMTP id z20mr8641719qtj.17.1624613397060;
        Fri, 25 Jun 2021 02:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624613397; cv=none;
        d=google.com; s=arc-20160816;
        b=quDwAXOLgP8gz+6MFAN4wLejlOyayCov9HB9i8+i0W1+gu8ueUrEVVIodvH0PNLnTh
         zHjqw/ZgCaDAdudrG6FpHhn6PMzmbGyV1BeHAQW6J5T5T6YGomjGiD2ye0cXgEo12L7x
         gQB0CQUMAqey/NtAYzmCBLAFdQkA5Sx1siabYEIHkghACmrZcy1Wh30oPM4NQ/rFwuR5
         9pLEoug6cGh+iT6Hde0R9NRtVrtqgAb+wl9OQ1qm23vGq0At2djzjw/MAF+xzo18IfI0
         e8uA3ZB3T5fEGKRKwN38dXNZwbxU8SKjXvfBg2AJTfA9QyC9UEYi17JfdRGrt7oKjo1a
         8Qww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cdRqbwhsxr94X398lrQ+joiO++sIUdW75gPHMuy1VS4=;
        b=n4M08oTljnvGBuTVAlfzBuuvs50nevbBZfR7ywIow4t+xvonVztHZiAWTPzaoX6o2B
         5rAYbH73SebjQXroD7pVq205CFValCodXbtbJxf08shERROMZh7rQq29NjPvdWrLoUYB
         jQ6DfCzlrlBlm64aGauspxSRvi9rfdDgaA1YCOPdvZJ81h/BGSdDTgwEau9ZjIdBGfyd
         MYumqCZ185c9oXFbbDgq81lZKFc7DZ2TYn3aDqms6P8+ur6yNVtz7scOMjh/rSs+rS6i
         r2dbb3uYxBRRL9KmUQYrDV8sVOw8KGP+j2i2TJ37TQgtjXnJuCwC/Aj3UZ7WmxAdlVWf
         xLGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JcXZHCbJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si3598093qvp.186.2021.06.25.02.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JcXZHCbJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwi9s-0001af-DP
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzN-0002IA-O7
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzB-0006hU-Vv
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdRqbwhsxr94X398lrQ+joiO++sIUdW75gPHMuy1VS4=;
 b=JcXZHCbJwx6NVnwwwKM9Mvg3bUEbvkE4wKihmtLZrKu7ZhKHlD4HepqFYBxLPQyw9no9F8
 iwM6HcxJ9oHo/LT65CG2OwNBY18nvPlzeZucYzkXQttE33/ML2pFQ++MYLMRopBzj7ehMt
 CGYWGukTWXQTK/wzMigC4AAcUvYuaew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Pecyg6wDNE-kWJJ-SvR4rQ-1; Fri, 25 Jun 2021 05:18:50 -0400
X-MC-Unique: Pecyg6wDNE-kWJJ-SvR4rQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D3661882FA4;
 Fri, 25 Jun 2021 09:18:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E493360C05;
 Fri, 25 Jun 2021 09:18:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/53] tests: acpi: arm/virt: drop redundant test_acpi_one()
 in test_acpi_virt_tcg()
Date: Fri, 25 Jun 2021 05:17:37 -0400
Message-Id: <20210625091818.1047980-14-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, drjones@redhat.com, qemu-arm@nongnu.org,
 thuth@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yJUWpogM4dEV

follow up call with smbios options generates the same ACPI tables,
so there is no need to run smbios-less variant at all.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: qemu-arm@nongnu.org
CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/bios-tables-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9b36a49f96..7084f0f795 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1416,9 +1416,6 @@ static void test_acpi_virt_tcg(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57", &data);
-    free_test_data(&data);
-
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
-- 
2.27.0

