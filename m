Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp221619ejq;
        Wed, 24 Jan 2024 03:06:41 -0800 (PST)
X-Received: by 2002:a05:600c:2d16:b0:40e:4269:8da3 with SMTP id x22-20020a05600c2d1600b0040e42698da3mr1019118wmf.64.1706094401455;
        Wed, 24 Jan 2024 03:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706094401; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1GZe7zxQmOCoZZF5hUEcnonCQdFCZUGlg4rzBYvs8Zef2qGCRUoL4ZcINvZRVlAwv
         xv3cWwbr3A/30COOQqzk4HX/rfZ6QAt6PloOP4kFRo1h81PYdChXmWPFt62fySNW04iJ
         44F9B1szQk42lJliembluZhC6o8e/gS3OWZw75/SALMitiYoSlB2GssFCbbHcG9oTfGX
         cMPTzVYfx68dgOlvmKxxJoVLm9KDowF2XtDSpVnAWeALUJTzsxKZAvduZ9Qucu6H2y9O
         t8H26o6M9WoIACRYwnI8aHRDVBUGivVTDyVhMd4/KcXp/TsojrhhwO4DD22joJeAcEqA
         wGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Iy/OKjpiO5yoeXxY83xqvHL6o7nHTDd39y/0xcYG3qM=;
        fh=h16RWQCSBpnEuDdmwtv0htcXDHAfum5PwHjVpFZIOHI=;
        b=z/uUh4dm2a6MozpCHQa4Z0WCYjnh9nlCxHxOm0pCjwuVe7OEznV746XmR2fA0XZcOX
         7ClDjeOg1EgLyIlbBH+Qms8gb19OPFkZs4dkYEfenmm6NZqhjMUe+xQj1t3ShPQYcJmM
         cmkiNVRfXpvIndL5DSj072C+nxCTaRDFgy6LTK7Pk3pyh24AjwlBLeH4gqxFe3w2x4iD
         Y4Cdd4CadFMSd99b4zPQw9oNTOOZsAP0JYdR67cSFJeN0OSArjdFhL8u5bKviDVe46L/
         8LD4mDvbfURcBMw0GgkiG+OggnO97k4aBD31T+KINBdJY04NjLVxvNk33OhHVt9vX6bJ
         60Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgujQ1+X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r29-20020adfa15d000000b00337d3c74e0asor2879314wrr.7.2024.01.24.03.06.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 24 Jan 2024 03:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgujQ1+X;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706094401; x=1706699201; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iy/OKjpiO5yoeXxY83xqvHL6o7nHTDd39y/0xcYG3qM=;
        b=EgujQ1+X9ODgA3Fapl0AwIbA7kKFUex8KAjqtRADV820OwNLAofdPYNzSdKhTEGDtV
         7BQNlg11SxvU0bUxtaM0cM9n7kpxiwzNPeMQszFKvojjy5vxUXddg4y42f+ZCx/Gq8Y4
         2Eq8aC6hIG96ERYyk+Yhv+wLEYRMnogUXA9Ei4zRWTgBkSWeAzzmvaB9v+isn4/Y9hsY
         1ZeD/STRELrfYsZScsI19aKJ72375qBvHdnkWYHxLG6XUUTrRZyUZkGX5Xbc4g8I6fxu
         PISbcFrjSFqXRQanvq/rzE1U9f5QarCjtjJACUKfT2od13edvmz+HV74ODocfkp10Upk
         UdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706094401; x=1706699201;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy/OKjpiO5yoeXxY83xqvHL6o7nHTDd39y/0xcYG3qM=;
        b=cl0Ctf5Wf7eUbdYOvvH3pMS+CehuvJ2an6TI9j6nbE5eO2fxSWxp6LxYtLnvWkl3av
         dIisVgSyl7/2omp5/rDN5/ssXpwo39BDl8g+a/EvL0Og4ULw3BJfcHogdLvku10Ojp2X
         NyYeR9XRpW9UcvgIbFWwrwVIFMIFBeb1AfBypsJ72Be0zGyNWBKO03eQrbw8NUaCV0Q3
         WCLXHfG77INRvsDPUTYlIm3nXbpLeXULbrrqE5XdEw1YoscM0DmVjkL3e41L/GyGpFGr
         8Hc4KLpqsNhFQ9l5I48U+eO1lmA6IsSVnz0b8LkS4W1E2L89mRXXoA1Kp+KCfSpdA6kY
         0RGA==
