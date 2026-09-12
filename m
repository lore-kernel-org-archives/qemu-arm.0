Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D47C88E53
	for <qemu-arm@archiver.kernel.org>; Sat, 12 Sep 2026 19:38:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5TY3-00067a-Fk; Sat, 12 Sep 2026 15:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x5TY0-00066l-VC
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 15:38:00 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x5TXx-0002Tb-9q
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 15:38:00 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so403074f8f.3
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789241875; x=1789846675; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jycISpkPf5WVO3aNQmqdFTFntVJmDSZ5z2sQcLlU294=;
 b=HGTMX9TnknYTaGfIeFg6VUhqQ3wbghra188/OAllvpGskjqyxR1GN8uFYyoBnmEHla
 oLwFNYpHoddXDkbDdK96dKNrXrTFPBPIZd54SGFR246uGNAc2+2Naf3kmUlER8XvYXEj
 6rdOGYZkW5+K9Yae1roUpM0vvZtVq5wap7Svc7mmYjSAwWi2BbsEy5C+zZidd7NLga/Y
 qcpdgIo7VV/FFWI/K/0U3qqc5+3MVSYFZCA8FCOuGxIpoonSmVbZj+8so4ioBiiNyDN9
 tnGtH7hGk/vBTVt/DD0xBziXR3NOUeGCFw7SpMGTSFEQBuABLoP9fA4ZECAo5Lmf7Dns
 6H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789241875; x=1789846675;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jycISpkPf5WVO3aNQmqdFTFntVJmDSZ5z2sQcLlU294=;
 b=ADIDBOrkzIrb4uLd70pLfsKwmeB7IDsBeOPPs4PKUK2sdpYyNx6rgLb6v0BxKkMRky
 2nH+3RpqeXTIv5th4B/dcxIMdUtZsSbk5qcezQbyak1PwAyHTmeeW/88biWQ+oVxBoVz
 liCK/i8jIz8CSwMCyenOPjMAp6Ch7rvreKnvonYhRSHhr2UajmCqV6RW/+Pci0Ac7UGo
 CSWvsIO3ezhcBoRP9bPdFVdwX5TnLmf2MJJaYfMUE9r+IwQNzx3DenexwZCOazVRr1LP
 K7x0IKhWeyZ59VUZEz6J/nHQr6X4co/D8dNEtpgXqGR+mn+HVY4rP9/vNEDUG7N1WcQW
 YK/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxn7IeLLs2U6XZ8riAvYNtSr0W/Kilccsmmn7n17sqKSRI4KWudmqM1IsGjPW/mjXWGN5XqzDjCfg==@nongnu.org
X-Gm-Message-State: AFuF++n5+HGk5iX96MGHskD9Cw37lLEx8iP8ZHw4XhJD1iFILlKYX1lj
 ASkwRaFIaOZ/jL8aL6PlBKj9XCcOLiBmHAFGDamYj3AZQcVp/ZTVKt6DBLfmlLiT9GA=
X-Gm-Gg: AYBFou1mnYSN4t9y02qf3MfBjqRIO6fJIl0Z3+hRm2cXtOdDaJtUpEQoMU++GYFODxL
 qUqiwsGDETmROTxUyaoKGPufDeJwkYi6GYdxZ/T6cmifFPUjojnJgUnJhQY7W7iMKnUbCTZX2a+
 cuF7zvKZ4vESlavgjX0+vTvyUG4nzEgbbAw+Y2I6PvYrX9FdwNFlrNeY4lzcGO01zLrozjhgNDn
 Z2U127v/Qnfqx0fJnJo2vZt4QArKB8tK0aah44FpmFeZbEDxRTPSDiOmSQlfRw6I0DxnwApF/ta
 AuTw0GSbjTr0up6nWcJS9BjGJfV42dyFtJDoTAeVOuAT9FyuqUc/1qIZoI8gk/aA7K8lD+DmHHV
 3+mZjAtZ9sBjuvlrLWgXlm2oZlLtVSahIQBQI9yy74EAEa4M50/059mPOD/vn6D2AVxNCqmyFKm
 G6J3wFnw/hEMKevko4irHM2RsQ5tzzdrBof4iFHmnTATwDlHdWKcxDMj8mvx49K25ZMKtUoCs=
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id
 5b1f17b1804b1-49e6198734emr265749905e9.6.1789241875017; 
 Sat, 12 Sep 2026 12:37:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60adaee4sm265584685e9.14.2026.09.12.12.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2026 12:37:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 285ED5F8D0;
 Sat, 12 Sep 2026 20:37:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Brad Smith <brad@comstyle.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Song Gao <gaosong@loongson.cn>,  Warner Losh
 <imp@bsdimp.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,  Fabiano Rosas
 <farosas@suse.de>,  John Snow <jsnow@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,  Thomas
 Huth <th.huth+qemu@posteo.eu>,  Brian Cain <brian.cain@oss.qualcomm.com>,
 qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,  Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 0/9] testing: various docker clean-ups post meson tcg
 conversion
In-Reply-To: <bd5b1565-2bbc-4f8d-9124-7b2a0edcfb20@linaro.org> (Richard
 Henderson's message of "Sat, 12 Sep 2026 00:52:51 -1000")
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
 <bd5b1565-2bbc-4f8d-9124-7b2a0edcfb20@linaro.org>
User-Agent: mu4e 1.14.4-pre2; emacs 30.1
Date: Sat, 12 Sep 2026 20:37:52 +0100
Message-ID: <8733ve2rcf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/10/26 08:14, Alex Benn=C3=A9e wrote:
>> This cleans up a few bits and pieces although doesn't totally solve
>> the issue of an apparent stall while meson builds the docker image.
>> However with these changes there should be no difference between the
>> meson build and the equivalent "make docker-image-foo" invocation.
>> We also finally get rid of the ill-advised magic caching support in
>> docker.py.
>> Please review.
>> Alex.
>> Alex Benn=C3=A9e (8):
>>    scripts/meson-buildoptions.sh: update missing options
>>    tests/tcg: prefix meson built docker tags with qemu/
>>    tests/tcg: use --add-current-user when building containers
>>    tests/docker: add container registry to configure and use
>>    tests/docker: remove used _read_qemu_dockerfile
>>    tests/docker: strip remaining caching logic from docker.py
>>    tests/docker: add specific command to parser
>>    tests/docker: swap --quiet for --verbose
>
> Something in here breaks things badly:
>
> $ make
> /home/rth/qemu/bld/pyvenv/bin/meson introspect --buildoptions
> /home/rth/qemu/src/meson.build | /home/rth/qemu/bld/pyvenv/bin/python3
> -B \
>   scripts/meson-buildoptions.py >
>   /home/rth/qemu/src/scripts/meson-buildoptions.sh.tmp && mv
>   /home/rth/qemu/src/scripts/meson-buildoptions.sh.tmp
>   /home/rth/qemu/src/scripts/meson-buildoptions.sh
> Failure in scripts/meson-buildoptions.py parsing stdin as json
>
> ../src/meson.build:96:12: ERROR: Unknown compiler(s): [['rustc']]
> The following exception(s) were encountered:
> Running `rustc --version` gave "[Errno 2] No such file or directory:
> 'rustc'"
>
> make: *** [Makefile:134:
> /home/rth/qemu/src/scripts/meson-buildoptions.sh] Error 1

I think this goes away with a clean reconfigure to trigger a newer meson.

>
>
> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

