Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5EECA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 17:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqaZh-0006u8-9a; Mon, 25 Aug 2025 13:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uqaZg-0006tv-LY
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 13:01:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uqaZU-0003mH-9y
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 13:01:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3c7ba0f6983so925904f8f.0
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756141281; x=1756746081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBwExhlGnHktaNC/Pgbr6DGrGKJUY171Dt9DA24rgeI=;
 b=EivBE1zz40aJ+zYGQppj4PYVcbcOStycqBqcKz4ifpGFQ/112K1EVBG2LZAJr7JLtq
 HEujsshkWZOfGXAlQJsYx9QqnGpBzU8m8V5CuTY3r0FjYgR3SJFDPo0PvG/TqNd+m8Pd
 10PFNX4gGR6rZqPUSnVDKqe3NuwXIfmgSWy50JwGhw1+GYvaBiK/D1dzamHcgPnGG0mG
 twk/LAWlfJgr7tzpKRwt4PZair0LlIKKBWvijuzD7pgiZ96LJibbkrnsMcK9M5muTrSm
 uwpchFV3gbhrWRLiY9bYOnZNkOVOYTziUIPRtM7Yk6b3WSX2rpHDg6LpL0jHWuvCQjvv
 l04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756141281; x=1756746081;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cBwExhlGnHktaNC/Pgbr6DGrGKJUY171Dt9DA24rgeI=;
 b=WitfE2OOAIQKDKZ9lfy+A3nNNuTPLtPfPj43p/IHtfW31OzyIq4g1u7h/a6RzEUoxH
 RdHrWOi+0v2jd6XvOcozID/cu71JM2kLR1Lc7PIJ6Qb+TQovxZr6j9stN0XX0Bod1hxZ
 oCNSBeI5pp25YPTM/ukdgmuxZ2b/A5yXKcO10MnZsGR/lLBYbwIytNs+ChElOJCap1LK
 vajYmI2GOwDyqls7FyKSHSacuP4WXcBXCB7fCuGUYK1+pveeNyGzUrtIDbcZ6hK11/yT
 Q2FTFr1dijGySXrBDh49zrqkCVugTN3UDvEul/kZKTWJhkI+q5jC9/Px3ze+2NksnKgR
 wqjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWqmsFVYSfT8cTRiocd2P5jboFX4cvefrJizDBj3hs67detVuT0Zzeqxg/T/S90bW6Ds/JJ26J2g==@nongnu.org
X-Gm-Message-State: AOJu0Yz4qsSmMBRxK2puvCEE5GxcrbkTfM3cRT5BqaPwgNzukuu6SMg+
 AIr0TcHndXVGdjTDk1rMj+r+KDLnIa524kDYQZSt8Vw5dBlHuHVaqf5kxdznxtDTOASGcbm/NzG
 Qdfq++ns=
X-Gm-Gg: ASbGncsBQGlfxoRC5WX1I33Kv2GhVYJSGb/EyZHbeIYqYOVeCQ7TC2Bj1xM6ITuf5oj
 BA6n2sQ/HCZthn59ubfkvqFg2B3r61NjMnMXwN4PS/jyzyp2bgYwq0tRLLlw+TOFKoBHj1jcewB
 dEA4T9TSRobunCM6hMlZ6or1bGqKKXXuWXz1yI4ppIipZIM0w9YAMDFmU47lpyIU6NyIkQHVTDp
 qsbWYV17Cf8M5WQYd4m9qPGaRmpVZYjyB/8zHDQwC+hqk4Q/eX1Guf+LMyjoaZLZ4Mjv4KxIM8J
 xd4IODhNcjKLP49kj9xV7YVPWOfB9wbW2sVZHkZ7bf2HSA5wGiSoicx0f6P63zG6/WOnDtMfg1x
 WRaJimsSN2Q0+XxHbZtgRSBU=
