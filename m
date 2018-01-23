Received: by 10.28.71.27 with SMTP id u27csp4151747wma;
        Tue, 23 Jan 2018 07:04:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224DZKYXKrYjgibBmQ2x8CBwt/203KxU/3WnLpg8D9+vHNMMAVo9ftLjqC3zvLn26KeLERbA
X-Received: by 10.37.9.5 with SMTP id 5mr2814260ybj.101.1516719885071;
        Tue, 23 Jan 2018 07:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516719885; cv=none;
        d=google.com; s=arc-20160816;
        b=nDJkEcQ8S91QA+VGBBbNyy6f6Ee66RFVXxvZ0XBzGCUIWvn80izWxUwoR9/y7Ew17/
         1uUG39GGzuQctdC5IArnruH72EepncKD8ofgojS4WqQf0QPhJ2N3Ed8dmY43T13GhkDm
         en7fyXdLX2d2qa4Emodl5kns+yWgb2o8wU2ffphpk9xiCnqQNA4CXiVECpV9hPfaDBfy
         bmATdzKKMNx3r8f/ZYcFyQBBKTpNJVGrR8Vz13zmcnIEZe1K65ud67QCIO5zU3Mc+krR
         aItE158ena5Wet6ArmqyUFRBEq3gUlq7v/V9FMprWNu6b6AzJP/kDGzapouwXxvMGXk1
         quhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=Jx/ZruFUhmbZu3oqc072UB3YNLqKKpF/7+vV75GRDVY=;
        b=FW2NuoCvZMtyu2O4BP4AqLLoTdXA+Ydj2CafF4UKzM52IG6oB8qtR/Mv9sPjuAfRJY
         QOp1a2zy/vafDrCZPeeyp8mVn0Ua8eH3N4wWNwKIufqEdwZ9zOZWhm0V7TnCT+r2fN8S
         z4AJ9nTTYtEkvSGbE22KVNy063auDP1SSz9TA7aPIG2nh2ImonCdmyCERfIOZHS27nI0
         TMd1Dn8isbjEzAvChFhn+VSN+966hD66JebIYUDTYjkczP1oZV0FRE9L14z3bq1/LpCs
         rIT/ptBe3mAEPp7bisFA2KYCxgxC4P6yBRcYHVN1IQrWlI1Ar/UgVZiNzOT6EFXmWCP2
         pdRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9tfyG8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k17si824613ybd.704.2018.01.23.07.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d9tfyG8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee07s-0004B3-Jo
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:04:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee07B-0003nk-DD
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:03:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee077-0000UM-El
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:03:57 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:43566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee077-0000Tq-9F
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:03:53 -0500
Received: by mail-qt0-x230.google.com with SMTP id s3so1960196qtb.10
	for <qemu-arm@nongnu.org>; Tue, 23 Jan 2018 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Jx/ZruFUhmbZu3oqc072UB3YNLqKKpF/7+vV75GRDVY=;
	b=d9tfyG8HSzrY7lpDeiVthKVuAsPCoEzha0/qnB0p2lpCUvxzRbFI1tEMgHYiilAD+h
	TsSfvunHpWirvUd+wLAqbBmGZ6iKBmd5RoxRg4OlxQsqH07eJrhZ6g8KQ0LroNN6OPoW
	ydeVNp4FAQ5PdKMrq29Oe0bHZQRSAMTD32els/8KgardDDx499s88j2rPUg2d/+XSSo9
	fWEkEUjZk7xmGyqAHec/MehZDVRUhbXHPOPbhh5aEp2jElv2ATj+NwN7ZYs0uztgXkQt
	3mRR/hR9prE6brmZwF9cbnhWcWrJhfxOZvk6udROafkw3Sro+AvI58zAY/KRvgnFfdZo
	xGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Jx/ZruFUhmbZu3oqc072UB3YNLqKKpF/7+vV75GRDVY=;
	b=qD3tIRpt0Z/9sqKPx5UG6zBqoXFt+UHBqPye6C1/b+wW3vg39JA+Y9/l03NWYYdYwD
	b3014Jhrkg1LHV0iSzLGFY+UT8I4J8E4RUiHyVPP6wCmbF/GpJuVntYP1OY7c8Rigihs
	ztcFxNeHXetAvcfy6LvisG3FW/+USUqEBc9yni2yeBpfxezXbMdPkGPNOEXg5CZYmaf/
	vl0eitR5cGBICGHwyPcqwzuRvNlQjk/pF5GiInGuwtVdpWFgn7MvTGn3ot2d3VP4afTQ
	f2c8FlvAqnM9QY6ZDcEZNXsm84ThWeaRYs7Hr4ic5kBxy0Xy9NkXJHM2XMq6CIfbuySA
	HvLg==
X-Gm-Message-State: AKwxytdQmheFMPOaiAliQqmngZL5bozQ16fzpzlM81XKIJT60rJfbGaS
	3K3Uldo5leS3e3dYLDS6BHM=
X-Received: by 10.55.78.149 with SMTP id c143mr3844268qkb.30.1516719832606;
	Tue, 23 Jan 2018 07:03:52 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	l189sm3667821qkc.54.2018.01.23.07.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 07:03:51 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
	<2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <626a7de1-2f95-a7e2-2f2b-94606f5ec176@amsat.org>
Date: Tue, 23 Jan 2018 12:03:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="dx8mKSHguxrOswy1DbpMKYle4bZndDVHq"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: Re: [Qemu-arm] recvfrom error with linux-user emulating armhf on
 aarch64
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7G4O7WxhZGx

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dx8mKSHguxrOswy1DbpMKYle4bZndDVHq
Content-Type: multipart/mixed; boundary="He7KeAy13pYFoBm2QNChK1fZJLxD9dm14";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Message-ID: <626a7de1-2f95-a7e2-2f2b-94606f5ec176@amsat.org>
Subject: Re: [Qemu-arm] recvfrom error with linux-user emulating armhf on
 aarch64
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
 <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
