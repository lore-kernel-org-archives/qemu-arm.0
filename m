Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5745445lfq;
        Wed, 30 Sep 2020 10:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBbV40L2Ovu6V6Yh9ecqFotMGdcxUoSMsqE6mtxx/vUHA87wOWMtmiHRL6SnmksMpQV+g5
X-Received: by 2002:a25:b58:: with SMTP id 85mr4701608ybl.87.1601488644221;
        Wed, 30 Sep 2020 10:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488644; cv=none;
        d=google.com; s=arc-20160816;
        b=eRSlS7+nLjcr4IvZqqWmEl9WTvZPzFn10GvuSH6AVzUNQmD8KWr/wiXPSe2SfLOFlo
         9kicgtgaD0De2kApIWvZmi9Vh7b3cVQYHzh8ESod5ElTwi1UznKc8ToRYWOj6A29iX96
         Y0tpbx2rVN2AY780zoc/oVcJVsl7IJnvdkBA9sQGmulQlFpotVtcuOF7DKYVHZG7Sbkr
         TsuWLbYZjIJfJeztIgOXTerP18cKxTb23MePbGJ1w6N/JtG9eprrS/OHbHnTnciilwnE
         GvnRqqPNBBxbrfiJVaLnmCqdqK8AVSMLmMvHHuPurMX+7Cv0EcXuEvYhvZckv6PZbnCF
         M9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QcN3F/xNJNd9Dj56VLbbkiXAvidGbrAo2qclfzNJOUU=;
        b=cMscn4LQe/by3UUuV68gtFu5jWKm8nwIZINmaPtMLpUX3CJhu/rQwfxZcyvD77Wwhd
         CyE+AbZOuQBn7KiV0otQRUd89/TSYf/cjzs+c/9jSERB+zLYGljLyXhdEnpDJ9SEzVzW
         v8DDEZ+0CobrCv0O1aPuII/MZ/r/qdOXCeO01sjo1qzGKLJz1quvSiCP4AFyepiQcIoh
         JngrbX5Vx7NNOuRUDlPMw5FZ1YvPwhfxtfINh6HdYyd/JpRqYV2lGE0xh2A7/+fDA01S
         bWcnSSoWe+H8ztE2wRvX80NOPiVcthQQbtBSZEFY2QvTICWTTHBaPKMpF7zo6CJaVJhE
         y2dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P5uzKu9F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si2285883ybb.336.2020.09.30.10.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P5uzKu9F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgLz-0006mY-LP
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEH-0005KW-LQ
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEC-0004k0-0Y
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:49:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcN3F/xNJNd9Dj56VLbbkiXAvidGbrAo2qclfzNJOUU=;
 b=P5uzKu9Fvltqw6AFKsvcEmyDq945uQwN+PSlYPigUdZpUvs4iEOohwTRSFyPZM0Ub0Bx8I
 SBMgAz7Wk7nJRuVQns4xHvS7GKl6Fs7Z2n9m/jHwF4wymu8ZyUMxUnys6hNfTNDUrlezvJ
 +RiB4Szh+sipkekgyt3TT/4AI3t0VLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-EvWMTMA5Pmy_gXnorBcZjg-1; Wed, 30 Sep 2020 13:49:16 -0400
X-MC-Unique: EvWMTMA5Pmy_gXnorBcZjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7BCB800469;
 Wed, 30 Sep 2020 17:49:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8305578A;
 Wed, 30 Sep 2020 17:48:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30C4043BFB7; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] microvm: add irq table
Date: Wed, 30 Sep 2020 19:48:47 +0200
Message-Id: <20200930174856.11296-5-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27Xm3HcxcoCh

Add a comment with a table listing the IRQs,
both legacy pc and microvm side-by-side.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-5-kraxel@redhat.com
---
 include/hw/i386/microvm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 3b9fd4ff17fd..0d61697c97f0 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -27,6 +27,28 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "qom/object.h"
 
+/*
+ *  IRQ    |  pc        | microvm (acpi=on)
+ * --------+------------+------------------
+ *   0     |  pit       |
+ *   1     |  kbd       |
+ *   2     |  cascade   |
+ *   3     |  serial 1  |
+ *   4     |  serial 0  | serial
+ *   5     |  -         |
+ *   6     |  floppy    |
+ *   7     |  parallel  |
+ *   8     |  rtc       | rtc (rtc=on)
+ *   9     |  acpi      | acpi (ged)
+ *  10     |  pci lnk   |
+ *  11     |  pci lnk   |
+ *  12     |  ps2       |
+ *  13     |  fpu       |
+ *  14     |  ide 0     |
+ *  15     |  ide 1     |
+ *  16-23  |  pci gsi   | virtio
+ */
+
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
 #define VIRTIO_NUM_TRANSPORTS 8
-- 
2.27.0

