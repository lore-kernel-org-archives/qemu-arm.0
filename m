Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1179935lfq;
        Thu, 8 Oct 2020 02:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy8INHYsQJ+KaK5+9QsWQ14t8wfAj69P/3x2IkM1GhtazGqREAOByC9fCijxFUBH4zq/a6
X-Received: by 2002:a05:6902:6d3:: with SMTP id m19mr9299413ybt.250.1602150365211;
        Thu, 08 Oct 2020 02:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602150365; cv=none;
        d=google.com; s=arc-20160816;
        b=ui/ha/u8sVJgedIvgs0NfS42DcnPCKnRoF2nkTW8ZUnvooOw6qRevq9lbv+/kXQaP/
         ff7kZbHcNINNicLHPZ7nd1j3tXIwiAN9JBSOZQsKtxIlVp+Vxaf8pARGfCVlqDCWO4HJ
         hczh+jFPWYDVUa0C16I72R7lLMmibDggakuE9qDawP8wXzjJPAEke1aKkuyaQioEhCtA
         TyLtmZnLcjcIYAq/2pSzkg8UMr3zlgEPXbSPbLbTvPcKFLSUc9kTMjpvXyIdACEkx7zq
         EihbibrOyZtR1YUzfJLyWnROvfmgSMbxaXkN4ykqOW4C+CRnc5iVcSSobEfqjmTTahdx
         o1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=jl5cviXlEHzI+ZegVgF0X0nh8+RWz+fpzNI+amOmLrI=;
        b=th1TvSNbffKxea3Otd/7DUZCS0ciHVPFtGy6l2XKh5rnFsO2t3L5Yx1X4JIlhG6Oxa
         n3vxVD52wNY+nUULaARMSCZ6GajrAG0zcOEP4OdGdICPqkRsj9KIKsTojgJ+RehNFLLH
         XG0oJMKDLB4SnP1C1au8DjF58q+3tivMhAHuRyXrVa8d9D14tn9oi928MVcWRV4AcZfx
         a8g1t11AVKp5b4r2tZWoqhixjtCeOZt6nXQmicPo918GX11bh+5ANf0QMKtxLJsRA1AA
         ygWduyvARzgkiD2vvYQ35vYCyUxJttbOan9E+ToFg+A2o9y16hlUyYEZVwjlkDuSVdy/
         u9Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PKmf2qRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si4319754ybo.262.2020.10.08.02.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 02:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PKmf2qRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQSUu-0000m4-JR
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 05:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQSUB-0000B5-Ei
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 05:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQSU7-0007aL-2D
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 05:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602150313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jl5cviXlEHzI+ZegVgF0X0nh8+RWz+fpzNI+amOmLrI=;
 b=PKmf2qRX5oIBYTakK6WOkrpzv3d6PrF6sDUJ+EiOYXwUBNXwaHPTodQVry/GU/hpEcyzj+
 vcSyiraZ+dZ/bpqegw9Y03gyyRvlr68rUYSiHk4A9tcpFog/cDkEKXSEieSEt/D/7+dk8e
 Ya5ej2ZgmLtgVfC27Imq63KtJx4lUy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-y1DWi0XvPLaVPDny_lrfhw-1; Thu, 08 Oct 2020 05:45:12 -0400
X-MC-Unique: y1DWi0XvPLaVPDny_lrfhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6A00191F541;
 Thu,  8 Oct 2020 09:45:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 718B95D9D5;
 Thu,  8 Oct 2020 09:45:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C192D11329C1; Thu,  8 Oct 2020 11:45:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Purpose of QOM properties registered at realize time?
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
Date: Thu, 08 Oct 2020 11:45:08 +0200
In-Reply-To: <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 (Peter Maydell's message of "Wed, 7 Oct 2020 15:28:52 +0100")
Message-ID: <87mu0xyrtn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEG9FGo7zYbC

Peter Maydell <peter.maydell@linaro.org> writes:

[...]
> Possibly one could move the code in the devices which creates the
> GPIO array/sdbus/whatever so that it does so in instance_init
> rather than in realize, and then more of these "alias a connection
> through" bits of code could also move to instance_init. But there are
> cases where the GPiO/etc can only be created in realize because
> the number of GPIOs depends on properties of the device and so isn't
> know at instance_init time.

In real hardware, the number of GPIOs and such is fixed.

When modelling a family of related chips, a "number of GPIOs" property
is sometimes convenient.  The property value is not available at
instance_init time.

By delaying GPIO creation to realize, you can create the configured
number.  The GPIO's QOM property becomes dynamic.

To keep the QOM property static, we'd have to provide the maximum number
of properties, and then connect only the configured number to actual
GPIOs.  This arguably goes against the grain of QOMs dynamic design.  I
never liked that part of the design anyway; I strongly prefer data to
code, and static to dynamic.

For purely virtual hardware, the maximum number might be impractically
large, though.

A first class static array property, where the size of the array is part
of the value could perhaps cover this case.

