Received: by 10.28.91.67 with SMTP id p64csp1839704wmb;
        Thu, 1 Mar 2018 05:37:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELvyVV7szK1mWF8ERjKy+AE+gL4AlYTe554nxKcTVJLKMWo7fkpxgUowPXbpJD46eIxhfRIl
X-Received: by 10.129.174.94 with SMTP id g30mr1026575ywk.406.1519911456412;
        Thu, 01 Mar 2018 05:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911456; cv=none;
        d=google.com; s=arc-20160816;
        b=rc6o4xEdSNhQF9KeBRUCfD5onHAIyOoVkJN0tq8FSNj4WRPmbjuOHNKvoHRBIFuVFW
         9DRlhqXSUhFFfijU/qJ+X0025Azs8hurS/jR3kZZmj+1RinE7aSSyU9SZ5k141THGCM/
         AT6asa+1eFomBdnnoPrtPPdVAmEVS2vXax0B6dgbyfJ/PUQNRJDuOfP8RBI3d59dTeAK
         naSoNeZ0KF2UVaMlRMoV1geP210IHdCvqssJKYL1a7f9MomLnkCPLYZyVSNgJJnn66CO
         IlN+ab0xX5ctoh4/XZGxMk/muVYMvAg4PSX4Fp6GFfsVyY837E3iqRmfZh9s0w15SZOl
         aOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OGUqxhauVmIXe7upFIlmWSj24EzkDt0M+jndsY9BGRA=;
        b=nuf1Ttpaq/XTjzyPAwjJiYIiUWqBR8h5YFn5KBfuI1M3fH72SPXRU9MvZBcUMqaFX8
         Y83BSPiK0cGBswgpmkQ/h9EtPm8p5LDLBamsNrW42SswEdbNqhYn+oHHd1yxhYFP9tAj
         LNG1QkMLKdk6u7u3Q3CmQmTpe5yKExIyx+q0x7l5tQ/akQXdqrrF3obyfzkAsjV9PRVQ
         zP+HcEFa20tXkTV82FzW7XNivCbeaGrR9I7OMqcZ7SW+jyvbkjCLmYp4UO3CETLYeMlR
         9NKm1JTPc7D7B3RUoYBXKU73Ou8T3UKLF0siEeE5Y0qSqoNBVyC3LfYLQkStEIn/ENkW
         EawA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcn3VT16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z10-v6si637876ybk.485.2018.03.01.05.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcn3VT16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOOt-0002KP-IO
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:37:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO7m-0002da-Tr
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:19:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO7m-0001DM-0V
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:19:54 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34253)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erO7l-0001DB-SE
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:19:53 -0500
Received: by mail-oi0-x243.google.com with SMTP id c83so4442176oib.1
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 05:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OGUqxhauVmIXe7upFIlmWSj24EzkDt0M+jndsY9BGRA=;
	b=Qcn3VT16ZXMcAaANLcGt5Qlb1KgcsSE6rGc8eIe60Sc5LboO4DcPkLoZ0OBvqfgPZl
	9aj6zFxbPuIP4Hrm9G5fta1GDRWL4M3dDUT0jKL2hp9GoEnaxDFWtlF0zS9InVe2y7l+
	cICj8U7Js/PyoqhxLT8oe/6ElJKhTuO5p5VeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OGUqxhauVmIXe7upFIlmWSj24EzkDt0M+jndsY9BGRA=;
	b=T052+gWqca4S/+Z6c1jfqdOpYkU4O5Sq69vDvMjThmgL3+0AvameV3Agaf6JYdWxSB
	x3pbEqatJh6OrcYZdAMQQTt74OUy4x9+HEJhq6ghtzeYetgPcmyO2hCaxdqXnqwrwUnc
	+zObbVMWJUDAXdyFJBvskFOQ3xXYx8IouWNsI0YxoistN4BPsQjxQMxLdEPBaCokfGSz
	zWbjy0JB4mOVNh9UPbGPM0+W52dWDY4N3rExqXOoTYWDR740yBPlvMuqwjP7fJ/qMiJZ
	B/xa0jGddyMi20aqw1y8ioeEupqjSssvDphaifS/YZfx1YazauYpk3SNXhfwRBfF7a/9
	4mww==
X-Gm-Message-State: APf1xPCinKuV/qO88Ko4gUvG1ObN3anR5Zwj/y92XVYVDCFHowtsmEen
	sb2kQ+oXi3BfDryQQsG8MLwwhhebzwiy7b0k6tXvNw==
X-Received: by 10.202.90.138 with SMTP id o132mr1048585oib.11.1519910393323;
	Thu, 01 Mar 2018 05:19:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:19:33 -0800 (PST)
In-Reply-To: <20180228193125.20577-10-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:19:33 +0000
Message-ID: <CAFEAcA-9JBhK5q5UzXHKBDYi8z12tKhDhTw693oHZYEc3O_WNw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v3 09/16] target/arm: Enable
 ARM_FEATURE_V8_RDM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 884Beu2w9Shl

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
> index 1b3ae62db6..ca5fb1162a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1650,6 +1650,7 @@ static void arm_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
>      cpu->midr = 0xffffffff;
>  }
>  #endif
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 9743bdc8c3..7246866e7d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -230,6 +230,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
>      set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>      cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>      cpu->dcz_blocksize = 7; /*  512 bytes */
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
