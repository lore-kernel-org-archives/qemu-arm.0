Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp327785wrm;
        Thu, 10 Oct 2019 21:14:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKtsMfZ8rd/1kXmtWbsHUv/hcr8yIHE2Wb4PgW70CpkYaibWUYxaIA0wk2R0q+AHxzXo7U
X-Received: by 2002:a05:6402:327:: with SMTP id q7mr5228999edw.30.1570767290522;
        Thu, 10 Oct 2019 21:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570767290; cv=none;
        d=google.com; s=arc-20160816;
        b=q/Pn1ykHmmwF3iZCq5E34Kbf7q8/eB3VnBr2TM/CLDUj2txQ1/qvZKzcUaGX+wAHnF
         8YK8i38Is0KDnDTrFK21BDV6nsS8gwJQREn3oslG6ZGERfvtOO0dGtN23NiZChZ8peqg
         WpOTGdKYNyZfyvn2VuP2U8LOHDce3dhVXH8xBw76j5bc7EwQgaMkQpF3gLxGlb8fxvwm
         NGL4nWDUUl9uqMeS398YhXz0QLLOXpimSqAZeAvttmT7I1RqhCGHLr9GPiCtCAqie+cw
         SH+PjhnECJFOHUo1theHIVUkccc4ulZ0hHUU4IA9mCcyfbys7p9VjAqL9A+x13bnLWeM
         opPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date;
        bh=nNp6DLAq/fB7cju99L+t+Hek9ahHT8Sj3q4Zx0gti/g=;
        b=IhxfYSiImDCaTwr9W1gZHzL1QtQ8vj6wjZ6KHES4YHuISIlDxymXEtcOJVCSwckBC+
         TTySsSuYb0BRtPOpgy45XmSgOE+dBCZ5cQ7fiJolGCfQk5RI/SWRfFqooXQf6DGoOsAS
         QUMB0vDVpr6lygc7Zt5ZFzEsUOxY2DhVDteQPwA/a7MUaiKz0ZZ0A68u+AUn99539igP
         UnRdr5xaqFZbFOSqjQ0k50DWYQ1VVNq9IenaIQRBwcAJlf8BGg4UDX95hacBFFKhSEwh
         9h8gRbMjT+68Opw/swZEIEJ/176RKgiz+yabJ1fzC/QEhKEFeR1dbfeJWp9uNzsfmLB4
         arbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca7si4488270ejb.319.2019.10.10.21.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 21:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iImKG-0003Rv-Vi
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 00:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iImK9-0003Rj-2X
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 00:14:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iImK6-0008Gl-R4
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 00:14:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iImK6-0008Fc-LG; Fri, 11 Oct 2019 00:14:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69ABB10CC1ED;
 Fri, 11 Oct 2019 04:14:37 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B83615C1B2;
 Fri, 11 Oct 2019 04:14:27 +0000 (UTC)
Date: Fri, 11 Oct 2019 01:14:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/8] hw: Convert various reset() handler to DeviceReset
Message-ID: <20191011041425.GJ4084@habkost.net>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 11 Oct 2019 04:14:37 +0000 (UTC)
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
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R4bZHdB/nBBB

Queueing on machine-next.  Thanks!

On Thu, Oct 10, 2019 at 03:15:19PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Only patch 3/8 is missing review:
> - hw/ide/piix: Convert reset handler to DeviceReset
>=20
> Since v2:
> - Fixed PIIX_IDE conversion (Li)
> - Added more R-b tag.
>=20
> Since v1:
> - Removed the pci-host devices
> - Removed the vmcoreinfo conversion (elmarco) but add a comment.
> - Added Igor's R-b tag.
>=20
> Following the thread discussion between Peter/Markus/Damien about
> reset handlers:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> I started to remove qemu_register_reset() calls from few qdevified
> devices (the trivial ones).
>=20
> Regards,
>=20
> Phil.
>=20
> v2: https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01677.html
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html
>=20
> Philippe Mathieu-Daud=E9 (8):
>   hw/acpi/piix4: Convert reset handler to DeviceReset
>   hw/isa/piix4: Convert reset handler to DeviceReset
>   hw/ide/piix: Convert reset handler to DeviceReset
>   hw/ide/sii3112: Convert reset handler to DeviceReset
>   hw/ide/via82c: Convert reset handler to DeviceReset
>   hw/isa/vt82c686: Convert reset handler to DeviceReset
>   hw/input/lm832x: Convert reset handler to DeviceReset
>   hw/misc/vmcoreinfo: Add comment about reset handler
>=20
>  hw/acpi/piix4.c      |  7 +++----
>  hw/ide/piix.c        |  9 ++++-----
>  hw/ide/sii3112.c     |  7 +++----
>  hw/ide/via.c         | 10 ++++------
>  hw/input/lm832x.c    | 12 +++++-------
>  hw/isa/piix4.c       |  7 +++----
>  hw/isa/vt82c686.c    | 11 ++++-------
>  hw/misc/vmcoreinfo.c |  4 ++++
>  8 files changed, 30 insertions(+), 37 deletions(-)
>=20
> --=20
> 2.21.0
>=20

--=20
Eduardo
