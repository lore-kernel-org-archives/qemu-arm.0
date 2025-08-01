Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208FCC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 18:07:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhuAH-0007gn-20; Fri, 01 Aug 2025 14:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsfi-0002GQ-Tz
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:31:57 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhsfD-0001Ur-Nt
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 12:31:29 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76bc55f6612so2193809b3a.0
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754065881; x=1754670681; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMBW97dYR020kODyfOzISwb1ViVO6GCqGrwFmYO8eF0=;
 b=Yvy6b6DIILGS+hOdpyVdiDBME1WFAuw0j3sMxZ8HvvwvKiSpDz2nxLlajFhcv8lCg6
 GvPZk3TXZXTxU7uTv+34bCE0uoYdli82goCrzAsdcuXYI6yHLm+qJJw6Fn4mlT6LhFph
 tVsMw9jcsjKWFFTrEiYYPJ+uVRq6H1fl9JJvf0K3uoTb6sbx+QEHfO0D0rK/+Bdh3yxn
 Hn3lxqmiwHM900fDqtoutSOeoMqjj2b3/bIRkFrXli78mnQItRX9D4iC5Z6ikYB55ccZ
 noZDCRb1QuEh2GE4x3gjlUi0MkE8bZvx1rcbVbB0ujCpdmhAhRkOt7cejH+xdlWOxNYA
 QCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754065881; x=1754670681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMBW97dYR020kODyfOzISwb1ViVO6GCqGrwFmYO8eF0=;
 b=K3IZO2pnjt9GpdVOKDq1QAptx0fghM93+IBbfdTyes3ZxxURzBVRVoZ5NwIh0w12EE
 xdZQZMq/+CDMUfaiHIfLp4xnX0jwf8YjjAcrgP9ydDOJkdzYGKH1T/Cjnk3x/Kbt6k3q
 zUHCMMmBJ1SUj00r0cI4bamE6oDw4t6rX0qHLMLsTnB/f4GIVIseimZiPrFtvqbJaZUe
 OjuJmrMhYjzzUBE0/bIogNWF/BYBSZ5jO4LvJyByq6Y8JE5iau92hyBU4xhHQe5cHKUq
 Mp8RPLiyqrp+fBiVVua3u6kvooItOXZTA78iqeMFy1fFuYwXgOOG6A37KSLF9SajgUwl
 1p7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUywk8M4Ws+L5bZDglw4gN2jTsiIyaiDF3/7v8GgNM/9g45GQqLXm9qurbMf90VYWw4p6JMF3sw3g==@nongnu.org
X-Gm-Message-State: AOJu0Yzj5Wu9g58+h84zvYXyiG9Wf2vdax8uL1a07yQEDn+VBGusprvS
 ZHJ/e6rTBmaBhQ7GXwu0PCgjI3P/OEDu+tPHhkfrJH5ezyE2p66R8jwLfz3523OoRdE=
X-Gm-Gg: ASbGncvQA0WVua4c1Evckyg50YSvFbfTwBruX0Tq3TvNWg6knOp9rS2GnrYC5KPX7/5
 uodsLNTxWg0Rew9qC+Ocso9UVyM/MKwQwFX5Dn3+Kc2qVDVm4XnXHmNehbHzprF7/GvVl31acEK
 9XAiq7w/0Y/VjY8b44bsPoESmgOC4sU20XJyTzYZD4PfjhGVa3Y2UrlO4lwa4HbQpkbpR6s0jcz
 AyjQ6s7e3hhYMbGrjFAs7rOVezKKynxoA4lHaO/H0pwjBXLZHZDuy/1X9dRVMAr6Gs85xyRPV7s
 t1u+ZEBviv4tv1Mtfz1iCJiOR/HTg7AM6Ty1d+d2CMnZRr+1OJ06KWqEMQ/u1VFC/rg3baxWKiE
 Y4ZJJXee14S37VQSye0hv5tzuQZPP0Dk6vZU=
X-Google-Smtp-Source: AGHT+IE89dSRulYtt5XDHOTYLSiufFjTSiYPp19Oh/bizB64yb5TBW6dWkS5sEVywNLlLuHpql+c5A==
X-Received: by 2002:a05:6a00:1acd:b0:736:9f2e:1357 with SMTP id
 d2e1a72fcca58-76beaa8445amr334697b3a.12.1754065880741; 
 Fri, 01 Aug 2025 09:31:20 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f943sm4524936b3a.12.2025.08.01.09.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 09:31:20 -0700 (PDT)
Message-ID: <034c953f-dce6-4068-8f93-05e758e67703@linaro.org>
Date: Fri, 1 Aug 2025 09:31:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
 <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
 <144f0930-af30-42b0-849c-99242d3f09ee@linaro.org>
 <CAFEAcA-ycO=AO8UO+X3f6pw34J=iFwW3dpPyMXKm5BzJ11dt5Q@mail.gmail.com>
 <25fe9c70-be00-4884-8d91-53dfff745cb6@linaro.org>
 <CAFEAcA8qHUT-0k6chAFZ61J=YZ7xLvhYgqsgtQiCgkfaxfFRxg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8qHUT-0k6chAFZ61J=YZ7xLvhYgqsgtQiCgkfaxfFRxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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

On 8/1/25 1:34 AM, Peter Maydell wrote:
> On Thu, 31 Jul 2025 at 19:30, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>> Regarding the "modern" completion support, I recommend you take a look
>> at it. Even though you wrote or reviewed most of the code you navigate
>> in everyday, and thus don't need it, it has become a standard tool for
>> any developer, like sanitizers or omniscient debugging. It's especially
>> interesting since those tools are based on compilers (clangd is the
>> standard for C/C++ nowadays) and not a bunch of clunky regexps.
>> It's even more interesting when you learn a new language, like Rust.
> 
> I do actually have clangd enabled at the moment in emacs:
> but my experience is not good, because typically what happens
> is that clangd runs itself out of memory and falls over
> fairly frequently, or it produces obscure error messages like
> "LSP :: Error from the Language Server: trying to get AST for
> non-added document (Invalid Parameter)"...
> 
> So I mostly continue to investigate code the way I always have
> done, with grep.
>

By any chance, are you using an old version of clangd (or an old 
distro)? It has been a few years since I didn't run into any issue with 
it, and it's quite easy to update it using llvm apt repositories without 
updating your whole system [1].

[1] https://apt.llvm.org/

> -- PMM


