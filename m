Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp773713lff;
        Thu, 5 Aug 2021 19:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziYQbH2G/Z5kUwfZLRfpMyZKNiZ0NVo5NdLSQXmZcoW8rfu7pVwzoXvs+6Z28lnM452NsJ
X-Received: by 2002:ac8:7a98:: with SMTP id x24mr7221385qtr.42.1628217105591;
        Thu, 05 Aug 2021 19:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628217105; cv=none;
        d=google.com; s=arc-20160816;
        b=Vweiwky4wVEIFwDsC7kYQHhkYSg3jZl7L+SMmvKQjU4HsSt+zHdQgjYgtzmr+parQU
         mXBkP5F8VaSBpAwNw6gS3LnDL3ir5MIu40dR2ZmENFKUry6QnlZBmozQP3FyDs2wu68Z
         LL4PfzGhh+Tgz9SQOVv2y2vrNaNYH7Yycr1ymQdLxivkPTufuz/drcrSiB7Fo16pxhNs
         W1mulhBUpnvdjajit+dLHiFZXZ5VuLmF1j2T0vrKN4Hy/hThYy7iNG1s0DoIXOLwuK84
         u1bLSog1QyeJYutYcDQg2uv+WxMt6NG5TGeaDonQBsMnjwBtLykfgqFCTA0TYI50ErTD
         Sv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Zjd7se0onNJo2aiTwnoUmHMlJWpyG2rtkXxBgYKFn4A=;
        b=QFn3K7uzkjv9anDVLjvtONg8bYyDKT6VSPvuPN3qXAX7Yt91YmuLdVvoBveEfUdhhi
         dglwkf85+cPL4JEyA1xtt4qOBE3SzBVXtWlndUvpfJv1a60IAHuvDvKhgSqJgyzY8P+i
         4ED5jLm0jDLSV+EyDnwViZXLGISoF+HquXjOZdmtNyNgD2Sa0RWGmP7GltxmDyQjgQ4L
         oxCohtUs+33o0x51ZhQAVO2KLR4Gn00QT+MVTUEAgfHtUzaNv2aWAzZylds+LGT/9RJ9
         qJB/Fh8MQjPvSmpaJVVEOmzGTsT+Jb1ECNgFxlBiFqv/cT4x6wqoVD6Nz1+kxHxLSB5J
         zxKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wh26iR0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si4684505qti.287.2021.08.05.19.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 19:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wh26iR0k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBpeC-0004GJ-St
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 22:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBpdx-0004A5-E3
 for qemu-arm@nongnu.org; Thu, 05 Aug 2021 22:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBpdv-0002WT-0f
 for qemu-arm@nongnu.org; Thu, 05 Aug 2021 22:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628217083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zjd7se0onNJo2aiTwnoUmHMlJWpyG2rtkXxBgYKFn4A=;
 b=Wh26iR0kVEfJrRY3KoxS6zCQ7g+/ub7z33WkKSNO4lFHnhuDKPB2Oyhd9j6ZcLCAO1b+ok
 E8BImelQpRN8NNLZd7VUYSa9hpKSN48n0D4ycv6sY1UdH5/IA6PZBL/jbTyVW0bmveyH9g
 anpy1chYOeC3m1nUgnhAiP/lMLzFmLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-1I9_eIxhNLW_HPZoiHDf0Q-1; Thu, 05 Aug 2021 22:31:22 -0400
X-MC-Unique: 1I9_eIxhNLW_HPZoiHDf0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E591D802B9F;
 Fri,  6 Aug 2021 02:31:20 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B313779D0;
 Fri,  6 Aug 2021 02:31:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] sbsa-ref: Rename SBSA_GWDT enum value
Date: Thu,  5 Aug 2021 22:31:19 -0400
Message-Id: <20210806023119.431680-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /IHoZ4XCtfXc

The SBSA_GWDT enum value conflicts with the SBSA_GWDT() QOM type
checking helper, preventing us from using a OBJECT_DEFINE* or
DEFINE_INSTANCE_CHECKER macro for the SBSA_GWDT() wrapper.

If I understand the SBSA 6.0 specification correctly, the signal
being connected to IRQ 16 is the WS0 output signal from the
Generic Watchdog.  Rename the enum value to SBSA_GWDT_WS0 to be
more explicit and avoid the name conflict.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/sbsa-ref.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c1629df6031..509c5f09b4e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -65,7 +65,7 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
-    SBSA_GWDT,
+    SBSA_GWDT_WS0,
     SBSA_GWDT_REFRESH,
     SBSA_GWDT_CONTROL,
     SBSA_SMMU,
@@ -140,7 +140,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
-    [SBSA_GWDT] = 16,
+    [SBSA_GWDT_WS0] = 16,
 };
 
 static const char * const valid_cpus[] = {
@@ -481,7 +481,7 @@ static void create_wdt(const SBSAMachineState *sms)
     hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
     DeviceState *dev = qdev_new(TYPE_WDT_SBSA);
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
-    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+    int irq = sbsa_ref_irqmap[SBSA_GWDT_WS0];
 
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, rbase);
-- 
2.31.1

