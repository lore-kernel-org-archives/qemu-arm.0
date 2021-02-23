Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp174673lfg;
        Tue, 23 Feb 2021 02:38:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7Nl23XoVtr/2dmaUOLE0YztEyaRI0b6CWIS6YmKgqOi4ltIpKCs4UZdvQLpAzyvrPA180
X-Received: by 2002:a6b:7501:: with SMTP id l1mr18739381ioh.92.1614076686409;
        Tue, 23 Feb 2021 02:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614076686; cv=none;
        d=google.com; s=arc-20160816;
        b=KoQF8jGdCVjpn4tRziOvhR80/h6Edmc4u+pEnkWsvmXG3FaltXe64413m2AED+lCn6
         r2/we443BhXZzQwZI76CEzMbmsL9sd8wn6LO08sec0WpjwJRjok48IrpErruUjpQbP1g
         R87fRibuMKv/A/7RcSdbHIjWLgaX4GF1GGNl9MmtJwqct5eGXm/qb8Dn6LBmalDpzwCm
         Ruq164NQ3KTjUfcof2bk4NVkqKQcZ0pYXYw/YmotWTx2sV1d/E4gzHYNycyAbHV9CwPC
         j+OuvPbTOBPEILIKO/FgA/X0RMbabhHh9HEaU96bbF7sZFWMJUIJdYYrsQC+GpSFhF7b
         TpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:organization
         :references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=bIGzZAHT2IrR97nIWaOZh13hqXqdEEn4ZaBsZNS2Jg0=;
        b=SsT4sUOTG6S2TBLAbVp8TfcTtQX4gsjbfbdxGejkgHtupl1Qr/C2bXp6llb9JCy7IJ
         UBUi6+QXlYqjrS70VNMzoPC19J7b4J7S0At1hGLi1FOe6Dkrfr73TtqHLVfABgYAtoGW
         ymXC63IAhYy42TeOEYB5eeERrdv5/S5ZycG+hrDAcrCwBejmGsGSuk2/9KnDmZjMk0yv
         799iDtuNZUSH25mODrDjwWGHWu4To2moTpZu1qSOe2pO9q/tJb1uqjCpgocBS0s334sA
         OjfU0FB/w6JJ5I3s6Gy0LEpINQddvtoY35tY/8W3b4Vv2TL4/dNpK3SmTpk1zfeio0eG
         9PiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J6PnBuiK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si11734692jaj.103.2021.02.23.02.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 02:38:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J6PnBuiK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEV4v-0001oO-KE
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 05:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEV48-0001Ji-KQ
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 05:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEV42-0007er-AY
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 05:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614076629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bIGzZAHT2IrR97nIWaOZh13hqXqdEEn4ZaBsZNS2Jg0=;
 b=J6PnBuiKkW/YTxfT+AINq+01CW5t7EDYkUuLv7e5UeUU2tmWWjquDngrcbE1RDJ78w7a8B
 qgKmaJe6kyJ8dPg7R17ruJA1kMulP+jl8sKJ7Erb1Z6SNwSbhGbw62b1MxX31RRWmsHa8O
 JRk3DemwHb24p+lQyjFKI4N6X7Pv9Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-QvMczwhUMS6WpidU3ya6Pg-1; Tue, 23 Feb 2021 05:37:06 -0500
X-MC-Unique: QvMczwhUMS6WpidU3ya6Pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6226801986;
 Tue, 23 Feb 2021 10:37:01 +0000 (UTC)
