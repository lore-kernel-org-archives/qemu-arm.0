Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1283199wrd;
        Thu, 23 Aug 2018 08:10:31 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaQukjWLyB3qqBKUqPZwf30wAyazdyVvXRLw6ICabhnZb+zdRJNG/Q1skoiJ4MFIXG8xYDf
X-Received: by 2002:ac8:2ee5:: with SMTP id i34-v6mr13900772qta.264.1535037031450;
        Thu, 23 Aug 2018 08:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535037031; cv=none;
        d=google.com; s=arc-20160816;
        b=NQcnG8XtrXUTpOhRlz0YJFuEuqCVBYn4KsUpdc94Zj3FIpsI8KlZ79AH5siVc0eYx/
         5sGXkbG0IHdi5+Q5M+BtIFOsSXUV7VAtYg5hmPnMrAGwp9dN/FpfKZVdYWLWuF22z753
         Ur1AS+/xSeTKj+krOPa9VtVG4GkyMET3GvJGxDAe9LiJ5b716Jz+q01RLIdxngvxitfw
         eSrfcsQYA/ZnBiUo1odwAk8Vj7c9YXYPXRFy9Z52faZCySKI34u/bCpFtHNUdx+hik8F
         HaFP9Zmid9Rm9f8t5mVIZ44LzNUiGhjPMzGvrvKA0tEptoAM2DewjAuUNuzXIO0Oy9sH
         8c3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=snYg5axyMqbqjLxXqc+FamQwh21MV7zkIV6RamZAiKY=;
        b=D8+fOzG1TKIdICZcRxgWLCyZEUp/ahcshW0YtJg+oRHwUPGu9H/Ty4In45opmyOFf4
         OcE8MGjSTKMTT6FglnHgjEbS5DqiVfa06JlYtx+sHnxB3Vj5y3QL6Xsn44ccHpCLnxAD
         8Lh9SM4O9vBVdH+bO3oyX96LmEl3sk2ESJBE7C4Jy0ObDiWltEmD9xQ4+ORT6PD8T6KV
         QF/btW3qbRnE0aA0NsLQp2qB/U4xgpaC9hbApixMM41xxC+ZHyUqKCu2+o7gMj09hJu1
         Ebv7NpKyrn7xaNuh7wZUgoVUI9ZqBbXnNaXGVB7i7ZnsfrnwPW9LqWYMHff/tuYCajJ1
         gL9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G9LiQKCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8-v6si4778398qks.66.2018.08.23.08.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 08:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G9LiQKCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsrFm-0007bi-Rr
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 11:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqck-0007uC-0U
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqcd-00039D-Ff
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:30:09 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqcd-000385-27
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:30:03 -0400
Received: by mail-pf1-x442.google.com with SMTP id d4-v6so2807756pfn.0
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=snYg5axyMqbqjLxXqc+FamQwh21MV7zkIV6RamZAiKY=;
	b=G9LiQKCDDZ5UEo2CR1KRFixrdRvknnH57tiZgw/X+b+TDhRLZmJ2G87JbSV9TZgG3+
	peWuOVmVDN9YGbAApC1oW/yFjSl4udKWVF2XkFBZl31dtVk6qbYMVBousxWcSoyi2gQR
	aMUcgc3ihv4jWqt9BB25PmPRm9u3D4q0mdeFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=snYg5axyMqbqjLxXqc+FamQwh21MV7zkIV6RamZAiKY=;
	b=MGrY3CC7A/Dpn/F9A4ECPBgaUYf50h1DufrfIecWNMFb+4CxwgzEyIz84sXaz09ggD
	OweujZyBX7lM0mVkwR6nQQ4ifVwhqNnJ9lXtdbGQn6w1SKgqWDbvHR8/MdpnkTDlrM5P
	iuiBAoqq5dL/GddNe4QFamJNhb6Xlj1cYI7cCqT+tnzeMV1GsH52D/IroZscnw03YueL
	g3ATMn5k4NS0XC1s/AHpxq44+gAGiGVJ7RvRFVTkBWb1W9pkujChFW83570a2tWn2kxS
	Fu4K0xsTxphjkDcrFU0SVuJbxZLp1pvezzj50PkE2cRllWSU7qw9nNUIQq3JTLUnQ1uW
	kidw==
X-Gm-Message-State: APzg51D+QH6ouJablhDEu/7KM4Qd1TuYKzjzZrP2W9ThASdVWUEXRGiw
	KcGr7t0KOK9lvSLfy2FfPIIUsA==
X-Received: by 2002:a63:4d21:: with SMTP id
	a33-v6mr4777439pgb.408.1535034602180; 
	Thu, 23 Aug 2018 07:30:02 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	a19-v6sm8537070pfj.38.2018.08.23.07.30.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:30:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4157d5bd-d0de-2059-2d29-8b1a8e3c010f@linaro.org>
Date: Thu, 23 Aug 2018 07:29:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/22] hw/misc/iotkit: Wire up
 the sysctl and sysinfo register blocks
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
X-TUID: aSIud6uDxL1H

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Wire up the system control element's register banks
> (sysctl and sysinfo).
> 
> This is the last of the previously completely unimplemented
> components in the IoTKit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h |  6 +++++-
>  hw/arm/iotkit.c         | 26 ++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

