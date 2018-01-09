Received: by 10.28.173.206 with SMTP id w197csp3878656wme;
        Tue, 9 Jan 2018 08:25:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBospbQF9usSJ0XIX+htDH/IpKGQJ4CEXEKt4wOBLRRmhJzPqXPB8sHiogftJg/1pHo7l/HW2
X-Received: by 10.129.38.87 with SMTP id m84mr6700708ywm.73.1515515141976;
        Tue, 09 Jan 2018 08:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515515141; cv=none;
        d=google.com; s=arc-20160816;
        b=xHEdlkgfEHmNn/VQ1OdBJwO1TjA6B7fUml4GRSlNo/YXqF3TSPkpywejr6VMHmtafS
         lqoqyZ3cL7+j+NSh9+gQPw32n+wa/lebpBcoIB/l4qL2l6FHq5I7++8GpAviGKFlIFp0
         ghYWQ+GnfyF1WnFs0Wa0jv1gNujB+uQFdAcz3UWlQCCJN3/kgDFgCJKQbuUW77MyivDv
         TvkDLMjbXDJP9FpBKUa807iFuUfFu5ANsjNzUvIi9k+MemZZ4NmX0tlFmKRaKKISIKe4
         yDGUjlwnFY739BN8vOaLieniCEvKkBN6QphwI8Z0U09Bh7jYbF0/B81eZa4DJa93nTDg
         ratQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=WeJVWC9gWy5uulStfhZrsvCJ+QsV+tzU+xjVfkaI+mo=;
        b=FFRZhOr7nwfUaBA9TM7QtbM4/sVmtVDbcMP1c/33o9ohDY6Vk2+vhmC3CMGY3OFgss
         KaETDBMA2TJrKv9exNDwxMNfG7pgo5fzcIBIdQUD9DyMpUIWf/xi/1nTJE+Fnt0Dh96P
         VfA2qC+clWiANHg1n/Y5LdKiHLOVswcz6/+/2OS4UVzQ3+1Ivgf96bMZOem7kjmKtOJc
         P+uCvoN1yyndB6hyvyQEdlOy1h0YS2u3e/nz/4+8Ostw1pZjIGPev9cXtBaQaekpV7/R
         cDNY1x1Xu+ZCc3HJpkU+QyALolpL8eQBmzd+/QJoxaoeU9Jg5sg6gItM3ZgVR5X8lj9v
         Vetw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KQV6b78K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z184si3081713yba.499.2018.01.09.08.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KQV6b78K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwib-00055t-CU
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:25:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwiN-00052r-PX
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwiM-00075c-EE
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:25:27 -0500
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:40333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwiE-0006xG-Cd; Tue, 09 Jan 2018 11:25:18 -0500
Received: by mail-qt0-x22d.google.com with SMTP id u42so18461028qte.7;
	Tue, 09 Jan 2018 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=WeJVWC9gWy5uulStfhZrsvCJ+QsV+tzU+xjVfkaI+mo=;
	b=KQV6b78Kdg8hYhFV4Mawm80h3flXqdEIXpy1v2To28C6B599VjCWn1+rkLKQTm8EEb
	t7wRd8/DFiKL50x5wkIHEuCLRg3yZQtlj15/s01r+KDsPEcNHWTgvrCJ0zb/i8RnwpqL
	aGd30Ca6BFh0oPewaDS+WjfK7dAa4cBdXax2dZwf93Tvv4OuJVIJL+mkr0au/6f8UFGe
	tANY8QLGRVEYrFDrCV94McPdwKTTaT/12I+8zMh3OqMBpHsVBuwyLnSbXa5pqNjfao9w
	9OQWqtrZcf+ZkeDVn7NeaUBgpX+6T+8pSYNdL9deCyqzUxG6kCBzJPR369Y1Ni1ilDFF
	lEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=WeJVWC9gWy5uulStfhZrsvCJ+QsV+tzU+xjVfkaI+mo=;
	b=Uep7TeeXj+yzAFNncR+C4IXWSjR41rqFgFPmJoEf1/LWE37fmDe+edjkwc4x7jKlpI
	xYR0RXry6dP2Qmyrd/Y6fqvdkfhgwZqpPKYvoN0dgHLjkWWpTpXpsyLYMJJ3e0bTagQP
	gkbZkxCXM/OCj4TATMyJYgOp+LzclDAICBzxBWTE6DO6SLPE6cpcQAi/tzzjs26Sbt0Q
	sImUM8sALRYhAMYgpSfQqYyg3+yH2WowPI6BeC8pfCJXMpPWShMoyWLPmrAgmy5+DB/4
	OmuPtXAY+WaNU0MF3S/LvhPAIzIzcWCsshTYj1M44HChfKZ9eJg79X1smobKVrio+GyR
	iDqg==
X-Gm-Message-State: AKwxytdBroRELqmKG4ENYyBak+U+bDHb98A3OkOETE6QnLlyAncz3h14
	vOMAs7FOtrroT9Rp3E1UmUs=
X-Received: by 10.237.58.229 with SMTP id o92mr21720581qte.35.1515515117527;
	Tue, 09 Jan 2018 08:25:17 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id o5sm3871340qkh.94.2018.01.09.08.25.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 08:25:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <12647bf7-eb9f-889a-76e0-32fb1f799160@amsat.org>
