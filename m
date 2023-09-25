Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp538400ejc;
        Mon, 25 Sep 2023 10:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiFkrm3Rfr2PwajqpeSzJKybjutlvdAR7nACDre6ZoudX4GOiklCKxQyHXzHo4i7a/4xgg
X-Received: by 2002:adf:ef83:0:b0:317:f714:3be6 with SMTP id d3-20020adfef83000000b00317f7143be6mr6836164wro.61.1695661809200;
        Mon, 25 Sep 2023 10:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695661809; cv=none;
        d=google.com; s=arc-20160816;
        b=q7CybwkvepyAn18nqQBegtUmixlPyni12K8UZEyNL2LmO53eBKMZM2qTuOqPSI94Cs
         9FNk4XJsNP+Ve5/dIFgJzYKf78JOmIFZjPCHfgerA9BHTN/sZ0eIEn9aQSyBJeAEvdzq
         VVMM7j8ErEHpEGiTOIc9aC5UU0OfFPGDQ6R41Rt74Ko3VA6WuDQxIi9UZ3zCmFTwebPP
         khTnPlaQi+SDmgGIdvE8/w0QCc6byHmRFdadzw+V8C3WhY+UQ5MII8EjqfdYsH6AOwoZ
         vPyVI42TahLNNEfIg71gVm+NWt6PuGu67Gyw7Gp279YkkNQDKEFCR0qTFpiR+ac/gdF1
         i33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4kAar/o8/27Z3wn0/J0m8KQfB+/EQDpGstCSYUtBOlw=;
        fh=TxhNc6GTkufuxEZ8KMufU+JW28kQE7gj5wIgwMMK1Gs=;
        b=nU+S3DAz5p+7ltuTmFFOrHEobfFFhakUTzTNVWuPzzVdybnq3P4Fnf74IGJOXM16NH
         V10YeOADN6R4QTbbA7FSE8HKvrvH7Ub63ltuu3gvTNJ4/1UaQfoR36VWiH/NNTKuSJHC
         1jWLwJqlhgJ04v3VRp2I4EHR87BOIq2nWBc+BGNLXK6dCqPKepjoJlPhBXekxxz4EIGw
         Jr7IlH29B7OxZuv2X4c0pjMlheOCURSTdWXjDwVZsXe2Z39U8TOxw29jV4jWtizYEBgX
         W04V90ZasXb5Gx2/LoS81gXJffd5n5l0Sh0ixAvlLSSwnjpDBvd3CPgEVwzQPScsHEdL
         hqbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umNnz0I0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com. [2a00:1450:4864:20::52f])
        by mx.google.com with ESMTPS id a24-20020a170906685800b00987d26a0998si9196520ejs.455.2023.09.25.10.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:4864:20::52f as permitted sender) client-ip=2a00:1450:4864:20::52f;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umNnz0I0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so8073054a12.1
        for <alex.bennee@linaro.org>; Mon, 25 Sep 2023 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695661809; x=1696266609; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kAar/o8/27Z3wn0/J0m8KQfB+/EQDpGstCSYUtBOlw=;
        b=umNnz0I0sfe/oC7Ie0WpKpiB3LJhrXVTaySepWGLyaT7qdjOlwIbTFF8LLnjnLFdVu
         sGfk+yxdkCw0FDkWBPxuaJJNAcYX6Sxofn783+4rHNtvnQ/xKJoQkQiLrgiyDPUZioME
         XMWkJxOcC94We+rNeK3cTc0OHNyCH9ig+XcGeG4+g0jIRbzgXgY2CUtg7B1Nn29loAZ9
         X1SD/jgugKsQ3WcH09taq47jvGwGxbLysBSoh8JYnGbTyOj6CZbftdQmg3CDdeMoyZG0
         C4rxD3F2YBGPX+cmjfRoPHVQ1BzJpKI6vYMG+5Xo37y/dfHf4H5e87OV4SDFCtx6Qzjc
         e8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695661809; x=1696266609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kAar/o8/27Z3wn0/J0m8KQfB+/EQDpGstCSYUtBOlw=;
        b=C8piUIWJSvcyC4QFoDecxdRmJEtU6CT2VHGzy04sBBP4us/xWhk63IGfqt8qtuL1iu
         2+CPggQr8PUT+SHi1y9nl8c66/mg9dGQE5poT5Cp0Z555rAb+yCB2DkkokojWLGdM8KL
         cLr/klB8HU2+0PLJzY+vNkEUfjk1hDIAxqVkzWxKI+xo4M3HGLdkXalJipXcoMqxogyB
         /p2DLhpZPQ30h7w3vUuJxL+LR/7bJXnw2gT6YUeid8CTsxqSKXGNVuiXiCLxO/AeMOFp
         7keOCNa2L3V3PdgwJPgvlAxHf6vtjm3scnddDmGSth8nj9ZkBAkXZaWnxftF0cl32C7L
         Wu3A==
