Received: by 10.25.205.13 with SMTP id d13csp506050lfg;
        Tue, 17 Jan 2017 05:50:05 -0800 (PST)
X-Received: by 10.200.46.248 with SMTP id i53mr33052031qta.281.1484661005735;
        Tue, 17 Jan 2017 05:50:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m29si16583249qki.224.2017.01.17.05.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 05:50:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTU9D-000400-3K
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 08:50:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU6G-00026I-Cq
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 08:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU67-0001Jn-2m
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 08:47:00 -0500
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:35435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTU66-0001JL-Po
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 08:46:50 -0500
Received: by mail-ua0-x231.google.com with SMTP id y9so103293339uae.2
	for <qemu-devel@nongnu.org>; Tue, 17 Jan 2017 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZIQrNLmNJqSwIVLmmORHEnhuQk4/5aWB0eQfqH8Uo9I=;
	b=h2J/tSaXUpoyeyOc/8/S8kwec148AFxNwVy+m7kkCGEw4KdfyFa3cglFnhIDPofIQw
	yNJnisjWU84233lC10DQTatiXtibOnMiiuHIquDbFqGtM3gW8r7TwsLFeonkCxQl986U
	r+T74HYBbRYRVnrIzsXfnJ+oPp2IW4Ez1TzU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZIQrNLmNJqSwIVLmmORHEnhuQk4/5aWB0eQfqH8Uo9I=;
	b=am/RPKjK6Bz+gleeWbzxxqQ+ILwU9JqesbDl34GqtTjtNbDNUjCcQo/2OHr1urAMGT
	GiQF9U+HjmudbR9FrhZDd1FeBdnIuTWTP7YL/NGc9wJ8CWxEBb8t4cxdOv1mtytSZkBo
	xhPScj6kveVqsf0lZiY/krv8yJKd22q2DPEUiinjZEvB/RoYFBetWKPJPy2zAMXIyJCW
	ZOnmzB1b2XpwOYjg82tNDpHdXBNY/LtqY7ulQDBoRfKUFiHWy53+kEsV1Fl2reP2yeST
	33xtvbTxjhvuumpvfLmYCg0O0n6s9jTrkSw6reHfYxbiQPVNhFDKtCvI41tHFd42s77O
	NOVw==
X-Gm-Message-State: AIkVDXK4ps77LiMZ9go11lTLpOlLQgzjRnOqQjK4zAXVx4Iul8nVY3YlvL7TMbXjfci+erF+oXCvAVoYNLJlMLYH
X-Received: by 10.176.3.196 with SMTP id 62mr17624439uau.120.1484660810127;
	Tue, 17 Jan 2017 05:46:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 05:46:29 -0800 (PST)
In-Reply-To: <1484204658-28058-4-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
	<1484204658-28058-4-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 13:46:29 +0000
Message-ID: <CAFEAcA-_uGard1X9=NucVT87qRtX3dsipSWgwQDSfeADPvs79g@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-devel] [PATCH V1 3/4] target-arm: Add support for PMU
 register PMINTENSET_EL1
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
X-TUID: vkAVe+O7Dacy

On 12 January 2017 at 07:04, Wei Huang <wei@redhat.com> wrote:
> This patch adds access support for PMINTENSET_EL1.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9044a33..22c66e3 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1261,9 +1261,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_tpm,
> +      .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>        .resetvalue = 0,
>        .writefn = pmintenset_write, .raw_writefn = raw_write },
> +    { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_tpm,
> +      .type = ARM_CP_IO,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> +      .writefn = pmintenset_write, .raw_writefn = raw_write,
> +      .resetvalue = 0x0 },
>      { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
>        .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> --

c9_pminten needs to become 64 bits.

We should add PMINTENCLR_EL1 too -- it's a bit weird to provide the
SET function but not its parter CLR operation.

thanks
-- PMM