Date: Tue, 9 Jan 2018 13:25:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="KFWgVohLgrfxgZzrfyDrDiLz8GFgk66YX"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/sd/ssi-sd: Reset SD card on
 controller reset
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
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SbhV+Q0YKPfc

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KFWgVohLgrfxgZzrfyDrDiLz8GFgk66YX
Content-Type: multipart/mixed; boundary="Olp7Qh7buxRrGiXTPdaTwgcPbjkivLliF";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, patches@linaro.org
Message-ID: <12647bf7-eb9f-889a-76e0-32fb1f799160@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/sd/ssi-sd: Reset SD card on controller
 reset
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
 <1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1515506513-31961-4-git-send-email-peter.maydell@linaro.org>

--Olp7Qh7buxRrGiXTPdaTwgcPbjkivLliF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 01/09/2018 11:01 AM, Peter Maydell wrote:
> Since ssi-sd is still using the legacy SD card API, the SD
> card created by sd_init() is not plugged into any bus. This
> means that the controller has to reset it manually.
>=20
> Failing to do this mostly didn't affect the guest since the
> guest typically does a programmed SD card reset as part of
> its SD controller driver initialization, but meant that
> migration failed because it's only in sd_reset() that we
> set up the wpgrps_size field.
>=20
> In the case of sd-ssi, we have to implement an entire
> reset function since there wasn't one previously, and
> that requires a QOM cast macro that got omitted when this
> device was QOMified.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/ssi-sd.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 24001dc..30d2a87 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -50,6 +50,9 @@ typedef struct {
>      SDState *sd;
>  } ssi_sd_state;
> =20
> +#define TYPE_SSI_SD "ssi-sd"
> +#define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
> +
>  /* State word bits.  */
>  #define SSI_SDR_LOCKED          0x0001
>  #define SSI_SDR_WP_ERASE        0x0002
> @@ -251,6 +254,24 @@ static void ssi_sd_realize(SSISlave *d, Error **er=
rp)
>      }
>  }
> =20
> +static void ssi_sd_reset(DeviceState *dev)
> +{
> +    ssi_sd_state *s =3D SSI_SD(dev);
> +
> +    s->mode =3D SSI_SD_CMD;

> +    s->cmd =3D 0;

Not necessary/useful since s->mode =3D SSI_SD_CMD.

> +    memset(s->cmdarg, 0, sizeof(s->cmdarg));
> +    memset(s->response, 0, sizeof(s->response));

This might be cleaner to move it in ssi_sd_transfer() case SSI_SD_CMD.

> +    s->arglen =3D 0;

Not necessary/useful since s->mode =3D SSI_SD_CMD.

> +    s->response_pos =3D 0;

This might be safer to move this in ssi_sd_transfer() case SSI_SD_CMD.

> +    s->stopping =3D 0;

This might be cleaner to move it in ssi_sd_transfer() entry "Special
case else s->stopping =3D 0;"

Since none of this comments are important, I can add a patch in my
series previous to convert to SDBus.

> +
> +    /* Since we're still using the legacy SD API the card is not plugg=
ed
> +     * into any bus, and we must reset it manually.
> +     */
> +    device_reset(DEVICE(s->sd));
> +}
> +
>  static void ssi_sd_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -260,10 +281,11 @@ static void ssi_sd_class_init(ObjectClass *klass,=
 void *data)
>      k->transfer =3D ssi_sd_transfer;
>      k->cs_polarity =3D SSI_CS_LOW;
>      dc->vmsd =3D &vmstate_ssi_sd;
> +    dc->reset =3D ssi_sd_reset;
>  }
> =20
>  static const TypeInfo ssi_sd_info =3D {
> -    .name          =3D "ssi-sd",
> +    .name          =3D TYPE_SSI_SD,
>      .parent        =3D TYPE_SSI_SLAVE,
>      .instance_size =3D sizeof(ssi_sd_state),
>      .class_init    =3D ssi_sd_class_init,
>=20


--Olp7Qh7buxRrGiXTPdaTwgcPbjkivLliF--

--KFWgVohLgrfxgZzrfyDrDiLz8GFgk66YX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpU7OcACgkQ4+MsLN6t
wN4V7w//c1J0t9Xeb5ybiDgpDUgJD5aqcoziknX35Xs/eBXi7JI7+2p8bLaMtTRZ
CJ5L9SpC985ADctDLAw5cBLDZilqAvokh57Hd9/n5+2/WrrUKcfWPO8dkojQdGWy
xVgkzh1oZ4YaNolyMUHOTWxS3JIYqFXrY92Nkaqu5ZL3ppYZYMeakhVYu47Ds3gn
kH3bSoBxLfjrue8GWP7hah4PhgiZuCDKMU8OnyKfd1et7FW6RYqEZy3NILKYtChl
mFASG8GUzn5UV7l69JNs04UiwQbTtwboxPxcbFKY4dZDx8vEr7LBigp/abm6wA47
dnnk+DnbUA+te0tsyPq6D9I2fHkXr9RQ/fYwVB78lqP6Al5Lobj/PTPZgNyhDQra
h/VQyBZo7OInU+YRi0HBPB3EtiIMXBfb1c4MSI8q4C87QfhQDn5Ncacywg61IBR9
IczF2hs9y2NE3J4sEOJJ87P8Ci2hNxPqJom65SSmXin3lRXhTByXShLHEhIAu/5D
aTgS9vRFN+khYQk7RgdccbEf3bkxnHCJ1o5AMG11UNHxS1UXxvIW8B5u5x9ttqAk
/tualoATIKRWspCQJka86ZpLwqW/imFRC/L7MgFcsPtcvcMtRCo7cOb02C5kSGAa
H9cO9tJEnjTnBj7XDfa0huiHYs9DV8xwiWTKcAZshkbGBFlOlhw=
=oAsI
-----END PGP SIGNATURE-----

--KFWgVohLgrfxgZzrfyDrDiLz8GFgk66YX--
