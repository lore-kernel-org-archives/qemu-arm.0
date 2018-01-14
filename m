Received: by 10.28.173.206 with SMTP id w197csp1659376wme;
        Sun, 14 Jan 2018 06:37:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBovEke/qAv+AIH2AM63H6qoaAlUC5AxS5ZiZ/q1PA1kK4RAejEIV2TGpEeAIB0nHoRkyA+C/
X-Received: by 10.13.225.69 with SMTP id k66mr7147844ywe.114.1515940653958;
        Sun, 14 Jan 2018 06:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515940653; cv=none;
        d=google.com; s=arc-20160816;
        b=ajly0AsJ9rWiUtoZ7p+rkv2s/DMu+6vigCtD3lNIG82cBlCR7+XghgwsyytfXXh739
         9dY4Zi7XiPDHe3r7gUVQAFJyc11cB2YEnV8xM5gvesJ3soNTzZ/OV0enfEfPv6YA24Zj
         TlbfLSpoCbLJBuC+p1s0FuAK2E57jXoSviTtkH6EewjglBIqmKJmjvuwkStuMppV46Zy
         HZ8L67uCSBmn0Hu2v5N+Rl3Jf3ayxVlJYiK4oSJcGjWtGedoHH7KxDhhQvRn0Z2+NBGw
         Ez74+JoG9yZsUpJ5yUaF9BlHF++aPugf5z4OPhtBwfftU36h1wIv0HMIMvBjnlJLgjHA
         64AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7pqdF2JZkLD8NZEnJ1zSJQ8f0sRFgymQlAP/0zB6NDs=;
        b=WF9bIufE+k/zNld5F/I7TVA/gVl+IGjGrloxpE4IQJhXKRHcCicvR8ddABaBvW1h9K
         UTYim5cCLtLrVxxVFOinfZaN266ubiQZTicElzWmQpg/JyOton6GVKa/s+LJ+rMyOs/S
         VgxA6P1H9/RSmbeo4bN//2LmfDxjtod0pXDO839OF5E7y1gNjmRC1OMrCzyLn3ONBgsn
         wHyzdy5wGFCEvv8L9jWVhktFghAIU7op0gMAkn7B+3B3Yvjxf1Wc7m/7a9UZk9J4HTFe
         Q4Eh9TKNL7+FSqNxnhaG9nGqEzg7b0fQT4cfhM6DwivoMLVZy0oe59yWpNuLVVCEiiil
         ysVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=VaufChWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d123si5408639ywf.261.2018.01.14.06.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2018 06:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=VaufChWZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eajPd-0005PK-79
	for alex.bennee@linaro.org; Sun, 14 Jan 2018 09:37:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eajOX-0004xm-Df
	for qemu-devel@nongnu.org; Sun, 14 Jan 2018 09:36:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eajOT-0005l7-Gu
	for qemu-devel@nongnu.org; Sun, 14 Jan 2018 09:36:21 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:38682)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eajOT-0005kk-AH; Sun, 14 Jan 2018 09:36:17 -0500
Received: by mail-qk0-x233.google.com with SMTP id j185so14105486qkc.5;
	Sun, 14 Jan 2018 06:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=vQlsSeBagSEjjWi8/5pZxc3LINw45f6lmtchE/LL7NQ=;
	b=VaufChWZOx+NO2UC5t8iRRKx4c0CpKixYiw/km3iZSyl56KnJ5d86JXgbG6g5ZJtrk
	nKHYOuORD/YelXB08a7vPdt7ZKBszml6kZwoZuOXPEMhlR4N34xXiHEKsyrZNcv9VCaO
	oRbcEuBcbQknuRhoqemWT6x1r9mINhcEC8mRl+NHko1wofdrD+lkA0YadhgFSSd92Ucc
	Nv1mZam+iRSVzrs8o0iSL7+Jq1IBxLdS7VFYt4h10q7qLMxvydf4pyYILKWj8gs7yAXX
	rVS8JGIgFXy09Y+LRSkn8k+ESim0KIyTqd82Yx83yMvk5oKgcqkaAx5gl2LT8QZWBE2f
	zmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=vQlsSeBagSEjjWi8/5pZxc3LINw45f6lmtchE/LL7NQ=;
	b=ZxXQqCvsMMgSID8cWz9SzjxeExVRTlYH/W/787MCueQQ0BSUNIPkWoIhBs8WYNWmLX
	gVU4ahY84o104bg7rqpqyxyTIIJm9T3uoywLhIzVFBqdtgPfCbsjAkwuxEFrkvpsqs9t
	/QPXcHRfdZpH0il0giZ77Fo5w5jkzdF0uYmwKlgKjRe/qTsLUgFeSclVI+lBpHJ9inod
	trR5Wn50TRnPiPvt59P7vS6QvFGB4bSodpTnMlZHm4R7MkWRrBQbuz5R8PjbytVXzk7Y
	3ealOkyqQ5noHOu7zbifFEpTZEAlOZ2xsbYZlRYR5ZBYOnE+nl+TMF0AnnVyAl9vesQQ
	6qbQ==
