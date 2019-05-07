Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357064wrh;
        Tue, 7 May 2019 01:20:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVfqsooRRN29JyF1pKYpIiyFZYt3H3/qOwh2ucVXAlOuS7BHMPX3DPqu86qnNj77dGsmq+
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr19191585wmm.25.1557217216896;
        Tue, 07 May 2019 01:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217216; cv=none;
        d=google.com; s=arc-20160816;
        b=z1b/8pytlMxmJZc89bnUBVpam4lWyDf33xzT3u0lqnu5S/rlC7J0Kwsx9AsVtRDoxv
         Edt7DFsP5pG7A4ymq+2+9sOwPKlg0F3roPc6OCm2gkEcRLZxsfQurxf3C9DiXnHGE6IR
         qnRqdbgfNLAcVFKnxpMafT81ZD2WOnU02irteMlHoyn0ytLEQLBTd/OhHdSyqtmI+j+j
         oo8lNXLgQ3dUSa/xWOBiFdcC139kQDWb1j8ufelp/LGmUiCQWDjxcBE4eStgTezIYBab
         ZRHQVugESnTR/4G69cQ6pACekAYaUnQZ/8m8negpxiR798hYon2MpvUtGkkfzHcW9W8+
         DLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=TKe64jQwheMAS31A430hSQOy+ZwUNyZ3U9yJ3MEawpA=;
        b=rMUtoRPkJD9kaa7JoZ5Zs5+RRzC/uYony4lpVyIimykQjL14ik95BuLAzG4C2/v87R
         wcjO/vmewZIKfis0RrDOs1YGCmgwguZaBf32xfcsvO6wJD5MC1K3rKeEMZYzEd1+lziT
         wVTcHJ3h5wp/FEoTpV9qRZQuck13vXcrWGVHDuuTj9d9jeADKMnw/+/ywBmc/h636eKU
         PhvXspLOzuQaGS9LONkvvir1WX9flbmRWNRVLxr7+T9hP6RezuGrlaT0wRz0T/E3rno1
         09tKSZjuAPD4rfJ14wOFfUtiqMsA72HscicCEC6pXPkowMatGDECoJDso1KT07ZZyLFG
         SUZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si8370095wmj.5.2019.05.07.01.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvKh-0000eG-SG
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKJ-0000cW-Ow
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKI-00087I-Sc
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKI-00086v-Nc; Tue, 07 May 2019 04:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3C313097025;
	Tue,  7 May 2019 08:19:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 931E6171F1;
	Tue,  7 May 2019 08:19:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 801431750B; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:39 +0200
Message-Id: <20190507081946.19264-2-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 07 May 2019 08:19:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 1/8] qxl: check release info object
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iDFGRUBxzjGd

From: Prasad J Pandit <pjp@fedoraproject.org>

When releasing spice resources in release_resource() routine,
if release info object 'ext.info' is null, it leads to null
pointer dereference. Add check to avoid it.

Reported-by: Bugs SysSec <bugs-syssec@rub.de>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-id: 20190425063534.32747-1-ppandit@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index c8ce5781e037..632923add239 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -777,6 +777,9 @@ static void interface_release_resource(QXLInstance *sin,
     QXLReleaseRing *ring;
     uint64_t *item, id;
 
+    if (!ext.info) {
+        return;
+    }
     if (ext.group_id == MEMSLOT_GROUP_HOST) {
         /* host group -> vga mode update request */
         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
-- 
2.18.1

