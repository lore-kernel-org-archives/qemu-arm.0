Received: by 10.223.172.38 with SMTP id v35csp3785756wrc;
        Mon, 18 Sep 2017 07:00:06 -0700 (PDT)
X-Received: by 10.55.21.228 with SMTP id 97mr19432898qkv.6.1505743204339;
        Mon, 18 Sep 2017 07:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505743204; cv=none;
        d=google.com; s=arc-20160816;
        b=coWoN+q674MeivZe6HJ0INPRiWFQucKFIS6IGCGMqtz4Ae/Bgo5d6h8UY3e9nJSBhM
         z791CyLSLT2BJyorPGZGEFuTWLuKFPw4Vsbob9yK43NrwgMWPTWoc5HQC8G6DmeedlJN
         7LWCXF6E61fEzTI7uPKRTaZ9abW70XZx/Hz0U52Ac3/MIZpIVLsffJe25YUeclM4KVZV
         WvP3wKSBpGhjcx+eTUYj5JQfd2t9ttHLUUyKZ8UqVxGPB1qzpyUkFEi7KGA9nNSIHUjK
         tbMAhcxvRf4f+q8C3fFmIvPw5IyxwJL4D43BGwhTt98cZmFCq6MdWPh/ePGV81RYjD+R
         pO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=AJom85bj567jCIA+pbuotyTGpV21/lhAHbcQCP++beM=;
        b=E2K+ixgZTsSo4NTTiLUCwepS99pD13VfCB3QcUt29BVwfA0S0SXhPTDnL52Kd+wWKw
         1rSXtLmmtrwavnRtmWZZUa1Yk6hTM0RqwQu+IKc8O6C7wssFRMm8oRNrarq6SmL4hBXd
         G3+u0/LpjR41Jv4f3se7qYBMEiyEjuooMOBHG8aTVyRxRJ4IIDtpeljLNpVfaJ/j6OE9
         9W/GpSHxPpOOYILF3OypKq94VVY5fA797FY7ghsPFJVJ4Fju4a74we67FmOSUkXjLN8u
         EAXvS0NWY/4uRl8rUIjuQGYWy5r8nL4i3bznRBHXxAbDeocorEep6DJajfrLtlvR4ifZ
         XEug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t4paXiop;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g30si6828229qkh.286.2017.09.18.07.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 07:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t4paXiop;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtwaf-0001Zn-TS
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 10:00:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwZ3-0000ej-R9
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 09:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwYy-0000Z9-12
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 09:58:21 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtwYs-0000UW-PL; Mon, 18 Sep 2017 09:58:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id i14so370321qke.3;
	Mon, 18 Sep 2017 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AJom85bj567jCIA+pbuotyTGpV21/lhAHbcQCP++beM=;
	b=t4paXiopfuJ1xgTFtEKVq3GxfeHZN0eTYDGjrkwg/Wahwr7vHyj3NAZ8J8g2sckxfX
	/Zabm/1i4DaGSvnnyQa8mWShZmofCRxnEfwu1OF+HYOmJcWxiwqgBZxdDyNG4pxUnoVU
	gVciTiPeUJG/NXInG/IgSCfhB1MsbnBbZGGLY3fmyWfyf6HJy4oyoYZkz+S3Tu9gKgyt
	3E7K/Nt0POd55kMt74SPjLz8AbAW8tUQ/1NC/TSgRKfdSroHnHHc5XVbPB32BA6EhfCp
	xHiSdhVA9AskdYPZ05K3d4Tj7SHNJRj8eaX61OLWchyGoqt5iQfkDqg5do+EC7zT1UkJ
	dANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AJom85bj567jCIA+pbuotyTGpV21/lhAHbcQCP++beM=;
	b=IUGxk2KL22CJbF2g2nORXFSJy7vQKoj6aCSCC2u2c7wqUDUOBn6pNU7+94dNuYSpRC
	gXLr4RcU5ac9vIC5Y6DVXs8nTUJT3SFIBYZUZg5pd+v9j34ivv9G1CvzR0z1fOz93+6E
	G/tX7DG1rpdnxlOh381hyjYE/yXC5zdCHU2gJUhKcmwJb4yZwqUPB+gchAob3vQ3eySo
	eHoZDyfXaeSOCvnz+iFF+uWHpk9iQp10D7gwL4EpKP9wtqjLW2IJ1qr394ItuDf3tKfz
	mhQgeyRxU/R7m/HBSETOnp14/QDmXqzzagUJJ/LzwCLN9/WBZtFd3ufznhRVSK1qJA7A
	G61w==
X-Gm-Message-State: AHPjjUhI8uCs1K7//QqeotF0wtf380xfBILy2PeA/je/rUxIhldElwPN
	kEfczAtGYGKctQ==
X-Google-Smtp-Source: AOwi7QCYjcs3YGI7cjrww6a6RmDNQOJaaF8r8RlKmRwizYI2tyNuGlZkmMypr5g6jFAiIgEstSiCng==
X-Received: by 10.55.33.216 with SMTP id f85mr20663409qki.176.1505743090139;
	Mon, 18 Sep 2017 06:58:10 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	v78sm5699545qkg.22.2017.09.18.06.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 06:58:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
	<CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6947945c-6b04-dce0-9010-b3350df0f151@amsat.org>
Date: Mon, 18 Sep 2017 10:58:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1dP5xVF/hQG

Hi Peter,

On 09/18/2017 10:36 AM, Peter Maydell wrote:
> On 18 September 2017 at 14:27, sundeep subbaraya <sundeep.lkml@gmail.com> wrote:
>>>> Hi Sundeep, Peter,
>>>>
>>>>
>>>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>>>>
>>>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>>>> +                          uint64_t val, unsigned size)
>>>>> +{
>>>>> +    MSF2SysregState *s = opaque;
>>>>> +    uint32_t newval = val;
>>>>> +
>>>>> +    offset >>= 2;
>>>>> +
>>>>> +    switch (offset) {
>>>>> +    case MSSDDR_PLL_STATUS:
>>>>> +        trace_msf2_sysreg_write_pll_status();
>>>>> +        break;
>>>>> +
>>>>> +    case ESRAM_CR:
>>>>> +    case DDR_CR:
>>>>> +    case ENVM_REMAP_BASE_CR:
>>>>> +        if (newval != s->regs[offset]) {
>>>>> +            qemu_log_mask(LOG_UNIMP,
>>>>> +                       TYPE_MSF2_SYSREG": remapping not supported\n");
>>>>
>>>>
>>>> I'd rather exit here than continue with inconsistent cpu, Peter what do
>>>> you recommend?
>>
>>
>> Could you please suggest.
> 
> We shouldn't exit QEMU for something the guest can provoke. If
> the functionality isn't implemented then just LOG_UNIMP it.

This was commented here:
http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg02971.html

Guest remapping code is like non-return function. Hardware error here 
can not happen, so there is no more guest code after a remap request.
Continuing running QEMU will lead to chaos, that's why I recommend 
aborting instead of just LOG_UNIMP it.

Regards,

Phil.
