Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1358057lfe;
        Tue, 17 Mar 2020 03:30:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt6O36rlnA8/FTZ8qlJxkNSUfEqsVODLgGR1nJ44OFcJHg3o0FBEOV/By3uoK18d+3bI6bV
X-Received: by 2002:a25:9a41:: with SMTP id r1mr6735847ybo.431.1584441008641;
        Tue, 17 Mar 2020 03:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584441008; cv=none;
        d=google.com; s=arc-20160816;
        b=vRHWNOWAKJNzfS4nm2HIGBKKi7VZPpHr5v6vA/DFcxp0B+XH/fU3jzokxsHIngHUyf
         a32coMYw+zLB4FS+bNU3qlS6yTJXITf0P2mZF+e5lU4SpV5nCbd5lGJ3BMPyvM00nPKh
         /DKT5kXUh5S8cI1ZLANqKUsXJ2/EBT0jKtEj0wekPHQoU5w/Oh5VphgLNWAIUwNRJckN
         Kdvv7Nqokw9unv9mFt5IzGsHY+9YX1GXQDawuxB+1EjCdDbTRsUNhUCSsN3nS4+NW283
         umE/W/sa5++tQGcrhN6pCdgJuJdL5j1KkXNMkUFXg3PU91+1QcOuVkBO8HbXyHzQnsuh
         GekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LItzE5+LtCAY5gnPBkGuTscdu6mkriXnuQqoFYxvYM8=;
        b=RF8LCxE9UolChSCWlfnu9phfYVM1hVtW7m3UcXMvqaeFG3LD3ya7mfsmtJZ6WfeALt
         NG6swibpGaDcELwznSBfPvdFNlMmRYS8s2b8vTOjPJXNSwdic/V7kN1Tx29/A5j7rrFc
         oBGaJ8bdKTbqWZYygczaRQKWti7Sfv9s3sKYMjlulwjaxDAhnqUPR5Vjq4keuy/ShvPi
         mRTIGL8l+l6iLdxU38vHDvcLevo2+hIpXE7A0+Vd4QZV3QBQD3UHZXj5aLpRH1oVTgXf
         E8eo4oXWqe+j2H2u1pvjc1FhI/jx6WG8f5SeJ71TDDCOaB7HRgdVS+XFkQcFF+6u6cT+
         LNcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bWTC8YVQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id j191si2203139ybj.81.2020.03.17.03.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bWTC8YVQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584441008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LItzE5+LtCAY5gnPBkGuTscdu6mkriXnuQqoFYxvYM8=;
	b=bWTC8YVQOyLo3E61avGrJX3jA/MzGle3r/L1lJVFjfB3wEQ7V7k44MuVPdzJSyahRSmqPU
	amuntNHjZ9UBjJA9OXIJV3fg4DVJEPScSjMkwWTK/qqbAUXxW6Why8C+FD4BMEouUFbXGm
	IYgcGCPgSDM8pjDuNQh34uf2vhThuvs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-nZSLFZMuM2OCT3_S2mShqA-1; Tue, 17 Mar 2020 06:30:04 -0400
X-MC-Unique: nZSLFZMuM2OCT3_S2mShqA-1
Received: by mail-wm1-f71.google.com with SMTP id s20so6136756wmj.2
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 03:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U4pERgLsSH+Hq2YILmQCBhGUKnco1uq2TEic1W6Crmo=;
        b=fWoRnRpwmrM4uXObIB9YO4vxAqjTk7Vwf8BquvvZj6vJbWMwV/6cNi2TFIHKsqC/6s
         sw+CW5TSHijhfGhQijBv398UYAHlBxqO3OH3Srp2fLj3oFQjDYhHswEIDAVfpMmxiTAE
         T3zBteU4qLUytUr7/h7J4sqm7oj65cyGHlXwbkxtGyHL2KetJ7Ho27zCcopD/63XaJg7
         zaSXfciZDqYtm16zmCmLEAdHJ9vWfocuvk4SQ7WR4YwoD4T7z+5pBY6cmSjcUfhWGGFI
         piY/jtLyUCu5+eMqj7i5CTIt23w6Faml0E9kx67+8/KrolPAdCrwdpKSTFn2ZHBhg5RU
         S3tA==
X-Gm-Message-State: ANhLgQ3C7yyoI/k05W0xYgxloa98LrIVY8QUHF6w2nHn+AhLWQPa46Nf
	03a1b9bAfMXRqVxn5t3sFS+tZuhZ4/VjGwWIqVd8ooj+z+eqychEr2iaVGIqnTHH7sEAtKmQn7E
	G3IVztCskIPcS6Oeh
X-Received: by 2002:a5d:6146:: with SMTP id y6mr5357691wrt.107.1584441003545;
        Tue, 17 Mar 2020 03:30:03 -0700 (PDT)
X-Received: by 2002:a5d:6146:: with SMTP id y6mr5357674wrt.107.1584441003361;
        Tue, 17 Mar 2020 03:30:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id x17sm3379108wmi.28.2020.03.17.03.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:30:02 -0700 (PDT)
