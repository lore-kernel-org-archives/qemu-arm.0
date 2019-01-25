Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp859968wrt;
        Fri, 25 Jan 2019 15:40:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4YpRbNp8xLxM1/y/nAmt2m118NqR4jwMMSV/IeopyIWzcJfPPDGyM7h1LpDtNwLa6/LeW2
X-Received: by 2002:adf:e3c8:: with SMTP id k8mr13280540wrm.83.1548459628127;
        Fri, 25 Jan 2019 15:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548459628; cv=none;
        d=google.com; s=arc-20160816;
        b=yf6oaLUGR4axlBmtI8RlFKdU8Mi6G/fHIVYW8Y8kzXYI+HlBCA398J/PHxUeo8LNdj
         c1c4VJbObBhEhHD25hwRbU+HsWLQd/LcSfieepiWV+T9/2VOCpcBXPpvHK88tboLke9E
         k0ob96MYgAbLnNoQFUVIfZair0uoSPC3XoNDYcRVv/DKcVBpKR/U7BZpgC6ei6stqG4I
         L3HfG1GJ/gij2meC3NME47UzG8wIzFpffMa/Ls7yWf4qrFROf9TrcHb7qh7jJwzVoFTQ
         dAcBwo9WyQQPXblJsrfkoVGBltAPi7W5Od4s19qitcBnM6d6v1e8VepHVP7YIxQl0mI/
         7tkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=qzUuXdWGa6FjVsRPuEEQmLrtTlFVNXlwu4TI/OzkpmM=;
        b=AWOHlhrTyb84w2exC8GSWCHMH/BRp8/yKaYXLPd6LZfD2NLj6haFqLkUOYNfIWsY3b
         JlemfgvnTMUWmIiSPJ/dDh64oj8E/Y0UBUa3EkkHWDz0KxQnKMW2frafE9fGEjhbDNP2
         pF0jIZ9u+we8cLIOyZ7wWwhG9KKEu/MU1/7lbw0+TctGZBPZTzLLlsNyuBTokz+mRkOt
         VN8O4QrwWaF2CIntvoywEaaHPNR4WneBZ0tkVB3EfzIhoBKOnlHvPdjfvuREm4jKV4Fj
         CMraAPR9OIRaRL9Jm3Nw5RDuBAGR/AMhjZQbTMqzTda5mynm+faKECAU/OAr5R1G/oq4
         vsgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9yrvDkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si76024163wru.398.2019.01.25.15.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:40:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f9yrvDkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnB5H-0006Se-91
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:40:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnB57-0006S7-QW
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnB56-0001rf-E6
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:40:17 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnB55-0001nK-82
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:40:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id w4so5255152plz.1
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 15:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qzUuXdWGa6FjVsRPuEEQmLrtTlFVNXlwu4TI/OzkpmM=;
	b=f9yrvDkI1ZxzB59AKizFfivGs/IokEAeb+QKd1++cOmXtvg4Nql0YMzeSe1IFGQDWj
	dtU5Dhy8Osc7ki0mkrQuxVECW3kw/9NSyaNHnHjCYJ4G2WMVBsCgrRZy1hHziMVTGP8+
	3U21kuFaO+VN8AD/LyZ/aXN7yIKZKRfFiotpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qzUuXdWGa6FjVsRPuEEQmLrtTlFVNXlwu4TI/OzkpmM=;
	b=s2SuINUxku3UK414zYqDBhW010eBqLGIFaYk7oKnPxRX1/BM6nugie170JVWEYOdp2
	c849RSJm8voSc2nURXcdpawBk5dSPSWvnxQtVr914McZZiGkb8ZWVYA9yFLqjPFsnZCh
	5BSuDNlRmw5rj0dNnkkSs4IjtH+F58alDKPmkSxUSLBEYHI1AbnP+1gTcZ7uRHdEHvRa
	PVDwT6kU9kpLCgcV67Oymq2937bnbWKtDopAvznFKx2g00qxYgK/vQ76bqJHMKJSuGWM
	01/2e9Gv6v7qRKxhvXzjljHXlCTQeROAU59+FbR30Omqos5hYZ3QLAKgjy9wMIFuAnXt
	GQZw==
X-Gm-Message-State: AJcUukdlTCzlslVcNMIgJCB48++PRQIAFg88K6Jl4cg1ei1Hmz9qa/jj
	a2ZQnmf4Ux2I8oEgjO8aLgCynA==
X-Received: by 2002:a17:902:d202:: with SMTP id
	t2mr13235246ply.193.1548459605219; 
	Fri, 25 Jan 2019 15:40:05 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	t5sm47053662pfb.60.2019.01.25.15.40.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:40:04 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-3-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50b6d384-b152-ce9d-f7f5-273691c9359a@linaro.org>
Date: Fri, 25 Jan 2019 15:40:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125214926.3204-3-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] target/arm: fix decoding of
 B{, L}RA{A, B}
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLMmKIKQM0Ec

On 1/25/19 1:49 PM, Rémi Denis-Courmont wrote:
> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> A flawed test lead to the instructions always being treated as
> unallocated encodings.
> 
> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
