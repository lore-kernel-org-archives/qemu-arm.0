Received: by 10.28.71.155 with SMTP id m27csp2085095wmi;
        Thu, 12 Apr 2018 09:08:27 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48R7eELQYoBx7faIPHcRVowQB2A4yaZQBY7SLsxKC81oYK+2YjeYOQaHhkEawgWvFwEk28e
X-Received: by 10.13.251.5 with SMTP id l5mr717350ywf.323.1523549306976;
        Thu, 12 Apr 2018 09:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523549306; cv=none;
        d=google.com; s=arc-20160816;
        b=Ix1bBDqbaXK83UP0utHmQB6gu0z9jsaEzrY1IXBNFmWP4ojmZnF7YXzL2fejKLLm/L
         u12M1EhR/K2mre3LKbJhiSUBSvMWLDjZK+QYS1xrk4kv5ZiNzWRjAB2xFJi8Kh6Lqxh4
         kUBw3IpIHitx4g7C4YW65mnb3YdDmtbdTcIdAqNss3reY4vbqvnJb1nu9aNNVI8PBKH5
         ZddbaI/xFYZ15h7W3Akah6PDd9AS3pZe2nx079ao5LhWalAmWwemrQWZ7x/RhrzPtxgI
         2j82fll2uKAc9A9JtbGO5Te2C/MLYst2TwMxMDxe4+IvAXCdHHyut21tqQiv0QXL8RCJ
         6vQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3mMPHyfF5SAKS8KifyudL60zWR3csGHQvtfgv2CwiKU=;
        b=wxmLwNee3ZXi3tTmvDidaOxEFb0QOPVbVI1Sr30gmZQreemPETWJMuqCRQou7G1nyn
         B/PyovMcZEKXZORR4rdY3yZrinJH27bIbtPlQd76u708IK1R0bYZ4+fYSqh/OQlTx/ae
         TK8McCVU1iRKHn2D8t0eHrN+dmsMBONs9i0vTSZ95HzbEa9Qw07gnq2R69mDQ6Ohb15m
         pMVCvkSrthmfNF52lQwmjDjyELRmVma7/TDISN4Ck/JdLHzPHwqpcrv4HGNpn9GDpuyF
         PS4Yopx0GQUxss7EzYrIdBljfrG68eXxaRaRmg1mVKQsllrCzC26BaQ0BI+QC17WD1UF
         10Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czYzJDEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v140si5130955qka.110.2018.04.12.09.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czYzJDEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6elu-0000Fg-Ga
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:08:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6elX-00005A-CP
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6elW-0006wY-GG
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:08:03 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6elW-0006vd-Al
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:08:02 -0400
Received: by mail-ot0-x244.google.com with SMTP id h55-v6so6595073ote.9
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3mMPHyfF5SAKS8KifyudL60zWR3csGHQvtfgv2CwiKU=;
	b=czYzJDEcWKuaplwC/5rwhn7r21/dQRf3ncU6fAtEpK9xSt28/o0hi870VkPsfbz/mz
	XsD7UQOH6UGWxiJPiA899ewIuzs3JcLjWifUTBbUKKR3rUPuZ6ZoGdLRSRCCZ2PIy8tr
	d0V5D7wsoYZrQzHx+GWw2LBMjmOWNmgmYIvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3mMPHyfF5SAKS8KifyudL60zWR3csGHQvtfgv2CwiKU=;
	b=FXw+2366hs+CeE1xNmd3H1/3ZcnibOnamCmln49pZIgGk5jM2CfETm2yoWNus/yyIj
	XuVqvD88wa7O/asJWdtEO54JE1+ZlUBtfbQssDg1esFFSiUCx4MC3A/4hdn1kDU/CIqt
	t8RNSHleOpwYI9FTV/YeVDmUprvs5IHkqgvQzItQrY9Id0X8kCCrfk8tUSxdwuu7AOj5
	S8OUwLfGiI2VYcPz6GvOnaFQoCH6sA3h4v7wbp3uHMxU0FxSvtObFR9Ek9J7yvoQgXkf
	GJBowysAJe6yKcvAu1NcpM1Rt1a4BHI86ccVANaVpufGs/rcJ0s8QohkliuO2Ogtv1pS
	RN2w==
X-Gm-Message-State: ALQs6tCvhLgM+lONIsx772RUoqSbHLyucogvUOqt3psI/J1P1r0VPcj7
	j1DidzWRHw4s+ySSfCFkS4Wp76uFRR6JMtNz/qxs7A==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr1151552otj.294.1523549281564; 
	Thu, 12 Apr 2018 09:08:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:07:41
	-0700 (PDT)
In-Reply-To: <1521232280-13089-3-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-3-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:07:41 +0100
Message-ID: <CAFEAcA_sMbYp2cu2im=kWaxRrzpW8z2mBx5=ihSAHba4K5T_8A@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 02/22] target/arm: A15 PMCEID0
 initialization style nit
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dyQz4Iu8Fxl4

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 022d8c5..072cbbf 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1524,7 +1524,7 @@ static void cortex_a15_initfn(Object *obj)
>      cpu->id_pfr0 = 0x00001131;
>      cpu->id_pfr1 = 0x00011011;
>      cpu->id_dfr0 = 0x02010555;
> -    cpu->pmceid0 = 0x0000000;
> +    cpu->pmceid0 = 0x00000000;
>      cpu->pmceid1 = 0x00000000;
>      cpu->id_afr0 = 0x00000000;
>      cpu->id_mmfr0 = 0x10201105;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
