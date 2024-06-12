Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c92901b05sm3656071a12.73.2024.06.12.12.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 12:37:40 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E44EA5F893;
	Wed, 12 Jun 2024 20:37:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Marcelo Tosatti <mtosatti@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Mark Burton <mburton@qti.qualcomm.com>,
  qemu-s390x@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  kvm@vger.kernel.org,  Laurent Vivier <lvivier@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  qemu-arm@nongnu.org,  Alexander
 Graf <agraf@csgraf.de>,  Nicholas Piggin <npiggin@gmail.com>,  Marco
 Liebel <mliebel@qti.qualcomm.com>,  Thomas Huth <thuth@redhat.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  qemu-ppc@nongnu.org,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Cameron Esfahani <dirty@apple.com>,  Jamie Iles
 <quic_jiles@quicinc.com>,  "Dr. David Alan Gilbert" <dave@treblig.org>,
  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 8/9] plugins: add time control API
In-Reply-To: <abe88b9b-621a-4956-877d-dd311a7fd58b@linaro.org> (Pierrick
	Bouvier's message of "Wed, 12 Jun 2024 08:56:12 -0700")
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
	<20240612153508.1532940-9-alex.bennee@linaro.org>
	<abe88b9b-621a-4956-877d-dd311a7fd58b@linaro.org>
Date: Wed, 12 Jun 2024 20:37:39 +0100
Message-ID: <87ikyevtoc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BAA732MFMGGa

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> Hi Alex,
>
> I noticed the new symbols lack QEMU_PLUGIN_API qualifier in
> include/qemu/qemu-plugin.h:
> - qemu_plugin_update_ns
> - qemu_plugin_request_time_control
>
> So it would be impossible to use those symbols on windows.
>
> I kept a reminder to send a new patch after you pulled this, but if we
> go to a new series, it could be as fast for you to just add this
> directly.

Sure if you send the patch I'll just merge it into the series.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
