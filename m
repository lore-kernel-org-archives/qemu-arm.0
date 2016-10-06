Received: by 10.80.163.71 with SMTP id 65csp3324029edn;
        Thu, 6 Oct 2016 09:56:23 -0700 (PDT)
X-Received: by 10.55.78.75 with SMTP id c72mr14970723qkb.168.1475772983798;
        Thu, 06 Oct 2016 09:56:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r84si8212661qkr.160.2016.10.06.09.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 09:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsBy2-0005QN-MY
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 12:56:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsBx0-0004cZ-AU
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 12:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsBww-0007tj-2X
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 12:55:17 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bsBwv-0007tA-RH; Thu, 06 Oct 2016 12:55:14 -0400
Received: by mail-lf0-x244.google.com with SMTP id s64so1310870lfs.2;
	Thu, 06 Oct 2016 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gEDbHoG6wP9t/cJM66d/8ooXowoZzyLCHZm/zSxs1Vc=;
	b=LxZWTEn8eeYZQTKt4zw3hAW38EKN3wtFsA4GstdZTHYs7S9iwspPAT8IVoK03VDrp1
	dgmyf5mfwXpMHkibQVE3wzYI5uQznuFp8PKPy1+YIsQzJ3iE4SI7UG25B9PAPCYJzK+o
	RJ7JV2NEhWP+tQgFnlKxo0b3CNFrrhWFGEEHb8bXzcJ0Q621xeeIGCpNsKMkPIEsaoK4
	EedhCFMLNGgFAwsEuK7V9BjbfMX6Y0ans2R+0wa5I8RZ1MK8uXYMhVEbBCqyFw8dy4ZW
	2b9724WeQAsvi6AH0sEK2Ep4tEQxwfJG+4UdfTFXqrdQVilIIMZjD2RVxWdATOE8OGjD
	KBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gEDbHoG6wP9t/cJM66d/8ooXowoZzyLCHZm/zSxs1Vc=;
	b=Gzr4l9kT5ITFQe3CRaNLPzm45GQFESJtVlICrc9NTlG7D+j/KA8BWuCwMAND9Ia4na
	+dcO6Uylzed0K1V11r9kUw0Ls597d94znDEFfKkULi9ZHTF0/xSrq+DoT3XV0yAJMTv6
	FWM4J0VRIN5HgWOafeCerwEH5bUeEr8cnS08BMfl5VLro+IXYTFi/LqXlB3gcwOG3Pjb
	4qkf3r7d8RpvxL1a1ITtBVHL28ZwoLsFs3U2sdGaj+6Dx8Qj58MM0RLuCZLjpFyqYHze
	rixB6f3PkphZ0htZN52pJAni+Km09rpzHHaK+pSaWpAhpekitG7kcA7AhCaJzhw/0k5t
	C0eA==
X-Gm-Message-State: AA6/9Rm58qNp7yRWPDzIbdRAwvgXEoFWRm/sdO3FfQsOohM5jMFA/a43vcWSTXfHf2coxQ==
X-Received: by 10.25.22.72 with SMTP id m69mr6772800lfi.179.1475772911027;
	Thu, 06 Oct 2016 09:55:11 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id g7sm2759732ljg.44.2016.10.06.09.55.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 09:55:10 -0700 (PDT)
Date: Thu, 6 Oct 2016 18:55:09 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161006165509.GA28109@toto>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
	<1475760067-25756-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475760067-25756-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 1/3] target-arm: Implement dummy MDCCINT_EL1
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kMWtnf/Hn6sD

On Thu, Oct 06, 2016 at 02:21:05PM +0100, Peter Maydell wrote:
> MDCCINT_EL1 is part of the DCC debugger communication
> channel between the CPU and an attached external debugger.
> QEMU doesn't implement this, but since Linux may try
> to access this register we need to provide at least
> a dummy implementation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 25f612d..23792ab 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -4060,6 +4060,14 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_tda,
>        .type = ARM_CP_NOP },
> +    /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
> +     * Channel but Linux may try to access this register. The 32-bit
> +     * alias is DBGDCCINT.
> +     */
> +    { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_NOP },
>      REGINFO_SENTINEL
>  };
>  
> -- 
> 2.7.4
> 
