Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp53361wrx;
        Tue, 23 Apr 2019 19:04:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzi2f3bqoEkskcFaEVcZcWhiupebY03sSeQkrJz+T0wQae+ZsXxQca34NM9uWuNsP1qhv7C
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr4672660wmc.150.1556071483494;
        Tue, 23 Apr 2019 19:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556071483; cv=none;
        d=google.com; s=arc-20160816;
        b=zdT4wT9TLmD8NWrPL6W/oSs9BWe6Ruew1NxErszTZp1aXlNipDY2WI/Udl14np77P5
         k1FcECMHXqRHkHIcPPFzYqjnU3b+WaJ46H1LyFBxbJS7OrJIYv9KLgsMnPCWQ2MGWhcH
         9/N+Dg43/10viym9pECAc3aAozFvOsAUbKl6czopT1sYUCw60xlta1G/M+6uxuCsLnu8
         8u975lbIFbuYnk2hvR8mtixDviYy4NMd0i5/jbn6/n2vqNDsMn7q/rVRrS2Z3gyUO93m
         9ZdtcOuYTzN34qjSM19xWJfDBl/yZUSzplVL2Whxqf3vSsCnEflI9G5u4qHxCmkm5sm+
         i0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KDivsViAOfCo4RFhgtCHKlZh3xZHxL33MKFDeHxfAbc=;
        b=OeW3MNjMJ1w5CBHS+fp6u/h4cO1qwFRwhlOcB+El9UNxbdzsv+ocj7v4wqD/XjdyMM
         kzYXDYzMTYXtXJRCgzqr7qS5grCuwdNSsXn4aUXDxOHnyYO8DdsoduU7BCuYWH/fGNyh
         TWk0+pcO+n3PNmJ5l3lOrcio350WV6SbOtF2ADD8vMZ153gDMY+v5TRThO02hX3HfvgJ
         GWaVoTpWzXxasytyRAQh1feL8ZoKC4dnNGOodpwHWOBGpSE3f8a6RZbOcB9pGnHxg3U0
         llvhUwuN9vJfPuyvxTn8lmkPpOvBDdKP89siMv5x8rJih9HDStPuGvgipA8MiAKNFE6J
         nIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YSBebw8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si3961303wrm.200.2019.04.23.19.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 19:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YSBebw8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ7H8-0003Hj-Kx
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 22:04:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7Gr-0003Fp-Dv
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7Gq-00038G-89
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:04:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37934)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ7Gq-00036y-19
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:04:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id f36so8427280plb.5
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KDivsViAOfCo4RFhgtCHKlZh3xZHxL33MKFDeHxfAbc=;
	b=YSBebw8diX/h5thr/IuP1swEcz+IuMhACpHorx6w0G89/8/weuAXjmExTeGM6EhagP
	xEG6Va/HBpM2Uyr0f9tKoXmHct5yyZwPHYwNHALPCrR/RAZxWzI+QoD2yVi0rZqxCFnI
	qmUTq0azoGokAHT6hjwhJFdbQG3bvlHjt4LIOCZDdL0GmtOVEmmqemMhclWhIsJUSOKz
	IriRchJOG0Wu5EP1B2ZxyEynWMj1RFi3P6nTE5qNUcUVh6k2gZX6Mk10RL9XpjtiEoxb
	GzOa5eqtfoTFT7v/gH0shISIlnxU+4bet4agsTu9FSfW7YNP9J5L1wlO9yJ/+zjzOX/P
	iCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KDivsViAOfCo4RFhgtCHKlZh3xZHxL33MKFDeHxfAbc=;
	b=oB372qI8AUi0h2qmOlgTmbTrQbvzXaoU9EC4fWPiW1LRpxZ/cGO7kGzWh2I0e6qcaH
	VpQ0VGhqCETWyxQCsHb2YvsPR2m/Nt/j7JWrXQj0sE3hYqzI+OVjJuJea58ZqX5zm9St
	9f0SHaMpcLQX5TdC5IEIjvtoa2qVeEcEfATz7zw74ULes3CwlFo9E3zkKoCeuD8u/G1/
	QBUTL97JBACwb+x+zkr/4ICMB81TcsPrQgv23YbiCalCNsT8Vfcfz23DSxOoex7MsT66
	1yH8YLWUzdnnrOK2ioX3o/OuAVwPCcEfmAOzVeor+1PQCogFQc2dcEfzSPL8EobmfKxF
	Xs3w==
X-Gm-Message-State: APjAAAVgBJn63c2hOSACDeAZkhrlsbUgaFRGSYFEEoQ5ojUJFUiudBp1
	JY8RKGgscomBDsW/lXS12yJI9Q==
X-Received: by 2002:a17:902:2b87:: with SMTP id
	l7mr29867358plb.130.1556071461788; 
	Tue, 23 Apr 2019 19:04:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id i2sm24611611pfo.9.2019.04.23.19.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 19:04:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <88fec784-bb2c-b80b-9e71-104296f063ed@linaro.org>
Date: Tue, 23 Apr 2019 19:04:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::635
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 23/26] target/arm: Implement
 M-profile lazy FP state preservation
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
X-TUID: Omxn9xFQUshi

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The M-profile architecture floating point system supports
> lazy FP state preservation, where FP registers are not
> pushed to the stack when an exception occurs but are instead
> only saved if and when the first FP instruction in the exception
> handler is executed. Implement this in QEMU, corresponding
> to the check of LSPACT in the pseudocode ExecuteFPCheck().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |   3 ++
>  target/arm/helper.h    |   2 +
>  target/arm/translate.h |   1 +
>  target/arm/helper.c    | 112 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c |  22 ++++++++
>  5 files changed, 140 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

