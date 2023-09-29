Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3286844ejc;
        Fri, 29 Sep 2023 07:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPlS2nPrubT0w2R7FWmYy55nFRYrJ9S4zd7AuqlvMQRPvc8clTvtBA+O9RTBUn86twGUm5
X-Received: by 2002:a0c:b450:0:b0:64f:5261:55e9 with SMTP id e16-20020a0cb450000000b0064f526155e9mr3795784qvf.41.1695997210885;
        Fri, 29 Sep 2023 07:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695997210; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ0N357RRIme2byl4RFr5SMlTpyYd7R2b+PRshxHyiGwJRSAcLvJTUhrlTafiSqCZB
         M4IHfswAABwcsO2JUW4wz6O29AhRz+obyPIPTKexre62LjaQFwSITyWYbqmUEtdiFvV4
         A5caWc3t+JZ1Q+3DOLXbaubIMD2dqhvRIh72TC9aXwu7Fxglo/2NZFcAi5e2+E94X+cq
         k9g1dW8+hLXBi0pQWG1Xppqhcuk2VdnUjV+ARQirPtLqVK1G/trTa/5PYFbeZvBBf1Eg
         j3BccIh5KamwfUDOpdkRcGu7oZ0x8RhrwCoh1khRqDBvAff6qajJ2+Xo1Fc3gaUmD1H+
         ucYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=iqYMIamWrP/SmmBX8/AGSzxUrEhRLkqiXJbY7Cy23Q8=;
        fh=Ysy7t8O+fry/ymUDYZ8IczikU7RxRRP/XvHju8YI/zI=;
        b=ptIrXSiJw9R7L5LQEYnMAYAKIhQCRozer+nBoMxYsz8WeEVuMWguM65g5NEuBEVI5O
         Mk/XePFerGXHmgwQ8ikETWlyKvCOiCQBemj/8hwQfKEj5cQTLuy4p/0sSGfgZ+Qa8gF2
         zVa4SX2Hs/nTnmxQ51qNnswIZck/AiAPmv232sh1rAAAqIKGDKbQwHeADwe7D3h+/xN+
         Ifhmv5d1Pts18hMXvFG6J81MNXCcx+G06ni2VYQIzylqzFuvKiyeZXl4Ad8JZp4ipL9u
         fJIVdsza4B5++XGSOQ9C/KJKwbDthE+tCpbaDGgpA+JwEgxthXxDVoN0VbFTg6gOaIst
         0EyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lbrr/oRb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a0cb38d000000b0065b05c4da3dsi5741657qve.561.2023.09.29.07.20.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Sep 2023 07:20:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Lbrr/oRb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qmELA-0004lS-6r; Fri, 29 Sep 2023 10:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmEL9-0004l6-3T
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 10:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmEL1-0006Y0-9l
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 10:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695997165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iqYMIamWrP/SmmBX8/AGSzxUrEhRLkqiXJbY7Cy23Q8=;
 b=Lbrr/oRbAHq5PordVA4eaLn4t+OVEbeNXPZCBmKm2ByHD8MXjpWOFrPU4xKpTTEdk2DtNb
 Q2As60gF6z7h6EKl1hkfRghIlfK+8JPqKvK0QOGSFeT1W42nxvcNf/YNpEdPECu+I+Ht9q
 /xNlbnQf1NM7QCZ8qC2XoRQYVxUUZ7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-T82n9d5mN9uZFysUu7E65Q-1; Fri, 29 Sep 2023 10:19:21 -0400
X-MC-Unique: T82n9d5mN9uZFysUu7E65Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECFEB811E8D;
 Fri, 29 Sep 2023 14:19:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E5582156702;
 Fri, 29 Sep 2023 14:19:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF section
Date: Fri, 29 Sep 2023 16:19:18 +0200
Message-ID: <20230929141918.397096-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
X-TUID: FFph1yyYZs3P

These files belong to the sbsa-ref machine and thus should
be listed here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 874234cb7b..fc415d3cea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -954,6 +954,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
+F: hw/misc/sbsa_ec.c
+F: hw/watchdog/sbsa_gwdt.c
+F: include/hw/watchdog/sbsa_gwdt.h
 F: docs/system/arm/sbsa.rst
 F: tests/avocado/machine_aarch64_sbsaref.py
 
-- 
2.41.0

