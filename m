Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3975869wrx;
        Tue, 23 Apr 2019 15:22:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+N78xHa8AYq5iZwYEhyq8cFjTiJdvzxgwllRPIIDjfgjtPW/QeK1AMloKqQR2u9MzsSAG
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr1387166wmg.101.1556058124655;
        Tue, 23 Apr 2019 15:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556058124; cv=none;
        d=google.com; s=arc-20160816;
        b=OY0rDu76wCiQBYLFo1etnj4LF8gDbQpI1zwcG2eF8O244XRYANNi+8P5jvHyobNe8x
         YUBxy9wFg+5r8bA2ANKTw/9a7ZrnDPuCHVk8+E4luou0uKC6uhcOLnAd2GjmuZCGj40X
         oLNvuIr3Bw8VhGkOKS6HsF7ASOLqIZE3+duf1MFsETogJ5kkEyUgDj+3xTRIZEZteIJ4
         RzmTAFA35xriqMfHjgT9otWgLDLA7TQ0/DIL0VAkdKgGt7vy2oPXfFyAXe5j2tjOWhhI
         Qq9wvyCOyzYkMqrEXD/0JcGDCVoaPnWs7QnFV4LZhAVmaBxJSUjzZmiKKjM1M08P3oFH
         KO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=EtvRmIoI89Cz9L/ejMiakY4cehlDnsI1WkEFO4hBSNk=;
        b=fBgaq2RiArdlyEVtkHtcgCmOy4EA4QIvNOo+d4HIISRGeGFNDKtO55dS/2Po/aGGeF
         zfjGXMII8uyCfurWeFIKup7cuc3rdVvZrk4Elpb6HN8upvSTQkM7Fe0NeMJftL+TYSmo
         ecONFx0sdj96g3go+IcbJhM0XcBymAuemZoCs1InUF2jC7E5R4WpV8UstABLy7GYwqjf
         Xs/K4xpmERnCF70IyK5CxfsIko+dUyQbab12EnZRFH+O3yVaIT6bsxDrcJOhchFgG4ZM
         odaDOEGWs7gL3Qqzf/vSYFwmblOPzT9r7GyHBxYXqMkECY8W+gxRQt0Z2SOTeAoqsouS
         AlgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJhaYqUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si11711410wml.26.2019.04.23.15.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 15:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJhaYqUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ3nf-00088f-Ms
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 18:22:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ3nM-00087U-5L
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 18:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ3nJ-0006BC-PU
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 18:21:43 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ3nH-00062r-FH
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 18:21:40 -0400
Received: by mail-pl1-x644.google.com with SMTP id n8so8183083plp.10
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EtvRmIoI89Cz9L/ejMiakY4cehlDnsI1WkEFO4hBSNk=;
	b=bJhaYqUzgCwpb9G3ZmeyFKn2L7ERmAdPhSgY3NB2jt5x/aMRkyzG5gXyw90ATZyaaw
	S0+9UieWap2hKJgHQG/e1yQl+4XcbdmmqtDh6sL0mZGdAO1VypfqL+UTJ8BVCh92Avuw
	o3mWnkasKka3/AP10Q/v/z6AdFlNUN0DSyRdR81l5iccEzge/jXl9DFfNHsEqYDxFrLy
	6rK0lYjdIj1jqjvWOAyoD9w8O+rKtWgR33bwHV7RMKBppCh8BuZcq2ki+H4aaFkgBV9N
	Q9k4j1IkI5313q6kCQpKrWPrMxw73rMo/IBeqIHLLsBEMnQp51l+3TgRonixH9v69ZBK
	PKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EtvRmIoI89Cz9L/ejMiakY4cehlDnsI1WkEFO4hBSNk=;
	b=gx6MsI1RlAb3ZxWT9HSr24BBZaT4JSsMUBflz1LQkmuWC/vdV/oCGWDT4yvKFokNP3
	HoHSbXxovAzZ+mtout9s+GyKHlNw6LzJ3vk8zkNQJFgT7tW2M6LeOutDV+3OzRYo7WUO
	cdGFbFyigt5WV6Axqxr0WjdPc9USbxGW3fPUp7mgcqXSmyc3+6tdaAJtIbwXP48XMEAf
	oP/C8sSsGT9f6iSNcFr1BPjEVmr4a5Cr9MAzcYaoEEH3tK/F6VzVNfrfATy0phWHh6d0
	YAZCm98c+S/gCQubEgvPbYzMrH0XaJ2B1R0hOhtlcWSZLXJQsao1y3cNm9hTBvdYLMQj
	VCww==
X-Gm-Message-State: APjAAAWCldAPvmMvOmcQM/RhuP5Swr5IHr6sLwNQyefE7tapPbXIgiHr
	lw5H93fb1hc0klZZK4l2OkYdTg==
X-Received: by 2002:a17:902:1105:: with SMTP id
	d5mr29081362pla.311.1556058083830; 
	Tue, 23 Apr 2019 15:21:23 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	t13sm7309407pgj.49.2019.04.23.15.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 15:21:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1ef6fe28-b339-c05b-b116-079f1afbe13e@linaro.org>
Date: Tue, 23 Apr 2019 15:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/26] target/arm: Handle
 floating point registers in exception entry
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
X-TUID: CiwRHr+5glIe

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Handle floating point registers in exception entry.
> This corresponds to the FP-specific parts of the pseudocode
> functions ActivateException() and PushStack().
> 
> We defer the code corresponding to UpdateFPCCR() to a later patch.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 98 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

