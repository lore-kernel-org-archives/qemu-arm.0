Received: by 10.25.221.202 with SMTP id w71csp1117435lfi;
        Thu, 3 Aug 2017 13:28:48 -0700 (PDT)
X-Received: by 10.237.54.227 with SMTP id f90mr103071qtb.256.1501792128794;
        Thu, 03 Aug 2017 13:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501792128; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+isQ53J94by1viw0M+ZrIngXoskBJryA4zuDdueSfgY5Ofrzw/L0+vaWZao5T6M3q
         X88N0P5cJd88MccwlgFynE1/g8ah1ynS7cCJq5JAtDMaa0cGaT3YKOo87SbhXjE10d86
         GRz0tHRF5BE8BoMpVhfLtywqEUT+29rgM3lGKxQQX6Tj3bl1Tz+Up6GCL5sXiITg/fDm
         OZm/55jMYqVajmlnnegIop0W5uxeHxDyt/Sr7bpY6DAEiIgFp8SH6H1Od7AxvpuXDkVH
         U28m6yYNenWtfHdMixXBZB5bt6QtaMEWnG4Gd2Mb0veSOfSWOwTunNQO4RsWe6F9Bvap
         Oz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=TxjU9Jsvf2EYjqKaxCiDqyAesKXbOG7v8Ln4oYJcBjY=;
        b=ohklaIWtqdxaGLk+Mz3ptmWrvUz9rSBW/pRB/JuylYNPwWGRbjj30qPpAaTGC0Umus
         PBB0oAb4M2dcEvS0B5DskNriRbCx4Ihl7RhdceKTsfoEUo3ewt90Unn8PAKIwo6VSigL
         5/xP8czIVcw1XsLpUFpiQ7S8QXEgmYCHzOZpVKGzTVc3Dd0G7YK4Q7fn5T4Vl2n5BDig
         f634StXE8hp7m5ahI/8hqphuGO4EuvV/JgV9SXEITWxYwkSVHQwdXFI8VyrkU4GmvPXi
         bx0N/SocAGF4a1YimKCtFzd//0sT4LQapZ9era8zG7NogDGP5dFEqklm5HZwIXWPP5e3
         h9Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BldbKfw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si13617515qtv.229.2017.08.03.13.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BldbKfw3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddMje-0007us-2i
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:28:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddMjX-0007tt-6x
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddMjW-0003zu-E0
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:28:39 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:38218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddMjP-0003sN-Vy; Thu, 03 Aug 2017 16:28:32 -0400
Received: by mail-pf0-x241.google.com with SMTP id h75so1292796pfh.5;
	Thu, 03 Aug 2017 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TxjU9Jsvf2EYjqKaxCiDqyAesKXbOG7v8Ln4oYJcBjY=;
	b=BldbKfw3pHob+slbrReGXf8LErDQp3lnr55GzB69iQNR0GRi8R31rELoRvBtP6ZZsp
	LrAFEyv55T85wtBtxPA+15YsWboEpJow+H+z/F4I1LUoKgmkSpMrJ6RcfrYD/jkxwvLr
	SC+WcyaI+BHwdlNbn1uMreXSGsBGIM0D6e2ckQz7Yl+vQG91htz9mI5IutH+iwMgS95d
	lWHf7iAZjuhechE0GZafXZeSSQv/9uyWij69ukODr3FALhgCWX4ZW4barI+yTuKsGlAv
	eAdyJjTLDTm2cEiya+ExQsjpAgF3IIsFEEeH3x1Uig4+MFRKtQum7XbdKDpbgnpzPC6E
	Op9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TxjU9Jsvf2EYjqKaxCiDqyAesKXbOG7v8Ln4oYJcBjY=;
	b=JqJUKBPZgsHsleuiOt+4a9fwYgJHalhfp/zEaDXYGSJvDOquNOoRaNjqIqq4efAWZA
	FZhj/z9BFlkgwuq/Ac3e2E/KFgKk+S9GnNpArB3YciKYLQnQM0MVH2ZIny7NEBA3Ojfr
	n50a9YFoJMb2+K+boV3h04U3n9wXn+2pz1w4yNZi9fWpVcHDVOnRFmXiT8EYYTlJ4ox0
	KPVpCoX45yYhwfTApXJWzU3NPREY73jtF5/OYVpScLGiYU5GGHYB/S2GYciGIc1t/yF6
	IB7FTGV8TQ9nd/eQhGmTVStdjtuoU2d0nrQohUNcILSM1VIpVcM9+YWzc/f1nFoBtIoZ
	RMFw==
X-Gm-Message-State: AIVw112tgtKOYh7LuieA6W1LFottTHNl2f6EIvmikErqctv1TYe/NqLE
	8cCRuH3OiELORQ==
X-Received: by 10.99.130.72 with SMTP id w69mr78810pgd.70.1501792111015;
	Thu, 03 Aug 2017 13:28:31 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	u12sm13449486pgq.24.2017.08.03.13.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 13:28:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
Date: Thu, 3 Aug 2017 13:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] target/arm: Don't trap
 WFI/WFE for M profile
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qgmMZS9AISsz

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> M profile cores can never trap on WFI or WFE instructions. Check for
> M profile in check_wfx_trap() to ensure this.
> 
> The existing code will do the right thing for v7M cores because
> the hcr_el2 and scr_el3 registers will be all-zeroes and so we
> won't attempt to trap, but when we start setting ARM_FEATURE_V8
> for v8M cores the v8A handling of SCTLR.nTWE and .nTWI will not
> give the right results.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/op_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

While looking at this, I think there's an error in helper_wfi.  The early exit
for cpu_has_work should happen after the exception check.


r~
