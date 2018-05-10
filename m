Received: by 10.28.4.212 with SMTP id 203csp1198095wme;
        Thu, 10 May 2018 09:04:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpq/m3g1DYjFiAFwV8Tv7E+IpKreobPiQN5417nlpOK455OryQancwMEM7LouHWf6fg0RDm
X-Received: by 2002:ac8:7259:: with SMTP id l25-v6mr1904888qtp.325.1525968287491;
        Thu, 10 May 2018 09:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525968287; cv=none;
        d=google.com; s=arc-20160816;
        b=kNEdwls4p0w4IYK970PHQ4ZyIeHqEeo/c4gqxJpLw08k/+wqmO8uHlQluNKqT8XJ+8
         J121y55nlZ8kZP0T8dPxOR2tn+iN5jHwq3iIvFWmZJPaU6d/wtiCcU3YI3TRprZWvmMj
         HG0qsgrpjGGvtI2MLtXLEmbODKiB1QsH61PJmufqaXVPtdA5XfhBfPTk6t08EDNCyyvh
         KjmiaFBFa8ViYwTHXxgGWyx+w8bg6m8XDVQRua4w393/PcMfvakZtIeHZOnua2yW2+dF
         vUJO9MI9vrgm9xYA09Eh++i5nxeGxea7QGIdV8T9hbxMBwetAYxuP9ZJE7gWkVhWH94I
         6o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FSAXidj4IFeQQuh/HRZelAyDsuthQSpxgnEzgztAVXA=;
        b=guogp0oQ3Q5RiR/kW5fzvIT4dUC1Y4NHNuw+1VzWQSSbPCfXL695Cx0quJYdXjaXon
         5QkCHvo8bHpQZmZ4xNmZi/19O77w/N+jd1w7sKnCQAz1C1jAH4US908eKZ1baByuYYTg
         hprWhpZGsBRte3z1shM+AxOIhQt5NNvyECAht8j8eqYtw+alpS7o3ULWmitm6DXAPefr
         6ZV9J0gGbyF/eHBrWuHLjKw+FfK2ram6SGt7bRoei6WYAi3nRu87ZQM/O0PY96kU4+mW
         N3kUZw705mkUeS3jnx82rceBP+Hp0QSaaBLKWVlVRQm5lrtl7g7CJ8Qh0z6BmalwRkDV
         x9UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dTiIZp8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si777624qvi.101.2018.05.10.09.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 09:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dTiIZp8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGo3j-0005k3-0b
	for alex.bennee@linaro.org; Thu, 10 May 2018 12:04:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGo3U-0005ic-3g
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGo3S-0005lf-Eh
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:04:31 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:46631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGo3S-0005lH-Ab
	for qemu-arm@nongnu.org; Thu, 10 May 2018 12:04:30 -0400
Received: by mail-oi0-x235.google.com with SMTP id y15-v6so2195497oia.13
	for <qemu-arm@nongnu.org>; Thu, 10 May 2018 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FSAXidj4IFeQQuh/HRZelAyDsuthQSpxgnEzgztAVXA=;
	b=dTiIZp8ajBS/r49+ioHLdkOz3TKqAKqeoYFioyP/fx8hzajETPUHPpSspvmq4xAMMC
	gYfdBLPYnCj7i/U7WAO/R8mtapbHg47vn+iySCWhVFgoOWNNWjWD17HldVsbBBdQ4y8h
	PN9TKCBorvNsmFuiTOaet4ee6G9p63eZ5CMus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FSAXidj4IFeQQuh/HRZelAyDsuthQSpxgnEzgztAVXA=;
	b=Kfw1U5+pb4VtYKwPlPyKb26YDzcxJOsd88hOB3BYifdH1Gm9j2veg+nO84/3ASQ6p+
	ObEaoLJvBrN6HNBn8IyB4yy96ctddpi5moa56whFQD16qChtYcYid8J6yyNm30bPDGgY
	VbubnrecbsEXzw18SYGFnowDUFDjQ7VepFBkEjefDdPb4u1FYseorasE556oK8n0JLZR
	hs/Vn5yP6XbB87gyeM3SMh9EYnCVlbAGyJSyec+ybK8S4tqXR67EaebEJIVPfJBp5cEo
	N1GHLAwfx9XKXEXpN77hbIFgv9vjuGgh7gOsl+X2ddvYmRqYsQWp/eWhAK5OiAlsjN0P
	34Dw==
X-Gm-Message-State: ALKqPwcp0EqCk9oI/L8bWCX8/xB4QRQ++DMJ6Dt1s/RClfwqxNz9Pj+3
	LMnws88MMwwWYIMqZIJO7z29tm9x0ChjeysNzvkMsQ==
X-Received: by 2002:aca:538b:: with SMTP id
	h133-v6mr1183354oib.252.1525968269678; 
	Thu, 10 May 2018 09:04:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 09:04:09
	-0700 (PDT)
In-Reply-To: <20180502221552.3873-3-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
	<20180502221552.3873-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 17:04:09 +0100
Message-ID: <CAFEAcA-XRvr59WL+pmtW69hvu=KMcqKAdoBoD9zBsr2m_2qzFg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-arm] [PATCH v2 02/14] target/arm: Implement vector
 shifted FCVT for fp16
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /hJJHJCsrq0+

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wrote:
> While we have some of the scalar paths for FCVT for fp16,
> we failed to decode the fp16 version of these instructions.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v2: Use parens with (x << y) >> z.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