X-Google-Smtp-Source: AGHT+IF/Nd2j9L3CCQG+zhh3E4fJDKIIqHqVT5X9mwiOq/07I7zR2mlWvBV3hKQ8fi2Vu8BW1PqlYA==
X-Received: by 2002:a05:6000:220e:b0:3c2:502:d944 with SMTP id
 ffacd0b85a97d-3cb001260c9mr310453f8f.0.1756141281000; 
 Mon, 25 Aug 2025 10:01:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711f8a0d6sm12274640f8f.66.2025.08.25.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:01:20 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2DB3F5F7CB;
 Mon, 25 Aug 2025 18:01:19 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  qemu-arm@nongnu.org,
 1844144@gmail.com
Subject: Re: [PATCH 1/4] tests/guest-debug: Make QEMU optional in run-test.py
In-Reply-To: <20250819143916.4138035-2-gustavo.romero@linaro.org> (Gustavo
 Romero's message of "Tue, 19 Aug 2025 14:39:13 +0000")
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <20250819143916.4138035-2-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 25 Aug 2025 18:01:19 +0100
Message-ID: <875xeb2v4w.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Gustavo Romero <gustavo.romero@linaro.org> writes:

> This commit makes QEMU optional in run-test.py, allowing it to be used
> as a GDB runner, i.e., to call GDB and pass a test script to it without
> launching QEMU. In this configuration, it is the test script=E2=80=99s du=
ty to
> configure and run the VMs that GDB connects to.
>
> The --binary option continues to be required when --qemu is passed.
> sys.argv now includes the full path to the test script in addition to
> the script=E2=80=99s arguments, which allows unittest introspection to wo=
rk
> properly in case it is used in the test script.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  tests/guest-debug/run-test.py | 81 +++++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 36 deletions(-)
>
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
> index 75e9c92e03..7fa17aedca 100755
> --- a/tests/guest-debug/run-test.py
> +++ b/tests/guest-debug/run-test.py
> @@ -22,10 +22,10 @@
>  def get_args():
>      parser =3D argparse.ArgumentParser(description=3D"A gdbstub test run=
ner")
>      parser.add_argument("--qemu", help=3D"Qemu binary for test",
> -                        required=3DTrue)
> +                        required=3DFalse)
>      parser.add_argument("--qargs", help=3D"Qemu arguments for test")
>      parser.add_argument("--binary", help=3D"Binary to debug",
> -                        required=3DTrue)
> +                        required=3DFalse)

    parser.add_argument("--binary", help=3D"Binary to debug",
                        required=3D'--qemu' in sys.argv)

