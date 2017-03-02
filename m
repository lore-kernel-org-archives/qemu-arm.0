Received: by 10.25.0.147 with SMTP id 141csp365249lfa;
        Thu, 2 Mar 2017 08:41:18 -0800 (PST)
X-Received: by 10.200.3.230 with SMTP id z38mr18871022qtg.181.1488472878647;
        Thu, 02 Mar 2017 08:41:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si7318140qkc.75.2017.03.02.08.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:41:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTn2-0001iP-4N
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:41:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTms-0001gl-Mk
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTmr-0008V5-V6
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:41:06 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTmr-0008Un-NI
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:41:05 -0500
Received: by mail-wm0-x233.google.com with SMTP id n11so30308348wma.0
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yndx/GHgSgcT3ocj65DzIWaqyod2VAG1FUQF+os0hwg=;
	b=LKYyBzk8AtPlrzfZW7opSGakIpqBu4upq1qE+CsrNh5/BPpa1N77on1F+66AXF9bpo
	a2s2hosKgjMtCoJL3UXnfHiR0sPezaomLcc9kholw4sg7QUn7MeoGZnMnYrWMxfh9blk
	r978avLqaGZ1Gu6nWtqzawJCd1qDP64wYJJr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yndx/GHgSgcT3ocj65DzIWaqyod2VAG1FUQF+os0hwg=;
	b=SMsKciSRK8Exm4keFuOvmnNV1tDQrFbUE+g2EalAKnpaDgoETN8w+LImijK9Cq1Ep0
	w2Q9vZXa2tckC2PkGiQHOu0gDeliOMzY8NoH8nCxUzxARhBvMFxhzN93kgTBGcZsci+I
	ocZ8mWV8FCXEKavwegh3bIuA1MGXs8xhflX/+IpYCqf3GeKw9NufKOc0KNvrcvqq+RBL
	De6Tgt5JSp/qswhRdHE6EluWCzM58hauld9k/7AsL3sbLh0aEoFqmzQgmSrBHAe9hil/
	shlj0u00szqRmGnEwT0OAt2kx7ikgJen0DKVVUsASTIIvW+snlYtBqOKtJn4U+c3X/d+
	YF0Q==
X-Gm-Message-State: AMke39n2OwcBnPWoLqC7eFs77yQuDwiOtf79WoBFz7KsJFmzMnP+pGVLeqtaeRWbK/YdS6VPtXh9S/M0h91hRuzf
X-Received: by 10.28.226.215 with SMTP id z206mr8607275wmg.92.1488472864587;
	Thu, 02 Mar 2017 08:41:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:40:44 -0800 (PST)
In-Reply-To: <20170301182618.22395-6-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-6-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:40:44 +0000
Message-ID: <CAFEAcA8JF0vY0MOs=3MUnSUAdiYPKV6E4w611UeUD55hzV9pfA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 5/5] hw/timer/exynos4210_mct: Remove unused
 defines
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
X-TUID: CdEj5NrAtXmo

On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Remove defines not used anywhere.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/timer/exynos4210_mct.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 4dd3e441e2e6..6069116942a4 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -172,13 +172,10 @@ enum LocalTimerRegCntIndexes {
>      L_REG_CNT_AMOUNT
>  };
>
> -#define MCT_NIRQ                6
>  #define MCT_SFR_SIZE            0x444
>
>  #define MCT_GT_CMP_NUM          4
>
> -#define MCT_GT_MAX_VAL          UINT64_MAX
> -
>  #define MCT_GT_COUNTER_STEP     0x100000000ULL
>  #define MCT_LT_COUNTER_STEP     0x100000000ULL
>  #define MCT_LT_CNT_LOW_LIMIT    0x100
> --
> 2.9.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
