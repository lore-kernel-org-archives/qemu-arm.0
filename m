Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A76CA1010
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 07:22:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuQmb-00029r-VW; Fri, 05 Sep 2025 03:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uuQma-00029U-VS
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 03:22:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uuQmY-0006BM-Ja
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 03:22:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so368505966b.0
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757056968; x=1757661768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWu7FbIe4I2S6aKukhLQ8uiyJqgxneGf7rUqa6wxVmo=;
 b=CPa7AchZUNgJ21A2TRpimdXaP05b40V3vxXfsj5c6kGZLYGI86Oe3r0r0aoez+gt2j
 HwHRZLLL3TVcD3sGAsvXHTzwuVZXjtq+ymig+2WYpmesGLrVu+JT/l1uBSblO27HKcxx
 lU9tcwNjVAU+0iV+WXbPYFU9OeuJYX5MEjwVAxlTlAmxuy1yg/YAVbR+uN3/EPZrmr+9
 fppYwLBjAerxaS1AJEgnuxsfceXxdJe/OgkZfbMA2VRvsOshmX8ACPTUAas7IcSO9QB/
 NpiANwO9Q0Jii8NUz81MTlOFH3dcJxXHqZHTcAW/Gldofqs/uNyIYcctQ8rDkrXZg4Iu
 mK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757056968; x=1757661768;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VWu7FbIe4I2S6aKukhLQ8uiyJqgxneGf7rUqa6wxVmo=;
 b=ZjDsl32AyFMy0qAO1SgYGc6qGLyhL3GCyK8ShK0n4wpdWCCTmL9z/tqTK48tv2LmTI
 89J8KJM2LhnuMBrXMWlMmgD5CzL8r48VL7g98VGHFiwVqZp4jHFa/JIs6WQnGuntPhva
 WAaKcDaBZasqAbspJVrPUqFZKX1FrwtHo10nbBRhfW7xtMizfpYQYuue4sTW/QsgSTPt
 jW4EXNY9FiWcj+EI7DJxBfPHy57CAVmVzgedVAsNQPKTVmB9j+/yvVFdh26+fasXhIy1
 xrYNpzDPOXyswFQrfFgy/f1nJsON31hkB3lzhu6tQYnRDCXoFSjbdNjpCiz1PAb8cvWq
 iLRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmHjfmHt/QQqKlqCSXRsMi6GknERDI4P5EA6T4IaoKQDycNMGvZUPa0T+yqZcVgqQCgxhUVd0BCA==@nongnu.org
X-Gm-Message-State: AOJu0YyNPersFDNniJMqV6r8dxbIr386ZofKDsliYaLh1LdTiYVZXrHJ
 BZ2X3TpC6MjvgTrVJqmP1avoDlSophSxklYGn7A/1GziUt3Ns94e6DMYYbw6Ex+EPAfso6bwvXT
 GoVCqB1Zxgg==
X-Gm-Gg: ASbGncv0VMEKQANqV/NkA+6UOfcf7AjyOfF0e+AOjMUDtHYnxJn3xRncrQt0vEn4xFB
 P3Il+lCztZ1Rj7Lt67GEc32Oz4HBVV14PvOrClnVnsie1eiOsRpizVxTuehWesYnGezn+wS8R2d
 AvNqwzKiQVygvuPxzLSfBlSSbbXcfTuDvOXZO4nHTpxyb8n4aZu7WgqiEwvYNve+6Rn8KyZ2bgF
 dGD4iQN4pH7hXxCZBv85eWocl7iSF94blSVC0SicrVgkUansikODfxPviwneU+r5hz/MJA/bo0V
 VfqyCdNsLkWCHNjZSdPy+xk3/6T5Qjf3tyO80fOljxYSVYZl7Vc1L0RODYZSW3ADf+AfPFJdgMk
 tijxE+wpPbitI3nqEmccUHzo=
X-Google-Smtp-Source: AGHT+IEfLKh+HocvcdIgShf54nK1Dap/VIH4mszvFLQjMhfhZsRd/AvVnSCf62Bj0tEL9ii6Eash9Q==
X-Received: by 2002:a17:907:9455:b0:ad5:777d:83d8 with SMTP id
 a640c23a62f3a-b01d8c98c4emr2090955766b.29.1757056967866; 
 Fri, 05 Sep 2025 00:22:47 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff3dd9574fsm1640695466b.84.2025.09.05.00.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:22:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 37A155F879;
 Fri, 05 Sep 2025 08:22:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  berrange@redhat.com,
 qemu-arm@nongnu.org,  1844144@gmail.com
