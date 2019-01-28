Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3470762wrt;
        Mon, 28 Jan 2019 08:33:36 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6qjEivPvdAFz5KvSgjHYTcknAPfsimL8zKhL/oQh+blUyk4v0VfuoMm6xHMUySV5XM/pio
X-Received: by 2002:adf:a28d:: with SMTP id s13mr21858118wra.100.1548693216639;
        Mon, 28 Jan 2019 08:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693216; cv=none;
        d=google.com; s=arc-20160816;
        b=pMvNXdtDSetOliJDbPlMYPlM+BxqhIoBc3eSSmrQ/8GZy1FfL7cdTmHkYTYc5PKCoE
         cXe2zFCe/u6zANt0Wco2xgaLcRCl9c9HRiENO1s8MkQSkk91o9a+xrhanZULlRWUwqIE
         i1itmgBHm4xTkLs/owJtFh6EKNTzL3AZrOgmMKIJ2/XlSuXtUCWrZaopiBABmK3SZLZG
         viBFy6dLYj4/bBaLfqxDYwYgKR2CfYd81naNW6bQM9S5EC4uM6JOjVFhDNpgjBwXQWqF
         VW0Us7WtAR0k7MRUj6iHYM8ORFnvgXf3RY9Jm+9SYS3vaaVywKElIyA8qs5njAyzk+NL
         yNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=w1hXCJQxJ+ALZtLtFBgfYBKDIccklc1JHBHbAMrmq5g=;
        b=0xwOxBpi8DFBC+/ezi7k6xQ4sYYfsxGSMF/Jfn9BBI9m47FAeh3PympaBW8BS6Ij81
         607EbAGM/OU3KcISntlKL3yFQXY3rAtKwpvSokfu0P5GFTXfSTUhBHjFtjVFAZ/OFmN7
         XSU1SYDeGJ4F/ha0QhzJOew+czC1RYGITdoRrcTTZgl9p6uhlcq2nTAd4SAXsGjfrWXZ
         /I0oGF0FYTHW3v9LLvgXk0EIQeGjtXwgUSHtYP+i0rL9l0eJSkrxwehIJRslq6sgZ9kU
         YIvWL/dEBZ2tisvQ2JJJV1Su0uE2/+XbM5+aPFMIUShwSli9IHhIn5TCEqX4LLB47VDk
         PJNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4cp3UL4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25si35834129wmj.54.2019.01.28.08.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4cp3UL4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9qp-0006jv-Ih
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9lC-0002VX-7k
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:27:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9lB-0001jr-Fj
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:27:46 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9lB-0001YB-9w
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:27:45 -0500
Received: by mail-pl1-x642.google.com with SMTP id u18so7953421plq.7
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 08:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w1hXCJQxJ+ALZtLtFBgfYBKDIccklc1JHBHbAMrmq5g=;
	b=j4cp3UL4Er5EDv64SEQFEuzUz/B0jQuzo5axdq1KMExHETwyGX3iPjX18le6nMYmwz
	nJI4CDKUSihfv8z3MqC/jT12dwmyZEJHffvrt82La3iJYiofpWH+iF/bQ9H7QPqfanPF
	Q7z6iT+yBev+4sogoNLvQpQZIuEC5h7kpsNnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w1hXCJQxJ+ALZtLtFBgfYBKDIccklc1JHBHbAMrmq5g=;
	b=sUT/s8jysKc5s+Pwa4U/OFaOEUtPd92LyrBwNMBBsP/Rc1uI/mDVAfJTi7693z8owJ
	NU8xYmib7OrJvZ73kw2tLiJ6NNFCvlPJGthxvssL8mCl5gr6bHD7FYM0yW53sfvcvlUa
	kKWQezCSorVKxaAgzi9JBOm6627NcOOVm5WjxcDyhPKi/GeOgu5F3is4s1WVXRb0FpdW
	WC0W/RR2BWOIPIZchvThkL6RjmnkxLULV5k/X2PMAsjgfDmqlGOF0/ACZQZnf08oL+9N
	KR6eAPp+2Mly159KeH/bpfAIGy7jX/yPWq8aDGtGvaILctzwPrjg3O7i3pS7r+P1/sXp
	yjWw==
X-Gm-Message-State: AJcUukdCX8bzFArt0CR6x74Z7Zm8psXqMJJhJjLHzHzTshPPC3RtQpjv
	BIpNC8FFT/QsD7WKecfXamZNkV4K6ms=
X-Received: by 2002:a17:902:a586:: with SMTP id
	az6mr22351616plb.298.1548692854247; 
	Mon, 28 Jan 2019 08:27:34 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	u29sm74656827pgn.23.2019.01.28.08.27.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:27:33 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac1c5f45-17eb-32cb-a94f-8bc4988b23bd@linaro.org>
Date: Mon, 28 Jan 2019 08:27:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [PATCH 20/23] hw/arm/armsse: Add CPU_IDENTITY
 block to SSE-200
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MdDyMMK7RCIC

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Instantiate a copy of the CPU_IDENTITY register block for each CPU
> in an SSE-200.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  3 +++
>  hw/arm/armsse.c         | 28 ++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


