Received: by 10.25.15.230 with SMTP id 99csp3301653lfp;
        Fri, 31 Mar 2017 17:55:27 -0700 (PDT)
X-Received: by 10.55.41.74 with SMTP id p71mr5691814qkh.246.1491008127387;
        Fri, 31 Mar 2017 17:55:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h51si6057661qtb.159.2017.03.31.17.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Mar 2017 17:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cu7K8-0002mq-ML
	for alex.bennee@linaro.org; Fri, 31 Mar 2017 20:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cu7CS-000525-84
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 20:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cu7CR-0006ps-JW
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 20:47:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cu7CR-0006oy-ED; Fri, 31 Mar 2017 20:47:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C0C79232D;
	Sat,  1 Apr 2017 00:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C0C79232D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5C0C79232D
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3A960BE2;
	Sat,  1 Apr 2017 00:47:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 Mar 2017 21:46:16 -0300
Message-Id: <20170401004624.30886-12-ehabkost@redhat.com>
In-Reply-To: <20170401004624.30886-1-ehabkost@redhat.com>
References: <20170401004624.30886-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 01 Apr 2017 00:47:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 11/19] allwinner-ahci: Remove user_creatable flag
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dIk2E87hKJFu

allwinner-ahci needs to be created and wired by the alwinner-a10
device, and won't work with -device. Remove the user_creatable
flag from the device class.

Cc: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ide/ahci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 68f2ce09ee..f60826d6e0 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1815,11 +1815,6 @@ static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_allwinner_ahci;
-    /*
-     * FIXME: Set only for compatibility on q35 machine-type.
-     * Probably never meant to be user-creatable
-     */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo allwinner_ahci_info = {
-- 
2.11.0.259.g40922b1

