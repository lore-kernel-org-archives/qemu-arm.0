Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4576658wrt;
        Mon, 15 Oct 2018 08:43:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV607G5gy+HfYLA2EHRicMNhuLn+9ovLTViGOEkYEY6Es0PvMLs3p2PKTAr7b0Un+O59e2VEL
X-Received: by 2002:a0c:de02:: with SMTP id t2mr17642465qvk.117.1539618182434;
        Mon, 15 Oct 2018 08:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539618182; cv=none;
        d=google.com; s=arc-20160816;
        b=AFXkKekT49qqSakeOuc1JPwOkqJmKXAp3gubb398jD0uPkNeg+N7yU4qLyiSxNOX68
         CAHDAWBssmkfJP4wZPSks6L8nBTwC9CPEjQEEWxP+Go1dXPNM6pw9YwMwfYxP61n4UQr
         d6Vakn9B2gvWDZfrlY3qYMo+1GPEzZ/czcQoxTAJNXmuuyxW0wm/3bJJxNU+jqTNV8ra
         R9mY8bfi2KQeBdnBOdAHb/1HLrR2FnV0R06rXCYxJ7zxt/Q46rsmittQEYhu6SIPjl1D
         TyYCvx2k5Z2BcDZtpHl2dgvYhPkmJDQEjV31AzEJVKz4hhJWXzreh4FxtQCcfvfztRUQ
         tIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=7UMniv2AOA6siaYwLutqeUNpkeGvprs38DG31WiYv7k=;
        b=mIs9dR2wy2zUdlpEob4DLyopzoQCuAhO68NamK2j1HaVYT3NaMH/b1KWnz3v5MRtpH
         rkKK9ssXaUfAgeo40Eg0nULvhhvgNfvzyW1ohLqv3FoHR5a132t2H6g11pMGfDM8cakg
         oiEVXHlLkljMV8gdIsKlBpVqeyd2fqu0mCWvAtSXS95RgxdxkZui1y/Dm1RR6piUZlP6
         41O2LiqyLZOrYu1nrtD4Z6mTS3wZ0kTjeZw2JemoUWlcPBN4s7wP1Rhq8cj8X8V0UhyP
         Z/53qws9XhjXLJQ1MkPzsKpSsUovIhJAuSYo0M3VRh8P2yGPBbzxrMg358xKOcDtPqXN
         oAiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WONnXdBy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si1311780qtd.231.2018.10.15.08.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 08:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WONnXdBy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC51K-0000WJ-19
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 11:43:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC508-0008Bx-HF
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC503-0000vv-J8
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:41:48 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC503-0000vW-C9
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 11:41:43 -0400
Received: by mail-pf1-x441.google.com with SMTP id j23-v6so9876490pfi.4
	for <qemu-devel@nongnu.org>; Mon, 15 Oct 2018 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7UMniv2AOA6siaYwLutqeUNpkeGvprs38DG31WiYv7k=;
	b=WONnXdByw8KXcRZ3jgzxIWMTCnOqNF6zBdhj8VxYiJ1R4iQj/RmPUxKM2di/5Mj6fQ
	UyYXy+dVKMUvxFMrrh39w4W57yxukscauWBU0V74Nx3m6AMCR1EmT6UUhZ0y+hrYXbDG
	yRsJrr+i6bnty+5YmjU3rGiVxX00zGGmo1BFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7UMniv2AOA6siaYwLutqeUNpkeGvprs38DG31WiYv7k=;
	b=smeLRt9dEcuBm/FMvom1mOqH5AtaKj1pZMSi/TDPHNn0JctLDSAAC8kaLMCIDhh+r5
	BHxch2oXvU8PNHNkCWOY2srgO/6iHLs21kZe9JmHk/duVYDqBzj6Yj2gHvn4g4Glp+lB
	ibJliXHSz8tscsOCmhq6c58xrCtnSfnDKxiSzwjWKnIpOnGqikNt6CFQdjidYPkEEf3d
	eKNAXSkjAkLVA7m55g056/PckrD9+Q7TMttH/LSoYZ6qPWkX6XU1TMwbEUKhQryUszkT
	RPgBvEeG3utwFoRzIE2llm0HbUf8AEQ0Bpeujui5o/bnvrl1rvVyF1eK6lWoABeCdDqM
	Xllw==
X-Gm-Message-State: ABuFfogkqItQp0ehubEnB+mdZHfkJ18drQOGsYk8RvYqNXojDhcMJ8xc
	Zkj30raPgGHbdKQYDqwyuHNCWQ==
X-Received: by 2002:a62:41d6:: with SMTP id
	g83-v6mr17977789pfd.44.1539618102237; 
	Mon, 15 Oct 2018 08:41:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	l197-v6sm13507907pga.9.2018.10.15.08.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 08:41:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <df0c727c-97cb-97c5-8f98-7f9255442282@linaro.org>
Date: Mon, 15 Oct 2018 08:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 09/10] target/arm: Get IL bit correct for
 v7 syndrome values
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
X-TUID: W9uPDvr4jTV/

On 10/12/18 7:42 AM, Peter Maydell wrote:
> For the v7 version of the Arm architecture, the IL bit in
> syndrome register values where the field is not valid was
> defined to be UNK/SBZP. In v8 this is RES1, which is what
> QEMU currently implements. Handle the desired v7 behaviour
> by squashing the IL bit for the affected cases:
>  * EC == EC_UNCATEGORIZED
>  * prefetch aborts
>  * data aborts where ISV is 0
> 
> (The fourth case listed in the v8 Arm ARM DDI 0487C.a in
> section G7.2.70, "illegal state exception", can't happen
> on a v7 CPU.)
> 
> This deals with a corner case noted in a comment.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>      if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
> +
> +        if (!arm_feature(env, ARM_FEATURE_V8)) {

Extra line.


r~
