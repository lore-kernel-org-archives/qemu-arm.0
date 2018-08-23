Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1280027wrd;
        Thu, 23 Aug 2018 08:07:45 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyvfGuzEheX8SXpQXTcBMSw0DQyPcoy3+yZUkR5m8noX5bUKlSkgTIo6V5hjDFq+AqArNt8
X-Received: by 2002:ac8:2807:: with SMTP id 7-v6mr60839512qtq.111.1535036864961;
        Thu, 23 Aug 2018 08:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535036864; cv=none;
        d=google.com; s=arc-20160816;
        b=KfTtxizU0ZjSvEiSvNnCneIrCosrXqUCx66RmOiiduuC5qRDNvEzygA8kF7XOdcs/h
         eOkwcnVM2lwbypu2hU6tU60GU1doDKbRK3w57umzDMic4a4tlYV+r/Hi3DE9UtzhEfLT
         ko3Yk5TRQlQbBLKLW8+ohIhTbkwe8SdEWScLkCAvnVpTNzMr8e4mNm5RIsH44k/EKvs9
         e5BQfRqhtljAUn+/raqjNdChlnL3JdlTlmAIocizUspakkfbULYtV6Z6PT4wqmGwdqfA
         UKcmqrBn5bW1SPXnyIEUquqesoqnPMPtgHtnf4Tkh5X7HLlRlRfyCnHRNhziagUrFCVD
         UMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=nNa3jNNjTT9FJhrphPuvwYAOyBkp8rHh2TCLNSgz0CQ=;
        b=FOySDL0SLLxMZPu8x1danoMu67A/p2ppzQp0Bbj7HR3cTdV+ACk+8wqpAponvcIBEQ
         k5k00nEdNp1agQMI3V4OYZLcDb9vUks8h1F9zfMa+8ltFXyyod415h37Bg6bIwiUnHT8
         CsrgjINAqSwkiWnpTcMjNLmUpJ1CSZ4b0Gz9MvXHNjR3qUr0/c77RAcWJuj1wBPyItX6
         BWrPoskM4TL4Y2WNMQwLeuMbJjJAg47kuWLfYRlP6OwRyeHCE3VP+cnHAjvC5DbyjOs0
         RJp0JKXaTy1TJBKFCDXfkwI+w3DIjEHWl3G7DSVrr87GwiCVqw2S9w9HlymgJPAodNTD
         KvDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTdMxFz4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3-v6si1240355qth.129.2018.08.23.08.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 08:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTdMxFz4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsrD6-0004nZ-7j
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 11:07:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqb9-0006NT-Li
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqb6-000202-8Z
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:28:31 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqb5-0001zf-Tl
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:28:28 -0400
Received: by mail-pg1-x544.google.com with SMTP id z4-v6so2655549pgv.2
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nNa3jNNjTT9FJhrphPuvwYAOyBkp8rHh2TCLNSgz0CQ=;
	b=iTdMxFz4g/KNJI8JhWYAEXktfSa04oQ+Y1t889ZOFaue7m2Jr4IAwTWUcnpgeLM7SV
	jYWBl5755pZCYcFVmctGbG5oASofTAvUgamTjjKbvDqC7OYOEsvCmXi4RIYAS7Hi3L1E
	P5snVx4r6D6PObh/B4Ax7jV9O2RsAuD7DR4f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nNa3jNNjTT9FJhrphPuvwYAOyBkp8rHh2TCLNSgz0CQ=;
	b=ib86G+cu6o1N34vXBg0B+G/KO5DphPWPZM1vxxx4ATJ3ekIAWwKZuRR3gdBhM6wA0J
	nzJWXmZZ2f+zumCt3kkgEu8De/scrVz0Y/ALYxLnxSXBxH8g89g8JP3zVEPBco+rIwGT
	pf/8SZbg4c7E+v1VuBLg1iw7xq8e7A3ECyzM2S4F4ReZTbPehKtU5btHbx/n3QZ/qklU
	ChIiucsGZOoxYjNUb8Pyd6t6HbGvDk1hMFFj0iZuJl0b2cvJ9jGvwqBCQPByOn3VFNOg
	tcs+aTpQKvULYeE6lwSeatr7pMxG/+sU7m+MjfQKrlIU4rjYG3vNFHzCidxZdlpXuCRV
	e6jw==
X-Gm-Message-State: AOUpUlFNJGcVsn4nzaxp2O7gOEYGRw399JKFkF7zB25j/SQoiIvYsD+q
	WVYrlSWvgpHQZ3dHghpwG8DFKg==
X-Received: by 2002:a17:902:2f43:: with SMTP id
	s61-v6mr57483384plb.176.1535034507046; 
	Thu, 23 Aug 2018 07:28:27 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	h190-v6sm13467912pge.18.2018.08.23.07.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:28:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <765f30ea-a930-bc6d-d070-3593a2e30e10@linaro.org>
Date: Thu, 23 Aug 2018 07:28:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 09/22] hw/misc/iotkit-sysinfo: Implement
 IoTKit system information block
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htKq59HZ+3Ep

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Implement the IoTKit system control element's system information
> block; this is just a pair of read-only version/config registers,
> plus the usual PID/CID ID registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs            |   1 +
>  include/hw/misc/iotkit-sysinfo.h |  37 +++++++++
>  hw/misc/iotkit-sysinfo.c         | 128 +++++++++++++++++++++++++++++++
>  MAINTAINERS                      |   2 +
>  default-configs/arm-softmmu.mak  |   1 +
>  5 files changed, 169 insertions(+)
>  create mode 100644 include/hw/misc/iotkit-sysinfo.h
>  create mode 100644 hw/misc/iotkit-sysinfo.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

