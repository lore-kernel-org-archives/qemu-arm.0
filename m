Received: by 10.223.188.70 with SMTP id a6csp4881913wrh;
        Tue, 22 Aug 2017 05:47:56 -0700 (PDT)
X-Received: by 10.237.32.173 with SMTP id 42mr699969qtb.47.1503406075935;
        Tue, 22 Aug 2017 05:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503406075; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVoLrXaD+x3ASeGZwUIsHD3nIzkixFbv9NlAKiP+iIXOcOzFk3A3a6a/yOVfzO4h0N
         6gRhHS02w/YV936q/i6RjV+e277e9o40QLVJuXdB8EiM2vd/C5OvhWNJdVGg8GvFZeCo
         eMu2vIVhXOBvHPNnEs3dJyjVYxgdVRkjKMUvDCvRMlBAIh8sKUFvTReBC7jvtLV+bhYS
         vLEafZFBq2hwfNqHF0MYGVEoh6fKl4enjzVuqjTVgYuTJ0smcmffeS4o1b4xfqfA2E4V
         +/da5tGxdE5Gd44a+BSH2O2B+9Rf2j5MRT5Oh8QE8pDkDLKDtuKsI5ldzFAxEnvfcWCC
         3Psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=txaTJcbfcHKCUUDav22MnRCs2XoUfnFYuWGte6RT/E4=;
        b=WB0v4f07HOcRzhECinAHAEFWDkmw5qC37tZSbS9I5+4xsuFZSltLGZHHSb3bsMoQGj
         75q/rmJ/6KJRVXRegRV/0gP8583YKrTpieGj1eVzOu+loESViZePEn963vHSAePu55Ql
         q+aKAGM7HpGu72e4T0zX5ONCTrljIT8jHMaxfqwPBGjCsOcKly1Z1WRl+1o7BWg7QqXE
         dI/lljlzBdOK/Al4qtgz2tECARp93aLd15SiyospRkgC3bc55TaLXtVoDoJXZcE3q0R0
         Ly5NzKAK9y0S+Ied6rCGPXAHGo/RScalVnQ/9TTAsrFdPPehvi4XXknlXgWwR+XH3YqZ
         un2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si13369654qkd.193.2017.08.22.05.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 05:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk8b3-0001Uy-MH
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 08:47:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk8ax-0001Ub-80
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 08:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk8au-0002fE-2l
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 08:47:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dk8at-0002ei-St; Tue, 22 Aug 2017 08:47:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B32F161476;
	Tue, 22 Aug 2017 12:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B32F161476
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA3F4617A0;
	Tue, 22 Aug 2017 12:47:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Tue, 22 Aug 2017 14:47:39 +0200
Message-Id: <1503406059-7280-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 22 Aug 2017 12:47:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/aspeed_soc: Mark devices as
 user_creatable = false
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7SzKbBg+FUg

QEMU currently aborts if the user is accidentially trying to
do something like this:

$ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
QEMU 2.9.93 monitor - type 'help' for more information
(qemu) device_add ast2400
Unexpected error in error_set_from_qdev_prop_error()
 at hw/core/qdev-properties.c:1032:
Aborted (core dumped)

The ast2400 SoC devices are clearly not creatable by the user since
they are using the serial_hds and nd_table arrays directly in their
realize function, so mark them with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/aspeed_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5529024..7f1be04 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -338,6 +338,8 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 
     sc->info = (AspeedSoCInfo *) data;
     dc->realize = aspeed_soc_realize;
+    /* Reason: Uses serial_hds and nd_table in realize() directly */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo aspeed_soc_type_info = {
-- 
1.8.3.1

