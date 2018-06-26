Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5429466wrq;
        Tue, 26 Jun 2018 13:21:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcnKER1sm5QXHk6Rpj1QlMSOQwZBqGG4U/NCt4n8alhmdeDV0W9OKywFOpyGULSb1poWJke
X-Received: by 2002:aed:2299:: with SMTP id p25-v6mr2444201qtc.70.1530044518123;
        Tue, 26 Jun 2018 13:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530044518; cv=none;
        d=google.com; s=arc-20160816;
        b=bbYeEXpBqYs6vWX17SaQl+TlpBKsUipqiYjiH+oXfSzOgZNLruuAWZvBz1MbHKZ602
         fY/f2QFDqoASCnNJEbPHTvUcSEcysMO7tRR5wYS5tjy/di7H1CsYyIWWZ/0M5tgoX5hY
         mQG3hqikXh6wQpt+7jS9GhDKUqFsnCr6dBlkgb/HnY/EEsN1MKlgNk86nWXY6LJLBMU7
         3hr/eJcjLAVh2usQOgak6p1XJLP1Irnk8r1TxnfGITUrPi0yj8ygzQ+v0r3pPjEotPzG
         zUeBG9FFS2nvG0c+XbBn3UHC9LxzGbSWGmIWfUmSh2AJtXcx6BoG8YY5/0wUUap8S+tT
         gRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=x+DaZ1oa2a4yy5UyS3lS8aNkmOrSTRh9Hdg+DjhqjDI=;
        b=w3jWfBk8mq93Ho1qMgI9Bp2kgKC0KCDKKKERI4YFNeynJtQSRq7D/uq9GqKI/x9uEX
         ksikmkt8BR90wBMNoqDLtOp5mDJVhvw7D77iGDglCcz9ByzfKxYlg2H+oVfzfyhYmM53
         qBbIXGYxDVQ4mJMnSusgvU6PGfLYIIzSCo9KwmAAcG7XGYtx27+vsYmzcaRkn0S9b35O
         SDg6Qj8PEkvOWjGYWFCNUJHsjYDXxUyTXAva0+b5+MI/CMvOJft4U2gGLRzi73mSnlPH
         IF1eOqncsu0/TlZVXwCeXKSlNaEYKZItTAdWdCabeWloF5gCTC5NQoO9KZHsAy15eqWy
         2Fgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v50-v6si2357570qtc.125.2018.06.26.13.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 13:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXuTN-0007wS-8e
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 16:21:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT9-0007w4-C8
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fXuT5-0006z8-DM
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 16:21:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38948 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fXuT5-0006y7-8a; Tue, 26 Jun 2018 16:21:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C91ABF57F;
	Tue, 26 Jun 2018 20:21:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34A341117643;
	Tue, 26 Jun 2018 20:21:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	agraf@suse.de
Date: Tue, 26 Jun 2018 22:21:29 +0200
Message-Id: <1530044492-24921-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 20:21:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 20:21:38 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 0/3] ARM virt: Silence dtc warnings
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
X-TUID: xRawU5WZF7NS

When running dtc on the guest /proc/device-tree, we get the
following warnings: "Warning (unit_address_vs_reg): Node <name>
has a reg or ranges property, but no unit name", with name:
/intc, /intc/its, /intc/v2m, /memory.

This series removes those warnings by adding the unit address to
the corresponding node names.

This is based on Peter's target-arm.next

Best Regards

Eric

History:
v3 -> v4:
- rebased on Peter's target-arm.next

v2 -> v3:
- only nop root /memory and /memory@unit-address nodes
- remove a deprecated comment

v1 -> v2:
- nop existing node-name and node-name@unit-address nodes and
  add our owns.
- added 1st patch device_tree: Add qemu_fdt_node_unit_path

Eric Auger (3):
  device_tree: Add qemu_fdt_node_unit_path
  hw/arm/virt: Silence dtc /intc warnings
  hw/arm/virt: Silence dtc /memory warning

 device_tree.c                | 55 ++++++++++++++++++++++++++++++++++
 hw/arm/boot.c                | 41 ++++++++++++++------------
 hw/arm/virt.c                | 70 +++++++++++++++++++++++++-------------------
 include/sysemu/device_tree.h | 16 ++++++++++
 4 files changed, 134 insertions(+), 48 deletions(-)

-- 
2.5.5

