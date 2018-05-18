Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp717584wme;
        Thu, 17 May 2018 20:45:51 -0700 (PDT)
X-Received: by 2002:a37:dd85:: with SMTP id u5-v6mr7120737qku.376.1526615151655;
        Thu, 17 May 2018 20:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526615151; cv=none;
        d=google.com; s=arc-20160816;
        b=sFDDx2bYr1c/dHxN53fP4N+A1PScVq3SAKg04plK0N3HkfduJcu5B5hQi4BsUphqF8
         PB+nSFs08D5UC0nIm5wxI4lE1RelSCSLjtTqrPkkWpqM73xTNb+NhgkBzbXcaC9gM/2f
         14xRJUTnTAEwAPhF6Bh4o3fkjjY8g8fBGCl6j382kOtSstz15TYzwN+DLqlUREBOFqoU
         vsFCsSueXnuOQ/spnmD4nMDN1psK0jmeZYUdGkAExXo3GTdcgDZTHNgv2bDjcj/Acnmm
         f8grY+gtWT/a/1DVfj5BWjjVvdk0x4SIMW9+9+oR0oGBjMkOl4aJLoRQNQTC6CKML1KI
         M8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:openpgp:from
         :references:cc:to:subject:sender:dkim-signature
         :arc-authentication-results;
        bh=yuv/FgxuFyaDZb3aNtoaoQnspLNuFUCyTqez1NoWqDo=;
        b=r9T8JkN21qXq83kQSWq1AfaL0ZporzA+Y6VeyxA+P0NdPgA1evwNVwUERgB9mGq8pQ
         nBaUT2/QfRiuvRQYh/Fg5Ci1UksZhvYdxw+WGj2b3B7RWmR7329CaHYVNF6BPEjpKo44
         ozRJvC3c4IjfsYiaWJl3lWIOofWlosPpMdODC8tRkxkC0YIsWmz+0J3faR+MQkmiJIsa
         mDAU88yAZvbCF+mBYxClrtKpHDdqi8dsIzr4UkKp0BCImVbw3uzqvfVT+qXRgvLlCBOX
         6ff/EO7UGJPjoAqXiCOzGawMavnu5Fz0evoMhLDj5gtZNyBdcegZHi9XSts92LqJ0pdx
         zliw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gNBMwOsN;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v89-v6sor5425215qte.37.2018.05.17.20.45.51
        (Google Transport Security);
        Thu, 17 May 2018 20:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gNBMwOsN;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=yuv/FgxuFyaDZb3aNtoaoQnspLNuFUCyTqez1NoWqDo=;
        b=gNBMwOsNqm0nN12YuIj1HHZWTllNE6alDPgTMBi+rZDSelOWv+fsoF3eBpMvOVDp5h
         IPLCln3i7T2szLuPuvLTj4SfOAnzhDFdL8b+0MXG5feVGaRmpWnJPmR4jiAduzGFWBPZ
         xHtuAPs2UMSdIBK4FRKCsQ7Z/JZpTmSOK6KGQ7WG55ADRida2R93rU9mo7lDp20G1xLF
         1+bvplUxa45JVVDYVOHH3K3EGFX3M6j5yMWfYDadpUmgBjIB0cckBIyTcdpP22+jkzXf
         dRj4WoIDRT+LiYvuDB2x7DEG5AzgeUlG+0iPqypZPFsLkoGyLopOewRqUkezvHiA1lWl
         A8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=yuv/FgxuFyaDZb3aNtoaoQnspLNuFUCyTqez1NoWqDo=;
        b=pcvyNul9y7qOPtXroaeqHN5H4mi/ASZLu9vKjx30EJ0EIEH1S8Mw84sGN3dU38mKyo
         7aseElC2DBpmM6V9Quz7AxRZMHdyKrnHh3sjliH8uIuYLc22EjkCVVYlpABI6anlISSu
         5GxRLSGodAcja7QSNegiRFWbaTx2YPLXk2HaJ0MVoh7LmBQ+VR0ApxCgLHLJX/xwjMhW
         zJPfXnRWygKkbxqaTVJFUgwIiLyWqJBCAJLt24s5SXdEIdoThYKT62JmmDsldL8P6ZJc
         F/VC3A8ultWq8F3VqK7hdWaDe3cDGBfWn0A09baZ8XA4niLX2JW5IUgKH2SFba1YRRRD
         mqSw==
