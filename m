Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp189077lfb;
        Thu, 2 Sep 2021 05:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuC4TfxNDAIZVumR6TU0KLeII45AKSnXQtW8se4Q84XyQ/qZW6cm56ZNFRKkQErSlsVnlt
X-Received: by 2002:a05:6512:224b:: with SMTP id i11mr2196907lfu.605.1630584181748;
        Thu, 02 Sep 2021 05:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630584181; cv=none;
        d=google.com; s=arc-20160816;
        b=gP1c2m8ZWkYTAOXyNA6jrI5cdp/JHF8pwdCJUQZwEB2fiiSsl+byQQNTR0BToSp7P5
         JrP6sAGZnGbcL8UjWXexkdrpWgtauGopEszgo/bJkyYnkUOf6iutIVbWTju0vDPnRUNQ
         6GAsDEvcsqub+Lz8+aHf7/uvm+U1u70lpHSK2JwmUCPkN/4ofRlgjqVd50v36+miLDeo
         PjH8kI+9JOdIV1zrY9ZTTtLqAOqOhLvymtb4Ho7O5czz/HzKaOnVxsGF4DkUXtR8K0z8
         UT5Xq67kwpXpGD5PvLSCoDGL+uB/gl/iX67e/cuZXLr4l6wAW12Wihlnyj7+GJz5D+pp
         yFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RfkxOYdWc9Q6lR5t4xQoPQNESuZqhwOWJime+pQAPsw=;
        b=JZyV6dSTIoNo3bQzjlxplEtHSJ/F3LH9TOQanT6Reyw87Zc7Ln2KHf/la0DYAYyCTr
         0Uem9kPQbqJz7enBGBrnrgeG6AntZ8cILjrOJFRveUbK1fD+FDLjxRCj+7Qy9ECd445N
         60ayk8DSD0E++zX1yYEFb6chXt1ZXfzF7NQZ2m0J65v0VhkIx4keLnNfSRwyuIxZHqGe
         x8Mv7LknmlU0uh9R6x6AXgriT5Ocoimrgw+6rd1XRG4SeVGcKxd5dLAr6oeT+OQtXJ4b
         zEAbx+Y0UcI1gi4M2Q4sq1KsIhrC5ijrSd0388PvpLqpXo+lyajROrsFgzMW2x4Ue6IW
         5yJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XQnXn435;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si2471796ede.473.2021.09.02.05.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 05:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XQnXn435;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLlQq-0005lq-5W
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 08:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0t-0000df-73
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 07:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0r-00050w-Hd
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 07:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfkxOYdWc9Q6lR5t4xQoPQNESuZqhwOWJime+pQAPsw=;
 b=XQnXn435sz8z8+peSbCquk/p4KIlz1buObOERm8xXtyzZ8TMkSlM7eYhOdC+iqq+owYRK3
 5vrfZKWJmPzRtjVkC+6eiUaPWfTB92DCnpMsY79gkmuos8S18mBFWbTjSya+jnlPqrmSqS
 AMSQzzwAwK0KH/AmzS04ms1vqvB+LkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-qzDSi3I8PeutEY1SajeIuQ-1; Thu, 02 Sep 2021 07:36:07 -0400
X-MC-Unique: qzDSi3I8PeutEY1SajeIuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 107BB84A5E0;
 Thu,  2 Sep 2021 11:36:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A05EF6A8F8;
 Thu,  2 Sep 2021 11:36:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] tests: acpi: arm/virt: drop redundant
 test_acpi_one() in test_acpi_virt_tcg()
Date: Thu,  2 Sep 2021 07:35:48 -0400
Message-Id: <20210902113551.461632-13-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, drjones@redhat.com, mst@redhat.com, thuth@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Csk/872EgNTR

follow up call with smbios options generates the same ACPI tables,
so there is no need to run smbios-less variant at all.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: eric.auger@redhat.com
CC: drjones@redhat.com
CC: qemu-arm@nongnu.org
CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/bios-tables-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f9c8363e91..068fcfd623 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1427,9 +1427,6 @@ static void test_acpi_virt_tcg(void)
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

