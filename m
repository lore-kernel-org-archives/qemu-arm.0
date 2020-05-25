Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1740400lfc;
        Sun, 24 May 2020 22:50:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAeFBpdNmwVj4MGzQHozcN8PpPZUG0jQDcBzLJ+nJFXBuvJ4TsUBGeaptt6k0+SPF6QLhP
X-Received: by 2002:ac8:6b8a:: with SMTP id z10mr25880494qts.373.1590385847129;
        Sun, 24 May 2020 22:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590385847; cv=none;
        d=google.com; s=arc-20160816;
        b=Lwmrc2EvxOVbPUCN1ivJ5VCuqfSOaGbIp03x6mQGcnhdco7Wtc3VKlAfSoTUUWKh7r
         BgNYIA2Oy3lQce/P4j4lu0DFB3veRhR2+jxtBPb0LoT2eNSzAzBCCIdqB+f0uMiZlCPV
         Z4XIprN24JvUf6RTwDPzLnx5D5e8n54gKSrQ6rbPxTqTLSV0GOUbhOdcRHWaSMFeH7u5
         seD4PreoyoQMXLZgSTrum/aib1kNlWnZ+xapPYhuES2A3fx3MDpprnfDUgHpG9ACsnTH
         68NnPoWauNlGC5Sf50UH80sS3G6gcWEujjZyasZ+Y3+B6IVy2dktzl1a2LUKA48VFimh
         dxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=uPh6CUANVKuCjrjuZpJmLuUBq8PgRqtst+kLsP2TYFY=;
        b=pAPVyXj5thqIxh54IIpTlZGfsAGPm1DZJjVpDd9x1r7w41xHZMiW9wqDdoEBrjVaiq
         wN37vpyQ8Wmh1k8nS2YuL5RqQuWCMo9H0uxpcxEJE6eZBrnGpEgI/iex+f30AttWXJXa
         hmogfDYQf8YZnpAhS7+UeNkEx4LKmpK6ab2m+p6OB0IgKjANPB/DpXSxQo6MO4r/6B7c
         3l9i1WEQx6qtZzFRDTVEtnl6/vZRawzGQHg/CvUiJ7PFpc3sJ+vpbK33CjKcbfhNBCGy
         iJ8UTH3Pl7Ks2d8fp5U9/7DCgzFSEWF93CMbXnBPAX6ieIk6mAqxb4LgM7TZtuFNIqNB
         R9PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Znjgqd0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si8641898qkp.254.2020.05.24.22.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 22:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Znjgqd0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jd60c-0006dF-Je
	for alex.bennee@linaro.org; Mon, 25 May 2020 01:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jd60V-0006bB-Cn
 for qemu-arm@nongnu.org; Mon, 25 May 2020 01:50:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26546
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jd60R-0002qq-Dm
 for qemu-arm@nongnu.org; Mon, 25 May 2020 01:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590385834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uPh6CUANVKuCjrjuZpJmLuUBq8PgRqtst+kLsP2TYFY=;
 b=Znjgqd0eqOISp5cusZ9opDUYqGpO4P4wVwAYiCc5Dd5eC4VQCvdan2h2pj1yyWwk/iblIQ
 QMODyuM1vhlz+vblmebUHzDRiozg9my51Yqll2AC9uG6TIT52PYxQX2JPKY9uUOpjcjfGx
 0tk0SYA0/s4Pm2FYXnLzA9G3IKs1EdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-Niwq4LCVNWiM4vTrnN1rCA-1; Mon, 25 May 2020 01:50:32 -0400
X-MC-Unique: Niwq4LCVNWiM4vTrnN1rCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F01D460;
 Mon, 25 May 2020 05:50:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D7860CD0;
 Mon, 25 May 2020 05:50:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE762113864A; Mon, 25 May 2020 07:50:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/24] armv7m: Bury unwanted "ARM,bitband-memory" devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-7-armbru@redhat.com>
 <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
Date: Mon, 25 May 2020 07:50:29 +0200
In-Reply-To: <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
 (Peter Maydell's message of "Thu, 21 May 2020 17:17:25 +0100")
Message-ID: <878shgh8be.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gtIWSNhuwvyH

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> These devices are optional, and enabled by property "enable-bitband".
>> armv7m_instance_init() creates them unconditionally, because the
>> property has not been set then.  armv7m_realize() realizes them only
>> when the property is true.  Works, although it leaves unrealized
>> devices hanging around in the QOM composition tree.  Affects machines
>> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
>>
>> Bury the unwanted devices by making armv7m_realize() unparent them.
>> Visible in "info qom-tree"; here's the change for microbit:
>>
>>      /machine (microbit-machine)
>>        /microbit.twi (microbit.i2c)
>>          /microbit.twi[0] (qemu:memory-region)
>>        /nrf51 (nrf51-soc)
>>          /armv6m (armv7m)
>>            /armv7m-container[0] (qemu:memory-region)
>>     -      /bitband[0] (ARM,bitband-memory)
>>     -        /bitband[0] (qemu:memory-region)
>>     -      /bitband[1] (ARM,bitband-memory)
>>     -        /bitband[0] (qemu:memory-region)
>>            /cpu (cortex-m0-arm-cpu)
>
> What does "bury" mean here? To me it implies "they still
> exist but we've stuck them in a hole somewhere and covered
> them up", but the qom-tree delta suggests we've actually
> really deleted them?

We really delete them now.

"They've been lying dead in the streets; give them a decent burial".

Would you like me to s/Bury/Delete/?