Subject: Re: [PATCH v2 1/5] tests/guest-debug: Make QEMU optional in
 run-test.py
In-Reply-To: <20250904154640.52687-2-gustavo.romero@linaro.org> (Gustavo
 Romero's message of "Thu, 4 Sep 2025 15:46:36 +0000")
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <20250904154640.52687-2-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 05 Sep 2025 08:22:46 +0100
Message-ID: <87wm6dwegp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> sys.argv passed via -ex now includes the full path to the test script in
> addition to the script=E2=80=99s arguments, which allows unittest introsp=
ection
> to work properly in case it is used in the test script.
>
> The --binary option continues to be required when --qemu is passed.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/guest-debug/run-test.py | 60 +++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
>
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
> index 75e9c92e03..d21a5dda77 100755
> --- a/tests/guest-debug/run-test.py
> +++ b/tests/guest-debug/run-test.py
> @@ -15,6 +15,7 @@
>  import subprocess
>  import shutil
>  import shlex
> +import sys
>  import os
>  from time import sleep
>  from tempfile import TemporaryDirectory
> @@ -22,10 +23,10 @@
>  def get_args():
>      parser =3D argparse.ArgumentParser(description=3D"A gdbstub test run=
ner")
>      parser.add_argument("--qemu", help=3D"Qemu binary for test",
> -                        required=3DTrue)
> +                        required=3DFalse)
>      parser.add_argument("--qargs", help=3D"Qemu arguments for test")
>      parser.add_argument("--binary", help=3D"Binary to debug",
> -                        required=3DTrue)
> +                        required=3D'--qemu' in sys.argv)
>      parser.add_argument("--test", help=3D"GDB test script")
>      parser.add_argument('test_args', nargs=3D'*',
>                          help=3D"Additional args for GDB test script. "
> @@ -73,27 +74,30 @@ def log(output, msg):
>      socket_dir =3D TemporaryDirectory("qemu-gdbstub")
>      socket_name =3D os.path.join(socket_dir.name, "gdbstub.socket")
>=20=20
> -    # Launch QEMU with binary
> -    if "system" in args.qemu:
> -        if args.no_suspend:
> -            suspend =3D ''
> +    if args.qemu:
> +        # Launch QEMU with binary.
> +        if "system" in args.qemu:
> +            if args.no_suspend:
> +                suspend =3D ''
> +            else:
> +                suspend =3D ' -S'
> +            cmd =3D f'{args.qemu} {args.qargs} {args.binary}' \
> +                f'{suspend} -gdb unix:path=3D{socket_name},server=3Don'
>          else:
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
> +            if args.no_suspend:
> +                suspend =3D ',suspend=3Dn'
> +            else:
> +                suspend =3D ''
> +            cmd =3D f'{args.qemu} {args.qargs} -g {socket_name}{suspend}=
' \
> +                f' {args.binary}'
>=20=20
> -    log(output, "QEMU CMD: %s" % (cmd))
> -    inferior =3D subprocess.Popen(shlex.split(cmd))
> +        log(output, "QEMU CMD: %s" % (cmd))
> +        inferior =3D subprocess.Popen(shlex.split(cmd))
>=20=20
>      # Now launch gdb with our test and collect the result
> -    gdb_cmd =3D "%s %s" % (args.gdb, args.binary)
> +    gdb_cmd =3D args.gdb
> +    if args.binary:
> +        gdb_cmd +=3D " %s" % (args.binary)
>      if args.gdb_args:
>          gdb_cmd +=3D " %s" % (args.gdb_args)
>      # run quietly and ignore .gdbinit
> @@ -103,11 +107,12 @@ def log(output, msg):
>      # disable prompts in case of crash
>      gdb_cmd +=3D " -ex 'set confirm off'"
>      # connect to remote
> -    gdb_cmd +=3D " -ex 'target remote %s'" % (socket_name)
> +    if args.qemu:
> +        gdb_cmd +=3D " -ex 'target remote %s'" % (socket_name)
>      # finally the test script itself
>      if args.test:
> -        if args.test_args:
> -            gdb_cmd +=3D f" -ex \"py sys.argv=3D{args.test_args}\""
> +        argv =3D [args.test] + args.test_args
> +        gdb_cmd +=3D f" -ex \"py sys.argv=3D{argv}\""
>          gdb_cmd +=3D " -x %s" % (args.test)
>=20=20
>=20=20
> @@ -129,10 +134,11 @@ def log(output, msg):
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

