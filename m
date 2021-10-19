Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp153138lfc;
        Tue, 19 Oct 2021 01:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYW4WEV8cuHBSDRZauAsVEXBrnWZq9kRfdPKbrsXad5IEWZRYLS5iO9k1iDhjCZnKi4NvM
X-Received: by 2002:a05:622a:51:: with SMTP id y17mr36268641qtw.149.1634630999305;
        Tue, 19 Oct 2021 01:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634630999; cv=none;
        d=google.com; s=arc-20160816;
        b=pD6hr/XqA5iDJnvmQQqwFXr1YI1O56Ck1yfXf9RI722QYPZw8kqbc9oCgz8mszBX3b
         O4PmjqekCVek3Q4wmzfvqJ24qumPI/+n5wI+9txRBQECIhTEwKhovU6y3IdKqkdWf2Gx
         uVULtVbZQh6TyorX86B64dQJzTkEg8T0tnZYeossfFD0ZeiKzdOfXdHoJlrAbRNU/DMT
         uRHYjnC81sVfG06Rq/0Mwl2MehlggfAGc9FsYNvmVb2bYhrsKuXyBfD5B0Ol3zCMttCV
         2Rf9s0/pBV9sKzjVWB+RTAue8mfDb9fUilOByp11olXVQtlH6a+JgCkOIUVVIZ4OeTkN
         RJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mtIVNxH/qHqhtGIlCEl8Re6qmAnd5PUQnSgXbKE+CD4=;
        b=PH+TutER5fHyFhE41te/Y2XJAoKh5yvoQUABZMm/XNlJ7mDo70scIYlnzRsLp+jXKN
         C5X9Wj/FJ3YYWdcSO+HkUNxVyvB39MWMW4e5rgBGiMgNAfXYIqh8+AOQr8nltGS48UFq
         4klNwm72i7+UPojXfadMEAaxXZg0+s4MAAXCjZkk/TtUkVXOpDf6drU7lrrfZl6sF+Gg
         uI7GYgj1lqHQydBEVfQ/Z0f8AnU1Q2VtqauFEe//NPBY183MXGJsgM9KiyUKUYEy2CPF
         tbPTLodn27fXHQgEIWuZR0Yb7B2v+zW6m2P7jpzCRCb/eyOdFw2vnp6egWQ32PJTnGra
         72WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dXquyv/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im14si665687qvb.49.2021.10.19.01.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 01:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dXquyv/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mckC6-00008m-FX
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 04:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck4a-0003Ht-4C
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck4X-0002Ab-A4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtIVNxH/qHqhtGIlCEl8Re6qmAnd5PUQnSgXbKE+CD4=;
 b=dXquyv/AY3bwH8cPqdAiLYSdzomKkbKirdekSeFtMIiKC3G5wO/56G2iga6q2QEMhO5Lo+
 Ic6CGOx86+h9L4itK7pK5EPS0/f2wHoldn0iuasRuTtzCmMe9Eq1cRfXtNAbN3hHLs13HM
 A7oGwoTU9Ey3cKRDq0sTig1YWb/AH7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-rBLh-65FMC63iNbJQ7fHYg-1; Tue, 19 Oct 2021 04:02:07 -0400
X-MC-Unique: rBLh-65FMC63iNbJQ7fHYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0E018125C5;
 Tue, 19 Oct 2021 08:02:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 274F95DF35;
 Tue, 19 Oct 2021 08:01:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, richard.henderson@linaro.org, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v5 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
Date: Tue, 19 Oct 2021 10:00:37 +0200
Message-Id: <20211019080037.930641-4-eric.auger@redhat.com>
In-Reply-To: <20211019080037.930641-1-eric.auger@redhat.com>
References: <20211019080037.930641-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6Y8XbHMokdQ

Add the DBG2 table generated with
tests/data/acpi/rebuild-expected-aml.sh

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/virt/DBG2                   | Bin 0 -> 87 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98 100644
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1910d154c2..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DBG2",
-- 
2.26.3

