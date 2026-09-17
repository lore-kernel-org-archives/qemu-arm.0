Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33BC982D0
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 18:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7HFA-0007fD-R3; Thu, 17 Sep 2026 14:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7HF8-0007cn-Bh
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 14:53:58 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7HF6-0004zb-2g
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 14:53:58 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e2406so6372315e9.1
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789671234; x=1790276034; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=a8e95RMk1xr+xhi2ZrQ4ZsWfb04sNo7xmNej7HNYjg4=;
 b=lfXf4K1vwh5At9ny5sC8DDVPYrz6bJxSAshVJQjfKAmmga2kICdaZYsSmt5jg/ySMF
 OIHpWWogsPjYnlBKoRRARmAni8VBEgNLDF5n9Wl9ZiQRbQxkHR3rw3GQSiR9jscvUKsF
 gpg+S18ysEXE6rye9gNmLDbMLMXf1N7GOFs5t0OTshUX71adF1nT5R3bqBVZmBV1vkjl
 7649oeol5NSEm9GtOhBbvov7cVB+GrbDzRD3aRFwRcMO5tBnO9Cgabgg6f18NORjPmkV
 m8gVlSPQNP0h00ZKtNk0zGLpFC5sZwnWD/KXjmysVS1D+BR8Mz+P6rla7W9dPpOdWAWs
 ndrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789671234; x=1790276034;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a8e95RMk1xr+xhi2ZrQ4ZsWfb04sNo7xmNej7HNYjg4=;
 b=dQzIYT7YSm8NLiwEyWRJiKMsfIUoy3PmhfHMe6UnEynzavDham9+mtcLFJO6T+HhBb
 O8K46umMFIZz8UvA9AXXX3NV/8sWzJqqrx0RMQqg16A1KBgQAGqXi6ow2JJpsvFbCPNq
 M4d8xOnbr4DpeSEiKXnKA4sxMsgWhuy9KzPfiN6tnCwVjuUkd1NChctV9/xsmaxLg0A2
 sBvmlLk+EBG6B9WBQFJagY8Dpr3GK0rRmGwp0NVl/GTnH+lCKfHdEx+HvLbh/nkSr2eb
 Nux59bGVAAC07oh+CbVOffoe1l18q5uXlD9gQ+w8ZgLEcX/w7dIDCciHNMaunoNPOVYz
 aJbw==
X-Forwarded-Encrypted: i=1;
 AKwUvBygQBxOpQpV/d7DhItAMagXvBzRwTyK9ogZwMmNQarW+75QnolKne8leHByJPnmyW1m+VnUzQzAGw==@nongnu.org
X-Gm-Message-State: AFuF++l+WvvsqdPr9E93ggpSqJZLDETxDiO+4SWKJV3qHnvV6ju26JwZ
 0rWpwJ1vW4dhxKadTOJLAOaC3p2xNkVMCjM367aE0f8rzHDg4dMNzCW6126GjbgQccY=
X-Gm-Gg: AYBFou2vx06GBp9n1PwdZI6ZTv2erzbwK9oYIl2hgDMwY9KLp+FuB6DUDwAUrQiZPoQ
 YAavTKa/GvJo3FAjiXag1UVCxiPxgYLRvPNQprbIZU0MsNS8hNohcAFyIT42qXrR2KfiNLD0Z+i
 75vzxdtqSasL464GCl4CiZWfUVaKA8SZDuDjPF9dGkRjcmZZGDdJhFVUhpJ95bOM1We2IWNSmJ2
 kFT4QF9oq/PyMaJQ23t5Tr5IYLbFZR9je3iJ5H2TBVbakNUx3H1U65s+b1qxXS7+Zbk5BbmIsDc
 xheSjBkWtqKNojae/5H1YCe1r71RWsdArfCBvXwXW+x4EvJHz/gwvfcmX5T36EbCP9kvFaqYxhv
 0kCCR+CJXNcM1BCClYY1Sasn1hsvQawHWKZrByEmoOHCXFtr1IK9xWTWKP9auzn7LrGsG0f7yq+
 k1Xpj1lKiJQ/xsGiKeR0144EAyCJwxBP8LsiQRUpl5Y6o/xmJ3Aan9Do6op1uGs2Oa/MD+dgU=
X-Received: by 2002:a05:600c:4714:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-49fc4f72886mr766215e9.2.1789671234109; 
 Thu, 17 Sep 2026 11:53:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd232d5bsm95241055e9.12.2026.09.17.11.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 11:53:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F7355F872;
 Thu, 17 Sep 2026 19:53:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Cleber Rosa <crosa@redhat.com>,  Helge Deller
 <deller@gmx.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Fabiano Rosas
 <farosas@suse.de>,  qemu-arm@nongnu.org,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,  David Hildenbrand
 <david@kernel.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,  Song Gao
 <gaosong@loongson.cn>,  Warner Losh <imp@bsdimp.com>,  John Snow
 <jsnow@redhat.com>,  Eric Farman <farman@linux.ibm.com>,  Cornelia Huck
 <cohuck@redhat.com>,  qemu-s390x@nongnu.org,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>,  Brad Smith <brad@comstyle.com>,
 Kyle Evans <kevans@freebsd.org>
Subject: Re: [PATCH v5 00/17] testing: various docker clean-ups post meson
 tcg conversion (pre-PR)
In-Reply-To: <c0c5cf55-b4ff-495b-babd-3a75fd991127@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Thu, 17 Sep 2026 10:20:12 -0700")
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
 <c0c5cf55-b4ff-495b-babd-3a75fd991127@oss.qualcomm.com>
User-Agent: mu4e 1.14.4-pre3; emacs 30.1
Date: Thu, 17 Sep 2026 19:53:52 +0100
Message-ID: <87ld8z7lq7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> On 9/17/2026 9:55 AM, Alex Benn=C3=A9e wrote:
>> This cleans up a few bits and pieces although doesn't totally solve
>> the issue of an apparent stall while meson builds the docker image.
>> However with these changes there should be no difference between the
>> meson build and the equivalent "make docker-image-foo" invocation.
>>=20
>> We also finally get rid of the ill-advised magic caching support in
>> docker.py.
>>=20
>> v5
>>  - fixup a bunch of rebase damage
>>  - swap out my ccache fix for Anders
>>  - rename revert to "configure: ensure it also honours container configu=
ration"
>>  - use Pierricks solution for avoid too many SKIPs while validating conf=
ig
>>
>
> It seems that this version removes patch:
> Revert "tests/tcg/meson.build: implement ./configure -cross-cc-* options"
>
> That's fine and correct, but we're missing two things:
> - cross-cc-cflags and prefix should be passed to config.mak also
> (similar to the merge for container options). Not strictly needed as I'm
> not sure anyone needs this "extra" flexibility for roms/vdso, but needed
> if we want to make sure we don't break anything for anyone.
> - scripts/meson_buildoptions.sh update that was missing originally for
> those meson options.

See: 20260917185322.3457036-1-alex.bennee@linaro.org

>
> For the rest, it looks good and ready!
>
> Regards,
> Pierrick

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

