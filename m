Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1234626wrq;
        Fri, 22 Jun 2018 13:13:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKXEm+jcqlUwkMbVl5x7tYDtkTqY/FWlMaJ/1ngAK9TKbR4cOm2vtBa3UCxYoQGbX5h5LMC
X-Received: by 2002:aed:3f7c:: with SMTP id q57-v6mr572693qtf.256.1529698433319;
        Fri, 22 Jun 2018 13:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529698433; cv=none;
        d=google.com; s=arc-20160816;
        b=wWjYEEJ9tTpnsYgCzK5jHS7G80kMHVBc4mkbhxoh7KB8mEZ+8JJoRxOzhbJuM2E/l+
         mQhKeqyWgqcbXIbNTz3xRyJ9khhk+VCwyN3Jy/qx/lw3ae7b86kpzqSD6XIilw8Ak2BC
         bvk3IWLmBrFRxcNgfSVC6IeD1gBykaeK9FqqFQ7eklioyylSow6qIs0LNrBn61fFhl+6
         Wo2OL9YEvo0mWEYeLACamjDTRn+2uI3MyRVgdeELhjGvRSlmMfsnUIiCgZIp/z7Jgxx5
         fLymy8oZ9Tm0AjaIgPH31P4ufzryRi+Dls+WO0BQvOy7dv9VuRMEUKXsuRMSRakNMjBY
         3CZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=n5wfJr5o6sydZTE3B9UCajlYWxgsrD7XfyRdCwFX48U=;
        b=YPvLHtkrfNX75GYQRhWsMYvD0ToU7BJHMHmNrcqC642VisPnyBK/2v7LyEieg4G8pj
         HdP0W5tVhto5ACSGYW0PTiC8VfOWJWOWTqdSIi3u5FK5NzY46OTL9f6IblRN3yr8wWie
         6asJKSAvP2eXWK2EjoMpAjwLs5+pMbKl/VjPrOK/5nm6yRytW6VNlTV6XUhdNOobDgxG
         krz+mn+vxqfW/+CL9sFOB6CCSIboSr0ZjxFGw1s8uEh4xWamCkG9X77dpUzxHK/glYF3
         kjd0EFqwcJpy7/g0ALKG/yj6X+mSza82MfH2ghGmZTZIZawZPF7b9y9EVBa1qvS67Ma8
         dkZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TykEcnih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66-v6si4040130qkd.399.2018.06.22.13.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TykEcnih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSRM-0003em-Sj
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:13:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSRG-0003eU-65
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSRD-0003sk-15
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:13:46 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSRC-0003sg-SH; Fri, 22 Jun 2018 16:13:42 -0400
Received: by mail-qk0-x244.google.com with SMTP id u62-v6so1827439qkf.9;
	Fri, 22 Jun 2018 13:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=n5wfJr5o6sydZTE3B9UCajlYWxgsrD7XfyRdCwFX48U=;
	b=TykEcnihDhbT2REbKo2gZSfBOOAYb/2n9rXVKKDyGxwJWKf8uwXV2oAvprcGs7QuSl
	uxNELimZB8KQbhimaMjgn3QkuTwgBFWLOdM4Rj946eYvQj2oZAHsMo3ypD20FUaqrd8U
	o6lfWI8vx3gcjS3s7rzW/8V+vx0q68nYLHRltEeNQo91KJvl22jIx4Ci8WNfLcMraNBG
	ZWklPGV+ymnPz7FQblHnXdGrffXXSs2bwsNIhPA2vKG3wulQ4obYqf5y3duN8Ux2zlMG
	LAQTp90mR8A6cSDgyb8+XDVbhVGWi2XvpszSjtYd4MbSoGyhjc/8K0U24GHsfPeGToFB
	rfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=n5wfJr5o6sydZTE3B9UCajlYWxgsrD7XfyRdCwFX48U=;
	b=LOqJkZKGZWTulklMxYktAk9tCfiTqzqXKhu6HbHM24VlFcrnDLF+TT25W5EX4q4BT3
	6dvjrpOlqj1k9hvKvo2JsBhpFuoI4Hvpc0hFdZpNWbfR085o6IHikiQR4eDcauQnAxAb
	43lp0b87KCLrN2JQfpmwrkBpLgp6OOf1GX+ohbb2+QTK17cd7QKdOiNmPz2UYJRZ4gt4
	NH8uPn6FOF6KgE5rtSy4sCPY4q8dZHBR/i+aDIK5W7B9yogsGtv8NDHfP2gPdS4NXyxi
	/jxhwlIXCy2LiizmFcHLZ2IgZDZ8UWAwePSKl1Amqy6nXSebJMW8BENnPPKhq4OK92X4
	HfxQ==
X-Gm-Message-State: APt69E3gosPzjocYGwKNyxhAlJYP/P487r85He7GLRY8CcBGlzwVmmxc
	T2V4Gdaxn6JAZa08QnzdGcZ4hRgA
X-Received: by 2002:a37:78c5:: with SMTP id
	t188-v6mr2551450qkc.283.1529698422248; 
	Fri, 22 Jun 2018 13:13:42 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	d192-v6sm5597668qkb.46.2018.06.22.13.13.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:13:41 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-10-f4bug@amsat.org>
	<b70145b2-5c24-d525-b23a-aaeb7ab960c5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <39def888-734e-f4e6-8104-9534e611fcb1@amsat.org>
Date: Fri, 22 Jun 2018 17:13:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b70145b2-5c24-d525-b23a-aaeb7ab960c5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v2 09/14] hw/arm/omap: Use
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
X-TUID: zE7CMadq4I3m

On 06/22/2018 04:44 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/arm/omap.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
>> index 39abba753d..3867687b8c 100644
>> --- a/include/hw/arm/omap.h
>> +++ b/include/hw/arm/omap.h
>> @@ -21,6 +21,7 @@
>>  # define hw_omap_h		"omap.h"
>>  #include "hw/irq.h"
>>  #include "target/arm/cpu-qom.h"
>> +#include "qemu/log.h"
>>  
>>  # define OMAP_EMIFS_BASE	0x00000000
>>  # define OMAP2_Q0_BASE		0x00000000
>> @@ -962,8 +963,8 @@ void omap_mpu_wakeup(void *opaque, int irq, int req);
>>          fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
>>                          __func__, paddr)
> 
> What about that fprintf above?

Well there are still many fprintf() in the OMAP codebase.

I didn't want to start a fprintf() cleanup, I just cherry-picked the
patches I used to make sens of the current (ugly) output.

With this series the console is 'usable'.

> 
>>  # define OMAP_RO_REG(paddr)		\
>> -        fprintf(stderr, "%s: Read-only register " OMAP_FMT_plx "\n",	\
>> -                        __func__, paddr)
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register " OMAP_FMT_plx \
>> +                      "\n", __func__, paddr)
>>  
>>  /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
>>     (Board-specifc tags are not here)  */
>>
> 
>  Thomas
> 
