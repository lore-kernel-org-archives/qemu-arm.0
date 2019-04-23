Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4038243wrx;
        Tue, 23 Apr 2019 16:43:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5/TtaVoV9+jaMH8tnpNUQcn0e5gQNJUj/KaXmP043cTTvxfWbB51RDvCMrkpPeVAqaLSh
X-Received: by 2002:adf:e892:: with SMTP id d18mr6449991wrm.271.1556063019789;
        Tue, 23 Apr 2019 16:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556063019; cv=none;
        d=google.com; s=arc-20160816;
        b=grbkZzxqaBmApOjcgOhN6xxgEUDLOGcSvw+Dn1ZHEVvUA5X+FWqKpgnfq+yfowszs2
         2lGDnC41tIWSy4ApIxlsThI97z51a1YZ2LoL+W2aMy6MU+pgElfZcFeuVZ/1WQo2oHBv
         9Z89x0jTtQmqrgmFskT4b7wsrg6Z35fjcnX5HfM0ATm5TVqfyCdk5tCjuy2WWSh+mkoR
         h5hDBG31HogokXisauoe5UyO9O8W5qkzO07LRLuZWYwxvLHx3lQhAke35dQLAeGMfNea
         U+t0xeWLgYxWvZl8SVfzjFAI5lYRFRR0dmWzmhV0MyhQqjyoIPTFYYsZ1t+mfwQpWbtR
         xYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=mqFFm8SS23sNsFKYjpQxHkuSPY2Dl+H9E8nKXHxPsPU=;
        b=ukt2JDAVgWG73qW+r0mk3cq5s5LZpPhRzD5fzautDOqU8OF4bs+zn0xPHL6oNDEBIl
         Ga/8nr6RyhCHOLg4MTUJok5ope2Pqv/Tak34fqLcXYTT1GC5/dzv5WuDmRzfCYTBY4jE
         59HS3kkvaQ2EXR9Wv87S5Bf14Adxn9Cgs3hr8pt8s4q9eUcI/Fm+QLqpTvK8WRmX+XHG
         7ISmiB6pSzAgxX3NhDSMaQbABaUA6B3loeAHVO9QNOjg0KaCO5wbXdRPRc/hNaOL2Vxc
         1YrQu/fYYGn3mFAGFT0peE2eaO2vDMzUI2HRbgZS13GedJ9Z5//j1tUKnnkcdWeiQiLB
         Vbkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sFcsgH5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si11974806wmb.111.2019.04.23.16.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 16:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sFcsgH5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:32908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ54c-0005go-Ri
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 19:43:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ54J-0005f3-US
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ4qc-0002a1-0w
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:29:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ4qb-0002XY-Ai
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:29:09 -0400
Received: by mail-pg1-x532.google.com with SMTP id j26so8370770pgl.5
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 16:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mqFFm8SS23sNsFKYjpQxHkuSPY2Dl+H9E8nKXHxPsPU=;
	b=sFcsgH5c25/negQFTqZqTXF24y5nA5w9X4Zv1tlcH6q3zATgr/gPfQ5S+YpYWtYPCc
	GqaGKlQdPlmm4nA5Hdl1lUJjSenGKF+is7VRI5KZXBb/JCt3Uk9oXSctlkih1Qi8ObiW
	d2IYjrM/OiZlemWqZ7lT43Gtb0GFWv79ioLD4hi/JydlhoppmU39yfRTCwpAbcnVcCO/
	70+tKdcpKHFR4tRPljmUoP+hNt06cC+/PMzYCtKV8I3UWoiIu2stLJi6uQjOxj4fdeeQ
	RIN8e/dYpYVztIj8JJ69CVBMQQY+IYPA2Fl2dX/h3BLlitxjGEFxiZ4w7Q2gqnCklcjS
	1o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mqFFm8SS23sNsFKYjpQxHkuSPY2Dl+H9E8nKXHxPsPU=;
	b=Aiz4FlSgz/KXNIm2XooeA7XzQzCULzrrC/z2WUeQmoZKmRFiYciu08im00mh42MKt6
	AmhmfsOvqNxgkw2tpED/AkX92BVjc+yz8tYp7xDcg8dZIHeSZb+97XqpmwTCTmI8v13I
	4naW7jvsSNnUfOr01LdeHXI55mn055TM/1XiVwTsIEDb9btO2yOOZu7sNae5SOgRQy4a
	/C8foK2EB8GGtbI+un2qVtVQMwqsYNFdLQpyyx5RZctZ0P6a9P+GYDVyJeeQqa/FWGLW
	YCY1ZFxI3VLTaNuGdTgaZ1qRQb6d1+aDRG32hHS6JyAZDpFQ7odM7r5FvSjEPN8SCRj4
	xmPQ==
X-Gm-Message-State: APjAAAV3M3ScnnWtJj7vA5Gjao4CaByhWozAf7LogJs59MjYNmQMAMle
	iVTs9m/iHWPfpr84BitCRWwy4w==
X-Received: by 2002:a62:4115:: with SMTP id o21mr29709813pfa.153.1556062146672;
	Tue, 23 Apr 2019 16:29:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	b63sm46258854pfj.54.2019.04.23.16.29.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 16:29:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <eabbae98-49a9-2d7e-5ad0-d1d45fa470f8@linaro.org>
Date: Tue, 23 Apr 2019 16:29:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::532
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/26] target/arm: Handle
 floating point registers in exception return
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eygsNSQ7p4Nt

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Handle floating point registers in exception return.
> This corresponds to pseudocode functions ValidateExceptionReturn(),
> ExceptionReturn(), PopStack() and ConsumeExcStackFrame().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 142 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

