Received: by 10.223.161.27 with SMTP id o27csp509890wro;
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Twsa2nz+bNCFgtuxhQMNkfTDIDrDLSgh0OssH82yRURfErIYroD05cglKa2TeMVwuFT7wE
X-Received: by 10.129.147.6 with SMTP id k6mr2950959ywg.197.1509519575043;
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509519575; cv=none;
        d=google.com; s=arc-20160816;
        b=McBUcLFqp8Ge6YrgNkntaKYtTMLpcb6vWRFvVM4rrHmvfanBFJPN9Pr81VVLYri8rS
         zOi5GcDxI2FqCobcwXzQi+tyqU9iQCYHAUXvHEMmm9/PhFLmIW3Sm3sn9y3xyeJ2MX9h
         MRbj/hBT7Yu0th19D9D7rYmiXKznwEKIqKldRKkb4zNsxzQ9oikrwo3iQGzRccFtAARk
         NOc70Wid0WkMKmnnwjtUxVGPUyEnr+vuhwmoaGW6Y6MQgxaSIsgaD89RJGKbZRQyaSGu
         WGfcbK6bgRaPPVOTnBpJNHCIzljzg8eL4gm1u73oa6o/3vYt0YbvfcPk9MoLMAZcdT+N
         Xtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=hOm6os7iHHhoe542oYlHDod9tcA2sq3ga/wk1A8P/+0=;
        b=csfzjeQFoFvSTjxk0+lyYA1l5A7mAgmXRP2Vh3R2qY1Sh6vsVqEXMMafqnzUqoodXS
         0Ux6yq5KtiiA+sFH1moQdOewIRfVILh+zpDvoiggyir+75yyK8JJHs6QaK49NmDerEcM
         PeEtfP2JStlOimNn/HUn8iLaCHiov7VfRgx+KaSuSuJGj2bpbkhnsWef86ba2IunrjvL
         d/GJuBdj9NfUEmztqkatXnBJ7LmhJX8Lkr4VLKWqHGtv6CixisNL7x2hFhgU41G/wtXn
         DZYYMpE1NfSsjpmAYmLMc/BROmfgXQe2Df7YAL+4JEkWgMg20aSIrsABJrzDvmGakFK7
         1qsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10si859885ywa.802.2017.10.31.23.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 23:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9mzu-00028E-ER
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 02:59:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzS-0001y8-4R
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzR-00008j-HR
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e9mzR-00008J-Ah; Wed, 01 Nov 2017 02:59:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44524C0587D1;
	Wed,  1 Nov 2017 06:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 44524C0587D1
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32658600D2;
	Wed,  1 Nov 2017 06:59:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  1 Nov 2017 07:58:57 +0100
Message-Id: <1509519537-6964-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1509519537-6964-1-git-send-email-thuth@redhat.com>
References: <1509519537-6964-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 01 Nov 2017 06:59:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/3] hw/arm: Mark the "fsl,
 imx31" device with user_creatable = false
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
X-TUID: Z7lVJaaKiHa+

QEMU currently crashes when the user tries to instantiate the fsl,imx31
device manually:

$ aarch64-softmmu/qemu-system-aarch64 -M kzm -device fsl,,imx31
**
ERROR:/home/thuth/devel/qemu/tcg/tcg.c:538:tcg_register_thread:
 assertion failed: (n < max_cpus)
Aborted (core dumped)

The kzm board (which is the one that uses this CPU type) only supports
one CPU, and the realize function of the "fsl,imx31" device also uses
serial_hds[] directly, so this device clearly can not be instantiated
twice and thus we should mark it with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx31.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 0f2ebe8..3eee83d 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -260,8 +260,12 @@ static void fsl_imx31_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = fsl_imx31_realize;
-
     dc->desc = "i.MX31 SOC";
+    /*
+     * Reason: uses serial_hds in realize and the kzm board does not
+     * support multiple CPUs
+     */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx31_type_info = {
-- 
1.8.3.1

