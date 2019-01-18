Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3510758wrt;
        Fri, 18 Jan 2019 13:59:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Jh6Xk86FkBcB75hxza3G+Gf89LGRCBU541VsXtKP/PmY6DRz3ZCTUcJZO+qGgmkI6hS1J
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr19539969wrp.59.1547848743288;
        Fri, 18 Jan 2019 13:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547848743; cv=none;
        d=google.com; s=arc-20160816;
        b=MrbvUjwBpzht+wK7toua7td/me9m9yIvoT5JDjlYSL0FKixCsECIQIChtp4stGNE4p
         5e9rzOo2XvCR27Kr9rcOr6XQgrRxz4h+yn3Jy8xN96iCQUhX5hz54sN63fY5rSruJYpd
         Jb13z3m8vwBbwVTmjl++xQ/uAIuBlz4xLtcm4hfMBMaqKMvmHZS99IhAUJM3SimL7HER
         8e8GfSrI08v1yMZkaF4qAgZiX5B9HczcdxYwHZ8OoPfOUK2X4W7qvPj+2+LHfx9B7EcN
         h9tkVs3EkX0q0iJGf3s+KVi8cIROUg1ZRxqTi6EoyIiZkuot61Lqfg7DNEJklZ4dul3P
         b5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=kvnI214wSiGC3Q1znbRzZUrRPfLHzm6I6CyBg4KVCUQ=;
        b=lYYEmNtBbyal75n2FrnSvn/FLsH1+E320GvB2iitxo60O/fnX/37vFLXqYeSNwvd2D
         DhP4FoDnSmj7iqjiPTheoWsTRc9lHTr+M7MWzR5oB7rEryn1MWyQCGM3Gltr1x/ABkuV
         Y8vULC3RlEKWmTg37yyeBHvgjXkyATynsQeb1Mdvs5MI1VpRNf3M9Ezn2WF0jv56c9IN
         ykLQP/fHPBLM/CLAK+5QgxLRmcQdFI7FDOHqx54JPGrmbGpBuyKDNWj3/gxSfLWuSsiZ
         gH9AOZkufQzQD1w2wvPqq/bgc3gM1269NkrGlc9qNbO/SWrsHzhHrl1EBIw744V+m97k
         8chg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQhD4sWt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si59163127wrt.345.2019.01.18.13.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 13:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZQhD4sWt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkcAI-0001ye-Aq
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 16:59:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkcA4-0001u6-M5
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 16:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkcA2-0005yv-OZ
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 16:58:48 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkcA0-0005uQ-SR
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 16:58:46 -0500
Received: by mail-pg1-x541.google.com with SMTP id g189so6667911pgc.5
	for <qemu-arm@nongnu.org>; Fri, 18 Jan 2019 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kvnI214wSiGC3Q1znbRzZUrRPfLHzm6I6CyBg4KVCUQ=;
	b=ZQhD4sWtFXgrBgzrLnFI6JedCyCIbqUj6fTXonvDAM4IAKtgYXfDTQKPGuW38vr11J
	v2ZWY/lfCoTHDlLIPro/xFpmx/AjnmHtJhCtGw90Rtfl8pYRFujH9zoxbsiN/RLPwBNr
	xv/lPbNblzXV/BCf8pcL1auaFPHXTxnUUC8pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kvnI214wSiGC3Q1znbRzZUrRPfLHzm6I6CyBg4KVCUQ=;
	b=lHKPhBT00zfTULwqPcBXE8F1vVyYACB13LdeMCCVL7uU+xyWHCC3QP8ZCTikn2cIt8
	4cXQu7PRHbZuPcq5GLmiG4h/xuMlBloJjQRrcsQvGjaZ1+0c0we4kwR1vw/8WtKio/p7
	pTviv/2ZcB8vQdg9JxAoMKRPWxn9JEdiY6a4m0+sRzHvHzJ3iIzY+ERfoPKmHYlbw8dI
	7+pFWYJSxpwqhWC85lDvKJnroeJ/AoKv0egl8u3GR7j8kmaG27RsMfa//wyn36L4SMYw
	73PyQxt9DvESSJP0QXhwOCqAgaic8HirK59RQStqsnbXhw0f0hhBHMHlutDnsnKxbQTq
	hkFA==
X-Gm-Message-State: AJcUukfllDXgObAvh07Vu3tPckJZfeSFEuQzcE/RhJFtsriurBMg+HJx
	WQZgy47lTJcGlycOkMsUIoOO0g==
X-Received: by 2002:a63:77ce:: with SMTP id s197mr19289707pgc.89.1547848723497;
	Fri, 18 Jan 2019 13:58:43 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	m65sm16535331pfg.180.2019.01.18.13.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 13:58:42 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-15-aaron@os.amperecomputing.com>
	<8683c2c4-0111-492c-c6f9-1b2dcc937405@linaro.org>
	<20190118214052.GD5213@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7df09386-0581-5e21-2dab-588662b0e89b@linaro.org>
Date: Sat, 19 Jan 2019 08:58:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118214052.GD5213@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH v10 14/14] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <alindsay@codeaurora.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W/dlN5dm3rUk

On 1/19/19 8:40 AM, Aaron Lindsay wrote:
> In practice, I think only the 32nd bit would ever need to be cleared,
> but I agree it is more correct to clear them all.
> 
>> Given that it is architecturally defined to 32-bits, I think you could really
>> just drop the define and use
>>
>>     uint32_t new_pmevcntr = ...;
>>     if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN)
>>
>> with equal clarity.
> 
> I don't know whether it is important for the resolution of this patch,
> but what did you mean by the following?:
> 
>> The type of new_pmevcntr means you don't have to clear any
>> high bits either.

If you use uint32_t, then no *explicit* clearing of the high bits is necessary,
and is implied by the assignment back to env->cp15.c14_pmevcntr[counter].


r~
