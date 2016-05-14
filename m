Received: by 10.25.208.137 with SMTP id h131csp503373lfg;
        Sat, 14 May 2016 03:08:55 -0700 (PDT)
X-Received: by 10.55.148.130 with SMTP id w124mr21296821qkd.203.1463220535037;
        Sat, 14 May 2016 03:08:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63si15120400qke.156.2016.05.14.03.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 May 2016 03:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1WVC-0006K3-Ha
	for alex.bennee@linaro.org; Sat, 14 May 2016 06:08:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1WVA-0006Ic-7J
	for qemu-arm@nongnu.org; Sat, 14 May 2016 06:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1WV9-0002jE-0B
	for qemu-arm@nongnu.org; Sat, 14 May 2016 06:08:52 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1WV8-0002iZ-Sg
	for qemu-arm@nongnu.org; Sat, 14 May 2016 06:08:50 -0400
Received: by mail-vk0-x234.google.com with SMTP id c189so11650582vkb.1
	for <qemu-arm@nongnu.org>; Sat, 14 May 2016 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tDr4C7h/gmr2MGZUw86DRTntumm7e7i00/E0miWSzJw=;
	b=asgUprEN3zPIoXy+B2oAocsj6xkTmCQ3w9MC8SyzS0G9xFoGsnsFz7BOb6RFXR+k8g
	yP2ygCxwp2IRZmiwQffv2RKS30kiqGFVReK5QNtjIpcCGec49mXnekKIyq1090SDsdVV
	Q9ADDbnV1DDcMmGpnCWsTyenpIuhkQpg75hGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tDr4C7h/gmr2MGZUw86DRTntumm7e7i00/E0miWSzJw=;
	b=LxvKu9os8Jipsm+C+CGL1eyzXN8cJFMU+qAgKC5kMvwyxkKrfZgNYsn+rCrPrk6Wag
	pHLan3nqPTyhW/JIlpR1xcnlHiuanu1Evn3MB/0iYnUJFWtd0Ve/21kNr+afJ3L2k2Z6
	bFLS2tp80P1zGXEOWF+3Ya8gW6AgSSOn7fRMRbEhRkbYQ/d+59ItiXtkLW/GtiIcPFdb
	I+rxWdkhGhdb4vlYlAupApiYF+zcMRWBWrG8a5DhAfDRjrLIngAxYl3ZKyOFt2c7Zj6h
	2ADFizVWHZ7dA/YnT0SfZbHnGLVninC3sMYKLACcJE5xe3Zk4f7IV8RojiYVt6wePRyt
	IWJw==
X-Gm-Message-State: AOPr4FVuFArTlJRpJNsgqPRiC0m5zBHxkUIWQ/dGDoGwwYq2C18qbbYdkGsSBuQmjbptgQk1oK6U6gRcbbzIm6n4
X-Received: by 10.176.4.20 with SMTP id 20mr9917675uav.125.1463220528245; Sat,
	14 May 2016 03:08:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Sat, 14 May 2016 03:08:28 -0700 (PDT)
In-Reply-To: <1463202423-19943-1-git-send-email-tsunghan.tw@gmail.com>
References: <1463202423-19943-1-git-send-email-tsunghan.tw@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 May 2016 11:08:28 +0100
Message-ID: <CAFEAcA-sc7-yoLCb5sh-1jN4er7aMcQgM9kWed5--90_cqXmiQ@mail.gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH] target-arm/helper.c: fix access rights of
 SP_ELs
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
X-TUID: 918g5Vln8vR8

On 14 May 2016 at 06:07, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> Fix the access rights of SP_EL2 and SP_EL1, which should be able to be
> accessed from EL2 and EL1 respectively.
>
> Signed-off-by: Tsung-Han Lin <tsunghan.tw@gmail.com>
> ---
>  target-arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index a2ab701ca5c2..8d4b03b5141b 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3326,7 +3326,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
>      { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
> -      .access = PL2_RW, .type = ARM_CP_ALIAS,
> +      .access = PL1_RW, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
>      { .name = "SPSel", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
> @@ -3526,7 +3526,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0 },
>      { .name = "SP_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 4, .crm = 1, .opc2 = 0,
> -      .access = PL3_RW, .type = ARM_CP_ALIAS,
> +      .access = PL2_RW, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, sp_el[2]) },
>      { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,

The ARM ARM defines that SP_EL1 is accessible only from
EL2 or higher via the system-register instructions, and
SP_EL2 only from EL3 or higher (see table C5-7 on page
C5-288 of the v8 ARM ARM DDI0487A.h, or the register description
pages for the two registers). Why do you think this is a correct
change?

thanks
-- PMM
