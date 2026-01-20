Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC8D2ECF7
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 12:56:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viBHJ-0000jS-1O; Tue, 20 Jan 2026 07:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viBHE-0000dn-Pi
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 07:56:10 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viBHB-0005K6-KB
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 07:56:07 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64931bbf70cso1391759d50.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 04:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768913764; cv=none;
 d=google.com; s=arc-20240605;
 b=C9E48VE1KXiVXYqtfdu3e63VJeRcej6xr5GY1+byygGY24qRwLLDOEETpPfI+HTIvY
 12nOzdi5dbotxIIFsvPfXQPT0ryXVo7jY/qADVYbrMImaX6P0oMFFM1BAiCFWDh+sZFO
 9Br2JDIjSAENMTKdEr6/tpJlwr0/M2XTejU2z1HZlsKbsSq2QLklpgvu87VeyJso5YaG
 u00v8to2akXw5LTKN4LsxOhrkenjHlmvC3OMV0hMj5sus0dhDhV6c1gdBqdCAlKy9PkP
 282Y9oB4HdR//bzaHIdgRCASQ8Qn6Mh5jm8e+eNgFKmpgl5Ehn3/4ittQSDAGbbPzZho
 stKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=omFAiSpJLZYPxf7ZDkfiMVG/PJNHvB899Uos2656+38=;
 fh=d8ZzdDwSourN3hZ8MyQKo7MAxmnOhY7ZzYzL3By4iHM=;
 b=S28TFFaQkyK1zjzMkyL/a9tNvYXJ3sMP8v4FPHzwOpRoLzYVjAuagsQ3QZGB3XhhaS
 cmF/3Qu9aaX0xYVG979qZcXLNuHI0x9NruSLNRE7zudrA8Q0yWAoCoKpJ83FoAkCOQww
 h6AJUR+RBUvPOD49c4uw1Lzvf6/4/i0qHJ4bTB4Rp4Wp8Id3RVbLf3ZXM06xUdOqTlrP
 Rm739KLg97RGrwju/2L3+f4ixKeKEqh4/KskZQuzwHw8Bfscv58xLKcUzHGwSGYoLKlI
 K47yzK5eut6bpQxh6/X9TxN7Uv/+1nK7pgR7a2m8Y9vMrhoyWDCly1IMywHXjDe6/Udz
 WWdw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768913764; x=1769518564; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=omFAiSpJLZYPxf7ZDkfiMVG/PJNHvB899Uos2656+38=;
 b=EoPSYAluTIvBwhAxYIjEU21skSdIJyyJMjWrG9h6f6vZydP0kmNEayP66tR1N7gTg9
 D+sZDiQq5ZK4zLXxTtqSK/gQr8ZOqATb04IB1APmZgycjThb22Oa2RF7iI2vG5dC7TRL
 CWy5JZQpNQP3XwKHTWHuImArLP3j/a90FNI91ZZR8VkwJdnUM67w11NEDgDF4/0a85cE
 DF9A5tUUYumtdgTPIqRVHkW5NMmi7JjbXbwBHJ5iCklpK3u5PPCWc7dBm+6xuDfZlP0O
 NI7wSoAdus4XBdTx3ZQA+tOh2Fq+eqqbEqY4o9bQFsQKJKvWKKV3CrmnKu2Mq1mzqvzz
 9njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913764; x=1769518564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omFAiSpJLZYPxf7ZDkfiMVG/PJNHvB899Uos2656+38=;
 b=bsDNc/4zh4NcWzAHcRir0dWNWZMvGhsD9YzQ/ue/88Kw7WMfMl0dT+abyVj4rpQdfR
 FEYsXQRe+FF1EtOR+DRi+JW7AFDINIIpXuCfcsmrGRjrPCqWfICZVVJyCQz7xtjgp1oo
 YED1xLrP1flNw8ZNrvemukJVhF9KEGjeWqpbT+qEN25SB4AsRVxkGNlxx0LRHPPfnLCY
 cx9/Md0fHe1p29QGtOehwX65oqgFiyOUsnx6DGDC6x3Unum9GAuva/F5GvvdtaI9ImeG
 ZfUfdsAD88cA94lbqCzdr3ZHRJP/f7F+77YNqPFz9AOD4pzjj01kDEdWYLhQwdjtBwTC
 /HKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUugGLQzhlGtY3GsS6pcyQ1nd3Vj3/B7Q15Nc7YMCRz975McR0gAAwH4+2Q+BKCp8T/cPxP1ohyA==@nongnu.org
X-Gm-Message-State: AOJu0Yw5V6DnD/ixeHgGSarDG9Lv/mbwtwL9RGcMeBLcxTfPrRLDGEBz
 JLYQmF37u0SBBUXZBsaC1xb3Ga4NDrxquRmmkAh5FUF9DYNcM0k3TjTbYGCNvkhX+VBrZDPyzC9
 L1eyG9UPxTo3BkM6LRWeNU1FWY2Nbvx9C/v0DDEjwSw==
X-Gm-Gg: AZuq6aLHZS9pbc3QQ6Gf4clxz8YJaqQToOetDtT15H7qKsFLSWWvUqHX7AciG8Rzk9I
 SzZEr1SjmaRSRreoef2BES9gcjx3PWPOZCjf7Ul/zcp1mARNa7rofx8xRlibv7kgCzeCH/mVQp3
 MrF+sFK8X+BnNe+TyPBGq7/iFX8KV2kFkuOaRadkCMUcgHsVrN/cbjVcCqJ9b+YSlSYqJE2vcaC
 bIcrBGuUhCk+AFPLMlAG/A/nB4qHW7qBLhTGdEXjLOHWmeF8XvPnDeP6kaNDeuZQVTIbA==
X-Received: by 2002:a05:690c:6209:b0:794:87a:fba7 with SMTP id
 00721157ae682-7940a116c60mr27517467b3.15.1768913763845; Tue, 20 Jan 2026
 04:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20260120122108.131708-1-thuth@redhat.com>
In-Reply-To: <20260120122108.131708-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2026 12:55:52 +0000
X-Gm-Features: AZwV_Qi_7BWL_eeKJtOqa4gmPfLmIXZu54cyVs9q_xAA5vB3G8FokRs4ACT2dVo
Message-ID: <CAFEAcA8nzm+CEN_Dp+X+AggcTg57wAt8D43x-7oixLeNH4TDdA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Move the "arm-cpu" compat settings out of
 hw/core/machine.c
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 20 Jan 2026 at 12:21, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The hw_compat_* arrays in hw/core/machine.c should be used for generic
> compat settings that might affect all (or at least multiple) machines.
> Target specific settings should rather go into the target specific
> source files instead. For arm/aarch64, the virt machine is the only
> one that cares about compat settings, so move the "arm-cpu" related
> switches to hw/arm/virt.c now.

I think it makes more sense for all the compat stuff to
live in one place, rather than being scattered around,
unless it is truly machine-specific (which this isn't).
The hw/core arrays seem to be where we put compat
props which are related to a particular device rather
than a specific machine.

thanks
-- PMM

