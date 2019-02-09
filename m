Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp300294wrq;
        Fri, 8 Feb 2019 22:54:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZvjT3gblLgsjjafBRwYu7JwdEnVEh/E7bduyV4ztKgrZODZhTQtXIKADwu6bitW+zNOhbp
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr1809107wmh.118.1549695298799;
        Fri, 08 Feb 2019 22:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695298; cv=none;
        d=google.com; s=arc-20160816;
        b=xR9C5qWDUpDfy3ZHDGV9u5hABdcRd0EMs6CvlCMGIqPU3FI/ZrtdAlGnBo1eYvcx/Q
         wByeqMY99mCKbs/erZ47r9tT4W1YCxM8juSPkDKkWeLzQf+cAc3EivKUXYMSgEeuCItv
         sBfcagY1CP5ZekmVPWZYLVVGNkaUzObTxEz3XVFFe/txZMJw6JqqZVjEDZz40tOqI8/g
         Kcl2uc1i1/gtFhN+8bHLwwfDkCL4aH279iQA11iRM6RdLu/W+bqyFAPc9Jn/86koWqNe
         r2tBbCw/28ZB3DtKB74y4a6QrV+Db1sdDAvELYo4LVYdI1PDGaAEwlgwdEDwuCuTSJKJ
         M63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=oRlj2NS7Xklx2vpWDlt+QVnBOz4ill2szJvBvZ9lvMQ=;
        b=lt9BVfX5LVkBRQMfD3aXkcNHG+zj10M4/97a8OEiXy4rtUbqYW7HwNaVBDXW1yoPiv
         CN1mwwtxEvEPWqGD39OHrd2i7ZkmlhMpJOL/uvG7oSWkltQZeQ+SCxk7xD2rrNxNMRrX
         AsW1BtQL0zFIK28JaPKryf/LfCCG20+YLZ7uRqs6EIWxU5dfE1Ipxwb4hD2+lBbeFNak
         vVjnGiZ2f+t4Q2Jhx55DISQjfHYXtGLQ4L5Aip1UTgQVrx8H/DAYEy7GuphTPtufzV7E
         XIBOdgOgCAeiypQGHAfYQmQUiN4FMvD5rcWJC1wac+0HLOIYeS6MKC8gZpc6/3qpH2Hg
         bqhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si2981836wrw.456.2019.02.08.22.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMXR-0006xD-Qg
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJs-0004Wr-OM
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJr-0004XE-P6
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 01:40:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJl-000491-9g; Sat, 09 Feb 2019 01:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AB607F6A7;
	Sat,  9 Feb 2019 06:40:32 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C93D080D1;
	Sat,  9 Feb 2019 06:40:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:25 +0100
Message-Id: <1549694366-1284-25-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 09 Feb 2019 06:40:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 24/25] hw/arm: Express dependencies of the
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ji0i2kGcp3qn

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3577550..d9150cd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -306,6 +306,10 @@ config XLNX_ZYNQMP_ARM
 
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

