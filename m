Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1709867wrh;
        Sat, 27 Apr 2019 07:16:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMLXBmQHz9EUSTgnA7KrvBaSrGRUo9cNzgEnd9IsXTYqLHpOFWCHgV2jK9Fco/tprqd35r
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr26586259wrj.189.1556374578865;
        Sat, 27 Apr 2019 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556374578; cv=none;
        d=google.com; s=arc-20160816;
        b=ICJM8ryfmjGboC9F/x5Fu+28T+CHf9PkcKGYNx+py1m2W3Da19Vm3jW7vHvAmyxve9
         yPrRLqXcJ8fGY9kkzfV8G5r7y5A4b8R+2xAxywS4w28n88EZ9f1Y9/J+9s4yRPk2iX67
         ec3L6ViaJHrJWIKXqrmf34eEmhsz3mB/Rp+lSdssPAJY/b8QUvf2nbPiNTXzzgY9V5Op
         jjUvXKctzkV4DRynBb5shdYV6q6b+0rykVI4FlMYn0E5R+Tak4C2uVQi8JyYpaHccjRv
         sX312YpKpaU5cLzhxY5MwaaLAHTqq69SpLtvt1YcpQxPbYP9JNKR7dDpTKjydlbkPJvn
         ODUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6Xck5ewspKzgJa+OwSuFCiKt4EJIne+VnWtpFzUb9Mw=;
        b=r2qwT7ZKWXt3aZww+D5QRDegljbevG05AlcAgXRqGCQhFGzfWICpjKyZiWeIFeJwqO
         LPtHvBsWG4Ly4Oi4Hk8Td0WD1+WdCXJHXHDLvUIWRnPiwM6aHlYXXUD4rSMsoRXSv4jv
         LQDvSVAG9A6yfQc/QMC+R+vazaJd1Uff8FIyTJq5rNP9KKliYF3VPLiUKDn40zYFcDUc
         ARdx6gSK5EnFzQGPwH/DkOaahMZPfaqztAK6dEDbOXs1gBQqhBs/4R920XUk5JoY/N4o
         nDYbY4M3Du8PM/KNncGJdPUG3dMAWk3Wjo3RVG6jTa6g1nR9oRlvna2kyr9s+3PBLr4g
         fB5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si17748376wrn.78.2019.04.27.07.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 07:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKO7l-0006Y8-SF
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 10:16:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6r-0006Ln-90
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 10:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6q-0000cF-Dx
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 10:15:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKO6o-0000aQ-Cy; Sat, 27 Apr 2019 10:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A569E12FE2;
	Sat, 27 Apr 2019 14:15:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867E750A63;
	Sat, 27 Apr 2019 14:15:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 16:14:59 +0200
Message-Id: <20190427141459.19728-4-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-1-philmd@redhat.com>
References: <20190427141459.19728-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 27 Apr 2019 14:15:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] hw/dma: Do not build the xlnx_dpdma device
 for the MicroBlaze machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NtLmSQ4/4bFF

The xlnx_dpdma device is only used by the ZynqMP AArch64 machine
(not the MicroBlaze PMU). Remove it from the ZynqMP generic objects.
(Note, this entry was duplicated for the AArch64).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 79affecc390..a5b1276f52a 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -8,7 +8,6 @@ common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
 common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
 common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dpdma.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o
 common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o
=20
--=20
2.20.1

