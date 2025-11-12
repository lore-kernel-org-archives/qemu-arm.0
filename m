Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32C8CCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 09:54:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ7YG-0000FA-OH; Wed, 12 Nov 2025 04:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJ7YE-0000Dn-Oy
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 04:54:06 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJ7YC-0005Yl-Ps
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 04:54:06 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so82105566b.3
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762941243; x=1763546043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzrQ1ktempK9xFyoN/pe74J2crvJSFaL1XrlHDrqHxE=;
 b=gEwSFXqm4z06MLGMRHZcawh0WcPVP6l+6yA3SK5MDRv7VuKZodg3g3anwXjU8ivAIw
 ux3e5U0KxcoZEGPPt/UzwSzPdVCbBssRASfxFKOLQbqK25AwBNc1SqB8CJ7WZwxkOTa1
 kr8DdQPOYbDpTIkXHXz2GyVxL4Ji7kUuOTHiylAJ5oO5su/3vR+tlobbR817Be546XlJ
 Nu1aaWgBOLQjkWF+8BUMpSTQkddxGhuL4xoPBW1physsZy7kr/2c/JPm2/o9KPGrnVmd
 1G4YRTRz6pxMJitJPSF+eg4FDvCyRYZQmG8+yR36mmtUxYaJUDurBK2jovakMLc7TMms
 SMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762941243; x=1763546043;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzrQ1ktempK9xFyoN/pe74J2crvJSFaL1XrlHDrqHxE=;
 b=Pzrv3yUfXfa14FzL1J88GFFrHmGC9S4CiUboG2WmmPXrFx5zllLlVg5aicehyq9E64
 nHUpFeVeaXg+QN5I4o/JPaTGJLRGY9FAoXCeRLKsS2AidGlBgW7AIITS8YIQEmdQ5Sb+
 rZQHHDMMgnueh/Tv37XgVugdaIZq1cR+zuacT1aj5Xaf0LFA+Wk8WVtUkBZZNidNavSz
 i/mgikpJ8vPs44+mzZv7zTrLgrWfQ2tSaufMox4rsDo1RziIUKOrqmwYncu3bJlwQxLK
 wxt6E+YRZ9Gqc957tFldKaEhLU3abBoZCqyQe2mc3CKt5rdXqdfSWub23CM5TQCVRqzL
 DVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3jnB3c/cjcKtt2Nj9vhUzE0rS6Pgv4VI5pYTx7mFthryGrbhQI3up8iTAKF6i3SWBW93JukS7Hg==@nongnu.org
X-Gm-Message-State: AOJu0Yydf2DterBE8k+kZzruG80YSmPlPEPITZz5GjY0WpyJbXWD6KiH
 cAPgj9YgwEebD3HJv8124pTrVUv/EvUQyQu9zKML28r8puYRHNT/NXrzKr5S3W53srg=
X-Gm-Gg: ASbGncvrk8t3orrpoG69QybrRad1Jy7por20Cq++Qm3yYqGSRKVruqsQy8AQ/hT06yT
 9TWwnK2EWPiJdeCFuGml5tzrVoKdGeKMktJuzl769GEyMqoZjLAEYNGGzlLkqZZ2SHpocNqGqu6
 5dO7NVcWmEjdiRgQgp2sb8B3wTKXSQmC3qZlM6lCi5NxyvLZ5YqJNVs9ukZl+lPLieytC0ORhrX
 opE+3D5TYu/tnBZiVvhrKBigEk1knf5dw4Q+JtWVANiDQWjZh42aOBn9OlbTAlHVn3NL0E8eIFA
 MIQyM0dYrIl43MEO2mMj91AMXQQmTIGkTc8Jxhf6rnW9eVO1lq80Qn+Y61Wb5ucGKmYLl7bSwPh
 krgbFAC8B+cVDfaxCZ78YA9mQoAKZzA8lN3C9I5DrMMLHY6sN8k3ystCd/vdeShNtznOh7gEYNt
 YT
X-Google-Smtp-Source: AGHT+IHvml8cT7vY6xHqN64eLK0qiKz1pY7Anel/eNA0gE9HV+jL8X/vIXOAiiiN/kzZd9o0r8dXQw==
X-Received: by 2002:a17:906:9fc8:b0:b73:16fc:d469 with SMTP id
 a640c23a62f3a-b7331aa4f78mr243602766b.51.1762941242902; 
 Wed, 12 Nov 2025 01:54:02 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa0f1bbsm1538623866b.65.2025.11.12.01.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 01:54:02 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 56DE15F834;
 Wed, 12 Nov 2025 09:54:01 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org,  Zhao Liu <zhao1.liu@intel.com>,  Kohei Tokunaga
 <ktokunaga.mail@gmail.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  Ed Maste <emaste@freebsd.org>,  Paul
 Durrant <paul@xen.org>,  David Woodhouse <dwmw2@infradead.org>,
 qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH 06/16] docs/about/emulation: update assets for uftrace
 plugin documentation
