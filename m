Received: by 10.25.208.211 with SMTP id h202csp3361154lfg;
        Fri, 26 Feb 2016 05:37:04 -0800 (PST)
X-Received: by 10.140.133.133 with SMTP id 127mr2014137qhf.42.1456493824573;
        Fri, 26 Feb 2016 05:37:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v63si13190143qhc.0.2016.02.26.05.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 05:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZIZs-0001sc-3L
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 08:37:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZIZq-0001sR-Mn
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 08:37:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZIZp-0002Xx-Pe
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 08:37:02 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZIZp-0002Vj-Ll
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 08:37:01 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so77076513vkb.1
	for <qemu-arm@nongnu.org>; Fri, 26 Feb 2016 05:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=huFiAF1Hd8GgCQyAB2ID8mgc0SmQMsoNyJp1h7lHVAk=;
	b=d2xUerHWrkzz8+HngufNtTyaz5gnONGwGGqlV4TKi3GUyvp03aYH4bpulGo/er68bK
	7CX9OgM+VSGcIE3rsELdqm2J4wNmpyzGoJH19+IPOU5TyyLf0Cxh/jJqsjiNdBcVdqze
	PpkTGz+at6ibVEL32oixfuyrHfR3gq3+DXkL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=huFiAF1Hd8GgCQyAB2ID8mgc0SmQMsoNyJp1h7lHVAk=;
	b=kj1N7rW5OdLZwNK+8RA5QMI91TM3hyIpJJ1+tsUThkJ0RF6HdHf8EXtOCGJOELIxlI
	lU3bF5ygJFxYvXpLP5aycVuuMceiYFTTZauWx1Wrh1ZDRQxEIiJlqwP0SV1gWPiWkCMI
	b6wrtf2F710f3RxJy+cmX1B6eIHFG4hdRk0GyQym1tfADqB9PeX/PJ1nIe7Q9YmQ3Xc0
	gNj4kV3LuZIcJuKjIEUyMFpFU4o40nb8TLDAAk2RCAwau9Tu3OYI4OmBdERXmvin9JU9
	vzFS649p8lFtRqL2bkWSdjjlXXFTpCuKYAzJB3fXII3fcczjSaUAGUYyx9C5wX2KdjGm
	WCpg==
X-Gm-Message-State: AD7BkJKTdUN31v8fTTiXRE0Hz3h4V9qyIU4/j6ZsY4rZdnJSSxM8LCxfSqcrZ9DhjHZ9NaJqop3gQkYgWtASMZ/L
X-Received: by 10.31.52.147 with SMTP id b141mr1123390vka.82.1456493820166;
	Fri, 26 Feb 2016 05:37:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 05:36:40 -0800 (PST)
In-Reply-To: <1456490739-19343-1-git-send-email-edgar.iglesias@gmail.com>
References: <1456490739-19343-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 13:36:40 +0000
Message-ID: <CAFEAcA--qxpgFcCnW5WdmTXwL4tjZGFBELSNUUTc0X-NhB-68w@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v1 1/1] target-arm: Mark CNTHP_TVAL_EL2 as
	ARM_CP_NO_RAW
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
X-TUID: zNrDNPJJavEE

On 26 February 2016 at 12:45, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Mark CNTHP_TVAL_EL2 as ARM_CP_NO_RAW due to the register not
> having any underlying state. This fixes an issue with booting
> KVM enabled kernels when EL2 is on.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 85a6685..601e3c1 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3631,7 +3631,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .writefn = gt_hyp_cval_write, .raw_writefn = raw_write },
>      { .name = "CNTHP_TVAL_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 0,
> -      .type = ARM_CP_IO, .access = PL2_RW,
> +      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
>        .resetfn = gt_hyp_timer_reset,
>        .readfn = gt_hyp_tval_read, .writefn = gt_hyp_tval_write },
>      { .name = "CNTHP_CTL_EL2", .state = ARM_CP_STATE_BOTH,
> --



Applied to target-arm.next, thanks.

-- PMM
