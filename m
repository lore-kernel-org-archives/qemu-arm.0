Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1226621wrq;
        Wed, 6 Jun 2018 12:43:25 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKlSw5T9I00zeW0DFD6Hw9tXIHlyxMzr9AZChSCHCeRnxJF10IHF3ix7Xd5BMwv/n++p8kM
X-Received: by 2002:ac8:3da:: with SMTP id z26-v6mr4290622qtg.260.1528314205288;
        Wed, 06 Jun 2018 12:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528314205; cv=none;
        d=google.com; s=arc-20160816;
        b=Fh7UOh3h3clSoNTlSTPcernsYhzYn9a05rAdMuyC0rJ4zAoYK9EyhQKIBER5q3lXNX
         vISb+PDc2CfaVzVrlPasxxbKitwh3rr/jCxgvXkHS60kf1BZlhDybNy7OZqQwYNOPjkY
         KicaJhrAaRCZ5lxxKqmrlxuzvN2oQpouAx/b4S7QKliLw5bQeqeKpzqVHhB57td9GoGd
         hUGWi2wh2zyf4oJKH3HYq05gboZOLRCZhhhRPj3vdjRVmd59Ujr75AEwNSiiONJJaTV9
         ufGFQ7/iQdrShBCRg0iyUbmISyzjQQmihO5nRza90QTNG9cttMhLZWm2bv5z9ySpG1RY
         Rz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=DER/k501EEq/OCjUkjrz1DbRR/a17IHgkKPtRCZ+jag=;
        b=WwYKbqDnu+5Ydyblzq1VTDVxI+UDHQ7UpOmepGLVm+luyUs4aRcRp3aoneW+ImHa+U
         bdmJH0wuaSlo0IovbowhYYHlgcfrLgslYsjtgRqImoh3CeNbox2buFAkR3cboykcCCXg
         dSY+y1Vc9QfPX3NYUMdTvSlHXbzciiebrgxh9sjvSzjJMPgMTonZjRr1FcJbXsS21guX
         o7nEAceOc1qNreJwLY0Cpsf1TQCDwSl8IYjUSc6VVB0lBjUizq+UHYf1yxatgo3rrZ5y
         tkjCoKvqgfXnIXpfmZIp5NN5JxvIb0CuGfXrFzqCdFaHwM1cRCQHIDPwHdc14JahtVyz
         lTbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q53-v6si3516044qte.271.2018.06.06.12.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 12:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQeL6-0000FO-OF
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 15:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fQeKt-0000Dk-QS
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 15:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fQeKp-0002i5-SV
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 15:43:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55836 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1fQeKp-0002hg-Mh; Wed, 06 Jun 2018 15:43:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C37AB88844;
	Wed,  6 Jun 2018 19:43:06 +0000 (UTC)
