Received: by 10.223.172.38 with SMTP id v35csp5267387wrc;
        Tue, 19 Sep 2017 11:51:45 -0700 (PDT)
X-Received: by 10.55.18.207 with SMTP id 76mr3506858qks.245.1505847105641;
        Tue, 19 Sep 2017 11:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505847105; cv=none;
        d=google.com; s=arc-20160816;
        b=qJTZZjlczTdIAqTZ462cCVloxymhFedAAxh/zugLSxXkD024zVrH6p4frUXOFN4J75
         O4+p1IZRYqj/vv9+0hFsS3gnSk6yjPIG3ptSdcrz2OAjcTvzJPh9pBdVgrStWJS2A+0z
         9WuokXm32EWTxv4PRbXMpLkpJRRwS/108MTI2iU3WBbTN5C7buCpD53rD93FI7vou5mX
         ank19bOQXqspWJqRrngchylQE4Sj9sWTqwtH/V4ab6PT4wL2v/OjqQ50wYxP4YFjYHyV
         5tzuNsd6XLlNhYaJWk+WxTHEC8az21Sh9B5FfgF81GDPnhsN5dmpPR3Ge5r1SUzVOBg3
         vYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=jDABxhreQ09WdGq2wk7q292Rhr4gchgylH/mKoc1Wh8=;
        b=JhmooOjHhJgoEuiAgyxZwdSYitjcZEnD2CQXHZ9uyt/Q0L5OaO0sHUb2FhDjHbTLZY
         qu5lPaYaGIstl7VT5CX0Hhr351Y2I4lPP4AYkglRYpGH0+2iaIN86po7dLwr0GFubMff
         0uuOXOHQmjurxCHWkDja7LAOGOGEBCrlRP+/9IGMTwJA1QCzR+BuAo87J9/DIf08H6qE
         As/biRYNu6/YLJ9DhWpRDdbIm8BFD80D79pzSQYEVT6qIXfRrAnRiFet0roTvU29LOv5
         wMlHLALhu2uua9vjRCcEA2ZVyO+wllcfnDXm9S4IEIppE9lhBWN0M6QzEm35n8pevIFV
         7DUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y4bA4pvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si1324615qkx.463.2017.09.19.11.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y4bA4pvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNcV-00012Z-DQ
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNbL-0000Og-PE
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNbK-0006pn-Rt
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:50:31 -0400
Received: from mail-io0-x232.google.com ([2607:f8b0:4001:c06::232]:44916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNbK-0006pM-OP
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:50:30 -0400
Received: by mail-io0-x232.google.com with SMTP id v36so1392504ioi.1
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jDABxhreQ09WdGq2wk7q292Rhr4gchgylH/mKoc1Wh8=;
	b=Y4bA4pvCsh7U0OTz3O9ngIDDKfhXDTgLP5Dry5cJjpml9cXQM/wGRkyRbYanRJ5bc2
	99tLg7ctfNsqhqdGAicLzmWsYLkTjpONkehhpB0foZgKSFaveRR8fQtXAPYpen/Lhi7H
	x5d8+GeDmMKg8ebVQ307m8Z0VDHpG08ZCcXMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jDABxhreQ09WdGq2wk7q292Rhr4gchgylH/mKoc1Wh8=;
	b=We0JnFktohhpjMvE66K5bwlFPOWTyzXziDMd1N8gE1zvI+bvPALSXg+b0GUrH8MfEo
	jdGhlHMm46qej1c7WQeLRBOe//scuGSofukA1zyLw/7VyC55L4W14Og8uH2kaZgQD+Gp
	IJMNmwhoYMY41b2Bu89huM9JC50sqgQPMswI0OLPVcf0ktzwc9MFKCb1qeO1y+Ft65gH
	JJ9DdfBN6MZAQP6Ls2bllyNG3M8BrThtWyF39gPZVXIGA1Vz8Am1D3K+EX3EsTP1/YW2
	EijWEQ70n1XFIMPUZvbywzit6wzWJj3UefBBn17QozdHNd2xh6KZzFSRLRnnIKi3URUH
	phzQ==
X-Gm-Message-State: AHPjjUgzfBRGhsjE9BIdIUpTlJCcwwrFaXp+V3RdRs6Okr+g5rGJwCNJ
	9UxUM4rtGdyWog9tLq6mMuNMiw==
X-Google-Smtp-Source: AOwi7QDivUvIWh2mrKhZ3f4foQBm4xBPw+3/rpSU+7Z9LO2fuAgyZhiSx+P70n5b9tTDYkM0CmI+bQ==
X-Received: by 10.202.206.1 with SMTP id e1mr2520859oig.150.1505847029974;
	Tue, 19 Sep 2017 11:50:29 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id 105sm565957otc.39.2017.09.19.11.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:50:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-13-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58618c0e-9336-2cf8-9db2-d11181c29ea7@linaro.org>
Date: Tue, 19 Sep 2017 13:50:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/19] nvic: In escalation to
 HardFault, support HF not being priority -1
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
X-TUID: AmxSNsriIBib

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> When escalating to HardFault, we must go into Lockup if we
> can't take the synchronous HardFault because the current
> execution priority is already at or below the priority of
> HardFault. In v7M HF is always priority -1 so a simple < 0
> comparison sufficed; in v8M the priority of HardFault can
> vary depending on whether it is a Secure or NonSecure
> HardFault, so we must check against the priority of the
> HardFault exception vector we're about to use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

