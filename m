Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp1239996pjl;
        Wed, 9 Oct 2019 12:09:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy63zIbGNsvPf/vj0GBiDIQRH2c5EfZp3ueweteAksbzEgimNyPX5D92e8hepY17Ac8wFeJ
X-Received: by 2002:aed:20a1:: with SMTP id 30mr5409896qtb.199.1570648169997;
        Wed, 09 Oct 2019 12:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570648169; cv=none;
        d=google.com; s=arc-20160816;
        b=O1XjKhoq8KAWTAvAuKPR1kwq+Cys1A3YKnZEgjKonmSmvIEoEsAm/Pk5FkJ8Ty95gz
         HdY7FAwH804hCSungw3v6RoAJ4+7mMjkhqe6SzOFRqKzFKA5L3v13NJ+HuGVAqH+2r82
         ucW622e4jwmrwwFWu7FN76iduJ9oGoidZaP3niErBfP2XgE5tdd+HtgfhF3S9cBPm3h8
         Bxw78ph4xYt2SICTCN9X+zwnhGB95T/d1MEhocSPJgbgQnvRrETl0gYoYzPYcv6FqS8b
         m/8JVIq+tnCyynFsoBUQA1SS0ak0rPOYIIv/IvoV7kZUu2lAocNlBVQhqv/Oh7g0HQVz
         /C8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=vi0gbhPnJDIH6q2khyqqpz9H64jfR/j1BvRIJjLVZWU=;
        b=L39/DFYQARN/RMPCofHbVD+/VRtNV2PcRge398qSItFTgGCo76Okl/2GI6zuK/v5eB
         o24HGaiTv6Cvzv8mmusBsr0HT0sUnzmbcrGGhpWUr1G6rOyhEWk93cMlzLOtSGyim+On
         8y60IiifNjqzdHVL46AxJtEbKouiEJotICTKTwLmYd06EeJywVN25IxRWRwQpMl9dO34
         5qH/9EBVoLBssZBr8eRJdJDkBEUUy9Axfz+sdIdHPaahVzgOmgx1U8oW2aZV7YzUBV3D
         3CbaG2q4o4RhtDm/Y7uoJD2Y0vm9zMC7spNGZdk+Ceullxxbj82XTFHWyb/+fkeGYdtV
         paPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si2680104qkg.221.2019.10.09.12.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 12:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIHKz-0000qQ-8n
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 15:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIDwE-0000sy-Ot
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 11:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIDwD-0004OB-Nw
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 11:31:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6683)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIDwB-0004Ni-Iq; Wed, 09 Oct 2019 11:31:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91D45300BEAB;
 Wed,  9 Oct 2019 15:31:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA8315D9E2;
 Wed,  9 Oct 2019 15:31:31 +0000 (UTC)
Date: Wed, 9 Oct 2019 11:31:29 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 15/19] tests/boot_linux_console: Extract the gunzip()
 helper
Message-ID: <20191009153129.GB30349@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-16-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-16-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 09 Oct 2019 15:31:38 +0000 (UTC)
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
X-TUID: 4/7W3VSpD4cI

On Thu, Sep 26, 2019 at 07:34:23PM +0200, Philippe Mathieu-Daud=E9 wrote:
> We are going to use the same pattern. Instead of keeping
> copy/pasting this code, extract as a local function.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index 8a9a314ab4..079590f0c8 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -19,6 +19,11 @@ from avocado.utils import process
>  from avocado.utils import archive
> =20
> =20
> +def gunzip(in_pathname_gz, out_pathname):
> +    with gzip.open(in_pathname_gz, 'rb') as f_in:
> +        with open(out_pathname, 'wb') as f_out:
> +            shutil.copyfileobj(f_in, f_out)
> +
>  class BootLinuxConsole(Test):
>      """
>      Boots a Linux kernel and checks that the console is operational an=
d the
> @@ -166,10 +171,7 @@ class BootLinuxConsole(Test):
>          initrd_hash =3D 'bf806e17009360a866bf537f6de66590de349a99'
>          initrd_path_gz =3D self.fetch_asset(initrd_url, asset_hash=3Di=
nitrd_hash)
>          initrd_path =3D self.workdir + "rootfs.cpio"
> -
> -        with gzip.open(initrd_path_gz, 'rb') as f_in:
> -            with open(initrd_path, 'wb') as f_out:
> -                shutil.copyfileobj(f_in, f_out)

I'd rather see this eliminated...

> +        gunzip(initrd_path_gz, initrd_path)

... and this becoming:

    archive.gzip_uncompress(initrd_path_gz, initrd_path)

- Cleber.

> =20
>          self.vm.set_machine('malta')
>          self.vm.set_console()
> --=20
> 2.20.1
>=20
