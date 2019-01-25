Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp182153wrt;
        Fri, 25 Jan 2019 02:59:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6EKJCPnUiKQRGWoN8haVPc9LymyxBlwfqlp0pxOJ9l0a6OR5+o1fh4O4afgOm5Q35PsnD6
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr6039336wmh.131.1548413953821;
        Fri, 25 Jan 2019 02:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548413953; cv=none;
        d=google.com; s=arc-20160816;
        b=HX/eR4Gu6GfAKmQ0Gr07wbu1dauJDvWFu76bjm7zM2G9VGMH4znl0318+YuJJHpf6T
         tiTOksgaiXwp+xJwmzmsV3pagbAMPpeoUrAK6RkZD8QspuNiS68+RJADOm92WPdnqqNV
         v3BwNeHdQllGeRj7Iil6dGtwLY8/q/Ljjnsk4uvasARVxsONLwNh7hoFL/R9gvq0LVCp
         Utz/FK7x+9E2x3erj2DqD/guSkBIo+ed9QEPQZo0JJAbYGS4KFR/J8bkX+wsKsYItmxX
         hrPpnjg2npH6BUdxspHQFV7TGG22J7xRBBfyrkRHx9ulKIZvdp5eLopNSU/Q09tRheiQ
         Clow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=vDArVQAvPeAMM3u3M+gVC02cdrapMSo8XNml2p0SWOw=;
        b=0LhH+XE1jhvPGHS6RjlNv26nbJxqa96gX0QVXeFfzO7gjRn4BkULg8/sfGgaVuVts8
         nWROvPfeJ4kIX9RTwd87mKHm2zMcvB1zXYuZBUUQZd5a+QC1EG/2q2YFp1t+y5sqxoti
         AS+qw/csBrLITUJWEUVsGLr2/K+6QEI2D6S/cpjlDmn6ti1MpnESILQbiGOyoRbdlAKU
         9K/6F3czLwQZ2aZ5LlF/HVkK6YehZdZFwSpyCe+mvWybGYB1dCgV2Cb45eyyulPJVClq
         fbqNjX5japamJCdEyigCTm5m0C3OYd0Lw9tzDtcHtWU7yI/Agg06J4n1sC0KUkTKy6JU
         00aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sdeVCqsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si40125471wmh.191.2019.01.25.02.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 02:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sdeVCqsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmzCa-0006lv-TW
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 05:59:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gmyo8-0003Il-Bd
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 05:33:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gmyo4-0001wa-PP
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 05:33:54 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gmyj7-0007Oa-AH; Fri, 25 Jan 2019 05:28:45 -0500
Received: by mail-wm1-x344.google.com with SMTP id m1so6229179wml.2;
	Fri, 25 Jan 2019 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vDArVQAvPeAMM3u3M+gVC02cdrapMSo8XNml2p0SWOw=;
	b=sdeVCqsfoK3kWjnBv+ZnFro0a1VjIIYJeD5Ixu2fx8FMkXW53OCQ1TxIu5kx4nvu6M
	d1JrchNsLDu1jlLLc73MPO/pxALVJnH1sBoROYC+k9ZG7GBRJ5nng/3Wl87cN8yqf6TA
	r4QQrwk3o3we/a2+FRpaXAfzFEIxtDngB6shBJuvsRAgvrotrClzuicBnBByF6E0hpUp
	ehbQk/aq/ihZBwqFITTPrn77qyu+NHVI2KT4LKT86vPo4HmQeKLm7w8JykgoCsk+geQS
	U6/iMUZLWbwWJKlwTv3vSv12Pq3sh55HoR/MHECfk/EowKNFuiP+ItyGqtUWluceU/eF
	8OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vDArVQAvPeAMM3u3M+gVC02cdrapMSo8XNml2p0SWOw=;
	b=eTKYxZaRFVXwSl0yaUdzrlpisvzTm/HEohOKtOEk6BvpQZGeLqyKmujXiQDj+Al0zK
	ugUNq5gL4ps4cQRXXm8RlRMq5lsuwdXvlqMuYrMEBxfwACMpgC1ZA7qc8zXTvLSWGcuE
	beXgTlJkQyPrvWYB0k8uaZkiNqYVvg8Vg+aX/AOARKAobMZZC6JhETKOCPvo8n6HVCO+
	EcCv4Bx7lg0cN3+EWfdtMgoVk4ofkTs4MI2nKPTCoItvr/b3FRJPpHi77ajsSRzr5u+4
	NmJDbMLjJTfz6hOlC23mTbPD9oXMY9ByeKI4HFhmzjjFqlDojR++qf0LB8apAyP5QXgp
	UmcA==
X-Gm-Message-State: AJcUukcvdGkDG4B8GbVxxDOQQKEmpPj2sXQBvwhmOn5vsAap2nHXQcFF
	KvPE/i8D07iuwKdfBUJpW8h2Uc6OmunpuA==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr6087016wmc.129.1548412123583; 
	Fri, 25 Jan 2019 02:28:43 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	x20sm87272406wme.6.2019.01.25.02.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Jan 2019 02:28:42 -0800 (PST)
Date: Fri, 25 Jan 2019 10:28:42 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190125102842.GB28305@stefanha-x1.localdomain>
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-3-stefanha@redhat.com>
	<f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <f58f9085-c895-1fa5-9fae-afe4ac8de39a@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/5] pflash: flush rom device
 memory region
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, jusual@mail.ru,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, jim@groklearning.com,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UkcX8a+8hUAs


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2019 at 12:11:55PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 1/23/19 10:22 PM, Stefan Hajnoczi wrote:
> > pflash devices should mark the memory region dirty and invalidate TBs
> > after directly writing to the RAM backing the ROM device.
> >=20
> > Note that pflash_cfi01_get_memory() is used by several machine types to
> > populate ROM contents directly.  Callers are untouched by this patch
> > because they only modify memory before the guest is started.
=2E..
> > @@ -763,6 +766,8 @@ static void pflash_cfi01_realize(DeviceState *dev, =
Error **errp)
> >              error_setg(errp, "failed to read the initial flash content=
");
> >              return;
> >          }
> > +
> > +        memory_region_flush_rom_device(&pfl->mem, 0, total_len);
>=20
> The device realize() is also executed before the guest is started, is
> this call really necessary?

My rationale was that machine init only happens before the guest is
started while ->realize() is called by hotplug too.

That said, can pflash devices be hotplugged?

If you guys prefer not flushing from pflash ->realize() then I'll drop
it.

Stefan

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcSuTaAAoJEJykq7OBq3PIVtgH/3jX/5SKfR95RxpxWSFIAMsV
e22lJdwugIsjiczcIJAKW8o3WjWh/2NVzmFN0rTtXYWUf1E5TJ8OAdv/OJ3/YDPB
/o/0mEVUrD73RodPdRsASZOIsuoB+Waoc7FK1+ea34dpt/d3c+k82GvW/I3s9yxq
zu7K/4REkOYNGw4PN58IK0xQpWDFQ1m6JizU1RbS9sdL+xAYgU5KQddkUGPOfPPO
6OlmC6aZYFNgLO2PCl34Mja0ii/p5FQuiRAYP5vQhRH3OXtN8kg1SqqCk8To4ceI
3eGe+sUaLVYYuVKNnnWekCVMKmuvyxr/im843ogBufzho7l6FKeeYXEWXFhFtvc=
=g+Wg
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
