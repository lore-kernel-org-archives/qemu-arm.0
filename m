Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3376230wrg;
        Wed, 5 Jun 2019 08:58:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj16lT3KI3vX1EKHVmEP2Utl6Tw1w7EzIExYIK8HVZo2n1bYfAdd8S4eCSoobqliT/UOym
X-Received: by 2002:a0c:d047:: with SMTP id d7mr32749512qvh.64.1559750304695;
        Wed, 05 Jun 2019 08:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559750304; cv=none;
        d=google.com; s=arc-20160816;
        b=R8RQKzcos2vbEG3jtUe9UsgIDpFrgqduTZgxgFCwC2bLePm3/J+fJdxOS32aE6zvOs
         PaNdiBx9nz3PYEXL0rlbLkabbrGf+IWsbMUcG8iZdgS5h27QobruKz1iDIebVt/V3HBc
         dwCvZ/ZOFE7ClPiV+y2auLmRr+czkrav5GtQLq870NDhyzL/1RXusrpzRl7FWM3K2fb/
         L9BAvR3omRbzO9vIHoAoyQdcfB70mjbtBORzBBodP5II5cNIt9JfrciNW3x/y5Kc6PP0
         jQ490OBu9lH+2OQpBpPfheRYFStTQHGX7KacyLjtUN24tfVHs+lONE2Y0ltKKhYFv9aY
         J/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=BhD1X5tbvd9DOek0JiH4ZiPeAAYcjze4O8M+mDQkuwY=;
        b=o63Jtjj5kJxqz4lusfAXZMvxlRhcXhl03Blxv+vPHkcLtW99zouPOzQC6WhImR0yV3
         4PwMnwVUlxXzIz/bMakwAPs5EW6CFrDVU5dLMIMXmkc44m7EHD78VxyvVKq0+OQzKT1m
         T7AN1uMWJSRqFHJQfAHXaH8Cobm36Ue50LIerJrxugT23GiTa+qgP0N+wR3QYBMBcUR2
         uQDziRsp/nngbyyw/7Hq1sqtATG9xa0ciOdT0cQNOYHnXh5AM2prHjtuK62gQXfWcp5+
         aWERRqT1oYEFCc55IbD5iGl8ybffGRW8dvQWVLxc6bs57yZG7GaLFa+x63RWjsnEKlfW
         4ziw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si1013180qtr.124.2019.06.05.08.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 08:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYYIy-0005yI-5v
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 11:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hYYIo-0005yD-B6
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 11:58:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hYYIk-00026A-Te
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 11:58:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1hYYIh-0000xy-UR; Wed, 05 Jun 2019 11:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F71230BC577;
	Wed,  5 Jun 2019 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-163.rdu2.redhat.com
	[10.10.121.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6919E5C260;
	Wed,  5 Jun 2019 15:57:19 +0000 (UTC)
Date: Wed, 5 Jun 2019 11:57:17 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190605155717.GA7080@localhost.localdomain>
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190520220635.10961-2-f4bug@amsat.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 05 Jun 2019 15:57:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-TUID: c9BNqylki/9D

On Tue, May 21, 2019 at 12:06:34AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Avoid to log empty lines in console debug logs.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
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
> --=20
> 2.19.1
>=20

This is particularly useful in the boot_linux_console.py:BootLinuxConsole=
.test_s390x_s390_ccw_virtio test, where in my experience empty lines were=
 being logged.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
