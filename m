Received: by 10.28.71.27 with SMTP id u27csp4128429wma;
        Tue, 23 Jan 2018 06:43:10 -0800 (PST)
X-Google-Smtp-Source: AH8x227zOX1QJMKFh5NI1yEyyV9MWihABxrZP1Zk8EDt8wKTkaj25J6ayiSUcN3ag4BV6uFtOX2q
X-Received: by 10.37.185.204 with SMTP id y12mr2628643ybj.426.1516718590530;
        Tue, 23 Jan 2018 06:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516718590; cv=none;
        d=google.com; s=arc-20160816;
        b=mg1CLnyNiUJmHCzxAVWLGHbtu2K1zM8uKejgFeDf7X4J0KplhWwfu7zuwyM+4Gw69i
         3sbr5EYdSzF+PVi27SJ/R2nDZNuO/APM8OdgRTSwq+eHjnyVV/WquUO2D5pmj32gA02H
         FUM5Kesq9uhzuciDJaRfc5S+AfLAJMn/4dr2ECbZOPyEs2iw7Dq1j73WeNH4i+S6lqqg
         DXO0iskaqAAaEdTOdB6sFizZ+1aaiNceNCDVETnUdJjytxFl0BTmjXOiV7RrblfoDwml
         j5/3zCmL7DN3yX7P+DtvCeGGkxZBB1YYHneNIKGbsRmBLzWE7XABkalPmM65HuT1tZPn
         CmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=x9+iG86hRwkGgYdTLbYC0afV/s6co6eAjwo9PXS0RBs=;
        b=yazwSdsuezeTINmaqOFKFiEmeG4vOttNXB3uArazan21m72cjeG5s5kMWdyHEUEJBT
         G4ykhxAt7rXhkghg65RnGJnSW1viD9RzscWzGSVbn+jBQdj8YufJTxDJ8l87jTQ9Wak+
         pQiRp73ALMxPPIB7KSSwxadx03kv2DYs2tv1hCvvKfpMbzp9i7i61RXm+JrhMookKF7E
         4aBOz8DgCeQAk+Q5JCfGlq6jYtpMaf9LcOlJjSrAYU5qg8P5EkcNvzrc42IfZFrUTLkE
         For5NDgt08pyKFNJOc4BT9foZvibz8WmoAR8GLGCIVzHkF4mLMUcJiQJoaqu2f6gYtNp
         Z00A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C9sCG6lA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si2448902ybc.461.2018.01.23.06.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 06:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C9sCG6lA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edzn4-0005Jj-0k
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 09:43:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzmw-0005JO-2p
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 09:43:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzmr-0005JQ-6D
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 09:43:02 -0500
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:46933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edzmq-0005J7-WC
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 09:42:57 -0500
Received: by mail-qt0-x22f.google.com with SMTP id o35so1759942qtj.13
	for <qemu-arm@nongnu.org>; Tue, 23 Jan 2018 06:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=x9+iG86hRwkGgYdTLbYC0afV/s6co6eAjwo9PXS0RBs=;
	b=C9sCG6lAL1kSTgmxs4S68ZczkWjx0Qj5V20TvOC6jPR7nlQd8Z9frgZ08xx/oKJxVn
	qQXL/PV0F8xU43yeCWkLkuRYt/R09cdv4UTJCLou6eXLhXFSbw3g2GN0owxYXDCdJrqg
	lk8OeloyEcy+CvPf7LTbW9GzyDXtJFUL5HCm8RyoqkQ3ZGRScG78alSZBNhVGTJTchVR
	q0u/R1ZX5GYwhEVr8ZqrThNdNPPUn5jkBZLQt5DtiaH0usocv4OFnbmSH8QqY75Pw2rQ
	ELKrp+fsJBy1oXXiZyQoXDS7qnYAFK77Cns/lDasJsCl5ucBuoVqCffB9y5vmstmzlHp
	aAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=x9+iG86hRwkGgYdTLbYC0afV/s6co6eAjwo9PXS0RBs=;
	b=WSlXqOuwckm3VgKjkkE4ETxTK26J61u0l9qteLrT+OR4hyKve8BQzfXKJ7PozKB/QT
	5dz08FgAXssVzvMiem4ReswMt466V1ZUfn/JFDXwzVgA7t8Fn4sCeKCgRQA5JQE5w7NJ
	quY1nsUQrnGq3NI9c1f1sNT0QiTtjjpXtCHHl8A9H1QbqS+wTwh5AgisoepfO3wHl+D0
	SZ0JGCkvDomWtWQA2VKmmNw/t9c7cT39GRFll47IVVBJwpchRD9hb8WmlwC1qQ8h139S
	PaZ0c+ipkMy9JyU7RnvNRaBsaqjIG4sSsCTZXOv/S6n+mKWwFnepmluZ0PlT7SHy7RwZ
	Wvhg==
X-Gm-Message-State: AKwxyteyjB620U93/STac5fhHS8HMjeQGXFO6xbVpr+hkD2urRTylW0O
	NwNvz/oYXm6mtBOkSGPRmj0=
X-Received: by 10.200.41.123 with SMTP id z56mr3762564qtz.189.1516718576235;
	Tue, 23 Jan 2018 06:42:56 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	l189sm3636944qkc.54.2018.01.23.06.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 06:42:55 -0800 (PST)
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
Date: Tue, 23 Jan 2018 11:42:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123120541.GA14216@bogon.m.sigxcpu.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="bV7092qAxLxLgXvV5nhHxnakfWzRy8eJq"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
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
X-TUID: s1yqc423D2GW

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bV7092qAxLxLgXvV5nhHxnakfWzRy8eJq
Content-Type: multipart/mixed; boundary="z2ALDyq7pEruCZxbDAc5Sgo8CzrSDmy9G";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Message-ID: <2dcba347-3e1c-01bb-32c6-b5b243002c52@amsat.org>
Subject: Re: [Qemu-arm] recvfrom error with linux-user emulating armhf on
 aarch64
