Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp263077ejc;
        Wed, 11 Oct 2023 10:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOZg0iONyDFWLdc17dBVMPo/6aSbehHajj7hIpX2zMFKCTfmhXdUR2mezx7LXblDJV7sGB
X-Received: by 2002:a05:6808:13c5:b0:3a8:43d5:878b with SMTP id d5-20020a05680813c500b003a843d5878bmr27550328oiw.2.1697046986057;
        Wed, 11 Oct 2023 10:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697046986; cv=none;
        d=google.com; s=arc-20160816;
        b=fxbMD5WIIGzFvfSlNetXf3QsWXT46XTzAf2JMJedx5cKnhFWpzMWYammRdavWfj1lt
         t9J1L+J2F42dCoLL4zj02S4Wx3+OOZvarT6Q/71TiXjiycIaTojMKrdryOy0KWuXgf+o
         94bb5nGJETGvEDEpsbgvVOJ/dF30Q/GS+W4U7Kejpnp42ObKv5SJhGRGocwb6PItu/9H
         rC8LXNQbeYxvrKaPNPxEIubYuTKvV/xKIQtGgHg8iOiD7MOAihzPyBORbIFjfPk6eUwx
         6J6EySYV0FdlVqqNOM9PUOh6zZnHXh0lJCaxOHxAiJD6w6fzie6yZDihuKmj9jTUiVb4
         TQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dPAnm5/3g206LbH2PuyKPpEUwRZ8C/v8XX4B3RVheHo=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=y8rRDFHRm3C3uWGkj7tIs/ckjF4F7CaZVziGDkmvhl10bc0Rrxna1SmruDPMF+48HE
         VhOdB32iplngj9AdzeuszYL9c0q8Ke4Fpo09/poBuQlcVhHLHHH/hK+OdNLQUG8T4jeR
         dzBfUyXNe9VnNgZVA0Ls8ucHPMEYYrQRRXI2/8dZlq0BDj2tlme/WrMMopZq0SOoBuPb
         P3ST8gFtQe1XQcqtpiB6AOj5VKJCqmChJOcFBjN8lO/zvKnjiso901/WL2M1mUDLW78e
         J+I0F5royRZ+wROtj3Imq53l2Ar3YAVkBfItfML1//hEvIAIUudAI1syV/+WoU5CJGLL
         Fy7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSKMYwfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020a05620a295300b0076f08f689e5si9986582qkp.502.2023.10.11.10.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LSKMYwfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdRB-0001Hr-OD; Wed, 11 Oct 2023 13:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR6-0001FH-4R
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR4-0006YN-4M
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPAnm5/3g206LbH2PuyKPpEUwRZ8C/v8XX4B3RVheHo=;
 b=LSKMYwfDwr/q6YlKJN1ZbFcLWdU2hh7dWbxwAOAWHzLYD1qqknKSQKIxcfeuVuEohRuWzd
 61oYnFIbDTwEq+1tUg5VnqTnRMhAs1lvsLRGQdziaYvznCWr8ZIlygT9RRQTJKZCByS1k/
 l9It4WdeNNhT84nC4e5EeIs7NsAXpDw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-DzDsfZyJO5-qN-GQG2ik0Q-1; Wed, 11 Oct 2023 13:55:50 -0400
X-MC-Unique: DzDsfZyJO5-qN-GQG2ik0Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F59E85A5BA;
 Wed, 11 Oct 2023 17:55:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69197492C3E;
 Wed, 11 Oct 2023 17:55:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 05/13] range: Make range_compare() public
Date: Wed, 11 Oct 2023 19:52:21 +0200
Message-ID: <20231011175516.541374-6-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KWlE2Tm2oeLJ

Let's expose range_compare() in the header so that it can be
reused outside of util/range.c

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

---

v1 -> v2:
- Added Philippe's R-b
---
 include/qemu/range.h | 6 ++++++
 util/range.c         | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/qemu/range.h b/include/qemu/range.h
index 7e2b1cc447..aa671da143 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -217,6 +217,12 @@ static inline int ranges_overlap(uint64_t first1, uint64_t len1,
     return !(last2 < first1 || last1 < first2);
 }
 
+/*
+ * Return -1 if @a < @b, 1 @a > @b, and 0 if they touch or overlap.
+ * Both @a and @b must not be empty.
+ */
+int range_compare(Range *a, Range *b);
+
 GList *range_list_insert(GList *list, Range *data);
 
 #endif
diff --git a/util/range.c b/util/range.c
index 098d9d2dc0..782cb8b21c 100644
--- a/util/range.c
+++ b/util/range.c
@@ -20,11 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/range.h"
 
-/*
- * Return -1 if @a < @b, 1 @a > @b, and 0 if they touch or overlap.
- * Both @a and @b must not be empty.
- */
-static inline int range_compare(Range *a, Range *b)
+int range_compare(Range *a, Range *b)
 {
     assert(!range_is_empty(a) && !range_is_empty(b));
 
-- 
2.41.0

