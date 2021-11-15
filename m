Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6061224lfk;
        Mon, 15 Nov 2021 08:01:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgp2eX8wp34hhlcGGppPgivw8iIobCBpfPGORpRQ/zI0s3WyHH36ou702DTFSHk+spRZD2
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr126115wrj.84.1636992116795;
        Mon, 15 Nov 2021 08:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636992116; cv=none;
        d=google.com; s=arc-20160816;
        b=HzWPew2Q9xqPOnCWF9ibtHDQlPsRmG06sIp7isOYvrmxauSM3cjuEWO4qpgxw2wo8h
         Dal/fEuFXPHB7TPCF9Que1e8Fpr1FCzp6ou1/mfHKUhmDXchtMycoo9lEPrZim27XhbS
         glOKQSdOW5Zt3mLGcf7Yqt4WCy4awof7a/h4WZg5RUAQ7LX2svEQ5VDwYqEesY786ceu
         /YkPHCho4GZ8GzYZdxDRp8e6/RAbrbbpD7dwEyWTrAQeMfkgwLrOwifvYlDIDcy8/665
         eBFvcSIYE7/EkSc6RQoEr+rF2GnPa2B8O3ND3yyawwGpWtc23ZQ8f4a6Llu6+5moNHu7
         qsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=84H5Q4BoQIAfTyarkILBkOQn7xhp7BjF6T+UxyIUUHw=;
        b=Gdvpf8HVopDOERK3iAeb0thBjUQZ/vyJEEoJqFmoOB5gllTL689S3opIBGhTnFKnAz
         vLd3BurzR/F6098AezDCGY4Y+wY+xiYIrBzBfpbjZ7HBcgRmxDC17+1bviWts+flD2nu
         TZiDfGtgdyvKx3vUdF6oAE0dPQEYtmG8s6UeIsWytBfTNRGUY+jgKuhpmflaLWfFbhTn
         uBoD2t9LDM2vWR0lA10q7bBFT2ArsrJI48mvO+P8SOYfnt6u+1m48Uy/x9ZB3cW3gZZh
         tV2z6ndSKsPzDnv4kx2Yirg5W94GNYdnFeUguXV93mvWpDY0G8Phb3OSySLYYH/nYLyY
         bSag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LI7pmm4S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si38710206wri.310.2021.11.15.08.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 08:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LI7pmm4S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmeQd-00068U-NR
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 11:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeQC-00066O-Gq
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 11:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmeQ8-0000Bf-Jr
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 11:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636992084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=84H5Q4BoQIAfTyarkILBkOQn7xhp7BjF6T+UxyIUUHw=;
 b=LI7pmm4SKCry4hJQxn9TREtM6DietLgKvPODTP1BAL6rDBaZHgp77OoU8u6DN4yOggopyO
 X/9OS9UnIoDm1KqKT+4o6TsJ6geuCSPVpBYzANaEdcPkDzi0RVQXwUldxGBSTuCou1ewWt
 WXpoKDn4oFFqTwA48zNIjjOdYEjG+s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-d3HtzfBJPISmC4xQiXS2RQ-1; Mon, 15 Nov 2021 11:01:20 -0500
X-MC-Unique: d3HtzfBJPISmC4xQiXS2RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76737804141;
 Mon, 15 Nov 2021 16:01:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CB7F5C1BB;
 Mon, 15 Nov 2021 16:01:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AA4211380A7; Mon, 15 Nov 2021 17:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 0/2] Eliminate drive_get_next()
References: <20211115125536.3341681-1-armbru@redhat.com>
 <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
Date: Mon, 15 Nov 2021 17:01:15 +0100
In-Reply-To: <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 14:05:50 +0000")
Message-ID: <87fsrxflx0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RsBFrsVZSBBE

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> This is RFC because I'm unsure about the removal of
>>
>>     /* Reason: init() method uses drive_get_next() */
>>     dc->user_creatable = false;
>>
>> in PATCH 1.  Both users appear to wire up some GPIO.  If that's
>> necessary for the thing to work, we should just replace the comment.
>
> Looking at the code, it sort of is and sort of isn't. The GPIO line
> is the chip-select line. If you don't connect it then (because the
> ssi-sd device configures cs_polarity to SSI_CS_LOW, requesting an
> active-low chip-select) the device will always be selected. If
> the machine created an SSI bus with no SSI device attached to it
> then in theory the user could create an ssi-sd device and connect
> it there and have it work. But in practice it's really unlikely:
> machines create SSI buses with specific wired-in devices on them,
> and the guest OS knows what it has to do to enable the chip select
> for the device it wants to talk to (often some known GPIO pin on
> a GPIO controller).
>
> So I would keep the user_creatable = false, with a reason of
> "user should wire up GPIO chip-select line". But see below for

I'll do it this way.

> a pile of contrary precedent.
>
> (The chip-select GPIO is created in the parent class, incidentally.)
>
>> Aside: there may be devices that need manual wiring to work, yet don't
>> have user_creatable unset.  Bugs if you ask me.  I don't have smart
>> ideas on how to track them down.
>
> Me neither. I notice that the TYPE_M25P80 is also an SSI peripheral
> with an active-low chipselect but that one doesn't set user_creatable
> to false. TYPE_SSD0323 also is user-creatable and that one has an
> active-high chipselect, which means the user can create a device but
> it will then never be usable because it will ignore all transactions.
> (More generally, looks like most subclasses of TYPE_SSI_PERIPHERAL
> don't set user_creatable = false.)

For sysbus devices, we clear user_creatable by default, because sysbus
devices pretty much always[*] need wiring.  Is this the case for SSI bus
devices, too?


[*] The most prominent exception is "dynamic sysbus", which I believe
was a mistake.

