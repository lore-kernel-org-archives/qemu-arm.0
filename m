Received: by 10.28.173.206 with SMTP id w197csp3861657wme;
        Tue, 9 Jan 2018 08:09:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBotwNMJLOL6unLxr/WuLoP0gBb1pzqt29uWaoQ2QfsSDL1mRNOAhzy1ZNB873M3FYrFnm7Tn
X-Received: by 10.37.93.7 with SMTP id r7mr14940970ybb.96.1515514158378;
        Tue, 09 Jan 2018 08:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515514158; cv=none;
        d=google.com; s=arc-20160816;
        b=h8/VZXU+9QqAOtfu6aJWF/zTB/Ig/+mR8i5jK8uNpXkH08jNtGcAdUs/BfmxzoNCKH
         TK+EVUSEmlFvwjXFp8b6ahwiB8QzVgzwVDV8DiJGCkJkiwLWzymbngoZcaK4n0B2WoJh
         6J3dq2/leaiuWJT4gH8twGVj3hnOKuclmqzn1XYQwEe6JYgBzVgj/ei/f4s6GUsuAkIZ
         +1BRcObRRWHwOtJxak1CPoGZZUzkGnBBjkLWtRvlYkMR/EDd7FwAbzYaiiBtPY6p7kw/
         YPhbI32cUyB/wQBY7E6z8Ycthou6hjJ8Fh5/cYNwBPHNnOyI9SKcJ6qmVL1uKvz3XAJC
         l5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=W4ENEKRV+ASK4rknHOUI+rJcHFjnmVH9lplXqEd2gjM=;
        b=jMmjrPjCkMLGDixTiG2CNIOWaJGu0i48I6HkSBHp2or8WY7Nnk4JxOUn57UWecYnfX
         UYaNj7h0vmWfq4QWrBIq4dyNj5OVm9ThqXkQ7gE9MBF172gmXmxvotFdAw1fvX1EYLqP
         Xp/bq27shMqczYGNpUGq/0ZAeBzL4mjPB5Kb2SOSGjyZaLB9f4uOK8xxhKbtEldHFUWF
         iiAn7U0VfLVqfZ8HPR29nqc1KMo+jfrDyqasH9Wsae1CmIeKnJ6d+Utt8UebKAZSVzy2
         xAoxnVAlZcqVs3V3AgtaP0b7MN4oe4Xg2SdAIHZroZC8ZDeugYFP2b0X6/U/FoZo/jEG
         o9zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIToxWbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si3090318ywa.295.2018.01.09.08.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIToxWbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwSj-0006Ht-PD
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:09:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwSY-0006G3-TN
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:09:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwST-000254-57
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:09:06 -0500
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:41938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwSG-0001w1-2c; Tue, 09 Jan 2018 11:08:48 -0500
Received: by mail-qt0-x22e.google.com with SMTP id i40so18398277qti.8;
	Tue, 09 Jan 2018 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=W4ENEKRV+ASK4rknHOUI+rJcHFjnmVH9lplXqEd2gjM=;
	b=jIToxWbAh/5xmXBBnt3lh34I2uNzcGLo6negN8I54Crbr1iDqPIBk7kiEibhZl0vl6
	yXtmuQr2kjfVR4K6jesAYws85KgR51XPWcRVlt79CxHG+iise5EoTN3z1Ko5sMO51QHJ
	AxUCyKzF5EANSte8Ga69rUrUxowK+Dgdp3nRV9OwvYSks3wGoc2tA0m83N9Ml5Q4UbUB
	0lQFGU7KYJBEIO0bngSMQZV3o0lwhWyV828nKtT0nWWWEayZUobg8CP0wmeLuaJ9uXb/
	/fLaAz2CUw/l+gjAUGN/AnSrK/poi7bX1KaJ8Z2BcaIOV4IWwF+PPzdLLoWrWjHmmBy0
	+Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=W4ENEKRV+ASK4rknHOUI+rJcHFjnmVH9lplXqEd2gjM=;
	b=EJ7exwsytqJ9bBxy2Ze+jjX0K/dLhGPsLQIQD4MRgzZJtSYCiBLwCFi7w781sMf6/C
	X64LGnJdwMv1oDVXkDUo148aSuL80WFXqOV0VNzR/QvRMkYYVgtGVJ7Tv3yQSUAq4f2F
	RKr5WaLL1PP9/4ggxmD0nXE+8ZamW27CQunbI9eftv5rJBBsrMhdt7T/cLsJlRaaDR3o
	skoRB5tFiEajYwB0G5+Cs/4MykG/JUFGa2UJk5VFoaSH5Kd4oUTFDlldDRThQIEiCqol
	5IOFsaWIa0GmeDNazmMR5PB6uPXwHvEl5OX6eSODnGuCWmTHhtc71oLrp5bJwCQNQ/qb
	CzFA==
