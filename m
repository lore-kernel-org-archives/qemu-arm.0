Received: by 10.28.91.67 with SMTP id p64csp1844797wmb;
        Thu, 1 Mar 2018 05:43:00 -0800 (PST)
X-Google-Smtp-Source: AG47ELsl/VSEmdB97O5ERjORsrUDiWmZOD5MZosU31j1hP/DxU6Rf2TfZjNhqADl3j0d1SwQX7na
X-Received: by 2002:a25:9989:: with SMTP id p9-v6mr1079429ybo.12.1519911779925;
        Thu, 01 Mar 2018 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911779; cv=none;
        d=google.com; s=arc-20160816;
        b=U0Ai/kYqB5+9ICdhx8VH2KhkixLJy+X3zLbwckZkap2IGSaTW36Crt22Srfg28wuum
         Jz9KOdZ/s6rlJbix5mRrQCikCgTZpad0fqmN7VmbdgIxriD2jxpYcXhF9zSQetkq39cc
         t4yoNWHXr4Xqv/Es2EfYKl0AIARfh18p2ADhfBZUzQbE+tnuj9vT9qrtgARKepw1JxWJ
         4D2YG/AtXCNdS7v87pHJJraJcqEzyJJ8FkWA9+vrcmsvMcXk2jgLeBuJ6cq35NhxEGQn
         9MQXtxcjUIunKZ0AHg2twMVePArjIe+GVWXV1de8k9QH5Dn3AWlQ+VcYnfvmGguDGcYt
         iyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BJEdcqTCfBxyqpl/XmFXxhz/Foz9aVDcqjqaBeR0yiw=;
        b=zsCxuNE0aDmmIgu5DPY3LVUzWguPmQvT/tg2Ljzi5rfEL0LfBImeouIi5zvdzIO4dY
         G/8GUDpj9F0GHyB6QaKu2McdKN8iuBzLOLtWzWKj8/MEWXaGb2thvKxzszaopXylZGdw
         xfY00ozrrk8R2cjyOafMjlUE2giTEa5eCvvcixO5uDCK5X2BHxnlKndwM9FY2kWr7OnR
         h5Xa1mzOeqwv7Kyzxo4/LwRM6op33JeZ3LbL/HrcIv5Vw21i2sC4vXljtzW6gFcy60BZ
         OGRag2rszQrsBArAodtJ+Lya69sxksA7BP6Rc/NOD2YzQvD63WaWvBsN3Wrxw0Wvblq3
         p25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dtW3PhF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l127si635513ywd.726.2018.03.01.05.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dtW3PhF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOU7-0007ex-9S
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO8z-0003gS-GN
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:21:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO8o-0001ka-9A
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:21:09 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erO8n-0001k2-Vw
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:20:58 -0500
Received: by mail-ot0-x244.google.com with SMTP id y11so5540308otg.0
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 05:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BJEdcqTCfBxyqpl/XmFXxhz/Foz9aVDcqjqaBeR0yiw=;
	b=dtW3PhF7Q9rw9kFy6IIPbgFz2xiCcWlE3slQvABvWVZc9qjqWwnqqGf7V2tckrxW4q
	5xdkGxlBTcLA4BjtjNYuV6+S0DFJF7nVK0KAiYwTwqyndY7AmGE11Jnm/Eok89STf/Gk
	iUPeA15XmtcDvSDBu5t7zfYbSh5KSX46shvl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BJEdcqTCfBxyqpl/XmFXxhz/Foz9aVDcqjqaBeR0yiw=;
	b=FYBU2FBoXyQx7WMAfDFTUyMOjagx6xqCS+xnys7iQ8IpXvQjxckFbgFXuz4LYzI2Zn
	/oSLTtaTHcLgeKrp6UH61GvOZovUWjcEhRWlc/Tt+MPV0eb3B1EVKkfq9U2bu5cTjV9G
	VC21FzZjIL+n+oZHDBd9s/aqcUv9F4EDSZozF+asqtK2vLU2QxMuEA2H3UmjQAzTB1X6
	+II5haQdbxEtJ23UaM29trF4QwAUhCRh8ESNb5E7uJFimYMT1/hwfnmZcL4F518uUZy5
	qiHKa4QCb0MGLWkHEfsfVstKbWnJDkgBqY2KgBzUxRzjlhIGQUvwwTcC85NPmitM+1HK
	e/6g==
X-Gm-Message-State: APf1xPAU/4SY7rZkGLN3/ztsAeDfFD9MdGfZpZ3UYTjJzoTMXGDOBZHq
	XjCMrlPO9YqtZh0saKX3gd2P8WU04UrIFoHCcBzq1g==
X-Received: by 10.157.72.231 with SMTP id a36mr1310806otj.308.1519910457270;
	Thu, 01 Mar 2018 05:20:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:20:36 -0800 (PST)
In-Reply-To: <20180228193125.20577-17-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:20:36 +0000
Message-ID: <CAFEAcA_o86z59NmYJhbdLbZnvZ0kdAuSRqLrwrVkysS_+EDqqQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 16/16] target/arm: Enable
 ARM_FEATURE_V8_FCMA
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AC5PjVM3+U/7

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enable it for the "any" CPU used by *-linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c   | 1 +
>  target/arm/cpu64.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ca5fb1162a..452bc32f10 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1651,6 +1651,7 @@ static void arm_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
>      cpu->midr = 0xffffffff;
>  }
>  #endif
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 7246866e7d..4228713b19 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -232,6 +232,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
>      set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
>      cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>      cpu->dcz_blocksize = 7; /*  512 bytes */
>  }
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

We should be setting some hwcap bits in linux-user for these new feature
bits (and RDM), right?

thanks
-- PMM