X-Gm-Message-State: AOJu0YzN399gkBg/N7uEm7dmWoljLb3PWOHxfB/QSqJxZj6ywSxfbtuS
	sTmP7GzCAT1fZxMvCNxnuQtBXo373GwwdaVwovX4zSJAUI98DCXtK8e6Xg==
X-Received: by 2002:aa7:dbc3:0:b0:530:bd6b:7a94 with SMTP id
 v3-20020aa7dbc3000000b00530bd6b7a94mr6266756edt.24.1695661808794; Mon, 25 Sep
 2023 10:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org> <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
 <87cyy6rylx.fsf@linaro.org>
In-Reply-To: <87cyy6rylx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Sep 2023 18:09:49 +0100
Message-ID: <CAFEAcA9_dkh-2HcXCxXUj3aBhcZFx5OaEn-q-6swpUkQOE9ykQ@mail.gmail.com>
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
	Alistair Francis <alistair.francis@wdc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>, libvir-list@redhat.com, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Bin Meng <bin.meng@windriver.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ECUXRh7nkO6C

On Mon, 25 Sept 2023 at 17:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > On 9/25/23 16:48, Alex Benn=C3=A9e wrote:
> >> If we update configure we should make sure we regenerate all the
> >> compiler details. We should also ensure those details are upto date
> >> before building the TCG tests.
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>   configure | 2 ++
> >>   1 file changed, 2 insertions(+)
> >> diff --git a/configure b/configure
> >> index e83872571d..a95e0f5767 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -1788,6 +1788,8 @@ for target in $target_list; do
> >>             echo "HOST_GDB_SUPPORTS_ARCH=3Dy" >> "$config_target_mak"
> >>         fi
> >>   +      echo "$config_target_mak: configure" >> Makefile.prereqs
> >
> > This in practice is not adding anything; if "configure" changes then
> > Makefile's dependency on config-host.mak will trigger a configure
> > rerun anyway.
> >
> > If you want to add it, you should also add it for other config-*.mak
> > files.  However, I'd remove this line and just change
> >
> > -# 1. ensure config-host.mak is up-to-date
> > +# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
> > +# files for subdirectories will be updated as well.
>
> Peter ran into a mismatch between config-host.mak and
> tests/tcg/foo/config-target.mak in his build system so it didn't get
> picked up at one point.

I did, but looking at the timestamps on the two files, the
problem wasn't that one file got updated and not the other:

$ grep CONFIG_PLUGIN build/x86/config-host.h
#undef CONFIG_PLUGIN
$ grep CONFIG_PLUGIN build/x86/tests/tcg/config-host.mak
CONFIG_PLUGIN=3Dy
e104462:jammy:qemu$ ls -l build/x86/config-host.mak
build/x86/tests/tcg/config-host.mak
-rw-r--r-- 1 petmay01 petmay01 549 Sep 22 16:38 build/x86/config-host.mak
-rw-r--r-- 1 petmay01 petmay01 159 Sep 22 16:38
build/x86/tests/tcg/config-host.mak

(both newer than 'configure' itself by about 10 days.)

-- PMM
