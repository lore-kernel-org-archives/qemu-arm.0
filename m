Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp527128ejb;
        Thu, 19 Oct 2023 06:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHOsIR1y86Q4+P30yp4NxIet+QDGoVVNg+c4gIPD6+jXsXNs3tx3FeC+A9q8MsV2qzY/Ko
X-Received: by 2002:a05:6808:1905:b0:3b2:e34f:349b with SMTP id bf5-20020a056808190500b003b2e34f349bmr2616568oib.42.1697723355553;
        Thu, 19 Oct 2023 06:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723355; cv=none;
        d=google.com; s=arc-20160816;
        b=mYXoZ8KvgI272k/ee6NIgdWEMDElhdzEOgcR+arErhBn29dxbLRR5BGv85NY9uVg8M
         WJZpvG9ADFPLgQ+k8wG1c4Zh7BqDdYFVVpvePfMSVKG3BGbTj1ob6YGQny2/fzsEhPwO
         7A+6v7FqpGWaB8ADrt8qiSZwBtCibkDqyYg9Qjwd9WuP0yZtuv8cTdOST94kXe3ju7Wy
         0CsAn4SaQJWprMqGfYz0rLAOpSV7+a3ezIhEGNkIb4VX4ECkPt6jL0yRHEi9Ge8Ekfc5
         uov5r5jdiqGPFoMLJNxxMn42w6IQUDGqzLm/DMIFu7aZg0f6nV2qOo5fbCS2rc5rrZLf
         yf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+oWWtP7+UlA5ombcc2zrKAwl4HzlVMLz8MbMVcBTDfk=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=A4jFS2APWhnMQh/aaYqYPVNtp9oGaHblrozFegjYDW6KmTTz3DUzD0Bc6edy/PzgV1
         GD2pnHooRqd+iW5KLzrSVCc1Kalt2epuV+/ItcgkUcUwaCf/i4fpiEa1pga81nW2POBT
         LeBOMSPLOQn9A1wgknyDE8ClLUkWnA3evkw2yasuv6M27ZZoaze5OPV4ifcOejExX1DG
         kN2LpJ0FeKf/raXo+JhwOcCFZJpk4xjdcoj/MnP61cd9KoMP5ix7pqiPUv0kk1PbD+Ik
         wMHKAjo3+NnTiKZEIhy7F4jd5XBhNkE5QI7QZIUdCYBz2pdiUugi0/HxQp+Y1K66/Ivp
         slvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XlsnJxmj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020a056214224200b006581f5f151csi1687441qvc.77.2023.10.19.06.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XlsnJxmj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtTNR-0001pd-NR; Thu, 19 Oct 2023 09:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTNF-0001VA-MV
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTND-00031Z-UY
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oWWtP7+UlA5ombcc2zrKAwl4HzlVMLz8MbMVcBTDfk=;
 b=XlsnJxmjQIT9FIPTKD5fAukVKySP2r7F9wShswBB/8qgDpf8Sj+NIcNjzA3CHMLxnVYz8l
 jOuO5DF9vvo4YzDi1dtnBIOClCajtsSVjHc25BnBl85pOha7aBr4JfyY4xpMCg0/qfuwhb
 B6Xx46g8QxXxTYfuR4J2m9CxQhEaQjM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-GVTJcwZnPwe2HHFKndUqww-1; Thu, 19 Oct 2023 09:47:26 -0400
X-MC-Unique: GVTJcwZnPwe2HHFKndUqww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A9F8823B6;
 Thu, 19 Oct 2023 13:47:20 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85983492BFA;
 Thu, 19 Oct 2023 13:47:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 08/12] range: Introduce range_inverse_array()
Date: Thu, 19 Oct 2023 15:45:14 +0200
Message-ID: <20231019134651.842175-9-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GwEUAEb2pOjx

This helper reverses a list of regions within a [low, high]
span, turning original regions into holes and original
holes into actual regions, covering the whole UINT64_MAX span.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Yanghang Liu <yanghliu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---

v2 -> v3:
- now operate on GList's. Fix the commit msg by mentionning
  low/high params

v1 -> v2:
- Move range_inverse_array description comment in the header
- Take low/high params
---
 include/qemu/range.h |  8 +++++++
 util/range.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/qemu/range.h b/include/qemu/range.h
index aa671da143..205e1da76d 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -225,4 +225,12 @@ int range_compare(Range *a, Range *b);
 
 GList *range_list_insert(GList *list, Range *data);
 
+/*
+ * Inverse an array of sorted ranges over the [low, high] span, ie.
+ * original ranges becomes holes in the newly allocated inv_ranges
+ */
+void range_inverse_array(GList *in_ranges,
+                         GList **out_ranges,
+                         uint64_t low, uint64_t high);
+
 #endif
diff --git a/util/range.c b/util/range.c
index 782cb8b21c..9605ccfcbe 100644
--- a/util/range.c
+++ b/util/range.c
@@ -66,3 +66,58 @@ GList *range_list_insert(GList *list, Range *data)
 
     return list;
 }
+
+static inline
+GList *append_new_range(GList *list, uint64_t lob, uint64_t upb)
+{
+    Range *new = g_new0(Range, 1);
+
+    range_set_bounds(new, lob, upb);
+    return g_list_append(list, new);
+}
+
+
+void range_inverse_array(GList *in, GList **rev,
+                         uint64_t low, uint64_t high)
+{
+    Range *r, *rn;
+    GList *l = in, *out = *rev;
+
+    for (l = in; l && range_upb(l->data) < low; l = l->next) {
+        continue;
+    }
+
+    if (!l) {
+        out = append_new_range(out, low, high);
+        goto exit;
+    }
+    r = (Range *)l->data;
+
+    /* first range lob is greater than min, insert a first range */
+    if (range_lob(r) > low) {
+        out = append_new_range(out, low, MIN(range_lob(r) - 1, high));
+    }
+
+    /* insert a range inbetween each original range until we reach high */
+    for (; l->next; l = l->next) {
+        r = (Range *)l->data;
+        rn = (Range *)l->next->data;
+        if (range_lob(r) >= high) {
+            goto exit;
+        }
+        if (range_compare(r, rn)) {
+            out = append_new_range(out, range_upb(r) + 1,
+                                   MIN(range_lob(rn) - 1, high));
+        }
+    }
+
+    /* last range */
+    r = (Range *)l->data;
+
+    /* last range upb is less than max, insert a last range */
+    if (range_upb(r) <  high) {
+        out = append_new_range(out, range_upb(r) + 1, high);
+    }
+exit:
+    *rev = out;
+}
-- 
2.41.0

