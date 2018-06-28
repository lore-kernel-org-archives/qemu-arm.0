Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7619157wrq;
        Thu, 28 Jun 2018 09:25:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcwc1j1BwHLxCXLXnnW5z8jGUmh1PXpjIfzM+cDiNDMgOfyb8Sd/9YibPoZLVpx/L9ax4Mp
X-Received: by 2002:ac8:38e9:: with SMTP id g38-v6mr9937743qtc.213.1530203151282;
        Thu, 28 Jun 2018 09:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530203151; cv=none;
        d=google.com; s=arc-20160816;
        b=EeYNi77MLuIOrsIraNXWAtJcIfb6IP9NgvN2qyXDbuSYwYAQ1VC0kQszjW9CcUn5OF
         J8ghCL99rE4kovFMIGa6DNj3KjLcmHAYFM7PU6crPNOV6+7CKEsMalWgvGbdlMxI5AVK
         MbLFaVCFtEMQmL+1SKsmof1ciAXWypW0I1MBFMe15E+Q/cEO6NPSrmU+X0tzzNAMgkdq
         trVgm1wXABt6qZcHWCzTUC0+Ax3ytYkOhp06ijZgGiZfNx7pqqszOh05YMDuDNb/12Qb
         ujjLziv/dz92ZIW8RxAvAXJUhZPIiAXpmvFfkp1GNqkeQ63qHW+TOAocznRCq3o6tV88
         y/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ah7qpwxu3NtL+V8BrPH0Q2GQ/AcdCO7dGElju60pfFQ=;
        b=oBVvwVxnwjQjMC0RCj5HThMIBkgkhnk8U1x6kwO6hAygQKSg0eW8+Ojd3R03DqfavV
         JXfaprQnTdEVp03ya8D4QhE3i1ThtZN5IJULjoelx7O8BX6JnXyWaEZBYg6SXfJF0rAo
         074NacK2cWbGFYD+D+BRLO5pKOM5FNizHM0k1iOGY3/N1CIMwDyeR+qdhh3PS5I4uoeI
         XAeW2c3EjMrNaEYqd4vKOLg+BcrwGlzriBiOj/tasAJ3j422zyZJt9DmRJEml+g/thHZ
         Ua53SeVXxzSMUuVAGSqYIDNpMgVB6CpOdVaZtXIJ+GZnUF49epTxr7IFskPJOHRJt6qr
         +9Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XTvpeufp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 58-v6si2978646qtm.375.2018.06.28.09.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XTvpeufp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZjx-0006tt-Tr
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:25:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZjl-0006sN-SC
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZjk-0004au-Vl
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:25:37 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:40348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZjk-0004Zu-56
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:25:36 -0400
Received: by mail-oi0-x242.google.com with SMTP id f79-v6so5729192oib.7
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ah7qpwxu3NtL+V8BrPH0Q2GQ/AcdCO7dGElju60pfFQ=;
	b=XTvpeufpjEG+RbBRYKFVd0Q4aBhIvfeqeIo0AuR4+3jZLApnumvILaX15qGhtPEVhx
	re8WgeuNaUBzU+AAgxp6Ll39i4Bnyw/xveFZRCdz3oyMNLw0iATb25dJXaxdc0bCbfhO
	pnINY/Q2AVIEU1DAs2X5VMQ06jyR8oxD27XjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ah7qpwxu3NtL+V8BrPH0Q2GQ/AcdCO7dGElju60pfFQ=;
	b=MxjJBiv1jgC7WZojus7ufAOKAaBGwQ76UfzPZtPYWmYrKQuCvzYEF11IXy2MqhRhbc
	A2U2/8YP+9Isp5wAFPUnUtxbYq65npRJbA3QCmxhsJtuGyYCnWrm/NT6oVT5hsHkxFZL
	iLMSyQ9HjEmlYfRFmEiz6I7Mfiaultc6o06gMtmprIB6BR6hwwPUCnPJeS2l2WrTUjVq
	Hp1fJI0YLRWme/kioQXdLIpwTP0jVtB75++OqZRGKamvLAidgPXadw0O2HCUEjXpO/WP
	LtZ4QKLWsYc6fQ4HA+ZGCVAnNHEyR9A7Ns1LQl6KCZoaUB6GT0WgX52+FShKShSvCdK2
	q6Qw==
X-Gm-Message-State: APt69E2Kq9v8g4Y7a7wVxluFE0+ZkQnR5gNYUxA2IFssGGBOzTeLCQ8I
	mIIToICUNK+9fJmb0DU7Cjhvr/LOSOfIGSCn8iyeqw==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr5785086oif.337.1530203135569; 
	Thu, 28 Jun 2018 09:25:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:25:15 -0700 (PDT)
In-Reply-To: <1529699547-17044-13-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-13-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:25:15 +0100
Message-ID: <CAFEAcA-dBq8vTB8sqxJ7_FjeHrteS58J-+2i_iYFH6iH6GWXMw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v5 12/13] target/arm: Mark PMINTENSET
 accesses as possibly doing IO
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
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xM4oFmilNt2s

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> This makes it match its AArch64 equivalent, PMINTENSET_EL1
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96667e6..38fb6a2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1763,7 +1763,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_tpm,
> -      .type = ARM_CP_ALIAS,
> +      .type = ARM_CP_ALIAS | ARM_CP_IO,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
>        .resetvalue = 0,
>        .writefn = pmintenset_write, .raw_writefn = raw_write },

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Shouldn't PMINTENCLR and PMINTENCLR_EL1 also be ARM_CP_IO ?

thanks
-- PMM
