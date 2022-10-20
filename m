Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b00230c9d427f9sm16294167wrs.53.2022.10.20.03.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 03:51:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 070E01FFB7;
	Thu, 20 Oct 2022 11:51:47 +0100 (BST)
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, John Snow
 <jsnow@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Date: Thu, 20 Oct 2022 11:51:41 +0100
In-reply-to: <20221020102012.3015662-1-peter.maydell@linaro.org>
Message-ID: <878rlaahtp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GQpaO0hth9j0


Peter Maydell <peter.maydell@linaro.org> writes:

> The avocado test
>  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_ini=
trd
> finishes wiith
>
>     exec_command(self, 'halt')
>     # Wait for VM to shut down gracefully
>     self.vm.wait()
>
> In theory this should be fine. In practice it runs into two bugs:
>
>  * when the test calls self.vm.wait() Avocado closes the socket
>    connection to the guest serial console immediately, so the
>    avocado logs don't have the last part of the guest output:
>    https://gitlab.com/qemu-project/qemu/-/issues/1265
>  * when the socket is closed, a bug in the QEMU socket chardev
>    means that it loses any data that the guest UART has not
>    yet consumed. This means that the guest doesn't always read
>    the full 'halt' command string, so the test intermittently
>    fails with a timeout:
>    https://gitlab.com/qemu-project/qemu/-/issues/1264
>
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
