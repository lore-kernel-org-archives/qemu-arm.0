Received: by 10.25.0.6 with SMTP id 6csp227091lfa;
        Wed, 17 May 2017 06:42:26 -0700 (PDT)
X-Received: by 10.55.24.155 with SMTP id 27mr3292337qky.161.1495028546542;
        Wed, 17 May 2017 06:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495028546; cv=none;
        d=google.com; s=arc-20160816;
        b=rnRRY+YJYfmyYKJ2LrM6TiSpW1ZdBxXr7B+QIg9lLWeYqDzFW+KsRNTDH6XTiosNbk
         5At0MSfpI32IPmzYaw0+ugLw6hArjcdlVQFJSRVUvK1N+OSOs6SdZ3hQHiFv6wwl+5C0
         jz7MsFYqr5bhyyxMjXd69/QYhgnkl9sheLexgJFuMd07QkrCnQBSu3kUWi89WqFkcNE+
         MqCMMvBdEqS5lM+NUtdXtJcKtFvpQnjt+secaoezXalxDhKIccE5MnogerhQpSwBiUPD
         J+Ft5ipj1oESBl8OIkeKas3/kGHVRQac84tId1YgtG+GQGj0mxY19Gwlg2AhU0s/llXG
         I1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Llsu+/zLv+u2r0OykqVeICZbKPPY6Uy75TAckfWpr2U=;
        b=qyH4nChcmBADKjLT7rvXWWmIePKqCAZolxIF5Ef1439EtydJ4WFlO5BEwsltQ9b3Vz
         uLoVlpvCDcQa11BFTtkluNPmpzOQu3qMjfejH2UqdzoqqrGlpO+vXAULVXswxPGN5c3h
         f47SgHIMtdINBCpyf/QRZ0QzEyex8D76f6yhUcwdkxHPxP6DKmDrr8PC3YHvm92tNJSa
         xusPC8QUD1qSUaFu102d4oymCdVE9oKf5tuxMUGkctd1Ub1Z1l2cW7MQLIufqRTcaKW1
         UUH1DE5MRDmXpM3W7GbUI+orWLkKXWytQ8zrORTVMuorq8qQo6Ni54YPKdXy5Voo6KJR
         KbXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i31si2185148qtc.198.2017.05.17.06.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 06:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAzDe-00060i-0N
	for alex.bennee@linaro.org; Wed, 17 May 2017 09:42:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dAzCv-00057L-6k
	for qemu-arm@nongnu.org; Wed, 17 May 2017 09:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dAzCs-0003wD-4H
	for qemu-arm@nongnu.org; Wed, 17 May 2017 09:41:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dAzCr-0003vn-Ty; Wed, 17 May 2017 09:41:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C50C56197E;
	Wed, 17 May 2017 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C50C56197E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C50C56197E
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 722E95C546;
	Wed, 17 May 2017 13:41:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed, 17 May 2017 10:39:52 -0300
Message-Id: <20170517134003.17110-12-ehabkost@redhat.com>
In-Reply-To: <20170517134003.17110-1-ehabkost@redhat.com>
References: <20170517134003.17110-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 17 May 2017 13:41:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 11/22] allwinner-ahci: Remove user_creatable flag
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J9F6mOdDHYuU

allwinner-ahci needs its IRQ to be connected and mmio to be
mapped (this is done by the alwinner-a10 device realize method),
and won't work with -device. Remove the user_creatable flag from
the device class.

Cc: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Acked-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20170503203604.31462-12-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ide/ahci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 2ea1a282ef..f60826d6e0 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1815,11 +1815,6 @@ static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_allwinner_ahci;
-    /*
-     * FIXME: Set only because we are not sure yet if this device
-     * will be outside the q35 sysbus whitelist.
-     */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo allwinner_ahci_info = {
-- 
2.11.0.259.g40922b1

