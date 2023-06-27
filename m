Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003fb9ebb6b88sm2749606wmj.39.2023.06.27.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:14:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 39A1E1FFBB;
	Tue, 27 Jun 2023 16:14:12 +0100 (BST)
References: <20230621203627.1808446-1-iii@linux.ibm.com>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 0/8] gdbstub: Add support for info proc mappings
Date: Tue, 27 Jun 2023 16:14:01 +0100
In-reply-to: <20230621203627.1808446-1-iii@linux.ibm.com>
Message-ID: <87h6qtym2j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: P/0WHT+IfDWz


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> v3: https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg01311.html
> v3 -> v4: Fix the 32-bit build (Alex).
>           Enable the test on all architectures and ignore certain
>           expected failures (Alex). I tried this with the latest
>           gdb-multiarch and it works. The only skip is on x86_64,
>           as expected.
>
> v2: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg06837.html
> v2 -> v3: Use openat() instead of safe_openat() (new patch: 2/8).
>           Add /proc/self/smaps emulation (new patch: 3/8).
>           With these 2 changes, the minor issues previously mentioned in
>           the patch 6/8 are gone.
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg02614.html
> v1 -> v2: Reword the 5/6 commit message (Dominik).
>           Add R-bs.
>           Patches that need review:
>           4/6 gdbstub: Add support for info proc mappings
>           6/6 tests/tcg: Add a test for info proc mappings
>
> Hi,
>
> this series partially implements the Host I/O feature of the GDB Remote
> Serial Protocol in order to make generate-core-file work with qemu-user.
> It borrows heavily from the abandoned patch by Dominik [1], hence 4/6
> carries the respective Co-developed-by: tag. I also peeked at
> gdbserver/hostio.cc quite a few times.

Queued to gdbstub/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
