Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1110227lfp;
        Thu, 7 Oct 2021 00:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzElJt3obNZOr844E7D4Y8NJeTA3VnWvnvJsbXrc48SnTCV7gJyCRLDT3em0KIHwNFZtgPd
X-Received: by 2002:a05:6602:1605:: with SMTP id x5mr367744iow.35.1633591802222;
        Thu, 07 Oct 2021 00:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633591802; cv=none;
        d=google.com; s=arc-20160816;
        b=hfzjyIHcMwWqreBDVHVAujfo/I+zWg2S0EyT9Sr0H3Fz483EGdJ6Ugsxcg12jNNe9d
         kHLyvROu1fyJSkdx7NVwShY+2QkHSGQGY4RorMlMDDbqNsaRo6bHKwx12Ui1s5XDZwga
         mPhJ8lVLV2sx4Us4bgTDBOFf0HI94xaBjhyu6jclAzp/FwZH2e1UGvHaB5F9Ru0Id3AT
         MN/BwmBAYtZj7cG4ErdbDjbMGXuf49u8+HgZBl5gXkJ+eawnw1IVgTnKFr0UkkyjI6C5
         0LXA18sjCjobOxdpG5BlVL7yff+wrhqb5L2D38R9XJaeoOgr2d7nCvllKIGN+vGlnKJe
         SHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bM3cMotIMIofTfKKE5PUDnBdYsTdWkm6JiJ3Kx4oT0s=;
        b=zD++bFnv0Wf75zJlrCtLIFfHGfOBIh/4aOZqaKCVR6on78xLE7/eMPKtLfl+mor4YH
         kQKej1xBu/zDCmwooSycA+vpVZ3UlBoDUDc68Pnz9Ks6o5QtBlZyMxh0usWvaMUSCHAY
         N4BBcAS1FDej6R3FoUoreJ+IOnI+UCOqHVUZYAn79wjRiP0LpyPiN535x36ZHsFys+v4
         tqlkpsZ0gAGbkhswDKgvXwTCoSzgbqREdON5qivu/ynhjtA9eOT1Q0/1zcG+2mY2Veyt
         LnrFXviiaE3L5o09utLCi2ObEOKtRi/axg9NYKI32KbyL2KopSdQveF/S7sKJxosMKyn
         V7Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YUGr+Qs/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si12725056ilv.34.2021.10.07.00.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 00:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YUGr+Qs/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYNqr-0007JF-FL
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 03:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqd-0007Cf-4r
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqY-00020b-PM
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633591781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bM3cMotIMIofTfKKE5PUDnBdYsTdWkm6JiJ3Kx4oT0s=;
 b=YUGr+Qs/2sVW3QsBzMr+Nq5sNQXtiXLnJTL9AqffBn3J9l+iOtLbC/ouQFItODs6LqY9VI
 1lZl1TPx2Dn8rzxPq/uyEiZ8Ho/r0vY7ZpFWY3qxVAlFiw+6a0444nRwSREK35pUYBhszy
 0qx0S0KwBBgzrKsLu3LNBN21xCj+gQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-AbbksK9NPMmU1W7ygOXa6A-1; Thu, 07 Oct 2021 03:29:40 -0400
X-MC-Unique: AbbksK9NPMmU1W7ygOXa6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27FA719253C0;
 Thu,  7 Oct 2021 07:29:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6243610013C1;
 Thu,  7 Oct 2021 07:29:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v4 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Thu,  7 Oct 2021 09:29:20 +0200
Message-Id: <20211007072922.655330-2-eric.auger@redhat.com>
In-Reply-To: <20211007072922.655330-1-eric.auger@redhat.com>
References: <20211007072922.655330-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ls11qBN3OWhy

Add placeholders for DBG2 reference table for
virt tests and ignore till reference blob is added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>

---
v3 -> v4:
- added Michael's A-b

v2 -> v3:
- commit msg rewording according to Igor's suggestion and
  added Igor's A-b.
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/virt/DBG2                   | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1910d154c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3

