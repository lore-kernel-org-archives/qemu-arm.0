Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp401751lfe;
        Mon, 16 Mar 2020 11:27:40 -0700 (PDT)
X-Received: by 2002:a05:6830:17d7:: with SMTP id p23mr498171ota.312.1584383260528;
        Mon, 16 Mar 2020 11:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584383260; cv=none;
        d=google.com; s=arc-20160816;
        b=isPCyodOosW7Nemr5NVUCW80bm8Pg+Z0uA2q8nFCSk70OsSr71jx6CYpaxDsuXJfSP
         YOTXvUKyXvP2clqbo8a7VVaySZ+v9nqGnKb2VfxmsGe3024mletQAeMiFPs8IYC/Ptc8
         LB5TU2H30bAiQfEPNTrELyviBeWcYe2yc6gcBCE1eQggAmViHZ8XWvynesM0wODDgdpO
         sxGkz7/nk1r1Zs6GI4NhZEUnynNpBPy1NLE7hQYOW+67vFLCzNRDdpxsnznYvSaLa6C1
         FOjf0cNgp4dX5GS/Q1rZETQ68eIZc18m2DpKQR6CfxoBjAtoVFrm8rSlE6B2dGN/oxZp
         c3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HoFnRy9roedPxz55B+3k96w9hR7fgmKlmGGI8u+V/Mg=;
        b=qHWN9dkeHVWCgfrB73DQfvPf5Ax6HnkATCez1vBMGoebs0e8jVwKVRE7aHng45HYxi
         RvMaFnWE84z731aIo7IniczDw2gDCOAqc8TesefeNYA+L6cH0HgeaFv0FF/HxyjmJfMW
         Cq25RC4v9teFV1BdCFEak9f6ZMloAD2ZlkSfn+rcTtu5igqtg+8JCG7C9bYNZGKEOgU3
         GHKwAT7KZ/UE4fJebmOMiDqVyXO1DDPoOzwXUSSLTBljHqVWnpUCYdfsOPoKcholrs1P
         Hw+FvH1MGscmEqcV35wA7cZ7uFeqpnisRao+fOp8ILYjkoWZW/zYYewSjn+3tqMNL2fL
         MaoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfzKk+Nl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f14sor285218ote.146.2020.03.16.11.27.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 11:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gfzKk+Nl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HoFnRy9roedPxz55B+3k96w9hR7fgmKlmGGI8u+V/Mg=;
        b=gfzKk+Nlk3vNbJII3LFGAwJqvKBxBKNpj3ZcWNQq0Po6zLYKGaSb7bbX+DGgn7U5g6
         cGCbpXRE4eWlKXA7C7temqGSONteu/wL6SnGvvbgG9Z6N9zzwq9zJ8Uc8z2RwS+gyWvl
         grzQws62zM/AiYueO4wrL7HhejGUqnXb7LB2razZETZgwyLMB7mvaGYIHSwWGL796M/V
         eD3VBGFl6YkYR7YM3/gF0CpZB/xezCxNnm1iX8j3QbYNTTDcDrX2G1FFGv9pE+WrSyq/
         BHCcvv0zfNlAWP/kj7+iRkbAYSW+a21wCF1i0Acjp7MLR53T909wFanDVhlhjsgKMJAY
         7p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HoFnRy9roedPxz55B+3k96w9hR7fgmKlmGGI8u+V/Mg=;
        b=gUeJ57/pVYnj8VLzNY2OX51PIPHfESqSVueDZNYALuJuzhasjTTiHJ/P7f68131C+/
         5/Br3dT0HhLWqPcasyuUKqGvrjG6F52Thp2vKww9MsKqAw3x0HfQxp1LXZ8pp0MykMit
         TqyZrzhxZ6soHR8I96M2+zFZFom/aSey/4v4a6xgJMHw1NV6saIkj27eZjHH4PJCoegZ
         BP5S0RPtOUkZYrEAYriEOZn9tpVs5K22Lg1p8tf7ve9/+HcNIBFbFKstyj1KSAjzstpf
         GETbXv0ZzmIFiV8ml/gHB/v58xiFHJmJdGOegQmyQXEgK8OhF8951pDJsTuta0LUJIjK
         6T1g==
X-Gm-Message-State: ANhLgQ3lr+c9ePOWqJjsL5dgTfHcai2JBAi8Fezj342O6aFgfO8JDPDG
	4Oy36zCyPAawd9na/mO6+HZOl4hqwk3sthmA3Bdd4BohmJ8cYg==
X-Google-Smtp-Source: ADFU+vs7ixmWJKiAozAXRbEwBZDJ4GTmwwBPmYDbS0EQbenfiPhFUN7uMrNq0aBTlIR/KWhriAbRtY/7WN1GPl5WDk0=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr421424ota.221.1584383259723;
 Mon, 16 Mar 2020 11:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200316172155.971-1-alex.bennee@linaro.org> <20200316172155.971-22-alex.bennee@linaro.org>
In-Reply-To: <20200316172155.971-22-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 18:27:28 +0000
Message-ID: <CAFEAcA-x5L8=csd5tYYEwTaE2wb-8d9qcbaF3A9G2bC0vOOhhg@mail.gmail.com>
Subject: Re: [PATCH v1 21/28] configure: allow user to specify what gdb to use
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /ToVinFyIMit

On Mon, 16 Mar 2020 at 18:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is useful, especially when testing relatively new gdbstub
> features that might not be in distro packages yet.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/configure b/configure
> index eb49bb6680c..6724158fde1 100755
> --- a/configure
> +++ b/configure
> @@ -303,6 +303,7 @@ libs_qga=3D""
>  debug_info=3D"yes"
>  stack_protector=3D""
>  use_containers=3D"yes"
> +gdb_bin=3D$(command -v "gdb")
>
>  if test -e "$source_path/.git"
>  then
> @@ -1588,6 +1589,8 @@ for opt do
>    ;;
>    --disable-fuzzing) fuzzing=3Dno
>    ;;
> +  --with-gdb=3D*) gdb_bin=3D"$optarg"
> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -1773,6 +1776,7 @@ Advanced options (experts only):
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> +  --with-gdb=3DGBB-path      gdb to use for gdbstub tests [$gdb_bin]

s/GBB/GDB/. (Also, the only other program we pass to configure
with "--with-foo=3D" is git; for make, install, python, sphinx-build,
smbd, iasl, cc, gcov we just use "--foo=3D".)

thanks
-- PMM
