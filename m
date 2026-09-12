Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D6C79FB6
	for <qemu-arm@archiver.kernel.org>; Sat, 12 Sep 2026 10:53:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5LLx-0001vd-I1; Sat, 12 Sep 2026 06:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5LLu-0001uu-Qm
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 06:52:58 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5LLt-00047v-AN
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 06:52:58 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-85469e211a3so337495b3a.2
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789210375; x=1789815175; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SIjR+qWW/bcbGiCOAf+oq5jma7o18Z7P6rym8C9015Q=;
 b=NWpbECIQY+vFCBBX9hCh8wd8L94dfRb1cTJIYPLmb8SXj9BkeBNGrMQAp6rQ4E/ZkU
 lJJgMnqpxgnJncM9ers+Xr5Dg6/0/EwhZdJxBVeZNxwbjOrbZElZ1oknKw900vZ4mcQr
 ZP3H780IXp1ulEG0aUVqEK2nEDGUL1f+SxENVbgLHEKFTg3GoGjDt8C+GXH3LxgpyCNH
 dBzqQUYRBKUMa74bgHHkEBzQf7XIkPiywUDlwp1bVGP960oGI1LOr7qY7GXsQ+88JwQx
 7MIhBT/JtxzP5ZXlpVFwQ1XulpmK1xWiXi8X4DZhvzOuzQ0NTWMVRDmnPssZrPtTVfaV
 K+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789210375; x=1789815175;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SIjR+qWW/bcbGiCOAf+oq5jma7o18Z7P6rym8C9015Q=;
 b=pbY59pjZ4FHLr6r1mpF2/SRMPql6L7mCsl4BLJnMF7FA6Aeo9vixQ/Oq+BQNx59xwA
 YRyrko27zN41q/l5CAkv6QEnjLflZkzfQ8SC8LJ/8i0/bWwVSFhnRohrRL//r2iDjTWl
 rqa2nnswvxE68JL5zh2b+Ip+d9FLXghgkm7CDZ8cPvzPTZX6ahqY2Y67UbNrksuZyX/R
 JAHC+dOuV+gJ4HG3s1GR/1Hk7XB0zg7w1C1lsJoW98X/FS7ZXI72BTYIeQJ8sxPrSHzf
 dQ8VLDrz6tR0TCigsZiR6FVn5AhDyszQzMzf26GpTvAWyesEx1qn6koaFAkpmd3/2ZHJ
 1fsw==
X-Forwarded-Encrypted: i=1;
 AKwUvByWVZc+mzZx/DpB2Pu8Y7pltppHiqdr7c9hWOr+ZUhYoIq0JCjDFQ9uqvMCt+CejApgMZser9pGDw==@nongnu.org
X-Gm-Message-State: AFuF++nKtIoPUXWkbC3XjrGntu7uEaVPxz63dnUMrnmc0AngWTX1jsdf
 16M0dDSX0wl1QBEVY7Dn/muN6OgqpyUDziH54G4F87aa8QSkaxo5Y0pX1PeRGqZ2PpM=
X-Gm-Gg: AYBFou3fxlYpidvqSQQpUEcnBViDSZkSqpE94piuAZMtoqD5cpLUGLs5435pRyCA18u
 g4MW2ZadbVZoG++MNUNxMrNbTm/szyfAvK9m+tzA9DtDL2WtV1dcMvEqngNbgadF5bWVQXte2bZ
 gYDPFeqywAoPB8EsZAY3MMeZ58mVYnnfDESnLrJNPc5yqKq7QNg32g1hRHc9AmBzQAA7UF+xw4h
 KY/4klGplOlCPQSN0oUNcnJyYxOptdMeq8t0FytwMaUql4GJ/Ho5OXXsjXKCLxwjlv2zYVHcPmz
 tBinH9h8YVXBoxJ5J2woW+gf8IT0+OiU1xfFMD36BkITYHJGX82V3yohOl30tptjm5+UkHXKU9M
 bjzIA3ujdwMsc9FhBZz/5fQoS+4KGb0NgkB4z9zyV73XXDli2mld+qVsvOgn9ckJTIePdNPiMqA
 ZzM/MQfE+eDxvDAfh9XZ3jnssAAPlY7E4W4o9tY8jgNFjCsB8YjOcTPNTEWKh6BBA/zFH9rf6KB
 my/lMvWBb16tWa0L1Mh5/zVeKAH01q885pPsMOmsgaVbbkK5aQP/VzX6f5gnQ==
X-Received: by 2002:a05:6a21:b93:b0:3d3:ae40:51e7 with SMTP id
 adf61e73a8af0-3db0e5af225mr4380490637.27.1789210375449; 
 Sat, 12 Sep 2026 03:52:55 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8f1f7sm11393471c88.11.2026.09.12.03.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 03:52:55 -0700 (PDT)
Message-ID: <bd5b1565-2bbc-4f8d-9124-7b2a0edcfb20@linaro.org>
Date: Sat, 12 Sep 2026 00:52:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] testing: various docker clean-ups post meson tcg
 conversion
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Cleber Rosa <crosa@redhat.com>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260910181504.1010916-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/10/26 08:14, Alex Bennée wrote:
> This cleans up a few bits and pieces although doesn't totally solve
> the issue of an apparent stall while meson builds the docker image.
> However with these changes there should be no difference between the
> meson build and the equivalent "make docker-image-foo" invocation.
> 
> We also finally get rid of the ill-advised magic caching support in
> docker.py.
> 
> Please review.
> 
> Alex.
> 
> Alex Bennée (8):
>    scripts/meson-buildoptions.sh: update missing options
>    tests/tcg: prefix meson built docker tags with qemu/
>    tests/tcg: use --add-current-user when building containers
>    tests/docker: add container registry to configure and use
>    tests/docker: remove used _read_qemu_dockerfile
>    tests/docker: strip remaining caching logic from docker.py
>    tests/docker: add specific command to parser
>    tests/docker: swap --quiet for --verbose

Something in here breaks things badly:

$ make
/home/rth/qemu/bld/pyvenv/bin/meson introspect --buildoptions 
/home/rth/qemu/src/meson.build | /home/rth/qemu/bld/pyvenv/bin/python3 -B \
   scripts/meson-buildoptions.py > 
/home/rth/qemu/src/scripts/meson-buildoptions.sh.tmp && mv 
/home/rth/qemu/src/scripts/meson-buildoptions.sh.tmp 
/home/rth/qemu/src/scripts/meson-buildoptions.sh
Failure in scripts/meson-buildoptions.py parsing stdin as json

../src/meson.build:96:12: ERROR: Unknown compiler(s): [['rustc']]
The following exception(s) were encountered:
Running `rustc --version` gave "[Errno 2] No such file or directory: 
'rustc'"

make: *** [Makefile:134: 
/home/rth/qemu/src/scripts/meson-buildoptions.sh] Error 1


r~

