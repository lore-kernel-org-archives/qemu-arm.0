Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4680103lfp;
        Tue, 5 Oct 2021 01:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN6hxpu52VYNIbVfz7NrY8BAHjPmd9H6S4nGfjVi7QWSGLm7sFEC+hniWXNrId2rYtfA7j
X-Received: by 2002:a25:4843:: with SMTP id v64mr20452624yba.210.1633423804255;
        Tue, 05 Oct 2021 01:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633423804; cv=none;
        d=google.com; s=arc-20160816;
        b=BlZjj4tVTM9hVDGGQJPoHLQcqscVaB8130nKm4dCnYJiXGQdxqX3RAtR92TDMGiPls
         I2LLcuhtWHxapNXpOk6XjzsYlJN2oFs9fE4dCu8opPvlufI4oj+75ZSSvbFGlGjseVKj
         mZWmYQYuEoSviCg70ld46cVMUvRTQ0uJOLiw7ub/1XeXVOCbU3aMFIESunvsN4omkfuG
         Q5gbOmqSp/r24um7LMFl5cjuiveqZhDTpnLYCQcVoPwfxgtAoMyLeLyrOoj7eEHsXsUd
         hyCzLnGNhy3sH4on7ihUSGR14zd9tpq4YTVfo6Yq9y6h/67UST7WnQtsV0PSkS9U6ywZ
         +FDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xxbcbYrr8mcdxhldwuyCdBQ0jl3AR8YOgHyhEkx2LDE=;
        b=GoKGVe92rXdFBdq3RjqznvBYJr5jSrqzu7UH1rtFFoZX46tNX9r9ImekqcYbMcZtgF
         BH/brWGUjSHKQIYhdHGj85t6NBT9sUJg20xuziVryzNfm/8JnVYq+mRCZZBqElOz2Ujv
         nn/t40ToKo+oBGVczXrG0YXHE7Pb1MDAWB1k6D0p5qrnemgBEEpExsxLKOlwL2GbcpI8
         kKGz9wRQOwigheynkmTTcQY3QWtGSPD55BArML1/VmjEDWuuMisAoYYcV8spF6zj6nw3
         E8BSAPDg/xL7XTFdi+mMqZvoGtbTWfh1lr5949gBidAlqnyRUdIhB1DILJAkMXOqgMtH
         1e3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BV5SJIgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 137si20360878ybd.74.2021.10.05.01.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 01:50:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BV5SJIgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXg9D-0003xl-MQ
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 04:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyz-00010i-UT
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyy-0003eB-CZ
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxbcbYrr8mcdxhldwuyCdBQ0jl3AR8YOgHyhEkx2LDE=;
 b=BV5SJIgHHc1kTUAUFaOCu/5XKBGdV/F9j1ckXo4l3w3DpQCmwu5PrAVvlD4knxys6/iv9G
 UGxBJR/U5WBX7/pr3KUo4dvtQSFvrgJ3yf77TBJCjiODVF+mTKKHmO7j1YrGPDeGw1T/vi
 i4e1JXfnE1HFEnfCAvEbpDOqR67dee8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-o6Ij7X4ZPSec8FE8QWRYtA-1; Tue, 05 Oct 2021 04:39:26 -0400
X-MC-Unique: o6Ij7X4ZPSec8FE8QWRYtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 515E1802935;
 Tue,  5 Oct 2021 08:39:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039239AA20;
 Tue,  5 Oct 2021 08:39:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v2 3/3] tests/acpi: Generate reference blob for IORT rev E.b
Date: Tue,  5 Oct 2021 10:38:05 +0200
Message-Id: <20211005083805.493456-4-eric.auger@redhat.com>
In-Reply-To: <20211005083805.493456-1-eric.auger@redhat.com>
References: <20211005083805.493456-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
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
X-TUID: h/tr9kWugUQI

Re-generate reference blobs with rebuild-expected-aml.sh.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
 5 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9a5a923d6b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

-- 
2.26.3

