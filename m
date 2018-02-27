Received: by 10.28.71.27 with SMTP id u27csp4932599wma;
        Tue, 27 Feb 2018 07:15:27 -0800 (PST)
X-Google-Smtp-Source: AH8x224UlrLWB7s95KcQaM9qSOdLS+MeqBFOQ7qdQ3ORmvH5WTJyCJSopb4C6+Dq2I8OPAwLWm1c
X-Received: by 10.129.121.141 with SMTP id u135mr9243524ywc.187.1519744527374;
        Tue, 27 Feb 2018 07:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519744527; cv=none;
        d=google.com; s=arc-20160816;
        b=0jrtGAZ0rh7ZJpcDyWuYnDwFIsSIpV4UTBJvjKIzE4Rt1K95hZmkzF+hHy+R7t01Vd
         4eMZAjYNBFnVrHkEWzAgi5COBIf/GVCNJxh1MjIjE2RX0EERFBYXLlvqWlLgI98rVhbZ
         6+TWj+uhidCP9rQQPNKQzn/xLTLgk9qp4uBord7e1TNwePherFx1xHc9Gpw1Ovgx4Dcv
         H1z+KC9cN2rwzYDr7chWQvkGaLTKumMnckE/jOx+cj6qkxeH0aM+jm3hTEBut7Vdstio
         og1WKWQKvLnJnbbdAcD64Idah4RZltqq8YYnle6Xr06ruw7Ih50YlJXmxhfT91e7yCBZ
         SoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=w9EM832YNLaSZrD0xHxJ1tTV2SmRUhbBoc/AOe2Wv8A=;
        b=wvb17n6vg7Kp1QgMQuTW1S0+FDNPnutVMHAWpZFDaSH203EcXm5wV5DBP8x+yWjCMk
         9zJVAVeDDCNi4xkrq8b2+oPhLt4RnedxMv6ncM9XAFWuhgBLxlx5mhGYYxtcOdf5ixNZ
         VVlgWkPTRuTI8PtrEZkmCcCGf/yNlV/+LS18kKDQqUHP7bciNMB3/n5419IkDfnBBJU0
         28khzq3fXGlePI+6v+nh2+W2X2t7O0w1sNBrF6r5o2ANsF5PQWxEGn2leFp62aMpFw7B
         HQhdvkkVJijccyoQMlDes0ME6nNyzwZO/jUx55ITLp+8yF4J8lm+z2JIGzmDY6yqdjUj
         sbwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIUc48K5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q206si1783654ywq.42.2018.02.27.07.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIUc48K5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqgyU-0001Bh-Oe
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:15:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgdg-0000E2-UB
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:53:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgdg-0000tO-6q
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:53:56 -0500
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:34002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqgdg-0000pb-0F
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 09:53:56 -0500
Received: by mail-oi0-x22b.google.com with SMTP id c83so13068809oib.1
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9EM832YNLaSZrD0xHxJ1tTV2SmRUhbBoc/AOe2Wv8A=;
	b=iIUc48K58Xf9Ui8JDvf7KIRqKC9RMx8e7K6rnxzPt1YZyKNmbEiKBtWPNG++hJaQZh
	rZ4tYGRUIMvkYKkd/Ng4tL4r7UGvkcbC2yNWBAJksBZ8KNyOfFNaqeqhRcAR2uTa+4fT
	k/8Jz9VO9XfrvqT9++ZL+3CMc5zW0GTebZj4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9EM832YNLaSZrD0xHxJ1tTV2SmRUhbBoc/AOe2Wv8A=;
	b=Tw3arui1mXvg32CR4LR2ugADLqScI55dEY8nC1XLfUUsXUxpOhpxIB7qRWINRpmrFA
	UAjqC+Viv7nqbRz6yDRxhFFneEeeyHFFf0CiISsFvsqsuF1EBnU7R2hEo2zYrbZ7jVVG
	zGNbIK/KnqMYQ8TZ7pfixXfekBXoobyhBQqxPp+/xD4czjH66Ar8EkQZ6EOtCUWKG9G1
	ZqiIldjQNy2106DXRPx5LX28gyix1WcZNtfuPC5ig70RzpT59/Dw3QK1/zo8InY67PYz
	cQkC+oS32pLl6WKY3sRHyZZjNMV6QYedzFmBgsbN1Jvac/mh1gP3pIXLc5tJYhm0LVgu
	4RNQ==
X-Gm-Message-State: APf1xPAFkGhx/1aU1ypKPxTyYl8BZaDZUXcVZPq8X1om9rSdziq28bhE
	lKaPBRm3RhYnfan3Zm+oWdkzZJNUms8ajgPPsOOeSw==
X-Received: by 10.202.95.68 with SMTP id t65mr9561652oib.102.1519743235190;
	Tue, 27 Feb 2018 06:53:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 06:53:34 -0800 (PST)
In-Reply-To: <20180217182323.25885-56-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 14:53:34 +0000
Message-ID: <CAFEAcA9tOn4cJEeZSuEyyAMO=i-+=A7HX9Rft7HcEVPXNSyweA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22b
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 55/67] target/arm: Implement
 SVE gather loads
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
X-TUID: g9oGvSMYLqUU

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 67 ++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 75 +++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 53 +++++++++++++++++++++++++
>  4 files changed, 292 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
