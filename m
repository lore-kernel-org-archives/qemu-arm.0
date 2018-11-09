Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp567348wrw;
        Fri, 9 Nov 2018 03:31:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5fk66Ag0vjgm2LW6ly0v90FNm5TnNlmQbOOqKKQTNGURDM06URY2coTX3DO3/Ih++SSVfQv
X-Received: by 2002:a37:ad0:: with SMTP id 199mr7924184qkk.345.1541763084157;
        Fri, 09 Nov 2018 03:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763084; cv=none;
        d=google.com; s=arc-20160816;
        b=RnPj5xisIK0cJrEhSGj/JfhvDk+3Kuu2U8cvfpRUjuvVSd5t89feWJQwNNXbPNVM9C
         scsOwqpN0gw0jFe+SC7EUr3Si0jMCP+PEKqk4fOAQ0C5sYIVPIlMgzfgAtqQLy3/wHsq
         mFJW+FoPUOptzUIq5JNcixM8TA/ssDD7tLtqHHS4j1qc2RZ0QqY3L//G1qAXXRpKM88c
         niHtmwxnQFreN/iT6E6is+6twr4/BjsXCPfdvB1Hxz26zsNW69XUZBL4tLFo8n/m2/j6
         kjcfkGmOInWboXdNtOeCJi4TGyjJo1MGwDD1YDKuWkBRqC6v9ugt7BcAXhenoFpMmr00
         tj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=jsP3ZwToTRgn4oK9gM70v/AV62jZLI5S5BkS76Q2Moo=;
        b=mVnVwXBhzLx/FJnHczO30O/9pX3h1R7sPsMTihIpSb+DydTyj5wqs9/w6AnYWCjiOO
         j81HtTGoGD15aTuUc9sk7nnPAEEJZ90PnJl5I6mhOfgm18y7Z1+bDBnBpEolWYJepDhp
         gAEr0xfUW0rDPoLmnSoRUbwzn88PqBUp3VUjITxMNBUzpl2udhv2uxpTthBblANa76hK
         Xk4ZiQEC450XKPUyp7Y7m5AWWvV+U5C8KFbsExgobrTVSFD1PuHWeg8AwxTHux2OFkla
         S5Z6PsRTxFM+a4SRgZCwwSTjpweP7NgSphMhmJlJoNHJg/4ZfMZZb1yzZRAKUa3EWebV
         16qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si2575125qth.320.2018.11.09.03.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL50V-0006sb-HF
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:31:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zr-0006Xv-0Y
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zo-0008Ly-DP
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53378)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zk-0006uB-7y; Fri, 09 Nov 2018 06:30:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8608C049E12;
	Fri,  9 Nov 2018 11:30:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84B965C219;
	Fri,  9 Nov 2018 11:30:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:40 +0100
Message-Id: <20181109112957.10067-2-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 09 Nov 2018 11:30:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 01/18] update-linux-headers: Import
 virtio_iommu.h
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O6UkTEPb0muq

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 0a964fe240..55fd271a32 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -159,6 +159,9 @@ fi
 cat <<EOF >$output/linux-headers/linux/virtio_config.h
 #include "standard-headers/linux/virtio_config.h"
 EOF
+cat <<EOF >$output/linux-headers/linux/virtio_iommu.h
+#include "standard-headers/linux/virtio_iommu.h"
+EOF
 cat <<EOF >$output/linux-headers/linux/virtio_ring.h
 #include "standard-headers/linux/virtio_ring.h"
 EOF
-- 
2.17.2

