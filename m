Received: by 10.223.188.70 with SMTP id a6csp1528698wrh;
        Wed, 23 Aug 2017 20:03:25 -0700 (PDT)
X-Received: by 10.55.116.69 with SMTP id p66mr6193082qkc.154.1503543805845;
        Wed, 23 Aug 2017 20:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503543805; cv=none;
        d=google.com; s=arc-20160816;
        b=bkm7HGvKsHn811mX79Z4KwJhCTaVjNwaI5gZ/JZbLSHZkzZ2cnhBDJ/Jr6hraMf8lx
         sCh1S3f2Jq8BzB7//6Z8Y0V06mSpHHvdB8xHHxlcsDDVO1hfJLDWN8ITASVM08Orawz+
         R1thkSzYGIreO55Xm8G/C+fnWD6p199M3ZoScm69kn9VwegoDw5ZVdAjYKzbHahilm1u
         oHseAoctOjOpzdvoQ9UbeHam2nZrmohMVeOJbkbs9lJqdqz+/Jn1Ru97ZA/Gid7YEUq7
         vdLbFhQuYsgozYxQCO6O4j+usxqs/BY+UtxZv28rETjFZUwJZQms+0ofMPbfZr747F/R
         oq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=3b5Gq3uLFchJ4WvY62N3GxENgLpm9KRk1pOJlu6FflE=;
        b=owTZG1fzVygJh3rZoP7EHa6Cl9jzfAHFBFD0W7TYPqUXxvEslFcUqqeMeUcj1VydyY
         mPUoogIh/AHwXhm3i72Dfx6EN/c6Z71a7mzFS7PfW2YjLHzjrNFI/90/DYJt5c+IA9ut
         d/bnVwmfyyMilHGB2twPbYR2189VA2587XX2hNgNitToJZ3T/++rVbJLGctP9mSRFjC+
         0oOoKfD94CBquDy3Ejjh0pe0xRioApNMnOdW8KpcCYg8YgfpuzM/0ps1lPANvK85Ku0F
         Y5MNuVWMGWpeWuCBUZ9UmS537DTDyeIjgF57NKsfQVw8+SUmzUJNvy4gYg1sa2UpCzrh
         XsGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si2941763qke.529.2017.08.23.20.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 20:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkiQV-0002O1-OY
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 23:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkiQM-0002Ng-FK
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 23:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkiQH-0000uH-Kg
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 23:03:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkiQH-0000u5-E0; Wed, 23 Aug 2017 23:03:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2762C356DA;
	Thu, 24 Aug 2017 03:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2762C356DA
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AAD689D29;
	Thu, 24 Aug 2017 03:03:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Thu, 24 Aug 2017 05:03:03 +0200
Message-Id: <1503543783-17192-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 24 Aug 2017 03:03:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.11] hw/ide/microdrive: Mark the dscm1xxxx
 device with user_creatable = false
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
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: euFxrECjLxvT

QEMU currently aborts with an assertion message when the user is trying
to remove a dscm1xxxx again:

$ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
QEMU 2.9.93 monitor - type 'help' for more information
(qemu) device_add dscm1xxxx,id=xyz
(qemu) device_del xyz
**
ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
Aborted (core dumped)

Looks like this device has to be wired up in code and is not meant
to be hot-pluggable, so let's mark it with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/microdrive.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index e3fd30e..17917c0 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -575,12 +575,15 @@ PCMCIACardState *dscm1xxxx_init(DriveInfo *dinfo)
 static void dscm1xxxx_class_init(ObjectClass *oc, void *data)
 {
     PCMCIACardClass *pcc = PCMCIA_CARD_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
     pcc->cis = dscm1xxxx_cis;
     pcc->cis_len = sizeof(dscm1xxxx_cis);
 
     pcc->attach = dscm1xxxx_attach;
     pcc->detach = dscm1xxxx_detach;
+    /* Reason: Needs to be wired-up in code, see dscm1xxxx_init() */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo dscm1xxxx_type_info = {
-- 
1.8.3.1

