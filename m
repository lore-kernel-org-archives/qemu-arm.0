Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1078331lfm;
        Wed, 15 Jul 2020 19:50:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrleaUP5TLHHm8K6i/fkc4WIGBUhYXftiYEvjyuICeEls8r9quveO6zRx79rpgEG//vpSo
X-Received: by 2002:a25:606:: with SMTP id 6mr3437990ybg.308.1594867857696;
        Wed, 15 Jul 2020 19:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594867857; cv=none;
        d=google.com; s=arc-20160816;
        b=0fhQjuQeir9ChTaXpnNnKj66q3++neYMLHE7a/40WvJ+kdlh2GxwFpBM6M0dYISaKn
         6vFSTfdDO/VOWww3BTq2AwR9fAnUbUenzeb/L+/0JmXwTyuhFOS+wbaPHiMCi0jhvmPa
         aK+pU3ktq2uMXwbr0VlEqrhbPW8djBzqIaB1SA62xCdu6wtInNZhZCuhwDqR+b7Xg2Oy
         NVlB5PWst/B/tf4v15jLHg8TVw1jYJLHXfTiO7fiJfCFTw/FjHe+dl/EZq+0CIfYcBRa
         3LFCuVAzP8N/+CngcWQGqoRQOJtwaYv6Bek096HFE3FTzAnPHONdbl9rYN2XkSDLKqcS
         v23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Gpyqdj0qZNNM20TScXYZlSyxF6Er9xUAYkIBSIg/Tw0=;
        b=fq34cadZr5VDwfRXTYSUp3FxvPXTOA20dguNzNg89ZkXkuQS32LhhVI7BoRJPmX7w0
         AIlXEQiW32u+5GYWBw3U7uqfCnk0qHdfPCZVoj6rz1STlXv1tt6wHHsCNhy0oldAWHxr
         J3sPa+EHXytskvD33cxGW8HHaVkKYg4vJ0TyriL57pbK2uOmB1cogI5zPu9tkqJYGtm2
         vMuRif3Xmz2uAYm111yxpSMykNBOvn9MrjeCLopuWYr81V/okfs5RaA6T3Fi/ix/TcDM
         jpQeeh2ZmxO9lOnVR7wEoTDmqzHW6IIixd6splplI404CsH2LpIo8IbR0jfCWTfzKLIk
         3gvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FZF4j6Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n140si4450605yba.205.2020.07.15.19.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 19:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FZF4j6Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvtz6-0002qv-Uv
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 22:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvtyv-0002oZ-AX; Wed, 15 Jul 2020 22:50:45 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:45831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvtyt-0007p3-K2; Wed, 15 Jul 2020 22:50:45 -0400
Received: by mail-io1-xd29.google.com with SMTP id e64so4466219iof.12;
 Wed, 15 Jul 2020 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gpyqdj0qZNNM20TScXYZlSyxF6Er9xUAYkIBSIg/Tw0=;
 b=FZF4j6UaAT95alh7gcJrfQrrYffVD8rv+njuvqtaPA4PsXsIiJXQx1m0J9SjUWqFZ1
 QhO/iCqQS1hT30BJjsD+SoW8ZiXbOzZ+yKwpl4pMP7jTGZGU1ixU7le0Zp06lybm4ww0
 VqCbZCJyPW7lQZPKGNfPsEZbZaiieAP2Hz8PMcc6Db+D2RLvOmfNUi+CXw2OU/YOpItq
 6KPNQ8pTHSQK3fHyEzm69sm1JD6C//AMlA+URIfgh4fnVIKwEGOQP5T64RIWKDdhdgej
 e7mYatjej3KnpHW6MUNABVN5kkr1Z/dT8tJjSYO5GeUN3PvT2pDaBkVQbZatOa7ee8dk
 V6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gpyqdj0qZNNM20TScXYZlSyxF6Er9xUAYkIBSIg/Tw0=;
 b=GoDPpxjmB03Z1Txtyh9Q/w7XxETgVuZejJpjRXIeeJhMahPdWk6874IU2t+4jLaJJr
 rWx/IlGuKmsOQK7Hmfzt3vmBGhfY2WOhL07LgikOlrd51pCXFEBWetalo9Slw9/4zU8X
 zd8/yyfduDnt2R5B4A4tJqCckuzH/IRxkZf530Xo4gt60yx2IK0IUpnvGdnY4vA0D/qi
 +r0QLWb53/ffOMwjOWMGq/hUIwzyaYn8cbUhtVqTkh/lRl9ZO2n0LiLhuEcdaKNjaMCE
 FCBa6VTtv70dnExveKjhKexnhBZxdD1UZ8dBNsztO3hk+B6yOqJQdta3O1GIDg0DLEkH
 zPvQ==
X-Gm-Message-State: AOAM53307teSDjKpxmPsWcd12YHOVlJaZFECzQFySVneI3F98D34itC6
 6oA0Zm01gcd1nPoI1q/JXP2STZNKvUK33Rd0tDM=
X-Received: by 2002:a5e:c311:: with SMTP id a17mr2429768iok.12.1594867841718; 
 Wed, 15 Jul 2020 19:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <e010da48-cfbe-9616-d750-a922cb463a94@redhat.com>
 <f457f5d9-2405-4456-4a26-b3a9784e2cd9@redhat.com>
 <efc16370-869b-15b9-36db-19ea28398e0c@amsat.org>
In-Reply-To: <efc16370-869b-15b9-36db-19ea28398e0c@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 16 Jul 2020 08:20:31 +0530
Message-ID: <CALHRZureR-QU7OUgMdxx0cOGpR4R+7i-bLvZfOKzYws5hWhJqA@mail.gmail.com>
Subject: Re: Test failure with Smartfusion2 emac block (msf2-emac)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=sundeep.lkml@gmail.com; helo=mail-io1-xd29.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1YpAkftue4M

Hi Thomas,

I will check and get back to you in a week.
Hope that's okay.

Thanks,
Sundeep

On Tue, Jul 14, 2020 at 8:12 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Ping?
>
> On 7/7/20 7:32 AM, Thomas Huth wrote:
> > On 07/07/2020 07.18, Thomas Huth wrote:
> >>
> >>  Hi Subbaraya,
> >>
> >> today, I noticed that there is a test failure with msf2-emac when
> >> running the device-introspect-test in slow mode. Either run:
> >>
> >>  make check-qtest-aarch64 SPEED=3Dslow
> >>
> >> or as a shortcut:
> >>
> >>  make tests/qtest/device-introspect-test
> >>  QTEST_QEMU_BINARY=3D"aarch64-softmmu/qemu-system-aarch64" \
> >>   ./tests/qtest/device-introspect-test -m slow
> >>
> >> Then the test fails with:
> >>
> >> Unexpected error in error_set_from_qdev_prop_error() at
> >> hw/core/qdev-properties.c:1251:
> >> Property 'msf2-emac.netdev' can't take value 'hub0port0', it's in use
> >>
> >> Could you please have a look?
> >
> > The problem might be related to m2sxxx_soc_initfn() in msf2-soc.c. Look=
s
> > like you are using nd_table in an instance_init function. This is almos=
t
> > always wrong, and should be done by the machine code instead (e.g. in
> > msf2-som.c).
> >
> >  Thomas
> >
> >
> > PS: Maybe also have a look at this article, it might help to understand
> > the idea behind instance_init a little bit:
> > http://people.redhat.com/~thuth/blog/qemu/2018/09/10/instance-init-real=
ize.html
> >
> >
