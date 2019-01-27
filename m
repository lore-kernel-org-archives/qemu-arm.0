Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2518851wrt;
        Sun, 27 Jan 2019 10:48:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6/MngckBYvZzGC6V60wFG3O6sXfTHmwlLH3rwQ+MWk3pLrq6vRyxI2yvnAZjeYKfxuaSS9
X-Received: by 2002:a1c:2787:: with SMTP id n129mr14756600wmn.128.1548614928410;
        Sun, 27 Jan 2019 10:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548614928; cv=none;
        d=google.com; s=arc-20160816;
        b=VSbREp3KTGJ35yfSlKIBxU7Vl/WS6fysODvUv9oscrvuPrDONnPuWc5G3M5dfr8cQ0
         jyAEnEhx1uRGsdSOU0tSb2b0n9VeecdbsbzMlKNBCY0eSfu2Nsxt3xg0vtsdQDPNFbp0
         TIne5PrAulTp9o59oSkhi0Cx2+mV/vbJ3SVXedH04E9M0IaUGa159cEMkUrkFqloeYpE
         wdW3DBdlvzK8CJGRzWBpAooNTsN5Kh1d943WjO9LKNMVV0+dcxRpxgLAmB2OyORFp1/j
         Fzk4TH7rAgibTvrneywsoAhdGQbC1L7Xto7NJskAYkHJ9jFiErXsvLPEvSWrmdpphH2V
         AFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PLoJMcMq5ul/SjA50Z1k2XrF96nXzUu8QsyuU5urkb4=;
        b=SDHP3LT24tzRaXnPsXLQdv5SQqJ43Yj+fR0hOHYf0+i8ADTu/9VJYCKMw8+AodmtLD
         1wD/lZeNL03ljWK679Mb7UPwAEMEoVlMOv+73Ykape3hz3zMIjcbHjRHyr3P/9WzA5Dl
         4gw9iOO2McZzX6sXo1XJNPtiMOvAhtshrOt/GszQgrUq+dzGGdcXoT3XrZ+algzupC8r
         BqzLEPIV8jQOVzX2NR8YRKQjCVkPHVL1OX8bt0rsC/TIpm1OK1IreLfzXxH7WPdf1LqJ
         t7MRGY4Ok96zErF0xSrRIm+oUkXPkWrKvdWs8UF7Mdyk39iIfoYPWNrABbxqFFfeQmS4
         8TmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bW0GQ43z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k73si34271417wmd.122.2019.01.27.10.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Jan 2019 10:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bW0GQ43z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnpU7-0000gn-2h
	for alex.bennee@linaro.org; Sun, 27 Jan 2019 13:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpTX-0000OY-CG
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 13:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnpTW-0006Ya-LD
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 13:48:11 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnpTW-0006XU-EW
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 13:48:10 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z10so6264499pgp.7
	for <qemu-arm@nongnu.org>; Sun, 27 Jan 2019 10:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PLoJMcMq5ul/SjA50Z1k2XrF96nXzUu8QsyuU5urkb4=;
	b=bW0GQ43zIXBw99XjTnd2ZKIBg+USS4zZjD7pn3/gAw1s25Bvy7trQ0JcZlCE+Gbmzr
	5AHuWPjCgYOQPXRqlejSIZ3DDpbR4MGomhlwU2gVsJiNWclc8KaicfsGCuyNBtYSAbjJ
	8xC+RCvT6dAc/9MrHOb2ZLRvSsQVGkv/KGR88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PLoJMcMq5ul/SjA50Z1k2XrF96nXzUu8QsyuU5urkb4=;
	b=huuUenpxyqP95TBKx0tG6mhZvsQVm/5MOlbdrajcU3VqGdJyTpOyWF6ORWev39l89O
	xJROD8uaMTOXSvxosvoHR1hwKjRwP143/U1gISOYeDrCOkk3XFmLP0o6KCWgjP9qMDKZ
	rDdPweD++T+CuuhXoVVsxQ/6QN9VEkT153p6dFsRO7vl+NygKGGgQScCxq6GIBO31KZ7
	dFKb0QzEechNh4tK2pJgBilxmOgFcfnLO+nzcOIZPlEvePUoVA5J6+saVQmpEswrYBbi
	UPZoWSGXWYBsYYvOdHBs6m9vEf3OBEaPgfjC8uopuW1mRnUIH5HKbC8fzjX3gMCvOLSz
	kxLw==
X-Gm-Message-State: AJcUukfGFd+3fB/iy0usqIsUlUCL0tLpXHNh6k+hOhG/tydS1UB+FHuz
	7W9Rf+Lo3nEzwMEBfBaIisbq8Q==
X-Received: by 2002:a63:a064:: with SMTP id u36mr17366979pgn.145.1548614887662;
	Sun, 27 Jan 2019 10:48:07 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	m85sm48006481pfj.171.2019.01.27.10.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 10:48:06 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190126065211.3587-2-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dae91346-45e7-e86d-1354-facd74680f1f@linaro.org>
Date: Sun, 27 Jan 2019 10:48:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190126065211.3587-2-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv2 2/3] target/arm: actually
 enable PAuth in user mode
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
X-TUID: o6q8whSRZTaC

On 1/25/19 10:52 PM, Rémi Denis-Courmont wrote:
> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This always enables IA, IB, DA and DB keys in user mode on the maximum
> CPU, in a manner that is consistent with the other CPUs. That is to say
> redefining the reset value of SCTLR_ELx registers.
> 
> Without this patch, the PAC* and AUT* instructions have no effects
> (except PACGA of course).
> 
> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