Received: from gondolin (ovpn-113-126.ams2.redhat.com [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59045D9D0;
 Tue, 23 Feb 2021 10:36:47 +0000 (UTC)
Date: Tue, 23 Feb 2021 11:36:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type()
 return value
Message-ID: <20210223113634.6626c8f8.cohuck@redhat.com>
In-Reply-To: <YDRAHW1ds1eh0Lav@yekko.fritz.box>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
 <YDQ/Y1KozPSyNGjo@yekko.fritz.box>
 <YDRAHW1ds1eh0Lav@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nudo1.j=xV83/2pyII4Lt07";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMf30ovz11an

--Sig_/nudo1.j=xV83/2pyII4Lt07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Feb 2021 10:37:01 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
> > On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote: =20
> > > On Mon, 22 Feb 2021 18:41:07 +0100
> > > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> > >  =20
> > > > On 2/22/21 6:24 PM, Cornelia Huck wrote: =20
> > > > > On Fri, 19 Feb 2021 18:38:37 +0100
> > > > > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> > > > >    =20
> > > > >> MachineClass::kvm_type() can return -1 on failure.
> > > > >> Document it, and add a check in kvm_init().
> > > > >>
> > > > >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > > >> ---
> > > > >>  include/hw/boards.h | 3 ++-
> > > > >>  accel/kvm/kvm-all.c | 6 ++++++
> > > > >>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > > >> index a46dfe5d1a6..68d3d10f6b0 100644
> > > > >> --- a/include/hw/boards.h
> > > > >> +++ b/include/hw/boards.h
> > > > >> @@ -127,7 +127,8 @@ typedef struct {
> > > > >>   *    implement and a stub device is required.
> > > > >>   * @kvm_type:
> > > > >>   *    Return the type of KVM corresponding to the kvm-type stri=
ng option or
> > > > >> - *    computed based on other criteria such as the host kernel =
capabilities.
> > > > >> + *    computed based on other criteria such as the host kernel =
capabilities
> > > > >> + *    (which can't be negative), or -1 on error.
> > > > >>   * @numa_mem_supported:
> > > > >>   *    true if '--numa node.mem' option is supported and false o=
therwise
> > > > >>   * @smp_parse:
> > > > >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > > >> index 84c943fcdb2..b069938d881 100644
> > > > >> --- a/accel/kvm/kvm-all.c
> > > > >> +++ b/accel/kvm/kvm-all.c
> > > > >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> > > > >>                                                              "kv=
m-type",
> > > > >>                                                              &er=
ror_abort);
> > > > >>          type =3D mc->kvm_type(ms, kvm_type);
> > > > >> +        if (type < 0) {
> > > > >> +            ret =3D -EINVAL;
> > > > >> +            fprintf(stderr, "Failed to detect kvm-type for mach=
ine '%s'\n",
> > > > >> +                    mc->name);
> > > > >> +            goto err;
> > > > >> +        }
> > > > >>      }
> > > > >> =20
> > > > >>      do {   =20
> > > > >=20
> > > > > No objection to this patch; but I'm wondering why some non-pseries
> > > > > machines implement the kvm_type callback, when I see the kvm-type
> > > > > property only for pseries? Am I holding my git grep wrong?   =20
> > > >=20
> > > > Can it be what David commented here?
> > > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
> > > >  =20
> > >=20
> > > Ok, I might be confused about the other ppc machines; but I'm wonderi=
ng
> > > about the kvm_type callback for mips and arm/virt. Maybe I'm just
> > > confused by the whole mechanism? =20
> >=20
> > For ppc at least, not sure about in general, pseries is the only
> > machine type that can possibly work under more than one KVM flavour
> > (HV or PR).  So, it's the only one where it's actually useful to be
> > able to configure this. =20
>=20
> Wait... I'm not sure that's true.  At least theoretically, some of the
> Book3E platforms could work with either PR or the Book3E specific
> KVM.  Not sure if KVM PR supports all the BookE instructions it would
> need to in practice.
>=20
> Possibly pseries is just the platform where there's been enough people
> interested in setting the KVM flavour so far.

If I'm not utterly confused by the code, it seems the pseries machines
are the only ones where you can actually get to an invocation of
->kvm_type(): You need to have a 'kvm-type' machine property, and
AFAICS only the pseries machine has that.

(Or is something hiding behind some macro magic?)

--Sig_/nudo1.j=xV83/2pyII4Lt07
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAmA02rMACgkQ3s9rk8bw
L69Sng//SPiU5hi/9Db125/S0xZG5O8UzQoag2vh8Q68aGY9pmkB5pUsF5xCYvq4
v3GT9vtpCT+urKHCNhQcPD0nLLumzQxaz3GKTHvqOWkOwGI3HJhCg9HAutC4d77k
pAQpFCiDaxRw98uRREJDiG1tM9xzhU/qb1Ujs90aYALeZ3B4wmQQTRVXTiZjto++
PqJyNULu02yA4sFyZy+iCvv8dT8Ex2uyxV0JzeNS9RV4xsOGH8jMqElRPJiioJhf
20o5RAL+tpkM71Z1OMj3mBfrdui2K6ordXZKs7OoIkrjb01l/oZXSvVSjxzbKOTn
LKQYKIZ2/0SHH1IIxovfDJYm/1iV0JHmmW7klM2U1OSmMlZx0TsRmZ6ArWAE6/7z
CJhC/PpeE8bX9fRuXzAwuBRbT3Cgp6XurESExT1BDWMF3Gym3FaiIz2FHyVnvlPR
yFcVjR7pgAKWSRI1/EddICKWb2paYhSpzZ9QjbhOISelEslzJU57WQIAUjVPnSho
lrgY/XuKSJA+ZnRQdY3LX5IADVpA0rn7W2nW0JkJN0nJn4dw3P6Ikp14W1qUC8UR
AcsnC9Xqbj9D+xRgf1yoCBez7D9kthUXY226A3DYJJcp0qfsquXw0+cxN71CqPhb
dcvq0J1IEjbx4ir/qN2R8hxfCm3vwXG+w/3ZhKx69rUI5w4PA8Q=
=u9hO
-----END PGP SIGNATURE-----

--Sig_/nudo1.j=xV83/2pyII4Lt07--

