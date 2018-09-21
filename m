Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2860214wrd;
        Fri, 21 Sep 2018 01:29:05 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaZBn4eoYWrT9JQGxUXCTpWCgNuOtfbY00c9QhTNIBoYLgGmYDOx5Ay1lDvUxODN4vPQyeo
X-Received: by 2002:a0c:cc09:: with SMTP id r9-v6mr30878281qvk.95.1537518545132;
        Fri, 21 Sep 2018 01:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518545; cv=none;
        d=google.com; s=arc-20160816;
        b=hPw89xUy9AwBW96JL09f0m51FRuATE2gVOqDZNHyvVCews11FavVE4l101eFVUalKC
         bG5nrCzJGnblIpovwM1X7g1K0TVUM5kLg0SBdKuf0QmILZq/FZ1W3W+tgMusrm33l8fQ
         rajd2KIMwUgiEH6SAcH2JJL1yKST13a8BsLLjjH8oXHz/9OCLNQi2rDuNQT+BVYj8Iyn
         wM6V4ScBZmxogPkw3OxbpkTun1dvkadu3oEzaErktzsY18S1EEtQL8Umxoc9BTPJyZ3m
         HLcA4dz+/xg3HXNXyY0f1agmnnM7r/EYpAspzDLkswNrarFTJL4UlefBvkVfhy/Gy7gc
         CkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=D5pThatEmCuH1Zs4pIbL4RuvsBk4NR/j9cbUA8+FXgc=;
        b=uiq5LUvwjLcZwy9U9LROIFIuTcjMUEwmlvp+TSSa0yaZds44zXt1wLYX8SSaEOW0KC
         ughVwPzDUWTcxjNgFz2m2ruEICB/UlInGlSj8S8YS0G+i6H83BBqT8kpTgWeWRXC79Ix
         AAnohsgSFIjqx4ii0RvkzUflnazpAzWTcv6OUK8MojbCgSMGy6p0dUjqgC+UXysgCILE
         wvZ/wbYqyk6ea3WWWLPKH11M5gb3D1B+6haxjTKHsn3rP1JJ1REhwxcOzIrqAKwYmGMg
         oCo4mqsrUFFO4I1SnHc0p3L7UOPhJzq5ZQTQM8/+g02kZ+dP10ZOkus12NLzmvqyXyqM
         a9Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31-v6si138781qtd.240.2018.09.21.01.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GoC-00059l-HZ
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gfp-0004pt-U7
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gfl-0004ii-On
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gfd-0004SX-BV; Fri, 21 Sep 2018 04:20:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 461DD30832C5;
	Fri, 21 Sep 2018 08:20:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A25EF7D665;
	Fri, 21 Sep 2018 08:19:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:03 +0200
Message-Id: <20180921081819.9203-13-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 21 Sep 2018 08:20:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 12/28] memory: Add arch_id in IOTLBEntry
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cG5CcAHexubd

TLB entries are usually tagged with some ids such as the asid
or pasid. When propagating an invalidation command from the
guest to the host, we need to pass this id.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index d4486d4e6b..93150e1450 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -75,6 +75,7 @@ struct IOMMUTLBEntry {
     hwaddr           translated_addr;
     hwaddr           addr_mask;  /* 0xfff = 4k translation */
     IOMMUAccessFlags perm;
+    uint32_t         arch_id; /* architecture specific ID tagging the TLB */
 };
 
 typedef struct IOMMUConfig {
-- 
2.17.1

