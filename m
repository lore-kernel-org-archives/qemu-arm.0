Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1236348wrd;
        Thu, 23 Aug 2018 07:25:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx//s3dPrj0gd8EegVDHnAwiem7irEnfNKFFgV/QVlBwgdhLRwgywwtW1IGtBavzLMweI0s
X-Received: by 2002:a37:d6dc:: with SMTP id p89-v6mr22146172qkl.351.1535034323672;
        Thu, 23 Aug 2018 07:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535034323; cv=none;
        d=google.com; s=arc-20160816;
        b=id0eqymxld7E5UYJer+IhXxh5fie+i9cd8qqaV/D3WefOr/11sAQP0qnBgeJRsK8/Z
         irgjHJMVRrN7P9I5ZJ0z3SKNqJyQwbN7Ti+j/yyEtrX1NL3Uc6rbZQYUkQzZ4YvwzXS6
         w6p6RK7Lj4kD7+w0syNKj9aWSAg+42L1N0pU6pDgCiC3UNlbvhpLSIfUn7uyjIJ3tPdS
         0UZY/s7LHmrzhT+ikRbLdKvauRyi/t8Q1hmkJyYCEifXV9a7z4DSa8E9IIMFcNgFvdzZ
         6r996j5DwSL0/m5wWrtbtvKY51PaNNybwcCPF8yVrubdOxXqKjlg8oIKcKsWTS2xEzlq
         27pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Hz2giuLIyR3Kl068McOE8y0VohoVty/RZiiWlJQ3FN0=;
        b=kLq7hNq/tHup75EpQlz0I3JCjVPQ+8Yimll+nf/loDsWGVzWykDOn3L2+yzmTMEmSp
         8jM9ctblX4SDJzrkrCmwmA/i7EHHhmceYKv4BNTspHcdimEt3/eS96FJMBDXCMpCIOSO
         VeE8Cfm6hFmuo4RatvFkQx+ZJXPVi29Rt4RmgpY5VoZcnT38vApp4f6jPwmWHIqOFUML
         sRsEQPTw5yyomXH79NMHWMAxblsGRhRCknGlO4MPJmqyo58e19TKW2o4/3j1zVtyZfJb
         HosD0nTyAoHh+/2FtWcA6apPUcvLmVskaBol3xzX7T6ssyXmdK6aDVmAu74siYws7TUz
         kOIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AuUmu59z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r38-v6si69754qta.244.2018.08.23.07.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AuUmu59z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqY7-0003L7-4o
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqQx-0004Kh-SB
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqQt-0003zI-MR
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:17:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqQt-0003yr-Bb
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:17:55 -0400
Received: by mail-pf1-x442.google.com with SMTP id j8-v6so2768784pff.6
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Hz2giuLIyR3Kl068McOE8y0VohoVty/RZiiWlJQ3FN0=;
	b=AuUmu59zSpqJ+BMi/zdwBPvx+dQcyvvQ2OHXh/COlUt1jrzguFZ/23D6CCA4ovzGYS
	ovSagMC/ZJNzbThA040wgSpWLMSpHGTLgNHVcI+yBfZfQD0OXny3hUp6U2t3uzfLJ4CH
	sBrX/swpnpDG4v7sMm6OWT5wzwtHoJwYgt9jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Hz2giuLIyR3Kl068McOE8y0VohoVty/RZiiWlJQ3FN0=;
	b=YN+q21uxN+36VpDNzlCDrmI7WLQQAWz/E1ZRY8A7M1fR4CkpmIhpf8k+hcYjSRXLqV
	xl/+16GPZx2DNtzx8xZfIKQ873dUV/8V7LB6ExcP/enYfi3lCeCXprZ8ZG1fSK+DMspf
	B84oMVhBirjxyHpnbQD6a/2+WuZZO+nZiqs3BNB8JPRAlkeySXCDYStNkBKOyxBau9yi
	FCKrg8DebmVMoTdlTY59px3POnUei5346q0IbVFrViK8piion7w5APoJS+CR8VtqvPSt
	Vv/Np97rBw/jAEAQkacdaVti6Pb5e3Gfk0mo860CEVV1t3MZorJUESpM6jDfFyEmTBm7
	K1cg==
X-Gm-Message-State: AOUpUlHxwmW16pYPDEhiPS/7JJjSFAOQUae2aA2Xas06InyUE8BkXtVa
	SAk5k751pdndpyLn18U02xEkig==
X-Received: by 2002:a62:d74f:: with SMTP id
	v15-v6mr31148552pfl.257.1535033874289; 
	Thu, 23 Aug 2018 07:17:54 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	j195-v6sm7957460pgc.25.2018.08.23.07.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:17:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <56bb43b1-765d-0fe4-2ae4-26cab7e32efd@linaro.org>
Date: Thu, 23 Aug 2018 07:17:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/22] hw/arm/iotkit: Wire up
 the watchdogs
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zc+mTP2xgeO5

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The IoTKit includes three different instances of the
> CMSDK APB watchdog; create and wire them up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/iotkit.h |  6 +++++
>  hw/arm/iotkit.c         | 58 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 61 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

