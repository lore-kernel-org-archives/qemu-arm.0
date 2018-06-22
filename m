Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp845121wrq;
        Fri, 22 Jun 2018 06:38:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcZRhjF2797CKqFFzBbMUzolxtqxpoTDDm3gs4HdA/uS5lBGTgMgbDBDI87hEPOQvFZHb2O
X-Received: by 2002:a37:444c:: with SMTP id r73-v6mr1280872qka.351.1529674713891;
        Fri, 22 Jun 2018 06:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529674713; cv=none;
        d=google.com; s=arc-20160816;
        b=CGBWn+UaezN6GW9VkefwC1dmL1n3OEDgkd+o865MKBK0LAXVZgJc4hG1gy/60KcR78
         bbcSyAQ7rNjNWnS6YJM40RFm8hjwEUyCPep6C/l+7YFdu65W1HkNBGsSYB9du6CTrTs5
         YuxhTov7lshqFaizeeY/JZDzdgk6qzMzGyN0trZkkJ2xcuaSBccpU43Qynp/RcFAgriv
         GwRZN1Itb4zHQOQP8OMHR1xr2nDhZ5qpPinZK6F6DXCRG2s+N8jmgYapiinbgtwz9qlu
         VxmvDvj0ydJPHKPWgARWdTI+ORikrIjOFimBMzClp4y777+UClxe6CPBPl5YWCyaqVUD
         j+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=lTELApfYi2Oh0kHQeClDf+07PRCKMeR3Aj9M7a8Ocdc=;
        b=UY3feIRO5G7nUBtDb6YBK4IU9Q5WzbtYXk8ZxroCndkb+m1GLp/Is0zU32KKAaoIoH
         +blyzcjZ1AYQ27KBS+6cFWmOlGfmMVfFF2nXLSwRCuFTIBKYL1PtDdPOC3n2+lQVw6vZ
         1+XZCmMQ7aLD8rtGm93XqOXUhW5T0LNuaINLLYArm4G+3iTEFstWN7DhshTrmJ5x70x3
         l6/bwMo/OxLKZFg1Q3bJd+8v7mFHVf6TE4wnda+BKOrb0nv9B84uNvORpaS0GoV/3pB6
         wYfclEzii1iO+Qex40xpM/ZmUYgqNPiKNGB1uKT6nmdzDS0Lrbn4AwhMk+7EB9Qrk0XM
         3fZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aC1aROOp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41-v6si2584515qtg.143.2018.06.22.06.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aC1aROOp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMGn-0003Cu-4s
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM2h-0008UR-Oq
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM2g-0005j1-VU
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:23:59 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM2a-0005bx-QD; Fri, 22 Jun 2018 09:23:52 -0400
Received: by mail-qk0-x241.google.com with SMTP id a195-v6so3640313qkg.3;
	Fri, 22 Jun 2018 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lTELApfYi2Oh0kHQeClDf+07PRCKMeR3Aj9M7a8Ocdc=;
	b=aC1aROOpnFg1sq+VZTNZbKStJnwqeRKOe97XkZ1INLmwvzrQIy5CLqZDV3uUi1kA3g
	lpEaFZyHjVmXBVtnaZAaBuwjLbiAdTrum0698BrWEITqG1QNTGY9x2ZP8T7pmDazm5Zu
	cFa9XERNkGmrrmk8mk4nGWYhdVCs6fxOMhjFmg6x4MqcUumIo1WKfAN+Fgp1ReQgLec0
	u4Xbd6h+okixikMsKfWo27ZCiAH5NhM/365n5LMcIIoW1++UBHOOr8oYpxoNBSZkJon2
	92X+rsrdTV+iSIaoUs8ROgFHHO8QZjog9BSQtBJgCy1T1O3MV8Rqq4zpj14RmQGDGjy1
	wfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lTELApfYi2Oh0kHQeClDf+07PRCKMeR3Aj9M7a8Ocdc=;
	b=ORSd8p7gG+CyNEO4lofTEGCPCLmnYLXd0maf0qDJfPBIexBjsivs+I4o383lw4AR4T
	PNxTCR+IerXeXk6XqyHqUH6GmIqhLS6KDKtqBJ2TTJt/0bUp7C/IdfSlGxOIoIe1+7BV
	D7sXXFPUuVYHkaW0Mu9rRSa0A749VcrOqsNUcrgZdhIN8Fq5Yr4LgUyyjRHesSlbFMsL
	X0OMxoaRbyXq6PpTLFvfqFJq+nJ5KTnX0YID4luJ6/KiEyPWIUjPcln9NPe91bEAELMg
	Z7P8/9G6b3TFQDYEZF8Y0W7ryEwrD/58d3ZdLPZMvn9z2Xo5gzzlzptojii/xK4K/lwI
	P3IA==
X-Gm-Message-State: APt69E3LWSgFUX6DRaJYu3dOWVtrwufFrkj9csKf2JSMf5KpL1zbtwGQ
	YfuwD88nUqRQWQ9nIIZxspFKHcGi
X-Received: by 2002:a37:f06:: with SMTP id z6-v6mr1275496qkg.418.1529673832068;
	Fri, 22 Jun 2018 06:23:52 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g56-v6sm6166080qta.83.2018.06.22.06.23.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:23:51 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-9-f4bug@amsat.org>
	<e8e5e2ff-9576-402d-1502-9b584b0295f7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <12b750e6-fd0a-4a57-a3cc-eb0afb8e3237@amsat.org>
Date: Fri, 22 Jun 2018 10:23:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e8e5e2ff-9576-402d-1502-9b584b0295f7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/11] hw/arm/omap: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3/yeLnk1aOU

On 06/22/2018 05:34 AM, Thomas Huth wrote:
> On 21.06.2018 20:02, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/arm/omap.h | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
> [...]
>> @@ -997,14 +998,17 @@ enum {
>>  
>>  # ifdef TCMI_VERBOSE
>>  #  define OMAP_8B_REG(paddr)		\
>> -        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
>> -                        __func__, paddr)
>> +        qemu_log_mask(LOG_GUEST_ERROR, \
>> +                      "%s: 8-bit register " OMAP_FMT_plx "\n", \
>> +                      __func__, paddr)
>>  #  define OMAP_16B_REG(paddr)		\
>> -        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
>> -                        __func__, paddr)
>> +        qemu_log_mask(LOG_GUEST_ERROR, \
>> +                      "%s: 16-bit register " OMAP_FMT_plx "\n", \
>> +                      __func__, paddr)
>>  #  define OMAP_32B_REG(paddr)		\
>> -        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
>> -                        __func__, paddr)
>> +        qemu_log_mask(LOG_GUEST_ERROR, \
>> +                      "%s: 32-bit register " OMAP_FMT_plx "\n", \
>> +                      __func__, paddr)
>>  # else
>>  #  define OMAP_8B_REG(paddr)
>>  #  define OMAP_16B_REG(paddr)
>>
> 
> Since the qemu_log_mask(LOG_GUEST_ERROR, ...) calls are not shown up by
> default anymore, I think it would rather be better to get rid of this
> #ifdef TCMI_VERBOSE ... #endif block now and put the qemu_log_mask()
> statements directly into the omap_badwidth_* functions instead.

Good idea!
