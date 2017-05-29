Received: by 10.25.0.6 with SMTP id 6csp1489968lfa;
        Mon, 29 May 2017 10:38:13 -0700 (PDT)
X-Received: by 10.200.35.28 with SMTP id a28mr20066022qta.169.1496079492915;
        Mon, 29 May 2017 10:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496079492; cv=none;
        d=google.com; s=arc-20160816;
        b=gX27G9bxkDzxKG30ArQdM4he7s+35hJgF4zIZn9DmhhAVTfpJ8Zc6x1AjxCnYQSiqW
         ArJqRVDZPspjFGYJtGuocAQzL6RWjk929tdIhDx00FuMzDHUADtzyiTpXlV8S1+DMMF/
         jWXmvOXaeZYh1HwhueWHShhGU3lrmt5ytBH5svOze737vwdZVP90xo4ok5v+ZtJcR1Es
         +BNPnseH7aFLG27L9GMSiwuxIEEaDNds0zbcmpD5NpcwllnZ5onEqqOY0TycTNGNNU+x
         gMI+FnIR9jVq473Dh+MuHvajx0fqo8m7ranzcjh8Uo6Sj/04ohy9bGsFsAuE9X9EiNlr
         IDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=O1kW/XENx4fvSkL8lH9Oj5SlXBGYYL9kALQpV66Oey0=;
        b=FmE+v/9RZhmcJiGPkevpS+5oGSSBkaGsrBf1a7pLdpG12rkiaBjqMaUpu1XEliUzRf
         6aRpT9ZVWfwtONQZeufqkI2tvX+WjPa3DhIOhg6A5okY5GHEWyxo8da+zcv4WH10vIUn
         p2reYk94j1wFu0L2Y0XO+2o3/lbUJcsaXDL1w/xUKZ/UJXrf0+9Kj4ZQkUBprA1o+FJ+
         nXLLgfZSfn9B5QGs4Ph0lbYX1YJcz8j/89ZCKydkJK6vLjK6mpZH98hK3KEeyPiE0Z08
         HnSpk3Suqsqmph9Mf0KEQe0bDma7MK77KArtwHyy+y8w7sKcWlS1oHwvggsc5sWGGHHk
         O5Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r24si10177546qtr.257.2017.05.29.10.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 10:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFOcO-0005Mi-7I
	for alex.bennee@linaro.org; Mon, 29 May 2017 13:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOcD-0005KG-05
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOc9-0002Ns-1i
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dFOc8-0002NT-RU; Mon, 29 May 2017 13:37:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A43423680C;
	Mon, 29 May 2017 17:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A43423680C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A43423680C
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E78B60BE2;
	Mon, 29 May 2017 17:37:53 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 29 May 2017 19:37:49 +0200
Message-Id: <20170529173751.3443-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 29 May 2017 17:37:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] hw/arm/virt: numa: provide distance info
 when needed
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
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EjmcE5jv3yN3

Andrew Jones (2):
  hw/arm/virt-acpi-build: build SLIT when needed
  hw/arm/virt: fdt: generate distance-map when needed

 hw/arm/virt-acpi-build.c |  4 ++++
 hw/arm/virt.c            | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.9.4

