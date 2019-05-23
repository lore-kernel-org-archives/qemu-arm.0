Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1750678wrg;
        Thu, 23 May 2019 06:49:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcZDxlhT6rABIgDFLAaq+/d1z8R4Y724wjlFTrxdEifxNTYBKypHTu8f7f7SooS1O58K3b
X-Received: by 2002:a17:906:7b58:: with SMTP id n24mr76706506ejo.224.1558619355602;
        Thu, 23 May 2019 06:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558619355; cv=none;
        d=google.com; s=arc-20160816;
        b=GLpPaNpdaVpnoFAO/+J9DqXHz3IUUJWgBIEh5LOHe1fkt73i/W0JKlVQ3eDuPDtSnK
         i1ngOk9tzL+3VBp3/wak7k5nbq7XmmaRQEmUfUtIY042uXiZRMgsYR70BIwi4ywAFiOv
         qKGTEQzvA1paMf0ag5AwDFHOeOFvZGakk8ioXaaxAwdOIQCI5p5kMAg43reV4Qky04gV
         CSVOe4HXpZUuLorpQGwLU6SoOOTHkm9GbNcdRJZHwnIDjvgAKk0vFyZyjTAmA5IOi4je
         DSkrkFEyP4IIkmSnVuUdh6cA+lDdgQnEE6RXbo7mX0lpzQFxBiz9zLiMsHuEIJ433Bin
         TGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date;
        bh=YFPZeYcDTkBfjw71AmxbXGx3NXBvcGnQF21zYN37KiE=;
        b=pauD0HQxMMqUBwhPNXPvSFn/ig5J7pRImqgxB0EA/0qGhf8fALeEAeppVcium9ZGMR
         9qh8la1xFvlXFwZdCz6jR45LwbrhPd7T6Vlmytr35Vs2SIfMddFLqbz3qc8qL9ZnpEeK
         Sbr++4Ek3gjdXHEss2j9+k1cJspBdMkP9tugvzySMczr+NiiOiBkyegXlyPoON0T6hNS
         H3Tha0efSInAkWFvevhgccrYPZVAXS2Rhsco8MuF2pxSKVLSJAJqa2RgLWMA8TLpqf24
         ZrzADqh6/gW10GjPhRznxQn4yk8OY2rKaxBRUBW/IgGUnOB6XQTyOyBUl5BToy6y9CRw
         UFfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si7278523eju.323.2019.05.23.06.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTo5q-0005fB-FP
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:49:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTo5X-0005e8-2O
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTo5W-0002xN-3q
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:48:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51626)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1hTo5V-0002wj-UK; Thu, 23 May 2019 09:48:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C704307C719;
	Thu, 23 May 2019 13:48:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D67A36F9;
	Thu, 23 May 2019 13:48:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDA365B423;
	Thu, 23 May 2019 13:48:52 +0000 (UTC)
Date: Thu, 23 May 2019 09:48:52 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <843987408.24357253.1558619332877.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190520220635.10961-2-f4bug@amsat.org>
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.116.137, 10.4.195.29]
Thread-Topic: BootLinuxConsoleTest: Do not log empty lines
Thread-Index: mbTXbDfy49K2N5a/8d08Adqu9TptFA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 23 May 2019 13:48:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] BootLinuxConsoleTest: Do not log empty
 lines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	Caio Carrara <ccarrara@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7TtULj2IzO6



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> To: qemu-devel@nongnu.org
> Cc: "Eduardo Habkost" <ehabkost@redhat.com>, "Caio Carrara" <ccarrara@red=
hat.com>, "Alistair Francis"
> <alistair@alistair23.me>, "Subbaraya Sundeep" <sundeep.lkml@gmail.com>, q=
emu-arm@nongnu.org, "Cleber Rosa"
> <crosa@redhat.com>, "Peter Maydell" <peter.maydell@linaro.org>, "Philippe=
 Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Sent: Monday, May 20, 2019 6:06:34 PM
> Subject: [PATCH 1/2] BootLinuxConsoleTest: Do not log empty lines
>=20
> Avoid to log empty lines in console debug logs.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index d5c500ea30..f593f3858e 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -37,8 +37,10 @@ class BootLinuxConsole(Test):
>          console =3D self.vm.console_socket.makefile()
>          console_logger =3D logging.getLogger('console')
>          while True:
> -            msg =3D console.readline()
> -            console_logger.debug(msg.strip())
> +            msg =3D console.readline().strip()
> +            if not msg:
> +                continue
> +            console_logger.debug(msg)
>              if success_message in msg:
>                  break
>              if failure_message in msg:
> --
> 2.19.1
>=20
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
