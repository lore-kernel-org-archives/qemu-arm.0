Received: by 10.28.4.212 with SMTP id 203csp1201566wme;
        Thu, 10 May 2018 09:07:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp3G/5CNjJMSqSOZrm/ht7bxTIOAs6kUVJ54lrfpWzFRgBLEhhkoxDDG+PR3mwHYBBggZO3
X-Received: by 2002:a37:71c2:: with SMTP id m185-v6mr1845258qkc.177.1525968453879;
        Thu, 10 May 2018 09:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525968453; cv=none;
        d=google.com; s=arc-20160816;
        b=nAJT6CuR+fXgQGNY6UQ0yBFTUIVKwZAJ0SK1wm6P3T0sBVcR5+XDZvhzEJ+B8UjnFd
         k95elL8mOTAG+VdpsM5hxti3ivmL4I0m6izqdNi13qBdFTwX4G9JOJ9gLuaE4V9SqnVS
         gnBqUsDLnH4VaR3shfm6PBO44IMwtMIDBoNTSi998EFeWiwBbID0z3n3boOf2TDeXFip
         y+YqMGB7z3++EBhsKEIUPgn8KqSlLTJWDNK3M6zurQgsthITkgU+IkBNAl6nU8264HCW
         MSPxul5VcbwV43f0gcVl31XAfPm2PH9RnOEHY6payv6Izc3gwQ34kP4SizGYPiDB9KNz
         5n1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=irjeUKDlY7YNiV+n+kv4h1x4+xOHDzvMpCRxCwLr53o=;
        b=s/pwdC3p/XaS4w7ahWUyjhhVJyOcN09WycfSqrp84YASRKcT21McEgBp++VbaW6toG
         6HrcbB3GBQB9jlU1Sb/17NJ8cAfuUlY5sXyJRUKA9N9eCwtqaYOqVoSf83ZXfSPpoB6a
         cBlcW9F44IHBvFOdG/4luWSmFpLcAD8pe/yCyMsFXBuL89UovTN8YrEOirr9LZF/NpOV
         qD+t2QHNdG3Y20jX7giSnM/Q2KV4AE0PEVPwMYZJDUPXPk5NzpyghFt8qR6I/jyBRdHG
         AfI4SLKL97Uqk3GamnjD++SuoTAdDMWJtxuMTze8oYtq3Nlg7eaSRAT3kORbg+/md0Cp
         G4SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnoZ74gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p57-v6si1014163qtc.66.2018.05.10.09.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 09:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnoZ74gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGo6P-0007fi-Cg
	for alex.bennee@linaro.org; Thu, 10 May 2018 12:07:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGo38-0005Ci-1M
	for qemu-devel@nongnu.org; Thu, 10 May 2018 12:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGo37-0005da-B9
	for qemu-devel@nongnu.org; Thu, 10 May 2018 12:04:10 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:42584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGo37-0005dA-7d
	for qemu-devel@nongnu.org; Thu, 10 May 2018 12:04:09 -0400
Received: by mail-ot0-x242.google.com with SMTP id l13-v6so2882114otk.9
	for <qemu-devel@nongnu.org>; Thu, 10 May 2018 09:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=irjeUKDlY7YNiV+n+kv4h1x4+xOHDzvMpCRxCwLr53o=;
	b=DnoZ74gxvfweGeJ09RxpiheDeSzwd0jb6a/ocvrqI6Qbz8yh1l6QaMBjgPYqEuAWhw
	bxIldATRaNAWkAienCScUm/aUPEV82s22NSTmhjL7HXK4laL6/D2RIzlMGYQLF3KSYOp
	jqxXyd+FNGB63C55PGz/aiBS6HlbmAggb/gGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=irjeUKDlY7YNiV+n+kv4h1x4+xOHDzvMpCRxCwLr53o=;
	b=Jfd3IzWHkjx3jzjd0PUz5cl5rYZwSL7WfL7XGR/4ohl1wsqsRsv922K1PdgDYYEmjC
	RC3CY9HEIq3ArCUzOmLzik8RrCfWZW2jQ8NZqAE6krERMOAxo2nEd5w1cM2F1O/y7IP0
	UeHWPy2PD9kZsdMVeLx1Itd8V31cwk4rkz4uyaHc2lP9awJpQhTdMSu93XV9NATMnJXq
	Etrg+6/W7RYBOQWqlletxlRENU7EwxiD2jMBHy2y+oOsj+4099QMFRjZDXM8OZa8iJFY
	+SNG5XZth3J4h3pIL28OOhfcAt1lqIs7GtD6utaqmtomEmvPuJ/VLkogepPeOVkF6KYf
	faBw==
X-Gm-Message-State: ALKqPweed14IPNUJcvHNXUFlRG3qU/wJkylwI7Rgv6iDPiJ+Cxh+k0Uw
	wJ9Jxn7RZIeleSBZpp1bCry1Xj0JbaQNx88gkyApWQ==
X-Received: by 2002:a9d:2625:: with SMTP id
	a34-v6mr1415718otb.308.1525968248505; 
	Thu, 10 May 2018 09:04:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 09:03:48
	-0700 (PDT)
In-Reply-To: <20180502221552.3873-2-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
	<20180502221552.3873-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 17:03:48 +0100
Message-ID: <CAFEAcA8X6edc0XnZ0u6_zk5UcNhvohFabb200JXnxQjk-u1SmQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH v2 01/14] target/arm: Implement vector
 shifted SCVF/UCVF for fp16
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2R29aM7+ksQY

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wrote:
> While we have some of the scalar paths for *CVF for fp16,
> we failed to decode the fp16 version of these instructions.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
