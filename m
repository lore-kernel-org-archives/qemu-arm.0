Received: by 10.223.161.27 with SMTP id o27csp509891wro;
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RvtfzrWX0iJD16BNwBfk6PVc2we1MKOUml4SOSG7ptobpsV0gi+DiKwIlzBbqvR6FBzKN+
X-Received: by 10.129.181.18 with SMTP id t18mr2968193ywh.28.1509519575221;
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509519575; cv=none;
        d=google.com; s=arc-20160816;
        b=Lx32puxbhSM/BowyLQtwCh/cAq5yhEQB6DtT+FJpMEnctISSZdpIs8jq9o6AXAS1Sh
         6N7ewclE1+37nLo47P4hTu2qTlnyZx9xXGmhn79ZjRaVzm1RRIagF+szdZkaEFvVg1KB
         KaQxWaprWlxlebktoeiQ2J6Q11CSBLokKpJNFxXyp6wRdgC5pEPDMoL8HoBxlxXsfowW
         5HaRCFLeMSAW5oGKpqNxkuH2J2uIK0oPYs4DVp+fLYb0Z+vMoQ5XvoQas6+3b0fmlqrl
         kIBfI/5Nqzv4OJjAydK0F7MO8TF/oaNx8nbgDMHLsQ3e+iU35ZjERfcAnMtFa1NJMAjd
         l5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=L/zHFiBsvA4ZmAqJ/pKlod6zKUoacgZn4erQmy4Nr7M=;
        b=vYkIsES1dZG8M7Ep2MxzaC47uV2DOxNwOxpgKzVp1WK80fA4pLEfI2HqM2WyI48oUH
         B5zdpp1yvj125NiPB68jw349yOHUUFwLwvVqRPYeQoiLWTfrc6Xq98kAaeEzOnhIPXMV
         BANnrFqrBYz0L9drr1fI3f5KsXqL8SB22uElVG58yT4qyw2snkss2i1d/KNSWqLbB0Ux
         7Q5TNyBufNZuf4P0Zxbev7+zQ/3LsHdMfX1MIUQ5KmtluFn0GKo3EXJDBRh4jvmodypX
         9BzO0lWO/L0cav7LkpC9ehn7HqmnDZfFLIdHy2ajOu5UgnfKLKsboWcuRBGghe5fpuIu
         zejQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si830046ywc.117.2017.10.31.23.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9mzu-0002A5-Ku
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 02:59:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzQ-0001xu-RQ
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzO-00007p-Jl
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e9mzO-00007O-D5; Wed, 01 Nov 2017 02:59:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E4ABC04AC41;
	Wed,  1 Nov 2017 06:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5E4ABC04AC41
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE66600D2;
	Wed,  1 Nov 2017 06:59:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  1 Nov 2017 07:58:55 +0100
Message-Id: <1509519537-6964-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1509519537-6964-1-git-send-email-thuth@redhat.com>
References: <1509519537-6964-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 01 Nov 2017 06:59:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] hw/arm: Mark the "fsl,
 imx6" device with user_creatable = false
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
X-TUID: bA06dxQVxxKS

This device causes QEMU to abort if the user tries to instantiate it:

$ qemu-system-aarch64 -M sabrelite -smp 1,maxcpus=2 -device fsl,,imx6
Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
qemu-system-aarch64: -device fsl,,imx6: Device 'serial0' is in use
Aborted (core dumped)

The device uses serial_hds[] directly in its realize function, so it
can not be instantiated again by the user.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx6.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 26fd214..59ef33e 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -440,8 +440,9 @@ static void fsl_imx6_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = fsl_imx6_realize;
-
     dc->desc = "i.MX6 SOC";
+    /* Reason: Uses serial_hds[] in the realize() function */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx6_type_info = {
-- 
1.8.3.1

