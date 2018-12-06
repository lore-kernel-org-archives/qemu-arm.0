Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10869643wrt;
        Thu, 6 Dec 2018 09:10:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VR7PwjlA3opKhYFroKXv8XLlF6fg3xFUKGZjcmQOy5bEZX+WrmMDvNZC7ZLaZ972Z2pJtv
X-Received: by 2002:a0c:f313:: with SMTP id j19mr28342263qvl.200.1544116220700;
        Thu, 06 Dec 2018 09:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544116220; cv=none;
        d=google.com; s=arc-20160816;
        b=xY8FCPZ1o2OrbFhRojDGDYGligMwhTBNsQ0HD7e8tMUSZHy6QOq1Jcjs/a3DFNZUiU
         4Q/J0myZYa7rp0EsUJbN9GHTVJZ+PFYpnAQZvuWFrSBSE61hsJb9jL2f4WQV76pJbaMl
         thN7WR20xjuL98GwoG4gqfm48N9PUkfkeUfemvXAP/0V2P8jRvRkQM2pdG7OoCEq1Aj7
         R7JJasLTLIXO7qjM+n6dIJhbSNPjXQOb80gwaNhdBO7nOmZOiEYefKZcBXazhODFFPeN
         X1smyWKX7iwXl7vg7fpC0XWzdNKAWik3WYY2LTMSQY5GRapuRIgWAyx0sbv/IRpjd/b2
         IIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=OrKUcxcYjKBVYhcu5o7slpkPLDv3RvfrQwGMxgRhVqw=;
        b=njHLs3G+x7+T/Nv4QtPl8EPnGjscYY9YeltQ4m+Bbwpu22hVzxHQrA8l0tY3r7ldra
         hL7AaBQkeXeNvNMCpUAZWE8q5YbPTqY4gT+4msAwNrntQcI+6wx8VXJ4eqhLD5kYkj4Q
         Cx4jVR/cQxntO/T6X73+gK6mOFfCbejdQ+7r8sVpkEGRWl59zveNfXg3LflLlykHlLss
         1dV3yVZFQSfTrHBfDuP3oaZEIWBIXBc0sPJvl60RzjbVhE6roO4hmgXx8UtB3QFb0CNw
         Av5KEnfIZAkmiaIBO8lnlgQPaK3rovOvac6QwbtD7t/d1YRtXsrLDgNvU4P9uzBaSOLo
         cCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si641002qti.54.2018.12.06.09.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 09:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUxAK-0001Pi-6o
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 12:10:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx87-0000Dx-KJ
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 12:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx7u-0002sD-0N
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 12:07:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gUx7j-0002jS-7t; Thu, 06 Dec 2018 12:07:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16949300208D;
	Thu,  6 Dec 2018 17:07:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27F3C5D9CD;
	Thu,  6 Dec 2018 17:07:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Thu,  6 Dec 2018 18:07:31 +0100
Message-Id: <20181206170733.7469-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 06 Dec 2018 17:07:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.0 v2 0/2] ARM SMMUv3: Fix ACPI integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ky229V8zwEiH

The first patch sets the COHACC override flag in the IORT SMMUv3 node.
This fixes a bug reported while decoding the command queue entries.

The second patch updates the RC and SMMUv3 node structures according to
revision D of the IORT spec and updates the revision fields.

Best Regards

Eric

History:

v1 -> v2:
- split into 2 separate patches
- sets the revision fields

Eric Auger (2):
  hw/arm/virt-acpi-build: Set COHACC override flag in IORT SMMUv3 node
  hw/arm/virt-acpi-build: IORT Update for revision D

 hw/arm/virt-acpi-build.c    |  5 +++++
 include/hw/acpi/acpi-defs.h | 10 ++++++++++
 2 files changed, 15 insertions(+)

-- 
2.17.2

