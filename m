Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3973129lfm;
        Tue, 14 Jul 2020 00:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc5hkcyNz3wH3lH80OyG+lyvMLv8FtmFJ7k+YdRweJ2COmvslVfE8bLbTNR14l/zpgYSXQ
X-Received: by 2002:a25:abc5:: with SMTP id v63mr5893631ybi.148.1594710382495;
        Tue, 14 Jul 2020 00:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594710382; cv=none;
        d=google.com; s=arc-20160816;
        b=sVd6XGDPPKsT0ujMHKZAtlGQI6+DYqB6YPwRZhrl3EQ4SlOc+PsNdrDqncYeJjKfZp
         NKZrUt2e5vI8MiAMDAopyFeG2DNC5ik3PC9ayPAOysGURHBKGqjOtNCyRTTB8Khavf7J
         bWGbTUbqrlRYqJN3mcQewyz6Lbt7b7wefNB6v3ZsNhdHkv49lZzh6X+/l9qY05K6MdhF
         EYQZh1rNt4exy8jKAJikVCuuXRsy7NmjLxcjCpjrH1OmqCWlfiDyEgwtcVROFZU23AE7
         OtUUUvEsItFOoDsZb8qbGauvXjnuBc0Pznn9w7oETYqMtU7zlvBixWrlVV4Wn9V0ozkh
         bOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=Ixxg+GRT7G5TW1fzZfXilfGK38e/HN2BuMRx7Flnqnk=;
        b=QN0ZQvDzDoxfDhqx9Ony9tV85mZue6rtmexaed4w5GSlGPoxAstRY8erDy09nNQlCw
         TIX9qcq5o4ONUdaYKkadvURObpo5wJTtGzeMk84ro354rv7KFArbESIjQL8cmIC+YMVO
         9chHTnbKtzdt87WL9X47yzDYlT6P6IXWDRYJvlzIFVz9Fsl3AE4FPSZHO9MFRabxH3r/
         XhtZP/e22ayUNPgi9U04Jk2mO7H5e9D3rSopeKzHoSEewsaintksAUl/h4gnTsB8X3r8
         Ol0gfQq6ci87hOcbJTQwE3LTfk13WmmWd2GSBVYEfPqtkUtohDLI2haulbv88mcJ0y24
         l77A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KkKmcv1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si8535858yba.318.2020.07.14.00.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 00:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KkKmcv1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvF1B-00029L-T4
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 03:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvF13-00028u-WE
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 03:06:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25110
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvF10-00073V-Tt
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 03:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594710369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ixxg+GRT7G5TW1fzZfXilfGK38e/HN2BuMRx7Flnqnk=;
 b=KkKmcv1E24hnDrjKQr96tqd+495KkUUS6W2exfRv5WCFFy6SPRVslw0A7zUkCtwjAn23vW
 ajjP6xLwsD3apbV30g4468+Wt9Ueg5Npy0OiTuf0zzlIv0Xnx84w2D3kZEXPDYbQ2j73Et
 0CjKzX+adRlAxEATI6UJP8s4f38jV/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-s8_5kHitP0GvrMemI38POw-1; Tue, 14 Jul 2020 03:06:05 -0400
X-MC-Unique: s8_5kHitP0GvrMemI38POw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CF4E100CCC1;
 Tue, 14 Jul 2020 07:06:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A187876206;
 Tue, 14 Jul 2020 07:05:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 20069105A45D; Tue, 14 Jul 2020 09:05:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] hw/i2c: Document the I2C qdev helpers
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-6-f4bug@amsat.org>
 <87zh8kg8qu.fsf@dusky.pond.sub.org>
 <CAFEAcA9cajf=MKv4ZD6ivyDTrK4hWLfBP_9T2mJ6LrWjwGMFGA@mail.gmail.com>
Date: Tue, 14 Jul 2020 09:05:56 +0200
In-Reply-To: <CAFEAcA9cajf=MKv4ZD6ivyDTrK4hWLfBP_9T2mJ6LrWjwGMFGA@mail.gmail.com>
 (Peter Maydell's message of "Tue, 30 Jun 2020 14:16:45 +0100")
Message-ID: <87pn8y8tkb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wpQvA3N4mspE

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 30 Jun 2020 at 11:15, Markus Armbruster <armbru@redhat.com> wrote=
:
>>
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>> > In commit d88c42ff2c we added new prototype but neglected to
>> > add their documentation. Fix that.
>> >
>> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> > + * This function is useful if you have created @dev via qdev_new(),
>> > + * i2c_slave_new() or i2c_slave_try_new() (which take a reference to
>> > + * the device it returns to you), so that you can set properties on i=
t
>> > + * before realizing it. If you don't need to set properties then
>> > + * i2c_slave_create_simple() is probably better (as it does the creat=
e,
>> > + * init and realize in one step).
>> > + *
>> > + * If you are embedding the I2C slave into another QOM device and
>> > + * initialized it via some variant on object_initialize_child() then
>> > + * do not use this function, because that family of functions arrange
>> > + * for the only reference to the child device to be held by the paren=
t
>> > + * via the child<> property, and so the reference-count-drop done her=
e
>> > + * would be incorrect.  (Instead you would want i2c_slave_realize(),
>> > + * which doesn't currently exist but would be trivial to create if we
>> > + * had any code that wanted it.)
>> > + */
>>
>> The advice on use is more elaborate qdev_realize_and_unref()'s.  That
>> one simply shows intended use.  I doubt we need more.  But as the person
>> who wrote qdev_realize_and_unref(), I'm singularly unqualified judging
>> the need ;)
>
> If qdev_realize_and_unref() has documentation which gives
> the use-cases similar to the text above, then we could make
> this text say "This function follows the patterns and
> intended usecases for qdev_realize_and_unref(); see the
> documentation for that function for whether you would be
> better off using i2c_realize() or (the not-yet-existing)
> i2c_slave_realize()" or similar. I originally wrote the
> version of the above text for ssi_realize_and_unref()
> as essentially the documentation I would have liked
> qdev_realize_and_unref() to have, ie including the nuances
> which I had to figure out for myself.

To document wrappers as simple as ssi_realize_and_unref(), pointing to
the wrapped function should suffice.  When more elaborate documentation
is wanted, it's probably wanted for the wrapped function.

Since you felt a need for a more elaborate ssi_realize_and_unref() doc
comment, you should probably propose a patch for
qdev_realize_and_unref()'s doc comment :)

