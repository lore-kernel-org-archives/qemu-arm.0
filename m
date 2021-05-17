Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1594011lfm;
        Mon, 17 May 2021 13:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAj/SVKmrYNDgapr4p8srcqbpW/kyn4DAlo3ySdNiifZKS3YS1qZYu8zcNFC5utYniXBSj
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr1389072iod.47.1621281904004;
        Mon, 17 May 2021 13:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621281904; cv=none;
        d=google.com; s=arc-20160816;
        b=HBZHz+5XV27Acwq4rZ9qaFBpcK0d8VmgoMkRnNIjatDXty9Hlcx9BZ3tApFQoO99Pr
         IOrsCnNRl2xJ//pp5M6VxQ0pCTGqk80Ngegg6qGciFuYc5OUPEcxUni7JF28qufpMrmq
         wNrg/drEM68rVBPIalpMpw+XtWNzGkSL/7ZMZHZnUpMBTzGQfq4DQ1Pr8mH32nuQy66+
         slWwqXzoU0q9//tOoh2nDuNCJFhL3i+cWb6S/qISWWUGb4iEMcEugHRw1pKHrPExpCch
         s1MW6WPRO4285Ce/yseeYqXqCtifySdltKgjv0VHh/ZP+EPAwaCs2m8YlL+V4ehg82PV
         6w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=uKNftq8yHI0LEWJPm+mfCD8jQGyHIPkpccA4/JpjjXo=;
        b=WiuqSK8xZMY1fpDROkWNKIt2rllrN78nFbiMA3MAbq0Zi2WuDHi9l06lLV9WVG8sxn
         pWIOvIqsMdIs0Rz/0E99LdxSXQmZLeM8m2j7FKMvz9fTS8d9XVOOSkWmA3FE/IeOiKwE
         Wk6DES/xIVlR8GQVv0w/poC9PLXgdLkpSeFnhG82HTORubJty7cP5L7KCB43dTwZoBWG
         zPgSr4M9jtobvgDz9jAMuvtq9oj/PV3koduHd/ZEPsNk0UpPPJTr1gKYjKV4S2qTo0Bd
         t1NzDpNbYvFeyyUlNvNMMoaQ/81e6A37/UoMm8dfJ6eEz3hucNy3e5tmIuajOyET/y0I
         /JEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXQDqPaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si22086884iow.25.2021.05.17.13.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 13:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXQDqPaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lijU7-0002PR-Av
	for alex.bennee@linaro.org; Mon, 17 May 2021 16:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijTm-0002Ie-Hp
 for qemu-arm@nongnu.org; Mon, 17 May 2021 16:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijTY-0003sI-GR
 for qemu-arm@nongnu.org; Mon, 17 May 2021 16:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621281867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKNftq8yHI0LEWJPm+mfCD8jQGyHIPkpccA4/JpjjXo=;
 b=bXQDqPaXZ9dW/6CIukdeMe4tP3G4OnpkLWZFAh7fWkULgSEyHO+DGmqtAEMRurpTs8gubC
 fR2rMob6w6zVl9iG17/e69h2/ntQI/voeQKixQ8nKEiK3ZUEBxoqmpUvp8bpks9C3VYTdc
 9UWHAX+BvHQaPyxHed33USJ7UVX72KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-NQOUkcUbOnyZrA10_TatTw-1; Mon, 17 May 2021 16:04:23 -0400
X-MC-Unique: NQOUkcUbOnyZrA10_TatTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8D6801107;
 Mon, 17 May 2021 20:04:22 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B84DC5C3E5;
 Mon, 17 May 2021 20:04:16 +0000 (UTC)
Date: Mon, 17 May 2021 16:04:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 00/12] hw: Various Kconfig fixes
Message-ID: <20210517200416.pt4xghxiuzuwknvn@habkost.net>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210517191856.enjxmb7v2ai6ecdh@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: huPF+3soR8oA

On Mon, May 17, 2021 at 03:18:56PM -0400, Eduardo Habkost wrote:
> CCing Build system architecture maintainer (Daniel).

Oops, I was misled by the subsection title.  Daniel is
responsible only for the build system documentation.

Do we have any volunteers willing to be listed as reviewers for
build system changes in MAINTAINERS?  meson.build has a
non-trivial amount of code and no maintainers or reviewers at
all.

> 
> On Sat, May 15, 2021 at 07:37:04PM +0200, Philippe Mathieu-Daudé wrote:
> > Various Kconfig fixes when building stand-alone machine binaries.
> 
> Who should merge this once it's ready?
> 
> > 
> > Since v1:
> > - Fixed Pegasos2 machine
> > - Removed SEMIHOSTING related patches (will repost them later)
> > 
> > Philippe Mathieu-Daudé (12):
> >   hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
> >   hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV
> >   hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
> >   hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board
> >   hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
> >   hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL
> >   hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines
> >   hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC
> >   hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259
> >   hw/isa/vt82c686: Add missing Kconfig dependencies (build error)
> >   hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)
> >   hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
> > 
> >  default-configs/devices/ppc-softmmu.mak   | 1 -
> >  default-configs/devices/ppc64-softmmu.mak | 1 -
> >  hw/arm/Kconfig                            | 4 +++-
> >  hw/char/Kconfig                           | 1 +
> >  hw/i386/Kconfig                           | 1 +
> >  hw/ide/Kconfig                            | 2 +-
> >  hw/isa/Kconfig                            | 4 ++++
> >  hw/mem/Kconfig                            | 2 --
> >  hw/pci-host/Kconfig                       | 1 +
> >  hw/ppc/Kconfig                            | 3 +++
> >  hw/riscv/Kconfig                          | 5 +++++
> >  hw/riscv/meson.build                      | 2 +-
> >  12 files changed, 20 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.26.3
> > 
> > 
> > 
> 
> -- 
> Eduardo
> 
> 

-- 
Eduardo