In-Reply-To: <1166954d-d478-4cff-b1af-ba3246216707@rsg.ci.i.u-tokyo.ac.jp>
 (Akihiko Odaki's message of "Wed, 12 Nov 2025 10:38:20 +0900")
References: <20251111171724.78201-1-alex.bennee@linaro.org>
 <20251111171724.78201-7-alex.bennee@linaro.org>
 <1166954d-d478-4cff-b1af-ba3246216707@rsg.ci.i.u-tokyo.ac.jp>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Wed, 12 Nov 2025 09:54:01 +0000
Message-ID: <87o6p7r2yu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> writes:

> On 2025/11/12 2:17, Alex Benn=C3=A9e wrote:
>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Linaro is discontinuing its fileserver service by end of the year.
>> Migrate assets to GitHub.
>
> I wonder why they are moved to GitHub instead of share.linaro.org.
> They look like plain binary blobs like other files moved to
> share.linaro.org and don't need a version control.

Just a choice they made - I don't think there is a right or wrong answer he=
re.

>
> If they are going to be on Git, why don't you put them on
> https://gitlab.com/qemu-project instead? I hope creating a repository
> there is straightforward.

Ideally for diagrams I'd like the source for those to be directly in
qemu's main repo under docs. However we don't currently have a way to
render diagrams for our documentation so for now hotlinks will have to
do.

>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   docs/about/emulation.rst | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
>> index 92c219119e8..4a7d1f41780 100644
>> --- a/docs/about/emulation.rst
>> +++ b/docs/about/emulation.rst
>> @@ -886,24 +886,24 @@ As an example, we can trace qemu itself running gi=
t::
>>       $ uftrace dump --chrome | gzip > ~/qemu_aarch64_git_help.json.gz
>>     For convenience, you can download this trace
>> `qemu_aarch64_git_help.json.gz
>> -<https://fileserver.linaro.org/s/N8X8fnZ5yGRZLsT/download/qemu_aarch64_=
git_help.json.gz>`_.
>> +<https://github.com/pbo-linaro/qemu-assets/raw/refs/heads/master/qemu-u=
ftrace/qemu_aarch64_git_help.json.gz>`_.
>
> I think it's better to point to a specific commit so that e.g., files
> can be renamed in the future. This URL will look like:
> https://github.com/pbo-linaro/qemu-assets/blob/ec68ed241bb303128537ac662d=
97e38972ff7257/qemu-uftrace/aarch64_boot.json.gz
>
>>   Download it and open this trace on https://ui.perfetto.dev/. You can z=
oom in/out
>>   using :kbd:`W`, :kbd:`A`, :kbd:`S`, :kbd:`D` keys.
>>   Some sequences taken from this trace:
>>     - Loading program and its interpreter
>>   -.. image::
>> https://fileserver.linaro.org/s/fie8JgX76yyL5cq/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/loader_exec.png?raw=3Dtrue
>>      :height: 200px
>>     - open syscall
>>   -.. image::
>> https://fileserver.linaro.org/s/rsXPTeZZPza4PcE/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/open_syscall.png?raw=3Dtrue
>>      :height: 200px
>>     - TB creation
>>   -.. image::
>> https://fileserver.linaro.org/s/GXY6NKMw5EeRCew/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/tb_translation.png?raw=3Dtrue
>>      :height: 200px
>>     It's usually better to use ``uftrace record`` directly. However,
>> tracing
>> @@ -916,7 +916,7 @@ Example system trace
>>     A full trace example (chrome trace, from instructions below)
>> generated from a
>>   system boot can be found `here
>> -<https://fileserver.linaro.org/s/WsemLboPEzo24nw/download/aarch64_boot.=
json.gz>`_.
>> +<https://github.com/pbo-linaro/qemu-assets/raw/refs/heads/master/qemu-u=
ftrace/aarch64_boot.json.gz>`_.
>>   Download it and open this trace on https://ui.perfetto.dev/. You can s=
ee code
>>   executed for all privilege levels, and zoom in/out using
>>   :kbd:`W`, :kbd:`A`, :kbd:`S`, :kbd:`D` keys. You can find below some s=
equences
>> @@ -924,27 +924,27 @@ taken from this trace:
>>     - Two first stages of boot sequence in Arm Trusted Firmware (EL3
>> and S-EL1)
>>   -.. image::
>> https://fileserver.linaro.org/s/kkxBS552W7nYESX/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/bl3_to_bl1.png?raw=3Dtrue
>>      :height: 200px
>>     - U-boot initialization (until code relocation, after which we
>> can't track it)
>>   -.. image::
>> https://fileserver.linaro.org/s/LKTgsXNZFi5GFNC/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/uboot.png?raw=3Dtrue
>>      :height: 200px
>>     - Stat and open syscalls in kernel
>>   -.. image::
>> https://fileserver.linaro.org/s/dXe4MfraKg2F476/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/stat.png?raw=3Dtrue
>>      :height: 200px
>>     - Timer interrupt
>>   -.. image::
>> https://fileserver.linaro.org/s/TM5yobYzJtP7P3C/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/timer_interrupt.png?raw=3Dtrue
>>      :height: 200px
>>     - Poweroff sequence (from kernel back to firmware, NS-EL2 to
>> EL3)
>>   -.. image::
>> https://fileserver.linaro.org/s/oR2PtyGKJrqnfRf/preview
>> +.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-u=
ftrace/poweroff.png?raw=3Dtrue
>>      :height: 200px
>>     Build and run system example

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

