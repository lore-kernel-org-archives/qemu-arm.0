Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm18701332wmb.9.2023.12.12.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 03:27:45 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 847E45F7D3;
	Tue, 12 Dec 2023 11:27:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Cleber Rosa <crosa@redhat.com>,  qemu-devel@nongnu.org,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Radoslaw Biernacki <rad@semihalf.com>,  Paul
 Durrant <paul@xen.org>,  Leif Lindholm <quic_llindhol@quicinc.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
  kvm@vger.kernel.org,  qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?=
 <philmd@linaro.org>,  Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  David Woodhouse <dwmw2@infradead.org>,
  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
In-Reply-To: <947ad8b2-14fe-456b-b914-6e1c86dc27e4@daynix.com> (Akihiko
	Odaki's message of "Tue, 12 Dec 2023 17:18:29 +0900")
References: <20231208190911.102879-1-crosa@redhat.com>
	<20231208190911.102879-4-crosa@redhat.com>
	<8734w8fzbc.fsf@draig.linaro.org>
	<947ad8b2-14fe-456b-b914-6e1c86dc27e4@daynix.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 12 Dec 2023 11:27:45 +0000
Message-ID: <877cljek3y.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2LDviX22eo1N

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/12/12 2:01, Alex Benn=C3=A9e wrote:
>> Cleber Rosa <crosa@redhat.com> writes:
>>=20
>>> Based on many runs, the average run time for these 4 tests is around
>>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>>> default 120 seconds timeout is inappropriate in my experience.
>> I would rather see these tests updated to fix:
>>   - Don't use such an old Fedora 31 image
>>   - Avoid updating image packages (when will RH stop serving them?)
>>   - The "test" is a fairly basic check of dmesg/sysfs output
>> I think building a buildroot image with the tools pre-installed
>> (with
>> perhaps more testing) would be a better use of our limited test time.
>
> That's what tests/avocado/netdev-ethtool.py does, but I don't like it
> much because building a buildroot image takes long and results in a
> somewhat big binary blob.
>
> I rather prefer to have some script that runs mkosi[1] to make an
> image; it downloads packages from distributor so it will take much
> less than using buildroot. The CI system can run the script and cache
> the image.

I'm all more smaller more directed test cases and I'm less worried about
exactly how things are built. I only use buildroot personally because
I'm familiar with it and it makes it easy to build testcases for
multiple architectures.

> [1] https://github.com/systemd/mkosi

If that works for you go for it ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
