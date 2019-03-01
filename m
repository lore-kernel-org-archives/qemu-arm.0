Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp771336wrx;
        Fri, 1 Mar 2019 07:48:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5CI/i8Wqe5mW+mciIfjGvZhUE+3dMpNb+D/hJM5Rjvwb/SvSO+HIrK5VJG7h4MWN56KOi
X-Received: by 2002:a81:6dc2:: with SMTP id i185mr4174658ywc.156.1551455315533;
        Fri, 01 Mar 2019 07:48:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551455315; cv=none;
        d=google.com; s=arc-20160816;
        b=c1OQTjsC6OiIe2Emf4aCu1F52eR3mo8CqKN/qyEgkBnSRebTmgu36igaXgwmBBDgOJ
         VpPtXYcnvhsfCBwNFsUzWaoTeq92vrqvOflCK7D5JCbvNeJK1qNONBfFB31N3l/Ee8xQ
         P/Rs9irnaosKev8Alz8P7Y+R6WDakAXy9Km4OU2HK6trlw6IBnZ4sLf0mIPZfuWCzKQc
         fNx3OLCYhkK+F72ayql8mfwYG8p7mB4WwVBnlj05NTvStkAR0dapsSRwmrVNxtlduIxx
         Vf+0GVSErZLmn75RD/ENEf7opfEBGChPFl3H0KSYjpNq1DDVTELOXpYFaSd0cXgzCRzA
         Ogzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=DFTe5bwnogzmssj+M1l/Jhr0x0lR1RqpgBzN7zBVa40=;
        b=kM81sjBLj5zVvfdPxGE3gCxp9Dd4kxPoBH9P4EWZtVST9gv4BRYBTyecVMnstBmZX1
         TG6ltYhyzyUMJY9siXa2oWSN2ZpygJkHz5Ady4qdkV8Z9cIqSiFJVX+WAyy/qGF6yoc6
         128CXHMvOgFv8Cp1l3hCZkmUxbjcTWoQv89ywfxSEZtWbmSIUcG+L9FpsR/FGruGOR2C
         YgLIsXJe/MvmFmScpOA9bbtCKsLnmXur7nlsCP6t9iAlJ6pBkPqzPiw9a7T7N58MVF3v
         LGLhd587bTxH1txOl0lcnTf/T3VpGGlcq/rJpA1n63VcznaZAKIsTi49d3N/Q4UHLQh3
         8UYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si10961018ybe.464.2019.03.01.07.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 07:48:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkOp-0005dC-1k
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 10:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkN8-0004vs-0S
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 10:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkIo-0007Yp-V9
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 10:42:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkIn-0007WY-Pr; Fri, 01 Mar 2019 10:42:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E1E30EBE8D;
	Fri,  1 Mar 2019 15:42:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71D0460BE2;
	Fri,  1 Mar 2019 15:42:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Mar 2019 16:42:14 +0100
Message-Id: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 01 Mar 2019 15:42:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] numa: deprecate -numa node,
 mem and default memory distribution
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EsKs4Fw+95dU


 1) "I'm considering to deprecating -mem-path/prealloc CLI options and replacing
them with a single memdev Machine property to allow interested users to pick
used backend for initial RAM (fixes mixed -mem-path+hostmem backends issues)
and as a transition step to modeling initial as a Device instead of (ab)using
MemoryRegion APIs."
(for more details see: https://www.mail-archive.com/qemu-devel@nongnu.org/msg596314.html)

However there is a couple of roadblocks on the way (s390x and numa memory handling).
I think I finally thought out a way to hack s390x in migration compatible manner,
but I don't see a way to do it for -numa node,mem and default RAM assignement to
nodes. Considering both numa usecases aren't meaningfully using NUMA (aside guest
side testing), and could be replaced with explicitly used memdev parameter, I'd
like to propose removing these fake NUMA friends, hence this deprecation.

As result of removing deprecated options and replacing initial RAM allocation
with 'memdev's (1), QEMU will allocate guest RAM in consistent way, fixing mixed
use-case and allowing boards to move towards modelling initial RAM as Device(s).
Which in its own turn should allow to cleanup NUMA/HMP/memory accounting code
more by dropping ad-hoc node_mem tracking and reusing device enumeration instead.

Igor Mammedov (2):
  numa: deprecate 'mem' parameter of '-numa node' option
  numa: deprecate implict memory distribution between nodes

 numa.c               |  5 +++++
 qemu-deprecated.texi | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.7.4

