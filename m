Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1571332lfk;
        Fri, 26 Nov 2021 23:30:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOyW6skIXcJG57yVZ8EdTzByIHvFTfVmKTS9WK/L8rKIZZnhxKIQY0kyKykeIy05j2zwAr
X-Received: by 2002:a05:6214:20ab:: with SMTP id 11mr30226458qvd.31.1637998238894;
        Fri, 26 Nov 2021 23:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637998238; cv=none;
        d=google.com; s=arc-20160816;
        b=wbEGYy7VvlbUd1O8c6rPJBfLafh76EQBfLhgprGg+uPzu3EMzeZt4GsSRW2/HH7QlQ
         wSpiE2KuQLx1o6spNa04XQh/W06sHdZ3HEgwFHbz1e0dBN5appqO8Vs8NhBYS5c7mLqZ
         vNIevO2ullOV/ggrneuVl3SBlrZflP3qsMm/hPsfEnHCHtGvBCoFS6bQPIkBdd8LBmPy
         Tk3UIMxQOEqPL3pj7DvlC1/KebW9jwL1UuN80BWksT/v1skO/WQDVAyw2Zezuv/R+zhm
         Bw/aTPBObpcZRf+SxB20Z5NHP6w+zgaxKGaekbU1tHe9z6IYTA/xtl9fh3UhP1sCidBy
         C/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TCie3oqDboqlsv9myvdhPC56GuUsoDHAoEOU36URlTU=;
        b=ca95Wc4GcBr2yzzs9rYwAW8JpjQoA4f0ZB+ofDtmi9yExNW/dG4ck5J9+RDIEVbonz
         tvf/ATXxY00QrxR4/NfYVoD0gJaWICBwp0iOt69i2mZCWvTKqUE6Tee0gqIxDF0TpquQ
         jjPt0i+e+jlYoVqo7LnvDM/dVl1ahyGKBpQ/9ROpTFylMqm/Z4zOATj/fCBoExwXznhC
         MSMrQVX/JHKy2ggbfq7s5NKjxYTwT3GQ1/g6KAw+OYGY4cZSeqLRh2o+6sPzgGHNMcTS
         Kn8DFQ7B1LWt9DwlWysOGgJrCALeKPCbm+f8Z+UQD7ajIcEHjJiwjNYJqHB8p5+JkufA
         eS0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hlQTPTUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si9451276qkp.427.2021.11.26.23.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Nov 2021 23:30:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hlQTPTUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mqsAQ-0007i3-7u
	for alex.bennee@linaro.org; Sat, 27 Nov 2021 02:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9T-0007hj-Qy
 for qemu-arm@nongnu.org; Sat, 27 Nov 2021 02:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9Q-0002AT-F5
 for qemu-arm@nongnu.org; Sat, 27 Nov 2021 02:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TCie3oqDboqlsv9myvdhPC56GuUsoDHAoEOU36URlTU=;
 b=hlQTPTUrXM6u1TQfDlwGy9PT8PwV1T80ggC0XLPbuZk+ct96jNu782UvpdFIcaTub9LoZE
 Xn0WexcDIlp06edZs4y+hf6nrPxP7hoTm9rjVAs+9Srk0Cvd4+0vV2OBmW2OoBxbddQTiA
 aLsjqQibk8hYhTRyEvaveLxSoeLrexw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-VgqMYYLtMSGUJm6PiWHS2A-1; Sat, 27 Nov 2021 02:29:32 -0500
X-MC-Unique: VgqMYYLtMSGUJm6PiWHS2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01ED4801B01;
 Sat, 27 Nov 2021 07:29:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40977608BA;
 Sat, 27 Nov 2021 07:29:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 0/4] virtio-iommu: config related fixes and qtest
Date: Sat, 27 Nov 2021 08:29:06 +0100
Message-Id: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8xW+dKKJ1PPa

Introduce a qtest for the virtio-iommu device. The test
allowed to identify an endianess bug in the get_config().
We also remove the unneeded set_config() and fix the value
for domain_range.end field.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-test-v6

History:
v5 -> v6:
- added patches 1-3
- qtest: fix domain_range.end expected value

Eric Auger (4):
  virtio-iommu: Remove set_config callback
  virtio-iommu: Fix endianness in get_config
  virtio-iommu: Fix the domain_range end
  tests: qtest: Add virtio-iommu test

 hw/virtio/trace-events            |   3 +-
 hw/virtio/virtio-iommu.c          |  38 ++--
 tests/qtest/libqos/meson.build    |   1 +
 tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
 tests/qtest/libqos/virtio-iommu.h |  40 ++++
 tests/qtest/meson.build           |   1 +
 tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
 7 files changed, 511 insertions(+), 24 deletions(-)
 create mode 100644 tests/qtest/libqos/virtio-iommu.c
 create mode 100644 tests/qtest/libqos/virtio-iommu.h
 create mode 100644 tests/qtest/virtio-iommu-test.c

-- 
2.26.3

