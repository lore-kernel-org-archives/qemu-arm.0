Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp951714wru;
        Wed, 15 Aug 2018 10:53:56 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyqJQGgAqOaDBhNFmBgAXbQqgtQqBtrqCJnwjne+GI1Qhvdcq2102TGepespA/nMz5+OKL4
X-Received: by 2002:a0c:b40c:: with SMTP id u12-v6mr24298334qve.58.1534355636071;
        Wed, 15 Aug 2018 10:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534355636; cv=none;
        d=google.com; s=arc-20160816;
        b=tV+k+eVEJ/3DxEt6cZS7ck0hN66CRgmx/xv0Jc3qA9lNNzOc7P/mHzHCs/DN3hxHE5
         yjn/uVOh5MR7FVxyaPGIHxHlJKw15qYFlldwf1EWQY7xLW3M3RHbEPhlP5X2tYSgSfz7
         MAEqF2+4tR3Xm5PD05LNpKHkllZ7twIGfJRK/beaywMDGpkrMyITwwo4++2gNwHvIe8a
         rlGV9s+AGez5sEoGoGs1sgTikPz5L9AS7grmhsnSJYkvbOOmYuUTEH94N+2VPrg/FPYc
         /y1h5UVGGftNZDTCri+vyvV3c2Wxeq/5jsmX1atgx+IbvpYhF1bN44ZtUPOBZ8A4lv2A
         /+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:arc-authentication-results;
        bh=IEzy1OhL1fo9EjwCiVCgS+fWFVZnWlvqAfATXYN/Gfs=;
        b=LHox3gI+QmS1D7FO9x48PPA9+hu8U+iar+pzWFSmhY0L61u40mjZnvSI/e4HYW6YNm
         PjRhWD1AaA/caFEkyxCzSh5XJEjPGL0xjc2ogQXwETwNf6O465VRdiFDmRIKupVB33I4
         9ArAx2qnm6xaIDdM1WOuFQ0vk67aY9OyaJnojRxC0EXNaxvv/FePV+lv0f4jXrVDoX+W
         2VHJvmyi6P7vp/tOAZ4L+AbTkI0Xpv4sdWQEfUQFowCckoi5Ebah/4bdwk6VnB7p7xkT
         Geubm1aZ/knhd8AOQdYJuFXJg5dUr4ipV0TlZoVS4guVJF42AiFfUEYmQIrAgHw/gqei
         tgMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWVPQhwv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v39-v6si1268249qtj.354.2018.08.15.10.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 10:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWVPQhwv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpzzX-0005gJ-Ky
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 13:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fpzyW-0005NC-Kt
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 13:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fpzyU-0007Qp-Os
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 13:52:52 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:39377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fpzyU-0007Oz-Gy; Wed, 15 Aug 2018 13:52:50 -0400
Received: by mail-wm0-x241.google.com with SMTP id q8-v6so2044394wmq.4;
	Wed, 15 Aug 2018 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IEzy1OhL1fo9EjwCiVCgS+fWFVZnWlvqAfATXYN/Gfs=;
	b=sWVPQhwvreb31kNiZa7lhAIF/ADgf0RcWZ4D6zIaAw5D6badc3VOi70kctX0ELzXPn
	BmNEKviAGyle1pIK6AQ980cAEk809FrVHTpa6BnoxVDyI8l+hTaTdLs0hxdMQ7AXqLj8
	CrYD04ZhkhYZYNjzPLRipYlsFVM7vndzflJgi9F1ZiPduhSl+SLXV7O77AHwbqwSjhcH
	RTYaF5UVxiCX34VRB6PjWNsUUxgqNnFymT0Bgm97Y1UVlolBjeKe0h5jHP8PeB4jAmhs
	owff8x6vTKmLPALgLj//+q+ckEQEn+qw9Aj6M5/IgKrFLkAhiV6CXAmUXclQNPhGRgEi
	vrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IEzy1OhL1fo9EjwCiVCgS+fWFVZnWlvqAfATXYN/Gfs=;
	b=abIHXaRD83lluY/htKYj1GQs2EGfu01brLDqR3v6EmYZRvKlLiXqabUEc+pppyMVNl
	9u1N2trsJkqR12pL0UwPYnHbCpUj9oIRkPPB4s+BKkc4iORCnUIPl6herxW7EfNQNpbO
	WOhOKB1nsVVnuZFRL3ujbNckz1qtJLbfGCaf5o099t0r2fLTpdDfJRMwd5GlFyoGEWiL
	zS9furCypQOlYXeDSKVqZc3K77DzmF8aA00M9x2wBNjxYjitE3vyqxbh7stNNox1g0Xy
	9CdMzByheaFzHSy0D0UhvujeUARG8w02NJDUAF9tqt8P1JBrFO7tIiBpZd3TVSKHcx4O
	MCgg==
X-Gm-Message-State: AOUpUlERG7H6jG63ZwQ9RB0iqJtRQEjWP9xl+ypf3j8FiqxCBEdFtmfC
	zqeg4CW/wc/zcqbJViqyz8x+hEq256xl4YdesXA=
X-Received: by 2002:a1c:984d:: with SMTP id
	a74-v6mr6747541wme.73.1534355567791; 
	Wed, 15 Aug 2018 10:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
	<1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
	<20180813155622.GA18429@stefanha-x1.localdomain>
	<ba150247-7c07-b7fd-f1e8-0c07b5358999@amsat.org>
In-Reply-To: <ba150247-7c07-b7fd-f1e8-0c07b5358999@amsat.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 15 Aug 2018 18:52:36 +0100
Message-ID: <CAJSP0QX-YkpS_RMj2VtP34kBATtq+_dUM0p_y5FvjvNxZBGDPQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex
 file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <qemu.ml@steffen-goertz.de>,
	=?UTF-8?B?6IuP6Iiq?= <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ca5mXfTpCE2

On Wed, Aug 15, 2018 at 3:18 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 08/13/2018 12:56 PM, Stefan Hajnoczi wrote:
> > On Fri, Aug 10, 2018 at 02:00:44AM -0300, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> >>> +        parser->rom_start_address =3D parser->next_address_to_write;
> >>> +        parser->current_rom_index =3D 0;
> >>> +        break;
> >>> +
> >>> +    case START_SEG_ADDR_RECORD:
> >>> +        if (line->byte_count !=3D 4 && line->address !=3D 0) {
> >>> +            return -1;
> >>> +        }
> >>> +
> >>> +        /* x86 16-bit CS:IP segmented addressing */
> >>> +        *(parser->start_addr) =3D (((line->data[0] << 8) | line->dat=
a[1]) << 4) |
> >>> +                                (line->data[2] << 8) | line->data[3]=
;
> >>
> >> Can you add a qtest for this case?
> >> For the HEX loader I understand the specs as this is the same parsing =
as
> >> the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
> >> data[1] shifts.
> >
> > x86 real-mode CS:IP addressing means (CS << 4) + IP.  It produces 24-bi=
t
> > addresses on 80286 and later.  This is not the same as
> > START_LINEAR_ADDR_RECORD.
>
> OK!
>
> >
> > GNU bfd implements it as follows:
> >
> >   abfd->start_address +=3D (HEX4 (buf) << 4) + HEX4 (buf + 4);
>
> Hmm any idea why they use +4 ?

buf is char* and HEX4("0123") produces 0x0123.  So this line evaluates
ASCII hex input buf=3D"XXXXYYYY" to (0xXXXX << 4) + 0xYYYY.