Received: from [10.18.17.177] (dhcp-17-177.bos.redhat.com [10.18.17.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC06A1134CA4;
	Wed,  6 Jun 2018 19:43:04 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>
References: <20180606152128.449-1-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	xsFNBFTKefwBEAChvwqYC6saTzawbih87LqBYq0d5A8jXYXaiFMV/EvMSDqqY4EY6whXliNO
	IYzhgrPEe7ZmPxbCSe4iMykjhwMh5byIHDoPGDU+FsQty2KXuoxto+ZdrP9gymAgmyqdk3aV
	vzzmCa3cOppcqKvA0Kqr10UeX/z4OMVV390V+DVWUvzXpda45/Sxup57pk+hyY52wxxjIqef
	rj8u5BN93s5uCVTus0oiVA6W+iXYzTvVDStMFVqnTxSxlpZoH5RGKvmoWV3uutByQyBPHW2U
	1Y6n6iEZ9MlP3hcDqlo0S8jeP03HaD4gOqCuqLceWF5+2WyHzNfylpNMFVi+Hp0H/nSDtCvQ
	ua7j+6Pt7q5rvqgHvRipkDDVsjqwasuNc3wyoHexrBeLU/iJBuDld5iLy+dHXoYMB3HmjMxj
	3K5/8XhGrDx6BDFeO3HIpi3u2z1jniB7RtyVEtdupED6lqsDj0oSz9NxaOFZrS3Jf6z/kHIf
	h42mM9Sx7+s4c07N2LieUxcfqhFTaa/voRibF4cmkBVUhOD1AKXNfhEsTvmcz9NbUchCkcvA
	T9119CrsxfVsE7bXiGvdXnzyGLXdsoosjzwacKdOrVaDmN3Uy+SHiQXo6TlkSdV0XH2PUxTM
	LsBFIO9qXO43Ai6J6iPAP/01l8fuZfpJE0/L/c25yyaND7xA3wARAQABzSpKb2huIFNub3cg
	KEpvaG4gSHVzdG9uKSA8anNub3dAcmVkaGF0LmNvbT7CwX0EEwECACcCGwMCHgECF4AFCwkI
	BwMFFQoJCAsFFgIDAQAFAlid5ikFCQeV0y0ACgkQiKkGTRg1YesAOw/8DLxVyLbPecXUbxLs
	+TRhmkoxO5UHReTvmMefyBJxflKSNQQEV49rw0aQe5S4cfOh97K5XHMh2O3tJZS3+zwrRxaK
	ZMdQrfeJ20acsOKkYuFYKCZuib4tAClf/lk/uF6TVdyDeY1AWf9lXWfwLnBetNpHVqY0C312
	K9FC/l42+QEyDXHa2l0j0re1B1D8zScS5tHt9vj43t/VJTjJWHrlE3IAde6mNvM/wbvuFfYG
	SuaxpRRbFuIDUVW9DinUGtawjtkvttTWUe4+XCtT5u48P4QXvtlgNlc8eEL4+SL3ABB8oepE
	2J2LcMDn6QG7o3pKIqJrKvmKKH5BHzi02c0b+u0BrzsNhNSlxUB0cpHyfzlFpJGlaxdsvwC7
	CQ85KMaCB8WsQIgwgFHRldCszr9LXU52V8Tib1tnxgvwBVDYaDQEWjTZB1725FooHuRJaCVU
	+lthkjYoileOG0sNzTPHMXSTsKrNK9aVjg3Cs+D2hU2xi9BlG0Nzf4FqcHVxJg3tOI2f/EeR
	Dc9UB88GH3yPLouCshz6tG3ftimTtpf5FH0IRTSupmBO3n2JnReyIJcYbmYgo1PucmDWQVgc
	t+bXdgvRY8QB5EbTO1Etn5CXk3be0iUY7OE4XPRWbnEY8d9m6E4U/p083sW1kdki935XML17
	WSHh0ChaSX07jREm3qTOwU0EVMp5/AEQAMG4T+OQRHf8wDAT1dnZNlsCMCkUilCxJT95F6XL
	og1mEKG91Dg1FKgpTvt2l1UZ3WjZmV/Vm8xmHsVaN+Y/glQQhq9w5VPAC/aadykN0iYoVnA3
	ndS0plH/LUvtdHepnRsQ6oJ3fzllNteIrL4YFmbWRjDP14+3MeaRESIj/o6ruz09XIm3H3BC
	oT42HcldUJy7SjRq04P1DCmi/qpFgVCP/LgaGtBy7DR+t217EbTQBvMOqhu4ornmGVCFynOC
	ByDVILqmECVXUnvrvG9jeVzYQ0hFIXZahWK2ib1+nU48TE1uZc1Rtio87XxK0TUlJrtoHs28
	NfwldM7Z4jigwO5pEIulCFA0YeC8UZuZn5Xyogsg0C+j/48RwcRb/rCII7i63zYSAtad8/a7
	wofonQFSYLR7WJfKehgFaxfuMUFds2R+ObYJh6NvkibCz412bVlbFgDaXqV53rMmm1rTQFeK
	kAe/0nwu+82cLFV9DjmNkHPoqIZl6PFOw4F1Q4Jf0f+UIH55b9P96znTLemT8uSya/A/SyZn
	D9Eb1/fI8qATn9OkPULRMCbDSwjgqNiyjS+9QzY2a51xMI1B+ugl4kVw2wyqa7e9QYkk4rZB
	YRhlPPFwra6fEfcgK1z3+DDfsDWAY30+ytvYFk88bfQ2ECLxH+vaGQ+Weah2BqdN9RPdABEB
	AAHCwWUEGAECAA8CGwwFAlTKiksFCQPCd00ACgkQiKkGTRg1YessJA//TdJTJDK/G+oBOo2I
	niVnVKeBrd3WbKRKZFyRV2lsxulMs8VTdq+FwXwkHox9W/8aJcPWgGmd5VG3axky9w74XPLP
	Z17r/N55/PZF93bcBjXlaR9Y6W6UFkfkZYaKsaxL6AYx4haydW+Zfb4dubhgKXkdKlfdM8lp
	TRzQVfssj/l9DEwbHweQZPCECZG7qrUoQmMCqiKkDMajxfwR9MYxVvRE3+Cnm6UlUZ30FFy8
	fok9CzgsWKmConTrz3+84yMCnW88oG15tCgfsqmmGByNqITD73XeFmE2hI1DSAUJo0jB4urq
	8mw+muq2+cPxhrJu5RvvUDaMstFCh4AWID5O11s5rDunn2ZTAFUI5AbGfQwG8a8flVie3cQm
	TqRcS8jlCKCI0eBVQICRW9n7CJezb6dguoao7MDwJEaLtp8BCnHYctx+/5TxnIMgKOuXKGce
	Vck/xfu8poWzaPUEnqwCR80N2ZFhXoyc9M6VJ0bNNH7vmshSmcs+0OAeVgkOPiDDyROaphWX
	oI5/IhU3QJ7z95f3PU5sFRjs0anR9qXAzDFrYnMXhZZ3Cr+rAJgXYcoF2O6p26j2Ge8ckYPz
	ssv8YkXne7L8YZq8UEV/juy9WNG0B87YtiKK+m1Gl8YLGOo36tGJBaL8ZHFNxmwhBR4yulcM
	xwh+WlGQdSwtPFpMf7LCwWUEGAECAA8CGwwFAlid5kgFCQeV00wACgkQiKkGTRg1YesKXg//
	VY/yAWFlhQulEDYWagbOnok+gl57C5GH8p6s41mZsir4zN3wUE7KAYSV7O9rCXZQothIwG0u
	bpssiFqKStjcykf0Mac/3x8GSZyciu6rXi+3+bGlOH0kJI/qJ1nUCQ1vwjVcqYYscQRw7zhK
	DtivZAk4dCHNE5WDWyVvZh3Sw7EIEvXFLDPdWlAPL6BleI2LI/LJcA3biiJFGVvXhYh75e1N
	R+cVyi11URVxnWjRL9QcXvM/srVzi1+YWIP8c/6ftgq/vicjovNvF5E34Rj2IW/fCKyU4ma0
	0HOlXaCO4H2ngZuyRpOYPXVt/Iohvzu8daKVRotOnCE1LsJ4MLN2Oi76Rw9UXHLCJ7eqw3A9
	MhGOuRSgA5d/8rn3iy8SvhIIPJDCJDFwCwSX5i3E+AyH21Qf4Go3cz427PgE0HotDi2GEH8a
	nxH/tkXn4i+sG9gyJGCzKobXi1g2xCWdrMBkbl0J6HfdOG3IDIrVDO3LgUp2J3oZT9NlYewP
	d5wOERgtgqY8XvqXNpDv9c/FgPnfrmD4A1wlUtbCr+UukOD0Ky3iW/0Ij2DJlw+KUFCKxwWh
	EmSAxTi2NAg5f5e5A5d/clCwVeB3DXes5H6tdez4f/ai1eAB+FtItxT37i2KpUvUAdic37Io
	NRhibLIrSP2g5nqXONyQrFxb1HtVaoR+Nrk=
Message-ID: <b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
Date: Wed, 6 Jun 2018 15:43:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 06 Jun 2018 19:43:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 06 Jun 2018 19:43:06 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jsnow@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/11] misc: Add trailing '\n'
 to qemu_log() calls
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zuiW0kOSMUAk



On 06/06/2018 11:21 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Nothing very exciting here.
> I sometimes miss to notice some trace events, running with -d unimp,tra=
ce...
> then using 'grep ^...'. This is only due to a missing '\n' :)
>=20

