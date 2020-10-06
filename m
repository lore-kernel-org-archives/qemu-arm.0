Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1061177lfq;
        Tue, 6 Oct 2020 15:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+n1XIiaMiKMkrVS/1Hbcdny0p+1BqTlAAhwOH8GdfWPtOcqZQ1NqFyCbzPLZBNqa/Xwvd
X-Received: by 2002:a25:4688:: with SMTP id t130mr485665yba.345.1602022050680;
        Tue, 06 Oct 2020 15:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602022050; cv=none;
        d=google.com; s=arc-20160816;
        b=yx1KPnDYE7c/xuFGLuliWhCrAhIdWr8DHZlqMmFdHZqXJ6/6+OuLSkeJq8jyBwfvin
         YjKdqQuyyDDzvsbx3lwZjcS8PRbY0Bfgt8iZ1DRQn27WE/dIOr7mC7WNH7jVGevv+el4
         O51RQQBTZfCgAUCo0ZEIa7GJpw2/KP4Ws2HTKcIR89t3mkzwYTXVke7upjx5Ea3IzNZB
         EhuzNw1SL8N2T/zjVKRCmEML3b25ZnRDbLt9NbrFQJWPpxabhhY/HbIjuy9XMFrH+25B
         LfrLnQOieZAi/cHRh0PzgHHrxsxI7CGPJdqVMPyYbcn5tiJXd/iBTrHrln7r8Lh/OWSH
         AaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=ils0BP+cNaOMg3GKRSynEad9TgRvNzhouxtHidMz3tU=;
        b=cZODUdiXiptnp7V4VuGjy7KKKfDO2ZJ3ypdxh9gKAngW1WCfVI6OShtd9H456beepl
         HZnhYivFzw1IQtFNAYAtDOYfBXe5sX9+LJD9ftmofJcb/2RAUzqlv5WVTxH/0P4vJHqj
         BxM7dwElYG79YoKkKcb157vMdM+8MuovaCohsa5B7qZv4k0Z9vA7jZiFkOQzrNLmbKEB
         OMtay3Bo55mR2qsfyNvOAhxUZ+ntsbTHs0K9U5CMsO/O/HgEErIdqBrNqr2FWayACGcn
         8vEWbtF6AZfM+1mzLSeh0Jk53ajhn7/XqK9WZlWuFgC3LUiGIUBqUeXyGG3YMTDr8Uak
         agzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6nOfBl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si281658yba.8.2020.10.06.15.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 15:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D6nOfBl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPv7K-000520-2m
	for alex.bennee@linaro.org; Tue, 06 Oct 2020 18:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv6m-0004zN-1F
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 18:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv6i-0006Am-Oe
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 18:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ils0BP+cNaOMg3GKRSynEad9TgRvNzhouxtHidMz3tU=;
 b=D6nOfBl4radBOL4DZWVzcNNKDDD2e8DzlzP4P3Xs7h1nAJOQ6ElJdTOarmQjL4z0/GZLAD
 G9RTMRrVkWL8QFGd5Wa+5zNuifnyegzBB2BCQ1ErC+Ljt2XbpGCA/4KjA6Ulwlo82vtCpq
 c8lQ/W8Jso9EQH0EQ/fP2+CwUOO2hLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-8-4HMb4qOeK2eQbEzfTxIw-1; Tue, 06 Oct 2020 18:06:49 -0400
X-MC-Unique: 8-4HMb4qOeK2eQbEzfTxIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A7DA1018F7A;
 Tue,  6 Oct 2020 22:06:48 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F20495D9CD;
 Tue,  6 Oct 2020 22:06:47 +0000 (UTC)
Date: Tue, 6 Oct 2020 18:06:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Purpose of QOM properties registered at realize time?
Message-ID: <20201006220647.GR7303@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+wbvCBtIy6k

Hi,

While trying to understand how QOM properties are used in QEMU, I
stumbled upon multiple cases where alias properties are added at
realize time.

Now, I don't understand why those properties exist.  As the
properties are added at realize time, I assume they aren't
supposed to be touched by the user at all.  If they are not
supposed to be touched by the user, what exactly is the purpose
of those QOM properties?

For reference, these are the cases I've found:

$ git grep -nwpE 'object_property_add_alias|qdev_pass_gpios|qdev_alias_all_properties' | grep -A1 realize
hw/arm/allwinner-a10.c=71=static void aw_a10_realize(DeviceState *dev, Error **errp)
hw/arm/allwinner-a10.c:89:    qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
--
hw/arm/allwinner-h3.c=232=static void allwinner_h3_realize(DeviceState *dev, Error **errp)
hw/arm/allwinner-h3.c:359:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->mmc0),
--
hw/arm/armsse.c=429=static void armsse_realize(DeviceState *dev, Error **errp)
hw/arm/armsse.c:1092:    qdev_pass_gpios(dev_secctl, dev, "mscexp_status");
--
hw/arm/armv7m.c=149=static void armv7m_realize(DeviceState *dev, Error **errp)
hw/arm/armv7m.c:219:    qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
--
hw/arm/bcm2835_peripherals.c=128=static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
hw/arm/bcm2835_peripherals.c:322:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
--
hw/arm/bcm2836.c=69=static void bcm2836_realize(DeviceState *dev, Error **errp)
hw/arm/bcm2836.c:87:    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
hw/arm/msf2-soc.c=79=static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
hw/arm/msf2-soc.c:170:        object_property_add_alias(OBJECT(s), bus_name,
--
hw/arm/nrf51_soc.c=58=static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
hw/arm/nrf51_soc.c:138:    qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
--
hw/arm/xlnx-zynqmp.c=276=static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
hw/arm/xlnx-zynqmp.c:522:        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus");
--
hw/misc/mac_via.c=1011=static void mac_via_realize(DeviceState *dev, Error **errp)
hw/misc/mac_via.c:1028:    object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
--
hw/ppc/spapr_drc.c=511=static void realize(DeviceState *d, Error **errp)
hw/ppc/spapr_drc.c:530:    object_property_add_alias(root_container, link_name,
hw/riscv/sifive_e.c=186=static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
hw/riscv/sifive_e.c:233:    qdev_pass_gpios(DEVICE(&s->gpio), dev, NULL);
hw/riscv/sifive_u.c=651=static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
hw/riscv/sifive_u.c:743:    qdev_pass_gpios(DEVICE(&s->gpio), dev, NULL);

-- 
Eduardo

