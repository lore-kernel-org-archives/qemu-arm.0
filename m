Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3969149wrt;
        Mon, 28 Jan 2019 18:56:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7vsNfT/CQGJ/KjtP53jMsM3B8SX50k0Z9tuo0yGkSyDD/oXeOhjHhR793YggHhqxbWe1Vv
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr25734678wrp.59.1548730584329;
        Mon, 28 Jan 2019 18:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548730584; cv=none;
        d=google.com; s=arc-20160816;
        b=mrZnURA7JPqDp0uqBtKRchWQwbHJYaQ2RRhExfLSgsRAMd4EaawAFLK5DqP71eT1Nk
         KucMYY5wNXUrCfs5La0Y8L9eFmBjPK8gbwHkQ5CkIXLKHuSnLWCW2jhtl+FqtzkG7VsM
         xSGSQ20jDKQJBT39NdWOGZrT7PMMy5me1fsqhrjU0sIw03qb++C9jHuVJgTJTqnKauQQ
         eaPbjonj1cSCvJ93Q7wX1k5YoXRevQoF0ISvmKYakWSH0CpgpPdJ9A4CXgkdA/TGrY3C
         Ss9f1mn0gUvHZJUmXfl9/3FCyKiQxYq9ivwBOx9nT87et1ITyAxkI3zj2wg3i+Z2RXmk
         Teeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=vjEVPyHPRdoV5XEg1WaN0K/tQZNORYxeU8bAkV3wVe0=;
        b=iLnVZUsgYZwbv/gbYeGxi0j6mnwv3XQrPKYsFEDgN+BPgsbq8hBZJYBZIO5JFSCVmJ
         Sz36mskS6deXK8m8dP3FeFZt69kTgoT8BAV7MmkNdM0fWwiQaG673FP+M2r6dtGczYo9
         kBH2JG9Xrr1LNYldeUcFHe0lOUtqEHprTj+14YtlZ7hFVZ+V46nAR5/gYS4L9nnNwpPy
         6WwCVmMU3yReSJnWg8X0UwUnO39wtNmcdFz/YwxS5+B+TZZkBhzNapM6qHNANYU3zUSq
         XRzn7GgmPkaBULMvdR2TmoYzP4M7bWff8nrBTAU8Z3oqP3g/G8GeOLZ3+wKwM2lNEd6B
         mL7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cxzXu7Qm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si72789214wrl.31.2019.01.28.18.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 18:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cxzXu7Qm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goJZX-0006W4-AG
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 21:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1goJZJ-0006V0-GI
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 21:56:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1goJZI-0008HK-Su
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 21:56:09 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1goJZH-0008Fr-BU; Mon, 28 Jan 2019 21:56:07 -0500
Received: by mail-pf1-x442.google.com with SMTP id q1so8962903pfi.5;
	Mon, 28 Jan 2019 18:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vjEVPyHPRdoV5XEg1WaN0K/tQZNORYxeU8bAkV3wVe0=;
	b=cxzXu7Qmc/a+zxx5QCVhYqWbJ4kqA+oBg8bE05a3EVSgHw8yXLUFRAigwLvoA5RhCT
	xpBHEE6/QfgOV9GgP2TxPX2H3W9doDAKaKIh3UwZEzhf6cQbS0MkU7agtQUOp056RgmE
	yu2QgDh6ppKr0Ox+i7brWJCxxDOGKcfkJrWJaFf+toKJgtQvSOtH0K6g3qD3ZD3lzXp5
	x92NwgnfubVmU4txyNSWgbant+0f8mGDeiCrjZwmFVhxRVr+Ns8YwzHeVdd5a/zHpSn7
	TT3X72Xaz6A+F6ybAtr7je8LVeaqSo5L40W8zhRUy6QyYqTFh6QLVN+QaUDt7GDQbko3
	aqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vjEVPyHPRdoV5XEg1WaN0K/tQZNORYxeU8bAkV3wVe0=;
	b=tFva+e4IjcMycdsAIkKDQpgYCW5VRlfpnuaWr5zdKwRlMM8q19RZF2x+MZW83U/e48
	E+9f6lA6j6Wr7OGkIFHiDvx/6NcpNcT5ck+SFg7Zz9KiPr7czEVk8SOR57SRweYnAPbG
	oaWYb2tMJ1olLXHZ5lOH4GcHPWzcQGPYdzKNHSogLhlKpQHQZGOSVBETTwZCEiGPaWtT
	yj938rMYJ7acIXMNb2u4FVHpzVzXWnQ9Buv207zuGIkHnQF0/wOQIGG+q+92SR9/vEvI
	YT3aXrEdE54LDzwBDCNus7bOpdFvIiMN1GOHZJw8g78WANjd1GknZ31NSyZUUfuFQ7Lx
	DfDg==
X-Gm-Message-State: AJcUukdVQWNNnvzy/f3lgB/WRNe9gNe7CiOC/+aIaZD12QVOAeSsTN4A
	MEdgvHKt5wG/xycxzwRMD/0=
X-Received: by 2002:a63:fd53:: with SMTP id m19mr22350182pgj.340.1548730566544;
	Mon, 28 Jan 2019 18:56:06 -0800 (PST)
Received: from localhost (42-3-94-015.static.netvigator.com. [42.3.94.15])
	by smtp.gmail.com with ESMTPSA id e9sm41444259pff.5.2019.01.28.18.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 18:56:05 -0800 (PST)
Date: Tue, 29 Jan 2019 10:56:03 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: kumar sourav <sourav.jb1988@gmail.com>
Message-ID: <20190129025603.GC3264@stefanha-x1.localdomain>
References: <20190125155630.17430-1-sourav.jb1988@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <20190125155630.17430-1-sourav.jb1988@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/nrf51_soc: set object
 owner in memory_region_init_ram
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lJUoj/Ipnax5


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 09:26:30PM +0530, kumar sourav wrote:
> set object owner in memory_region_init_ram() instead
> of NULL.
>=20
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/arm/nrf51_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcT8DDAAoJEJykq7OBq3PIK+cH/0l8V9pfs307KCKinbjQ60dR
F+qmqIPxXg6RTOnCQ5E5b5gNtxEtzR2xVu4l/E9WAnkeVe+6hrtD+SlI3Okx6WtL
ARiOOF8mx+ouitE+abwha42U+a+8GkjJvfo59V8C7n/LjYFtcJtZh0o0X03/e7wj
8vGSVnbYbYgRklVc3BkQf8OQXzIHFSlZDbYE+dEAaYFarB3IdvCpPoAKeEyPGAE9
jpD3wXwq3dT6UErsvIxyzpsiaUa4+X8UuEotlwoNq2JLGPH10uDm9+OOIZK/44dE
rvPJJcX8UzqcvYwae7/rmkSvPdZsVuEWePWgobCPEk8MNIV0x4sVo6SWYTkR0fM=
=DADY
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
