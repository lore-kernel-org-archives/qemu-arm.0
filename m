Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2381557ejo;
        Mon, 8 Jan 2024 08:22:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2Dxqef7lQGU17+uNOitHtKtUd42E2JlyRPY0RrU/t/Gn4S9kAUIU35M7w939sFc2wC+uu
X-Received: by 2002:a05:6214:dac:b0:680:cc6c:1bec with SMTP id h12-20020a0562140dac00b00680cc6c1becmr9341210qvh.1.1704730939197;
        Mon, 08 Jan 2024 08:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704730939; cv=none;
        d=google.com; s=arc-20160816;
        b=eZNkn7mkkM0w47f6I+4uOs8Qi6+5arDsiu8+16w1uFHgGNA+jmWXGoCoj/7Ma82GxL
         v8r/AhAulrXH584AwxivN3X5DFFuJmWgdRqEWjGimTXEFhN70JJaq+mbw2/a3RrSLEcS
         XwPinndlOvbmIPEmtAWUSyWwdOyqUols1p23Br59mbg9GOxwl2bxAxIVkiL+B2bixOo6
         HnF4ppKpVP2l3Uu6pHBk29YNacCBatBNO+jPFK7XF1gqU874r+pHx7YiHjqeUvqgUYMc
         +L5THpGxUK1mPl78zwjmdu1P6J08FGPrZuGrWxvkzrO7enJjJ32xXCeAN2AxM5u9j/Nt
         LTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=Zabknh+lmtauaoOCShvrOwMr9jzJkG2bks/8gJpscZQ=;
        fh=ok0JSZ3nWdLw7/mVpqCmgQMniFdENY3dQ0jrjQo6D7s=;
        b=pZlkJEBucyfvQtOb/PRjjIGsfX1GPjMO9B+El2glqjtlaRcLlseIO3DZVo134xCDeO
         eld6xRwRhB5LXX/u8ZBbWKwvuCHr7TmHS9GlrMKYBOjNUE1kt2lVC6E+HXUbDZmElh69
         0YD2Pn5TgkbQ5mZa4qqtXjM/sCepNOwzI7kmdcqWEVTDWRKA+qkLkfeVhw8QyEyj3oNp
         vGgCzhoJqn9iTvZf7LfopntZG56LTk2FgZBkzbH11InNh7P5MpQ837w33yJydS/zbOds
         upT2hMz5ysKz/wvViw4wH2S+9hSpn0b+1suFcIbNZR9zFtLhUSkHXXVScQdKmTIN9pWD
         XsZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMnrQFLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a0cdf0f000000b0067f846c4474si202378qvl.571.2024.01.08.08.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 08:22:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SMnrQFLN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMsNu-0006N6-6g; Mon, 08 Jan 2024 11:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rMsNt-0006Mv-7u
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 11:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rMsNo-0000i3-7V
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 11:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704730907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zabknh+lmtauaoOCShvrOwMr9jzJkG2bks/8gJpscZQ=;
 b=SMnrQFLNIhIPf+5M/3RhaNRiVP4+OAE8Kl9xLe7YgRPHO2I/Zk7uiwsWxivPX7GQxPnO0E
 68mIFyNd1hPJpjS8PiL6w253PyxFezaA2Vbe6QdhGjSEJlX7/nHG50EFKnH8lCD7aRGsN6
 eRk2/JVbXCPaxToseDQPDskyIp1HUCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-pjVpjLSXON6sfmuFXDueTQ-1; Mon, 08 Jan 2024 11:21:42 -0500
X-MC-Unique: pjVpjLSXON6sfmuFXDueTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A62A101A52A;
 Mon,  8 Jan 2024 16:21:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606322026D66;
 Mon,  8 Jan 2024 16:21:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 735D221E680D; Mon,  8 Jan 2024 17:21:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  inesvarhol
 <inesvarhol@proton.me>,  =?utf-8?Q?In=C3=A8s?= Varhol
 <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,  Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,  Laurent Vivier
 <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