References: <20180123120541.GA14216@bogon.m.sigxcpu.org>
In-Reply-To: <20180123120541.GA14216@bogon.m.sigxcpu.org>

--z2ALDyq7pEruCZxbDAc5Sgo8CzrSDmy9G
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Guido, Laurent,

On 01/23/2018 09:05 AM, Guido G=C3=BCnther wrote:
> Hi,
> Running the attached program=E2=81=B0 in a armhf chroot on a arm64 host=
=C2=B9 like:
>=20
>     chroot . /usr/bin/qemu-arm-static tmp/nl-bad-addr
>=20
> fails with "Bad address" when invoking audit_log_acct_message. strace l=
ooks like:
>=20
>   [..snip..]
>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) =3D 3
>   ...
>   31572 sendto(3, {{len=3D124, type=3D0x454 /* NLMSG_??? */, flags=3DNL=
M_F_REQUEST|NLM_F_ACK, seq=3D1, pid=3D0}, "op=3Dtest:message acct=3D\"?\"=
 exe=3D\"/tmp/nl-bad-addr\" hostname=3Dlocalhost addr=3D? terminal=3D/dev=
/pts/2 res=3Dsuccess\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) =3D 124

the do_sendto() seems to correctly handle the u64 target_addr

>   31572 ppoll([{fd=3D3, events=3DPOLLIN}], 1, {tv_sec=3D0, tv_nsec=3D50=
0000000}, NULL, 0) =3D 1 ([{fd=3D3, revents=3DPOLLIN}], left {tv_sec=3D0,=
 tv_nsec=3D499993180})
>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3=
897e0, 0x42) =3D -1 EFAULT (Bad address)

but the recvfrom() code is:

static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len,
                            int flags,
                            abi_ulong target_addr,
                            abi_ulong target_addrlen)
{
    [...]
    if (target_addr) {
        if (get_user_u32(addrlen, target_addrlen)) {
            ret =3D -TARGET_EFAULT;
            goto fail;
        }

so current code won't work on 64-bit host, and we are probably lucky it
works on x86_64.

>   [..snip..]
>=20
> And it fails in
>=20
>    ret =3D get_errno(safe_recvfrom(fd, host_msg, len, flags,
>                                       addr, &addrlen));
>=20
> in linux-user/syscall.c:do_recvfrom but I have no idea yet what causes =
this.
>=20
> However the same works without problems when the host is a x86_64 box.
> Any pointers in debugging this further would be appreciated.

Laurent, in do_syscall() should we swap the pid back?

@@ -10628,4 +10628,5 @@ abi_long do_syscall(...
         target_header->version =3D tswap32(header.version);
+        target_header->pid =3D tswap32(header.pid);
         unlock_user_struct(target_header, arg1, 1);

>=20
> The issue is also present in qemu master. The overall goal is to get
>=20
>    qemu-debootstrap --arch armhf buster chroot
>=20
> to succeed on an aarch64 host as it does on x86_64.
> Cheers,
>  -- Guido
>=20
> =E2=81=B9: which is a stripped down testcase for /usr/bin/chfn failing
> =C2=B9: the scaleway server this runs on doesn't support armhf.
>=20


--z2ALDyq7pEruCZxbDAc5Sgo8CzrSDmy9G--

--bV7092qAxLxLgXvV5nhHxnakfWzRy8eJq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpnSegACgkQ4+MsLN6t
wN62pA/9HZ/8Bu5m8ykL+3AkrTlwL5vFKj6TZm1/pg96Pk2C5fk8ZYTcmRe8HT2H
DPqY+J9L+S+JgJ3RezGmH2mcmIkOxISBgJYROvy8wlAJo7xPZNElpaF9l9KU5Mii
wJKTtFq9qe7Ut5rn49FzIEHRuH7N94G+yM8MUEo/p6+6JrnHdJ8vRyo21c9p3AaN
rJBY+Xa1Sqqvb/iwpbdvv8QJb1RwZNh/ENLbwf99wvXQfhZPhGBZmMEeGGVdWsir
H3HiJ5iPHH4y89KcMX8mEIHdYEK7fKp1Uo7GTBZnViark8rXX5g7KUyPNmOHNS2L
/DLUhe+Jywou1XCF4tgSlhKXCK1ml460cJ2nlin3EXAkqyVA2Kcn9Uenp6dEL0uJ
D1P+PU2gjQMuBOL6N3D1sVMW2f+bXuF2ccVs4xuV7bh7Snk2qjcswflH937U3JmF
DET4j5OZAiPV6KZ0pxPqzyFyOiq3zPOjZeQ83k5TN/j4k/N68qyeppgUMMGIXs3Y
OFBw6DW5YlzkoPORIaACcx9FcTGhxbETBfVVPJahQeTyYQHKGczBpmmFvj+JYhbB
tmhw9EAd3jE0G7WEO8Bi7i4Gcda5Ltb1+lNZzp69MofPOdAlohllZgPN34iQOTcb
oCsD23LadQqj6Udupx//RwzUKfscUJsf2Fd4D+k6NvZclld971M=
=N8fh
-----END PGP SIGNATURE-----

--bV7092qAxLxLgXvV5nhHxnakfWzRy8eJq--
