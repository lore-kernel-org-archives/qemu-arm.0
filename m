Received: by 10.223.172.38 with SMTP id v35csp196433wrc;
        Wed, 13 Sep 2017 15:59:23 -0700 (PDT)
X-Received: by 10.237.60.239 with SMTP id e44mr27653993qtf.59.1505343563746;
        Wed, 13 Sep 2017 15:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505343563; cv=none;
        d=google.com; s=arc-20160816;
        b=JT2usVfuSLzcu0HpitF7CVENerrShtdZ2hCDLfpPJZ1WfYixBP/OlKAHFig/I+S2Cm
         QM2Xgr8xm12nkgbPh9jWC1k2OPwyF78lf/nXb1TR5emg0H+a1ZKP8IuyVnfgvrwtn9AK
         8mP061A1qlvv+bpBEuDZ2pP5dRngCG4HhwD+41yqGW2k1bzZmxYFp9yz/EtPDQzqApSs
         +sFusNkjxbjtfc7HlTI4GJP/1rZcNsBG8+L+Iy35NikAMFmq0569vdHE39KBv0Ojx+gS
         6ogfcS5iQ+4/LI5eRUKb3RkP1cuW8HClHMC4bod5U2nCBJYx2v4YVXzIKIP9hbK05Bd0
         i6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=91fW7s5gvYoqqB/CgfiBE/ev6ZdLlfPj0QuSTMxbubM=;
        b=X2tKf+Rw6KrjjiF/82kzM+6IMbGxUGYVqGtLKmO2E8AmFtbOuYkcESOD4llj9dwWi5
         8z5EOcwWzvbbY3JPAlQE7IHRb9KsVK7Q9L7ephGYdhwrkGF3j74dGLZ6OTzbk7vQMah4
         fc+VXv694GKkistmaxacwm5IEpD3zwVEKMeiUf+qFBC0BPh+1aAn4anSmAzU45+mpWQM
         NucBV3XgqLNW7xv6h/Zp9V5tg+eGRRkMkfKn9+mO4cpjTWcGa2F4Sub4hfOIgs6QxTcx
         /k1PLh3FR+9OEoScocZnQlGZxICNoI3oFQdDCHSEiXwDddOvClKCZpVXyq8+dkEzkkZN
         vQ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XDRyyRmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si9962886qti.27.2017.09.13.15.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 15:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XDRyyRmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsGcr-0008Ix-Fz
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 18:59:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsGce-0008HP-Iw
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 18:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsGcZ-0007g8-OK
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 18:59:08 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:47071)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsGcZ-0007ep-FB
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 18:59:03 -0400
Received: by mail-pf0-x235.google.com with SMTP id e199so2380455pfh.3
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=91fW7s5gvYoqqB/CgfiBE/ev6ZdLlfPj0QuSTMxbubM=;
	b=XDRyyRmNQ8ad3lOTBlVIEeM9WTDxge3kQKvsWsCIAOgUShnWO2rmoPIMa7AkKbZnZd
	tEnkSAtpO4kZv5OZ8ffQqkSv/s2YIdqkaE3WJD7wdRfuw16qF2CPkMZXsAcGOL9tRs+o
	Q8jKKg7n7bttDR1mBAVzBlovo7Yrv2Qev7L4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=91fW7s5gvYoqqB/CgfiBE/ev6ZdLlfPj0QuSTMxbubM=;
	b=rpHRt0jMO3Uezkk6dNnosIGz1RFxRWjXWYSw34tSMNwEJsdOQwwQv+waKN5xLHBy7F
	f5thVahkP/tNKAOA7xN77TJlFa7kaj29pFNzkHBiP4E2LsV9cOELZaNObmh+3Ac/tAKz
	U5ltOPcGbTRKx4DvjF6BIsz8mDTdbLZsun2PevSVvVdCjSIcAM03WuhxVAP3H4sNfxEW
	Zhit0IBasBAX2HDiq0+Vmabfj1iHXKbsr6oYC4V8NAKGrXSNfkxvO4I8KUf/9RzEym45
	qly1RYJno9GXCVcTbamiRJa7ldxCk/1I9nPjfcfiWGV/wFC5FdCJcaEviUCFAivczeZM
	J5rQ==
X-Gm-Message-State: AHPjjUisP4M4JCILIpFfDHeGsr7HaO3iOT/cUT562AOluccpSxHsx2D2
	DX8AOU/T0P/mcSYr
X-Google-Smtp-Source: ADKCNb7+NJ1GbYs5VxxB+O/9LKBVba2v/3D0tAa5qddVd8KKlnjX890XX+eeu8GxGI0tXcxilnDhIw==
X-Received: by 10.99.113.79 with SMTP id b15mr18820901pgn.387.1505343542327;
	Wed, 13 Sep 2017 15:59:02 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	m15sm1594799pfh.35.2017.09.13.15.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 15:59:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a2c4292-cfcc-0dbd-d9fa-edbe56dfe639@linaro.org>
Date: Wed, 13 Sep 2017 15:58:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/19] target/arm: Implement
 MSR/MRS access to NS banked registers
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
X-TUID: U3Fg8/XFPuTs

On 09/12/2017 11:13 AM, Peter Maydell wrote:
> In v8M the MSR and MRS instructions have extra register value
> encodings to allow secure code to access the non-secure banked
> version of various special registers.
> 
> (We don't implement the MSPLIM_NS or PSPLIM_NS aliases, because
> we don't currently implement the stack limit registers at all.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
