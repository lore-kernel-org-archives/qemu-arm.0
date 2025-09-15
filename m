Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E33CAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 22:06:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyHKd-0004b2-8z; Mon, 15 Sep 2025 18:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uyHKI-0004Sb-T6
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 18:05:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uyHIv-0000Yw-N8
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 18:05:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-32e11f35c0dso1832607a91.0
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 15:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757973843; x=1758578643; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVPl3WkHtY26wEQgy01pXNoeJ5YDiVNuCq/nFYkezew=;
 b=bJGpbuLDysF92Y/UHo8F8KNM0Pi0wkVNYEefh5l470oxvPOTv4+bj4j+vL+71F3Up+
 AO6Q9qrtuit/uv1XSvwUxj9MMRexrCcDCR3Mw+pnNkmR35qVfoUUoBxMN4AxC50MpDSl
 jyQ76rkDdaJxSIs22yMXPtxW6E2uvVCbUjuaxMw8YZWkbB3/rFLsKAMJ/Kw95PqL8hdp
 hdmqAUGUj0pg8gDbLs/5qY0x3LXEknHt/tNkUkDO2J66y1sh9kcZsDZJw08exH9enxDv
 /Dyl6gCzcDDhtTHYEqqrkwpOETUVc7OLHHgFBKstVKdPz6yYntV0LGR2ts6yh/wvxeaS
 KYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757973843; x=1758578643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVPl3WkHtY26wEQgy01pXNoeJ5YDiVNuCq/nFYkezew=;
 b=M0OIUdmOo5CvXY+dcgo5RO0bjKCWmKh3XoiM83G+lmMBjuDPqqDb0gKRmJjeZgN7WV
 77hJfOxo7yVOYhiwBqjVwuKBV6ZpXF7vnN+JVCo2T9nkzGLj72sg9dPVnlNf4Cfm7cvL
 +EF29uu/GskGHSPnqDljouB4yrjTgcbVhN1W1oigbJee9irYqQ41wvg8MGiWMXygccpB
 g5O/UeoJHKGO2atBtiANt4TsDtrGUWFRPZNB1pGN4kPHo8SVSJnAo/iI7+dpUDaTj1c8
 4O0qfww5Z2TZZ5fheL85b77lCQhvg3i36B/76FZH0za4k9e/Wj+vvY6l+OHZQNKlhGQw
 axFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Hm1I1tczqEl3EZYlAoYU0tOyiWBAFlX1E4zDiEtMtWRGfob5ZRL19PwCXt4HMLHKLYafewaKEw==@nongnu.org
X-Gm-Message-State: AOJu0Yzud3npMNh1r9GlBjjpznvSn4TJ0rLHyGkXR8G7s5xcYpx78DZM
 nRxlQp0grF76QUliR6LcW6E1GqW0nRwO4RyuO/kU9QMg1gCdcQPnCrcevEO6PjjDLp0=
X-Gm-Gg: ASbGncujATYJX7bAvIxJkmslJEUk6IMf0WoUd4Gf9y3EnnXQX5MGD6waVuSdVPV5VCd
 GdWnCxgEk4KkkkNM3+knvX2j0tBNgiQnAtXHcII3VVM4QRe1sBZIme/yRXxDf9m9xyPtGMz7Rbx
 jyFXBgPzng0W21LalgnpYCLzdl+cEUNAqJthBjpjVMdATuuzS8FZXnz3GjeAGN0Vril2/NiRn5W
 uQS4IxipyQk+wXEKPMbChtiYtkaBzZxIXyiMl4/dzPiZdf9jH/ZLacVgAB2xO1QeOMkrZWNV1te
 Fi59LnA/R+My5NSL7SyiCO8Zt68NfKn/5jj2M81wyibKo+AfAZZGZm7QLHGWQU6N07mqdllFR0Q
 32kvVKDH387BdrWGqleOtA8tWpNi/3+qSYWvfBwkaaq56pGwDGibzkeqyMFW206entSs8onqcA/
 +k/LNDU6uHhKTAWg==
X-Google-Smtp-Source: AGHT+IF/DQRfGtIQg6W64J4VEEsmo42V7SfGYDGoAvZKia3NGYaZKvds/K4oTaFZik2vVHw+jWuWxw==
X-Received: by 2002:a17:90a:da88:b0:32b:9d3c:13b3 with SMTP id
 98e67ed59e1d1-32de4f87cd3mr14889107a91.18.1757973843009; 
 Mon, 15 Sep 2025 15:04:03 -0700 (PDT)
Received: from [192.168.0.102] (200-162-224-93.static-corp.ajato.com.br.
 [200.162.224.93]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32e0c2863e6sm8889884a91.28.2025.09.15.15.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 15:04:02 -0700 (PDT)
Message-ID: <44612e6b-c805-4e60-9f2e-1c1863f5b5f6@linaro.org>
Date: Mon, 15 Sep 2025 19:03:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] tests/functional: Adapt reverse_debugging to run
 w/o Avocado (yet another try)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org
References: <20250915124207.42053-1-thuth@redhat.com>
 <875xdjpubx.fsf@draig.linaro.org>
 <d735ec67-dc45-438c-9151-6ced6ff49b77@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <d735ec67-dc45-438c-9151-6ced6ff49b77@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hi Thomas,

On 9/15/25 13:18, Thomas Huth wrote:
> On 15/09/2025 18.13, Alex Bennée wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> Here's yet another attempt to remove the avocado dependency from the
>>> reverse debugging tests: I basically took Gustavo's patches to rework
>>> tests/functional/reverse_debugging.py, but instead of calling that
>>> through tests/guest-debug/run-test.py and adding the cumbersome code
>>> to support additional test execution logic, I kept our normal way of
>>> running tests via pycotap.
>>
>> Hmm I was getting:
>>
>>    2025-09-15 17:10:50,798 - INFO: GDB CMD: /home/alex/src/tools/binutils-gdb.git/builds/all/install/bin/gdb -q -n -batch -ex 'set pagination off' -ex 'set confirm off' -ex "py sys.argv=['/home/alex/lsrc/qemu.git/tests/functional/reverse_debugging.py']" -x /home/alex/lsrc/qemu.git/tests/functional/reverse_debugging.py
>>    2025-09-15 17:10:50,803 - DEBUG: Using cached asset /home/alex/.cache/qemu/download/7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7 for https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz
>>    2025-09-15 17:10:50,891 - INFO: gdb output:
>>     Python Exception <class 'ModuleNotFoundError'>: No module named 'pycotap'
>>    Error occurred in Python: No module named 'pycotap'
> 
> Ah, sorry, I have it installed pycotap system-wide, too, so I did not notice it... I'll fix it in the next version if we decide to proceed with this approach instead of using one of the others.

See my comment in patch 1/2 about adding python_site_packages to
PYTHONPATH to fix it. I think there is no harm to the other tests
by adding it to the test_env, so I don't think it's worth taking
care of it only in reverse_debugging.py.


Cheers,
Gustavo

