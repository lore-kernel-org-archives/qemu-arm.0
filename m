Received: by 10.28.173.206 with SMTP id w197csp2514975wme;
        Mon, 8 Jan 2018 06:11:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBot71AqLJdeaOuV/K0Hk6P4WqbsqSG5wPTT+acwAzy4PqGHue304+pyVs8K2W+Sf9ZFZbhGm
X-Received: by 10.37.126.4 with SMTP id z4mr15099ybc.310.1515420661442;
        Mon, 08 Jan 2018 06:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515420661; cv=none;
        d=google.com; s=arc-20160816;
        b=wMn+YXjULA1Pcj0fJP5uUfZ8vXtK0mFZNQqaGCznFgnt1G11cbMksi9jE438nPIaTE
         /hZQsTlstZT29LjEthqCtj8WYzEAfuyOQyIF8zntOo5GYqG6LHgph/vAKGMGCyu046Dt
         DDlbb5DbfI659burQRbx3KBv5xd1dZFudDNbZ7qXuZZcrg0jmj6ArtihgbacJjD63WRL
         ZPdZEaWMD8wLkzzemiviEoOds/s48bzyjYm1wbI5rSFXbPGBy+6Gdk2O05U7TWCH6pbK
         hcBztc7FRXlyJhtWuPp01XNJs+cVcIOt4TWWwdGwdSb4BkR6COpWD1oKAuw2Gbm9iVuB
         N7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=//E2Ld2CTLcQEnB5BI7wxHh2dyEmBjqrioi9EPBznf0=;
        b=qF/yJ/tPqumWoWKDrgPKiZ3U1c6bUdBIhMox07EOPKDgkfmTVEj5xJS3zFbZw8Vt79
         s1aj6EjzoEjTFgQAy3yq5I53g1BdW5Upkn9t1JYpr8zfXhySk8PsUO9ZaFHBs4URquDQ
         StBxbwXZvWxbhzWMRYRKCOQtpIE3ZgZx6hwN0tdMn128PpYK3CjlrWl71jx68KsTPitO
         338t3jwBa+XEkvFwyVqSpa31uCxJ28/E5zVojmtUKCjxcjALHmgK+sGluhrUY8WFrMkV
         4EVbpJld0k2DRIL927y9SSfpTvhwNnu9nektKtyIhPr/r+nSFGplH5vjZE3H9URk1iGi
         r4gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a3Wz4jAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n185si2557738ybn.152.2018.01.08.06.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 06:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a3Wz4jAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYY8i-0002st-RU
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 09:11:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYY8Z-0002sO-OM
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:10:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYY8V-0003gZ-Fw
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:10:51 -0500
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:43224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYY8V-0003g5-9F; Mon, 08 Jan 2018 09:10:47 -0500
Received: by mail-qt0-x233.google.com with SMTP id w10so13689446qtb.10;
	Mon, 08 Jan 2018 06:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=//E2Ld2CTLcQEnB5BI7wxHh2dyEmBjqrioi9EPBznf0=;
	b=a3Wz4jAMFDrYxoH1e2tFQaU7pYch/pEJpmtccCgj0Ljw+YPZ9M7DDXt/HkZKoe86KM
	CgfbZgvoe1eiZButiB/34jahNO0f6AVMsUHi9nUSpWxdO4hz3BMoAYkagW5pYMVTk3/6
	/QhZChbkT6tFsi9R5B0wafYYrPWzibl4PA7Kt83JyefPBNv5ltICKMwhO6Bf0SXF0gWZ
	hAApfwPPQtqnuPcyRg0D4Qp1W/0oEMh2mh2nCgZXcNcHbWiLXpqWrYYP4IvgUPt7ug+/
	U6DiZG16jKLQd1EaZgiqsVAJQ26mX1eVcBArmSm0tjWFgh827xfPur6ON5/q60l+nDNh
	cxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=//E2Ld2CTLcQEnB5BI7wxHh2dyEmBjqrioi9EPBznf0=;
	b=Pbtr9tsbxbYcOw5YSLSlPNcaX/tivEw+o9TkRY5f8A0KekSFpiE5wuTCBQBupC7fv3
	CjuxCWda2rdGAF4TDiA97iEgedn033Pns3ydKALWSmPxvf07DfhMZENxR4KpKTVvPu7E
	swgHQqJutFxK2OOaUSqu6tQ3zrmnV/3gjT2y7mX/H0Kg5pBlQXVcdC5WEzxzBvdoUqkr
	QhT9Ugw73bguPcm7hWHmKZ78+53BlGDPAQqSzOkmUUFQG/zj9FAv/LZkp78dwjasLg3d
	36V3KtD1UWttbhhbfzOIGGOcGg6HkCcJV0sd5TCcJabdDOdK6arHI5kkV1K4I5itFORW
	idwQ==
X-Gm-Message-State: AKwxyte7lca1CTnXfbd1Vub3a6BZ7omL2XsNNUUy2M6M299LGR/Fso3V
	D6dvcabkiQb0f2IF9G0n2HI=
