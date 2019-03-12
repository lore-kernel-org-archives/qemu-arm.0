Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1042263wrs;
        Tue, 12 Mar 2019 16:54:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGigrymLIliRG9BXtFUzzg46QTc+S3qaCer2Nxz11KSJo+Jw/0t/HY+DtR8gCWZ95C0XiX
X-Received: by 2002:a25:e43:: with SMTP id 64mr4360403ybo.27.1552434887217;
        Tue, 12 Mar 2019 16:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552434887; cv=none;
        d=google.com; s=arc-20160816;
        b=onbKnzAN+fvT9OT/clVnNpQky9hjdj+Jky0k1KT3jBbBhIYYH2Gb2y74e1gdO6alpk
         /vJeT3CAgYsdWjmBQ2+l+ucVach+EHI3iYif1Grne7IgKQYj8EQQCAhFsl2Qp8SgtNS6
         6VMzDXzya3ipv9EjGKX49596QH+7czaITXCw9InAp8afBpj86e6XLNWJOS4m79cp1mrw
         Tq9cQdU+yfNqaWoTpdNFoXf6LYgVyISp6nXyNodh/GtebY0HgxLEpvY+VnAzDrpFgLhP
         ar9cAZgYxe7p6ybSCC2kSYYR+h6hCFqrO0np6KDho4hrx56Io8fBeCs2VRw3loY+gvO2
         agng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=GNfataJKtzeNcxjPKCRKed71fCh2X7d1juCLKomNHoU=;
        b=kP/Dn3/KkVzsjzIXF7YVz26NslxN9ExBRe1F1didGMgXNjfsrhmsZJyCmKXZboVprS
         FK872kko9jE9X7SAvmjica/MI7UV5vBZ1JbAjkZqa+Mu78C59xCehP0KUNfpr6bhJMVr
         VIA215Pu+VnG7D0qf9uhBV4nhghSl5nHiemhZWL2fL8Xu1k3IdYmYv+533/UoupkJ3AA
         XBP/V+9QaANSKE4P451aZCUH/+SGD3T1/XKWVCJgRI0LAUYaz4k2CP0tFuCfT1yDAxav
         Dwq4jFPTpmg9M6UgDnp9zKLXC/zrmS2Ua/XgEu4fmtnz+fAmU2RD9t0LCZ05icKP7rX4
         9S8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r129si5927838yba.216.2019.03.12.16.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 16:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3rEM-0004S8-MG
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 19:54:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3rCN-0002te-5K
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3r5k-0001xf-W1
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:45:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3r5k-0001vT-OS; Tue, 12 Mar 2019 19:45:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52BB33082E6E;
	Tue, 12 Mar 2019 23:45:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F6327C41;
	Tue, 12 Mar 2019 23:45:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Wed, 13 Mar 2019 00:45:39 +0100
Message-Id: <20190312234541.2887-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 12 Mar 2019 23:45:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/2] Acceptance Tests: Test the Raspberry Pi 2
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxCbLQAojZsW

Add the raspi2 to the list of boards tested by the
boot_linux_console Avocado test.

Based on "Acceptance Tests: target architecture support" v5:
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04111.html
Based-on: <20190312171824.5134-1-crosa@redhat.com>

Philippe Mathieu-Daud=C3=A9 (2):
  BootLinuxConsoleTest: Let extract_from_deb handle various compressions
  Boot Linux Console Test: add a test for the Raspberry Pi 2

 tests/acceptance/boot_linux_console.py | 34 ++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

--=20
2.20.1