X-Gm-Message-State: AKwxytdvjJ/mvZ1N9SsTy/y0JmQiKppUYPF9KmqCdBle/fdz9cH0UcU4
	/3EQe+c380gfmUvMtmO92eM=
X-Received: by 10.55.54.140 with SMTP id d134mr11467475qka.351.1515940576591; 
	Sun, 14 Jan 2018 06:36:16 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	p191sm16547936qke.43.2018.01.14.06.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Jan 2018 06:36:15 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andy Gross <andy.gross@linaro.org>
References: <1512742402-31669-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8-5Rgt82tfDFkh3niUYsvSUKmHeTsk7e+Mzq3HJMBbpA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aabb3f02-30ee-2bd1-f214-2469ce3e7cad@amsat.org>
Date: Sun, 14 Jan 2018 11:36:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-5Rgt82tfDFkh3niUYsvSUKmHeTsk7e+Mzq3HJMBbpA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="hyqlyFeHWzQKpcxPlNDZTMMOu50Ii93tj"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] get_phys_addr_pmsav7: Support
 AP=0b111 for v7M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzJcnMlRiWu4

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hyqlyFeHWzQKpcxPlNDZTMMOu50Ii93tj
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Andy Gross <andy.gross@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Message-ID: <aabb3f02-30ee-2bd1-f214-2469ce3e7cad@amsat.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] get_phys_addr_pmsav7: Support
 AP=0b111 for v7M
References: <1512742402-31669-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA8-5Rgt82tfDFkh3niUYsvSUKmHeTsk7e+Mzq3HJMBbpA@mail.gmail.com>
In-Reply-To: <CAFEAcA8-5Rgt82tfDFkh3niUYsvSUKmHeTsk7e+Mzq3HJMBbpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter, Andy,

> On 8 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> w=
rote:
>> For PMSAv7, the v7A/R Arm ARM defines that setting AP to 0b111
>> is an UNPREDICTABLE reserved combination. However, for v7M
>> this value is documented as having the same behaviour as 0b110:
>> read-only for both privileged and unprivileged. Accept this
>> value on an M profile core rather than treating it as a guest
>> error and a no-access page.

So, checking "Access permission checking":

v7-AR:
 case perms.ap of
   when =E2=80=98000=E2=80=99 abort =3D TRUE;
   when =E2=80=98001=E2=80=99 abort =3D !ispriv;
   when =E2=80=98010=E2=80=99 abort =3D !ispriv && iswrite;
   when =E2=80=98011=E2=80=99 abort =3D FALSE;
   when =E2=80=98100=E2=80=99 UNPREDICTABLE;
   when =E2=80=98101=E2=80=99 abort =3D !ispriv || iswrite;
   when =E2=80=98110=E2=80=99 abort =3D iswrite;
   when =E2=80=98111=E2=80=99
     if MemorySystemArchitecture() =3D=3D MemArch_VMSA then
       abort =3D iswrite
     else
       UNPREDICTABLE;

v7-M:
 case perms.ap of
   when =E2=80=98000=E2=80=99 fault =3D TRUE;
   when =E2=80=98001=E2=80=99 fault =3D !ispriv;
   when =E2=80=98010=E2=80=99 fault =3D !ispriv && iswrite;
   when =E2=80=98011=E2=80=99 fault =3D FALSE;
   when =E2=80=98100=E2=80=99 UNPREDICTABLE;
   when =E2=80=98101=E2=80=99 fault =3D !ispriv || iswrite;
   when =E2=80=98110=E2=80=99 fault =3D iswrite;
   when =E2=80=98111=E2=80=99 fault =3D iswrite;
   otherwise UNPREDICTABLE;

You are indeed correct.

Having a 3bits perms.ap, I wonder how you can reach the 'otherwise'
case... :)

// Access permissions descriptor
type Permissions is (
 bits(3) ap, // Access Permission bits
 bit xn // Execute Never bit
)

This appears in the "Access permissions field encoding" table:

