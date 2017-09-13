Received: by 10.223.172.38 with SMTP id v35csp833982wrc;
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAfowWMBV+Ux/ULwRZouWNyHHxfQlzzgKOiuWhp2l+nZZRfwjrgHSScTnKMc70qP9qsWaLs
X-Received: by 10.200.57.83 with SMTP id t19mr26466427qtb.150.1505296034716;
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505296034; cv=none;
        d=google.com; s=arc-20160816;
        b=nJUXqTizDvppmgHjdBIOqc2WQxqVyt1EaEc6B6KPCXP6J9QQ4iopkaksA2ghXKw5Bx
         9+JKt047sWVviBMVN8tOhVIuGRmIUxCCmmuqcZp9Ji4rmZSnzEp4QtEBgRlA62LaJxmJ
         0t0PqRpy6s0OCwHZWM1+Eo1SiL5zG70sx693Z/WWhTubpwVhTllo16sa5Upvy+ToOXM1
         0pncHTQzf39kffVagXIvuxCToisWUJEFo2uwxE4iakfLCLEXoiEbl+r9i5iLqHG3+09i
         uOL8GAEoYAeA6iiT02tzhm3cjXw2Y7XrU1DXMZEuqPSB+nhZYOPumumoCVG5Rq8f+Gu1
         fb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=gCtXvkE6vqX2RPaqxAJZSdIQ4/ZXVOZd4LXGw/sedig=;
        b=NAOXXoguKRRgxXhj7ZdntYwpb/3YuYFfSFQ/kzw963MP93DlFNQAmYEJWhJ/T3jhtv
         4PrY6ZIeU2nzWYmyTKu1ltEN6g3YSoTKEOCxkt1Jt93CfoG60Rh3f1lgVSqODUX2AsUm
         7BELcv3Cz8fZqo8Hji/G19dAkHqTyG+fRIon5Ul6zigfUdSbzdSMb1SdwwSzGyEwHJA2
         eBszWRPGIdjAvU+Sri2xOvfqpmj7TAJELlAXHvWpJgYEbMzJmQ8sNYvJH9L4Hot34dm4
         GNfwEpqZdlsw7LLhbehysMpJe8vcjh8r57EzSnx0WeAkXywKH9VgE1TjXIRvBgrtO4uC
         Yzzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si15088249qta.404.2017.09.13.02.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds4GG-0008LQ-FH
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 05:47:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4G6-0008KR-Ms
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4G4-0006KM-0M
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ds4G3-0006Jg-QQ; Wed, 13 Sep 2017 05:46:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD95A7EBD5;
	Wed, 13 Sep 2017 09:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CD95A7EBD5
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B17060841;
	Wed, 13 Sep 2017 09:46:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 11:46:42 +0200
Message-Id: <1505296004-6798-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
References: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 13 Sep 2017 09:46:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 1/3] hw/pci-host/gpex: Set INTx index/gsi
 mapping
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LfqJaKxoQm2K

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

To implement INTx to gsi routing we need to pass the gpex host
bridge the gsi associated to each INTx index. Let's introduce
irq_num array and gpex_set_irq_num setter function.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Feng Kan <fkan@apm.com>

---

v3 -> v4:
- use int for gsi
---
 hw/pci-host/gpex.c         | 10 ++++++++++
 include/hw/pci-host/gpex.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 83084b9..41a884d 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -43,6 +43,16 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irq[irq_num], level);
 }
 
+int gpex_set_irq_num(GPEXHost *s, int index, int gsi)
+{
+    if (index >= GPEX_NUM_IRQS) {
+        return -EINVAL;
+    }
+
+    s->irq_num[index] = gsi;
+    return 0;
+}
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..aef38b8 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -51,6 +51,9 @@ typedef struct GPEXHost {
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
+    int irq_num[GPEX_NUM_IRQS];
 } GPEXHost;
 
+int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
+
 #endif /* HW_GPEX_H */
-- 
2.5.5

