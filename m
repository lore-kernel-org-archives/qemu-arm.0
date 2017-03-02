Received: by 10.25.0.147 with SMTP id 141csp365289lfa;
        Thu, 2 Mar 2017 08:41:25 -0800 (PST)
X-Received: by 10.200.57.162 with SMTP id v31mr19459239qte.173.1488472885279;
        Thu, 02 Mar 2017 08:41:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u57si7318635qtb.149.2017.03.02.08.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTn8-0001OI-L3
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:41:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTmN-0001N0-NC
	for qemu-devel@nongnu.org; Thu, 02 Mar 2017 11:40:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTmM-0008IR-T8
	for qemu-devel@nongnu.org; Thu, 02 Mar 2017 11:40:35 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:34785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTmM-0008Hw-MR
	for qemu-devel@nongnu.org; Thu, 02 Mar 2017 11:40:34 -0500
Received: by mail-wr0-x22e.google.com with SMTP id l37so56588424wrc.1
	for <qemu-devel@nongnu.org>; Thu, 02 Mar 2017 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bhLuit37I7yF0710jo/9zmoF1lIPTekNqtJX2Wod6DM=;
	b=c+ZNKrfmYULpvohfs74XKBTXLC4/AkJ1bPpOmGKQhZAwb0oQ83CshdA46acjPJevpN
	iRcJRpe8OT3UxES7Nx/p72fhPsjmVaG5vD+jY3GjKX+HrgiiQJN5rGcRb2V3ZUC55fnx
	BtOySnbyqGVIPHbEsHEm9ka59Pkm2VJMXPNDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bhLuit37I7yF0710jo/9zmoF1lIPTekNqtJX2Wod6DM=;
	b=HTGt6VKC7H1A2BdgN6nVvwKlOl/dIao4AP5k4VD7Ei6s3LgpuwzaQHF1bmGW5+0LUD
	8ccx9H1gSgmHoNR++Snr8TBFzjypBSICEPDocAOPQMnfSaRP0+LpooaFCn9G3+QE/gVb
	Vn2GJzfNegNDeGX6/VH98EYusVYkTNuDS9dp3a+0kaUNNTUte4WUdjTJ1/LAMGmHC2Yk
	dSs6B/RZc1pXjOhHXFcbbUfn53cZQLGzzO9/vKN7nXQRik5Nynuk7aNVRBQ0nJtMQ9rE
	C3uiqfx49hoYwAjpfkCAdqFfV4W2fjEq3/HveDDHB1ACEXOgvZ3RXQxcAvqEJQnqO1aj
	zKdQ==
X-Gm-Message-State: AMke39lBXZALwcLZ7/qEDqBXNsVofbQPUqNpJ29vT5ZNxcma2XpaEGnYgeoCflA4hVmuKPTb+hQR1tiWAjg5uJ1U
X-Received: by 10.223.152.215 with SMTP id w81mr14442152wrb.151.1488472833604; 
	Thu, 02 Mar 2017 08:40:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:40:13 -0800 (PST)
In-Reply-To: <20170301182618.22395-5-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-5-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:40:13 +0000
Message-ID: <CAFEAcA9B23Bvt0DrQxN2cQKgg-t8Mo+qMyzXShk2M=2BLYxheQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-devel] [PATCH 4/5] hw/timer/exynos4210_mct: Fix
 checkpatch style errors
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e/bXwHfDBVMF

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
> --
> 2.9.3

Wow, only 2 checkpatch errors in the whole file? :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