```
The AP bits, AP[2:0], are used for access permissions.
=2E..
110 Read-only Read-only Privileged and unprivileged read-only
111 Read-only Read-only Privileged and unprivileged read-only
```

However I think this v7-M PMSAv7 behaviour is not obviously
differentiated in the  Architecture Reference Manual:

```
ARMv7-M supports the standard PMSAv7 of the ARMv7-R architecture
profile, with the following extensions:

=E2=80=A2 An optimized two register update model, where software can sele=
ct the
region to update by writing to the
MPU Region Base Address Register. This optimization applies to the first
sixteen memory regions (0 =E2=89=A4
RegionNumber =E2=89=A4 0xF) only.

=E2=80=A2 The MPU Region Base Address Register and the MPU Region Attribu=
te and
Size Register pairs are aliased
in three consecutive dual-word locations. Using the two register update
model, software can modify up to
four regions by writing the appropriate even number of words using a
single STM multi-word store instruction.
```

They might add smth such:

"and with the following differences/restrictions: ..."

>>
>> Reported-by: Andy Gross <andy.gross@linaro.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>> ---
>>  target/arm/helper.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 91a9300..2f53dd8 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -9229,6 +9229,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *e=
nv, uint32_t address,
>>                  case 6:
>>                      *prot |=3D PAGE_READ | PAGE_EXEC;
>>                      break;
>> +                case 7:
>> +                    /* for v7M, same as 6; for R profile a reserved v=
alue */
>> +                    if (arm_feature(env, ARM_FEATURE_M)) {
>> +                        *prot |=3D PAGE_READ | PAGE_EXEC;
>> +                        break;
>> +                    }
>> +                    /* fall through */
>>                  default:
>>                      qemu_log_mask(LOG_GUEST_ERROR,
>>                                    "DRACR[%d]: Bad value for AP bits: =
0x%"
>> @@ -9247,6 +9254,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *e=
nv, uint32_t address,
>>                  case 6:
>>                      *prot |=3D PAGE_READ | PAGE_EXEC;
>>                      break;
>> +                case 7:
>> +                    /* for v7M, same as 6; for R profile a reserved v=
alue */
>> +                    if (arm_feature(env, ARM_FEATURE_M)) {
>> +                        *prot |=3D PAGE_READ | PAGE_EXEC;
>> +                        break;
>> +                    }
>> +                    /* fall through */
>>                  default:
>>                      qemu_log_mask(LOG_GUEST_ERROR,
>>                                    "DRACR[%d]: Bad value for AP bits: =
0x%"
>> --
>> 2.7.4
>=20


--hyqlyFeHWzQKpcxPlNDZTMMOu50Ii93tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpbatkACgkQ4+MsLN6t
wN4WBRAAw05gUeRI/jWz07vF7FyIeMXrYzt/j8iTXSDI/6LVF0wTHmKB53UBzSKz
Dd86HiNSRmPAjgXHyYxfVY8RUKb4xhaAtPd99pxNZ7YOS96zxMDr6CHyL3twyh8g
V2UtfcCrOolcnmOxVBW7kYVo3VHUub1SJwEg8E8XMUvTUu3gspZbwWFDdbo+DeUo
yJIo5o5JXyiiUXRT1N6kwptmmEjt6OzjfTKyKwEthIhOCIdSyEuqznK0gjb4Z9dF
sXcIdcy0N6EFFxMQ9khRPo2KG5T39VJH6alTpqaGBSqE3XCo+p7HjEn642wKBNor
kUe+WlvRrA7l5XCIqmlean854y1RXDGLy5evOdnBjjAYrjdp2f3uc6kiLGWRbdpt
m++nXIBdhDDVU8mEbRFrTxIvLLCbKaTbukJZf/CSn8M+c9oIGdKGvPoUJnWg6OSJ
8C/7J0m+YDZBpkEafoMRm4YqxF15BgR/WdB9/S64L7WPv0iph50mOFi1k4xsV3BS
2tApIM2erzo6ANGQiVJIJJI3PLTiuiK24tG//8H9CbvlOYMBV7ctirhGiL6NPF15
W2dv//xuo8LDk7kQrrV0XKiLjhUu1c/A/DosFVOZMb4pdku7uaRQEfI9d2yyN054
UNgwLBBB5BKY9Noi06iPRfjt0dKTPjtYNBMqeHj4GTZ4CjKhoVQ=
=1OxS
-----END PGP SIGNATURE-----

--hyqlyFeHWzQKpcxPlNDZTMMOu50Ii93tj--