X-Received: by 10.237.38.132 with SMTP id q4mr16557405qtd.192.1515420646601;
	Mon, 08 Jan 2018 06:10:46 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id u9sm1042560qku.85.2018.01.08.06.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 06:10:45 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104192203.GD3407@localhost.localdomain>
	<20180108135122.637e478a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <395b6cff-e4be-1aa9-48f6-82cdbd9633b9@amsat.org>
Date: Mon, 8 Jan 2018 11:10:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180108135122.637e478a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="dZsytMtnsZH8ATGxOKZhCx7crUVN01M66"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: Re: [Qemu-arm] [RFC PATCH 0/6] qom: introduce TypeInfo name aliases
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHlVaauCYHSS

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dZsytMtnsZH8ATGxOKZhCx7crUVN01M66
Content-Type: multipart/mixed; boundary="sPMbAPNCVtFErJn4XyWb04jPNcDrjLx74";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Markus Armbruster <armbru@redhat.com>,
 Sascha Silbe <silbe@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Fam Zheng <famz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <395b6cff-e4be-1aa9-48f6-82cdbd9633b9@amsat.org>
Subject: Re: [RFC PATCH 0/6] qom: introduce TypeInfo name aliases
References: <20180104144046.30793-1-f4bug@amsat.org>
 <20180104192203.GD3407@localhost.localdomain>
 <20180108135122.637e478a@redhat.com>
In-Reply-To: <20180108135122.637e478a@redhat.com>

--sPMbAPNCVtFErJn4XyWb04jPNcDrjLx74
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On 01/08/2018 09:51 AM, Igor Mammedov wrote:
[...]
> Though it seems easy and trivial, I'm a bit concerned about using
> QOM types for the task though.
> Also see commit 6acbe4c6f which labels aliases as a bad idea
> and says that they are there only for compatibility and shouldn't
> be used.
> So far I agree with that statement, because it introduces
> ambiguity in code used internally and more worrying is that
> this ambiguity will increase user visible ABI (think of '-device_add FO=
O_ALIAS')
> that we would need to maintain afterwards.
> It would be nice to have unified alias API, but I think it should
> be separate one and limited to the same scope (i.e. compat stuff),
> and even that won't be easy as different alias impl. we have now
> have a different needs.
>=20
> wrt this series targeted usage, I'd prefer that object_new/initialize
> would use real type names when creating devices as it does currently
>=20
> FDT linux guest specific names wouldn't seep into device model
> itself. Firmware (FDT or ACPI) should be separate from device
> implementation.

Good point.

> If really there is need to dynamically scan present devices
> and build FDT from result, then probably we should introduce
> interface that devices could implement if necessary.
> (I was thinking about such possibility for ACPI). But so far
> it looked to me as too much overhead for what we do now.

I see, I thought about something similar but TypeInfo.aliases was way
too simple to not try this series first.

What about adding a INTERFACE_FDT_DEVICE type (InterfaceInfo) and let
the FDT devices implement something such:

typedef struct {
    /*< private >*/
    InterfaceClass parent_class;
    DeviceClass parent_class;
    /*< public >*/
    bool (*is_alias)(FDTDeviceIf *dev, const char *name);
    bool (*set_prop...)(FDTDeviceIf *dev, const char *property, ...);
    const void *(*get_prop)(FDTDeviceIf *dev, const char *property);
};

Regards,

Phil.


--sPMbAPNCVtFErJn4XyWb04jPNcDrjLx74--

--dZsytMtnsZH8ATGxOKZhCx7crUVN01M66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpTe90ACgkQ4+MsLN6t
wN5P2w//XjDzG8Twarkl//admIQI6M4zmr13Dw0/4Vo63Tlh8n5RW5zoSQy4X6mg
1kvOYyfN/BOf6fr7gBs72iPfcrz29XQrPWzcE3WCFpnjtnQsLj/TQ6Rx/HA8/nJK
oNFk6rhUPTzW9j+7C5Vt4gCzM6dB6przehX5PY9cxvtVSxRdsd2AgoeO4XxnhAli
nnrwYTW/dOqLVJuB0PSd/si6+VsTkJ73AOo3WtesjRG6xEM0HTTEw1QgpzsN0kdX
3B8HN3dL8fp2pzj4L6bTbL7IW4hvblwV/nmnjWtAN29ZA1DYJOfKj9BBsGzpn+zG
5hmxsULsddulF8V7XAdTMJWipuIr6ncIJ91ZRTqpoDLFK/MaAsOfvRbgo83cLcCH
A2te74Sb0uD8vS1UgXm2dQfOrJnFotuThugrvzuOqfWl79fi7OMVec5+fYwixC9R
51Iircw30Fi4KABb7Ffu4CSVs4dWuf5smvrwUvfQdM3Ix3OUpNTghuxn7mUVYoN9
WJmFzKIV2p0+a3C20L7aGZ8d2bEjhQSpPkn407R4lI4YROQ6TIwVApMsC5HsBvXn
XTDkRsCXZNyveHuwG5+ZjP+ECSc6Eq6qxEvWvXqcw7Xt+KPBaGbmRLzT0JiM8lK9
GQQYCTwQx6JwpuoSvCpggQ54ea/exqNHddbD4GAJZ6RHd2BphCc=
=C3GQ
-----END PGP SIGNATURE-----

--dZsytMtnsZH8ATGxOKZhCx7crUVN01M66--