X-Gm-Message-State: AKwxytcw7pdCCs6uD8/haVER6JLVv5dKCor8IcDWlx0MIIDbmK0Laqwt
	f8/QgfnW1eTA9gEDVH7uHPk=
X-Received: by 10.237.46.131 with SMTP id k3mr22410335qtd.128.1515514127240;
	Tue, 09 Jan 2018 08:08:47 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id u62sm3322349qkh.2.2018.01.09.08.08.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 08:08:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<1515506513-31961-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c83ab7dd-bbee-827d-bc63-af0f76740da7@amsat.org>
Date: Tue, 9 Jan 2018 13:08:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515506513-31961-3-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="IY3uBVR4zRIgfTyeVhjqNaxNLgAPLWTyX"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-arm] [PATCH 2/4] hw/sd/milkymist-memcard: Reset SD card
 on controller reset
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
X-TUID: irnvHISObdU1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IY3uBVR4zRIgfTyeVhjqNaxNLgAPLWTyX
Content-Type: multipart/mixed; boundary="G7mBtQFB2dbIou6GjJ4alJcWrmqZRfSoC";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, patches@linaro.org
Message-ID: <c83ab7dd-bbee-827d-bc63-af0f76740da7@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 2/4] hw/sd/milkymist-memcard: Reset SD card on
 controller reset
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
 <1515506513-31961-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1515506513-31961-3-git-send-email-peter.maydell@linaro.org>

--G7mBtQFB2dbIou6GjJ4alJcWrmqZRfSoC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 01/09/2018 11:01 AM, Peter Maydell wrote:
> Since pl181 is still using the legacy SD card API, the SD

pl181 -> milkymist-memcard ;)

> card created by sd_init() is not plugged into any bus. This
> means that the controller has to reset it manually.
>=20
> Failing to do this mostly didn't affect the guest since the
> guest typically does a programmed SD card reset as part of
> its SD controller driver initialization, but meant that
> migration failed because it's only in sd_reset() that we
> set up the wpgrps_size field.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/milkymist-memcard.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 4008c81..341da88 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -248,6 +248,10 @@ static void milkymist_memcard_reset(DeviceState *d=
)
>      for (i =3D 0; i < R_MAX; i++) {
>          s->regs[i] =3D 0;
>      }
> +    /* Since we're still using the legacy SD API the card is not plugg=
ed
> +     * into any bus, and we must reset it manually.
> +     */
> +    device_reset(DEVICE(s->card));
>  }
> =20
>  static int milkymist_memcard_init(SysBusDevice *dev)
>=20


--G7mBtQFB2dbIou6GjJ4alJcWrmqZRfSoC--

--IY3uBVR4zRIgfTyeVhjqNaxNLgAPLWTyX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpU6QkACgkQ4+MsLN6t
wN7inRAA0vHnpYGVr3WpI+V830Zg+UyT1YrGflJGqvsfdYmwbJJR1Z2Eig3vNHZW
bTcYZi1BMCKR8SWbHhjDmQ8hcMT4oH3h81CZtvoKX+ycc2bafGpTlp6XfbDzwl9z
t4b32dxnnpdtTaFUQtRPHbFQcz+jOyDXmZ4mO50pncN5k3u5AD8Wzu6M6/KO7Vgt
+6JZSQFPz8HDOQgv3HgW9fOXOi7wuu+GDxzGfMG/1EyJNr5UbZV1Y0R86lUIJBsY
khIo/iGGlUcyQJBT4CA7Zmlr12r23YXMAmb+TiXzvfK9+FEetnFd7zZiPjBJyOxQ
c2CZCF5/Sy/UVAkEXqBnOF0uCi5FndWMqta77fmsBpKH1zaEiSioQf3UX3ieY+bM
CvB1dQXE8rpAEzm/T50PP/6dvZGJc3GrwYBx72JyOgqhAIZNHHVvToYa6lPLo/bW
B4V4aZPeHoBDJ3FtEbGPLQkmw4dwFx1Eud0lrArteDsHUjoLAEK5UDiWthd3CyVo
vDagCdUudNmaa7kwo0qI+kASprAJ2588ArC5RYbKiQdzmGiMSBSyiBbUn97MO+xL
Xcbipqn7eG+wIXC8XCbnsTzQM7v9mDK/GRektefIM5kGFpnFYFfGk/Al3qwoDPV6
++pjtxo2fw5l5EPS/k0RYpl86Bh33912Bwy9t5IZSqoxV1Roefs=
=Rpm6
-----END PGP SIGNATURE-----

--IY3uBVR4zRIgfTyeVhjqNaxNLgAPLWTyX--