Subject: Re: [PATCH v1 23/28] tests/tcg/aarch64: add a gdbstub testcase for
 SVE registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2515f01-c42b-48e1-7e2d-00a69363aba9@redhat.com>
Date: Tue, 17 Mar 2020 11:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-24-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: v9zWc3Jl+fz6

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> A very simple test case which sets and reads SVE registers while
> running a test case. We don't really need to compile a SVE binary for
> this case but we will later so keep it simple for now.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>=20
> ---
> v5
>    - properly plumb in
>    - skip if fails to connect
> ---
>   tests/.gitignore                      |  1 +
>   tests/tcg/aarch64/Makefile.target     | 15 +++++
>   tests/tcg/aarch64/gdbstub/test-sve.py | 81 +++++++++++++++++++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py
>=20
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 7306866f216..d03c037d772 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -10,6 +10,7 @@ qht-bench
>   rcutorture
>   test-*
>   !test-*.c
> +!test-*.py
>   !docker/test-*
>   test-qapi-commands.[ch]
>   test-qapi-init-commands.[ch]
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index a25afc071cc..b61b53e4dd1 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -46,6 +46,21 @@ ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
>   # System Registers Tests
>   AARCH64_TESTS +=3D sysregs
>   sysregs: CFLAGS+=3D-march=3Darmv8.1-a+sve
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=3D$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +AARCH64_TESTS +=3D gdbstub-sysregs
> +
> +.PHONY: gdbstub-sysregs
> +run-gdbstub-sysregs: sysregs
> +=09$(call run-test, $@, $(GDB_SCRIPT) \
> +=09=09--gdb $(HAVE_GDB_BIN) \
> +=09=09--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +=09=09--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve.py, \
> +=09"basic gdbstub SVE support")
> +endif
> +
>   endif
>  =20
>   TESTS +=3D $(AARCH64_TESTS)
> diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gd=
bstub/test-sve.py
> new file mode 100644
> index 00000000000..90201d80094
> --- /dev/null
> +++ b/tests/tcg/aarch64/gdbstub/test-sve.py
> @@ -0,0 +1,81 @@
> +from __future__ import print_function
> +#
> +# Test the SVE registers are visable and changeable via gdbstub
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +MAGIC =3D 0xDEADBEEF
> +
> +failcount =3D 0
> +
> +def report(cond, msg):
> +    "Report success/fail of test"
> +    if cond:
> +        print ("PASS: %s" % (msg))
> +    else:
> +        print ("FAIL: %s" % (msg))
> +        global failcount
> +        failcount +=3D 1
> +
> +def run_test():
> +    "Run through the tests one by one"
> +
> +    gdb.execute("info registers")
> +    report(True, "info registers")
> +
> +    gdb.execute("info registers vector")
> +    report(True, "info registers vector")
> +
> +    # Now all the zregs
> +    frame =3D gdb.selected_frame()
> +    for i in range(0, 32):
> +        rname =3D "z%d" % (i)
> +        zreg =3D frame.read_register(rname)
> +        report(True, "Reading %s" % rname)
> +        for j in range(0, 4):
> +            cmd =3D "set $%s.q.u[%d] =3D 0x%x" % (rname, j, MAGIC)
> +            gdb.execute(cmd)
> +            report(True, "%s" % cmd)
> +        for j in range(0, 4):
> +            reg =3D "$%s.q.u[%d]" % (rname, j)
> +            v =3D gdb.parse_and_eval(reg)
> +            report(str(v.type) =3D=3D "uint128_t", "size of %s" % (reg))
> +        for j in range(0, 8):
> +            cmd =3D "set $%s.d.u[%d] =3D 0x%x" % (rname, j, MAGIC)
> +            gdb.execute(cmd)
> +            report(True, "%s" % cmd)
> +        for j in range(0, 8):
> +            reg =3D "$%s.d.u[%d]" % (rname, j)
> +            v =3D gdb.parse_and_eval(reg)
> +            report(str(v.type) =3D=3D "uint64_t", "size of %s" % (reg))
> +            report(int(v) =3D=3D MAGIC, "%s is 0x%x" % (reg, MAGIC))
> +
> +#
> +# This runs as the script it sourced (via -x, via run-test.py)
> +#
> +try:
> +    inferior =3D gdb.selected_inferior()
> +    arch =3D inferior.architecture()
> +    report(arch.name() =3D=3D "aarch64", "connected to aarch64")
> +except (gdb.error, AttributeError):
> +    print("SKIPPING (not connected)", file=3Dsys.stderr)
> +    exit(0)
> +
> +try:
> +    # These are not very useful in scripts
> +    gdb.execute("set pagination off")
> +    gdb.execute("set confirm off")
> +
> +    # Run the actual tests
> +    run_test()
> +except:
> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount +=3D 1
> +
> +print("All tests complete: %d failures" % failcount)
> +
> +exit(failcount)
>=20
