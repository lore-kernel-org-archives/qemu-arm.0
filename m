Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3754707wrx;
        Tue, 23 Apr 2019 10:56:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwycw1gxqCN3YA+HsBR7yNIYQMoQZwYEzl2d1LwegW/IOR8RupzkJMfTGDbZymhe8qzVHup
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr17830332wru.30.1556042182745;
        Tue, 23 Apr 2019 10:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556042182; cv=none;
        d=google.com; s=arc-20160816;
        b=nGOoS5F3OdSQQPNQfjt3TxRfPQ//A5hp/bKvCMxX5k63OvNwrwInnpsf9u9IWjV2GN
         h7K70LPfCBW5PINE0jOVjEMUcb5lzhWkreN9IZN3ypFL9DdwTE8G51QiuxhuAgCz8MSi
         +HRKkLo2Cnz2xQJgL5QHvjJJebRPhhVtTP/KY7+BCLaUjaV/VAgRrCEGCN1S7dM+PjH7
         SqD6jBvhIKnH+hR65ekEgdeJCPgej6DjHT4kp8Nai2o0H/qFdy3S88KehL6vlh91sC0j
         oASvFGevRFLfP56KhNUm5ohZwS85hpkOwWbtbewaFFZoB8mNyJJS8GAlwYyzqKGtl29N
         Vu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=eMHIqNiaYPstimrjnVZgtyQcOdfT4KUvHAKuck7iNsc=;
        b=qH+8aipJwd/E+B9zBisD0iKnD2ACJ53ALgpp/kOsyBz4EwY0R8ZeUqT0x1ehpjOSkl
         sY6qOCd0mOyApMz9++xGNuwdwRSuyVQRro5ZTTSKoAebykZwaLkkf8cpiTIklCvJBaoL
         SbvKnAhQuglbciAY4rLN1HYazjH2Ix3oSrgeTesOVxXOpkXJe6tJwP5+2yRbOHB/edCw
         xGMPgkq591+lMPd3hGpu0HVhxvCJOX1ksZxP+67eU6raLgzdIqayhehJKEAG25qDPeDb
         361SEpZwL06sPh+zfOil8qTUpyjWrFR2nJdLEar2oAazqQD+zS2VHo4wVTLc3AKo2H/Z
         gm9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YUV5Pdto;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si12669795wrw.58.2019.04.23.10.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 10:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YUV5Pdto;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIzeX-0000Co-Tg
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 13:56:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIze7-0000Ca-Gf
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 13:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzdv-0001DM-9l
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 13:55:46 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hIzdm-00010R-VO
	for qemu-devel@nongnu.org; Tue, 23 Apr 2019 13:55:38 -0400
Received: by mail-pg1-x530.google.com with SMTP id g8so7993594pgf.2
	for <qemu-devel@nongnu.org>; Tue, 23 Apr 2019 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eMHIqNiaYPstimrjnVZgtyQcOdfT4KUvHAKuck7iNsc=;
	b=YUV5Pdtoa4lHW5qgMKKF1GGjxtrf8jZjuXhDeg/2zXVkskVlLb5ynYNrs8X23mgHyQ
	lBMOjvIXydSCNxHe28vEGKHxaF0kjtft39puUL8xzOGrP9XZjhJhqZ0O3iitVIj8C9xL
	P82i9YD8wLbP4SJc/3TUByyEgyYj5fa3E7jpAzIN73MI+62Rmq8sMfKXpe9DAG8mQyEv
	3piLB4t/DXG1qq8s3ZdGnJTaICb7+RAxP/+MCJQXUJ89gYdAISvl9Z5DmqrWDVZpkJtK
	lO637/ht4m0P8SfjFkk+5E+OF7VYYwmb6Dqty7/zcdSZUsNxLknYt1v9PbZu1yFXj8BG
	U/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eMHIqNiaYPstimrjnVZgtyQcOdfT4KUvHAKuck7iNsc=;
	b=rUUA4d404Q/RHE3cb21V1e5UAA1KAz3YCoW0qlad5ZDdeU483k6w5Kd7ADCSGWYop+
	NuMaVG7YSOXjZR9nFmUwPa+gmoG4SamK/VUwdxrEmUWzEDuhk4UddTOvvYwk7WJK+h5w
	nHHwojUEePMBongxlGUIdFa4ZHU8Z6PNZgQ2yWLu9RSez2NTcLsmcSdxKeD6w1h2F54f
	9g5gdsajM4Snj6pb3SX6yOsnd5FJ13S+A/nwYLbARVBRWgoVmeyl4ujbnhGw2HUSw1O5
	iGRTnxiblpIVX2uQm5+DvPtFM1ZHl1b5ZQoliWCs65ljO+rxSyeqxFSZmTFl6GqRc8W0
	TS0Q==
X-Gm-Message-State: APjAAAUSdmVAUn4y/e61WVvnody2U2G+yq9DkaS/mlxwJWDoJFJ3re4T
	qnhdkDO2Mt5H+TfEeyaQExmgsZIHTJU=
X-Received: by 2002:a63:171a:: with SMTP id x26mr26601817pgl.438.1556042126978;
	Tue, 23 Apr 2019 10:55:26 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	17sm30711325pfw.65.2019.04.23.10.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 10:55:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee47862f-a890-ad32-1fd1-974f09f19d8c@linaro.org>
Date: Tue, 23 Apr 2019 10:55:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: Re: [Qemu-devel] [PATCH 03/26] target/arm: Implement dummy versions
 of M-profile FP-related registers
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 66MN6E5UkJnJ

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The M-profile floating point support has three associated config
> registers: FPCAR, FPCCR and FPDSCR. It also makes the registers
> CPACR and NSACR have behaviour other than reads-as-zero.
> Add support for all of these as simple reads-as-written registers.
> We will hook up actual functionality later.
> 
> The main complexity here is handling the FPCCR register, which
> has a mix of banked and unbanked bits.
> 
> Note that we don't share storage with the A-profile
> cpu->cp15.nsacr and cpu->cp15.cpacr_el1, though the behaviour
> is quite similar, for two reasons:
>  * the M profile CPACR is banked between security states
>  * it preserves the invariant that M profile uses no state
>    inside the cp15 substruct
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  34 ++++++++++++
>  hw/intc/armv7m_nvic.c | 125 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.c      |   5 ++
>  target/arm/machine.c  |  16 ++++++
>  4 files changed, 180 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

