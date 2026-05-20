Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9A3CD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkzl-0007XM-Mw; Wed, 20 May 2026 13:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkzk-0007Wj-EK
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:46:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPkzj-0000hd-1H
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:46:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso68831765e9.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779299169; x=1779903969; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/MdWWD+sVqh4x7iejwXNvKAXdmKR8sE+0stC+pn0ozU=;
 b=HJ+B7Xxcw1678kNJfhUYwt1TmHzd4IKIFCObayT7Hg/DgiJ7P+uD5OxYMtrCwrAMma
 8lzTGvC3EEscNdJ90al7YYdFyDlSJ33/nAC+GXvSsh0o12Mqyd27nM4RBHOFPqeLQFL2
 t1CVQkpVndcqUt8GDu1SmP6JC7FiyzCJ8iaPodnT9ZXrIh2BckxhRWa39KZeFviUnBZI
 mOqjBKjRJFsZZmK3BXUUG9DvTvrkaQTdgbavNEzEC2+Obejwns6es2x9FImHeMhQZV1B
 Of3CjASfigexALYba+EnkTO62RtMJt0CyL2dT5ekL4MDU1YCYgSPFdeBwfZgvB1RDNqs
 fXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779299169; x=1779903969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/MdWWD+sVqh4x7iejwXNvKAXdmKR8sE+0stC+pn0ozU=;
 b=ZnagjmFGhfM+284McuBLv4B0ibCNFS4AlYJcFDDmmCpQeRrgapq3Eo4auQntj+/lZH
 0q8xfdQPTXODeX/ZH7dXuJSvhHerF8qZNKDslU8TiskJ3uIKV2BC8/xbpJTvesUXIe2O
 LUW7DV0lIBMuf2T8FL5m7Gya1JvI+9UEZS+rK7HpA3JTcGGWSHs4aIdK8sCy/FNlhxoL
 vphqv+vgQ0HcZB5eKEK01EwQkNA+g9Yj1q8/Jjt9IFBJYFSB0SCQnucYlVv7/rNn0xa2
 ndPpkKzhDJA9lgA5ZGpZGmxW5GT9sWSpdBqgyZzquLMJ2AMz7OoIsiaSWeePBZn/04It
 zS7g==
X-Gm-Message-State: AOJu0YzTIYaog8R77VGyOgopWlFSeDBMU3PMbIhESiAC1PsVdPW9PREp
 eoiNuvDGK0AfbTINZHpp6efvyTxMwQZYLxJM9hobf4fE/B2vms6G8ZsbSbFvCcJU6G0=
X-Gm-Gg: Acq92OHl/3dZI/a09hzR50qcrqzkBk4SB+ZYg7YthqcaNWJp9lsUTOcPd2DPoQUcaWx
 MuhHWgMPIOXEGWxfHC4kqrj+hbRhbtIRvaJe/NfQV0z+uI6Y0iJ4xByEII6lLQkhPnJk4SbN7bh
 E+G4Ldx5cX0ywuDjLQ9Xd2zAlNFJ85xl1k62ccRSaCOxJfu1xuh+oG5snGNq71AG3MSzGZQ5bNX
 oSw6bJ3lGa3pfb9Q4ZVQx2iPHjPkjyCirF9P6R9RVxYjek3UbUP0X6fU57CPG/XMZokw5Zzuzwt
 GnVwxmFGxnD5ESi5HvhLFVeapNRGij1M+C/v9UpglmzRN28pcXVrK6RT4tn0B+NyBQZ8pug6m1u
 BC53HflWdz4kRcK6hy4898XEf15JHzYDHBqGN5wYviNlCUl4qNxEKfVzwlL+GfQlO06J5V+9esO
 rt9ULi3Pg8AJM5cRCNc4utlN52mj4MnhJq1k8zkSDGjdkNHe3mcISKUxnK1w4dCbpACA==
X-Received: by 2002:a05:600c:620d:b0:490:18cb:e820 with SMTP id
 5b1f17b1804b1-49018cbf419mr148205745e9.21.1779299169228; 
 Wed, 20 May 2026 10:46:09 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033cd756esm8035025e9.0.2026.05.20.10.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:46:08 -0700 (PDT)
Message-ID: <e2a8ab06-7021-4a36-87eb-8f428f359f12@linaro.org>
Date: Wed, 20 May 2026 19:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/30] fpu: Export floatN_minmax
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260520171820.848839-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 20/5/26 19:18, Richard Henderson wrote:
> Allow target access to routines using the minmax flags.
> Make the existing min/max wrappers inline.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/fpu/softfloat.h   | 93 ++++++++++++++++++++++-----------------
>   fpu/softfloat.c           | 50 +++------------------
>   fpu/softfloat-parts.c.inc |  8 ++--
>   3 files changed, 62 insertions(+), 89 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
(as in previous version)

