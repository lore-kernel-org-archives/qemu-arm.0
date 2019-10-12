Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1798770wrm;
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyU8OtBVkE2RFAMns9yfMfzPFk9FJqj8tz/h1V51wSWPHolg2qr9Am304sGI61gMdbEbCPz
X-Received: by 2002:ac8:4293:: with SMTP id o19mr22007237qtl.230.1570863290699;
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570863290; cv=none;
        d=google.com; s=arc-20160816;
        b=vcrPPiupflIniB1sYVBWuqG/z/RPJ4YhP2MF28lFGavc6Ozsqfd6JGyPN4nOr43z/Z
         dl5Baxv4vdjeJVYgXod2zn2jFG00hJuvr3GIgsf/x1pqEcc67v+1qHqaBPpPu/EYcRhs
         f0yj39eNGrx8OLNRsl1OoPyXAT7+rsTbP42gQmPaRBnNNXmFT3XTjdooBLzWaVxxijKq
         KuYEhll6T0xpJWykeLtDxAXYFovDUiMOS3/+/weXtkAt9QMeVrjQOFShtT8X1f49GyW2
         dN12OQBwiMsEXhJLN5HDTmit6SQxraVGZvSj30ua3+jTiwBhHrZSwP6AhPNn6yvVLTWq
         cwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=+rXehZTZUct/rqblJf8xLiPn+q2HWhK51hUjTWgHJTM=;
        b=ggX970UWleDn+bmDELWh6kO2e8JlGyNcz+fWW7sJ77cSRsoC5HowauCUMfVHh1LyUM
         zkZlBf6A2LU1XOnXKxWJfT8PMA1JORmtakhI8aIyR4L8gpv2F2U8RbzMelStNRnhYarf
         xDtUtuN7uQ0vRc0vEEg3Qa5/tA2IgMRz2gMiLmJP80+V2ZDTQ80jtipN9JhJwPFgN3gS
         I6Xs/BH0dWGvNFQ9uadVSZ8567kRrIvWx/wJ3MF+DiRoG8RqtWxwIc5cWX8/L3sk0Uuv
         aTtbu39nUVcbFTGBWlpayWMFE8lXcXnOfJgFQIXSwolnV7jaDuTTz6T9UHbsw4qRwOnB
         QqJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j62si11085379qtd.367.2019.10.11.23.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 23:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJBIf-00046n-RL
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 02:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJBIT-00045p-9L
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 02:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJBIR-0006Dp-HB
 for qemu-arm@nongnu.org; Sat, 12 Oct 2019 02:54:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iJBIR-0006Dj-Be; Sat, 12 Oct 2019 02:54:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBF22309843A;
 Sat, 12 Oct 2019 06:54:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-46.brq.redhat.com [10.40.204.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78AF65D6C8;
 Sat, 12 Oct 2019 06:54:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] MAINTAINERS: ARM & SD fixes
Date: Sat, 12 Oct 2019 08:54:23 +0200
Message-Id: <20191012065426.10772-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Sat, 12 Oct 2019 06:54:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4YY+FvCrJmgN

Few fixes after looking at Vladimir's commit-per-subsystem.py script:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg651545.html

Philippe Mathieu-Daud=C3=A9 (3):
  MAINTAINERS: Add hw/sd/ssi-sd.c in the SD section
  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines
  MAINTAINERS: Move the OMAP section inside the ARM Machines one

 MAINTAINERS | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

--=20
2.21.0

