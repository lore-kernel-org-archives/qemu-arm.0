Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2437586lfp;
        Thu, 30 Jan 2020 14:19:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRIQ54NE9PGDB557PigA/rJ1ByoSLeTykOjTiHpOGQLVA8MqwWMW8ns7lUB1K9Djscwqxy
X-Received: by 2002:ac8:1385:: with SMTP id h5mr7380560qtj.59.1580422781758;
        Thu, 30 Jan 2020 14:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580422781; cv=none;
        d=google.com; s=arc-20160816;
        b=L6gJUm44EBtSDgzdOTG1aVuK4t/XBXF0+zAEPGjaY6B44kGM/RC+p5aa9J4jaqtDo7
         QjE1tROiETbmtkvj63LquWdetlC52Gld0H6CGluvfRhD97LyngRucMtyvFcNdh8bWFQT
         /jjCEY6oJXkB6Y7o/I4rf3iN4xoBu501Al7I6JGokXmDZWvx4EqlrQAUagxdfj9i7Ghu
         sDAcY4suPrTR4pUHpzOcEAFSfLOz7LM7VW1QDJSsy5qbAeXnQ6YJvmx4BsHAcYD1C+E4
         UQmk2rVhMh+92+DWZS2swFAxaae9OCteP2J09TQCeZijZhzYJucdcdlRCNm48k64dA1B
         UTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FjfPCZ3VGpmVHkzcKcLSdCsHWP+qqF4grXsLnPpnU1M=;
        b=hU++mEiH4fty8jhUYBgXNw9hAm4kMfCONItB641QHpBo6MF/xR7bYGkO8OYWHMfNPU
         3KD/2kAB4tkC86LzQnbUBRCEqECHZBEkaQ1qEUUofFYvFVzKAApN5uhLvwD2iHy32ha/
         TB4IXDQEn+ZYOLUQj+rntZXYxAZqVfeWLe70iMcsajG3ktEOdquDfmzrz3e1pwAi+rma
         lrymW4BXFq5KFMMSzF2hQfjvGDzv4LPIFMHftM7Y3rBJQZwsDWkcrzwjx6ivnxnBwlOA
         QTsWhoe4euNNrJxgTHLudRKRkSERlEkvzPbF5fRcETUDLQI6NFYX5kNoIaFlvrOEfw6o
         kAUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XR/SKydr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si5268511qvb.150.2020.01.30.14.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 14:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XR/SKydr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixIA1-0000Ko-2z
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 17:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixI9k-0000Ex-TD
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixI9j-0004cB-KR
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25072
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixI9j-0004a7-G5
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 17:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580422760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjfPCZ3VGpmVHkzcKcLSdCsHWP+qqF4grXsLnPpnU1M=;
 b=XR/SKydrY+Vyq4AZFFAb5YlAlrCDcv3NLfurKL60gcoYVFJQnfBEgA/SLTWNWxhnsrG4WE
 r4d6130oE5F1PU/Il+3weuFj0636qKKx3fHPiMjnVVxJTq04QUGGuBhVyIsDI/pTa2cpkd
 F4smCsiZtxvIB7oW5x7ZsyAC7YFjJNc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-nBL7jxwONTOJS9FX4by5PA-1; Thu, 30 Jan 2020 17:19:17 -0500
Received: by mail-wr1-f71.google.com with SMTP id a12so658805wrn.19
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 14:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdqf5LMUDJTWCWwG5fmZ87c4gFRxCLOpBOjz45b8I2U=;
 b=X3Pk0L6SfQOspxLB0oyg7kL0HV0HS2SqJz7EqcoLEHmj5UbRt/qGUlNtKeXPG3FS5Z
 jpL8U/6mR8yXDYZJ7nqQz2LcuMO5lgYINWH3Xg8bxoDVAQPmNU+N1A2OQU+1VL7GLB/T
 1ywQJBOMBTnzACgit0YTG6m0FKKDrpJeRUuWfbl0iRXL8n1OLGvDL/PZoC6KU3Pyhl3I
 jH+kMmrhiJTh6uVu+Ps1ahdV72b9CrBp7zVL+jLLidUtPQ4bWAnaDyo47EV8bgu4eTeb
 /dAnLhEo+2WtLkD2LdJdDFSMGd2M2tZpf5PU0Ctz3xhAXe2u4ol7CzNQoa4xNtjvDb05
 yrow==
X-Gm-Message-State: APjAAAX15d8q69oa34mDlGL2kryQxV5Ts2xA8DX9lrb3Coe7XNbbQ+ce
 8Q6J1E3iNSnOv90OQ8WXPJM0g/Kg6XJ1mGO7YScAadFpCx1AAgbk/RUnbO9L+vo/RTUE+m7gscg
 3ppSybqLcB+9a
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr7686810wma.142.1580422756648; 
 Thu, 30 Jan 2020 14:19:16 -0800 (PST)
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr7686785wma.142.1580422756366; 
 Thu, 30 Jan 2020 14:19:16 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id v17sm8746362wrt.91.2020.01.30.14.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 14:19:15 -0800 (PST)
Subject: Re: [PATCH v4 3/7] Acceptance tests: Add
 interrupt_interactive_console_until_pattern()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f4801dd-9d43-02f7-b954-75395d0c95fb@redhat.com>
Date: Thu, 30 Jan 2020 23:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-4-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: nBL7jxwONTOJS9FX4by5PA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G9+30vqghknj

On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> We need a function to interrupt interactive consoles.
>=20
> Example: Interrupt U-Boot to set different environment values.
>=20
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 32 +++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 0a50fcf2be..d4358eb431 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -56,13 +56,15 @@ def pick_default_qemu_bin(arch=3DNone):
>  =20
>  =20
>   def _console_interaction(test, success_message, failure_message,
> -                         send_string):
> +                         send_string, keep_sending=3DFalse):
> +    assert not keep_sending or send_string
>       console =3D test.vm.console_socket.makefile()
>       console_logger =3D logging.getLogger('console')
>       while True:
>           if send_string:
>               test.vm.console_socket.sendall(send_string.encode())
> -            send_string =3D None # send only once
> +            if not keep_sending:
> +                send_string =3D None # send only once
>           msg =3D console.readline().strip()
>           if not msg:
>               continue
> @@ -74,6 +76,32 @@ def _console_interaction(test, success_message, failur=
e_message,
>               fail =3D 'Failure message found in console: %s' % failure_m=
essage
>               test.fail(fail)
>  =20
> +def interrupt_interactive_console_until_pattern(test, success_message,
> +                                                failure_message=3DNone,
> +                                                interrupt_string=3D'\r')=
:
> +    """
> +    Keep sending a string to interrupt a console prompt, while logging t=
he
> +    console output. Typical use case is to break a boot loader prompt, s=
uch:
> +
> +        Press a key within 5 seconds to interrupt boot process.
> +        5
> +        4
> +        3
> +        2
> +        1
> +        Booting default image...
> +
> +    :param test: an Avocado test containing a VM that will have its cons=
ole
> +                 read and probed for a success or failure message
> +    :type test: :class:`avocado_qemu.Test`
> +    :param success_message: if this message appears, test succeeds
> +    :param failure_message: if this message appears, test fails
> +    :param interrupt_string: a string to send to the console before tryi=
ng
> +                             to read a new line
> +    """
> +    _console_interaction(test, success_message, failure_message,
> +                         interrupt_string, True)
> +
>   def wait_for_console_pattern(test, success_message, failure_message=3DN=
one):
>       """
>       Waits for messages to appear on the console, while logging the cont=
ent
>=20

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next

