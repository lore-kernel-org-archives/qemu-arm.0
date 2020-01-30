Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2437347lfp;
        Thu, 30 Jan 2020 14:19:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoHc9TFRot3Ofcc4akGnKbG7Eb6O1YQWwIAJU1h1IUV4zDw9giwdaP9Xy+2v0pgD+g7pMY
X-Received: by 2002:ad4:4dce:: with SMTP id cw14mr7322276qvb.162.1580422764741;
        Thu, 30 Jan 2020 14:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580422764; cv=none;
        d=google.com; s=arc-20160816;
        b=OX1NoD4cs9Jt84XByLEzkJgUcrdeZNsl1xdOavQg40eN55trzZaJqowJIp7aXNocFp
         jCsf6rOfeXCTYqG9BNkXbL8s92A3S+oyKzbamLzOg04esDUGbXwVyD/qxvekEIOjAdHH
         Z7bAbt1Yp4BBm+fCj1U4SlGbUSHL9KAh0FO5kOjkgTrRWKeY54dBMQGp6o/UDTXAnatR
         26fiv9rkz6lh1GeAzqlpxiZU7u3tCOR1p3G/rxNhGgRYRf3XYccdg+Zf53CfeGq/T3k+
         ukfUdhkzFBbh1bw8/WUgmAIIaofQChlqxKkQEVMr+pkMKEww7yTpzJsL8vTU6udqA+en
         eHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1bbijX/5mpejZEmEAhJQI3cWJJJgBAOpvoXXXibcMYU=;
        b=qLCRoA+QQ6dN/WCl1+0cpwzb5XvzacJl5myMlaisKq0/dVs0m+1HovLx4kFjnfMcnb
         qE7G7lr1VKSyCfgYKdbjRpWJT6hNSYy2Vlpz0vSf1luptv2gISErLRfcsKbstplpMlOy
         +4GEuxFBaS+GpjxLtHgukfo3IdewrNfXUDmKngJd34sKHW4APqtONmiCJkH+Noo5kmle
         p1ZHRvPKEhEU69qn7ronM4r8CLhr/Af79fF3QfLnteRuHji54BZGdrGC/unsZ8pRyeSa
         6FpxiyRvV2A32PiWZCCJtcvMJ7Mw2KCEgEtC/J3malZi0+HYQ9ARwQHx3lQeA8G0MelZ
         fbdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YxYIkd6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d47si5062367qtc.99.2020.01.30.14.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 14:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YxYIkd6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixI9k-0008M0-3Y
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 17:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixI9Q-0008Jd-Ti
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixI9P-0004Fu-H8
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25190
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixI9P-0004Fd-Do
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580422743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bbijX/5mpejZEmEAhJQI3cWJJJgBAOpvoXXXibcMYU=;
 b=YxYIkd6ILC0+RLWUrvxX6nWyOpU/kwTyqWJL1GMyrVwZpUgLuBwgAE71kQg2PIQ0Qsuqaq
 cMHQuWqdXlr93HQsgz30eBE58i2kdVUqWLerhqojg1mGLoPzLA+2S0lSk2CVIK+7aqmZ8v
 kSj1l7UdHrO8XW6FxVk1YetQb2Pl3Jk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-YDSQKR2lM3KBQLcPXelPzA-1; Thu, 30 Jan 2020 17:19:00 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so2328431wrm.17
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 14:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBD9r5igCEYXX1Zd/yQCCldg83MJcLH+8L6Hgk4lI4Q=;
 b=umXgNTsa31tFm2KTG+IrH1DqD3as9ybLTDGU+/SDrdLpzJL32TjDLapAhQw81/F6bf
 Luggy22tOHrlUv7ySyLThFDsv2VM1L89p6gAR9ZrFugJOsdCwtvxvzrj5K3Sea9eZPoN
 Si1Kt8mYGzQIjgXLe5fPM/fbtlsqmaveKgqVqlRBkDTo+/+AIDsoFXEAKO0oJHSKQSXE
 G31H7AsdifSJ+aMcyrRAcxmZBoqsiWk06qMgKskU7pb6ZB+gCtRGi8weMKpYb19y7H6g
 loV3RjeB8s6k188/XUcS0vjBQYxaLe7t2etPn65p2qWVlFk3zF934WHcmZUH+rHvBEBT
 wwRA==
