Received: by 10.25.21.96 with SMTP id l93csp368349lfi;
        Thu, 16 Jun 2016 08:20:12 -0700 (PDT)
X-Received: by 10.140.34.133 with SMTP id l5mr5309314qgl.28.1466090412826;
        Thu, 16 Jun 2016 08:20:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k207si26875849qke.94.2016.06.16.08.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 08:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDZ5Y-0004Gz-3V
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 11:20:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bDYO6-0008Vp-Cn
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 10:35:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bDYO3-0007fu-1g
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 10:35:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bDYO2-0007fl-OT; Thu, 16 Jun 2016 10:35:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACFAA693F2;
	Thu, 16 Jun 2016 14:35:12 +0000 (UTC)
Received: from [10.3.116.194] (ovpn-116-194.phx2.redhat.com [10.3.116.194])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5GEZ6PA003642; Thu, 16 Jun 2016 10:35:07 -0400
To: Markus Armbruster <armbru@redhat.com>
References: <1463784024-17242-1-git-send-email-eblake@redhat.com>
	<1463784024-17242-12-git-send-email-eblake@redhat.com>
	<87porh46n3.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <5762B91A.2070002@redhat.com>
Date: Thu, 16 Jun 2016 08:35:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87porh46n3.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vDwiQ2hAeQ6mltoJVhKrjVpJMtnu63F2K"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 16 Jun 2016 14:35:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 11/15] qapi: Change Netdev
 into a flat union
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Fleytman <dmitry@daynix.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexander Graf <agraf@suse.de>, Scott Feldman <sfeldma@gmail.com>,
	=?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <DirtY.iCE.hu@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Musicpal" <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Scott Wood <scottwood@freescale.com>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	David Gibson <david@gibson.dropbear.id.au>,
	Michael Walle <michael@walle.cc>,
	"open list:ppce500" <qemu-ppc@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	"open list:X86" <xen-devel@lists.xensource.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: szRi4rKuPx0n

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vDwiQ2hAeQ6mltoJVhKrjVpJMtnu63F2K
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/16/2016 07:15 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
>=20
>> From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>
>>
>> Except qapi-schema.json, this patch was generated by:
>>
>> find . -name .git -prune -o -type f \! -name '*~' -print0 | \
>>   xargs -0 sed -i \
>>     -e 's/NetClientOptionsKind/NetClientDriver/g' \
>>     -e 's/NET_CLIENT_OPTIONS_KIND_/NET_CLIENT_DRIVER_/g' \
>>     -e 's/netdev->opts/netdev/g'
>=20
> Uh, this is prone to descend into build trees and edit random crap.  I
> used
>=20
>     $ sed -i -e ... `git-ls-tree -r HEAD | awk '$2 =3D=3D "blob" { prin=
t $4 }'`
>=20
> to verify this commit.  Differences noted inline.
>=20

> I additionally get:
>=20
>   diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
>   index 692283f..825f0ba 100644
>   --- a/hw/net/e1000e.c
>   +++ b/hw/net/e1000e.c
>   @@ -226,7 +226,7 @@ e1000e_set_link_status(NetClientState *nc)
>    }
>=20
>    static NetClientInfo net_e1000e_info =3D {
>   -    .type =3D NET_CLIENT_OPTIONS_KIND_NIC,
>   +    .type =3D NET_CLIENT_DRIVER_NIC,
>        .size =3D sizeof(NICState),
>        .can_receive =3D e1000e_nc_can_receive,
>        .receive =3D e1000e_nc_receive,
>=20
> Rebase needed?

Unfortunately yes. This patch has been under a LOT of churn since it was
first written; it may be better to just redo it from scratch and claim
ownership myself, since it hardly resembles Zolt=C3=A1n's original submis=
sion
(but of course, give him credit for the idea).

>=20
>> index f8a500f..89a149b 100644
>> --- a/net/dump.c
>> +++ b/net/dump.c
>> @@ -172,7 +172,7 @@ static void dumpclient_cleanup(NetClientState *nc)=

>>  }
>>
>>  static NetClientInfo net_dump_info =3D {
>> -    .type =3D NET_CLIENT_OPTIONS_KIND_DUMP,
>> +    .type =3D NET_CLIENT_DRIVER_DUMP,
>>      .size =3D sizeof(DumpNetClient),
>>      .receive =3D dumpclient_receive,
>>      .receive_iov =3D dumpclient_receive_iov,
>> @@ -189,8 +189,8 @@ int net_init_dump(const Netdev *netdev, const char=
 *name,
>>      NetClientState *nc;
>>      DumpNetClient *dnc;
>>
>> -    assert(netdev->opts->type =3D=3D NET_CLIENT_OPTIONS_KIND_DUMP);
>> -    dump =3D netdev->opts->u.dump.data;
>> +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_DUMP);
>> +    dump =3D &netdev->u.dump;
>=20
> sed turns this into
>=20
>        dump =3D netdev->u.dump.data;
>=20
> Is this part of the manual changes?  More of the same below.
>=20

The original sed script is so distant from the actual changes that it's
not worth mentioning the sed script in the commit message any more.

>>
>>      assert(peer);
>>
>=20
> Another possible case of "rebase needed":
>=20
>   diff --git a/net/filter.c b/net/filter.c
>   index 8ac79f3..888fe6d 100644
>   --- a/net/filter.c
>   +++ b/net/filter.c
>   @@ -201,7 +201,7 @@ static void netfilter_complete(UserCreatable *uc,=
 Error **errp)
>        }
>=20
>        queues =3D qemu_find_net_clients_except(nf->netdev_id, ncs,
>   -                                          NET_CLIENT_OPTIONS_KIND_NI=
C,
>   +                                          NET_CLIENT_DRIVER_NIC,
>                                              MAX_QUEUE_NUM);

Yep.  Thanks for researching.

>>
>>  static int net_client_init1(const void *object, int is_netdev, Error =
**errp)
>>  {
>=20
> Multiple differences in this function.  Manual?

Yes.


>> @@ -47,7 +47,7 @@ static void vhost_user_stop(int queues, NetClientSta=
te *ncs[])
>>      int i;
>>
>>      for (i =3D 0; i < queues; i++) {
>> -        assert (ncs[i]->info->type =3D=3D NET_CLIENT_OPTIONS_KIND_VHO=
ST_USER);
>> +        assert(ncs[i]->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER=
);
>=20
> Manual whitespace cleanup.  Okay.
>=20

And necessary to shut up checkpatch.  I really get to rewrite the commit
message to something better for v8, don't I.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--vDwiQ2hAeQ6mltoJVhKrjVpJMtnu63F2K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXYrkaAAoJEKeha0olJ0Nq+zgIAKt6xW2Ym0b4Kyvae7OPio/t
sxGSM5OeVVPYE+xciFt64Agdb2OXF4qbzZ+EMr/h7cVqcHs/QaHqZa5/fv1uWEcM
F3e5adA9vdqGYtbO/4StYv8rdC4p8Dr2REvXhULtwCxzPYltT78N0Fokb3pn7nR8
dPl8VjDEh7hdtt1qXyGghP0aOvxpPjhcExtWHg1p3QLpAAvqyERBxh8LGzvgrTdT
ddJU0gK3QAuXAFsr7wx26uMPTf5ssR+H7IoNajXDkZDhyozfLmllNikPfKdtTPVU
wnkycHH+7yOoegy1UyjK8aef+w7YxQf4Dmxcw/55is0tAQrunO+quqjqIhbVEWQ=
=3UVR
-----END PGP SIGNATURE-----

--vDwiQ2hAeQ6mltoJVhKrjVpJMtnu63F2K--
