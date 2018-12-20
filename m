Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h16sm17998226wrb.62.2018.12.20.03.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Dec 2018 03:17:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 5E2083E059D;
	Thu, 20 Dec 2018 11:17:13 +0000 (GMT)
References: <20181210152850.435-1-peter.maydell@linaro.org> <20181219183902.27273-1-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH] tests/tcg: add barrier test for ARM
In-reply-to: <20181219183902.27273-1-alex.bennee@linaro.org>
Date: Thu, 20 Dec 2018 11:17:13 +0000
Message-ID: <87efaca1mu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: K9W8/uu/jt6+


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This is a port of my kvm-unit-tests barrier test. A couple of things
> are done in a more user-space friendly way but the tests are the same.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>
> +
> +# Barrier tests need atomic definitions, steal QEMUs
> +barrier: CFLAGS+=3D-I$(SRC_PATH)/include/qemu

Hmm that should be:

modified   tests/tcg/arm/Makefile.target
@@ -10,7 +10,7 @@ VPATH                 +=3D $(ARM_SRC)

 ARM_TESTS=3Dhello-arm test-arm-iwmmxt

-TESTS +=3D $(ARM_TESTS) fcvt
+TESTS +=3D $(ARM_TESTS) fcvt barrier

 hello-arm: CFLAGS+=3D-marm -ffreestanding
 hello-arm: LDFLAGS+=3D-nostdlib
@@ -30,3 +30,7 @@ endif

 # On ARM Linux only supports 4k pages
 EXTRA_RUNS+=3Drun-test-mmap-4096
+
+# Barrier tests need aqrel
+barrier: CFLAGS+=3D-march=3Darmv8-a
+barrier: LDFLAGS+=3D-lpthread


--
Alex Benn=C3=A9e
