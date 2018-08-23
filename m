Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1427673wrd;
        Thu, 23 Aug 2018 10:36:50 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbPdj4hN8QpCDiGNtXZYE5LmALYqLwzgXLOPHP1A8+aiROuwLcZB4xtryq90VXKNjhiqUKM
X-Received: by 2002:a0c:e64a:: with SMTP id c10-v6mr13610004qvn.199.1535045810081;
        Thu, 23 Aug 2018 10:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045810; cv=none;
        d=google.com; s=arc-20160816;
        b=SkgjiZBDNqfKOtK6wnQSyxN22lSjbU0kwbMJz5MkTQ4/3kkMNBnwgwa+EJm4qA2ycL
         p6lvbpmyX/Gyv49kaouzu0Ph1BY4Ij5QmGLS//ocRqlzOqLO8wRY5FAelKwTPAsfR0U+
         NHjq0aS5PPyO+bgbKSuJ0mcRJY834qwkSyrJ1XfO1IVlCaVPGFg89jh9+r1TWGC7bV1Z
         AfVz9qfrWwfgWoByZhBKYbaFrKnzeVLW1r/s/Trlnlpz6H2Ug70a24LWpP07gTjE1Qc0
         jUmGqztKGifuqY3yUo3ssi3hWvubTiykKt9cMQTZHrtS4XFZsJl29gzmdKiK7HGWI27A
         P55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=qDrrrKczlVZReNYtIVLXsfWv84iM3eSZ8Jt5Pd+mPVI=;
        b=zjIpYHM1tX4H7TKwe6mX67eU9veXozIDha6twvaPD4U+G6KDMXJaFetABGQnMfpIJR
         nJQhRQy/P5f6CaYI0T4I6apcZ6fZitLeohsUsvM1ZN9gRwaa3sxr7mQFE9wz43Taa6XD
         Ubb3lBiKbrVVYgnIsFq+j5xEeIT6DPQbvz0X5705py2EuPnrdUQMeC6AkiKN/HTfe5AZ
         83C7RvIBVwpYp+blzyxaTMgAqjKqtFDSrQe90J1nO8aKwbWxgA7ypQ+GWDpaQRr9TSoa
         wfXiEMnWBzdW+03Nt/uKOhgb+Ch9aCLvIEX6/12WCfpAP15EvciwHuopXvckpeiWmHB5
         lK0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zb+nTNYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12-v6si1618513qtr.99.2018.08.23.10.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zb+nTNYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstXN-0004kM-Hg
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstQv-0003DC-Ks
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstQp-0002jT-30
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:30:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstQm-0002ey-Lt
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:30:01 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k19-v6so3139473pfi.1
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qDrrrKczlVZReNYtIVLXsfWv84iM3eSZ8Jt5Pd+mPVI=;
	b=Zb+nTNYVgqOpv/B6KM48ZBuznk+bJa+d76sQMiRq+18lva29GNeTZGi++UrGV+FVnb
	jNscJn38sHu3Nit2W0IJs+7/HBubDdKmWa1lVeHSwR/cm98dnu1Fth2aI8oczQeYAJXg
	iGWPJGTrwk0NV9QbF9M6h4rUh0wwQAzmdBIt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qDrrrKczlVZReNYtIVLXsfWv84iM3eSZ8Jt5Pd+mPVI=;
	b=VI7Du4fMt8MJXIDNl2J6jlxdq2CJSmczzm5Qiunx8xvXQKkhVUATWPC/O8/YlaGK8M
	XkIRFseDxr+CqSuXVIp70JtPjruCT5N7+yZyUiowhbDBAFx3nSp0LPM77mar7D7pP4uD
	0utAwTJkG+acf3NYF/K6NsFMMqGNsTwC5hSeepa/cXT4JEIGo4b88mPGrhDd/WJTdhK4
	tPYxqKfDFc+itVcghSOL1WNycEQG9EiwcYki9AnABVRO0wMtsKjSdQYAMAMXNB4THpEf
	mWacvGUnuGeDL30rnKcyDaGSA/C7DqAvUktTHp0JC5350SxJCVRGU8Lb64GeqKmYJwgy
	lEmA==
X-Gm-Message-State: AOUpUlFmhCTOKznaGAbm03ogLtOG7KwO5uiV8VSGcH20ECHtKb724Gx1
	/27VuoO3ZQ0ZiFod2U/WzXCYvQ==
X-Received: by 2002:a62:5543:: with SMTP id
	j64-v6mr62972108pfb.188.1535045398165; 
	Thu, 23 Aug 2018 10:29:58 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	j184-v6sm6856083pge.77.2018.08.23.10.29.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:29:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ec156cc2-61ad-00f2-8227-373ebb08243e@linaro.org>
Date: Thu, 23 Aug 2018 10:29:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/22] hw/ssi/pl022: Set up
 reset function in class init
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
X-TUID: r5BQIRirCtwi

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Currently the PL022 calls pl022_reset() from its class init
> function. Make it register a DeviceState reset method instead,
> so that we reset the device on system reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/pl022.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