In-Reply-To: <ab6ecb71-7c29-45e6-b69f-9e36d05fd6d6@ilande.co.uk> (Mark
 Cave-Ayland's message of "Sun, 7 Jan 2024 14:04:27 +0000")
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
 <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
 <ZjC6phtwjcDoQP-NDP6GF-dvCVK8Ctk9EeW_JezuNBqnQq4-V6NU6eAhECMqxJzMDRxwjbb-LPcHTvysc6YGuLD7ckWhbtpqD1g9lnklofI=@proton.me>
 <5f624a13-0ba0-4d9a-8910-2ef1c784a295@linaro.org>
 <ab6ecb71-7c29-45e6-b69f-9e36d05fd6d6@ilande.co.uk>
Date: Mon, 08 Jan 2024 17:21:40 +0100
Message-ID: <87jzojbxt7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: n87CwEJc2VQS

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 05/01/2024 10:13, Philippe Mathieu-Daud=C3=A9 wrote:
>
>> (+Mark & Eduardo)
>> On 4/1/24 14:37, inesvarhol wrote:
>>>
>>> Le jeudi 4 janvier 2024 =C3=A0 14:05, Philippe Mathieu-Daud=C3=A9 <phil=
md@linaro.org> a =C3=A9crit=C2=A0:
>>>
>>> Hello,
>>>
>>>>> +static void test_edge_selector(void)
>>>>> +{
>>>>> + enable_nvic_irq(EXTI0_IRQ);
>>>>> +
>>>>> + / Configure EXTI line 0 irq on rising edge */
>>>>> + qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
>>>>
>>>>
>>>> Markus, this qtest use seems to expect some stability in QOM path...
>>>>
>>>> In=C3=A8s, Arnaud, having the SoC unattached is dubious, it belongs to
>>>> the machine.
>>>
>>> Noted, we will fix that.
>>> Should we be concerned about the "stability in QOM path" ?
>>
>> Don't worry about this In=C3=A8s, I wanted to raise Markus attention on =
this.
>>
>> You showed a legit use of stable QOM path, and Markus told me recently
>> there is no contract for QOM paths (it shouldn't be considered as a
>> stable API). IIRC Markus explanation, "/unattached" container was
>> added as a temporary hack to allow migrating QDev objects to QOM (see
>> around commit da57febfed "qdev: give all devices a canonical path",
>> 11 years ago).
>>
>> I agree anything under "/unattached" can be expected to be stable
>> (but we need a community consensus). Then the big question remaining
>> is "can any qom-path out of /unattached be considered stable?"
>
> For the moment I would definitely say no, and that is mainly because if w=
e were to assume that QOM paths were stable today then I can see it being a=
 barrier to updating older code to meet our current guidelines.
>
> These days I think more about QOM paths being related to the lifecycle of=
 the objects e.g. a machine object has child devices, which may also consis=
t of a number of other children in the case of a multi-function device. For=
 me this means that using object_resolve_path_component() to look up a chil=
d object seems reasonable, in contrast with expecting the entire path to be=
 stable.
>
> One thing I think about often is whether the use of device[n] is suitable=
 within QOM tree. For example, if I have a command line like:
>
>   -device foo,myprop=3Dprop0,id=3Dfooid0 -device foo,myprop=3Dprop1,id=3D=
fooid1
>
> currently they would appear in "info qom-tree" as:
>
>   /machine
>     /unattached
>       /device[0] (foo)
>       /device[1] (foo)

Actually

    /machine
      /peripheral (container)
        /fooid0 (foo
        /fooid1 (foo)

If you omit id=3D..., you get

    /machine
      /peripheral-anon (container)
        /device[2] (usb-mouse)
        /device[3] (usb-mouse)

or similar; the actual numbers in [brackets] depend on the board.

> whereas it feels this could be done better as:
>
>   /machine
>     /unattached
>       /foo[0] (fooid0)
>       /foo[1] (fooid1)
>
> This would automatically place devices of the same type within a QOM arra=
y to allow them to be accessed separately by type, or even directly via the=
 "id" if we assume they are unique. In particular if you have a machine wit=
h 2 foo in-built devices you could then potentially configure them separate=
ly using -global foo[0].myprop=3Dnewprop0 and/or -global foo[1].myprop=3Dne=
wprop1 which is something that currently isn't possible.
>
>
> ATB,
>
> Mark.

