Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp285088lfb;
        Tue, 19 May 2020 23:27:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuOKN+lTMVVqdW7Pm0bHQVNSoIERD9FUkG6lICh10td4Z4UvowEcTaDmWaraI2+rxe31tA
X-Received: by 2002:ae9:e319:: with SMTP id v25mr3054984qkf.311.1589956066258;
        Tue, 19 May 2020 23:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589956066; cv=none;
        d=google.com; s=arc-20160816;
        b=uwBLdgPKDd4w+Uwe1nkATSyhaVeY2HEoE3/lVm2bNr/mNjaRMRxfD/ep83NyUy2JR0
         X6DzLPblJWidRer740FywGARTdhNvKBdJsIm7jRpNuapUhy1fXgMDeS0dtRIG9X0RENk
         Plv1vpN/XU5LBpONjPWRngmOQiRh8AKRVinGJXbC4o58kgkD2pGkpnlbEN1I3MeBUD9B
         zwhGAN68ap82SR3r8xCckZfGBvbFGreJrUr8qMYjfWd6KDI4fzjWpff3ObHYY1vmcPfi
         G/BG3cyFPOVHIRdN7DVzO2QKiztOcea0KGQ8bsq2PfU6F5G6uyHI0b9VW5LfUfe+WPNT
         j3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=xRGr/V1Fo1fxrgW/hPXMbejWN60H8c1LZW5/vQKsb4I=;
        b=YhBKeu4z9wN2itWnnYUOdLUivCe4q4kHA04vv18v9f7xU1q2waXvDocuOhWqEvuhP0
         WCqOrFmaVE+PiLEyyv+VOARuIAp4qMxVWOv8eAzLeXVSWIM0hjtAiBwqXX/2Q/yGlG9x
         OKy7fVauKNu5/XySleXqEUqL4LG6M5WzGcPihynNCyQDeNj83zt8xJmk0KzUExMhlrSr
         2lo7VgIkjHRUlc+e9cz+91L8bUiQXFwuaLTcNtRXh9nkWHh5PP+klK6oOO8fNIYxB+gf
         yazkwtjyqXUUyz0bZAMTuJ9awcz8jdserhHxgNa+wHku1MxyXLxfKQgGXK5WU0EiXROh
         Aoog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UbnEwonN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si1200141qkl.32.2020.05.19.23.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 23:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UbnEwonN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbICf-0007wH-O9
	for alex.bennee@linaro.org; Wed, 20 May 2020 02:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jbICY-0007ti-At
 for qemu-arm@nongnu.org; Wed, 20 May 2020 02:27:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27636
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jbICW-0005qM-KK
 for qemu-arm@nongnu.org; Wed, 20 May 2020 02:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589956055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRGr/V1Fo1fxrgW/hPXMbejWN60H8c1LZW5/vQKsb4I=;
 b=UbnEwonNlMxS2XqJ0m8+p2hLrqs7dm+pkcZxlojq1tyM8xxw2qg+WQpIPd/2x0pIoUvdhP
 BRxWp4liFyDMd7TDoJvzsvStVeLajepodljzI0aKKHv3Iuw2rE1yGxKZTwnrJuo5NjX3YE
 hEhr9TKfNmiSGUa5O0lwzAvCXuavlsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-m53EhrshNk6rJS_RSjDyoQ-1; Wed, 20 May 2020 02:27:32 -0400
X-MC-Unique: m53EhrshNk6rJS_RSjDyoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61A01464;
 Wed, 20 May 2020 06:27:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB5282A24;
 Wed, 20 May 2020 06:27:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80A5911358BC; Wed, 20 May 2020 08:27:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] arm/aspeed: Compute the number of CPUs from the SoC
 definition
References: <20200519091631.1006073-1-clg@kaod.org>
Date: Wed, 20 May 2020 08:27:28 +0200
In-Reply-To: <20200519091631.1006073-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater"'s
 message of "Tue, 19 May 2020 11:16:31 +0200")
Message-ID: <875zcrunn3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0syigRytWSOB

I figure this replaces my "[PATCH 05/24] aspeed: Don't create unwanted
"cortex-a7-arm-cpu" devices".  Correct?

Let's mention it gets rid of unrealized CPUs then.  Let me try.

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Commit ece09beec457 ("aspeed: introduce a configurable number of CPU
> per machine") was a convient change during bringup but the Aspeed SoCs
> have a fixed number of CPUs : one for the AST2400 and AST2500, and two
> for the AST2600.

Please add something like:

  When the configured number of CPUs is less than the SoC's fixed
  number, the "unconfigured" CPUs are left unrealized.

> Remove the "num-cpu" property from the SoC state and use the fixed
> number of CPUs defined in the SoC class instead. Compute the default,
> min, max number of CPUs of the machine directly from the SoC class
> definition.

Suggest to add:

  Visible in "info qom-tree"; here's the change for ast2600-evb:

     /machine (ast2600-evb-machine)
       /peripheral (container)
       /peripheral-anon (container)
       /soc (ast2600-a1)
         /a7mpcore (a15mpcore_priv)
           /a15mp-priv-container[0] (qemu:memory-region)
           /gic (arm_gic)
             /gic_cpu[0] (qemu:memory-region)
             /gic_cpu[1] (qemu:memory-region)
    +        /gic_cpu[2] (qemu:memory-region)
             /gic_dist[0] (qemu:memory-region)
             /gic_vcpu[0] (qemu:memory-region)
             /gic_viface[0] (qemu:memory-region)
             /gic_viface[1] (qemu:memory-region)
    +        /gic_viface[2] (qemu:memory-region)
             /unnamed-gpio-in[0] (irq)
             [...]
    +        /unnamed-gpio-in[160] (irq)
             [same for 161 to 190...]
    +        /unnamed-gpio-in[191] (irq)

  Also visible in "info qtree"; here's the change for ast2600-evb:

     bus: main-system-bus
       type System
       dev: a15mpcore_priv, id ""
         gpio-in "" 128
    -    gpio-out "sysbus-irq" 5
    -    num-cpu =3D 1 (0x1)
    +    gpio-out "sysbus-irq" 10
    +    num-cpu =3D 2 (0x2)
         num-irq =3D 160 (0xa0)
         mmio 0000000040460000/0000000000008000
       dev: arm_gic, id ""
    -    gpio-in "" 160
    -    num-cpu =3D 1 (0x1)
    +    gpio-in "" 192
    +    num-cpu =3D 2 (0x2)
         num-irq =3D 160 (0xa0)
         revision =3D 2 (0x2)
         has-security-extensions =3D true
         has-virtualization-extensions =3D true
         num-priority-bits =3D 8 (0x8)
         mmio ffffffffffffffff/0000000000001000
         mmio ffffffffffffffff/0000000000002000
         mmio ffffffffffffffff/0000000000001000
         mmio ffffffffffffffff/0000000000002000
         mmio ffffffffffffffff/0000000000000100
    +    mmio ffffffffffffffff/0000000000000100
    +    mmio ffffffffffffffff/0000000000000200
         mmio ffffffffffffffff/0000000000000200

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Patch looks good.

Preferably with an improved commit message:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

I'd like to pick your patch into v2 of my "Fixes around device
realization".  May I amend your commit message as shown above?

