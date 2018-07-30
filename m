Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3952746wru;
        Mon, 30 Jul 2018 09:15:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfAA+4JFi/Xg0goK74mPDKwuzCoQcpvLSggwSMb4qqq/4ctB62Cg9AlAsz3tzZzIQooFqwr
X-Received: by 2002:a37:b446:: with SMTP id d67-v6mr16549033qkf.104.1532967309737;
        Mon, 30 Jul 2018 09:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532967309; cv=none;
        d=google.com; s=arc-20160816;
        b=pnanOVWzc2SQN5wR4dGiRom9fySdZQf81F/nrOrMo2534b4ym8xJ+qPnnDdr0s0lAX
         DdJv1GLg2ooUayx80Okgmm+GbbcW91L/qC6/7MPjb7+BUxvhvfZYXTaBV06YnSPz4GB/
         +nA9p4ThZ1Ew6fiBHbsBqMg7pVMG0UtjojSXnpXB6LB/5rhprRund11XIDqqEdhyna3s
         OaZIB6W2rBm2Rg3GyQiXGuG6uLwPylCHjritWi5u8e6uyNHf2r3hNTJ5CQ45q1D1Nzr7
         CZaMOw/+igf6aTZrbrgS7VGuxHbdmlL+a8+SA7ARa2tdRNDzwLi9sq99tuA4etQPgYnO
         euXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5vFPYLeS9HXlGe4y6y9Nj+eSl1+A9/F9blXlbXt2V78=;
        b=YQly1fgM+o9nmkzF+0f9PVfWJbMDWp8HwO1MfZyOnnIy2y9AF2B5Bf9xZIX8SbzAur
         /562EwkaUXbHHPft3BJGIAVQjECPNRw5aFSUQam3fTwa5oRMpmH+jktn5AnJo3PhE7hS
         HuUaDR9i3A4INBsi5fXck/IFEYkeUPjsnZ5EC2CVPeI8kZuSYubkqzHKTOP3Grvek2Zp
         0OQXKgmHgT9e6H0VrtTWTYPbpFGyREzQVQ/ODHTed/ELFdXOXtW0hS/2u22UmH49ANCw
         j2dzDtLySBjV5OI1oEnzNb29m4y4A+52AtkEgq1BYLwOAP4qdU/nO75LlWe61p11lDH1
         Wmqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PrViXday;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a17-v6si3859287qtp.320.2018.07.30.09.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 09:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PrViXday;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkApB-0000bA-15
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 12:15:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkAnS-0008Nj-VF
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkAnQ-0003xa-72
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:13:22 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:44429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkAnQ-0003xC-0v
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:13:20 -0400
Received: by mail-ua0-x230.google.com with SMTP id k25-v6so8199693uao.11
	for <qemu-devel@nongnu.org>; Mon, 30 Jul 2018 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5vFPYLeS9HXlGe4y6y9Nj+eSl1+A9/F9blXlbXt2V78=;
	b=PrViXday3TZRMqYO2zylYnNpUp2RkAEAn5udWWp03TuVg9qrFOxQ645zhUTU/Vuh5B
	T3aBerFfd/zS5IW1ZrJqWJx1LKxRB7mqocuzEwJpr4egC76AVhXLmAGm6l6dXbDncqVq
	WPqYUa3prg4EDOgYUFEibY6CO3MJxw1MaDnnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5vFPYLeS9HXlGe4y6y9Nj+eSl1+A9/F9blXlbXt2V78=;
	b=h3UhFokrPkzy7LcE4IfPflxuzkFHm8zo1nlqDyRqIdyZK64Ladc+RxSQ4Gf2kUYAny
	RutSAUBihmn2QG9zAJia/rUIy6FAdjcKYtx56Glh+3TDkL3Ka/Zt9/lsB2/hPkYP4CWC
	5zeL+tNtv1vlKmMD9mvPbrAexPGy2MSwD0xl4y97cze0um60NopjIWZ5tpZibbPV3D5P
	iKuZl9FHR5nQ7UMJwp3fUexyu47PZ66UQxLa+J+87eqmI5q0xJF+Cb2VFAwTunn+6QoP
	r2LaWuZQ/cgsbZgJnmEY2vxtCRG0H5sdM9pDZIZ3bh3t/kGqwzjkdLdZFQVJ6hDUc/cK
	0ocg==
X-Gm-Message-State: AOUpUlFNwuFDy9hW3e7Bqy8UZPEhgpN9w3RxXzYYUioJK3N92zdH+KwC
	A80TACv8jY1B2CK1jkRfTj0FXQ==
X-Received: by 2002:ab0:4e9d:: with SMTP id
	l29-v6mr13184883uah.126.1532967199055; 
	Mon, 30 Jul 2018 09:13:19 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm2770519uam.24.2018.07.30.09.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 09:13:18 -0700 (PDT)
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMqFQz_ssUKxMgxRCArF0dLCAa+=cjY5bqR399ZoHcxvw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2b0a0b13-eb30-64cb-5919-c44750e04ca0@linaro.org>
Date: Mon, 30 Jul 2018 12:13:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABoDooMqFQz_ssUKxMgxRCArF0dLCAa+=cjY5bqR399ZoHcxvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-devel] ARM: SVE issue in cmpeq/cmpne
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMQYslGZRp7j

On 07/30/2018 10:20 AM, Laurent Desnogues wrote:
> Hello Richard,
> 
> According to SVE definition, the operands of cmpeq/cmpne SVE
> instructions are signed, so I guess the definitions of
> sve_cmpeq_ppzw_[bhs] and sve_cmpne_ppzw_[bhs] should use signed types.
> The other cmpcc instructions look good.

Good catch, thanks.


r~
