Received: by 10.28.173.206 with SMTP id w197csp3070370wme;
        Mon, 15 Jan 2018 11:11:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBouMvZVNEH0k5lHZKlTAoMZf141fzaUxKoURs4zPKdCNZKjYFlZeBYzCmd6zXfuCZNv5h2Lq
X-Received: by 10.37.35.137 with SMTP id j131mr10071947ybj.439.1516043488547;
        Mon, 15 Jan 2018 11:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516043488; cv=none;
        d=google.com; s=arc-20160816;
        b=N/AEPe8lyauTpzXS8jGFKlx81YX1zMM2RVWSFd7YOiSTRkNOqKh9KgB/W+o7PrmZ+1
         DyVirziKahALW5HHO2+e0orWFqXJx3qoKaaqVQtBqDSUQBvLlrucW1G7sv/iEFhKU9tE
         n72UG5Foiz8PVKFrB+/nF13Y0cuVFTWpOYYTWIEVheV91k5xgquj8b5IZkfSGgeIL3an
         dDiZ+EzoEzaxAS98X79GhXScj2D57ehfnAbk1KJl6nNTXB2xfIfomKnaQL0tfO4y7JJa
         ArQLho6djzh4P8QEzNeHR/gvi160zZvfzBnkF6t0kie4AarHXcFoivm3lgU+DCiMo4GB
         onTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=VM8NuQ5lJzs+CtDmtCk+9R5whlmZSFxbvHUOOegeEX0=;
        b=y4J4Wz/5rsq0nOzK44KMdd1jn24y0sO1kxi30932tjAZnalK6e7i7cyoLsftjBkgZ5
         4gAbgSAcLyoD1wa37M8AG7iOoPTHdeO4U0RxNBtgBw9JtCtm/cLJKJOcenZTMeU3xXmy
         dGrkASV14w7ifofbuT4a5dgW8hWaoWT/KXdANUBiahoPEW6IRj/FhVDvs1OoyZjcVTC4
         DkvylaxKhY7M+NY3sRktXzkudpIe5JU/zxaJzj7mZXxQFPuMYAOKvJtyO7eYuJHInw6c
         ULFCWYIqMJoZhsq+6OCEwKHqgL38No1NP8w8xXocH1ME9E6RLILFdIZ9n4zL0e+9vseB
         20SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0jkDK4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si66831ywi.586.2018.01.15.11.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 11:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F0jkDK4G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebAAJ-000419-VQ
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 14:11:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ebA96-0003Wq-H3
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 14:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ebA93-0003uC-Aj
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 14:10:12 -0500
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:43728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ebA93-0003tn-3U
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 14:10:09 -0500
Received: by mail-pg0-x22d.google.com with SMTP id n17so792603pgf.10
	for <qemu-devel@nongnu.org>; Mon, 15 Jan 2018 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VM8NuQ5lJzs+CtDmtCk+9R5whlmZSFxbvHUOOegeEX0=;
	b=F0jkDK4GyJJegaS8mlUliIz1KJzGwVj73vZTeXd9vUua+a81CnGa3pW48HNosUFhKp
	u4Z37lAH5zASAQuanRi/zDvvbeoogzHi2vt3csGdByDQJhlZYBFP9wxfyTaS6muPFo0c
	4hRLYFHY8ItRcLqv0HfjllgXanHga5fO6NjJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VM8NuQ5lJzs+CtDmtCk+9R5whlmZSFxbvHUOOegeEX0=;
	b=nqrzf2B0C2kjJ2P8osm0HsL7m8NZFHIygYlTlCEszsRdGCwgh36dxq9Ept6lZh0ZaF
	PxiER3DgGXbTfv8vcR/EPnMvi0z7Wi0VVJtW593h5QwTw4ewEDTl3M7FMkWMpGIJCs3u
	uHZbypTsLBBzHvk/8/o5QNC+RGX1sSGOCR40nXTuXwRtEJHkXF79kENaVTBlqsvRnllD
	g5rBVFunVSqj9MusvltFIUuXY/cOMn0EfVRS8R/CKi4IMY6YFS5W5TKtIrfUGkv+98T3
	VrCdIgL3RmXcsaemNSAK3kxeN4OK+MAMfYuoqZHcnLYghLeWhNgoxgE21gRbudxNWUsk
	4ltA==
X-Gm-Message-State: AKGB3mIiAwfRvyLxUKaWaZ0Wnbhn7gW/Jj4nUu/WHfMwnXEXak7wLRzj
	YYWu/vPS8x0rU068IZwaS44lag==
X-Received: by 10.99.116.22 with SMTP id p22mr23901712pgc.4.1516043408038;
	Mon, 15 Jan 2018 11:10:08 -0800 (PST)
Received: from cloudburst.twiddle.net (24-181-135-63.dhcp.knwc.wa.charter.com.
	[24.181.135.63]) by smtp.gmail.com with ESMTPSA id
	i128sm368498pfg.83.2018.01.15.11.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 11:10:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-11-richard.henderson@linaro.org>
	<CAFEAcA_bU-LWqtXL=2y_ztF4fCmr6WY0ruxFucXvUruQdKKtyA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef479a9f-50e1-41ec-12a8-2484097d55c8@linaro.org>
Date: Mon, 15 Jan 2018 11:10:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bU-LWqtXL=2y_ztF4fCmr6WY0ruxFucXvUruQdKKtyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-devel] [PATCH v2 10/11] target/arm: Decode aa32 armv8.3
 3-same
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZ4lO5PU9uPh

On 01/15/2018 10:46 AM, Peter Maydell wrote:
> This doesn't seem to line up with the Arm ARM decode. Your
> pattern and mask give
>   op0 = 0x, op1 = 100, op2 = 0 and also bit 8 = 0.
> The ARM has 3reg-same decoded with
>   op0 = 0x, op1 = 1x0, op2 = x
> 
> (and some insns in the 3reg-same group have bit 8 == 1, like
> VSDOT and VUDOT.)

Ah, more v8.2 instructions that I wasn't even looking at...

> How are you proposing to do the Thumb decoding? Try to share
> some of the 3same-vs-2reg+scalar decode part, or just have
> them both do a similar kind of decode and call the
> disas_neon_insn_cp8_3same/cp8_index functions?

Hmm.  I thought this was working via the "translate into the equivalent ARM
encoding" path.  But it couldn't possibly be doing so, since
disas_neon_insn_cp8_3same is not a subroutine of disas_neon_data_insn.

I guess I'll have to verify that RISU is testing what I thought it was...


r~
