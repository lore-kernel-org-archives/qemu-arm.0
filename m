Received: by 10.223.161.27 with SMTP id o27csp509684wro;
        Tue, 31 Oct 2017 23:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S7ybdTAbhKVtwPowzlyPHvSxZ/lot3qc/Lz6bo71EBPON6Ct4bWmpa3lo/0PnRt8XBphSp
X-Received: by 10.13.235.198 with SMTP id u189mr2786544ywe.415.1509519559317;
        Tue, 31 Oct 2017 23:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509519559; cv=none;
        d=google.com; s=arc-20160816;
        b=g2HJ/a5Jh5TwcsjJyb6SzQJ+NZe7HYiEIGRuAwKqGHXT3QAF+WIpOVwABxCgKF+2nm
         djrkPmOkntOl+FYT65oc8TrsZdFQXD9EIIMeSiQ/DgLSftIihmufsU+THCJZyK/yIqOX
         xUF0DLmFcWvauiZAGhvML1/b8e95ykqtSTB71GqHF/V3Xyr8trufSRMkAv92Bhcg5jId
         Tfn8/NMzglw/qDz6aZWv38WnVrBKtmCXVSGyQu5M+IjAKOChcoZnnGZq/jlfGM47rpzh
         e7c/4l8PsjWCwLci4RLpeu475sAmQU6NVS5Kr7ovqEdHbaI6zFEsv1fA8NIEHLpIrMjC
         yNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=A38r3qu+nk2kAUfGZJwmc+4sijDzLfxLKFO+8hJiR2c=;
        b=G95KB0cIcyisPmANe6bShRKRsLOoHc4961NDUshfPrZIOlXdDg9lrpMONfrI8DIWMB
         peAIC5UnulvCzBLDmgn0v2tXsFlce2C2j53IXCHkCRW7djsPqxrm4iJiVkO3OYSPLf9R
         q7bAx5P42NBYqwJCysOhEqynA50of8SycMeNWvro7HFB6a1371KE31yB2fmfWwyNZ9zf
         g1g6Mt8LFX9/gbuUaPqt/vwT8t+rcHDfWY1wrG2UkSR5alvaLMLzS+Hq5T8jROAbCaK1
         u8zWxpBNFnOel06N5pzeeW0muoiUIDW5bM73C6XrdKDuf0ZcRSkBJg2p8mzVJ3ndoENa
         uzQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x130si854137ywa.353.2017.10.31.23.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 23:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9mze-0001zH-MI
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 02:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzQ-0001xs-RD
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzQ-000089-1y
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e9mzP-00007y-Ry; Wed, 01 Nov 2017 02:59:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA0E84E4C6;
	Wed,  1 Nov 2017 06:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA0E84E4C6
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCD6C600D2;
	Wed,  1 Nov 2017 06:59:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  1 Nov 2017 07:58:56 +0100
Message-Id: <1509519537-6964-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1509519537-6964-1-git-send-email-thuth@redhat.com>
References: <1509519537-6964-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 01 Nov 2017 06:59:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] hw/arm: Mark the "fsl,
 imx25" device with user_creatable = false
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o14QV0iUaTua

QEMU currently crashes when the user tries to instantiate the fsl,imx25
device manually:

$ aarch64-softmmu/qemu-system-aarch64 -S -M imx25-pdk -device fsl,,imx25
**
ERROR:/home/thuth/devel/qemu/tcg/tcg.c:538:tcg_register_thread:
 assertion failed: (n < max_cpus)

The imx25-pdk board (which is the one that uses this CPU type) only
supports one CPU, and the realize function of the "fsl,imx25" device
also uses serial_hds[] directly, so this device clearly can not be
instantiated twice and thus we should mark it with user_creatable = 0.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx25.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 3b97ece..cb988a6 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -288,8 +288,12 @@ static void fsl_imx25_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = fsl_imx25_realize;
-
     dc->desc = "i.MX25 SOC";
+    /*
+     * Reason: uses serial_hds in realize and the imx25 board does not
+     * support multiple CPUs
+     */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx25_type_info = {
-- 
1.8.3.1

