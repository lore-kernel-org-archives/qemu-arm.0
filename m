Received: by 10.223.161.27 with SMTP id o27csp509658wro;
        Tue, 31 Oct 2017 23:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TAVSGi2w0tNgV7yNwqkDvoOWCvT3bu8vSEcVUHhbVDmeLPTlfb9IbSszJRTPr0KjcVKG8Z
X-Received: by 10.37.216.71 with SMTP id p68mr2784381ybg.511.1509519557412;
        Tue, 31 Oct 2017 23:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509519557; cv=none;
        d=google.com; s=arc-20160816;
        b=hDww/RGwil0jWb7R8TM0EOlZljjTjqbnus4dmm18wKtO0wynQimwfChn4hLAlFaA+d
         8rPltMigtIQIjN9LSbScU6IpEAmKWqE0qWcmf4cnpG1U58SRK1HUgkOsC/dvXR00pURX
         kUHKFmPinBRRQwwCG7V2OJKfF57LcIieW6Z9BN/mubBoCaYh6XaSz14VeG+LHz4XGsZf
         PiofmSncc6cToB726m1Cht3/EjjMD+BiDdJ35qtHHYVkr1uBu7Ba4S2ph0a/Mv1WFTV/
         3QRH1+Rx3iYBC2wBBoXnY8P6EAqsEhX/HGD2c3TKB2pPi9jktK/sIpamDp/o7UL2TGFS
         KzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=e7KbplL95Pbg3TAGTS4TkG/FJEEGBCtbeDjzq0r72yo=;
        b=TUo7TUwVi2ohhiOsgKIakXluoqo3opGZHiawl/QKUYCZk82gZ/4rp/3r6r9b8YDh4p
         Tse4Yra1UvtU/xrxWJrZ13iu3pC29HghY2umYXBBGjMC1bSYs94DcX0xrYbSqMu2XVdm
         9NbDWfeAjDw2mY+6Pz4ZzBI1SLBNc0h74L6AAGjl3wge6K0WCF7M6fiB6SCre934U6Of
         GX19UnTCn0DFwm6DErqBv7DYGO6ucNknzEbjX2aUGaA5E6iCASkVIUcVausE6zkY8r6C
         QqGmNHRALv09RztlFLDm0ommyOHfDn7mrJcbZlqGknXqnWCvpEszfktdE2j8PU/a6Tqc
         M2gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si907562ywi.304.2017.10.31.23.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 23:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9mzc-0001yf-P9
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 02:59:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzQ-0001xt-RP
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9mzN-00007R-RU
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 02:59:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e9mzN-000079-L9; Wed, 01 Nov 2017 02:59:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EB715D5F4;
	Wed,  1 Nov 2017 06:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0EB715D5F4
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-77.ams2.redhat.com [10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4690600D2;
	Wed,  1 Nov 2017 06:58:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed,  1 Nov 2017 07:58:54 +0100
Message-Id: <1509519537-6964-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Nov 2017 06:59:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] hw/arm: Mark the "fsl,
 imx" devices with user_creatable = false
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
X-TUID: ziADEQkgSYLA

These devices can not be used by the user directly and cause QEMU
to abort() if the user tried it anyway. So simply mark the devices
with user_creatable = false to avoid that the users can run into
this unpleasant situation.

Thomas Huth (3):
  hw/arm: Mark the "fsl,imx6" device with user_creatable = false
  hw/arm: Mark the "fsl,imx25" device with user_creatable = false
  hw/arm: Mark the "fsl,imx31" device with user_creatable = false

 hw/arm/fsl-imx25.c | 6 +++++-
 hw/arm/fsl-imx31.c | 6 +++++-
 hw/arm/fsl-imx6.c  | 3 ++-
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
1.8.3.1