so error_setg must be used WITHOUT \n and logging must happen with \n?

If we're sure that's the way we want to have things laid out, we really
ought to augment checkpatch to catch this -- because there's 0% chance
that we'll keep it straight on our own otherwise.

--js

> Philippe Mathieu-Daud=C3=A9 (11):
>   hw/sd/milkymist-memcard: Add trailing '\n' to qemu_log() call
>   hw/digic: Add trailing '\n' to qemu_log() calls
>   xilinx-dp: Add trailing '\n' to qemu_log() call
>   ppc/pnv: Add trailing '\n' to qemu_log() calls
>   hw/core/register: Add trailing '\n' to qemu_log() call
>   hw/mips/boston: Add trailing '\n' to qemu_log() calls
>   stellaris: Add trailing '\n' to qemu_log() calls
>   target/arm: Add trailing '\n' to qemu_log() calls
>   target/m68k: Add trailing '\n' to qemu_log() call
>   RISC-V: Add trailing '\n' to qemu_log() calls
>   RFC target/xtensa: Add trailing '\n' to qemu_log() calls
>=20
>  hw/arm/stellaris.c        | 11 ++++++-----
>  hw/char/digic-uart.c      |  4 ++--
>  hw/core/register.c        |  2 +-
>  hw/display/xlnx_dp.c      |  4 +++-
>  hw/mips/boston.c          |  8 ++++----
>  hw/ppc/pnv_core.c         |  4 ++--
>  hw/sd/milkymist-memcard.c |  2 +-
>  hw/timer/digic-timer.c    |  4 ++--
>  target/arm/helper.c       |  4 ++--
>  target/m68k/translate.c   |  2 +-
>  target/riscv/op_helper.c  |  6 ++++--
>  target/xtensa/translate.c |  6 +++---
>  12 files changed, 31 insertions(+), 26 deletions(-)
>=20
