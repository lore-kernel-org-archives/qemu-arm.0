Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1536301wrx;
        Sun, 17 Feb 2019 10:21:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZAwaJr5CG9HkypS75uwqoePSVZHS+OCMp7QR1iXtPCMEJ9lmxyGdP4nrivXDjP1+pwryjr
X-Received: by 2002:a81:9345:: with SMTP id k66mr16449166ywg.509.1550427703223;
        Sun, 17 Feb 2019 10:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550427703; cv=none;
        d=google.com; s=arc-20160816;
        b=U7IBt5Y33moM4GSVKXIQSmS2AUQb1o7qNu005eJMxuC09er7KAyEQTnyXHmbXXdwmo
         L9dwiMK3j8EpQ++tXjDUAijrSHTMhuPIxHyWzZiwpvyCeFHDkPhYtPEwiHBHUDhVfEkw
         zE9mdyYEpahx5scuGdlKEi0Aui6n2aXJ/VtFZ9t+anCdu6bEyEOECKGUfZg8GNzWlYqB
         pBdS8dPzKA3eco/AvdeMDvWVDhXz8Xuz3LrmOk/uzoszmeFc7GnGqcmMYR9jc0MOK44S
         2SU5GudmSnaiT/h7V2s5ULIpfB90tFRVVo7AFgWMw1T1bbPIhFW9YGGpYFIiExX4KKbC
         CkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=RbY0xA4UT3TwPlLLdee4KRDjo5jCFztXAN8FFNDrNYc=;
        b=sKn33tb34zC+A9LtT4GypoogmLKRnNLhzQbVEW2XtZ2m7z3rxKTCc8JXz4SCZH+zSC
         CyDklTkK36QbxuTHrf7BeIA7vO2m0bZ3k9zVFq1h/uOdJN0Vs/fyG5IYyV5fLMgNsovz
         /aD8uNaxAbH7G/s7dBNiL77EBPhFZweFhSZCDAly4d+S2h8k4hrOKoZbNBEzqt4FDIN0
         VrcSVzZo0094mMwJhDqcmnSgDSxLZaK8AlRP8QZcswqh0RDJ5kHtXq00m5qcoXEePd+g
         YgsrsBgqWq4xyth8TstBCUl6sm9nSyeCp3ZvWbvZWsk6gK7RxvFNBRH8nWOD5WK2Pif0
         qCJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0PWgL3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f188si3635059yba.77.2019.02.17.10.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0PWgL3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvR4Q-0007L5-L8
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR3m-0007JW-P0
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 13:21:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR3k-0001zD-N4
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 13:21:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvR3i-0001uo-Lw
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 13:21:00 -0500
Received: by mail-pl1-x62f.google.com with SMTP id o6so7559840pls.13
	for <qemu-devel@nongnu.org>; Sun, 17 Feb 2019 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RbY0xA4UT3TwPlLLdee4KRDjo5jCFztXAN8FFNDrNYc=;
	b=Q0PWgL3TroaERCDP77n9aAnfvXY/1JXhcxXhXRt8Gb5sfZj/4m6bACMU/Ig9CxvlzQ
	n24UfqAlOTLH2xDMtiB4b8pV7iiMKTuHOYCco7GEdSWL+n7n9qXsQVvgaRlE4krCr8Er
	VCMThPViBHdQVNMdCpkuO/sNxHTuvQQoMsVdm/mCInHVM/UPB4w18nRecnIfcB/XmDzh
	293QAysfhWMfp2X4NYE9fSapYG76TIPl9TA7kJDtHCTafg5eJdaJ5bRmdE9ziry51/FS
	bU9zjVHHwEZ3UGP4Eo+Aws+vJRy9Q97njdVmZolOiu9/7tbxii14H9KW8QJjeHL/tYOE
	9EmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RbY0xA4UT3TwPlLLdee4KRDjo5jCFztXAN8FFNDrNYc=;
	b=gP3BLFoA4qA+fKeyKerjgfS4jRQFKCW+D4jBxwtG1HCQvAWqqhrVQYOyhQMGFD3MTo
	Tvai3MnwDUONAO5fpCpKZo0pzkOUFPQ1CqTROz5i9AjjSIR3ko+Rc8Y1H2FLzgds2IDD
	qsWWj2WNtNEwvYm8I/DTK/GMN6b2D1YJOwdspzQNG6DqVd2WbH7SSIfis7/Z2JhwBVVx
	0+nz5lxKeP7ZND+VbvwGvBGQvTR1phxDo0wAdbwutscV0WzPQoBQL27HOTHnnEm6KGOJ
	CRydERBBIAw4Hz2IIqENouhlofZkadr6O2hrPvtT53WQ/dOMUp2Od9g1V5eQqQ3N0gS3
	rA7w==
X-Gm-Message-State: AHQUAub8xvQMtUTLksLPdlIQAS3VRY+3HUMA2URL/2/nnOkgR3BP3b7p
	ymNhz3vGsO3HMFD3wbUcDps8+g==
X-Received: by 2002:a17:902:7c8d:: with SMTP id
	y13mr2816827pll.336.1550427655291; 
	Sun, 17 Feb 2019 10:20:55 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id x8sm757046pfn.137.2019.02.17.10.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:20:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f08dc682-0c3e-bb23-b746-760121a70f0f@linaro.org>
Date: Sun, 17 Feb 2019 10:20:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: Re: [Qemu-devel] [PATCH 14/14] hw/arm/musca: Wire up PL011 UARTs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbKPpE51yByf

On 2/14/19 4:51 AM, Peter Maydell wrote:
> Wire up the two PL011 UARTs in the Musca board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musca.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

