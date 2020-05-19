Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3695401lfb;
        Mon, 18 May 2020 22:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTJKAasO2Frxebr04bsde4gHOVY8R6ttdJez2soXpYWT2YR7di9NwgOrWeT0LygS//fJOx
X-Received: by 2002:ac8:1621:: with SMTP id p30mr9503477qtj.321.1589864928163;
        Mon, 18 May 2020 22:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589864928; cv=none;
        d=google.com; s=arc-20160816;
        b=J7VX5duL2BzAM9eBm7Imko1HeWq7cz7rNV98H43CQL34p54+DwOYGytOJki06UtR9D
         PJSzM5Pq1vKPG/lb144/lJkQQUt5PSbCQZBA7CTom2AamtTkoUBHpj12kQwnedNUJUH2
         nTu8Y8E1K215lgyWEk4dsDEbPF0CkSMPIJOg+fCRqd4Fz0OPAlPdf/+6wmjCl/G5ki7v
         bW4lnlWuP8/+5epD6AHcto7CmiHGEAMgg5Hv+F+r2Ay3q2djjRrjV58fd0/QGMfQ0WDg
         z2asAXzu0USh8KbiB7Zkh1FErV+OKmFZCPkh3tmyC6W11PZ7QGsimIxG39zuzSvyv/z1
         GJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=05fy5QBWpQqNOvMArKDHlPqvIT3zaM+y1dJ26VLPbBk=;
        b=xyBAms7E3lmbInTKx7k4ViOjLA0vK3qGEUB4V5zMvCHDNpXm8N/Krr7rjxp+cy2wwc
         QCgPHlmq27UQuaNP0N6t8f+L16jbOoKZMT9fJuiMyN5n9eos1kGkcIqgPU1FkwUBKe6y
         qempgCA+AyJxXqtjD9qlviuHkYrAyTqQWxBcBidkWEXnF8G7qPE7t5bUMYItbcW2JSkv
         GVZ2C14ympDLbAZETAl1LUBYu0YIcHc6XTQwvuDXb47n6baEecHqzBbAnka3P7Dn0RIp
         +zwAkQu/evrgg0VmFrP9etgefPEu1P9ObZ6s4XWNxUY7s7HGMAKFC6J/UdQbpr9WKXza
         WCsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPjxjW0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t57si6916348qte.55.2020.05.18.22.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 22:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EPjxjW0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jauUh-0005sT-M6
	for alex.bennee@linaro.org; Tue, 19 May 2020 01:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauU6-0005N9-Ov
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:08:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49477
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauU5-0002Cu-Bw
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589864886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05fy5QBWpQqNOvMArKDHlPqvIT3zaM+y1dJ26VLPbBk=;
 b=EPjxjW0SlatjD3jI9HALviw9v9/0wmvO/ZU07A+YwzBuLUyxm61KObneA1qrOP4nrtbrXn
 5WU2zu/KZ8rUPWDQIp0wmzNH/1dZoDhsdkSA75RWQf0KbUJzvJ46zYPSN0uRJOg83C4IPy
 J0yx2etoeY2g4DsCSf1Mq31tNI3+2NI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Q48XvQCRM9aT7o6PSdapCg-1; Tue, 19 May 2020 01:08:05 -0400
X-MC-Unique: Q48XvQCRM9aT7o6PSdapCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBFCD107ACCA;
 Tue, 19 May 2020 05:08:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7931710013D9;
 Tue, 19 May 2020 05:08:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0D6A11358BC; Tue, 19 May 2020 07:08:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 01/24] arm/stm32f405: Fix realization of "stm32f2xx-adc"
 devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-2-armbru@redhat.com>
 <CAKmqyKOun2FyT+JR8cyrP9eQn9xFDAppFb4W12ym-TPGt9h7Hg@mail.gmail.com>
Date: Tue, 19 May 2020 07:08:01 +0200
In-Reply-To: <CAKmqyKOun2FyT+JR8cyrP9eQn9xFDAppFb4W12ym-TPGt9h7Hg@mail.gmail.com>
 (Alistair Francis's message of "Mon, 18 May 2020 09:48:56 -0700")
Message-ID: <87d0707bri.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nbFYJLQtdeeN

Alistair Francis <alistair23@gmail.com> writes:

> On Sun, May 17, 2020 at 10:06 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> stm32f405_soc_initfn() creates six such devices, but
>> stm32f405_soc_realize() realizes only one.  Affects machine
>> netduinoplus2.
>>
>> I wonder how this ever worked.  If the "device becomes real only on
>> realize" thing actually works, then we've always been missing five of
>> six such devices, yet nobody noticed.
>
> I must have just been testing the first ADC.
>
>>
>> Fix stm32f405_soc_realize() to realize all six.  Visible in "info
>> qtree":
>>
>>      bus: main-system-bus
>>        type System
>>        dev: stm32f405-soc, id ""
>>          cpu-type = "cortex-m4-arm-cpu"
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>     -    mmio ffffffffffffffff/00000000000000ff
>>     +    mmio 0000000040012000/00000000000000ff
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>     -    mmio ffffffffffffffff/00000000000000ff
>>     +    mmio 0000000040012000/00000000000000ff
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>     -    mmio ffffffffffffffff/00000000000000ff
>>     +    mmio 0000000040012000/00000000000000ff
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>     -    mmio ffffffffffffffff/00000000000000ff
>>     +    mmio 0000000040012000/00000000000000ff
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>          mmio 0000000040012000/00000000000000ff
>>        dev: stm32f2xx-adc, id ""
>>          gpio-out "sysbus-irq" 1
>>     -    mmio ffffffffffffffff/00000000000000ff
>>     +    mmio 0000000040012000/00000000000000ff
>>        dev: armv7m, id ""
>>
>> The mmio addresses look suspicious.
>
> Good catch, thanks :)

I'd love to squash in corrections, but I don't know the correct
addresses.  Can you help?

>>
>> Fixes: 529fc5fd3e18ace8f739afd02dc0953354f39442
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

