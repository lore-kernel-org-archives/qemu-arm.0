Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1517685wrx;
        Sun, 17 Feb 2019 09:56:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZtzrMJ3L840wD3PGMj0F8/dERwYKiC8CcH2EXkxI6St0XTVgrShAL15XCFAY2BN/J0DgLG
X-Received: by 2002:a0d:d8c3:: with SMTP id a186mr16002430ywe.221.1550426180999;
        Sun, 17 Feb 2019 09:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426180; cv=none;
        d=google.com; s=arc-20160816;
        b=hXSRNmsPAQudP8CIjdOMqn1q42FrdH5WjSJhpILaaZxbYfJC93Omnbb4vvqSx0geOz
         HqpZ9zNKdvjjtTP90LhsFOFS067bUFr0nFWeFfUudQN1uaxxrWkZUrG5EpWVRYcoHbIZ
         lQ/XUmf3X+UXjmNWzoXIoRkqU5re2PhL8dcIluzqsNl95Hs97nxLXuFz5F70NP3p8urt
         hdeH/osf1UAe9M0i+1Nav8t7ryl+hJC/Q0g5vb6TNJWlUNL5g90HNSKXjD2kCi8qWNaA
         Dgf8/bu48TSQvto8Ie/BVo24OTGTKl/0TKew2osx4WI+fBjS+z5VzPhkRlmVlGW8TX+Z
         z8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+GA/VTJFzcOFAhECNQA9js4d/25rtvJJ25Xq3nIkYCA=;
        b=yraYDDLvtxzpDY4GKIBxtIHL+4UQV0HT6T46pDKxHnDxipB6PUHOEjSUsS0EvrWtV4
         eY9b/oGXlvzHRwfSwhP05LBIuctO9tOVys4vozqYZl+NVw4oNvkujfscJJbw1AzTz6yy
         H427FpDveBkumcnb/Jkrw6ASfwKY8meDNcYMtWuRTxZed1hiTqa8pt736bDw//QWxIhK
         f202MsNM0yqPwWQYER7cQmStf5UDMGWrQ0zsqrRa07k37WMKHMsq4AIsfp9AjXkAoMv+
         mEdPZYMZqEMXxvRcbJwOHnhIPlzjtX/G9FoNQBFc6qblcV3hfR/meWmqL0WqdPvAnjc5
         3sYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kT1WVCD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z125si6341145ybc.228.2019.02.17.09.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kT1WVCD+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQfs-00069d-H0
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQfe-00068Z-HL
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQfd-00019d-SZ
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:56:06 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQfd-00018Y-Lg
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:56:05 -0500
Received: by mail-pl1-x641.google.com with SMTP id g9so7563103plo.3
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+GA/VTJFzcOFAhECNQA9js4d/25rtvJJ25Xq3nIkYCA=;
	b=kT1WVCD+HLVjUpd60CCP2TI1T/GhkY3CGOvcHEu0fRMXA6+h4HyeqjJKCFtCQoF4Cg
	LDwdIT+QKU8gTrEnqnPFWQ5za5xePibcijzP59IBmyTWt/QNxhOSpPibKKvzI9KwIyYt
	LdrwGrS1YzoGO/FmIrX1opx3r93tz3DkugRoOuxXgF364DYgIUC1D+nHLtg8OFRdPi4n
	2eZAHAmzRSAxOSOANc5HbxX6NNSnWtph3+V3NLKJOAGBps8E96SR9s+2FRdwohaGBf4M
	oAge0YUKqHh6AMNq1wotIUU7X0CUHFinxTWX6yw+mSBVzuKBr9djxrcBMTbNbd035Zpn
	o9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+GA/VTJFzcOFAhECNQA9js4d/25rtvJJ25Xq3nIkYCA=;
	b=Un4RgX/lwNoypYC99bqQzutxFBLLIbd1lXDprF6X7BGwIkirQfOA/T/yDLvkhlWLWx
	j7Lhh7anKFOFtOJORNXVrVnnEV4e6me0OGtc8HsD6iCLFEd5jE3vxk1LvC6z85Morjmc
	MlmfmbRVKaacdbNmdNkxQfZ2tqm8Ak2mFn7jHn/h3Cid75pnf4X/4xs30bVV2OnL/9hq
	cvIaDZriO7AwxJWolCNzgTtiBCvsi79KWeAXiSlVVOwB3ise0KjvYoGA2xLJwQDxiP4e
	GsH0veUIWAa3oAGuhv918WZlNY5eUeX9E1qoImorRVIAzOuKLHFUGl7xLOlrEY4V9/KT
	nahQ==
X-Gm-Message-State: AHQUAuaQV0BZmnt0cizzCcx5glXW1a0b0TaqRX4spvG0+BTUbeZkP33C
	1D8/r3b5oqfroaIpBeno4MY8jA==
X-Received: by 2002:a17:902:8e8a:: with SMTP id
	bg10mr21026729plb.192.1550426164567; 
	Sun, 17 Feb 2019 09:56:04 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	d129sm24683271pgc.59.2019.02.17.09.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:56:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8a417877-fade-c8ec-038b-7c0ce9109649@linaro.org>
Date: Sun, 17 Feb 2019 09:56:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/14] hw/timer/pl031: Convert
 to using trace events
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
X-TUID: CBcyNZ0JZwsA

On 2/14/19 4:50 AM, Peter Maydell wrote:
> Convert the debug printing in the PL031 device to use trace events,
> and augment it to cover the interesting parts of device operation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/pl031.c      | 55 +++++++++++++++++++++++--------------------
>  hw/timer/trace-events |  6 +++++
>  2 files changed, 36 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

