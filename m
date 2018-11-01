Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp788161wro;
        Thu, 1 Nov 2018 06:09:35 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fNqgRYUDjHGaXX4Mh+AXqv79BnFX69oJ6LdcHFL6NxbXbl5J7Blb5bYRLBF0cR+X85ipw7
X-Received: by 2002:ac8:1c17:: with SMTP id a23mr415894qtk.16.1541077775027;
        Thu, 01 Nov 2018 06:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541077775; cv=none;
        d=google.com; s=arc-20160816;
        b=rHCBY7Sd8XI4vNBc5CMhPwv5JrsgOXDXyvpKSqwk1VPPysFPk0CUSTuBwUcGp+u/FN
         FfJUG94Zks5sp0XoseGau+AINfo8Bc7EqEJFLiKdwLd8mQli6yZ4elPTRddphvBBpPil
         OdUT1AwoZCCD1dK26YHl0urHQW/eWV8AFkdRsG4OHcC1Q+SZTdShtWhGo6aG840GVEmI
         xGpyZMxgfso87H3LBJQXCTmtwQgWf7ECYCwZLp7ajTw/e3q2suT9ktm33ccyoszII+Ih
         QJNC10JOhDHSwbuNSxFHD8yphNOGDUEYHFHKEZJfh85LTQbLRGlD9HyXyOd2+RC7/MSZ
         opCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=xz5i/w1yfEoj31IsF2RRvxs2YzqonherkEZ/ji75qow=;
        b=BdbtyteTZI/tmX97jJA5jb4yQow356qJY/DYyDrfzMGr9FPcxHpp5ityOhpv7WD1rk
         eQiPEfxWaileBJMKmOaohRhz0pxypeBPsBnt9ikm5iMxIDOkOHwJ2UQ7ZhsmhJms/FFk
         8GNTHMAcXxSr+Kuyhgd8vM0iuoE0x6u4jdM1umloInbKQX+LjTSQO/aAVC+bocl5wxMb
         tWK7z9E2ByWKNQLvW83fTkkxWdyqlvzUlF8oGz7vXFU+YuRHrQ2/2OO6NPyyRTTt0PUk
         39sU1Yv1TYnYSGjRaIQOVl1FrQas7sWU5sQCy9y2aqPo/sv7in1mawWXCYjSZ+TWt7Wy
         xGdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vbKVr0AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n26si10409061qvd.166.2018.11.01.06.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 06:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vbKVr0AD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gICj8-0002NR-Dy
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 09:09:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gICiq-0002GP-DZ
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 09:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gICbZ-0001JO-By
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 09:01:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:32817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gICbJ-0000x1-JR; Thu, 01 Nov 2018 09:01:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id f19-v6so1039687wmb.0;
	Thu, 01 Nov 2018 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xz5i/w1yfEoj31IsF2RRvxs2YzqonherkEZ/ji75qow=;
	b=vbKVr0ADHzhrIReKvCepBnFZWrP4AITXjb2y214mYpcakYRCMF7svwp1frRxV4X0Tx
	OeftD14vmP1LpblwwB8GjoUcnLYENOuv+toCMKvGuyZEJhmXjb91L41YQZn2XH3aiX9Y
	s7K59V8xYtB21nJzxoOfqGEhe6AluOc2KlG/IcZ+b8jNfCgQ86Z1mVMasyb2W/PQEsao
	xb8135NzroTgYChEpfeTguKW98ebkwkR6OEZHqrl+Rq5SqbUBuy+Hyb2kPrtNhxArLxG
	xyCmema6gybuBWZLO+de49+rxxiz3CYcRwu6SH/4LCi9HUAPu5MXiYXko7F2N4RimP+Z
	TKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xz5i/w1yfEoj31IsF2RRvxs2YzqonherkEZ/ji75qow=;
	b=qF0lMrt29TTw35/9DIJjAHyRwHelP/bIHbxO5aZz1uWtC+w6w+JG5bHvmVuAEbi6wN
	ImbyBm7w6fHB56fHiC5iiQgs7/n10tBE/BOMwDFvUsOpgeVJLlby2sw+9zgriEzh3DqH
	rNrmooOVNd2ZbTuZVcVy+mySyO/uzpQ6/Tocj+lilY9zO6AYRUMpNlzPCH3ZobrUqZF5
	DM1rOKwPPn8Dh0DA8TkaKvAJuMWdOsQJJTOxHijtO9fC5LSsjz1tGTyDEv9KTAhIf6C/
	VrSf3F7qmoHkotIdEexGcPw9/Q68KtI7WA8ScKLM5v5WkiyHrDkHp7KK59s9OIQFg325
	9Zgg==
X-Gm-Message-State: AGRZ1gLZJ633jyUxvJUV6e0Vj4t8G5WF1udHOeBVqo1xy5XIbCrjYJ4U
	GfFGCWBqYhpI14a2WTWh8Hw=
X-Received: by 2002:a1c:b143:: with SMTP id
	a64-v6mr5657140wmf.109.1541077284852; 
	Thu, 01 Nov 2018 06:01:24 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	q20-v6sm2543508wmc.33.2018.11.01.06.01.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 06:01:23 -0700 (PDT)
Date: Thu, 1 Nov 2018 13:01:22 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20181101130122.GU24946@stefanha-x1.localdomain>
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-13-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O0IT7rLmWuveAsNR"
Content-Disposition: inline
In-Reply-To: <20181031002526.14262-13-contrib@steffen-goertz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-arm] [PATCH v3 12/13] arm: Instantiate NRF51 Timers
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
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: giimWfeBYD6p


--O0IT7rLmWuveAsNR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 08:25:26PM -0400, Steffen G=F6rtz wrote:
> +    /* TIMER */
> +    for (i =3D 0; i < NRF51_NUM_TIMERS; i++) {
> +        object_property_set_bool(OBJECT(&s->timer[i]), true, "realized",=
 &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        base_addr =3D NRF51_TIMER_BASE + i * 0x1000;

s/0x1000/NRF51_TIMER_SIZE/

Aside from that:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--O0IT7rLmWuveAsNR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb2vkiAAoJEJykq7OBq3PIjxgIAKMKLURqfIuRb0WhlyTP0De9
3daFThkTffbXOOL/yvYA4XAfEErsRuev1F69NBviuyMXJ/qd12B8RVqiJ3zzNp9r
o4sG99xu67LOWbV2WPp2F7H684HOItODgMc3YoM37D8WiSI/3uuC08WfNi1Udbws
ktDPnTvVyO8vdd/EaQll45ehn8ADZqWlNPPnAyVP9bUXH/WAzBLtqkF0xfU02dBn
qe9PvMws0AgqW5PBdakTHsEoIWG1wgmRehkWiZtadqoWiWSaH8//VLmyOacGTyVt
uSBJT8bMGEzK5es9HfxylExKxlkWYuGEUdog92RBQmsEMntW+cL+DYD9W4OQCQM=
=SBS4
-----END PGP SIGNATURE-----

--O0IT7rLmWuveAsNR--
