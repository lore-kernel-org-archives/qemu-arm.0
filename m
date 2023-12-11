Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm13905683wmq.43.2023.12.11.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:51:55 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9E39E5FBC6;
	Mon, 11 Dec 2023 16:51:54 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Radoslaw
 Biernacki <rad@semihalf.com>,  Paul Durrant <paul@xen.org>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Sriram Yagnaraman <sriram.yagnaraman@est.tech>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 01/10] tests/avocado: mips: fallback to HTTP given
 certificate expiration
In-Reply-To: <20231208190911.102879-2-crosa@redhat.com> (Cleber Rosa's message
	of "Fri, 8 Dec 2023 14:09:02 -0500")
References: <20231208190911.102879-1-crosa@redhat.com>
	<20231208190911.102879-2-crosa@redhat.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Mon, 11 Dec 2023 16:51:54 +0000
Message-ID: <878r60fzrp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tLzgOwbMPZU4

Cleber Rosa <crosa@redhat.com> writes:

> The SSL certificate installed at mipsdistros.mips.com has expired:
>
>  0 s:CN =3D mipsdistros.mips.com
>  i:C =3D US, O =3D Amazon, OU =3D Server CA 1B, CN =3D Amazon
>  a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
>  v:NotBefore: Dec 23 00:00:00 2019 GMT; NotAfter: Jan 23 12:00:00 2021 GMT
>
> Because this project has no control over that certificate and host,
> this falls back to plain HTTP instead.  The integrity of the
> downloaded files can be guaranteed by the existing hashes for those
> files (which are not modified here).
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