X-Gm-Message-State: ALKqPwfhQO469deMxEARNILNcubmYRtyZTJlTRc1d+aArtjxFSQXMcM/
	g8KqwJX/ZfGIhHS3gvL8ERU=
X-Google-Smtp-Source: AB8JxZpj1sytWI1wnSJcRcTV2x1WA3oh792Obub3VKvo3XoPrax0nyMXdbOsVpxkU590z7L59M297Q==
X-Received: by 2002:ac8:3f72:: with SMTP id w47-v6mr7765674qtk.318.1526615151232;
        Thu, 17 May 2018 20:45:51 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id l8-v6sm5061080qtb.82.2018.05.17.20.45.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 20:45:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 32/49] tests/tcg/arm: add fcvt test cases for
 AArch32/64
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-33-alex.bennee@linaro.org>
 <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <927cd32b-6de1-3702-5125-e682fb2ffcd4@amsat.org>
Date: Fri, 18 May 2018 00:45:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="hFC4m1Pc39Av3iyTIbFBdDm2YVwE7IOtY"
X-TUID: yK1m78Xyqyv+

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hFC4m1Pc39Av3iyTIbFBdDm2YVwE7IOtY
Content-Type: multipart/mixed; boundary="KtpWTJYOgMB0ktiD3gyKqWDTwO0YO6HJC";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
Message-ID: <927cd32b-6de1-3702-5125-e682fb2ffcd4@amsat.org>
Subject: Re: [PATCH v4 32/49] tests/tcg/arm: add fcvt test cases for
 AArch32/64
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-33-alex.bennee@linaro.org>
 <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>
In-Reply-To: <9ef2bc85-cead-080c-8313-bf0113d5019e@linaro.org>

--KtpWTJYOgMB0ktiD3gyKqWDTwO0YO6HJC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/17/2018 05:30 PM, Richard Henderson wrote:
> On 05/17/2018 10:47 AM, Alex Benn=C3=A9e wrote:
>> This runs through the usual float to float conversions and crucially
>> also runs with ARM Alternative Half Precision Format.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> [rth: tweak vcvtb.f16.f32/vctb.f32.f16 code and regen]
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> ---
>> v4
>>   - add fcvt.ref and check results against it
>>   - fix single_to_half, single_to_double conversions
>>   - properly toggle AHP mode (fpsr->fpcr)
>>   - more values around the AHP margins
>>   - add INF/NAN/SNAN inputs
>>   - build for ARM and AArch64
>>   - fix bug for hex literals
>>   - add float-to-int
>>   - checkpatch fix
>> ---
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks Richard, I was not very motivated to review each line of the
fcvt.ref files =3D)

> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.tar=
get
> index 9d2b551732..7bb777f442 100644
> --- a/tests/tcg/arm/Makefile.target
> +++ b/tests/tcg/arm/Makefile.target
> @@ -8,7 +8,9 @@ ARM_SRC=3D$(SRC_PATH)/tests/tcg/arm
>  # Set search path for all sources
>  VPATH 		+=3D $(ARM_SRC)
>
> -TESTS +=3D hello-arm test-arm-iwmmxt
> +ARM_TESTS=3Dhello-arm test-arm-iwmmxt
> +
> +TESTS +=3D $(ARM_TESTS) fcvt
>
>  hello-arm: CFLAGS+=3D-marm -ffreestanding
>  hello-arm: LDFLAGS+=3D-nostdlib
> @@ -24,3 +26,14 @@ run-test-mmap: test-mmap
>  	$(call quiet-command, $(QEMU) -p 8192 $< 8192 > test-mmap-8192.out,
"TEST", "$< (8k pages) on $(TARGET_NAME)")
>  	$(call quiet-command, $(QEMU) -p 16384 $< 16384 >
test-mmap-16384.out, "TEST", "$< (16k pages) on $(TARGET_NAME)")
>  endif
> +
> +ifeq ($(TARGET_NAME), arm)
> +fcvt: LDFLAGS+=3D-lm
> +# fcvt: CFLAGS+=3D-march=3Darmv8.2-a+fp16 -mfpu=3Dneon-fp-armv8

