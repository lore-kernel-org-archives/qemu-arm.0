Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2607450ejx;
        Wed, 13 Sep 2023 01:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx11DOIud7Fgm1liEcUDpma59ZHooTC9cZL0kpSN/84MfEj49D8fk3+k32+joWnVEcmL8/
X-Received: by 2002:a0c:a80a:0:b0:651:6349:fa7 with SMTP id w10-20020a0ca80a000000b0065163490fa7mr1462021qva.25.1694592354271;
        Wed, 13 Sep 2023 01:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694592354; cv=none;
        d=google.com; s=arc-20160816;
        b=gCOPVbgcevkb9JjNBFuqxquVLvqwAi498TAkhedmj4Dq1txcwrxU0PnINFXxfw1tkq
         5h2jC2pzz7VSSXmKUt8OgxyDy9uo4SLrwAE1ikU0HAJOue2oeZPG2Uq4thJjIRCJrAL3
         D7oQu708k4LAt9FSRyvCUZGkg2vCeVjBTgK5vblZmBRvCaKCrQCWFXN5BTAOdDCpCS4H
         jT3Nmk/rlrgLp1yjGDFZZyTlU6PoDI89OHiKfF7Rq43OuqvC00urOBOrr9BXcjs7G4pi
         B9UhE8CZtUFVhSt3ltfLeoPVQGR/qvZkVB8X4c0DT/Iq0T0shHyaCCAjgaAohNNv36Jk
         3yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R2lVeIef1hbTmeC1q70QMPD0uEK6J6II9o/yF0r+lHE=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=ayX86qZXGIkx7Tz3d1I6O/JF++LqfhtEzsMieQUwUoDQoG+TINBhUiS9th5fUlySJg
         EJ4R8LrXn0/IdfbllOeU6DXk2YpuJ7unL8oezM51IVUeddbU8DwgYxJNcHDTpnmaCzjs
         L8SbGzof+p5ZiFcVdxdHDZAGmlWmqSSlni3zJsPmTS8dqgfzOWXOhfPMnsVppGyMEE6h
         5J20k+/tFMrBiJ9MKc7aQiqqWesbwDr4XwPLuhQFPL7Xdya9NxotHpY/TCyVu0iNR7/k
         CwuzNOiKZvHOXk8AjjEvZ6FLoJ5HPVTs7wlNpxden9OQ2uHrdgGRXJMukQ1OIVB848Wh
         tjiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N51xb6nQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020a0cb3c1000000b006490c267f9fsi6804460qvf.528.2023.09.13.01.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 01:05:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N51xb6nQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgKrl-0000th-UV; Wed, 13 Sep 2023 04:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrk-0000su-Ph
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKri-0004lN-8h
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694592289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2lVeIef1hbTmeC1q70QMPD0uEK6J6II9o/yF0r+lHE=;
 b=N51xb6nQgMuKVTMex+ouV6uyMRNabB15xEZ+9rsQJ/HzRdJc5qFxvYgDW6XEXUHWicOIGh
 Z2tK3PQiYt50lr5HiTZb7KkXK9+RZS75cu9u3PTaY99jURu8vfvQkG8BPjpIkUAqnry8Sh
 llaIdvJxizxF1kOh5OOjf+7CSWgnW7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-x8gOLFrtO-aAoSIRhyZSwA-1; Wed, 13 Sep 2023 04:04:46 -0400
X-MC-Unique: x8gOLFrtO-aAoSIRhyZSwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03036185A79C;
 Wed, 13 Sep 2023 08:04:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 994C82026D68;
 Wed, 13 Sep 2023 08:04:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 06/12] range: Introduce range_inverse_array()
Date: Wed, 13 Sep 2023 10:01:41 +0200
Message-ID: <20230913080423.523953-7-eric.auger@redhat.com>
In-Reply-To: <20230913080423.523953-1-eric.auger@redhat.com>
References: <20230913080423.523953-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: iqG+X0yjM6BX

This helper reverses an array of regions, turning original
regions into holes and original holes into actual regions,
covering the whole UINT64_MAX span.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- Move range_inverse_array description comment in the header
- Take low/high params
---
 include/qemu/range.h |  8 ++++++++
 util/range.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/qemu/range.h b/include/qemu/range.h
index 7e2b1cc447..2b59e3bf0c 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -219,4 +219,12 @@ static inline int ranges_overlap(uint64_t first1, uint64_t len1,
 
 GList *range_list_insert(GList *list, Range *data);
 
+/*
+ * Inverse an array of sorted ranges over the [low, high] span, ie.
+ * original ranges becomes holes in the newly allocated inv_ranges
+ */
+void range_inverse_array(uint32_t nr_ranges, Range *ranges,
+                         uint32_t *nr_inv_ranges, Range **inv_ranges,
+                         uint64_t low, uint64_t high);
+
 #endif
diff --git a/util/range.c b/util/range.c
index 098d9d2dc0..4baeb588cc 100644
--- a/util/range.c
+++ b/util/range.c
@@ -70,3 +70,48 @@ GList *range_list_insert(GList *list, Range *data)
 
     return list;
 }
+
+void range_inverse_array(uint32_t nr_ranges, Range *ranges,
+                         uint32_t *nr_inv_ranges, Range **inv_ranges,
+                         uint64_t low, uint64_t high)
+{
+    Range *resv;
+    int i = 0, j = 0;
+
+    resv = g_malloc0_n(nr_ranges + 1, sizeof(Range));
+
+    for (; j < nr_ranges  && (range_upb(&ranges[j]) < low); j++) {
+        continue; /* skip all ranges below mon */
+    }
+
+    if (j == nr_ranges) {
+        range_set_bounds(&resv[i++], low, high);
+        goto realloc;
+    }
+
+    /* first range lob is greater than min, insert a first range */
+    if (range_lob(&ranges[j]) > low) {
+        range_set_bounds(&resv[i++], low,
+                         MIN(range_lob(&ranges[j]) - 1, high));
+    }
+
+    /* insert a range inbetween each original range until we reach max */
+    for (; j < nr_ranges - 1; j++) {
+        if (range_lob(&ranges[j]) >= high) {
+            goto realloc;
+        }
+        if (range_compare(&ranges[j], &ranges[j + 1])) {
+            range_set_bounds(&resv[i++], range_upb(&ranges[j]) + 1,
+                             MIN(range_lob(&ranges[j + 1]) - 1, high));
+        }
+    }
+    /* last range upb is less than max, insert a last range */
+    if (range_upb(&ranges[j]) <  high) {
+        range_set_bounds(&resv[i++],
+                          range_upb(&ranges[j]) + 1, high);
+    }
+realloc:
+    *nr_inv_ranges = i;
+    resv = g_realloc(resv, i * sizeof(Range));
+    *inv_ranges = resv;
+}
-- 
2.41.0

