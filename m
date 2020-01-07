Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp110938lff;
        Tue, 7 Jan 2020 07:23:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzj9xJD1N4zYeQJpu3lKnWwdYhuSjQCTTuQUo/5suL4AdhWyviKpglVhz8adbTsUp+ncnmT
X-Received: by 2002:a50:fd11:: with SMTP id i17mr276177eds.249.1578410595250;
        Tue, 07 Jan 2020 07:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578410595; cv=none;
        d=google.com; s=arc-20160816;
        b=Nh5yXt1iOGnbHWNHsqOKHbX6g+mRaacKJaWQ3+QRpbdeRPorlRoS483emK8A1CLuOd
         fXzKWzIGolYfvueW5NMS4DOTyuYgfxSsAZ5qsAJTKaTPvOkEhdsYMWMh6Veco7kVwRua
         2eWhdGlxg18zUOnl7kkjswksJhUmgEtO1u1W96iuYnuztNvgea88XFdbz/FXpXZ7WU4m
         aePFz4FJg6fB3BCIWDlNxEo1KJfK2EKlUzKhQghXptGlwsjBD9IevRNhWA2OzooWD7Hi
         nS0LjOAMTEs4RyHcooRzvJtsAgkXygZFhOxVOJ9v4R9wLBUXLMD07xIBQWy6zMlJxWNf
         w7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vEZl/neS+NROZ3mdO1oRodcW72dgDNfEVAbmZRX2WOo=;
        b=Y5FvEK1S186YRhgr9U2qxdmzD4DjbnqDQmUGi1afgEK/C77kSepsITi1v7Ejo4Ai1M
         a02GsxRpGAXAowFBY5RB/6a0oCWB2SUxH/zfbCLfa9sr47hmNd3DajqAWCsn1tz71td2
         bNuBa6l6Wrx6J+K5yyP8bDr6kYe4MzJuaZGAJGHtSURN1uorxSbww3yV9iWCKEAj6FMx
         uT5Xw6UlWyhoNL4NsfyVoYj7/nyEAAHXfc01c//6Js/qeCQcB0mNMTRP7hX/YYbcrFb0
         Or4cuk6bckSL8MYBNOymOM0CN5XfRZ9Pu+9KZRlJ1636AepF+Yvq3enq/3g9byOhq1G+
         4tGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ii2kvMAY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g26si46350450edm.328.2020.01.07.07.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 07:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ii2kvMAY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578410594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEZl/neS+NROZ3mdO1oRodcW72dgDNfEVAbmZRX2WOo=;
	b=Ii2kvMAY5e0uf7Ik7+2z2orRKnlQHFASSNY84i7Ng5vrVIStowlIbSQzKvNRaK992cIvIT
	IJC70oQXdde3okO/sRQ5seT8KsNi98ZvZOBS+zescXLKdli/XeMcyCwt+rUHO3cbeUdaFB
	6nS/lJJG1tN1s9ShG2PzMVDV/fTE01M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-62zUDMJePAeAgo85NLaezQ-1; Tue, 07 Jan 2020 10:23:13 -0500
Received: by mail-wr1-f70.google.com with SMTP id v17so67238wrm.17
        for <alex.bennee@linaro.org>; Tue, 07 Jan 2020 07:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/wc1xxXSPNaCZ+dYdazVsN00S+wbJbcYuMJ74BKeA2g=;
        b=r5FaHXMpeiJ1C6yMDLV+WrMd57DFSK2gsTYfqff/b9eEIPpv+15NGkfL7J9Z59HlGX
         iCdHTgDuiHjGMF+GVmOIuIQcoLbummKZ9V8KyQQNhbX47ZVzeRvjeHW1D4G3/BGnAyFD
         ctJbJNSE0ZGf2ZPfgONcLY+V8SaMpuQj0vt9bCTAw/nAg5+vkSZBKylDBNpLmGVd69vy
         KYKw3LQTKFE0wdvfzg1EW3H2EEgcaNAAZGiaIy0WCbNGMOpgWwIuycj7wYNkd2vc88oJ
         2j4SYulzf6OZ0w0pfweFs2tFYrg3ugqVpv2Ckv0DqPEitL3cXjppmhgYBK+/Eokoz2jo
         wP2A==
X-Gm-Message-State: APjAAAXfUDo4cQvZaiwgSm3XpLXTdbA10QaW3B/D0BvHXicaque8G9sD
	9IA+yTEeBwnzVqdAgfxjyRPX81sP/hsPJKCivb27pR7Xhzfj0SIW9SNkeIO1ZBgQtAVx9fhPlwo
	qkZ3wObdXhuY0lHlh
X-Received: by 2002:adf:f308:: with SMTP id i8mr49579814wro.42.1578410591988;
        Tue, 07 Jan 2020 07:23:11 -0800 (PST)
X-Received: by 2002:adf:f308:: with SMTP id i8mr49579799wro.42.1578410591769;
        Tue, 07 Jan 2020 07:23:11 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329? ([2001:b07:6468:f312:c6d:4079:b74c:e329])
        by smtp.gmail.com with ESMTPSA id d10sm182760wrw.64.2020.01.07.07.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 07:23:11 -0800 (PST)
Subject: Re: [PATCH v2 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>,
 Michael Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>,
 Joel Stanley <joel@jms.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Corey Minyard <minyard@acm.org>, Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
References: <20191218172009.8868-1-philmd@redhat.com>
 <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b35d7f9-4590-2764-b48f-8d841c86fe3e@redhat.com>
Date: Tue, 7 Jan 2020 16:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 62zUDMJePAeAgo85NLaezQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lLhnetcOzd/S

On 20/12/19 14:32, Marc-Andr=C3=A9 Lureau wrote:
> On Wed, Dec 18, 2019 at 9:20 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> After this chat on #qemu IRC:
>> 13:20 <stsquad> so what is the difference between a IOReadHandler and IO=
EventHandler?
>> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
>> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
>> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>>
>> I thought it might be a good opportunity to make the IOEventHandler
>> typedef meaning more obvious, by using the QEMUChrEvent enum.
>>
>> To be able to build I had to explicit all enums ignored in the
>> switch(event) statement by these frontends.
>>
>> Then I used a coccinelle spatch to change the various IOEventHandler.
>> I don't think the last patch can be split, but suggestions are welcome!
>>
>> Regards,
>>
>> Phil.
>>
>> v2:
>> - do blindly ignore all events using a 'default' case.
>>
>> Philippe Mathieu-Daud=C3=A9 (14):
>>   hw/ipmi: Remove unnecessary declarations
>>   hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
>>   hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandl=
er
>>   hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
>>   vhost-user-crypto: Explicit we ignore some QEMUChrEvent in IOEventHand=
ler
>>   vhost-user-net: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
>>   chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   chardev: Use QEMUChrEvent enum in IOEventHandler typedef
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> (I guess Paolo will take the series for next PR?)

Yes, I'm queuing it.  I'll check Richard's remark before sending out the
pull request.

Paolo
