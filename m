Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3921291lfp;
        Mon, 27 Jan 2020 08:06:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQJwPsjJx3AFcLFd2vm6j5ThGr7yUkLmeep0jCb51n8bxdTerYuOyrr1wny3KiouORb87o
X-Received: by 2002:ac8:46d4:: with SMTP id h20mr16398776qto.307.1580141179813;
        Mon, 27 Jan 2020 08:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580141179; cv=none;
        d=google.com; s=arc-20160816;
        b=I3ubJT0YpjLzj7ATgr7WhnhFSJWlCPuC5h7gzmoIWDnSHtomCUzRhPh04ecBR3EBYB
         XKJYL524719486O8q4LnUARnSPY7DcHP7ke5nvAIIAlKUMc7rpNlPNO4KgaQ2m/NNRud
         sFvSPZp/2HaNSsGIokqfribhGzivDi3E3XiXKbCy0ofLYCy52Mt+suF6cWZ37a6VoKnP
         6fK94/8zUY+FrFyMAXt62+ofDbdqs5XfbebsPuUiv0k738XcZUhG5mqJL+VJNqhe6DEf
         GOmQ9iqFmgtC5VlijrVOcdLqVbR3nH9mFF5fGWXNTVIOoQVCZpMQWr9QpGdQyljgQuGp
         d75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=zIY6K1MaE0r4zDufInqIXB8XjuRww+MPQ9sST5zR4ss=;
        b=RBbSMpB3P7bfuGuptur+UV7pql67O42KfIITDL/qT3mwG4VOQXNVJ00hH8VsYV5Fk4
         4dmAe8IcrLhoSVYsrjGIviGuHXCgTO3Mnv13Ev2QlDyobSTGbS2I8+gAmgMs5y745M2V
         9CnCxEsRdUbMmvK7GjBYI82ayPPf5ZoW14qRpcMjm1vKKc3OLDOfVrH0EfugANf1cRnn
         1tmmQ2Lf9VZfPXRbnLj9BX/EPrYNtxO9ZEPdSE6liPdgogkpthBj/80OrV3nzRY6sTvB
         +j0q4jMQmHkKi69PK96nB9vZz1YMe8KDVJDBsB7Rk7R2cYAmrRDg1sU3mgxsiQb+RBA4
         jU8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XU9Fsw7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s128si10459233qke.225.2020.01.27.08.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 08:06:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XU9Fsw7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iw6u3-0002ob-8F
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 11:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw6tu-0002lp-8E
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:06:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw6tt-00020B-3b
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:06:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58504
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw6tt-0001zz-0N
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 11:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580141168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=zIY6K1MaE0r4zDufInqIXB8XjuRww+MPQ9sST5zR4ss=;
 b=XU9Fsw7hP7sOFYqIgc5L9w7kdWe/5ql7l8+H4a1KVYkJh5hSfIubd6Krasaw353GtAgmqq
 tW3lX9jAQJQet6lz1Xo7Etyd8ulKnhZYtgA0ERtUbJlwhp7exO+T8t90n+btt29L3zOnV5
 7bZKSjq+E4EJMifuDv/UBklTwtowq/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-zf7F07bBMEKzehgEODRaVw-1; Mon, 27 Jan 2020 11:05:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA7C78024F5;
 Mon, 27 Jan 2020 16:05:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED9E55D9CA;
 Mon, 27 Jan 2020 16:05:40 +0000 (UTC)
Subject: Re: [PATCH v4 7/7] tests/boot_linux_console: Tag Emcraft Smartfusion2
 as running 'u-boot'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-8-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <addb50ef-b6cd-fec1-2266-f062cae65090@redhat.com>
Date: Mon, 27 Jan 2020 17:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-8-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zf7F07bBMEKzehgEODRaVw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XkxGjCB0DQu

On 21/01/2020 00.51, Philippe Mathieu-Daud=C3=A9 wrote:
> Avocado tags are handy to automatically select tests matching
> the tags. Since this test also runs U-Boot, tag it.
>=20
> We can run all the tests using U-Boot as once with:
>=20
>   $ avocado --show=3Dapp run -t u-boot tests/acceptance/
>   JOB LOG    : avocado/job-results/job-2020-01-21T00.16-ee9344e/job.log
>    (1/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_emcraft_sf2: PASS (16.59 s)
>    (2/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_raspi2_uboot: PASS (0.47 s)
>    (3/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aar=
ch64_raspi3_uboot: PASS (2.43 s)
>   RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 19.78 s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 22b360118d..4a4cf9d0ea 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -305,6 +305,7 @@ class BootLinuxConsole(Test):
>          :avocado: tags=3Darch:arm
>          :avocado: tags=3Dmachine:emcraft-sf2
>          :avocado: tags=3Dendian:little
> +        :avocado: tags=3Du-boot
>          """
>          uboot_url =3D ('https://raw.githubusercontent.com/'
>                       'Subbaraya-Sundeep/qemu-test-binaries/'
>=20

We should maybe move that test to another file, too, since it is not
using Linux. Or should we maybe rename boot_linux_console.py to simply
boot_console.py ?

 Thomas

