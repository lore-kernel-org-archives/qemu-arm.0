Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l4-20020a1ced04000000b003fe61c33df5sm5579922wmh.3.2023.08.10.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:40:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 013151FFBB;
	Thu, 10 Aug 2023 17:40:10 +0100 (BST)
References: <20230810161329.7453-1-philmd@linaro.org>
User-agent: mu4e 1.11.13; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.2] target/arm/cpu: Allow logging disabled CPU
 features at UNIMP level
Date: Thu, 10 Aug 2023 17:39:27 +0100
In-reply-to: <20230810161329.7453-1-philmd@linaro.org>
Message-ID: <87edka3l7a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nQdbIT90rc3g


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Some CPU features aren't strictly required to run guest code (such
> debugging features), so we don't model them. To prevent the guest
> to access non-existent system registers, we disable the feature bit
> in the ID registers (see commit 7d8c283e10 "target/arm: Suppress more
> TCG unimplemented features in ID registers").
>
> Since it might be useful to know when a CPU supposed to implement a
> feature has it disabled in QEMU, provide the ability to log disabled
> features at the UNIMP level:
>
>   $ qemu-system-aarch64 -M virt -d unimp -S -cpu neoverse-v1
>   QEMU 8.0.92 monitor - type 'help' for more information
>   CPU#0: Disabling unimplemented feature 'FEAT_SPE (Statistical Profiling=
 Extension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Trace Macrocell system register=
 access' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Trace Macrocell system register=
 access' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Memory-mapped Trace' for
>   neoverse-v1

Don't these also depend on FEAT_?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
