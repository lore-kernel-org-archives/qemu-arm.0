Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3062238wru;
        Fri, 3 Aug 2018 03:32:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpft+MzdAu7bMPFtpNA0BNyYN5hG/wnNz+v5nmYyIHA8jbFbfZ1mjI+sP/JF/6KCMs7mwUCa
X-Received: by 2002:a37:15da:: with SMTP id 87-v6mr2996247qkv.67.1533292360550;
        Fri, 03 Aug 2018 03:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533292360; cv=none;
        d=google.com; s=arc-20160816;
        b=MMlSeGv0ku2Ap1HVlYxCbsJ8Ov7QJuU8tpn2S50p43HVSfIiJUT5FdN4tURPfz1qvG
         fp0t3GY1ENj0S2NCFrrDbGO81DpzcBHBlBtdP/Nf8s6PsAmIRGNEjnLPf3cbm/3nwmuA
         Qtywn1ZzHBXqRxVCCwI2e5abb2IkyeJYC/OHS0RZLBR5O68fATXV8DJqPkL9Y+a0AdfU
         Xe1KfAwfLJ5JyNcxBNpBmjwA1xOpANZuccJanmPjpqiwujllITqnyeDxTRkVP8Ap7NxA
         azWq604hchoPeo/3VGf8irbO7NRzpePRxPf42meaCq9+WMxGpCoYDQyETq/xNR3//ZLB
         efyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=hU8zKYROO6DIu/cMC/Jvej2jydTBaOAVw95o51a54SQ=;
        b=fVXxFFWzP0Ge/2inmUypigI9n8xLSSMstgWCepU3UQL7VtxK0ql9lKgDmB+GeWCtAc
         ZCcs2FP3MdK/fopAkuxurp0hPfE2tsQwO3tfOG0uI0/wY/SmiNR6PIc4eE97XdvMOhBz
         1iHr7O21I6E4XHxoo3v/zk4B9u2MyTSeQHOdcndgEaSoQk6Q7j6k+yt1NrQ9OeJbABKH
         02bfdP3sS1p+9N7QYm+QplAGm88TEKnopoSoUNMLaArZ7W6ENjQd/1Il7spKb4o4mh3P
         wlYu2hBDNbjQDTNWYxT/IuF/Ws6VaXAo9xLo8qu3t04de7c0Bx1JnWu5jIFqiHlmhzwV
         URGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aYZCOy43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o53-v6si2399157qtb.250.2018.08.03.03.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 03:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aYZCOy43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flXNw-0002Mw-3X
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 06:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1flXNi-0002MZ-Dv
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 06:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1flXNh-0004LL-Am
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 06:32:26 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:37748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1flXNa-00044C-2F; Fri, 03 Aug 2018 06:32:18 -0400
Received: by mail-wm0-x244.google.com with SMTP id n11-v6so5867264wmc.2;
	Fri, 03 Aug 2018 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hU8zKYROO6DIu/cMC/Jvej2jydTBaOAVw95o51a54SQ=;
	b=aYZCOy43if5KLcXuUR8+DwIdmGbfhLbitIDLLmBVcEOHtjXrzv/7d79N1doJTJRhjq
	X7DzuEOexLvoDrTIgSBGY5k2Y7KUx9QopXKfbUdC914D2HhGBhARwfUEuml8sRfp/DWK
	qtowY0gNPi5Iqb/2ogBAHe8CMRGc+yd2fvZw5FqUbnlaA++jmU5ovyiQHecacRHiCcIn
	ConRdQPwA98PJlRHTAPQmXjtlBepg8/SU9/pHc981wc7foPKDgybpiAeEBOTzxAWzuIY
	N26pIN0xrBhcVK2GV1Db4NDy3N6LqvPdw2lVuWbNOrIlwrWbGDWUydy6QYW5f3HLdC23
	Ds4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hU8zKYROO6DIu/cMC/Jvej2jydTBaOAVw95o51a54SQ=;
	b=qMb7LyLmomn70binO3jj1Y/f1TcoNb0JqZb+kPRx835SPo7SGyoBW1koTqlC4nKXbX
	lMmLw9cR1yLgWYYX8jgbP/VarEdkWMDjCVJ2gRwUuWtN7qmqlVbg/37ebTmGkJzvx+Te
	i9VSI83zKt/Sots3v/I6X7mQJaHj1Oke+VQw1L3qHGdevegbTnQSTcqpgwrxa1yRJ//L
	0Qz8Lb79go3VMB+cSO2tBOkA0ovkUIO52Ks/i/egtx95STXeHWXEvRN1H0FkJ+h7elG6
	cS69iyFSTfP5W4QLBqPlCEYQZIpKMywfeIt8nZFJdZM8E51nBx4OTqbtCP4ahmBL3BUR
	h9jw==
