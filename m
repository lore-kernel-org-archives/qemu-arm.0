Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf62058sm85144466b.56.2024.06.28.07.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:34:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8909A5F7A1;
	Fri, 28 Jun 2024 15:34:58 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Peter Xu
 <peterx@redhat.com>,  Mads Ynddal <mads@ynddal.dk>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Laurent Vivier <laurent@vivier.eu>,  Paolo Bonzini <pbonzini@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Alexandre
 Iooss
 <erdnaxe@crans.org>,  Stefan Hajnoczi <stefanha@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Michael S. Tsirkin
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Peter Xu <peterx@redhat.com>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 02/23] target/i386: fix gen_prepare_size_nz condition
In-Reply-To: <20240628124258.832466-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
	message of "Fri, 28 Jun 2024 13:42:37 +0100")
References: <20240628124258.832466-1-alex.bennee@linaro.org>
	<20240628124258.832466-3-alex.bennee@linaro.org>
Date: Fri, 28 Jun 2024 15:34:58 +0100
Message-ID: <87ikxtnnjh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Zk+iKhpSvUV

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Incorrect brace positions causes an unintended overflow on 32 bit
> builds and shenanigans result.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2413
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

This seems to trigger regressions in:

  qtest-x86_64/bios-tables-test
  qtest-x86_64/pxe-test
  qtest-x86_64/vmgenid-test

Could that be down to generated test data?

> ---
>  target/i386/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index ad1819815a..94f13541c3 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -877,7 +877,7 @@ static CCPrepare gen_prepare_sign_nz(TCGv src, MemOp =
size)
>          return (CCPrepare) { .cond =3D TCG_COND_LT, .reg =3D src };
>      } else {
>          return (CCPrepare) { .cond =3D TCG_COND_TSTNE, .reg =3D src,
> -                             .imm =3D 1ull << ((8 << size) - 1) };
> +                             .imm =3D (1ull << (8 << size)) - 1 };
>      }
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