>      parser.add_argument("--test", help=3D"GDB test script")
>      parser.add_argument('test_args', nargs=3D'*',
>                          help=3D"Additional args for GDB test script. "
> @@ -53,7 +53,7 @@ def log(output, msg):
>  if __name__ =3D=3D '__main__':
>      args =3D get_args()
>=20=20
> -    # Search for a gdb we can use
> +    # Search for a gdb we can use.
>      if not args.gdb:
>          args.gdb =3D shutil.which("gdb-multiarch")
>      if not args.gdb:
> @@ -73,41 +73,49 @@ def log(output, msg):
>      socket_dir =3D TemporaryDirectory("qemu-gdbstub")
>      socket_name =3D os.path.join(socket_dir.name, "gdbstub.socket")
>=20=20
> -    # Launch QEMU with binary
> -    if "system" in args.qemu:
> -        if args.no_suspend:
> -            suspend =3D ''
> -        else:
> -            suspend =3D ' -S'
> -        cmd =3D f'{args.qemu} {args.qargs} {args.binary}' \
> -            f'{suspend} -gdb unix:path=3D{socket_name},server=3Don'
> -    else:
> -        if args.no_suspend:
> -            suspend =3D ',suspend=3Dn'
> -        else:
> -            suspend =3D ''
> -        cmd =3D f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
> -            f' {args.binary}'
> -
> -    log(output, "QEMU CMD: %s" % (cmd))
> -    inferior =3D subprocess.Popen(shlex.split(cmd))
> +    if args.qemu and not args.binary:
> +        print("QEMU needs a binary to run, but no binary provided")
> +        exit(-1)

then we can avoid this.

>=20=20
> -    # Now launch gdb with our test and collect the result
> -    gdb_cmd =3D "%s %s" % (args.gdb, args.binary)
> +    if args.qemu:
> +        # Launch QEMU with binary.
> +        if "system" in args.qemu:
> +            if args.no_suspend:
> +                suspend =3D ''
> +            else:
> +                suspend =3D ' -S'
> +            cmd =3D f'{args.qemu} {args.qargs} {args.binary}' \
> +                f'{suspend} -gdb unix:path=3D{socket_name},server=3Don'
> +        else:
> +            if args.no_suspend:
> +                suspend =3D ',suspend=3Dn'
> +            else:
> +                suspend =3D ''
> +            cmd =3D f'{args.qemu} {args.qargs} -g {socket_name}{suspend}=
' \
> +                f' {args.binary}'
> +
> +        log(output, "QEMU CMD: %s" % (cmd))
> +        inferior =3D subprocess.Popen(shlex.split(cmd))
> +
> +    # Now launch gdb with our test and collect the result.
> +    gdb_cmd =3D args.gdb
> +    if args.binary:
> +        gdb_cmd +=3D " %s" % (args.binary)
>      if args.gdb_args:
>          gdb_cmd +=3D " %s" % (args.gdb_args)
> -    # run quietly and ignore .gdbinit
> +    # Run quietly and ignore .gdbinit.
>      gdb_cmd +=3D " -q -n -batch"
> -    # disable pagination
> +    # Disable pagination.
>      gdb_cmd +=3D " -ex 'set pagination off'"
> -    # disable prompts in case of crash
> +    # Disable prompts in case of crash.
>      gdb_cmd +=3D " -ex 'set confirm off'"

The re-formatting makes the diffs very noisy. If you want to clean up
the captilization of stuff do that in another commit.

> -    # connect to remote
> -    gdb_cmd +=3D " -ex 'target remote %s'" % (socket_name)
> -    # finally the test script itself
> +    # Connect automatically to remote only if QEMU is launched.
> +    if args.qemu:
> +        gdb_cmd +=3D " -ex 'target remote %s'" % (socket_name)
> +    # Finally the test script itself.
>      if args.test:
> -        if args.test_args:
> -            gdb_cmd +=3D f" -ex \"py sys.argv=3D{args.test_args}\""
> +        argv =3D [args.test] + args.test_args
> +        gdb_cmd +=3D f" -ex \"py sys.argv=3D{argv}\""
>          gdb_cmd +=3D " -x %s" % (args.test)

I can see this echoes from:

   env QEMU_TEST_FLAKY_TESTS=3D1 ./pyvenv/bin/meson test --suite thorough f=
unc-aarch64-aarch64_reverse_debug --verbose

Shows:

  GDB CMD: /usr/bin/gdb-multiarch -q -n -batch -ex 'set pagination off' -ex=
 'set confirm off' -ex "py sys.argv=3D['/home/alex/lsrc/qemu.git/tests/func=
tional/test_aarch64_reverse_debug.py']" -x /home/alex/lsrc/qemu.git/tests/f=
unctional/test_aarch64_reverse_debug.py

But trying to piece that together on my the command line:

  env PYTHONPATH=3D/home/alex/lsrc/qemu.git/python:/home/alex/lsrc/qemu.git=
/tests/functional /usr/bin/gdb-multiarch -q -n -batch -ex 'set pagination o=
ff' -ex 'set confirm off' -ex "py sys.argv=3D['/home/alex/lsrc/qemu.git/tes=
ts/functional/test_aarch64_reverse_debug.py']" -x /home/alex/lsrc/qemu.git/=
tests/functional/test_aarch64_reverse_debug.py
Python Exception <class 'ModuleNotFoundError'>: No module named 'pycotap'
Error occurred in Python: No module named 'pycotap'

What am I missing?

>=20=20
>=20=20
> @@ -129,10 +137,11 @@ def log(output, msg):
>          log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result -=
 128))
>          exit(0)
>=20=20
> -    try:
> -        inferior.wait(2)
> -    except subprocess.TimeoutExpired:
> -        log(output, "GDB never connected? Killed guest")
> -        inferior.kill()
> +    if args.qemu:
> +        try:
> +            inferior.wait(2)
> +        except subprocess.TimeoutExpired:
> +            log(output, "GDB never connected? Killed guest")
> +            inferior.kill()
>=20=20
>      exit(result)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

