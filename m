Received: by 10.25.0.6 with SMTP id 6csp603724lfa;
        Thu, 18 May 2017 01:09:45 -0700 (PDT)
X-Received: by 10.55.23.84 with SMTP id i81mr2465384qkh.153.1495094985226;
        Thu, 18 May 2017 01:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495094985; cv=none;
        d=google.com; s=arc-20160816;
        b=Fu9uGCkIwPgJhpDNivibAuugrPreWSWBenLPVEB7HqpYW+Uea0FsBLX/voSteKexPF
         K4lqqJVUi+21GQqr7y0yAtnX83/aoQMbk2P6ORg+DQ7ILHPMAAtr/eubogQjkfkLV9QR
         JGNNvtmOkJBtDxHykUV6fEsBC2n49SCpylNN3RTxG8jBJsrnrV2ajgqH3tzf9a7CP27G
         ZaOpgpMUfivJtS1XQgtmjL1ObQfODF67Xzfw+2bLcY7j39vsX6wdO9e7w7/F8oKE24sA
         lw34Wf5kJflpWv0mDS8AFqZj+hcakR/7e8WSS1TXtmNMxExly5zktGC6m6xQpW79roJT
         /xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=Yjtmx6wdC6Pa8AfjQdL/NW8bil6U0miCGzyyH7JKNM8=;
        b=H5hxqBSgpSeQXoWwRix9OnLIqcc+ABcq8DsptVsNzO5s6E/21bJ19RgfltHSP5QdBz
         P7F9bJCeGQLl8F8L1fAFy+DZbV2iTdykle36eZVsJj0Vtsk93puDNUUxqeFhLJ+PsmCI
         p2TOJdx2p/pOH3UT7L0YmhCS9W7DOiMvxgkuwmVstVEUBE9tZa65SsRIMM25jjeHjEFR
         kokr7sGnVevgcV6/3h0vkyXtRDqy9lG1emfM/8eKd2j7t0zLPOmjEdIu+/MjHDidOUnl
         yxpEA/AsQAxu6WS02ba5nVCTYPqVFx3PycMsOO5FBGGPGNiLv+q78XJUnDXRyUGd+5YY
         jcPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si4788431qtd.145.2017.05.18.01.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 01:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBGVE-0003Pa-GZ
	for alex.bennee@linaro.org; Thu, 18 May 2017 04:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGV8-0003OL-64
	for qemu-arm@nongnu.org; Thu, 18 May 2017 04:09:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dBGV5-00025U-P6
	for qemu-arm@nongnu.org; Thu, 18 May 2017 04:09:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48490)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dBGV5-000256-Jk; Thu, 18 May 2017 04:09:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B92A637E67;
	Thu, 18 May 2017 08:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B92A637E67
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B92A637E67
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6064C627DD;
	Thu, 18 May 2017 08:09:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 May 2017 10:09:28 +0200
Message-Id: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 May 2017 08:09:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] numa: code consolidation and test fixup
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LW1lIKSrPk68

git repo for testing:
   https://github.com/imammedo/qemu.git cphp_numa_cfg_follow_up_v3_cleanups_v1

CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Andrew Jones <drjones@redhat.com>

Igor Mammedov (3):
  numa: consolidate cpu_preplug fixups/checks for pc/arm/spapr
  numa: move default mapping init to machine
  numa: silence incomplete mapping warning under qtest

 include/sysemu/numa.h |  1 +
 hw/arm/virt.c         | 16 ++--------------
 hw/core/machine.c     | 35 +++++++++++++++++++++++------------
 hw/i386/pc.c          | 17 +----------------
 hw/ppc/spapr.c        | 17 +----------------
 numa.c                | 48 ++++++++++++++++++++++--------------------------
 6 files changed, 50 insertions(+), 84 deletions(-)

-- 
2.7.4

