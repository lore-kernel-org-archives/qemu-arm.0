Received: by 10.28.71.27 with SMTP id u27csp227396wma;
        Mon, 12 Feb 2018 11:23:53 -0800 (PST)
X-Google-Smtp-Source: AH8x227lqthleV4K5lA3eDkXEhuJg6dpON419pB5VOffR2FuIhPbb6Gh8L2oU2oeHwjkWOI4LECx
X-Received: by 10.129.105.68 with SMTP id e65mr8227552ywc.375.1518463433640;
        Mon, 12 Feb 2018 11:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518463433; cv=none;
        d=google.com; s=arc-20160816;
        b=Dzo6cksf+dzzbZYA3XwbYg21lNkucGI6GlLU34YFTtCQTlDXqy/tbaRuCrdKZZNMi3
         vgUlh5aDdIE7uPluFo7fLVG7Hn1/TcDcLkokKbU7GE4dyz/FmjgS3V2CWa2GcXlIcBIa
         43+aujMUmIUAzPhOsRfOM0SIkhEBnCtR4xy+PA7M13cZycgzHOQaOhaB3JOn1CGUF2VO
         Z8ksD7+Ganl+Y9c50XrEPwcWdPMlm7IBeucKV8RZU5HpsnXJbXjRVAhrs8paenM9K7Oi
         Lc6+vl9Lec+vmFqPGzxBx1bQSjBKtvqXD6rQF/UUTPi6ffxUEEivet+2CTBN5USOfzFm
         ajPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=wsRxhDerNDQ/QRTHIHZHgLvNdNEK2zCaaHddD53zp3Y=;
        b=xKDg0h4Rqd9S4qxGTU+H8gVCtVjkRr8X2udrRLbjQyz707v5RHmNprMG/0sLF2fckv
         mdKsKqBwpnFiV2n4GNzMuE2M2oxi4IrenyXgE/A3kh0SeB9unt8OcoIwkawjsMnixOJe
         LpTYN9jd3MfVLGXFXh9MK9MBaa1H6QQ3q5Yd3x3qlQiJjbTqtUTVTtI9CSVoPhJjls2j
         QxIRuMesaFIMva2w8+oDcFHzPp9XQMytwf9PL1mD89pgacQ7KDybS43uGsHv8OLPhd87
         qJaO9DuDuwpVBH7NsDm4CS/yknV6B/iz/EGE5nY6k8xcLNilnQOt2nDVAa1Smzgbieqo
         Sv0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o203si788950yba.484.2018.02.12.11.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJhh-0005Hc-4M
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:23:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLP-0001iO-Oy
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLN-00062Q-Eh
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:00:51 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37576 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJLN-00061M-B1; Mon, 12 Feb 2018 14:00:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B07AF83155;
	Mon, 12 Feb 2018 19:00:48 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7B61227915;
	Mon, 12 Feb 2018 19:00:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:21 +0000
Message-Id: <1518461904-5305-20-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 12 Feb 2018 19:00:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 12 Feb 2018 19:00:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 19/22] memory.h: Add set_page_size_mask
 IOMMUMemoryRegion callback
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ziNzOpz6yml

This callback allows to inform the IOMMU memory region about
restrictions on the supported page sizes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 783ef64..1c0374f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -208,6 +208,10 @@ typedef struct IOMMUMemoryRegionClass {
                                IOMMUAccessFlags flag);
     /* Returns minimum supported page size */
     uint64_t (*get_min_page_size)(IOMMUMemoryRegion *iommu);
+
+    /* Limits the supported page sizes to @pgsizes */
+    void (*set_page_size_mask)(IOMMUMemoryRegion *iommu, uint64_t pgsizes);
+
     /* Called when IOMMU Notifier flag changed */
     void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
                                 IOMMUNotifierFlag old_flags,
-- 
1.9.1

