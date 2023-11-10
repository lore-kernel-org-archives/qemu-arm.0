Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1039186ejq;
        Fri, 10 Nov 2023 00:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl3V0yfbsy3wFAJ/BFIM/uMfCXE5F9BhXbXOGM2c+ygGtljqczeRjcpNMV3GhQg39lA2w0
X-Received: by 2002:a05:6122:4e21:b0:49e:1eca:f849 with SMTP id ge33-20020a0561224e2100b0049e1ecaf849mr4445226vkb.13.1699605435284;
        Fri, 10 Nov 2023 00:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699605435; cv=none;
        d=google.com; s=arc-20160816;
        b=oRCjVe6Pj76K+qgRtfL/H8sInfErxywzaF595db0RMERajLF8/CnGN0hMIJ3FDwvJV
         0AgGURQ1ww5NjKNczBQNteRlXIht9GguGUHTj6pphmBTc9TbxwgFH9psGZZxM+M6DQCe
         Vqb62e/b9lgT8+Xf/7EDqQ/ORJ+LfYCMuSQD3knQR3MMybSSBO5p2UZmMFmBGKXV+dIK
         D8+DaJ209pFcq4QPb3SPc5IeZNg1drARdBb54JY8tP1ZhtmIIshYu+ZHiFu/WhidP3Hx
         wHeRTXt0xy+SvD0PeMFqtXd7G2TyrDyS0Orygp17kSecXSVwrhP343WSOnp6StESLIcF
         T6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/48ObBUAedEyPRpgtsOuL4Ztg+DGbSyrmAPAkGMsBpg=;
        fh=wvE75R8K7StshYDYoCBQZS54o1uS7pCyBaULH42g0uw=;
        b=WPAr75q16G3Bz79LlnPgkKxa1iPVDnjbe5tQhfXRCTpRBo9mCWKAjbPWxlFNdQqhVq
         C8KB5PRgmr+9h5kMaP+S/FKUgXYyb3YSJlf5KofTHJwWI0G1DAoWp/qMeIUnVQYOq5V8
         YTgzahhYmNaYLuzShp6rSGEoI4X1EBHJGS7z9OCoH5I8zgwZy7119sDGjtFll6n4O0H7
         bEcYVWA9wuwk9M+vAIw877bibcWERu5dBX4n6YkA/RQkvA0ZGq92IYObs+YABr3xSkNC
         ZsbPC4KIANHFX4JY++E+1cojSdbNiRT0nqT9Kz7flJ0TJV0pinYLTZqaPIJRGr5FRHYf
         iujg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFxu2Fkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a05622a065000b00421b4686cfbsi393084qtb.489.2023.11.10.00.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 00:37:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFxu2Fkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1N0n-0004PT-8h; Fri, 10 Nov 2023 03:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r1N0l-0004P0-Nz
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 03:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r1N0k-0002sR-CW
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 03:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699605425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/48ObBUAedEyPRpgtsOuL4Ztg+DGbSyrmAPAkGMsBpg=;
 b=TFxu2FkgbpyiHWQSQ2WbSJultY/Ek+Y6yKg4hZvLJMiCkCRv27Ze533ABUzObzmqLhaGKM
 VyY09mP1JMTqKTaEm5DWqMZ2ixuNOQndWtQQUnM0+qRCPaJ36OIV5BHHQoRVgseMJKxtO0
 QosSXsya3BNQpck2P8hALnZUgfjKijI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-UtbcqoM7O1WJI2gHPw4Ghg-1; Fri, 10 Nov 2023 03:37:00 -0500
X-MC-Unique: UtbcqoM7O1WJI2gHPw4Ghg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F67D811E82;
 Fri, 10 Nov 2023 08:37:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C45492BFC;
 Fri, 10 Nov 2023 08:36:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: clg@redhat.com
Subject: [PATCH for-8.2] test-resv-mem: Fix CID 1523911
Date: Fri, 10 Nov 2023 09:36:54 +0100
Message-ID: <20231110083654.277345-1-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fShsaGJTsiIT

Coverity complains about passing "&expected" to "run_range_inverse_array",
which dereferences null "expected". I guess the problem is that the
compare_ranges() loop dereferences 'e' without testing it. However the
loop condition is based on 'ranges' which is garanteed to have
the same length as 'expected' given the g_assert_cmpint() just
before the loop. So the code looks safe to me.

Nevertheless adding a test on expected before the loop to get rid of the
warning.

Fixes: CID 1523901
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Coverity (CID 1523901)

---

Hope this fixes the Coverity warning as I cannot test.
---
 tests/unit/test-resv-mem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/unit/test-resv-mem.c b/tests/unit/test-resv-mem.c
index 5963274e2c..cd8f7318cc 100644
--- a/tests/unit/test-resv-mem.c
+++ b/tests/unit/test-resv-mem.c
@@ -44,6 +44,10 @@ static void compare_ranges(const char *prefix, GList *ranges,
     print_ranges("out", ranges);
     print_ranges("expected", expected);
 #endif
+    if (!expected) {
+        g_assert_true(!ranges);
+        return;
+    }
     g_assert_cmpint(g_list_length(ranges), ==, g_list_length(expected));
     for (l = ranges, e = expected; l ; l = l->next, e = e->next) {
         Range *r = (Range *)l->data;
-- 
2.41.0

