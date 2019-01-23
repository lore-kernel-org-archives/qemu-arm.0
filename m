Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1268971wrt;
        Wed, 23 Jan 2019 15:40:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4EBoJF6pXv2PuTElzhf2eKgwZWiMQJ2LEqVqSljU94qNYglc/nOFbL0WNyMFdsPCyojUJ8
X-Received: by 2002:a1c:2457:: with SMTP id k84mr120812wmk.139.1548286814851;
        Wed, 23 Jan 2019 15:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548286814; cv=none;
        d=google.com; s=arc-20160816;
        b=ryUXS8oDrhMmYEsFIIQVy+wbbMSQ259f4mpZ+76Uls78ZZXfZC8foo3B0HZYR49yqt
         Ol7hZ3J2L8/5oL98czXFy5cF8T1pLvUQVs5Cy262rTsZ+eSE83DFc+RKYl78kde9XXPw
         rTuB4qUecPnPNK0GEqoeHOIGkIQWGe8zseUsDJBMUpbnC+nMembxENm89UOwgRIhTIxy
         Zeo+2qhvCBCLeYUIH5OGInA0clJrtL4UVl0ONW4olKmf2vMK8jJWfoeSkVcCr57nJeo5
         3c20GkuZFZRhC+jZB893BSydkk3BKcUP5kTAAaA8njkrCrixlSp0yWGlfOdPDAANDcvj
         vM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=DYrSBXLB0XoF4tPWSc9/vr2ut2B7zr4raPj+YzekPXo=;
        b=tk0jCI9QDmlSqRt8C25wdSYypINcDOxuR08MS+feM1erBxBzGoVqEHZovKfdzadAB6
         Hi/FWIgg8RFtPSmCphybMefmhIBcoRIISmv6BWJ7NhTSAWPBUQjIPr8WvhsKp2XbAP6e
         PyAtyOAQZntDCfDuPeNSstpWz96glsGDPPkyjLe3pv8aR3fk3HJsR5LYpAL+/4///Ls5
         Gmut69BWjSSc/eJ1bk8Ke2VF32npCzE4oYgVLsD2x0EybnwBZRk0uoxsN9/7/F15kxJG
         IRUrSvym2X0f1KZbIWLuknfMGVzlyfeta1gLgCZ0cvi2j/DGXWHvytjaYBFd85T0ErnH
         qPYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A41gp605;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si33485520wrt.171.2019.01.23.15.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A41gp605;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmS7y-0005Bx-0N
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:40:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS6G-0004J5-Ll
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:38:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS6F-00047T-6t
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:38:28 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38738)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmS6E-00044r-By
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:38:26 -0500
Received: by mail-pg1-x544.google.com with SMTP id g189so1796421pgc.5
	for <qemu-devel@nongnu.org>; Wed, 23 Jan 2019 15:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DYrSBXLB0XoF4tPWSc9/vr2ut2B7zr4raPj+YzekPXo=;
	b=A41gp605X7f89Ks+qTkh3+zz+787nMevSmOCHJlZ/qQqNFNyytKwERGkY3mkBjkjxN
	SvjRlIOyGItcrslB9O6b5RTnvYkAOew5FsMFwI+PbdfMCwP/jkALoCtBOStKa0m974ET
	8Nu1yQLjUwWm+2Wbci8TjwEdwDuAjolFQk6W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DYrSBXLB0XoF4tPWSc9/vr2ut2B7zr4raPj+YzekPXo=;
	b=PKcvXTR5FuuWmLfE6l4RcDgqGVxlukHtyesA3tUcN/xf3ZzlT/WCujSJlmDd9ICRIe
	Vyih4ZEbSd+BbdE9n/pTlLI6kGnc9qAOlqEBaqDyVUkz8Zq6UXxSZlpDLyF/B5HQsE0m
	sRGsdOp8nAiJB/QopyhnF+9JqdcuMecIcn3/q22o1grg/ITRWVGTYNx9W9jn0F66DvE/
	LRvjzQ5dZ4D1W9vQQ2teYCNXBunf/UwW2rbD3JpkP37sM54S53XFojz7gWYIumo+l439
	LEFvIEaBncwTZT+XL6hVqeWFB2Xk1HUn1ZwwvwVxOoXQngSAkIH//Ryyjaph9TCOh7Pn
	U8cQ==
X-Gm-Message-State: AJcUukcDZWkEArZ2ynl9RWC4olwIPGVW9MMP7aErgn5Mb+SyA/WPsxhI
	vxYEPrMaaujttp99fLVsuW/j6g==
X-Received: by 2002:a62:824c:: with SMTP id w73mr4045829pfd.150.1548286705136; 
	Wed, 23 Jan 2019 15:38:25 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	y71sm32800009pfi.123.2019.01.23.15.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:38:24 -0800 (PST)
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20190123213227.17077-1-aaron@os.amperecomputing.com>
	<20190123213227.17077-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1627fb0b-b2a0-1cb5-71b3-ddeb1f07bf8c@linaro.org>
Date: Wed, 23 Jan 2019 15:38:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123213227.17077-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v11 2/2] target/arm: Add a timer to predict
 PMU counter overflow
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x17YMAuBa17q

On 1/23/19 1:32 PM, Aaron Lindsay OS wrote:
> Make PMU overflow interrupts more accurate by using a timer to predict
> when they will overflow rather than waiting for an event to occur which
> allows us to otherwise check them.
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.c    | 12 ++++++++
>  target/arm/cpu.h    | 10 +++++++
>  target/arm/helper.c | 72 +++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
