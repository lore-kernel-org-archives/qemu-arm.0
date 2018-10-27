Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e67-v6sm10996210wmd.41.2018.10.27.02.14.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Oct 2018 02:14:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8DDC23E00A3;
	Sat, 27 Oct 2018 10:14:47 +0100 (BST)
References: <20181025144644.15464-1-cota@braap.org> <20181025151103.GA19931@flamenco>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Chris
 Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
 Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>, Alexander Graf
 <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, Pavel
 Dovgalyuk <dovgaluk@ispras.ru>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>, Stafford
 Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck
 <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Michael Walle
 <michael@walle.cc>, qemu-ppc@nongnu.org, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Paolo Bonzini <pbonzini@redhat.com>, Aurelien
 Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-arm] [RFC v4 00/71] per-CPU locks
In-reply-to: <20181025151103.GA19931@flamenco>
Date: Sat, 27 Oct 2018 10:14:47 +0100
Message-ID: <878t2j21ko.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7+I6xZj5E+Rs


Emilio G. Cota <cota@braap.org> writes:

> [I forgot to add the cover letter to git send-email; here it is]
>
> v3: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04179.html
>
> "Why is this an RFC?" See v3 link above. Also, see comment at
> the bottom of this message regarding the last patch of this series.

I'm also seeing his hang on check-tcg, specifically qemu-aarch64 ./tests/li=
nux-test

<snip>

--
Alex Benn=C3=A9e
