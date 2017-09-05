Received: by 10.223.172.38 with SMTP id v35csp1291120wrc;
        Tue, 5 Sep 2017 04:24:09 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7v1MSDYRJFZtgvYKjuaQ7dt1UbxJDH13Ux/KBbJXzItMzrldCuBV4wv5a4pD23g6k+Or8T
X-Received: by 10.55.40.196 with SMTP id o65mr4540016qko.325.1504610649839;
        Tue, 05 Sep 2017 04:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504610649; cv=none;
        d=google.com; s=arc-20160816;
        b=V4yTbVb39huuY4jN4byk84rTlpHb7FaORHYCZjVJfW9FJA8bp/ZXt9qWPa4k/H4OO5
         L49kI9DQwjxlrgpVxY/ieM2AQaDNVc0hHIH13tEPuBV3aSriOOMnxFIPJ4yv6tBttvY9
         HTnab2jfxd3i6fdjBafVdC3DRN04ntw+jDz5wMdO4WrwpErf96BIESzeUOw2OOMWSqxC
         ew6H7b7ROMcWchx8BJVEGwRTjFr/muALhOy6WUO0QvaqpzqgcZqwdYkZJo0x9HKYsDWn
         YPbOZGoG2XRRgsXfjT07m5dcB0jolBLtbmRuizmog7HnRYWll2SZTWD/n458j6BOLl70
         gE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=Bmtwo16379xP4DdqkdpK1tcD8O1NGUy4KsaGUURWT5A=;
        b=oaNAy9XPXDgfc5XZmEavqNwwhiR1dLwC++toa8Yc8Q0J5GeEYRjfstk+RK6v1LOcj6
         CZWCkIQPq1roE9SaDHDKt9+PuCHlUrl64VtMItnzOZ7TjMITOjmxPBAIrsRTR6ciCzyK
         G3zNpwJJtnm0TWg8Yp30jTAIGypv7IB3huXvALGrX43dtsAaPOtkI0WkuyMfpQ5wUEos
         OWV1Um3EEZARScy+jHtY9qmUFhau572AOEAmNi1J9oUo2lnuZsI51WvbwaA0DEocWV82
         DRAgTIeUejdAcKejDZU3NJy5s7ceM/8PwoQCaYEiyWzOiJBNuHMwkNwV1kXW7q2IRTCV
         wg7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f17si19088qtl.146.2017.09.05.04.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 04:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpBxf-00020c-Ml
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 07:24:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1dpBvr-0000n7-Sb
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 07:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1dpBvk-0005gN-0g
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 07:22:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1dpBvj-0005f6-RA; Tue, 05 Sep 2017 07:22:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A443B7F3F6;
	Tue,  5 Sep 2017 11:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A443B7F3F6
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ppandit@redhat.com
Received: from localhost.localdomain (vpn2-54-49.bne.redhat.com [10.64.54.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15CAD6BE6C;
	Tue,  5 Sep 2017 11:22:01 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 16:51:52 +0530
Message-Id: <20170905112152.8851-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Sep 2017 11:22:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] intc: arm_gicv3: limit GICR ipriority index
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Guoxiang Niu <niuguoxiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7MdqmRPURu7T

From: Prasad J Pandit <pjp@fedoraproject.org>

When reading or writing to GICR ipriority array, index 'irq'
could go beyond its bounds; Restrict it within array limits.

Reported-by: Guoxiang Niu <niuguoxiang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 77e5cfa327..7683c4cc7f 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -187,7 +187,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
     case GICR_ICACTIVER0:
         *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
         return MEMTX_OK;
-    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
     {
         int i, irq = offset - GICR_IPRIORITYR;
         uint32_t value = 0;
@@ -310,7 +310,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
     case GICR_ICACTIVER0:
         gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
         return MEMTX_OK;
-    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
     {
         int i, irq = offset - GICR_IPRIORITYR;
 
-- 
2.13.5

