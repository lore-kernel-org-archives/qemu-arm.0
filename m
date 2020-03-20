Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp625557lfe;
        Fri, 20 Mar 2020 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vst6lby35+zpFfhVMc4bBPVAbQoKES1yAA3VfhEX9SKmrYTToYibQH+amJCHU1Fi/77xSuU
X-Received: by 2002:a9d:6e90:: with SMTP id a16mr5944421otr.72.1584696294747;
        Fri, 20 Mar 2020 02:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584696294; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3hWj54NXWDrVFSsDCaq7dnkkSuMQBUD91N6j45nUHjhZZgPOWBOiX82EkTAz4Qrjm
         7OXyPf5OO4eUp7vxHgA/bFUu2347cDRPxLZa6WroEoCXs9enXyThUlzQeqWdCBMUCG5C
         SOcIuPuXZ0YpMzMm2zX8iKCzV2z/BRbxw6/h+0DcuJFtQwFHi4E6i3nWTkw2PjYiFhwh
         Ld0UjInSga/WxQHqdADZh1taiCWEc8FJeLxmkKotAybGiFfS4uc9Fm7wk+nr2oBha8aD
         fisF99KB74tZiv1hbRngZktP3myKI7NDL9/qzNDoF8cjnHBFnnK3AUvW5kfXy2sYBcI2
         YL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=UwxboLM/1/6R6tAMk1spBES5/5ri78fJDwe9spWgtR3i3SnW+ALFnzIx5jkhhJY/3T
         /onqp/ZJf+kb4GM6YH9ZZ/DUTkRit8C5d6IEVpOShK0oPhClXZuNc13e6RsWKt1Rfknl
         pRTIYzFK/qDD63b4NG+s5qo3PYFhlNsbkqeX2Ufr7iFOUxYK5qu9zmysbVrH3zrsaLMY
         IjstTRIKpy6c4eXD3UnZcFFD2V3Tq7JIr5hjvN22y6dkhW+JZOgcx5shIBelMQ/luBXo
         Z8T/n0Pk2PVkucQhhADHs9AJqPyeW7eZc/H8LaXXMAx9/m4P3G8Qm/KQio2AzDBk+RZT
         S04A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C40Mb12f;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r19si2659385otq.241.2020.03.20.02.24.54;
        Fri, 20 Mar 2020 02:24:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C40Mb12f;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgCTJYx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 20 Mar 2020 05:24:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33654 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726954AbgCTJYx (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 20 Mar 2020 05:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584696292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jUPGPmIvaDDGzVaAE49y1ve21avwQxlD6sBJrt5aqiw=;
        b=C40Mb12fMWE+H/hz8N/lo1KVGRnwKkpK2F7LC6K14azTD7NmlhRwxhIrzQ6j9qFZCu6Z2C
        2dNXe0B+LUAy+hqheaMcQW5dvyoCEiTncvHqsH+dkGX++q+NNBujmzS8ZrUOOSPaB8g0HQ
        rMfeWTb18SwW1g1DGEr2/yj7CsjfExQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-OsWFrT5gNDeelXWk7ftxug-1; Fri, 20 Mar 2020 05:24:50 -0400
X-MC-Unique: OsWFrT5gNDeelXWk7ftxug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4311005514;
        Fri, 20 Mar 2020 09:24:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 240475C1D8;
        Fri, 20 Mar 2020 09:24:45 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v7 02/13] page_alloc: Introduce get_order()
Date:   Fri, 20 Mar 2020 10:24:17 +0100
Message-Id: <20200320092428.20880-3-eric.auger@redhat.com>
In-Reply-To: <20200320092428.20880-1-eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pE6zhDMZKu/R

Compute the power of 2 order of a size. Use it in
page_memalign. Other users are looming.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/alloc_page.c | 7 ++++++-
 lib/alloc_page.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/alloc_page.c b/lib/alloc_page.c
index ed23638..7c8461a 100644
--- a/lib/alloc_page.c
+++ b/lib/alloc_page.c
@@ -155,7 +155,7 @@ static void *page_memalign(size_t alignment, size_t s=
ize)
 	if (!size)
 		return NULL;
=20
-	order =3D is_power_of_2(n) ? fls(n) : fls(n) + 1;
+	order =3D get_order(n);
=20
 	return alloc_pages(order);
 }
@@ -175,3 +175,8 @@ void page_alloc_ops_enable(void)
 {
 	alloc_ops =3D &page_alloc_ops;
 }
+
+int get_order(size_t size)
+{
+	return is_power_of_2(size) ? fls(size) : fls(size) + 1;
+}
diff --git a/lib/alloc_page.h b/lib/alloc_page.h
index 739a91d..e6a51d2 100644
--- a/lib/alloc_page.h
+++ b/lib/alloc_page.h
@@ -15,5 +15,6 @@ void *alloc_pages(unsigned long order);
 void free_page(void *page);
 void free_pages(void *mem, unsigned long size);
 void free_pages_by_order(void *mem, unsigned long order);
+int get_order(size_t size);
=20
 #endif
--=20
2.20.1
