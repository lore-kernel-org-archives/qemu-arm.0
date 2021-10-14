Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3956597lfc;
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsTiDdTI13JgN10AzlgIqcUV+glLB/CDNjsG7zMuaRKE8cS2j8eKO4O6RFE9KefWAZyBGd
X-Received: by 2002:a1f:2441:: with SMTP id k62mr5652924vkk.22.1634212647125;
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634212647; cv=none;
        d=google.com; s=arc-20160816;
        b=h439YN2s0l+OB/P0G3suC5uFZ3RNj7K6yhOmMVe4l8qGXEAI8C+Kty6NFjPpmq5r0T
         wppRtg7zoenz83eRrFaaMmfP2N9wOiWLykEID5cdnosjne7t7iqssVQCLwmM9A8i5JSX
         wXa0bIXVQlv5R+Vq/DZgBFEBzZkQbBeJF/NCOrBxleV3J+CxJhbUHj+yIYa+M0E+0jyy
         7SArw/bv+T57BfbLCH9JlVfopgV82eYUIx9U/ulwB6PxGW9LFcGzYThpWmeuMW6gnA7F
         J/jBeySYGNvvK2SMtegrcua6OBYJXT8oaScJqnWUr1iAhI07D8UwtqynHPYfDAfAoxrD
         8Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LtgaWTNCxYusSVudl8YK3y8rrMGnzU3z6GSYqB4oUq0=;
        b=TSAbSo36wDiEd23qDVQ6nei5BHban/OU1hOG/r0I1BAprggQrfl+CG32CiP1FeqXjT
         9CHa+5MlVr0DOPTfI4SyphHWkVY8bzQ+GSUhWOqrqGOycY7CJ3AfIQtjSnxw2HPMZIfb
         zXdcQx4G5KCDKQRMojeBJPwcz8Pzx/EqrtMIn2yeASWmWOhsJzcAaV73lmyz7vyiWZpi
         aBWyn1K8maUhhUuTPMKPBRl3Xj2GubKmozgyF9eouj/9BpeOKiCTy1hV3hzLQhQyAOq6
         5F2ireK34ligWIwooH3DVT/ousdfB6ou4tGpGMyTqmtd2D9FjvHncV/5L7XKV1b+PD9I
         LHqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HaEIUYgb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si2859349vka.76.2021.10.14.04.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HaEIUYgb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mazMU-0000db-CG
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 07:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazME-0000ag-Ol
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 07:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMB-0005zK-70
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 07:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634212626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtgaWTNCxYusSVudl8YK3y8rrMGnzU3z6GSYqB4oUq0=;
 b=HaEIUYgb96K1jx/V9VH8Wd6Derk1D4f8aw2iRDy8lZqAkiDp9Vle9XPf8k0Ab+afvA6vHQ
 z0p5GkKBr8+LBrpKQpl/hUtV844dij70DDOmZp3/Gg6YWfwTkG8etwCHPvoh0/WAUE/cOA
 C3JAHRFF8dHs+EDdZZwzKcYE2lhYXBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-FbrhdxwaO1K2IgtPfklLUg-1; Thu, 14 Oct 2021 07:57:05 -0400
X-MC-Unique: FbrhdxwaO1K2IgtPfklLUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B775019057AA;
 Thu, 14 Oct 2021 11:57:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B295E194B9;
 Thu, 14 Oct 2021 11:57:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 mst@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, shameerali.kolothum.thodi@huawei.com,
 ardb@kernel.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v3 1/3] tests/acpi: Get prepared for IORT E.b revision upgrade
Date: Thu, 14 Oct 2021 13:56:41 +0200
Message-Id: <20211014115643.756977-2-eric.auger@redhat.com>
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
References: <20211014115643.756977-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BW7LVW3ECLGm

Ignore IORT till reference blob for E.b spec revision gets
added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..9a5a923d6b8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
-- 
2.26.3

