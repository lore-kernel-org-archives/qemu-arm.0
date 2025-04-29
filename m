Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41ad27sm745439866b.5.2025.04.29.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:15:51 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 994485F863;
	Tue, 29 Apr 2025 10:15:50 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  kvm@vger.kernel.org,  Paolo Bonzini <pbonzini@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  qemu-arm@nongnu.org,
  anjo@rev.ng,
  richard.henderson@linaro.org
Subject: Re: [PATCH 01/13] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
In-Reply-To: <20250429050010.971128-2-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Mon, 28 Apr 2025 21:59:58 -0700")
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
	<20250429050010.971128-2-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 29 Apr 2025 10:15:50 +0100
Message-ID: <87selr49bt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JFO0XeWUgkkU

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> CPUARMState::pc is of type uint64_t.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
