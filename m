Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp706021wrg;
        Mon, 20 May 2019 15:36:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXygFZa/GdBA7r9fiBdPDLDYhwxw2ndUYv6Z4hcTegEKhLo6gHvRxbQiUMOXolSYSNLC2L
X-Received: by 2002:a17:906:ecee:: with SMTP id qt14mr57330512ejb.96.1558391804790;
        Mon, 20 May 2019 15:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558391804; cv=none;
        d=google.com; s=arc-20160816;
        b=hcoHk8dsxwaRI75QbVhZs1FxZv0mQvwiJCZ6eC8mPTCn+i+ro98siGXPZz/gsh4JVB
         AYuyc4DdryJE1PA/CdoRdVsHYXk7pELXf0z/uaD+BXpjakKuiVxkIqclhT920hqlibdC
         WncRfgILhNN0HYbX6WdPLnyLRAKnbK129kuP3qSECSKd0WSXvSm7jqvMFkAyv+YTb9K5
         DQbF1CPYLhH7bfyQxxWWgiDVsH5vS7biVR5SGCYMt0Yd4MqfB9TAX7Yb84lP7p/JdaZh
         tcbHo2M2OjAAsegW1ijtIHCIfywvmkCnjnJEPsbkUjBRcOzua4C7pZQzD+rnZqsAWAyU
         gKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=6XLpUATolXYlIlmnapU6xzAOp7uVLc6iD1wRLL20/qo=;
        b=IVVfVJoch4eIRorzeCd9rXOKSfiqAekj3OlyEBbXeBmBmaQmWFnhhOGbZ0csVu/ok0
         IHZi4PQzNXXxWm+WWfDt3pn9OgwDwW0BkAkJs2UTKy4BMfYHW1CSo+LG5+/nkzuAUO5p
         XtIFpflm4VBL6It0NK1beADA0gza1ESIXcroIQdyJrB/CbrC/D1sue+Qg9GBDR4bpGNX
         mzW28vLLAPCKUXD3ouq1eaJ722Ard9hi1VQwcCYEmuSCWla4S2H+KWn1ZMc9O2rris4j
         O3fgzHrzqFF/Yo66o07YanpBGekK7JrkDoPYICtly3IvBh9A4ljHpt60/D1ygvE8AP6V
         MkVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mfd3zQnL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si6724187ejz.152.2019.05.20.15.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 15:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mfd3zQnL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqtf-00030G-Tu
	for alex.bennee@linaro.org; Mon, 20 May 2019 18:36:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqtH-0002wX-Mv
	for qemu-devel@nongnu.org; Mon, 20 May 2019 18:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqtG-0000gz-T9
	for qemu-devel@nongnu.org; Mon, 20 May 2019 18:36:19 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hSqtG-0000g1-Hn; Mon, 20 May 2019 18:36:18 -0400
Received: by mail-lj1-x241.google.com with SMTP id q62so4505298ljq.7;
	Mon, 20 May 2019 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6XLpUATolXYlIlmnapU6xzAOp7uVLc6iD1wRLL20/qo=;
	b=Mfd3zQnLW81q2EbmA+K1ViFHuEPvyM6ZgOT0KaZr2GMCFmi6ze4kY1mt98998MZeNi
	3zTm84JfCMmPtkTwttNwoYWCXSR5ImWm2wVXBHJ2w1bdInovQkPXTppQL67kD6zQbjVa
	kXCULeqkHx1FTSwzFAsEWI3C/cnU+VEbG6CY4Qh5y85zocKpQWZqypCB8Xpf4dfG5zS9
	Zoa2prVCgsbglj7/ojS0nJ6Q37Dr3tHC5Sgf5meYZbo61zcCh082SrO6ugtjsFBddo0U
	n+5zBFuU9PcIOa4wXSvi1hA+WcdLbGTPUhiDAg/Q9qGun/TQX/YZATwVvSZCz1oL330w
	57bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6XLpUATolXYlIlmnapU6xzAOp7uVLc6iD1wRLL20/qo=;
	b=Jmn+qnZhNIRo/z1pMgUlnoOnfAc9VhInuHX3nVUSjpHlSHmaxNPch8oDsy9rvKfMo4
	GgbE0OTpbrADoZaA2SVozNTNI2u8Pydx+X4Bh/UxEVWY9oVPeXT7pEOPt3IsLDhgAuz/
	u+YNexYy2ZZslgr3Y+PTSfRNUC1Fp0BJm4C/qB/xP1s66R4NhjfCvBHw6Z4lQDe80CQC
	z6povafOhI/Tr8qfEAjm8bIEe+3Huy+GBI/3x/ZfNV9ZyLkH7rkVYsZ72qXuzln2r+lP
	DEYcoKnKiBc5YsjS1NGLf43rdn7oUKyffSZBCFPusq8FQyJwxWglooZUeOEpNyCZoiGa
	dUYg==
X-Gm-Message-State: APjAAAXfVtK030JPaig0JY/C1N99MPl9A7UBAB4VX8dK0zVqKoEHvD6O
	U8TMTLgTSqkJm0CHyJatU5ToYXIHHkDvlVhVQvk=
X-Received: by 2002:a2e:9a4f:: with SMTP id k15mr33045343ljj.159.1558391777056;
	Mon, 20 May 2019 15:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-2-f4bug@amsat.org>
In-Reply-To: <20190520220635.10961-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 May 2019 15:34:02 -0700
Message-ID: <CAKmqyKNO31U-+JQHT0JAKViqn+9OAiyKqVBDwFEx5dNBx+b4dw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 1/2] BootLinuxConsoleTest: Do not log empty
 lines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Cleber Rosa <crosa@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Caio Carrara <ccarrara@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1/ZKjky34QY

On Mon, May 20, 2019 at 3:07 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Avoid to log empty lines in console debug logs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/acceptance/boot_linux_console.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
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
>
>
