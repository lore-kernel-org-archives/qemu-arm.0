Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD200CA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 07:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuQlm-0000iS-MU; Fri, 05 Sep 2025 03:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uuQll-0000hr-JS
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 03:22:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uuQlg-0005LF-BG
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 03:22:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61e8fdfd9b4so4262528a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757056913; x=1757661713; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vC2m595O+CuIEuis8FIZ9s31vR5DEiHeXhrdI1m2u4=;
 b=nTJfwdBR/EPwAyk1KmVDymPGD0Jib/9y9g/FNzt4B1QZUg/LGPL0o/MkFu/TBFY48G
 Yb03ea027SCRLxeSzYbdcbC2LFRdAML9beY2hBxQXt+fnHZ6LvPqWGFeAIJFrAkTanCV
 AyIMPTacS6FSn3sw3Q3nQkTBoEg8n4Z2ntZcRHQ2kAoh9ZpbeRNYHkgnb78U6xiolCAP
 kIYH0mwCgvE3D2panqofwWPVCCOiknkRWVqoA35RIlOqqQLhKXQs5LrzJwWrHHsyC5de
 MQCw3HjR/tRjuPrnpitk++F7LU8Dgl46eIWAuVEGEx3T8x49YO0+XM3p36h9YkS0wpCd
 pJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757056913; x=1757661713;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8vC2m595O+CuIEuis8FIZ9s31vR5DEiHeXhrdI1m2u4=;
 b=ELM6OzpTaSXp6vYfJAQWg0J823Pgta+JUnMWqej666IQMVvkLahidnHgBU5oB52AbV
 yU1SeO8zEjbkUnkmwfgiUy0N7SZUCFv88194YZzrW5G2iXhjKAZgRYDIyPYvGxxnJuv3
 w43DVjFefUFmqzMb17kC4S3jlcAemE6m7FHiG0cTG8HFg733sa1rBvbZoEWRJZACW+Pj
 T4P+sJYIFbK2WfHMxQydvT0DqY/hNYHpJmVVoZno8QcbqZFNfTQU87c9JEGzurnXScl5
 FoPnPbASk+hW2LFiNEpLoJVo7MxQHTCOg5EVDZDln35iIjEwZ20+GMKyggyibtmWV15A
 M42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt2NdJcJW5Nf0NLAOtzFLxcE7RKuuBuQQjcxVVzUmN8uuy/fh1D0tPJy64QXky7BKszsFe/lZ9yA==@nongnu.org
X-Gm-Message-State: AOJu0YzZKbqsYYAVV236kooMSGjCdeCdKH6Feqb9yRP/hza9yevdGBaN
 JbXvju5Cn6VWookexc/z/5hnv8skzsKBYnbLUMkmbHIJ5vQ6v/L+MyI9C65Oc8E66R0=
X-Gm-Gg: ASbGncul2Vl6icE3DLoBzz5sh6Uobcmx1Zk/tEj0F0XKjxJbr+iaFFCHPN1MT8OTWpU
 ilIl3sRjxzdhaL15NM1BUQMpZccnD9sFdLl290cKewqy1/EhH3Tu2F5WW/Jio+VBCLnu9ug04A+
 Fqrw82iMFDHGtI/9YGmAOBlIzJ06EakE6glv4yY25p6ne7tPxeAt8U7mYA8QrOyAeQgnh2A8hMa
 zlfWc9vuMtx01Xq0rewYqIzBLTWY7fylBLeXn0zTIey9OeFQvBihOUOEhdH6s0ldFnszVyGyvKt
 53+BxREUVPuRNH9zLjHa1/ue8kWaTWE9zAXq3oi2seTDTl39Nzgo/PINoG26dNn3xEft2Nf1YFz
 0hYLKDhqScWwvsiLSl0033JvJQcKzLcrH/g==
X-Google-Smtp-Source: AGHT+IEH24+vKLkHQF4W49O9cRlfZ4uJS10YnRtdExi/v1f2uSTFEO9U6FKVlxL2qBCwiB6Uv9LRGQ==
X-Received: by 2002:a05:6402:238c:b0:61c:e287:7ad3 with SMTP id
 4fb4d7f45d1cf-620f3e58fd0mr1675438a12.6.1757056913130; 
 Fri, 05 Sep 2025 00:21:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc22b594sm16522748a12.21.2025.09.05.00.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:21:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5ABBF5F879;
 Fri, 05 Sep 2025 08:21:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  thuth@redhat.com,  berrange@redhat.com,
 qemu-arm@nongnu.org,  1844144@gmail.com
Subject: Re: [PATCH v2 3/5] tests/guest-debug: Add quiet option to run-tests.py
In-Reply-To: <20250904154640.52687-4-gustavo.romero@linaro.org> (Gustavo
 Romero's message of "Thu, 4 Sep 2025 15:46:38 +0000")
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <20250904154640.52687-4-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 05 Sep 2025 08:21:51 +0100
Message-ID: <878qitxt2o.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

> Add a --quiet option to run-tests.py so it can run without printing any
> messages to the stdout.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/guest-debug/run-test.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
> index e051e8947c..cf8b37b8b8 100755
> --- a/tests/guest-debug/run-test.py
> +++ b/tests/guest-debug/run-test.py
> @@ -39,15 +39,17 @@ def get_args():
>      parser.add_argument("--stderr", help=3D"A file to redirect stderr to=
")
>      parser.add_argument("--no-suspend", action=3D"store_true",
>                          help=3D"Ask the binary to not wait for GDB conne=
ction")
> +    parser.add_argument("--quiet", action=3D"store_true", default=3DFals=
e,
> +                        help=3D"Don't print any messages to stdout")
>=20=20
>      return parser.parse_args()
>=20=20
>=20=20
> -def log(output, msg):
> +def log(output, msg, quiet):
>      if output:
>          output.write(msg + "\n")
>          output.flush()
> -    else:
> +    elif not quiet:
>          print(msg)
>=20=20
>=20=20
> @@ -91,7 +93,7 @@ def log(output, msg):
>              cmd =3D f'{args.qemu} {args.qargs} -g {socket_name}{suspend}=
' \
>                  f' {args.binary}'
>=20=20
> -        log(output, "QEMU CMD: %s" % (cmd))
> +        log(output, "QEMU CMD: %s" % (cmd), args.quiet)
>          inferior =3D subprocess.Popen(shlex.split(cmd))
>=20=20
>      # Now launch gdb with our test and collect the result.
> @@ -117,7 +119,7 @@ def log(output, msg):
>=20=20
>=20=20
>      sleep(1)
> -    log(output, "GDB CMD: %s" % (gdb_cmd))
> +    log(output, "GDB CMD: %s" % (gdb_cmd), args.quiet)
>=20=20
>      gdb_env =3D dict(os.environ)
>      gdb_pythonpath =3D gdb_env.get("PYTHONPATH", "").split(os.pathsep)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