X-Gm-Message-State: AOJu0Yx5DqsgGoXzTEpdXJyPi9ZETvZ4cBjW6t3dZcRI/eN1IsYpfexa
	0KDIkD052HgAp4n0NfE6bb1RQxlIFILZtPZPrqeKEk1qSFG9v8MQ1kD7xmljX17sfw==
X-Google-Smtp-Source: AGHT+IH/SauWLJ1xOlrVqSMxVFexDKwt7XPZ6S6pWBnjez+xHwFpHdDkwUvpg8Qby7kwDeLsfRpNeA==
X-Received: by 2002:a5d:618b:0:b0:339:372e:770f with SMTP id j11-20020a5d618b000000b00339372e770fmr502198wru.46.1706094400988;
        Wed, 24 Jan 2024 03:06:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (lgp44-h02-176-184-8-67.dsl.sta.abo.bbox.fr. [176.184.8.67])
        by smtp.gmail.com with ESMTPSA id d10-20020adfa40a000000b0033953f87085sm414725wra.35.2024.01.24.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 03:06:40 -0800 (PST)
Message-ID: <5a1cb4ae-b43c-4ef5-9572-6636a2d787e7@linaro.org>
Date: Wed, 24 Jan 2024 12:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Rabin Vincent <rabinv@axis.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
 <ZRG1g/2hWi8+AzNn@redhat.com> <878r8urxxc.fsf@linaro.org>
 <CAJy5ezoucKM=VvYsHeFep7r0i1PV_JUCgq6gs4JJQVHqq3Yz3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJy5ezoucKM=VvYsHeFep7r0i1PV_JUCgq6gs4JJQVHqq3Yz3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xdZjJW+8vXnV

On 25/9/23 19:17, Edgar E. Iglesias wrote:
> 
> On Mon, Sep 25, 2023 at 7:00 PM Alex Bennée <alex.bennee@linaro.org 
> <mailto:alex.bennee@linaro.org>> wrote:
> 
> 
>     Daniel P. Berrangé <berrange@redhat.com
>     <mailto:berrange@redhat.com>> writes:
> 
>      > On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Bennée wrote:
>      >> This might be premature but while streamling the avocado tests I
>      >> realised the only tests we have are "check-tcg" ones. The aging
>      >> fedora-criss-cross image works well enough for developers but
>     can't be
>      >> used in CI as we need supported build platforms to build QEMU.
>      >>
>      >> Does this mean the writing is on the wall for this architecture?
>      >>
>      >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org
>     <mailto:alex.bennee@linaro.org>>
>      >> Cc: Rabin Vincent <rabinv@axis.com <mailto:rabinv@axis.com>>
>      >> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com
>     <mailto:edgar.iglesias@xilinx.com>>
>      >> ---
>      >>  docs/about/deprecated.rst | 11 +++++++++++
>      >>  1 file changed, 11 insertions(+)
>      >>
>      >> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>      >> index dc4da95329..7cfe313aa6 100644
>      >> --- a/docs/about/deprecated.rst
>      >> +++ b/docs/about/deprecated.rst
>      >> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text
>     on the command line using the
>      >>  used instead, to refer to a ``--object secret...`` instance
>     that provides
>      >>  a password via a file, or encrypted.
>      >>
>      >> +TCG CPUs
>      >> +--------
>      >> +
>      >> +CRIS CPU architecture (since 8.1)
>      >> +'''''''''''''''''''''''''''''''''
>      >> +
>      >> +The CRIS architecture was pulled from Linux in 4.17 and the
>     compiler
>      >> +is no longer packaged in any distro making it harder to run the
>      >> +``check-tcg`` tests. Unless we can improve the testing
>     situation there
>      >> +is a chance the code will bitrot without anyone noticing.
>      >
>      > Deprecated is generally a warning that we intend to delete the
>      > feature.   If we're just going to relegate it to untested
>      > status (what I'd call "tier 3" quality), then we should document
>      > that elsewhere.  I don't mind which way we go.
> 
>     We do have reasonably good coverage with tests/tcg/cris but of course
>     without a compiler we can't build them.
> 
>     Both nios2 and microblaze have build-toolchain scripts which can be used
>     to re-create containers. However my preference is having pre-built
>     toolchains hosted by others like we do for loongarch, hexagon, xtensa
>     and tricore. Then the docker image can simply curl them into an image.
> 
> 
> Yeah, I guess it's time to deprecate it...

Is that an informal Acked-by? (:

> 
> Cheers,
> Edgar
