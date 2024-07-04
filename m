Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp382059njb;
        Wed, 3 Jul 2024 22:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYEE9S75o3/e6L4yKM7kmYTRg97XUbeENiHTUu5cglMg52l3IvTA1QZdfaYdZ6i2NfU4wU5LlZkQjoyAVpsjau+IFQ7axX
X-Google-Smtp-Source: AGHT+IEao++EywbYYsAuFtDwwiwNzjhYFVP6AXEkU+hVtvpPnWSSC7e/gkQnMC32N7gBS4KlW4Tj
X-Received: by 2002:ae9:e718:0:b0:79d:7507:7ace with SMTP id af79cd13be357-79eee1a751amr78411485a.4.1720071462694;
        Wed, 03 Jul 2024 22:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720071462; cv=none;
        d=google.com; s=arc-20160816;
        b=CXNvzt00lV8baZAk5tM9Hh/k6bxH0w7aiMFNRo5BWiEmMh5yrjhnRv6L/N1/fQj1de
         omPg43jL3SetslmVzLZ+W0nKigqDoazXkg+NL6PrzBr1KvVLmrKa3TvHIafq+MD7xh7C
         ITn1egJ4fEIZer44HjDQHc1rkCV6LRqlLv8vMd4Wc/7opMU9RPpfLsyZQFQKGQqVD5RY
         V0e07Lg1PuzcHMgCOJa6SWtz8fugLg+Wa7jddo/VDfWjOoGlkUda9QShd5QwIfEBshU1
         rUTFMa8djyD2QdzBEPyHo65NuAlew2rpuVO++xX1NWL4ACr3afoyMDLXdwMMxnGr49n6
         XePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+v8VZR3/5KyEV+WU0IAs1FpB+dJ1hIztXZA8ewzLmnU=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=Yrikk84MeBJdI6uiwIU1d1bHiIZC27QGf6ZaMvaTx37mASK6rHBtv1Pry84rFIsd8J
         FA0M5Su8AZzpfsoHeelRkrjq4bPKk2euFVIUZeXaOLx4VtSKhde0xNlbJMXIphyhELz1
         saQT1MqWUMis3Z5BAeOx+rb3Savo30bh2BOs+PLF6Cf/M1yotTR+y++wqsIBwx8m5y58
         E4pLuC4wcuU9PV06RXPvFMdJw5wxunDf+Tuy7vLdgRFMgwAl0LTJXpPZBmbPfIxtFIX/
         +y4uUf4+DdG/GJ6bhTWjgkB6Krq1+CiKgfsujNyCGscyqN/6ePznBTXkeeF/CAxhycAG
         M5JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUgKuOWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934c70esi1398041785a.698.2024.07.03.22.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUgKuOWL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPF9b-0001il-MR; Thu, 04 Jul 2024 01:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9a-0001h7-68
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9X-00023X-KI
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720071426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+v8VZR3/5KyEV+WU0IAs1FpB+dJ1hIztXZA8ewzLmnU=;
 b=LUgKuOWLIFOpHDsv4g8wu6sLrdoQzztl/t2iwL5wmtZiF/a37SdSinILMObRQdGIJBcWng
 aMxclouyRS6ebjdbf8ia3UdDbbxTdQRXJrMNDNOJFV+uyDIEo0F7HNNmVdDnZ8A0u5kJf3
 cZzeVP1KtTSrYKvdsr7gbFRs/E5wxdk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-VL5iCIqIPhW7eHwZ_rx4ww-1; Thu,
 04 Jul 2024 01:37:01 -0400
X-MC-Unique: VL5iCIqIPhW7eHwZ_rx4ww-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 63EBC19560AA; Thu,  4 Jul 2024 05:36:58 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AF1E4195607C; Thu,  4 Jul 2024 05:36:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/8] aspeed: Add boot from eMMC support (AST2600)
Date: Thu,  4 Jul 2024 07:36:43 +0200
Message-ID: <20240704053651.1100732-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AuRk9grScyXv

From: Cédric Le Goater <clg@kaod.org>

Hello,

This series enables boot from eMMC on the rainier-bmc machine, which
is the default behavior and also on the AST2600 EVB using a machine
option to change the default.

It depends solely on the availability of an eMMC device model which is
currently being discussed upstream. Numerous patches have been merged
already and remaining ones [1] should be in 9.1 development cycle.
Since the changes of this series are small and localized, it would be
an interesting extension of the AST2600 SoC model for QEMU 9.1.

First 6 patches adjust the machine setup and HW strapping to boot from
eMMC, the last 2 are for the AST2600 EVB and are optional.

Thanks,

C.

[1] https://github.com/legoater/qemu/commits/aspeed-9.1

Cédric Le Goater (8):
  aspeed: Change type of eMMC device
  aspeed: Load eMMC first boot area as a boot rom
  aspeed/scu: Add boot-from-eMMC HW strapping bit for AST2600 SoC
  aspeed: Introduce a AspeedSoCClass 'boot_from_emmc' handler
  aspeed: Set eMMC 'boot-config' property to reflect HW strapping
  aspeed: Add boot-from-eMMC HW strapping bit to rainier-bmc machine
  aspeed: Introduce a 'hw_strap1' machine attribute
  aspeed: Introduce a 'boot-emmc' machine option

 docs/system/arm/aspeed.rst   |  2 ++
 include/hw/arm/aspeed_soc.h  |  1 +
 include/hw/misc/aspeed_scu.h |  4 +++
 hw/arm/aspeed.c              | 60 +++++++++++++++++++++++++++++++-----
 hw/arm/aspeed_ast2600.c      |  8 +++++
 hw/arm/aspeed_soc_common.c   |  7 +++++
 6 files changed, 74 insertions(+), 8 deletions(-)

-- 
2.45.2

