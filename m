Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4708946wrt;
        Sun, 25 Nov 2018 12:55:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XYXJYF7VVk8ngnzeUDXS/YaVH1oXoRxW7XFAfHbIRW0Cqz8akijanjD+wvYRjZ2a4OIY4L
X-Received: by 2002:a25:6dc5:: with SMTP id i188-v6mr25222306ybc.347.1543179315333;
        Sun, 25 Nov 2018 12:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543179315; cv=none;
        d=google.com; s=arc-20160816;
        b=Diqa+5wha124b35juxAv0frzlxtpKMF3zIen9rg6rFLgKPwAa3ni652zqD7FejR5QZ
         kTAbSKoP4ATDGnI1Hiv/7r02Al4cokFbqWfAsyYwHSkIcMpvTshkVeZY1DvuY8Sw4wRJ
         Um6Np7y1Fctce7/P+OAJB1lgsDFp4cZ/MEJAuwo4IJ6ThTdiwhRuAL1+XqRLVRxBv3WB
         kmZJnNFwimqJp1PzAC8uUdtMxuFDS/8iIdfQAjuQGGZWfG/Q+F26FvDMWTX0MFFSJi0o
         OdGfxOATGawScivgsUYRHmc9eUWAuDNmQl61eRE3St/FCg9e7xALaXN50tC7oEJaaN1L
         2USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/30IJb4cseBlSyTK+o4srf0k1j2iT6notfSFYXm4fZU=;
        b=XRpBNgoUwz3NJ5q0PcowCDslZZstEs8DBKxL0fVlWhS8prSZOQ0qnqQaVrII1xreb5
         W2rN7EdLzr5siU47Tp8jKGWNPTNy5ZHKIaAZ6DjclzKqx2bpWL0/XKyMIUBMN8mDV4uY
         /d1KhefUCGFyDgeaw0bnWZuG9rJbLKxofj5/fRij3yxMgZrkqZEt5yJQtc0qPWK718iR
         hn1lVbSbiPWp40yZEcLCxizBHsDS1bqrAtBa87cTT5BTYCsze5A3vetdhAsEwlu/n3ez
         h3SlYez3UWXIoCfVdYHYsipXLM9kFP4pu6HHzUpAGCnVvapYcYKfQd9wxhJaopzBlGEf
         Dtow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s198si20528418ywg.402.2018.11.25.12.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 12:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1Qw-0003nf-Mr
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 15:55:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Nc-0000Le-Uz
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:51:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Nc-0005qF-CB
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:51:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1Nc-0005q2-7D; Sun, 25 Nov 2018 15:51:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CC5485550;
	Sun, 25 Nov 2018 20:51:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0710C5C1B2;
	Sun, 25 Nov 2018 20:51:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 21:49:41 +0100
Message-Id: <20181125205000.10324-7-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sun, 25 Nov 2018 20:51:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing entry
 for the Xilinx S3A-DSP 1800 machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QkopRjiIQQns

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e396cbe71..aa17e9bbd3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -822,6 +822,7 @@ petalogix_s3adsp1800
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
+include/hw/char/xilinx_uartlite.h
=20
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
--=20
2.17.2

