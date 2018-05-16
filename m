Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1147763wme;
        Wed, 16 May 2018 07:00:52 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpiUXRU5BGtHCq1/ZIKI1AJ3b2cg+tU1eyxG0fDTMG9S1k4B7scl+XD6OrN9oVi0nwoQEqf
X-Received: by 2002:a0c:af51:: with SMTP id j17-v6mr992834qvc.194.1526479252007;
        Wed, 16 May 2018 07:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526479252; cv=none;
        d=google.com; s=arc-20160816;
        b=Rk9JXlKpTmY+976e+EzrNu0Eb9Snz5sBvVL381dozNwBqHTASSMoErg7uPQj2eBmJ2
         cIhqxsCYFDuviL/XdCjgNgEKOccumD+h3oBy24uR9sIMTp+aoadvSlGY9uHplZKJCebi
         qGUdsvhpNSDVwHrP+2VnqKKa+iHtGD6D2l4jL0C7J+5DuZB3fp0oMi+HcTRa8GBsQ0d4
         G31XjtaVF/KQSF3np9C/foRrVzque5SBLbsJVhcvihmFR479MNEuO3GoeZbBgGUdssYJ
         4B9c7PwZ8ls6kkTnp7TAzc/nQyfPmQYA2a+Zfk3c4optb42NvhoQC/J2RTo99RsYOjmX
         GO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=5z0Fy7700EqrjsJu6KiiS2diD47yOcvBZiXPaBpEMP8=;
        b=bv0vtTR4DnbegmI1TLOdRw0qn6RFM30LCG5d2jfTmoAgvxf5dO7VhoV5LEgkYPWwpM
         SrpnI4V5UX0IAu9DEoVk5N9kCqOavkYMG2KKCIcaPJR3MkzVvg9ds6Ch/xHF5w5SS0oR
         pQS378nvSfbhNc7FqLiexjPjhsiIDbPLdrYPtFx3bf6sHIH8qNrCN7AlD7CzQFlMnDbh
         DHDzFFOsx+eWFZfg+QafwACEtLheyuIF2f1zh29f+okm4VPTHYh/gm7oaaKCNSni7Uer
         rPRId4lfypZaWo5Oqf6JsjKNcIgxBpu1hPF0TYjaBWdYF4YM4SQE4t8fFZOmvrMAxUGV
         Up9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t186-v6si2594534qkb.283.2018.05.16.07.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 07:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIwz5-0000JN-DW
	for alex.bennee@linaro.org; Wed, 16 May 2018 10:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxJ-0007IS-Sl
	for qemu-arm@nongnu.org; Wed, 16 May 2018 09:59:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxE-00060m-UF
	for qemu-arm@nongnu.org; Wed, 16 May 2018 09:59:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45368 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fIwxE-00060I-Ph; Wed, 16 May 2018 09:58:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F35B7D850;
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
Received: from dhcp19-241-177.khw3.lab.eng.bos.redhat.com
	(gigabyte-r120-16.khw3.lab.eng.bos.redhat.com [10.19.240.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EFB92024CBB;
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 16 May 2018 14:03:02 -0400
Message-Id: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 16 May 2018 13:58:55 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/2] ARM SMMUv3: Fix a couple of Coverity issues
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pk2Ne38eJfxd

This series includes 2 patches that fix Coverity issues respectively
in smmuv3 and smmu-common code.

Eric Auger (2):
  hw/arm/smmuv3: Fix Coverity issue in smmuv3_record_event
  hw/arm/smmu-common: Fix coverity issue in get_block_pte_address

 hw/arm/smmu-common.c | 4 ++--
 hw/arm/smmuv3.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1

