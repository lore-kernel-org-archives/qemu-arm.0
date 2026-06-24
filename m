Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870D2CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:06:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPBE-000369-Cb; Wed, 24 Jun 2026 11:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcPBA-00035U-H3
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:06:16 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcPB8-0001So-Mn
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:06:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso13157145e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782313573; x=1782918373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8ufwlZ3zz5EBuU/4lkCHYixp/oTIOjbCFRp8+ljV7w=;
 b=pDRc1SFxx5FzdQt0LN8sGdFcYjhbM92zPp8OfAbTbcysZ3lJ54Uuyv68zmwG7Ou3u9
 aYdyPbuiMc11ClJ7ON4dZQdnRRjwYPuZWl6qbtbNH370z9B6vLbRsWuD5Y2xM2xXjPys
 8A1Op2aFYBOq+XrlSHtI13iGjx9v1dGzV3ituDx054Y7txlNj69e0ceWj3H6r0x/9I3q
 EmvKopFAF6nl4QOqMRwTR3W/ZK/NxwqDrC3kxShJoykvrmhNTdjozjpkiqascT8c+7SP
 XVpKBYFfOjohfX8E/eukB593XMxbJfNS5CvS21YfLzhNmv9CqcXMiTZgPeqOv1NfKWJf
 pzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782313573; x=1782918373;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f8ufwlZ3zz5EBuU/4lkCHYixp/oTIOjbCFRp8+ljV7w=;
 b=IvOjD9XkM2qzFffoAPCU+l8kg2HaiW5d8xnXGVmFNpTL7cOoxEgLw/8pURyZkEWIcZ
 ru4mS5cc1lWI1lYx0TwHf9iubdEZOKbtNjHDK6qLss+rZ3hQerWbOBXZkO2XldcbUKMC
 2unxFEOspXenygud88CBHzOF7csLcM7bpoTbB1sfM9ukYIZ9zFD4hGIQAPsZ43zLo1Ri
 /ksaC+JX4UVZMtiuhQe6VxuQkYXZX0RDu6plMgjH+v9PV45W1hSr2nJK/btAtU+7Sg0I
 KOFqTQ8WT3Zb+wIz07BDkP57uYWD4PQWWXTagzX8u/7L1pqrUijQVBpRKBE8DVkirk40
 DBAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cyfh6O0tWy0joTQOk0CNQUVhlHJX09GblkqlKttrM89yHgdnQL+iEt8XioRoJT/rAlbW4KZsR2g==@nongnu.org
X-Gm-Message-State: AOJu0Yz/OjqXpGTy6D16w/Emv8bY4Gp++j3gFKCqKcn6hEQBruYfHugN
 OhNQ8+FLgRUb7RHgvrowsJnzQS7tOu4iPikja9t5S28Y3PZBHYHKz2ecFkUhMHQRs/Q=
X-Gm-Gg: AfdE7clJCGSN+nvEBBf4Zg4+Mz5W+3zy2uOmpDqgb8/TsYqf9mSnJjOPGZTw8P68RLP
 H9FkyzIQVUh7139zHu/X+AEOogUsR0l38WsVBIkxJAkZaCOPYnQ0bqfQabsPg/EJFMN/HduFUu9
 WByHdQKXKnw0D/8NSWJhsSZ5Dvpu2wQupxujfwj80qTQ2ELmJZY92zw2aiBQ0kKKnCkQW0SZdJG
 OzUTB27d953k8LYDUQJSTgPRC+AqeHjBV6rVkidar/jHbm5PP05J6S3O2vU6q0uVwsxVVsk/QWS
 ej6U4w4Xq61VL+p23yWw5vW+SF6/DDow1npfVYe7l1DvPTzvyEDyxo2hwlqtKJSp5TPoXatBHrh
 BTrwI2quHJd0QJHcpyq3xkV25ukUY9chgFEkps+Ko9PdSidePva5cj7hvdpV+q3Tr6tM4Gs4YU0
 efL1STlK3D0sbB
X-Received: by 2002:a05:600d:844f:10b0:492:5e20:3ee9 with SMTP id
 5b1f17b1804b1-49260840bbemr43176615e9.6.1782313572494; 
 Wed, 24 Jun 2026 08:06:12 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494496d8sm376292155e9.9.2026.06.24.08.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 08:06:11 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CBE155F807;
 Wed, 24 Jun 2026 16:06:10 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
In-Reply-To: <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
 (Pierrick Bouvier's message of "Tue, 9 Jun 2026 14:47:23 -0700")
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Wed, 24 Jun 2026 16:06:10 +0100
Message-ID: <87pl1gj7vh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:

> We add possibility to duplicate a test executable for a given source
> file. This is needed when different cflags need to be used (like
> vectorized vs non-vectorized for instance, like sve tests in aarch64).
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  tests/tcg/meson.build | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index 72d1a9f8986..2c6d85c586a 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -11,6 +11,7 @@ tcg_tests =3D {}
>  #     'tests': [
>  #       {
>  #         'src_file': {
> +#           'exe_name': ['provide an alternative binary name'],
>  #         }
>  #       },
>  #       ...
> @@ -18,10 +19,10 @@ tcg_tests =3D {}
>  #   }
>  # }
>  #
> -# Every test executable, is built only once.
> +# Every test executable, identified by 'exe_name' is built only once.
>  # Tests for a given src use the same executable by default, and their de=
finition
>  # is guaranteed to be unique also.
> -# Default name is derived from src.
> +# Default name is derived from src if 'exe_name' is omitted.
>=20=20
>  # plugins come first, as we need to build the list
>  subdir('plugins')
> @@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
>=20=20
>    foreach t : tests
>      foreach src, setup: t
> +      # return a clear error if user mispell a setup entry
> +      foreach key, _ : setup
> +        if key not in [
> +                       'exe_name',
> +                       ]
> +          error('unknown tcg setup entry \'' + key + '\' for test ' + sr=
c)
> +        endif
> +      endforeach
> +
>        # meson '/' operator drops left operand if right is an absolute pa=
th
>        src =3D folder / src
>        file =3D files(src)
>        test =3D fs.name(file)
>        exe_name =3D fs.stem(src)
> +      if 'exe_name' in setup
> +        exe_name =3D setup['exe_name']
> +      endif
>

Would it be better to put exe_name =3D fs.stem(src) in an else leg?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>        exe_name =3D target + '-' + exe_name
>        test_name =3D exe_name

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

