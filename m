Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp526237ejb;
        Thu, 19 Oct 2023 06:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKZXhEReo3LTIxbX4ZhRWhw+MDAD8fp9eExZNw5qNn49OWJqIXqusB032I44RBIZqG4zJn
X-Received: by 2002:a05:6214:3007:b0:65b:22cf:101e with SMTP id ke7-20020a056214300700b0065b22cf101emr2390078qvb.54.1697723270683;
        Thu, 19 Oct 2023 06:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723270; cv=none;
        d=google.com; s=arc-20160816;
        b=hIpYMs5nsF3znkJ2x7edULGpv+SDu1FSny26+7FoT4BzwjO+ZDKEbbVBzMQ6WTg4ms
         Mue3Gqug58Ik8QRXkIiBAtLwo1y+WPuDb7S1rk2q+X87hf5kBfsXSRwpOttJpPc+0yih
         qUAELU7NTRTQDPXyxUEGt2GRQ/v+cOtFiJonOUOMlwKJlmD1rVT5vKVeFXKOp0cIF9PK
         gnhhfUKqmwy2nUKYkNNOoEzB7wPjB1fmmvZBpU8/xePI0CiOm8BdtGH1bTEE5l6RqveK
         2ZXR3/rSJPbYh+laLgBwXaAvTfq79HVO4y4UY8FW4WLOxiZq4R5Zy/vG7bbIK+naIRwa
         w+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dPAnm5/3g206LbH2PuyKPpEUwRZ8C/v8XX4B3RVheHo=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=hWGJJcfiAPouQ4altkSqxCsMdwrMNfx2Qyhc0kLS4QUtPTOnjQRXdyIrk46pgdgnjL
         AarVlv80Ky6/7Mf8FbGVThNN3C75/k7dbLnVrU4Fjf3oC7sdu8hn03jQeKcek+sBLdzz
         CXJ8V6CHb0mFbjCHva3RVXDbqZj9l1TefY+K3Xg/uPqQl47vN2+XJ+j9d29TTr4JsGan
         bx3dLSvhGDdgBTfa90XUZgRTYgfB5MmOXBy6Rum2TnO+KlkiHmahSLNDBAxRXz9bZ3jz
         eZ9t6zVu0IgFolMj4H9HBw2mUjn8nZqzO/OBdYM8AoDMkPRnVX1UYb9eVInKdb3Cy+ML
         hSjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmmlTOiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu12-20020ad455ec000000b0066d1385b824si1538908qvb.544.2023.10.19.06.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmmlTOiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtTN3-0001MK-SJ; Thu, 19 Oct 2023 09:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMr-0001Ef-LS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMp-0002rj-2C
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPAnm5/3g206LbH2PuyKPpEUwRZ8C/v8XX4B3RVheHo=;
 b=dmmlTOiXwJybWsL0eE/7h/dbCsf+0IHM6oY9u0SYSXyS2Kn9eUJsE8VfGei7ssJbg6QW0I
 Dj+wSeoAZwcqfvjqiFyN867UlwNJWXEMKMWhup7N/Ucp2piAYmsSKqoiU3CZb7SBEdhZvk
 s0u6G06mhKgAUBbeAw8xIjmOh8e9tRM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-cNz_IM5sMS26SqIDnvSN8g-1; Thu, 19 Oct 2023 09:47:12 -0400
X-MC-Unique: cNz_IM5sMS26SqIDnvSN8g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 419613C0CD47;
 Thu, 19 Oct 2023 13:47:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51387492BFA;
 Thu, 19 Oct 2023 13:47:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 05/12] range: Make range_compare() public
Date: Thu, 19 Oct 2023 15:45:11 +0200
Message-ID: <20231019134651.842175-6-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: K6+Pr09MYwDE

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

