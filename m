Received: by 10.25.208.211 with SMTP id h202csp1162126lfg;
        Mon, 4 Apr 2016 07:16:37 -0700 (PDT)
X-Received: by 10.140.101.145 with SMTP id u17mr8210001qge.59.1459779397607;
        Mon, 04 Apr 2016 07:16:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a198si22407200qkb.68.2016.04.04.07.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 07:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an5Iy-0003lb-VG
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 10:16:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5Ir-0003aS-JZ
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5Im-0006sh-K7
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:16:29 -0400
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236]:33485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5Im-0006sb-CL
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:16:24 -0400
Received: by mail-lf0-x236.google.com with SMTP id p188so145694129lfd.0
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=IJk2Wlg34sxXqmufKVNn+GeMBgemBQ3CcdpEMsTVlf0=;
	b=cPNJuG4X4yFoQfAeYrWKVjAZurUpud9wuP6E7vdf9hRTyQ9HrImg07mBqnpzGE7WEM
	txYnC1sb1ybtk6buN948FRSUIbMn3lw5X10tJhDr7lId5WzBQJtIiVPSIIChDt6A7Q7t
	bledbUHIGKqYQQTFDCnVBBq10QdOpBiG6UVis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=IJk2Wlg34sxXqmufKVNn+GeMBgemBQ3CcdpEMsTVlf0=;
	b=GK4UkG6mfQRkpXko6fHcsjjm5ZkTSlT4CVGAV8pTjE2e9Akyi27eQ0T9Oew5B1Rvqx
	LCDvypXsFQvM1xQJbpiUmFx23rJzmj0zJphwkuI674L/ub7MJSS1cmAEffY2kXUlpaWw
	A7Ktx5wutHKCnHj2qQG/JmosZHxfwAQwMKTyDz7HDJwwF7l4h16vECM7z6aCyWJIPNQ0
	BbcX8c/m6PnWZaOrIsIcjuDYN+JkqI9U+iQjAdz/K3U4YvqKBo3Va5I/K4mfR3KFXx8G
	xk7wXA5VVAkVNrSXzeWgAFV8AuDgajNzFUaQWjrxGP1R4/mOPf2k9E0ID+ouu7zAV4Fr
	Tp/g==
X-Gm-Message-State: AD7BkJKhOZY8qdiVciL8bsRvP5gbyq5PX2MtLpNSXfI6dHtwEph0R/J9fM5nx7HxvW2qnpyQ
X-Received: by 10.25.10.216 with SMTP id 207mr2338536lfk.44.1459779383437;
	Mon, 04 Apr 2016 07:16:23 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	m65sm4820454lfm.13.2016.04.04.07.16.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 07:16:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-3-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <5702772A.1080005@linaro.org>
Date: Mon, 4 Apr 2016 17:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459435778-5526-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::236
Subject: Re: [Qemu-arm] [PATCH 2/4] target-arm: Remove incorrect ALIAS tags
 from ESR_EL2 and ESR_EL3
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
X-TUID: OK58bSfBAhpd

On 31/03/16 17:49, Peter Maydell wrote:
> The regdefs for the ESR_EL2 and ESR_EL3 system registers should not
> be marked as ARM_CP_ALIAS, because these are the master copies; the
> DFSR regdef in vmsa_pmsa_cp_reginfo[] is marked as an alias.
> Remove the ALIAS tags so that these registers are correctly migrated.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.rog>

> ---
>  target-arm/helper.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e583e6a..0e54d90 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3509,7 +3509,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, elr_el[2]) },
>      { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
>      { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
> @@ -3759,7 +3758,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL3_RW,
>        .fieldoffset = offsetof(CPUARMState, elr_el[3]) },
>      { .name = "ESR_EL3", .state = ARM_CP_STATE_AA64,
> -      .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 2, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[3]) },
>      { .name = "FAR_EL3", .state = ARM_CP_STATE_AA64,

