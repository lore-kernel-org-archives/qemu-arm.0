Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1661769wrp;
        Wed, 13 Feb 2019 00:56:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbHjqkvg+chE7CsFIf8QprJZ3WtsDiXZUbsBNq/xsgKH5ggDP3wnHjMX+J8rqrLCGQb+bPm
X-Received: by 2002:a0d:df50:: with SMTP id i77mr3736328ywe.392.1550048194702;
        Wed, 13 Feb 2019 00:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048194; cv=none;
        d=google.com; s=arc-20160816;
        b=BTPEqdNRVAMEgI9eCaQ8VTdNWrakU1VDd9bcz1APjEQkWwV0DBoxi2A+HCwsIJUMDv
         OzRufGUve5+AkU55OlTHGanEdkCtnz+1BPrEFVCCCNmS3UcGe3rtgP7HX4+f4OqcUY+r
         az1Cy+VL7X9wag+As9lGkuhH/H+9IbajJz6jNkwjgMZoXSFsoyy3uJeMqGS1VbcG+One
         jMiBHujc734+4LiF3cziHgZMNAbilX3O/u5kh1wgQz6VZ+t1KNymZ3gd5S7VJFXWatzQ
         wkv9a4weJcxcN+jjrgnJeGvJpLq2AXXvEBRD37wJG8yixoZCMCVNiWpx1KI/pOjik6SY
         XDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Jo5z3j2ajrbFvlb+7NDmwTCWcdP8WWDELSJh6OME0rU=;
        b=NfLctvlj3MxNzFV/EANRC4FGFBe3BPOPMZVIYeOlz5lug/CJuhyQTcNjMXYvct8fVk
         nVf7nQgOI5/rp8BTldzDIx3cqKW6bVqfPn7wgSp8rMK/31MkSIYeEGgASnCT51PnUhJ/
         tdP0tUIj2GxsOJyEVXmXkESTzYKg1rh9OROvJf4stusgMhTC2QmKktzNH4XYoYT8Wlkn
         4cnDnu8EexJv1l8YipoC/sQYVYk5TQL1BHmjVyprqzuEtjrRvY3+4xv7RTe5L5zgZEwj
         IEir+0hMip84kOQw36WPU8nTnYlFYTXGctzn+92p/Pn4Ouc0LpKO/77TH334gqf4Z897
         3qyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 140si8965954ybc.119.2019.02.13.00.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqLK-0006SP-3X
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqFy-000256-Id
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq5E-0006Fv-Rh
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq5D-0006ES-UT; Wed, 13 Feb 2019 03:39:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3191DC058CB7;
	Wed, 13 Feb 2019 08:39:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC02110021B6;
	Wed, 13 Feb 2019 08:39:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:17 +0100
Message-Id: <1550047098-1210-25-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Feb 2019 08:39:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 24/25] hw/arm: Express dependencies of the
 xlnx-versal-virt machine with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AVkUGYbOKn2X

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 721cc07..027c063 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -303,6 +303,10 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    select ARM_GIC
+    select PL011
+    select CADENCE
+    select VIRTIO_MMIO
 
 config FSL_IMX25
     bool
-- 
1.8.3.1

