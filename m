Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fa2fsm13732798f8f.68.2024.10.02.05.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 05:18:56 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3A29F5F780;
	Wed,  2 Oct 2024 13:18:55 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Thomas Huth <thuth@redhat.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  Jason Wang <jasowang@redhat.com>,
  Aleksandar Rikalo <arikalo@gmail.com>,  Anton Johansson <anjo@rev.ng>,
  Peter Maydell <peter.maydell@linaro.org>,  Huacai Chen
 <chenhuacai@kernel.org>,  "Michael S. Tsirkin" <mst@redhat.com>,  Sven
 Schnelle <svens@stackframe.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  qemu-arm@nongnu.org,  Aurelien Jarno <aurelien@aurel32.net>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  Max Filippov <jcmvbkbc@gmail.com>,
  Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH 06/13] tests/tcg/plugins: Use the ld/st_endian_p() API
In-Reply-To: <20240930073450.33195-7-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 30 Sep 2024 09:34:43
 +0200")
References: <20240930073450.33195-1-philmd@linaro.org>
	<20240930073450.33195-7-philmd@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 02 Oct 2024 13:18:55 +0100
Message-ID: <87ttdun1e8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hHE1KVuaczzz

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Refactor to use the recently introduced ld/st_endian_p() API
> No logical change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
