Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4571503wrt;
        Mon, 15 Oct 2018 08:38:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60APFWZH1M5Sdv5BGLmx4v2lY497j5kKW72kQF+QIHKFMZ4BOXyWEcEl3+JG8CiN0+alRVT
X-Received: by 2002:ac8:1e1e:: with SMTP id n30-v6mr16730035qtl.181.1539617921362;
        Mon, 15 Oct 2018 08:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539617921; cv=none;
        d=google.com; s=arc-20160816;
        b=rn7jCuvrvsOg4QZSq7fK+C86eAqs7K6ReIKx4NGdJ8OSsiTHRazIl+lhzghpfi5pmh
         p3XqatfuMCIcdKV2y3P1IJQRUHgQ8LqBYoHJQGTxAdTOW8ibXi3TAaUO+Wl0hBAQWXf0
         LMfGgay8NyvGllRTssjtRWGHV2JhpDBYZSgHWpH2ytinCVT+qlqAnJcCyWHn8yicSVqg
         rAFl4Exga71JlmMWCVML4Nr6EI1HJVYwT7zb1/CkmNdMhZZ9E2j0hvet75D0ZsQK0cAJ
         n0zvAq/YxmZ2zmFzD06tbQweyaOs4pFZkA8Sia7QOyOSzViCCz19Ke3RyEGxDV5jcoFT
         I1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=NOZSYC2+rQM+dpGPhQH9ur30A5YsJyefnu+DeXlOAq8=;
        b=JwV7LKNvzqEGZ9+XAG68r6aWRdJzA5H7Rck7lLHMM1SWEbaENF3HkvTA9QlZOqsD+g
         2+nVz7Vqmn4DVy76YVb8Bu3jwUzeMkRwUkksQ+ob6Fm+essPlDZuOYqVgpbjsnpYzm5m
         fkhPdGvJ2VxcS3Z9cnVmWvlLqlNBhzfkLy1H7K1jR3KVag/Jsm+q1bW8U5pb43y64Ap/
         g/aGiEBBFvbl3TP3sLt6cilecYNYFPMYK9NFfL6LRC3cO64aNcS7iBrmgx5bfiLj7IRT
         jC3t9dfYJYLzA6ze+x7PRCvAQSVlJbK3uPijLNllyNkU5H2D9IQOJ9K0TApINoJBrr82
         W0YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fWK9Hz6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d188-v6si9231352qkc.57.2018.10.15.08.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 08:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fWK9Hz6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC4x6-0006HT-Ko
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 11:38:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4ws-0006Fq-LN
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC4wq-0007g2-17
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:38:26 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC4wo-0007co-H1
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 11:38:22 -0400
Received: by mail-pf1-x443.google.com with SMTP id r9-v6so9863866pff.11
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NOZSYC2+rQM+dpGPhQH9ur30A5YsJyefnu+DeXlOAq8=;
	b=fWK9Hz6UGehE+X5pPy17u+Huv22/s3FOsYnyr7SBhUY6g7JkgMwhZBc5phOVRUZgR4
	NSrvn6pwRoTUqemLE+bt73c6nqmoU7RGIny93IGC4r35PuG9J0GkgVA4/L3yuXcG+TXT
	gfi/ZFKzug/pFYGoliat8HqN5/ZoKfh0bThGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NOZSYC2+rQM+dpGPhQH9ur30A5YsJyefnu+DeXlOAq8=;
	b=A/lIRstxXaV2JEOi97z2L5nKkBcN0ZnDWxCao6tcCjJbbn0DvOXCpD5pamVDf3tdxz
	qGlRHKNzHvYi4c3o447+7IYNtK1rxfMwNEqTMc+kwnWp7qiMypoQXcapLoeJIbjKlWbu
	tw9Cki11N1HT+9/Oy1iiwMs1bMRkVEtBKWYkiT3g3sFyNrYHYFjxfmVkLCHcOiP7hwOj
	dV3W8vtX2V3JTF2p7pIGcXQ1Iaq/ede+XvO5MvTgzAZ2dCe0Y8h5JhXbdqp0Le8yXkNx
	bQhLWoWbFAnlzgFGxL5FmhLe5QqKManW74YP4a7+gw8dMshCiV1b9dcO5dsbDgaswmNB
	MFRw==
X-Gm-Message-State: ABuFfoiv0vWKeL3cupeVWPPDFBRd1nCKHmkfZvByFuMAsMkAeeTVRavw
	u6oKYOv3/dHqTIuC6P0MLragXA==
X-Received: by 2002:a62:2a15:: with SMTP id
	q21-v6mr2210072pfq.61.1539617896922; 
	Mon, 15 Oct 2018 08:38:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	t26-v6sm15960656pfa.158.2018.10.15.08.38.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:38:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cca1e586-39d1-d2d2-c9be-c39ac8ad05c1@linaro.org>
Date: Mon, 15 Oct 2018 08:38:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/10] target/arm: Implement
 HCR.PTW
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
X-TUID: wcgIASWpBg6i

On 10/12/18 7:42 AM, Peter Maydell wrote:
> If the HCR_EL2 PTW virtualizaiton configuration register bit
> is set, then this means that a stage 2 Permission fault must
> be generated if a stage 1 translation table access is made
> to an address that is mapped as Device memory in stage 2.
> Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


