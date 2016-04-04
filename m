Received: by 10.25.208.211 with SMTP id h202csp1182250lfg;
        Mon, 4 Apr 2016 07:58:41 -0700 (PDT)
X-Received: by 10.141.5.137 with SMTP id h131mr25239524qhd.47.1459781921126;
        Mon, 04 Apr 2016 07:58:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h204si22450098qhd.117.2016.04.04.07.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 07:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an5xg-0004lF-Js
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 10:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5xd-0004ii-Kh
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5xa-00012J-Ge
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:58:37 -0400
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d]:32984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5xa-00011D-9J
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:58:34 -0400
Received: by mail-lb0-x22d.google.com with SMTP id u8so164949640lbk.0
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=z7l9dFNazmE1St1NveLiC0+zjTdZoxc790j7NIgMWMo=;
	b=Rd+8Tob5fSjqFCFCNqmsEyEvqepNrx0vpheFY9lkwyVfNDC4LLYBUTeru37vYfIu8t
	TqbvK4bziJLSVYRaNB6tWbqSf8wZBlMK0fBpSWTsFIkwXxwiNiZomUsN6MhSoWZ25xVn
	QGDX78RLYP/bJqK7xM1G68vPtaBuDUitftOjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=z7l9dFNazmE1St1NveLiC0+zjTdZoxc790j7NIgMWMo=;
	b=MQixj2mvYRgUIR3WMVFl4NZxc2QKrzmGXNvJNyp6h4ZHvkUgf7TFeiXrykYqSFsu7c
	e0lu0huFbeyKymZFk3rBX3VtyX5ne6MoHNesiHqCyDqoqBZVex7El8ZC/2oM6Pm80/KK
	EuNedELP0vErYWGN16GouMRttKglqlrRSgV4qMh+SB7bW+5JCYj1fWU1/63EhIQxYlYw
	6yFjjcErZRyMfyl+qrJ5/LIV13uYqvOkG8y4NONjjohEmBpQzj1IwQ6aMDVfi8IdA9q2
	MDl21Xin3x9Iu8CrVN5bJelEead0qfuMcJ3JoCpv+nPfCwhs1wCQXCsYxTZTMEBpY1eP
	HrsA==
X-Gm-Message-State: AD7BkJI0pNTPgrskOy45mFRvSQVjA365j0XqAIXE8AOhj+NV71QIxIwI/vCXZ47JM3w6ohCa
X-Received: by 10.112.201.67 with SMTP id jy3mr7280803lbc.25.1459781913287;
	Mon, 04 Apr 2016 07:58:33 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	k190sm4861105lfb.20.2016.04.04.07.58.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 07:58:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-5-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <57028117.5090008@linaro.org>
Date: Mon, 4 Apr 2016 17:58:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459435778-5526-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22d
Subject: Re: [Qemu-arm] [PATCH 4/4] target-arm: Avoid unnecessary TLB flush
 on TCR_EL2 writes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b4NtjJYDH2nM

On 31/03/16 17:49, Peter Maydell wrote:
> The TCR_EL2 regdef was incorrectly using the vmsa_tcr_el1_write
> function for writes. Since TCR_EL2 doesn't have the A1 bit that
> TCR_EL1 does, we don't need to do a tlb_flush() when it is written.
> Remove the unnecessary .writefn and also the harmless but unneeded
> .raw_writefn and .resetfn definitions.

How about TCR_EL3 which doesn't have A1 bit as well?

Kind regards,
Sergey

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 09638b2..4dbd844 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3559,8 +3559,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0 },
>      { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
> -      .access = PL2_RW, .writefn = vmsa_tcr_el1_write,
> -      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
> +      .access = PL2_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,