In-Reply-To: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>

--He7KeAy13pYFoBm2QNChK1fZJLxD9dm14
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Guido,

On 01/23/2018 11:42 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Guido, Laurent,
>=20
> On 01/23/2018 09:05 AM, Guido G=C3=BCnther wrote:
>> Hi,
>> Running the attached program=E2=81=B0 in a armhf chroot on a arm64 hos=
t=C2=B9 like:
>>
>>     chroot . /usr/bin/qemu-arm-static tmp/nl-bad-addr
>>
>> fails with "Bad address" when invoking audit_log_acct_message. strace =
looks like:
>>
>>   [..snip..]
>>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) =3D 3
>>   ...
>>   31572 sendto(3, {{len=3D124, type=3D0x454 /* NLMSG_??? */, flags=3DN=
LM_F_REQUEST|NLM_F_ACK, seq=3D1, pid=3D0}, "op=3Dtest:message acct=3D\"?\=
" exe=3D\"/tmp/nl-bad-addr\" hostname=3Dlocalhost addr=3D? terminal=3D/de=
v/pts/2 res=3Dsuccess\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) =3D 124
>=20
> the do_sendto() seems to correctly handle the u64 target_addr
>=20
>>   31572 ppoll([{fd=3D3, events=3DPOLLIN}], 1, {tv_sec=3D0, tv_nsec=3D5=
00000000}, NULL, 0) =3D 1 ([{fd=3D3, revents=3DPOLLIN}], left {tv_sec=3D0=
, tv_nsec=3D499993180})
>>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa=
3897e0, 0x42) =3D -1 EFAULT (Bad address)
>=20
> but the recvfrom() code is:
>=20
> static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len,
>                             int flags,
>                             abi_ulong target_addr,
>                             abi_ulong target_addrlen)
> {
>     [...]
>     if (target_addr) {
>         if (get_user_u32(addrlen, target_addrlen)) {
>             ret =3D -TARGET_EFAULT;
>             goto fail;
>         }
>=20
> so current code won't work on 64-bit host, and we are probably lucky it=

> works on x86_64.
>=20
>>   [..snip..]
>>
>> And it fails in
>>
>>    ret =3D get_errno(safe_recvfrom(fd, host_msg, len, flags,
>>                                       addr, &addrlen));
>>
>> in linux-user/syscall.c:do_recvfrom but I have no idea yet what causes=
 this.
>>
>> However the same works without problems when the host is a x86_64 box.=

>> Any pointers in debugging this further would be appreciated.

I proposed a fix for this, do you mind testing it?

http://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg05670.html

Regards,

Phil.

>=20
> Laurent, in do_syscall() should we swap the pid back?
>=20
> @@ -10628,4 +10628,5 @@ abi_long do_syscall(...
>          target_header->version =3D tswap32(header.version);
> +        target_header->pid =3D tswap32(header.pid);
>          unlock_user_struct(target_header, arg1, 1);
>=20
>>
>> The issue is also present in qemu master. The overall goal is to get
>>
>>    qemu-debootstrap --arch armhf buster chroot
>>
>> to succeed on an aarch64 host as it does on x86_64.
>> Cheers,
>>  -- Guido
>>
>> =E2=81=B9: which is a stripped down testcase for /usr/bin/chfn failing=

>> =C2=B9: the scaleway server this runs on doesn't support armhf.
>>
>=20


--He7KeAy13pYFoBm2QNChK1fZJLxD9dm14--

--dx8mKSHguxrOswy1DbpMKYle4bZndDVHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpnTtEACgkQ4+MsLN6t
wN6WfBAA18o5i273mjmB4GpiefiCdSZXWs/wCSAY13eDOj6glHCv6GaquOIz4QMS
RNZvutlIH31pOyKF79uMb5IgmOJO2bYcDYSco56Y8eyqamnHYsrcsaO5kP1Rz8T3
VW111vW1Byw45XPT8MqzBgU8l99KF3LannzxqLTBhQTFu/V3U9rf7uT/jTnS1W4j
xNRjYmt2IQqauBHBtxtUnhu5fcD09aXySZe0hsgxDf1YsKSdHqkgJJbarrOPuEK/
PemlDuIdwRlSrGcdDYplJ6tfBqLTUuCB+Hj5yAM/YXR2bJIfD7AQjb1emtF6jWKS
4Z1z79oy/xOVMnKYEI5CHpH5pN24eEfyNUk9/0nk6OsxEksU6idfxSGi0qsXD0Lf
gOSOsuDFPmBt6JaSdW1LefQaWQC4LPHWFuGj/vfnL2CZuTE4ac8kea/9RBu3NuqO
pkGnffo6857IRODTIigRCu+ZP+t6DqW6KhJ26Gvx76rvNw6WutMHwEvyNC71BxQ7
4Cs10AA/g5vG119HvgmjdVo6UqIypDqHq+SJVOHayGY5x6V2rLyGoCIQYrF6JZj1
2wR0EhODqm0PpwzaqTkR92/WTjus7SqhCKOjuxrdbiQpgSnJtR0S4ZZuLGHptbx7
c0fnOO5Otsp8FXqbfiZpt/4vMASvcL7lrkuOmRB3Eji4TdP56cw=
=B/01
-----END PGP SIGNATURE-----

--dx8mKSHguxrOswy1DbpMKYle4bZndDVHq--
