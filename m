Received: by 10.25.221.202 with SMTP id w71csp1349527lfi;
        Fri, 11 Aug 2017 13:25:50 -0700 (PDT)
X-Received: by 10.200.1.204 with SMTP id b12mr21618329qtg.2.1502483150296;
        Fri, 11 Aug 2017 13:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502483150; cv=none;
        d=google.com; s=arc-20160816;
        b=lFtWL2CJFJtrDIlSP6xySNDoZkHWSgeJ6b6H2H8LdaSTIauHK+Wjin5CKI6Cq8fSxL
         RIcUcqvIUbCaIhvXbKECNrwt//JXR+eP47doAcvFUoVn8DU1KhgnyMepJOyj/cr9WwV8
         EU4ir6oWwAQqKMOsW5eniX0b2CraRo/rdPaviPXd+8FkThvX3DDdpMGlBJQSWLNQdJLk
         pNR5Z5qWI7X7zOkCEB8my1v3XK+kGsBIDD1Iqr+Ejc12kacTzIXmrt77ICiI5QSa6VfY
         CSb74N3GRKROwXk7OG4JyhxavBcfRNSzPjC//EdD3gKwOB5v4LHFuXU7cqtTH4KBfDeM
         DqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=PeExYAi2rUCyBIshcdGG4fAQGZ/h6iY2lrUxQThkOls=;
        b=GvukZivhkLJGD6wC05u7nzCNwABMxJvB+MyEgz/QQRAfyZKtTIg7PE2uT087bKm+7l
         /W6mkXUn/jyeqEz7d0+sn8vgsqXSzhUN7mx3taakoqAZVgAyOvRk11GEUDCbya2zpeGj
         NQmL7vXcuhzbNUJYpkx0ZFwGo08g8PHuuNOglI5Joh2kFn3hB0wN8pXufUx7WzA4Nn1+
         rrQJRB9y2Z5MfNx0uljkOCSbOXsRFrZMmQuE8WvUPFw3slc5kmbsuqu2awk150OLKWPy
         o3RU9YFx+2Gtm00KH+Cq3RtadkQwH/gCqXSOS/Q9heFZpWJTR+7CgMBLocNepxBRZvfc
         bimA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qu5+qdAD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si1466401qto.533.2017.08.11.13.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 13:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qu5+qdAD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgGV9-00063y-RF
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 16:25:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgGUC-0005UY-KU
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 16:24:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgGU8-0003uN-KN
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 16:24:48 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:33417)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgGU8-0003tn-BZ
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 16:24:44 -0400
Received: by mail-pg0-x22e.google.com with SMTP id u5so19603138pgn.0
	for <qemu-devel@nongnu.org>; Fri, 11 Aug 2017 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PeExYAi2rUCyBIshcdGG4fAQGZ/h6iY2lrUxQThkOls=;
	b=Qu5+qdADueAeMgzTWv9UVygieDwBsudZER25FTBcQpS0kWGmr3jOLExfir8NHKByVi
	yrRwAgBZsJE4d8uysmK4Fjkkfvyfgpt9KF6ZpPL9SBTG6x1HulvNCm26E647AaK5dcDR
	jwzCFH/4KRoPbPiSGLNjkt4LPb67ve7Je31jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PeExYAi2rUCyBIshcdGG4fAQGZ/h6iY2lrUxQThkOls=;
	b=hZGKQCqfej49pO8pMmngMMZU8ExsnPfbyS7PjZ5IYvoELsesr80hcW5w+/DuUCq8t4
	TIxu7m2EoAGvDFfWtOomHsgsJRMrdrrGnuptwLZ318DwLc1mBiP9C9q9E6Hb6RU43NEi
	JsVAQ5XQ9PD8IoJBEK3KX9/AhVeaQe6BQZI3SeKqF7NdJ60b64KtDTb0DPD2jJXsLeDb
	Ej7TzKrECyQSfMMaNDCUTO845OPs1iwMBGbpKzjztXL+pq132iow63F7kktzjWRIndch
	EfXa39XkRsgYQCcbc6hB5trQ3nVqPoz8MuSdNDRvCMVRABe57GDpSU1tm6IV5qExoz3V
	V03w==
X-Gm-Message-State: AHYfb5gpq0aup5ADDYjNmcthkvI59e8USSCpTDKHXoxi+GmCirQMWMLU
	lqIBZPwKN+RyhU6J
X-Received: by 10.84.129.132 with SMTP id b4mr18805296plb.294.1502483083283;
	Fri, 11 Aug 2017 13:24:43 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	d71sm3197502pfg.169.2017.08.11.13.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 13:24:42 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
	<de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
	<CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb2b501e-21b0-f711-19f5-a3087b6007f3@linaro.org>
Date: Fri, 11 Aug 2017 13:24:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPLJpv79Dv77t8m2q-pFOBg3u4hDmcz5Wk2t+tt+bT8UA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: Re: [Qemu-devel] [RFC v1 3/3] target/arm: Correct exclusive store
 return value
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2dWnBmVYLIhh

On 08/11/2017 01:13 PM, Alistair Francis wrote:
>>> +            tcg_gen_ext_i64(val, val, memop);
>>
>> What is this addition intended to accomplish?  Because of the position within
>> the code, you know that memop contains MO_64, so that this is a no-op.
> 
> This is when size == 2 so it's a 32bit operation so memop contains MO_32.

It's a paired 32-bit operation, so we're operating on a 64-bit quantity.  So
extending from 32-bits would be actively wrong.


r~
