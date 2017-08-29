Received: by 10.223.188.70 with SMTP id a6csp6171687wrh;
        Tue, 29 Aug 2017 09:09:00 -0700 (PDT)
X-Received: by 10.55.39.73 with SMTP id n70mr6053400qkn.257.1504022940167;
        Tue, 29 Aug 2017 09:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022940; cv=none;
        d=google.com; s=arc-20160816;
        b=MiBXYzDv0aXKiW4gxg6/EZp4dhVQC1QHsbthBAXlFKVD0tgE9fUhC4cGdpW7zGS64W
         PFR++CHcliO/+3dSYfYKX2F9WmdnYT+CqyCp6zis7V/2jECkaBuzmdPuhpUzpvxPHiY2
         qPv6HziuWqD9YJy/dboXNMHUUGEF339hw3wDRp3LKJs3lMysFxmSBQKcr27neBxREPU7
         SkgSo5SGc/j2ixLs+B7hs4OztNa6X6l4cluFsSZKX8UI6qdgc6uCPUfBfCZKR60VNP6E
         tHfTGxpTkndNlZ+dPcXkBGAWh7THar/Ab6e5o8LmYwc4fFZ6NPL0+zAUlQcR7BqGRHAa
         hrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RGafltpbcJxiBtrqdJ/wjqx1rIAr+DGZphoUMM+hF5g=;
        b=exmy3041XsELRIdmtxahxbqTNsK4q/MNfZgyTVZQ4mIQw3i7OIi19nUgWcUVKcUS7+
         nw7Vtbe/5bo3TNcUQ0RUFHLZh+wQWJp41KJZhxv15VZppMeA+StUjyy4jZ9VoV4N3WQv
         ATR+kzRiM0Ut61F2cJi+YotPhDDU/fOSv8Q3xs2QaOIdi9LUCYQzMYcg9qQZenUp890o
         a9B2cRSzidxQ+oDH6IG+VKrhqF9v3BVfzp+AVCH8Bj7HVRufXCxZ7MrlIPBNIzi1GyXq
         jtivKn5Qnfvj/jC2g4bbqKHROnZtso/9Flwxm0ose4P3mGKJ2BLdVrGz2HD3BG1MvqxG
         htbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ax0pFmTO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62si3171140qkd.446.2017.08.29.09.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ax0pFmTO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj4T-00029J-G5
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj1s-0000YP-SD
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj1n-00033f-CV
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:06:16 -0400
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:36068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj1n-00032l-6P
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:06:11 -0400
Received: by mail-pg0-x22f.google.com with SMTP id r133so12032220pgr.3
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RGafltpbcJxiBtrqdJ/wjqx1rIAr+DGZphoUMM+hF5g=;
	b=Ax0pFmTOipzR+hFt0GkI551VhnLyKnt22l+o2gpVddAn2AVGK9RLAATIs+8jN0puIZ
	4DpqtQCZ7wHMY0NJ3HHqMosBBcxwDpCUHfcet7+HtiU5cn0RXYxOVNE9/v7jr7Vl37mW
	XSvzAWY+Uo7glIPZ8KZylXWbqSIWwa/mfNtg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RGafltpbcJxiBtrqdJ/wjqx1rIAr+DGZphoUMM+hF5g=;
	b=mAEcpxYQngDNnIvPjqYBdVCkxb7VesywtR0YpbE0cJ0fcrjVEM5ptv6NfAHsWrslWJ
	F/tzBK0SjvU+WaIPAGNDyu0C5KWPvmxDsUPk6SDMavWDnGLSg0qzwolVhEKeLow3aTW/
	HVRrjslqEILkpmivPHjspHzMidwAu/Qv16Fae0Nx6la1ejzG392qKCABvnsm6F74gq0t
	C7Tq0FoTc1oRmFD08LlgyrQBevaDiVX5aS545tmQvIJVSOhvpwe1UkiDja5UGnPcJck/
	W1ERWaFLc7H9pDvjMLSL45LlJeXWA5Z8VuNfL+gYmP+PtjCwATOvCbmzbD6M8YhCqMyv
	4SGQ==
X-Gm-Message-State: AHYfb5if2/1KALJT3tLRrzQUqRYmYcEA1eR4XMd+zPOkLu8qeco1LRxX
	QhkxOWqRcpmaPCtu
X-Received: by 10.98.82.66 with SMTP id g63mr798967pfb.271.1504022770168;
	Tue, 29 Aug 2017 09:06:10 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	13sm6016186pfm.114.2017.08.29.09.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:06:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-16-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fb5131c-e4a5-3700-4fad-f4fbfb0a23d8@linaro.org>
Date: Tue, 29 Aug 2017 09:06:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-16-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-devel] [PATCH 15/20] target/arm: Make MPU_CTRL register
 banked for v8M
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
X-TUID: cFddsITS8UxK

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the MPU_CTRL register banked if v8M security extensions are
> enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 2 +-
>  hw/intc/armv7m_nvic.c | 9 +++++----
>  target/arm/helper.c   | 5 +++--
>  target/arm/machine.c  | 3 ++-
>  4 files changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

