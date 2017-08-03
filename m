Received: by 10.25.221.202 with SMTP id w71csp1230349lfi;
        Thu, 3 Aug 2017 15:17:28 -0700 (PDT)
X-Received: by 10.55.154.10 with SMTP id c10mr385170qke.197.1501798648362;
        Thu, 03 Aug 2017 15:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798648; cv=none;
        d=google.com; s=arc-20160816;
        b=Eh+J/y/5V/LUmQQEaI1IkBOUjvDBcauVLJSmC/JBloRunrqC8P0yrcPHHxE6hGDuFP
         mSG0TSYRW8d6k/yPkgDwceAPuq8O0fZwUMCkqQtEcQ+mj1QE3ermY5ik9WE5GBnbuOu8
         tjotmykX1kLDaCSZGziaiMfHSTBVaI2RJ0ZLNqdqyEDuVspO0TdH3m0ccB5ORlhNYPkG
         lhApEPmci/WpfJAxAIRxVzpKQOFqccn+ksJU3xmvnwobQOjsCViQe7dSZcWX8BzPW8Es
         PhogjXHqOx4GwqNyxjYjxG6esX4e9tTYfd9B9c6PYCPx+WqUFlCqctujm/i81AyZs8nV
         Modg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=cD9ZBnz3l+KRoCHqOqCWyge4jONGM1SP5msCYqhnKv8=;
        b=IhvpCGXjbrA6j6P76an+TEhN3x4CyfDM/drpCy4nsUMd2H6zidbTjExVRAoCWAPDRo
         pE5RtEn11Ee2x2qDaRdQGy7GV7RPx2GcUaTndmFKH6pcAjWK2QdUWy1S91XlJUmxXgU8
         vmeMK887VV/UnQ1Sijs6qHv3TTCY/+o0GNCAApZTzyUykGhJOF6K1CLoSk4eYtSv124Q
         wBsq74fB1sFEHKJKdAcP5GPUFRUoF7o+YpMlf8wIikmjFzD2ln4riwnTVTpDc8D4TOYP
         NoAqH/ylwr0Zn9pIPCIIFrkwaDXl9LsS812R31G0oNtxqAKfZXE8feEWAverl2PVN1O+
         Qspg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=otazEBRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h62si26683qtd.295.2017.08.03.15.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:17:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=otazEBRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOQn-0007pu-KJ
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:17:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOP3-0006To-7n
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOP0-00007U-2P
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:15:37 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOOz-00006X-TO; Thu, 03 Aug 2017 18:15:34 -0400
Received: by mail-pg0-x242.google.com with SMTP id y129so6259pgy.3;
	Thu, 03 Aug 2017 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cD9ZBnz3l+KRoCHqOqCWyge4jONGM1SP5msCYqhnKv8=;
	b=otazEBRi7cE0nbiAuIfXOGVHTz4JIVUAnZgBaxaPCccd52lnoeiBaccPAuPXSy+UqE
	lJkWubW9hfRmp331k4VzT1XuWrmAhrSiw60hIhaA8T2Ze29VK827qiuWb9PJWv0zpmGL
	sAZnTgiMTKdV8X5OesseG/pVTLTi04LUSgvrcVnZAmobyhfpLFEw8P7xZXPBkSukYb0O
	XWFSKjvifkDdFPUta4nAK8Q3SsL4lwQAHAqlHB9N+6VVDSCNeUORLPzmVQvZZLWilW4x
	TeDMXfCQczE81cD5tkbQaWCWxRxYO+0Tnm3pampXJsBwF3CC6wTRzaPNeAMX09X8Sm3Z
	wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cD9ZBnz3l+KRoCHqOqCWyge4jONGM1SP5msCYqhnKv8=;
	b=eQW7/Ai6zdPnM4Lc6GRyzYg2NxuqlQWy/Pt7vEUvGwstA2aZvTgCaF5QC5Cch8liXA
	RcSs6au5+tuFMWPmmFeQXgsNpKXygYJHqt/z6hghZlZMOphldp9kc/iREdFmtbn9IwT6
	WriQBCHZkHOLdttZK9m7EVQrfjJjPoVofyYEUvP7DBtwoAbQ2pO9TbMG8oAFJaz3v+Y8
	1AI5aG71KAhrNFa+l2Y9RUVfdGtvR9qe1zG9LjpyJrgeeJg/hyjaitcp0Hzq8SfEJnBS
	PSkmboSdTncw92NuwjC/XYiXLxCI00Q49z+UKz3IngVmaHwgMoAYU+I1mDdnEDaAZ4GF
	zcnQ==
X-Gm-Message-State: AIVw1101ZAxI+7dtYI9B6ptqZO0rW0EdbWq7FcuZOtaWxSF/WbF2V749
	Ip/5TPuIVBsMyQ==
X-Received: by 10.84.241.14 with SMTP id a14mr290417pll.421.1501798533135;
	Thu, 03 Aug 2017 15:15:33 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	n11sm33224pfg.15.2017.08.03.15.15.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:15:32 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-11-git-send-email-peter.maydell@linaro.org>
	<91f1649d-ffcf-85c5-b83b-644ad1875fcd@twiddle.net>
Message-ID: <a07ea64f-1d12-7831-d91f-9c0e0cc3df40@twiddle.net>
Date: Thu, 3 Aug 2017 15:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <91f1649d-ffcf-85c5-b83b-644ad1875fcd@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [PATCH 10/15] target/arm: Don't use
 cpsr_write/cpsr_read to transfer M profile XPSR
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
X-TUID: EXehZcMB7AzW

On 08/03/2017 03:13 PM, Richard Henderson wrote:
> On 08/02/2017 09:43 AM, Peter Maydell wrote:
>> +        if (val & XPSR_EXCP) {
>> +            /* This is a CPSR format value from an older QEMU. (We can tell
>> +             * because values transferred in XPSR format always have zero
>> +             * for the EXCP field, and CPSR format will always have bit 4
>> +             * set in CPSR_M.) Rearrange it into XPSR format. The significant
>> +             * differences are that the T bit is not in the same place, the
>> +             * primask/faultmask info may be in the CPSR I and F bits, and
>> +             * we do not want the mode bits.
>> +             */
>> +            uint32_t newval = val;
>> +
>> +            newval &= (CPSR_NZCV | CPSR_Q | CPSR_IT | CPSR_GE);
>> +            if (val & CPSR_T) {
>> +                newval |= XPSR_T;
>> +            }
>> +            /* If the I or F bits are set then this is a migration from
>> +             * an old QEMU which still stored the M profile FAULTMASK
>> +             * and PRIMASK in env->daif. For a new QEMU, the data is
>> +             * transferred using the vmstate_m_faultmask_primask subsection.
>> +             */
> 
> The second comment seems sort of redundant with the first now.

... and I meant to say, otherwise,


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
