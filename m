Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp232231lff;
        Sat, 18 Jan 2020 00:56:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzE3U3CHxvNM78N5pw8/ILi0Ig9/x54cKpIq8KNCnr+rMHBroRqFL7TmkRAOiXIqO2nz5QQ
X-Received: by 2002:a0c:f513:: with SMTP id j19mr11518334qvm.206.1579337801075;
        Sat, 18 Jan 2020 00:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579337801; cv=none;
        d=google.com; s=arc-20160816;
        b=H2pbIKhot7bHnfRpF8jpt1XErCVR9jZywwWVi7hobSegDSfMVCRy9EFTsahNPgUip2
         ZtUOdrP4Psus6c09wZsyd1LtruKN2PTr38sui8VY/ePGYBW12B4yUmxQxzCWoYRiHbq/
         W7EmiEHdeGIOWTz3n7ThWmeIRlUdC/MQTHGPk/0ejsQbteKgjgqS35+CMTnF/adE9X9H
         WgGjmXubYavAN2LxALIiXWsKJqEzn+AkBkevqmnSuK9RcTkaoalbIpclsJ2fWB0ecmqV
         NiWWQaZLBW9bjlPk8b7NRS3txyD28enGgSbzBj4d6tqBguWsDC/+Xu8BlL2LwYPCFmeo
         rbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6ndBVXUXq4bVFwB7NxD99RDj4Gmf/83NkA1b9g+NEWU=;
        b=qIjy0mxHMZyk7RrBEYa2PIuniKX9/SOs6OmPRxqAjSAKWmA2WHFhBJaLagD4+QNmvt
         nh4/jX+y5H8vC+zWRphV9atyJJbGymDhltGVyHMLzvYlvSOBfoW7NZM8pF+xbA6zaPCn
         cOcehP34aL6liHiwYKVeC5un3Vg4bcde8xvAXcPA0irMQ5CunI6HWBLOlafcrhkUrBl5
         SPeBL/60LViyQrt9h4WrwXO4CjsEZxW8xU6j0HTQLqmPiTrYiATxjxzNuZv/3nXw1aC8
         yckvHKYLBBdV7IiRHymKWL4wktR9AJN0J9unxeKknMu4/l6WzLw2n3NgZklIsx0npq/7
         b9uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PHXOKlfA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si17533453qkg.93.2020.01.18.00.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 00:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PHXOKlfA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isjuK-0001DI-Fp
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 03:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isjt7-0000EA-3o
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 03:55:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isjt4-0004Mj-GS
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 03:55:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23396
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isjt4-0004M0-DF
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 03:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579337721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6ndBVXUXq4bVFwB7NxD99RDj4Gmf/83NkA1b9g+NEWU=;
 b=PHXOKlfAW3QDqXRDEyNsfxh3a5OSC0T1QWqgThcCETHIQ4dl/k73NF49ekhsVp2UZzhenc
 ICFtLzBDeOdQc2hQzlm541OZf64iWZKT0EotjyH4Rl6FBgJrGSO2LhJvdstm8KiQqmENkw
 g8J6d8VdQlhYu9Peq3zyGpj6GF8UV60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-geYg4HDhMMiogkhFqDyGlA-1; Sat, 18 Jan 2020 03:55:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F2A1184C71F;
 Sat, 18 Jan 2020 08:55:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-59.brq.redhat.com [10.40.204.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C227F5C1B2;
 Sat, 18 Jan 2020 08:55:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] MAINTAINERS: ARM & SD fixes
Date: Sat, 18 Jan 2020 09:55:07 +0100
Message-Id: <20200118085509.30182-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: geYg4HDhMMiogkhFqDyGlA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BlEhcklIgB58

Few fixes after looking at Vladimir's commit-per-subsystem.py script:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg651545.html

Since v1 [*]:
- Rebased (dropping patch 1 merged as 1232ed1f27 via qemu-trivial)
- Add qemu-arm@nongnu.org to STM32F405 and Netduino Plus 2
- Added Alistair R-b tag

[*]  https://www.mail-archive.com/qemu-devel@nongnu.org/msg651746.html
Supersedes: <20191012065426.10772-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (2):
  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines
  MAINTAINERS: Move the OMAP section inside the ARM Machines one

 MAINTAINERS | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

--=20
2.21.1