X-Gm-Message-State: APjAAAWroB7jP3D8VZ0BSBgTUZzMit70rV17SNoaZ6XAsg/FOnNZSHrt
 AE5ilKmdVSEHTJ4gPRaB5obMUAaz+xm8KAcyMy2zQ+yH1OfuTX6bH2VZjz49bV5WQYyLJQxGXH4
 c+RuQXaMf7LIl
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr8058553wmj.4.1580422739483;
 Thu, 30 Jan 2020 14:18:59 -0800 (PST)
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr8058533wmj.4.1580422739229;
 Thu, 30 Jan 2020 14:18:59 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id a9sm7985110wmm.15.2020.01.30.14.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 14:18:58 -0800 (PST)
Subject: Re: [PATCH v4 2/7] Acceptance tests: Extract _console_interaction()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57469393-0d7d-a4f8-d37e-2144ac6b67e9@redhat.com>
Date: Thu, 30 Jan 2020 23:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-3-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: YDSQKR2lM3KBQLcPXelPzA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqFsuXXqf1bI

On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since we are going to re-use the code shared between
> wait_for_console_pattern() and exec_command_and_wait_for_pattern(),
> extract the common part into a local function.
>=20
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 31 +++++++++++++----------
>   1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 6618ea67c1..0a50fcf2be 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -55,19 +55,14 @@ def pick_default_qemu_bin(arch=3DNone):
>           return qemu_bin_from_src_dir_path
>  =20
>  =20
> -def wait_for_console_pattern(test, success_message, failure_message=3DNo=
ne):
> -    """
> -    Waits for messages to appear on the console, while logging the conte=
nt
> -
> -    :param test: an Avocado test containing a VM that will have its cons=
ole
> -                 read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> -    :param success_message: if this message appears, test succeeds
> -    :param failure_message: if this message appears, test fails
> -    """
> +def _console_interaction(test, success_message, failure_message,
> +                         send_string):
>       console =3D test.vm.console_socket.makefile()
>       console_logger =3D logging.getLogger('console')
>       while True:
> +        if send_string:
> +            test.vm.console_socket.sendall(send_string.encode())
> +            send_string =3D None # send only once
>           msg =3D console.readline().strip()
>           if not msg:
>               continue
> @@ -79,6 +74,17 @@ def wait_for_console_pattern(test, success_message, fa=
ilure_message=3DNone):
>               fail =3D 'Failure message found in console: %s' % failure_m=
essage
>               test.fail(fail)
>  =20
> +def wait_for_console_pattern(test, success_message, failure_message=3DNo=
ne):
> +    """
> +    Waits for messages to appear on the console, while logging the conte=
nt
> +
> +    :param test: an Avocado test containing a VM that will have its cons=
ole
> +                 read and probed for a success or failure message
> +    :type test: :class:`avocado_qemu.Test`
> +    :param success_message: if this message appears, test succeeds
> +    :param failure_message: if this message appears, test fails
> +    """
> +    _console_interaction(test, success_message, failure_message, None)
>  =20
>   def exec_command_and_wait_for_pattern(test, command,
>                                         success_message, failure_message=
=3DNone):
> @@ -94,10 +100,7 @@ def exec_command_and_wait_for_pattern(test, command,
>       :param success_message: if this message appears, test succeeds
>       :param failure_message: if this message appears, test fails
>       """
> -    command +=3D '\r'
> -    test.vm.console_socket.sendall(command.encode())
> -    wait_for_console_pattern(test, success_message, failure_message)
> -
> +    _console_interaction(test, success_message, failure_message, command=
 + '\r')
>  =20
>   class Test(avocado.Test):
>       def _get_unique_tag_val(self, tag_name):
>=20

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next

