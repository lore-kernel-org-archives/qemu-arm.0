Received: by 10.28.91.67 with SMTP id p64csp3867844wmb;
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuDxZMfeXK+rXigaLJQ4k+h2yl/qTym9jsebCeyKRWxrXlcIiepOku9bzT5iR4KUjMiIClr
X-Received: by 10.55.160.139 with SMTP id j133mr24139100qke.18.1521554370456;
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521554370; cv=none;
        d=google.com; s=arc-20160816;
        b=xDKk1sCLfFZ73q02vZtPAXAnq4XooZI0YeG+hDHMUiWp7GAyMunK9k6FaYlJT9zfpU
         F5La82Y7i0xkwcGaGrQa6A2EpUtOj64G6uLsqPVp9XRNuFltziYv2egcg1tm1CCJB+hh
         q16Gk0/3uUIkp54KxsTGGDqHyxykGhiiGra2ygiHOkgQxRiLxknsw1bqWfPbER5Jpzie
         2mmoQSdIlKTo/zxKQuEyfl0F899E/xszZiOt0WvCU4ElPTUr+F36prXhzxqWNUutDKmz
         3RnzTaBif2p9tXPiSyhLaKsZd3me8ixQP6R6yK5DdGcFqm/Q/tu1ZIdUIFn9GuHoxd+Z
         Zuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=uR/UiuC3pMFoxPmM27UZEaQz/ocFq/BzUzMkQEVj9Zc=;
        b=o//np5XB/tbTp+kmQ3ALe2kp/6PuTNjgXHTeq49Migs/Jo0zIjq2cVRauUozxFF10T
         9axoQnq85AUf76P3x8JlU8yrXbwePXdJCrIEN4zteXK7wU7uPz7RcBzOQXrmNCgNeUg1
         tQUtJM0rHiA9VMFXZss3Gp9dqtiWuSVJ8Os3ksjGkNdfUsMGYxpoz55AoLX0ZDJjhIuG
         Rsw7zFwu0hu1L9o6bCnkRZ72Nb3MnwgMm9cttbo4lwheA6TGdcmq26/afZ2BHOHQe1RP
         Drhn8g+CP9Rjrezw23KUcGtG1K52a7hIdnTXJlzDflGrN6tSSZngd8oZobsutnyR0A+4
         2WEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r184si349347qkc.380.2018.03.20.06.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHnV-0006ZE-Qw
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:59:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1eyHj7-0004sd-3n
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1eyHj3-0004J5-UU
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:54:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40980 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1eyHj3-0004It-OT; Tue, 20 Mar 2018 09:54:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AB4C40267D7;
	Tue, 20 Mar 2018 13:54:52 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-248.ams2.redhat.com
	[10.36.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D7D82166BDA;
	Tue, 20 Mar 2018 13:54:39 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
	<20180320123900.GO4530@redhat.com>
	<20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
	<20180320134117.GS4530@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
Date: Tue, 20 Mar 2018 14:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320134117.GS4530@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3bVcvjt7gGf3BwAy0eGre8GNjlP4mR8zE"
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 13:54:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 13:54:53 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mreitz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:59:16 -0400
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVz/NqlMyetm

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3bVcvjt7gGf3BwAy0eGre8GNjlP4mR8zE
Content-Type: multipart/mixed; boundary="4gOSWLc8jSeDKOBpdGY3ouMP1Tras99J8";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jeff Cody <jcody@redhat.com>, Fam Zheng <famz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Josh Durgin <jdurgin@redhat.com>,
 Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
 Liu Yuan <namei.unix@gmail.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Ben Warren <ben@skyportsystems.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
 Michael Walle <michael@walle.cc>, Keith Busch <keith.busch@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Fabien Chouteau <chouteau@adacore.com>, Amit Shah <amit@kernel.org>,
 Marcel Apfelbaum <marcel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Alexander Graf <agraf@suse.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Yuval Shaia <yuval.shaia@oracle.com>, David Hildenbrand <david@redhat.com>,
 Hannes Reinecke <hare@suse.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth
 <mdroth@linux.vnet.ibm.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Riku Voipio <riku.voipio@iki.fi>, Zhang Chen <zhangckid@gmail.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Message-ID: <8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and not ""
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <20180320134117.GS4530@redhat.com>
In-Reply-To: <20180320134117.GS4530@redhat.com>

--4gOSWLc8jSeDKOBpdGY3ouMP1Tras99J8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2018-03-20 14:41, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Mar 20, 2018 at 02:32:16PM +0100, Gerd Hoffmann wrote:
>>   Hi,
>>
>>>> So for these, we should use "".  None of these are generated files t=
hough.
>>>
>>> That leads to crazy inconsistent message for developers where 50% of =
QEMU
>>> header files must use <> and the other 50% of header files must use "=
".
>>
>> The rules are pretty simple though:
>>
>>    (1) Headers which are generated use <>.
>>    (2) Headers which are in include/ use <>.
>>    (3) Headers sitting in the same directory as the source files use "=
".
>=20
> We have 1200 header files in QEMU - a developer might just reasonably r=
emember
> which header file is a QEMU header, vs which is a 3rd party system head=
er.
> Expecting devs to remember which of those 3 buckets each QEMU header fa=
lls
> under is unreasonable IMHO.=20

I agree with this in principle, but I don't find it unreasonable for
someone to look up whether a header file exists in the same directory.
I find that much simpler than to look up whether it is a system header,
actually.

And I have to agree with Michael that his rule when to use "" (if the
file is in the same directory) and when to use <> (otherwise) is
actually what every C developer might do by instinct.  (I guess it's
also easier to check in a script than the original guideline?)

However, I also think that if any problem arises because "" was used for
a generated file and that then uses a stale file, the bug is somewhere
else.  And I think that while Michael's proposal is the more intuitive
(C) way, it is a tiny bit more complicated to explain than 'Use "" for
qemu headers, <> for everything else'.

But I guess the main advantage with using this rule I see is that it's
better for people reading the code.  It's just nice to know whether a
file belongs to qemu or not by just looking at the #include statement.
(Note that this implies that it is indeed more difficult to determine
whether a header belongs to qemu than whether it sits in the same
directory as the C file, though!)  So I think the old (current) rule is
better for reading code, Michael's rule would be better for writing
code.  I think reading code is what should be easier.

But since that may be eaten up by build breakages due to stale files, I
don't have a strong opinion either way.  I just wanted to chime in
because in my opinion 'Use "" for headers in the same directory, <> for
everything else' is by no means an unreasonably complicated rule for
people writing code.

Max


--4gOSWLc8jSeDKOBpdGY3ouMP1Tras99J8--

--3bVcvjt7gGf3BwAy0eGre8GNjlP4mR8zE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlqxEp0SHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9AJsUIAJd2GeUBJFTYmeKR5uxkvBIkRHGgRyAm
H76Sk1MnAhHTVPGKLoMDwweaSnCz+XAFo3P3YJJbFSNvaWUd3ZN8roiyOlPtYnNY
6cBk9GrLnzWW8VYmEkCP4xmA0Hkowm+IKD374TBqc17h3Fzxs1obPQJxhJ8xKpvH
dc10DJ6la/R+dyQAe8lTVBg5zXh44Q2zoslSvLVVE1PDcWlo+fIHai7eB5kzYyu3
jSKqdAoJvDD7d/FRndl37+Yb6AcbgUZP3U/7ntRE7Omk471b7FcoqN03GtlY0Unk
hxi0sjM6SAsgGtjEm0Jiqypwlq+luCn5ekS1JI7U+/4Lo2KC5EOLD6o=
=wiAH
-----END PGP SIGNATURE-----

--3bVcvjt7gGf3BwAy0eGre8GNjlP4mR8zE--
