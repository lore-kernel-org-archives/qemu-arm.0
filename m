Received: by 10.28.4.212 with SMTP id 203csp2185823wme;
        Thu, 3 May 2018 10:57:46 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZojczUixyHvaWVq6/JtzKYUGxCJynUZuxrhb6Gpl8m/ArXeLqTwLpdIc3bzrksaUtKoGwL4
X-Received: by 2002:ac8:2ac2:: with SMTP id c2-v6mr21628414qta.147.1525370266688;
        Thu, 03 May 2018 10:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525370266; cv=none;
        d=google.com; s=arc-20160816;
        b=A4kqRf/oa3dJNHl0Femcalx6UM3jepi4fTIL2dLPZz8Kkhd3tbFrSnRfILTlnt1BD/
         eCmuHZlFweUg0cf0LwGYnbfocUMLvEkR54n214pRnpE1V928tHOEh8L1c8CSYl039+D4
         QXGzC6Mhnk3TIAx740Watgla82xTcnz+CAV5huUGgrUwJ5IKVU7qaYIlb9VDmt8VIy7T
         ZSRS9ZlLRfYbd4hsgCBCnnXwY9uFdnlQeXUqDMyYd/Zmz6YtP2AcxeMKKK0F6hiS20vh
         E4Q/+Zx2ZkY6mXIxAzaEyjMRKvEBQC1y7j7LUxBc4FZeiM3thoqTnJp1kZ4/bHQJZ2mE
         +Xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZS1VfABjnOfXVR9EGjFfBQFiDryBKLgqMmknbwUDKos=;
        b=KEIoTJaCFTw/VGF1lfIvJgJdhnQpbUnq1SCiTnkN1BFBTtwYl+U4WI9d3XOiBEWE5j
         ZnIq7nRaJlpRHXbn9UweoBCkUA+EyZsGA2R+4I8AblW0GqinEWwUIw/wNwGVNaKHTTxh
         tDlpxzooeqqEqqQrzDjkMnojy6+BCnOckEDQqke1nj8x4mxGSz/b6Jy0M+xCMrvbrBW9
         lw5Xl36dRvKlkV8man7sDG80bOKYzNhSonaDJMLq6LXfkDOM5CfRGR+dsHN9Z4dknWkV
         /Y4Y8FSfIBhV58Wm8bonorCcVpMCjH3IwHLQ9wYXWJHoM907CSzcB1t/XqUPX4TWRQ/z
         asig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4/X2Kf3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10-v6si3691056qvn.120.2018.05.03.10.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4/X2Kf3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEIUE-0006xb-5w
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:57:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEIU2-0006wa-BS
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEITy-0004km-Dc
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:57:34 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:47092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEITy-0004kE-7R
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:57:30 -0400
Received: by mail-pg0-x243.google.com with SMTP id z4-v6so13647285pgu.13
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZS1VfABjnOfXVR9EGjFfBQFiDryBKLgqMmknbwUDKos=;
	b=I4/X2Kf3QHVKqFpAfUScsnWhwnDK3CjAN/o0/Q0Zmu0yHMzZwkkd5/q3yTg/Y+M10A
	fLy4pFhsFxV3HC6s9fHSJPaAjx0Izy4CwIIDFKtxc3JUZlKCvIM1LdDL26ZPWMt4EsMB
	TTAbBrLiEwRe+WMTlSTaYBv2RbGm2SfHPyU60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZS1VfABjnOfXVR9EGjFfBQFiDryBKLgqMmknbwUDKos=;
	b=gNaIdQXz2RzInB5Qysk6qZJzqDAF3H7XEX5Dk/fBIVrCEc48BBsRCliqDWKPfcbDKx
	tazNc/Dh5xjyK/LN7srxPL2GxnBSqJ+LO9DC8pq9VH+kzdvN9oFLQRKF7RAGl9O/Escr
	Hf4exJaEqlcx+AdpioVJN7Rr1wsWuKUJ4PBhsINcqxx4iba+92A2jlr4CbdpnawEZXiN
	mqqLsE8GcQkAYB9W0b82cTy5o9eUxepczvoxWRmKI4JZl2t1Ze+TZ2M6P8EDq9InQuh0
	KX6NfORfnFGeHPy62GX7KUCfkYuDeAPoMoF5qg93I6YSAuiYWmCsZ6I2r5XAdEbmorcA
	k+1g==
X-Gm-Message-State: ALQs6tA6k8/xfV7csymj3a6cWOxkPw1yxRg19c4JyxsruX9VcOu5H0T+
	J4GdkCHvsoHqOJBLNEXrFroepg==
X-Received: by 10.98.220.138 with SMTP id c10mr24084292pfl.183.1525370248827; 
	Thu, 03 May 2018 10:57:28 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	a3-v6sm1346305pgw.14.2018.05.03.10.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 10:57:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180503105730.5958-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <deba008a-1a79-37b3-e908-86d348640017@linaro.org>
Date: Thu, 3 May 2018 10:57:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503105730.5958-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement v8M VLLDM
 and VLSTM
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
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdBlahVt9rkZ

On 05/03/2018 03:57 AM, Peter Maydell wrote:
> For v8M the instructions VLLDM and VLSTM support lazy saving
> and restoring of the secure floating-point registers. Even
> if the floating point extension is not implemented, these
> instructions must act as NOPs in Secure state, so they can
> be used as part of the secure-to-nonsecure call sequence.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1768295
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Worth cc'ing stable on this one because gcc and clang will
> emit this insn when calling functions with the cmse_nonsecure_call
> attribute.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
