Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5332011wrv;
        Wed, 31 Jul 2019 00:58:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy59vOr5m9M48eCtt9xfz2PPj3Ebp6y5UTEmMow3fbMo6pIV3UmtCwd5c8PGVP5QERfZI+W
X-Received: by 2002:a17:906:3108:: with SMTP id 8mr13859715ejx.196.1564559909055;
        Wed, 31 Jul 2019 00:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559909; cv=none;
        d=google.com; s=arc-20160816;
        b=yK0ErIQwaUf4Hve14obZ/GfKqoxvxdNeybW/XxOKSStQtAu/iAPBDmTzajtLHbFpzJ
         GCWuT53G1tfpmpcI9CUi+8Stu2UXGGjoMUFRhfU0vRito2wCHLdp8F4tZwa/dayA7xZI
         2YIt3mm+st+6l/dgPr1WL7+TVZ4p71cm4kO0Sf2ikUiuN21KgCrit+P4od+6wSdbxS06
         8rtG0YzBoDU3j/iBBUyYHE69fe8amkVFlH9d11ePgMXKWWepCQXHgAXPNCb/HbGQ++re
         FLaskpDeX/9fyHwo8bPazjIKwDd7muauTU8M/zrtjdTa3e+64zEOyCW/Kvyr6Dla37lY
         K5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IL2BqwAlkzKWqVApPyI9JkIr77F6JN8pK31q4yA8GSQ=;
        b=ffVPOJ1BxCTmZcfLJyD6EhWEJHjaLCsepoN9OFiIRsGLATgxgPpAoKnQcSK8VU2pb8
         mtam9iQItXbkzmjyH4xSzNrNGI5xFHXEMueLMzGyRZkiGeHFKuH8PFOBLFPojt0olaoo
         cUmbi/lT5EBFRIG9ooBiPG7sAUAApdA2faSq9Mz5KGKbpRfCAu5kz1jNMb2UDxoFiPjQ
         zTEAv6u1ij4OXsTKisN0MycHratNXyISOe47fEb8pg9Kr3t12t1BwUfwvkn5DTQftoxS
         +SXwDfdSHKyJfnN0nb3J07IoF8JC8IffBgTpiaJWQlQFJoT41p3/njJW4hhjF/I3d3CY
         DZDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si17527228ejj.176.2019.07.31.00.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjVE-0004gp-5K
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjU1-0001zr-Bk
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjU0-0007zd-Cl
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32862)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjU0-0007z2-75; Wed, 31 Jul 2019 03:57:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F5A583F4C;
 Wed, 31 Jul 2019 07:57:11 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D70105C205;
 Wed, 31 Jul 2019 07:57:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:47 +0200
Message-Id: <20190731075652.17053-4-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 31 Jul 2019 07:57:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/8] hw/dma: Do not build the xlnx_dpdma
 device for the MicroBlaze machines
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TNRKF8sBa5+X

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The xlnx_dpdma device is only used by the ZynqMP AArch64 machine
(not the MicroBlaze PMU). Remove it from the ZynqMP generic objects.
(Note, this entry was duplicated for the AArch64).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-4-philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 8b39f9c600..b672e7a522 100644
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
2.21.0

