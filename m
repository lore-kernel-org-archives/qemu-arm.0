Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dfb2d7e0sm12543885f8f.44.2024.12.03.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:56:05 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ADF915F89C;
	Tue,  3 Dec 2024 14:56:04 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Troy Lee
 <leetroy@gmail.com>,  Alistair Francis <alistair@alistair23.me>,  Peter
 Maydell <peter.maydell@linaro.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Jamin Lin <jamin_lin@aspeedtech.com>,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Steven Lee
 <steven_lee@aspeedtech.com>,  Niek Linnenbank <nieklinnenbank@gmail.com>,
  Joel Stanley <joel@jms.id.au>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
In-Reply-To: <20241128213729.1021961-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Thu, 28 Nov 2024 13:37:29 -0800")
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 14:56:04 +0000
Message-ID: <87mshcdddn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8+qI+Trhn3oD

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>
<snip>
> +
> +        self.vm.add_args('-accel', 'tcg')
> +        self.vm.add_args('-cpu', 'max,x-rme=3Don')

With debug on the PAC function are certainly very high in the perf
report. So pauth-impdef=3Don seems worthwhile here.

> +        self.vm.add_args('-m', '2G')
> +        self.vm.add_args('-M', 'sbsa-ref')
> +        self.vm.add_args('-drive', f'file=3D{pflash0},format=3Draw,if=3D=
pflash')
> +        self.vm.add_args('-drive', f'file=3D{pflash1},format=3Draw,if=3D=
pflash')
> +        self.vm.add_args('-drive', f'file=3Dfat:rw:{virtual},format=3Dra=
w')
> +        self.vm.add_args('-drive', f'format=3Draw,if=3Dnone,file=3D{driv=
e},id=3Dhd0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=3Dhd0')
> +        self.vm.add_args('-device', 'virtio-9p-pci,fsdev=3Dshr0,mount_ta=
g=3Dshr0')
> +        self.vm.add_args('-fsdev', f'local,security_model=3Dnone,path=3D=
{rme_stack},id=3Dshr0')
> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=3Dnet0')
> +        self.vm.add_args('-netdev', 'user,id=3Dnet0')
<snip>
> +
> +        self.vm.add_args('-accel', 'tcg')
> +        self.vm.add_args('-cpu', 'max,x-rme=3Don')

And here.

<snip>

With that the tests both pass with --enable-debug (312s, 352s) and the
profile looks like:

   6.33%  qemu-system-aar  qemu-system-aarch64                       [.] ar=
m_feature
   5.66%  qemu-system-aar  qemu-system-aarch64                       [.] tc=
g_flush_jmp_cache
   3.44%  qemu-system-aar  qemu-system-aarch64                       [.] re=
build_hflags_a64

This I suspect is triggered by assert_hflags_rebuild_correctly() which
is validating we've not skipped rebuilding the flags when we need to.
It's a lot easier than debugging why your execution trace looks weird.

   2.95%  qemu-system-aar  qemu-system-aarch64                       [.] ex=
tract64
   2.52%  qemu-system-aar  qemu-system-aarch64                       [.] ex=
tract64

This is usually triggered by translation code which uses extract64
heavily during instruction decode.

It might be useful to see if we can get functional tests run under TCG
to dump "info jit" at the end and ensure we are not over generating code
and exhausting the translation cache.

   2.12%  qemu-system-aar  qemu-system-aarch64                       [.] ar=
m_el_is_aa64
   2.11%  qemu-system-aar  qemu-system-aarch64                       [.] ar=
m_security_space_below_el3
   2.11%  qemu-system-aar  qemu-system-aarch64                       [.] de=
posit64
   1.49%  qemu-system-aar  qemu-system-aarch64                       [.] ar=
m_hcr_el2_eff_secstate
   1.46%  qemu-system-aar  qemu-system-aarch64                       [.] ar=
m_is_el2_enabled_secstate
   1.38%  qemu-system-aar  qemu-system-aarch64                       [.] ex=
tract32
   1.34%  qemu-system-aar  qemu-system-aarch64                       [.] ex=
tract64
   1.30%  qemu-system-aar  qemu-system-aarch64                       [.] ge=
t_phys_addr_lpae
   1.23%  qemu-system-aar  qemu-system-aarch64                       [.] aa=
64_va_parameters
   1.09%  qemu-system-aar  qemu-system-aarch64                       [.] ro=
l32
   1.07%  qemu-system-aar  qemu-system-aarch64                       [.] pr=
obe_access_internal
   1.02%  qemu-system-aar  qemu-system-aarch64                       [.] de=
posit32


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
