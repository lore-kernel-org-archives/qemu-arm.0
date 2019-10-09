Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp263370wrm;
        Tue, 8 Oct 2019 17:26:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzt0Ou2jcwT9+gyAsB8uCRV5yLThmQ8mQIiDoxJiWiuCFpusvYFi7ABYtrncOTXTqx4zqf0
X-Received: by 2002:a17:906:309b:: with SMTP id 27mr366852ejv.243.1570580786482;
        Tue, 08 Oct 2019 17:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570580786; cv=none;
        d=google.com; s=arc-20160816;
        b=kXod0JrPcAzUhih6YmK3nTNe/Df6MzfGJYIwcQd3I+EdjQkw1Yaoh1mwkQN8hXwr8w
         oRYOcUOzOC3XPBUP7nUDx4/fcjs0Xze6SSLQZx9KOGhkEDECKZFJMNPkJREBFLtOFbND
         dNscosgOnYIBEOx+Q/dmTYj28aU1pCy47roZfdt+3hJU3r0HUHTv0AJgfeQin8FUgKY4
         OtlwlbJyxMEU4VE63CSj5Wlfq5jH5m21WdjfvmBUmoivbxtGJkyD1x0sWDgsVZrGQCBl
         QP+/Z3Y2j9LTayqnL0CkxNwUGrDlLqLEGxSVq7OOEDtNA9wP2bpLGiXFVqj+BRunSFcM
         TDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=MfBMiVG3wY4Ep7TsfUX/JXFhxKrSB9JknTzH4xZVQSI=;
        b=kH2SQQU51/uLg4EAb1VooWUzvVXPvUfkUwxNsVvVfcWhZr2fwQbqCCqNW/+7Lu7ui/
         i6GwoxbVElQhNRDAgqZheqbgwhmGl1Orpb+iYGrtOGRzQVlsgOHhnokHd2maFJae5+7j
         PhwTxb/i9JBNsSQMwIGLTamulrf9Ct1UYul24ZNTf46vcVEu0Wox9h7bQ8A8Kzp5FhIn
         vVcIyhzSnUxYi4hnvEe8WDkqJ846I9wdakgOC3vpMoJaQOnhDvqsQzAwZNFYSqb+f9+P
         sCqLkig3WAzc1aYLoaNZI8B+ZlemoLZJjThgg0MqIELuPMXvolHMujci5pQ8y243cl5Y
         XGjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si418757edy.95.2019.10.08.17.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 17:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHzo9-00061i-Eq
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 20:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iHznz-00061a-TD
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 20:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iHznx-0007h6-Ic
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 20:26:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52670)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iHznx-0007gn-Ck; Tue, 08 Oct 2019 20:26:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CAB9D18C892C;
 Wed,  9 Oct 2019 00:26:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8805D71C;
 Wed,  9 Oct 2019 00:26:04 +0000 (UTC)
Date: Tue, 8 Oct 2019 20:26:02 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/19] hw/arm/raspi: Use the IEC binary prefix definitions
Message-ID: <20191009002602.GA19707@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-2-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 09 Oct 2019 00:26:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 =?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pc53bSV9tyHH

On Thu, Sep 26, 2019 at 07:34:09PM +0200, Philippe Mathieu-Daud=E9 wrote:
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 74c062d05e..615d755879 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> @@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
>  #endif
> --=20
> 2.20.1
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
