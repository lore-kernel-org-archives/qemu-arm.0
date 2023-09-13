Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2607190ejx;
        Wed, 13 Sep 2023 01:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED2pmrzH2cpbZMreFefNih5GdR0/Q1Xdr0Qs4aHXLQVQvB+9k4qrxI/QIlhliMYqVlI7it
X-Received: by 2002:a05:620a:1992:b0:76c:ae1f:201e with SMTP id bm18-20020a05620a199200b0076cae1f201emr5208038qkb.27.1694592325281;
        Wed, 13 Sep 2023 01:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694592325; cv=none;
        d=google.com; s=arc-20160816;
        b=OClvJvHk2hElvRfd4pNixHSYfGuRkmaBeQsnHQRzWymTm3v3CmFcL7IaKX8X7bXVqG
         eL9fmt6FReYWn1NP0/szr7GImRFZXeur5KqmhvPDGMezvINr8lyx9YWPcVNKPLsXBsu+
         NVwkQzwKJaNHqBBPZBfAy9egaG1NK05NwE58S2mUNCyaOoOV74BTqR8edNFu4fPDLOJo
         dUwrlLc3oP1tEYIKM97pmSR2yEA6CW74EQC9g96qqtVkECvjq2OQIoWqf8iT6W4A06FZ
         EP/jcKZW68k+moyjhsAs9iplQsRLYUFNigSweXp1FCIxmP2FnuHciri7uY2iD15l52tU
         zvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HdmV9ueHxxGVXSlCC4etU2fbTRvEGXHX+VmNcHV7DUA=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=hPzO1ZRhJp2edyRMjqJAK7LLLiCnhVq7ao8jtkI9xsUwInHrQd9OWBGApPo5Gt4d4q
         hbGqDwx6fCz5hJFTjSkgh0ztpt+wYvJ0LD0+0TxWBXBiZz5LOOIFpSXN3BW44XusKwoN
         7p5CsarxwUWln8qiSvZW2j4zg0E9K1Bs8jgQSKzdi65XKcBkiMPXx3LEAHo+Z0aHWyrs
         I9CJyXALov2oeLdGSeelC34X/cbBxsxv8hd783qQKlL1yEwJhG/oVG75dty6OQpzOuqU
         iOsFEaMNOS8eaqnr5V8STqJYtVaOK1em6i+5kpKhchH4kERU24nZyx80WCYAsewOA+xg
         z23A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3c29hAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl39-20020a05620a1aa700b007680f009115si7317298qkb.393.2023.09.13.01.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 01:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3c29hAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgKrq-0000vs-TV; Wed, 13 Sep 2023 04:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrp-0000v9-N8
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrn-0004n7-Me
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694592295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdmV9ueHxxGVXSlCC4etU2fbTRvEGXHX+VmNcHV7DUA=;
 b=G3c29hAjSFhwnc5l9o+evHB7u7Rfgjv3gNWm1y8gPbWHx2Xx8WsG7E3FLeValrRxZkuljZ
 xtcccBwfFMIJooy4exP+E0abBIY1UlXLtTrJxCC/xKdqW73uxOdqqRGz/NgsPhY0vgiVFl
 Rk0MafmUrr3pJDVF755JSMpIgaWHorQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-1jHFQKI8P8WesyDkFSZjRw-1; Wed, 13 Sep 2023 04:04:52 -0400
X-MC-Unique: 1jHFQKI8P8WesyDkFSZjRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B64101FAA1;
 Wed, 13 Sep 2023 08:04:51 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E583B2026D68;
 Wed, 13 Sep 2023 08:04:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 08/12] range: Make range_compare() public
Date: Wed, 13 Sep 2023 10:01:43 +0200
Message-ID: <20230913080423.523953-9-eric.auger@redhat.com>
In-Reply-To: <20230913080423.523953-1-eric.auger@redhat.com>
References: <20230913080423.523953-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: urBX3AlHA49F

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
index 2b59e3bf0c..dfe7e58ff9 100644
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
 
 /*
diff --git a/util/range.c b/util/range.c
index 4baeb588cc..19402e45aa 100644
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

