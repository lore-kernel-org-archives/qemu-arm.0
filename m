Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1740845wrg;
        Thu, 23 May 2019 06:39:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy4kIl736W7F7/YJpjAyqr8UKUBIBdkZhYUNzAbsDfl9Bf+UPHgf/Khcyg3ufz4FG3DpdK
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr50637116ejy.176.1558618779418;
        Thu, 23 May 2019 06:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558618779; cv=none;
        d=google.com; s=arc-20160816;
        b=k02Gsit1DBp4Wpci6fD4JpMfVvvrIEGCoEjReeQa0c+2TeHZkDXs944sLDEV0owTHq
         tVPpE3d/9qhG21hliCYSieJ/7m/oh14Jufqjc521GXeiT4H0g3wSwy+45AhECtjS188u
         blLa4tMDiciuFs2vwTfVeFfPbVGnHTZXcimpb+1mbMwldhZBgN6jJE/hAb+jdgX689O8
         rbn/2HupbctFD2ENbf+g4RVARx6qtDFrSbOPwpE2VNduOHb1JItfLsuDLeK6FpOeOHaD
         HGas+Hb3i8dH4gaa+LQ0YCjqQdnU/TgOHG37nBJBnB9TGidTmv6JYXXy2xuazt1qgh91
         xSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9zX5EHeDdKap0pvoAfYKP3tPzU8Pqu0/MLm1hSEHiw=;
        b=I1X5dE9eEOwJslJJFG1XIAaCDFqtROgIl1WIt1SAcbYqKbTGFM8Y9tIAHnwCTYHcHc
         7xwIkl636mxgnG7dJSPTJgp4AMIOrO0/c2vpIOIpk1707wxV3h9kZJuDwHokjY+I1VUq
         GilYj/nrMqdD/LbJPJ5EdDcVMO7l+RvR1ZouRc/hDP1Wqx4tAS8kGhjsep/jd8fygGQG
         EQEQJ6lC8aqew5m1Qt2CXRB8UwYMLOoKDA/GeWeTkEOK+Q0vfaOSO7kj5M4Hkla6Xd7n
         fvye+wBZN3+cn9qsIYWTqA4m21TGr/1bxYnx69C2gyzahrooK5v8S53XvYUT+2jXT54p
         Iuag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHCeACP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si4809834ejs.329.2019.05.23.06.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHCeACP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnwY-0007jO-Gi
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:39:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTno4-0001Du-8L
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTno3-0002D7-Bf
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:30:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTno3-0002CR-5m
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:30:51 -0400
Received: by mail-ot1-x344.google.com with SMTP id t24so5369228otl.12
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R9zX5EHeDdKap0pvoAfYKP3tPzU8Pqu0/MLm1hSEHiw=;
	b=MHCeACP+QvRq0Yld21LhYoctUVrxKP1l8fmOAWrk8ZG+5uKO/IqQ01uKuSHeMNlPvG
	TzKUsDi0sB9v8r54w+Duc3XRpUNWeqYlH79Ie7ELUaGHjRjlmLnHZ4nM2STYdxAP560D
	3WJY5UNsgtmN9fgQzHsNnFTNGgpBlPjomfGzHBl5FyQ2Gmf/dQuh7QkS+QokHR2ChCon
	kV7LN5A8RCGj6C8Tat7V7W+U6pt0/uZ9kZxXiSctHMrbmqrj88gKGOZTZX6/Qp4IVNlf
	i2hpYBCebgDWz62nRHF3iO4l49cspzZoM/kSsb0bmp23Kw04D9NZ0NdmT6JUkLHQ93Gg
	32Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R9zX5EHeDdKap0pvoAfYKP3tPzU8Pqu0/MLm1hSEHiw=;
	b=PV3EUxcvodgIrKrgS0Srj9vOB+lTnKEplQRgBrVpHuSP6HZg+OFY48O85xNSVUDoNV
	8ftJYsYbO1r3ANTL/PwhqhMUM7ZWeiIJVzdpH23uh2Wo0K1sVrMlRcPddx7Y5zsiItP1
	FX4K2sIMwx83q+VZP30vnBCTRyyERCVSx/h7uz2sxBg18L9LYGlp9KV3e1FNnO3EEEBx
	XwwDAI64RxsrNkmn2Fj5kGwILKDmUWXWsgre9zdsY8MEX2s20KWNKSRUQp9a48Q5cNn+
	fh4JEZFzfAtbdRusuRPfTHMexvi/MCgpMutZ4xUaAAYOBQyQnhBvfXOhVvLYp4dmbpDT
	lXAg==
X-Gm-Message-State: APjAAAV1EpTTVcS+1KdThFTYbTD6PZNUqo4NPeH6U0NO7aBIsAHpee+/
	ihIA00O/BzwhBqZv7FLFCbqoZaew4dq27LKQp7UMSw==
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr21226630otp.91.1558618250247; 
	Thu, 23 May 2019 06:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
	<CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
	<e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
	<CAFEAcA_1XuWqVu9gonn5_Y9x1V=UcWNHEXtwop2s0qyUbwiZpg@mail.gmail.com>
	<13d9e22b-4ac5-fb87-622c-a99b5494d06c@linaro.org>
In-Reply-To: <13d9e22b-4ac5-fb87-622c-a99b5494d06c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 14:30:39 +0100
Message-ID: <CAFEAcA--wutvPH5xSRm7yNCQ9+TpjJ84qbSLTUa7YFgKnLmi=Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UoJVPmnzOy+A

On Thu, 23 May 2019 at 14:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/23/19 9:08 AM, Peter Maydell wrote:
> >> Because the three different instructions perform the same operation with
> >> reshuffled register arguments.
> >
> > Ah, so they do. Next question, how do I find out what the
> > order of arguments in the above code means so I can compare
> > it against the pseudocode expression we're implementing?
>
> >From tcg/README:
>
> * bitsel_vec v0, v1, v2, v3
>
>   Bitwise select, v0 = (v2 & v1) | (v3 & ~v1), across the entire vector.
>
> The "selector" is second, the first input operand.

Oh, this series is based on another patchset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
