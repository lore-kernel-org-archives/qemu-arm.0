Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp756665wrt;
        Wed, 20 Mar 2019 06:57:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbel6SoAfxZ5CeTiFyAEx9dbmSrg2E0fk5eTNUeEcWrpyisOsJ+Ug7xy17xc9HEcTpXAX4
X-Received: by 2002:adf:e547:: with SMTP id z7mr3936743wrm.295.1553090230383;
        Wed, 20 Mar 2019 06:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553090230; cv=none;
        d=google.com; s=arc-20160816;
        b=NnZDE87hfukJvB+kuQYV8u0wqtLsILLb0QJs8L6QDCPAa5OP1zM/ES9tAjQefR7qBw
         B1s2AFtXP+8Z0FTHs+zjY7fdfWD11jmW8UvHsOmXVlojm+Xd2osNGfuyYdmlB3HtftqK
         6TEeJWIQBLt5pz2xjiLG9cPc+DfjgGU0MIP2omDl0bZWp69pxj8gnH4KJbNwoemy+Gz6
         zaz9lUIKwUVrOFt5zDwiCK8SH4ExZfJdqKc05e43Zvn69CPM7COA3RPms23bBOg7pNDb
         KTPGZoWD2FLGqGtPLcTV2ePmBp8ZgdIP7R1VvChPPoij+93CiGiktrWpx6Bv+dqeIExC
         9oAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=piwgtqg8R1u+P9dO8Jrh3B9se3OLcDZbkEMFyHJg2ZA=;
        b=vgGjlO+Os2KkTeFZCAB2hF/Ip+ChUr8McRh4/xlUWN1gkaCXqh2knb3549vPZZCvo0
         PRNe92I/+DWkqPdTqNBd23OG/L3pOqgeI0SA0ppC24eoqsREW8jV58M0lZb0xGccb+RU
         oXU/+H9eDBWXIKtn9pSIfTIHoWxCMvNuB1QJbNGDV8xTO/gpBOao09Cmae0Veeof2Ey2
         UTMVSf0xpXPzdX5ks07Iib147XnVzSBFBFLkYP0n30I5HihGahw7rw2zgJnpRRxAdpeZ
         e0yHsgqcZ/Ae05IiXnnmHrjUM3kp5Ev3X49KGImDCLPrApZLUfMv8YB6hmS17UdL+UEe
         6mAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BQ0wnocP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si1343682wrx.194.2019.03.20.06.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 06:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BQ0wnocP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:48339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6biP-00080I-IB
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 09:57:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h6bi9-0007zB-Ax
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 09:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h6bi3-0003QY-DF
	for qemu-arm@nongnu.org; Wed, 20 Mar 2019 09:56:49 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1h6bhy-0003Lm-GN; Wed, 20 Mar 2019 09:56:43 -0400
Received: by mail-wm1-x341.google.com with SMTP id a184so6723334wma.2;
	Wed, 20 Mar 2019 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=piwgtqg8R1u+P9dO8Jrh3B9se3OLcDZbkEMFyHJg2ZA=;
	b=BQ0wnocP0WDkTdMzOdBvyx8iyggDUoFhtfXqTfP+h67xgKOl730/NqCIvzY9M1I40H
	eLufHRJWBCs2Rnp5E8oxbr62Gsfj/+52CECmL/tJA8EruPhAp95eXL0s1Wg3I1E3haxN
	NgpiQLlyFSOVtDlAGoNvnoimH7uicJcTFEIJ0SwiLrUmNE29pkVuzCXTi5/N06/j4t4x
	u9XkMO5gHEoQI5dmR2ue+qsF39XrV5R8nBK8AJdf7K8vqCpemzNjI+aDQB2U5FGlG12W
	cretER+16RSFWixuV2C030Uhmxut2G9Y5l1eE5no9lrog2s42CaQGfxBJd+dHycoSFAJ
	OQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=piwgtqg8R1u+P9dO8Jrh3B9se3OLcDZbkEMFyHJg2ZA=;
	b=dtA3/XqwGDVj4KwL/mliW/pcSWT4sN1RzpJYm09uDXsIiAVXECoqvMfFmj1ESG4ark
	39Yt7GqHinBX8MILPv2CM9DnlbqzNyn9EgS4PbI8wxF0TzYYPCkI4g36nM8W6GG/Iog7
	GmZzVG1kxQruyXUoyffDgVVWSLBNXtBOhqZhzZgvOIo7o5XJRQVyHmxntjWmgDOmbk6D
	FhcNOaG9Lsfmx3iALDt58jx3bkFzAqopYKGmT6ooLlUNtDTAx37sznTew6bT5cexgh8m
	cijt+4bhg0zuzHl8wm4T0KLtRsqYm77+W4sJUaVQcUEkLfHAxmQiILGQO0GVXyIdswUp
	x8hw==
X-Gm-Message-State: APjAAAWql+ZzD+nHjKsgxL+pfLb7FyJNRdtWsgh8sQoewZjomQA8Kxzq
	aknZ7r80pPZfa28ZDfewSSc=
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr8580627wmh.53.1553090201171; 
	Wed, 20 Mar 2019 06:56:41 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	132sm3540019wmd.30.2019.03.20.06.56.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Mar 2019 06:56:40 -0700 (PDT)
Date: Wed, 20 Mar 2019 13:56:39 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190320135639.GB6962@stefanha-x1.localdomain>
References: <20190317141001.3346-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20190317141001.3346-1-pbonzini@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] nrf51_gpio: reflect
 pull-up/pull-down to IRQs
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
Cc: jim@groklearning.com, contrib@steffen-goertz.de, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, stefanha@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pKOCEbyFDoal


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2019 at 03:10:01PM +0100, Paolo Bonzini wrote:
> Some drivers do I2C bitbanging by keeping the output to 0 and flipping
> the GPIO direction between input and output (see for example in Linux
> gpio_set_open_drain_value_commit, in drivers/gpio/gpiolib.c).
> When the GPIO is set to input, the pull-up resistor brings the output
> to 1, while when the GPIO is set to output, the output driver brings
> the output to 0.
>=20
> Implement this for the nRF51 GPIO device model.  First, if both input and
> output are floating, and there is a pull-up or pull-down resistor
> configured, do not just set s->in, but also make any devices listening
> on the output qemu_irq receive that value.  Second, if the pin is
> driven both internally (output pin) and externally you don't get a
> short circuit if both sides drive the pin to the same value.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         v1->v2: fixed short circuit conditions, reordering the code accor=
ding
>         to the schematic in the datasheet
> ---
>  hw/gpio/nrf51_gpio.c | 64 +++++++++++++++++++++++++++-----------------
>  1 file changed, 39 insertions(+), 25 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJckkaXAAoJEJykq7OBq3PITEgH/0PnRkAKN5RZlpQfYYMtdFsn
IXwlOtYm7kS3sul/uTcFNQ+i0TMPJzXIJnuLD+v5vuWcpZ5rPrHcHA8blhvqvLmy
SXKkdoXYttVEROFwNTW526pWV4fZ05id5cK+wWi8OX1yt6qX7nHli4KZ/a3SwRh7
QUzmNT3Vx2Wp/ssOaZFfgS6rtCfdo+LPtd2ChvcfcKO6wVQaYZqcEwkQnS9kfZyC
RwUdcyN3V0Crx/W2KZ0Z2olMusioIb7Cjw7pAUKJmY5aX4Hzw28aNTS+MXTeRvmj
Oj2MTN1Cv+NuGcUhOUjY1KhqXTgQTUzzOPHl/kCnht/knv7GJUy7vFa/Nxa5Ae4=
=NxVZ
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
