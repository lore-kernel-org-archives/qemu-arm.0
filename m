Received: by 10.25.205.13 with SMTP id d13csp3309719lfg;
        Wed, 21 Dec 2016 10:08:52 -0800 (PST)
X-Received: by 10.55.123.133 with SMTP id w127mr5853149qkc.298.1482343732320;
        Wed, 21 Dec 2016 10:08:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v80si5714659qkv.311.2016.12.21.10.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 10:08:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJlJp-0001ST-NH
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 13:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cJlJh-0001S6-6F
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 13:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cJlJc-0002bl-5L
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 13:08:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cJlJb-0002bL-VE; Wed, 21 Dec 2016 13:08:36 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21CC74ACCF;
	Wed, 21 Dec 2016 18:08:34 +0000 (UTC)
Received: from [10.36.116.39] (ovpn-116-39.ams2.redhat.com [10.36.116.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBLI8U8l003912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Dec 2016 13:08:31 -0500
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20161201170624.26496-1-lersek@redhat.com>
	<148227487620.73.10055858460424473693@790289a7ca88>
	<20161221152226.GH3808@thinpad.lan.raisama.net>
	<70b42a58-381d-7011-7eef-2120af178f91@redhat.com>
	<20161221180155.GI3808@thinpad.lan.raisama.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e45bb195-578f-6afc-8617-f75e7775193e@redhat.com>
Date: Wed, 21 Dec 2016 19:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161221180155.GI3808@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 21 Dec 2016 18:08:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] checkpatch.pl false positive (was Re: [PATCH v4 0/7]
 q35: add negotiable broadcast SMI)
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	michael@walle.cc, qemu-arm@nongnu.org, kraxel@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fo7wvb1ZYVao



On 21/12/2016 19:01, Eduardo Habkost wrote:
> The following code replaces the whole "{ .driver =3D ... }" block
> with "1":
>=20
> 	# Flatten any parentheses and braces
> 	while ($dstat =3D~ s/\([^\(\)]*\)/1/ ||
> 	       $dstat =3D~ s/\{[^\{\}]*\}/1/ ||
> 	       $dstat =3D~ s/\[[^\{\}]*\]/1/)
> 	{
> 	}

Maybe change it like

- 	       $dstat =3D~ s/\{[^\{\}]*\}/1/ ||
+ 	       $dstat =3D~ s/\{[^\{\}]*;[^\{\}]*\}/1;/ ||

so that it requires a statement?  It would have a false positive on
strings containing a semicolon, but that's not a big deal (or could be
fixed by similarly turning strings into just "").

Paolo

> The following change fixes the bug, but I don't know if it has
> unwanted side-effects:
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f084542..0aab3ac 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2200,6 +2200,10 @@ sub process {
>                         $dstat =3D~ s/^\s*//s;
>                         $dstat =3D~ s/\s*$//s;
> =20
> +                       # remove braces that cover the whole block, if =
any:
> +                       $dstat =3D~ s/^\{//;
> +                       $dstat =3D~ s/\}$//;
> +
>                         # Flatten any parentheses and braces
>                         while ($dstat =3D~ s/\([^\(\)]*\)/1/ ||
>                                $dstat =3D~ s/\{[^\{\}]*\}/1/ ||


Paolo
