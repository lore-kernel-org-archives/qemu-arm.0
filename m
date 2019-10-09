Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp1222116pjl;
        Wed, 9 Oct 2019 11:53:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzOHc0amc/qBjAqaSEt1zteWRZLxibwEhSU2H6RKwVVAPC/CBRcopefebLUPpCMDsy+06c
X-Received: by 2002:a17:906:3593:: with SMTP id o19mr4237514ejb.61.1570647199092;
        Wed, 09 Oct 2019 11:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570647199; cv=none;
        d=google.com; s=arc-20160816;
        b=EFeoHyiFRlH/P47JslbA+XbAzkasbNIGkfjdZWrR5dCwcr6emEFau4OXYlFWuL+mQf
         gW4Uo/NkwFtxhdopekoObKdiI3hBiOXGkYLWTxT7XCMu9KkLlYpWD9BVykU1Zlkfuy9O
         vZgaBw6L360QSuhmGksKCe3nXtayNuIx1EkdrFyrpJjn92jhDSg3eB9x/t3GePoYZBIS
         8qjWoBDTb4cZ8EY7bENyvcnRq0z96UmTOlCwefw2uMbSXMB5aLvGPyDyimHaURGXq7lf
         5I/frpF60Fjq/ZnBu1s0SiUdPzJyOOv1TVfJcavdPglK2FiXTxtIzg4SD+vA/mMagTfc
         tv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=yGvXj9biyaTEVpxNmGGo8J0N7vkb9fCfry6B3hS8wso=;
        b=r67smHXTPG5LiNlswpTCOPEtPABWMTTGRTbZYlJT7D1tJ3y/VPVeKwQiqO+Zq4U6/c
         ky44Df4yq8RQGyor9AViQlnd64NwrSfEDS01LfQVhpFOGe2ZIW1Ib8Hl+3hXZQVzYaEg
         cvXh3Zk30ItV2+yAxPO0lNBuiC2f9llC4oklJqT1AoDFNix35T87ruXvmXurbxHUrBVl
         fZrEGpiaLCyboapVAcpoWVmLwRSrN/Pb113vkdENKEOB8PedWrLu8Wfawt+6djRP933w
         aW/SmWCknizAR+3Rxa3IWMQwrrbsecC9My2EDw8XEwQNQ5f/MzoRxbN4Wc5/smYWf00q
         5TcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq19si1668587ejb.85.2019.10.09.11.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIH5J-0007X8-3d
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIDtN-0000YJ-Hn
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 11:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIDtM-0002yf-C8
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 11:28:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIDtI-0002wf-Di; Wed, 09 Oct 2019 11:28:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C0ED1300CB6E;
 Wed,  9 Oct 2019 15:28:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4372060606;
 Wed,  9 Oct 2019 15:28:36 +0000 (UTC)
Date: Wed, 9 Oct 2019 11:28:34 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 14/19] python/qemu/machine: Allow to use other serial
 consoles than default
Message-ID: <20191009152834.GA30349@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-15-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-15-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 09 Oct 2019 15:28:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQJhPsuOtNFu

On Thu, Sep 26, 2019 at 07:34:22PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Currently we are limited to use the first serial console available.
> Some machines/guest might use another console than the first one as
> the 'boot console'.
>=20
> To be able to use the N console as default, we simply need to connect
> all the N - 1 consoles to the null chardev.
>=20
> Add an index argument, so we can use a specific serial console as
> default.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  python/qemu/machine.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 128a3d1dc2..302b158a18 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -235,6 +235,8 @@ class QEMUMachine(object):
>                  '-display', 'none', '-vga', 'none']
>          if self._machine is not None:
>              args.extend(['-machine', self._machine])
> +        for i in range(self._console_id):
> +            args.extend(['-serial', 'null'])
>          if self._console_set:
>              self._console_address =3D os.path.join(self._temp_dir,
>                                                   self._name + "-consol=
e.sock")
> @@ -495,7 +497,7 @@ class QEMUMachine(object):
>          """
>          self._machine =3D machine_type
> =20
> -    def set_console(self, device_type=3DNone):
> +    def set_console(self, device_type=3DNone, console_id=3D0):

My guts tell me that we'll need to support multiple devices of a single
type shortly, but for now, this looks fine.

Would you please add a docstring parameter entry for console_id
explaining its effect?

Thanks,
- Cleber.

>          """
>          Sets the device type for a console device
> =20
> @@ -519,6 +521,7 @@ class QEMUMachine(object):
>          """
>          self._console_set =3D True
>          self._console_device_type =3D device_type
> +        self._console_id =3D console_id
> =20
>      @property
>      def console_socket(self):
> --=20
> 2.20.1
>=20