Alex, What is your idea here, enable this later?
Maybe add some TODO comment around..

Except this nit, for both Makefile.target:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +
> +run-fcvt: fcvt
> +	$(call quiet-command, \
> +		$(QEMU) $< > fcvt.out && \
> +		diff -u $(ARM_SRC)/fcvt.ref fcvt.out, \
> +		"TEST", "$< (default) on $(TARGET_NAME)")
> +endif

$ make -j1 run-tcg-tests-aarch64-linux-user
  BUILD   debian9
  BUILD   debian-arm64-cross
  CROSS-BUILD aarch64 guest-tests with docker qemu:debian-arm64-cross
  BUILD   debian9
  BUILD   debian-arm64-cross
  CROSS-BUILD aarch64 guest-tests with docker qemu:debian-arm64-cross
  RUN-TESTS for aarch64
  TEST    test-mmap (default) on aarch64
  TEST    test-mmap (8k pages) on aarch64
  TEST    test-mmap (16k pages) on aarch64
  TEST    test-mmap (32k pages) on aarch64
  TEST    sha1 on aarch64
  TEST    linux-test on aarch64
  TEST    testthread on aarch64
  TEST    fcvt (default) on aarch64
  TEST    sysregs on aarch64

\o/

Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



--KtpWTJYOgMB0ktiD3gyKqWDTwO0YO6HJC--

--hFC4m1Pc39Av3iyTIbFBdDm2YVwE7IOtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlr+TGUACgkQ4+MsLN6t
wN40vhAAuXXucMeHEkaCJYEG1YeZXhusu43LTVLxsOE1eVnfBX3P2VAYb/oyDFkw
kQy5sDk5xDAZWtnvwuODOPepUpSwES8clbZ81KB+PXBk0LNKbO2/LeNFZ3ik7q8b
l1z89iTo7fN7oxd5BZmwM2aLqh6rn1QnEubFkuAiR/ZKCw2WaEJIVSDprB2B9rQQ
8D1juhobOHPobTWm/Swwepbv7qaLTBA1JSfMRAIf+ALEqpQJlS4yHQKp3c5c9Czt
5oLQFfkrMDlOUbc0swITZYQ+bQ/EcD7+OkZiozFr46aGd7hzYhIf83pOtFW/SAh+
aE8JHpZIEKy4KadL+Qjlpw8c0mm4MyuCbUoBOn2zuxvXoK5gWEvTx8L7rz6a0EcD
d0d/U9sYTrbUzGq91LQDrxZ3ehl3rVkF5tRTf34IN2P2MQsRDxCBfsd4O3hYbtdb
haRTeLmDVCoVXFHAxIoJ7eXbXOgZaBTDGtPiP0Xruy2aVwEwtMgiU2g3OTMTYR4F
jK7EF/fPIq7PXhCy+BxMyrOs5DLNEQdNqQgyyuyEM+97bGE09lVJcPTd9qwfyuT0
S+wTqRGq1fnX9gzagTQR4cCjJQgdQA0W1lj0Ub6Z/RBqzFqY3mbke/a2HhRWJZon
HNcs/efRfySEW8dvIhMZmflQHXVtIUfX00DS4SBYMnrtxPS6xvc=
=2Ywr
-----END PGP SIGNATURE-----

--hFC4m1Pc39Av3iyTIbFBdDm2YVwE7IOtY--
