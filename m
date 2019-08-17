Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp454147wrs;
        Sat, 17 Aug 2019 03:22:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0f5f8jzLksOW6OOkLTlCTToXgQXPWtW41YF4DdxcwLlJSBgBl2FBoqu3D/w9uwXw/+rWW
X-Received: by 2002:a17:906:f2d0:: with SMTP id gz16mr12569995ejb.21.1566037337751;
        Sat, 17 Aug 2019 03:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037337; cv=none;
        d=google.com; s=arc-20160816;
        b=w9IgWOVQ+aB5pc1qi4ybnU1AH9jjorKJ/FuTO8Gmo6aAnBtMd1W4CLzVptZinwCcmT
         Xj+TmbaTLRt7ivZWWf9ZFkzcTAK3f5GwhkX9tc73zRR+jJHRDBPj7jyLeiMDSnyGemQE
         NWWTXsTBDrYzInNlq1glPEXz9TfOHvgRFSfSuKpXpcDNXzfWVvfPlzIoLt0yDEig9wwh
         J7Ty82+pJh00LycX1Wr7DU4j2lDsbVZa2l0Jn/1yGT14YjCaE7VDx6wSZIsgIA0MafaB
         9ZG4Nsu3SM6nWkDS5tk+WZA+kaU/vhchmbFLwNKU7CBFnmMDP2jQDJG8jue9QSdKoOoH
         wguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ToHkRm5iSAFMCj+iq9Mz6/E3wDoJctdhUawVQVUlGNI=;
        b=oeh+WU9eA9OWhURZJhaDi0qIfFQbacdjD6ad+59DCU0mLh5d6ai1gEjicLrqPtPr5Y
         sIk4v+OVC38hQxCm2AEWs+5N/p3RUgw6XgdVIZDmouN2zzVr22IwJac33TEHbk3WZZhq
         SAXktzyp0ChDl6BgPmsxjZFu0lZO/JiCeFOdKqABAeJ0O4wNDtynULUPfE8xf5rMhNzI
         rFGOA0qeQ/O8iNOClWGggJaSDIkGhwu53o1AaA/8ktHzHlPDg91NSSUV57E6vIlMBqiO
         qWXjZMr9FzUR4ehBb7RYH3Z08fi6RUInqoLwygAYXVLIPVTJJxybM4OK5FubNybS1hw7
         PUKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mv5si4287954ejb.396.2019.08.17.03.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvqi-0003Kt-Ez
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoP-0000mz-JM
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 06:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoO-0004Um-I8
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 06:19:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoM-0004RN-5w; Sat, 17 Aug 2019 06:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E429C049D59;
 Sat, 17 Aug 2019 10:19:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF0FD1E5;
 Sat, 17 Aug 2019 10:19:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:26 +0200
Message-Id: <20190817101931.28386-4-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sat, 17 Aug 2019 10:19:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/8] hw/dma: Do not build the xlnx_dpdma
 device for the MicroBlaze machines
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1p7VKrgFO83u

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
2.18.1