X-Gm-Message-State: AOUpUlEYRWffNTmR3FfKUwp4k6wL7gPnL1WUu0K1VxfVNbnzJ14I/gKW
	6niCrCW5izOZcfpMlUW4Hzw=
X-Received: by 2002:a1c:e455:: with SMTP id
	b82-v6mr4953768wmh.93.1533292336842; 
	Fri, 03 Aug 2018 03:32:16 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	w8-v6sm4707253wrp.72.2018.08.03.03.32.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 03:32:15 -0700 (PDT)
Date: Fri, 3 Aug 2018 11:32:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180803103214.GA14905@stefanha-x1.localdomain>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-7-stefanha@redhat.com>
	<CAFEAcA8m2f-DRiDNF0ry4nMH9bzZ1gODV4MTgtLwR5jTNdgeJA@mail.gmail.com>
	<20180802124345.GA25289@stefanha-x1.localdomain>
	<CAFEAcA9SHbSf8=UhS697fkTe9h2bBBoF66DVj04_i9t53YvOOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9SHbSf8=UhS697fkTe9h2bBBoF66DVj04_i9t53YvOOg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] loader: Implement .hex
 file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 589fEjUawTJy


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2018 at 11:04:46PM +0100, Peter Maydell wrote:
> On 2 August 2018 at 13:43, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > On Mon, Jul 30, 2018 at 07:01:53PM +0100, Peter Maydell wrote:
> >> I'm still not convinced we want to add another random
> >> special case only-works-on-one-architecture-and-some-boards
> >> feature to the -kernel command line option.
> >>
> >> Adding it to the "generic loader" device might be more plausible?
> >
> > I'm not sure I understand the purpose of the generic loader.
> >
> > As a user -kernel <myfile> is easier than -device
> > loader,file=3D<myfile>,cpu-num=3D1.
> >
> > Can you explain the advantage to moving hex file loading to the generic
> > loader?
>=20
> It means we have a command line option for loading hex files
> that works for every board and every CPU architecture.
> (Similarly, if you want a way to load an ELF file that
> works the same way for all boards and CPUs, the generic
> loader is it -- -kernel will not reliably do the job.
> You can also use it to load more than one ELF file or
> to load different ELF files for different CPUs, neither
> of which you can do with -kernel.)
>=20
> -kernel, like all our legacy short options, is, yes,
> easier to use; it's also a twisted mess of different
> "do what I mean" functionality that varies depending
> on the guest CPU architecture and subtype, the machine
> being emulated, and other random things like "did the
> user also tell us to start a BIOS image". It mostly means
> "run a Linux kernel", with some extras wedged in on the
> side where we thought we could do it without breaking the
> kernel case. Oh, and we don't document anywhere what
> it actually does. I'm reluctant to add yet another layer of
> "do what I mean" to it that only has an effect on a subset
> of Arm boards.

Okay, I understand better now.  Thanks!

I'll resend with the generic loader instead of -kernel.

Stefan

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbZC8uAAoJEJykq7OBq3PIPp8H/R2Aq4x/Mh26uXs8de8aeNBW
HW10uD3wk8SjsQ2Qde4pVPHOUeyPapOVkRgCzLp6ejGUWHT+QehY7EtKjUsoWapW
fY2+ZhY1Fa1AcGL6dC3aWUagcJoZ/tHGreIrfvEM/XqGZcT3LXeieh6vAqHreVA6
cIgZrN/KxPbWRKNv5h6IGAtxircw1wIoSRZTLwzSRmLgFFYM1+twSQp5aLmVshKn
PfnYQFQdz9KgwZaXeGuTSShOFKIiUhH8qqb4eeEytMwfVe6Vn2PtIpq8BKdswi8G
o7UgAtg2OYppmKcm4MxoqCGXl9z5ar0MdCpnrLDKrDadF2c47HZHcxSHGXBCkEI=
=xC8R
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
