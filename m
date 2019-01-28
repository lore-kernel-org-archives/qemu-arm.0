Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3469830wrt;
        Mon, 28 Jan 2019 08:32:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4rOCGK5MqofehJvqqyGkoQmEyb9nX1YLgpm437Tdb+7d/4GJBju+OywBRcHne3qxBGoIE9
X-Received: by 2002:a1c:790c:: with SMTP id l12mr3053791wme.11.1548693160253;
        Mon, 28 Jan 2019 08:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693160; cv=none;
        d=google.com; s=arc-20160816;
        b=vFqdMvTkFdUkytqLT7kVnSrYmUhv9kTa/SqLaPJeE5/FUqfVp1xo8YCjELCwbWwKLs
         sata0q8eiu/krP4tmnCa6qmA1VDt3j0yikF8iHwid6588jvUpTvbwWRcM+A0hghDkQ9d
         9r9NUmKf91Ne5CqCPZANM8r5vOlmrF+8QP/dbDIWmyIJMO7uJysNheGILOdW8fQC+dVl
         VGr1YlWha3+jtrhTXwbHIkhABdhS9swPNjRpwp2YVHrOht2ZQXmNISqhQnVM/fDZRbmi
         gXvxctySTcKS1Cuy3xbhTcvE/XqTbc9JYMF5dD9bOdEaxIawEBO9PjPRia9OZex9HbOH
         LvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+xaIKQ6E38rRDpgV88qU96mggKpL/uL7FZ16PEGw5Zo=;
        b=JLhDZIydJpj+YlXunewxUWMgUVfHVW0CzZqfFsZuS7LYyFWJHvykXfdYcGLtsecTUs
         EkRKFKPJAfMcUyMTEUcKpr0vP86tNf2DihRy4Vg5L5N3xcgqV+t4nLwendMxDMFG7t2O
         vae/zN3/pmD0s0xHKOFRQbSjnC5Jg2hqN72pKwyhMsuT+XEwTwCABlGcxTcblYZJF6gO
         VMt1Pfbg0bBPNcTTcuBAyekhpSh6Wfd1jj16E3igo2yYhvscjVAleXNf9TMWtsbS/cnW
         M+lasSp+3iuByAwe+xgBC8haacBsGGUlj6z11AOxHWKGiLtaji7hdsR0sKFtwrH12OIb
         8fnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjElDyhT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si51649347wmd.9.2019.01.28.08.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:32:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OjElDyhT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9pv-00064H-8b
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:32:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9pK-00062S-Tl
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9pJ-0006Ox-1K
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:32:02 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9pH-0006E0-5C
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:32:00 -0500
Received: by mail-pg1-x544.google.com with SMTP id m1so7421665pgq.8
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 08:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+xaIKQ6E38rRDpgV88qU96mggKpL/uL7FZ16PEGw5Zo=;
	b=OjElDyhTW/7/hsH5KqHNeNVfcLC1YuLUVPmkzEuHNiNryG9I3jDGRlYhVwSE/itkj+
	j6MULNbcYkAWkiocQ9nhjH9+5rSV2GO4zF2SxijmdV2rSvl79FJVPPXUDUoB9P+U5iao
	b+Sj5pNVFwjxM5ZwxdBFNme9by7XYJuaDGqhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+xaIKQ6E38rRDpgV88qU96mggKpL/uL7FZ16PEGw5Zo=;
	b=cSSJc+K3Aow7BtqIjQaIdaAM8WP9kOGpH+gL2G6VAIQp8c/wSVNwpqA/3i/6oMls3h
	bdIdyrCFnNCpCka4YAecUZdKHGS3clHlJ193kdcjs+dfrmbHMSiBALugFIW68Ccp7evp
	U26Xc6zzEuMSXo9Vl4vVbaCDt8Kc8hVc7NjGByvKBgrRPmJmSkRh4/wvV2DHrAK7yeEP
	rnLfGlbjL1FQCKr7oUNns9TxBv4o8kkGhIaOxroJNp08UR7JOIPoMo2mLb5s3SF8ZUG+
	OKyCpv/HsXGNeXunJuXlpPvoc9isE9DH6VuxXqrtPQHH+jIIQDFuMw/4y4KsXECPAMXp
	glGQ==
X-Gm-Message-State: AJcUukefH0kOio065giJtIq49pIJpuuw4cP3wgaRywRWyW/GgAbEJwef
	msKTHvaIA1dRMSO9ln0U/4U3yA==
X-Received: by 2002:a62:b80a:: with SMTP id p10mr22418326pfe.32.1548693111833; 
	Mon, 28 Jan 2019 08:31:51 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	z62sm48301295pfi.4.2019.01.28.08.31.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:31:51 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <55a04e92-4d8e-8455-e16f-bdd45b094a68@linaro.org>
Date: Mon, 28 Jan 2019 08:31:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 22/23] hw/arm/mps2-tz: Add IRQ
 infrastructure to support SSE-200
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
X-TUID: 7ms4RorBVWvp

On 1/21/19 10:51 AM, Peter Maydell wrote:
> In preparation for adding support for the AN521 MPS2 image, we need
> to handle wiring up the MPS2 device interrupt lines to both CPUs in
> the SSE-200, rather than just the one that the IoTKit has.
> 
> Abstract out a "connect to the IoTKit interrupt line" function
> and make it connect to a splitter which feeds both sets of inputs
> for the SSE-200 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 79 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 59 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


