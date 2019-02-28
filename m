Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a8sm5402843wmh.26.2019.02.28.02.53.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 02:53:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1EBE31FF80;
	Thu, 28 Feb 2019 10:53:41 +0000 (UTC)
References: <20181129185113.30353-1-stefanha@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu.ml@steffen-goertz.de, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, joel@jms.id.au, jusual@mail.ru, jim@groklearning.com
Subject: Re: [RFC v3] target/arm: add ARMv6-M UNDEFINED 32-bit instruction test
In-reply-to: <20181129185113.30353-1-stefanha@redhat.com>
Date: Thu, 28 Feb 2019 10:53:41 +0000
Message-ID: <87d0nckwui.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: axUogp98Arwb


Stefan Hajnoczi <stefanha@redhat.com> writes:

> Test that 32-bit instructions declared UNDEFINED in the ARMv6-M
> Reference Manual really do raise an exception.  Also test that the 6
> 32-bit instructions defined in the ARMv6-M Reference Manual do not raise
> an exception.
>
> The Intel HEX (.hex) file is included to save people the trouble of
> installing a cross-compiler toolchain.
>
> To run the test (make sure qemu-system-arm is in your $PATH):
>
>   $ cd tests/tcg/arm
>   $ make run-test-armv6m-undef
>
> Based-on: <20181029194519.15628-1-stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I'm snarfing this into my testing/enable-system-tcg-tests-v2 as I need a
few more example system tests ;-)

--
Alex Benn=C3=A9e
