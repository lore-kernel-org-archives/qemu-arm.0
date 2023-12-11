Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d48d0000000b0033616ea5a0fsm5974099wrs.45.2023.12.11.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:01:44 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B29E95FBC6;
	Mon, 11 Dec 2023 17:01:43 +0000 (GMT)
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
 <marcin.juszkiewicz@linaro.org>,  David Woodhouse <dwmw2@infradead.org>,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
In-Reply-To: <20231208190911.102879-4-crosa@redhat.com> (Cleber Rosa's message
	of "Fri, 8 Dec 2023 14:09:04 -0500")
References: <20231208190911.102879-1-crosa@redhat.com>
	<20231208190911.102879-4-crosa@redhat.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Mon, 11 Dec 2023 17:01:43 +0000
Message-ID: <8734w8fzbc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0cCWA5eHdu5w

Cleber Rosa <crosa@redhat.com> writes:

> Based on many runs, the average run time for these 4 tests is around
> 250 seconds, with 320 seconds being the ceiling.  In any way, the
> default 120 seconds timeout is inappropriate in my experience.

I would rather see these tests updated to fix:

 - Don't use such an old Fedora 31 image
 - Avoid updating image packages (when will RH stop serving them?)
 - The "test" is a fairly basic check of dmesg/sysfs output

I think building a buildroot image with the tools pre-installed (with
perhaps more testing) would be a better use of our limited test time.

FWIW the runtime on my machine is:

=E2=9E=9C  env QEMU_TEST_FLAKY_TESTS=3D1 ./pyvenv/bin/avocado run ./tests/a=
vocado/intel_iommu.py
JOB ID     : 5c582ccf274f3aee279c2208f969a7af8ceb9943
JOB LOG    : /home/alex/avocado/job-results/job-2023-12-11T16.53-5c582cc/jo=
b.log
 (1/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu: PASS (44=
.21 s)
 (2/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict: P=
ASS (78.60 s)
 (3/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_cm=
: PASS (65.57 s)
 (4/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt: PASS =
(66.63 s)
RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 255.43 s

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
