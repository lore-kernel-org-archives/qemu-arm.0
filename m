Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1175851ejb;
        Mon, 4 Sep 2023 01:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCRgWRuG32yHU/RnHU9AV1HtEfS17knlF7VVMmUzvDSwiNr3NBs4ywqbnjKUrPMiQ5CtsN
X-Received: by 2002:a05:6214:21a5:b0:649:a662:ce3b with SMTP id t5-20020a05621421a500b00649a662ce3bmr15006085qvc.17.1693814861109;
        Mon, 04 Sep 2023 01:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814861; cv=none;
        d=google.com; s=arc-20160816;
        b=Hlxo8i2tVlJ2/woyIyvMAq+WKQKxuVtId2zJHsy9VTQ56qUsQR3akFg/0BUdtrsSiL
         GwdqVUBZUIyTrDEmrYaK2zlazYVr+FKtVGUkirxQo0ZVQfNIdcpcFYRFl35yk3mIOGJn
         Q3bMda1a0YwTXUvkfcmRpMd58QVFpfkLyxAx2Qb+dGwHMahlNUBD75zYaox55NE2XpqM
         R+uCUKko0NALb7tEpvSQxCGo0uyRdu3zk0o9iX92vqtfodBUDziIx3Ns+zNVLRCGHT6o
         0rKNs8m1p1DCyQZw/7b6OSsa1YgmvExVy22TBxxqp+h1y8K3wuBSUqUsrTur78vr6wld
         /dZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k2oowtsVMHgV/gX0BOO0dY/1y0XnnvK0ZYYn6+GB3/M=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=z+leI6HarcOLnwk1NDZ9NPJxEab4NQSqHfLunsV3OPr0nRAszGgTKwEzQPYJ8O/4Kw
         +REm/iXW+jcqLXtILA3pHvqFIwiz4jLqS0TUhO2H0+1l6iR0f25Fr5MziV3rJffqBppH
         HwGepRTWPGteyn4OPeTM70+OB3SaAUZmELfKYayaiszjAHAhQ6zBGFxstV7JevgaEW6J
         A7B2upKh0Aw7WRcV2yTJzmt11poKDlxRO7rdUtqui48y+pMHfsPq6lavtJ+UDr5Lf7b7
         unPMjUHbzy0rWnbmm+jPzVkUv3G98YPjhnu7GhPQJ35JkpzZCaBheedAGxDYLvYFJTyu
         XIfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3ci9UHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a0ce110000000b0064f45b8c035si6014610qvk.374.2023.09.04.01.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3ci9UHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4c1-0002Fk-SU; Mon, 04 Sep 2023 04:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4by-00022k-78
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bu-0006XD-HK
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2oowtsVMHgV/gX0BOO0dY/1y0XnnvK0ZYYn6+GB3/M=;
 b=G3ci9UHYBHdphjoI5VilKRQIIRNDsR/vaM5w+80TwiVLbK0RxPIYoRf37Pgxnj1pXn++0y
 1ajtu76SmOUPJj5aP5uXodTINGeWQdSMqH9roZwD6y7hD2S3z7YYvzRH1QMC5ser/VkEBT
 RbdEJAh3eR4ygNvkDB/z+ky36J9kYyk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-_0rgm7GvMgSy4SMH_2zrvQ-1; Mon, 04 Sep 2023 04:05:21 -0400
X-MC-Unique: _0rgm7GvMgSy4SMH_2zrvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F36A8EE7C5;
 Mon,  4 Sep 2023 08:05:21 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28AD440C6CCC;
 Mon,  4 Sep 2023 08:05:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 08/13] range: Make range_compare() public
Date: Mon,  4 Sep 2023 10:03:51 +0200
Message-ID: <20230904080451.424731-9-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SVqMLxk59Mbu

Let's expose range_compare() in the header so that it can be
reused outside of util/range.c

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/qemu/range.h | 6 ++++++
 util/range.c         | 6 +-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/qemu/range.h b/include/qemu/range.h
index fc1d3dabe6..52641dfb79 100644
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
 
 void range_inverse_array(uint32_t nr_ranges, Range *ranges,
diff --git a/util/range.c b/util/range.c
index 11c4ff0b78..1fc399e88f 100644
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

