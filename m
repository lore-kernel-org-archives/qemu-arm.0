Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp180481lfb;
        Thu, 29 Apr 2021 23:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT//NY5pBhCezSTerTgVnAvoWVdhWTfjU+2nyjHC2Ta44E/InV+grD+izZlCKVJldMt2XE
X-Received: by 2002:a05:6102:5f7:: with SMTP id w23mr4179881vsf.26.1619763251854;
        Thu, 29 Apr 2021 23:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619763251; cv=none;
        d=google.com; s=arc-20160816;
        b=TtWgeMCf9SUNhndI3SEAf/E56qLmuN7OKQ/0JouDMj14pjj5utcNVsH2njOTtHe8BH
         jmQYM+GXYVI50mIAVhd8Qv5ioJN2fHzeHUUEtPr79henFl4+1HG8jc8XylDbTA9uaMfw
         D/BY7J6i3la6UsHgECHiQxExusA2Th+wMkm9hVk7eDE+vlfVgboRzaq7eZPF/So6Piid
         JVK7NvqxT2io6SE65M7RNEzhseEIP583DxXxqV4ZC/L/MGZUSFFLfnWRhlTwCUhnBsTi
         c9nAbGkzLNcpY5AuRW/b2fX85R89BqS4RU8NBSeSXMAYUKsWBxXkPrOg7MNkioFqa7x2
         AgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=7PY1X3UxjYrQgYnT77dNqi4Fh23S4UjNQ0/L+jJ16YQ=;
        b=demzJXm/1zl+yTihlvL0KFIUBjj+kUGMV0uoHrI8diyeSPUMIwfBRGDCav8KbT6nCe
         6IZPmf+Ie2ukm+9ooLvAjv8hexjGRdwiGG3PoDow1w84IKSCONCo4bkP9WDsOF+J8cPS
         upaxN3As5sNt4vr8xFSY6XDivf9R9BC4CYizHioD00rQWKjMOysflIsQ2FxnBB+dy3gB
         NSTc5BeFBgn4CQtMtdel6JW/RC3Bz9nd3oXaxa9wig4/BzVJhHaMbvKHIMUBHYEr5UO9
         bB91pOifxyulmJvHlKT30MOWwILEqDVQoMCtfgtp8czLlsuFRA8s0GFHe31CzPfsuHUU
         t/kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cZjFnUJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si1871803uaa.86.2021.04.29.23.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 23:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cZjFnUJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcMPj-0000ia-7H
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 02:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcMPZ-0000he-6j
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 02:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcMPW-0001B0-Tv
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 02:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619763238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PY1X3UxjYrQgYnT77dNqi4Fh23S4UjNQ0/L+jJ16YQ=;
 b=cZjFnUJMBZnXHayRL/hO2425EdGw1CtfNWlxDdQvpgYzxcyVghskP3MeVf5QLS+zxgRrZS
 P0D9BY/WYOuir3w/Hr2pQMjoT56Bjk2JHVM8iiGkYoY8XoeqksGyrvk/6vcSwrJdSrPC7L
 2dE59V9yqdbsYcUXFms8fdDhwaSukag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-1bkxU83HM6mNOnVvXuWfmA-1; Fri, 30 Apr 2021 02:13:54 -0400
X-MC-Unique: 1bkxU83HM6mNOnVvXuWfmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A567D64149;
 Fri, 30 Apr 2021 06:13:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FEB22DAC5;
 Fri, 30 Apr 2021 06:13:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97E79113525D; Fri, 30 Apr 2021 08:13:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test
 build-independent from accelerator
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
 <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
 <874kfprzrw.fsf@dusky.pond.sub.org>
 <603c7934-ea16-baf8-9ae5-ab221db345c7@redhat.com>
Date: Fri, 30 Apr 2021 08:13:48 +0200
In-Reply-To: <603c7934-ea16-baf8-9ae5-ab221db345c7@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 29 Apr 2021 17:10:15
 +0200")
Message-ID: <87zgxgnvtv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OpTCAWMgMihg

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/29/21 3:22 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>>> Now than we can probe if the TCG accelerator is available
>>>>> at runtime with a QMP command, do it once at the beginning
>>>>> and only register the tests we can run.
>>>>> We can then replace the #ifdef'ry by a runtime check.
>>>>>
>>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>
>>>> Please read the last remark first.  The other ones are detail; feel fr=
ee
>>>> to skip them until we're done with the last one.
>>>>
>>>>> ---
>>>>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>>>> +    tcg_accel_available =3D qtest_has_accel("tcg");
>>>>> +
>>>>
>>>> When does tcg_accel_available differ from defined(CONFIG_TCG)?
>>>
>>> qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
>>> is build-time.
>>=20
>> Let me rephrase my question: under what conditions can the values of
>> qtest_has_accel("tcg") and defined(CONFIG_TCG) differ?
>
> They are currently the same, so this patch is a no-op. *But* it
> allows us to remove the global dependence on CONFIG_TCG in the
> Meson machinery (see the last commit in this series).
>
> Is that missing part of the commit description?
>
> "This will allow us to remove the global CONFIG_TCG dependency
> in our Meson machinery in a pair of commits."?

Do you mean "in the next two commits"?

Please also note that the probing at run-time always gives the same
result as the compile-time check it replaces.

I don't understand what exactly the conversion to probing enables and
how, but I believe I don't have to.

[...]

