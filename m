Received: by 10.25.159.19 with SMTP id i19csp2475993lfe;
        Wed, 10 Feb 2016 05:15:51 -0800 (PST)
X-Received: by 10.194.117.68 with SMTP id kc4mr39398353wjb.111.1455110151133;
        Wed, 10 Feb 2016 05:15:51 -0800 (PST)
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id h197si27705880wmd.118.2016.02.10.05.15.50;
        Wed, 10 Feb 2016 05:15:51 -0800 (PST)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u1ADFO0O032140;
	Wed, 10 Feb 2016 14:15:24 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 8D93270D;
	Wed, 10 Feb 2016 14:15:24 +0100 (CET)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        Anthony
 Green <green@moxielogic.com>,
        Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>,
        Blue Swirl
 <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
        Michael Walle
 <michael@walle.cc>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        "open
 list\:PowerPC" <qemu-ppc@nongnu.org>,
        "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Guan
 Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v6 3/4] tcg: Add type for vCPU pointers
References: <145505246212.4785.2237668256809452874.stgit@localhost>
	<145505248083.4785.7066950318146523490.stgit@localhost>
	<56BAAD86.3010007@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
	<ehabkost@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Stefan
	Hajnoczi <stefanha@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Alexander Graf
	<agraf@suse.de>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list\:ARM"
	<qemu-arm@nongnu.org>, "open list\:PowerPC" <qemu-ppc@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae
	<leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>, Jia
	Liu <proljc@gmail.com>
Date: Wed, 10 Feb 2016 14:15:24 +0100
In-Reply-To: <56BAAD86.3010007@twiddle.net> (Richard Henderson's message of
	"Wed, 10 Feb 2016 14:24:54 +1100")
Message-ID: <87d1s4emfn.fsf@fimbulvetr.bsc.es>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KNOG6yFDlQuM

Richard Henderson writes:

> On 02/10/2016 08:14 AM, Llu=C3=ADs Vilanova wrote:
>> Adds the 'TCGv_env' type for pointers to 'CPUArchState' objects. The
>> tracing infrastructure later needs to differentiate between regular
>> pointers and pointers to vCPUs.
>>=20
>> Also changes all targets to use the new 'TCGv_cpu' type instead of the
>> generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_env'
>> translates into 'TCGv_ptr'), but that could change in the future to
>> enforce the difference.

> I suppose.

> We won't be able distinguish TCGv_env from TCGv_ptr until env can be
> auto-converted to ptr.  Which I can't imagine happening without switching=
 to
> C++.

It's difficult to differenciate between TCGv_ptr and TCGv_env in "tcg/tcg-o=
p.h"
unless an explicit operation is added to perform casts or to get a TCGv_ptr=
 from
a TCGv_env+offset (e.g., add a tcg_gen_env_ld8u_i32 built on top of
tcg_gen_ld8u_i32). That is, unless QEMU switches to C++.

But types could be easily enforced in helper declarations, which can intern=
ally
cast to the pointer type.

As a side note, I've just spotted a typo in the commit message (TCGv_cpu ->
TCGv_env).


> I see your motivation in 4/4, so I guess this is fine.

> Acked-by: Richard Henderson <rth@twiddle.net>

Thanks,
  Lluis
