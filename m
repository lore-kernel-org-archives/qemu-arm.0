Received: by 10.25.0.147 with SMTP id 141csp366610lfa;
        Thu, 2 Mar 2017 08:44:57 -0800 (PST)
X-Received: by 10.55.78.1 with SMTP id c1mr11693345qkb.251.1488473097319;
        Thu, 02 Mar 2017 08:44:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a44si7295269qtc.322.2017.03.02.08.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTqY-0004BJ-KR
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:44:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTqO-00049f-Og
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:44:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTqN-0001bN-T6
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:44:44 -0500
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:33757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTqN-0001b0-MG
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:44:43 -0500
Received: by mail-wr0-x230.google.com with SMTP id u48so56696643wrc.0
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HJ5BwLo5YRAZOmF2Iu+ymdV0ek0ebUcqOjc8hF/o24c=;
	b=YpZ46yj2cX6gqh4TJWqG7OI8suE8RugcSA8PWH4NBFTiGB8s2KuFBuVcPGsAR6AuH/
	WMH8qlMJjaFpgSRiV5QKTBhJqUhS4rm7JiVB+dDmmCXSCa2W4mEinzICw8iBP9swBGUW
	ex5d1b5FFtIFSDSHtrvHBtCw8pqcPgE5iCgl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HJ5BwLo5YRAZOmF2Iu+ymdV0ek0ebUcqOjc8hF/o24c=;
	b=WwRLvIRqShgchM3Kl7SO5llteq2qZQ9Y3/a5/cha96udcryy/Iy/kWpqfUkjjyj0dr
	LFiY9ub7dxyhy0UU1anrsuC1lXAiAcXcrwqJjzy78NkW9g4jcHoz59lrQW5vy9W3zvlk
	MS/fZJ6cg8C1EgVxzAi+dU6aN6uar9CWMtCkK3vahrT0ThK7L+DEyat558dk8H6l8kxk
	/bFn91sQPdQngNg0LIDOo0Nb5cWKMEyU90ZsHqzBUYMA+q/xOJeYwwyAWZzSiwU3D0GC
	rl7c4HPlt7T0FKNygshNrD1p7im7ABdRyxSXo8YvgN446nUHN5R5qPUTQQny9zRGky0R
	bQig==
X-Gm-Message-State: AMke39lTt/qPeehTDQcnp34wUHHkQT6cvGLPEAxJAtc/s8YQsAvx9sR2Jupsmfvxd1pd8nDj24e76q4QzpPymT72
X-Received: by 10.223.152.215 with SMTP id w81mr14460675wrb.151.1488473082545; 
	Thu, 02 Mar 2017 08:44:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:44:22 -0800 (PST)
In-Reply-To: <20170301182618.22395-5-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-5-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:44:22 +0000
Message-ID: <CAFEAcA-mc6JXzq=s7C5tkH-rokibOPtpcuLee10k1b1PYqxz1A@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [PATCH 4/5] hw/timer/exynos4210_mct: Fix checkpatch
 style errors
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hD5zmfE3jQjf

On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Fix checkpatch errors:
> 1. ERROR: spaces required around that '+' (ctx:VxV)
> 2. ERROR: spaces required around that '&' (ctx:VxV)
>
> No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/timer/exynos4210_mct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 76634fb1b4fd..4dd3e441e2e6 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -936,7 +936,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>  {
>      uint32_t freq = s->freq;
>      s->freq = 24000000 /
> -            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg)+1) *
> +            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg) + 1) *
>                      MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
>
>      if (freq != s->freq) {
> @@ -1160,7 +1160,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>
>          DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
>
> -        if (offset&0x4) {
> +        if (offset & 0x4) {
>              s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
>          } else {
>              s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);

PS: you can shut the patchew robot up if you want by squashing this
patch into patch 3, since one line is being changed in that patch
anyway and an extra line in what's a "fix whitespace" patch
anyway is no big deal. Or you can leave it the way you have
it now; I don't mind.

thanks
-- PMM
