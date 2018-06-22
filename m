Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1231753wrq;
        Fri, 22 Jun 2018 13:10:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ80pLiGewEee8t0z+6nwBCtJCcNJmD3rPZezqtQn1zCrOpMh2w1qhcOALeS/oGdwWpIToV
X-Received: by 2002:aed:21a9:: with SMTP id l38-v6mr2735795qtc.87.1529698230271;
        Fri, 22 Jun 2018 13:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529698230; cv=none;
        d=google.com; s=arc-20160816;
        b=WmmVfhZU/3Ul+5DB9JsQeyDsIc3zH+4QBLXDE0zFkiwKl0tS0Z1uwrLIwl9oUIPsr6
         q7dKA/dUkmVUv1kfHHVYvxZ6vcIsuUbxVb1ADWFCmiy890S1sBlAKCMLFksalfJh7xGI
         LGnnXfyTMAniaXX8wwsP9/9avyM4l5/Ji8NkIcGRJCHJWHezU59CBKG3lZ9hpct4memO
         3cBJltA4+t/Fzhz6+p3mV46RsrQw5sFcmK9Mu30OlVi09oBGEPOpjr+ol5XtLuloznJ0
         zwdxuEdb7zacHS7p5YY9paMhBqU07gjwcsna3lArs7sSfn2hF6PUNyScDwZu23z6j9MT
         VorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=S742fyqUhwmBfafC9BxD8PchPr/FFLH/smvpJc7XSwE=;
        b=FIXb+o2m9k72qJRJvP/8zilxDTC7BRrk4MqRXGsYOSd2rZ+NzMN6jP/WOI5s4qFBF8
         WSHCtAZrJ0lR3h2P520Du3Ax0R8wg97kroE+QohFpGeYqLX93a7PlRSr9iUKs07emPuu
         f5ZGF8SST/QP4v+IKFEGUgBamiRIgJ4TVJP2IEhaxD9aE87puovHmgmNi5NMa68Yg7k6
         3qt13ZO8HzM2xNDyXd8SMx/70RBJhUFLzcQ12rstu/kfOQm5T4FT30wbF+20fn+Q6hFv
         V0qUfwPymWpadni+9v5Q4kns8hpv1l4cxdDRHrrVozaUWbFz5cA+o/q1zrPZy2nzLaGk
         Xiig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oFEDJItJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20-v6si5576695qtc.0.2018.06.22.13.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oFEDJItJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSO5-0002Ev-Ol
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:10:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSNy-0002Eo-Ib
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSNv-0002wb-3m
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:10:22 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:34800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSNu-0002wS-Uf; Fri, 22 Jun 2018 16:10:19 -0400
Received: by mail-qk0-x22b.google.com with SMTP id q70-v6so4377994qke.1;
	Fri, 22 Jun 2018 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S742fyqUhwmBfafC9BxD8PchPr/FFLH/smvpJc7XSwE=;
	b=oFEDJItJ/HkxM2IjqJbf2DUx0M4pycLOKH09NgdApYoIvq28SPwpNWaQMY+vMhnqy9
	FFZIuMFEUnK9FkP9BED6PHDfWIcCtBhlHQ6UWzV0xaIKr5/LIbp9v8nx8CW3tx4wuFOu
	PX9uQesw7OXkKxEVOWvfCIuq/Fy+kJ/3VDtmuENkPqDBy3azRxFiLdxhCinISKo14Sqr
	pcHpB+1hTnWahtt2b1NOCOQdS6W/AbKJtw38LZlQNMu5RWBCijvZnq4PC3RkHUr2ghaA
	Hn73nopCUw0aPaoct52S7W636kZAI+RzdJ/QwchFC1/aP/I6emEdd0j6Xk4Hhe5EJ98u
	1+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=S742fyqUhwmBfafC9BxD8PchPr/FFLH/smvpJc7XSwE=;
	b=NijYM3n6+CAZKK9g9Bnq2mzkNLjTap7bE/9pKzabWkZ0VwKBVMw4+VM/AMEr+pQqSk
	6R4GHb1eGWvc0/T0J19dXtFTrlMzam7kVkKDEZFqG25NvEqCz/YWdDLLIeFTUQyH9gp1
	qWaVoYHhFAQoEJL1FB8P4B3UU4Iz82Laaqdz+d5lrZjyDsEtXa20DsAsoHoFs7Xjz5Dr
	Tba3H3QVWQuVrwe7eg2M/p31EDOgkcwfXVyzySQwZdtD4lBUIcnvS1Pjg7JjdU4JDkCP
	vcMVjPtdfw/uXfYfb6rY4G3xG3MQ20ZvuL0sVb9iWk15WdPzB68wtuAQFroWz+9MMPAW
	h2wA==
X-Gm-Message-State: APt69E2uWSpSfgqbknKTDBX+9FBbNcKRe93ttAgd9WDrvA+JEfOalzKA
	xIVN4P5S/n35ESAd7s58RciJ2qHW
X-Received: by 2002:a37:d4d1:: with SMTP id
	s78-v6mr2559137qks.244.1529698218293; 
	Fri, 22 Jun 2018 13:10:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	o31-v6sm5446788qte.16.2018.06.22.13.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:10:17 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-8-f4bug@amsat.org>
	<e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8256c2d4-722c-299f-e8e3-42c1a7f68e1d@amsat.org>
Date: Fri, 22 Jun 2018 17:10:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-arm] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-TUID: a2bt2+huI7d3

On 06/22/2018 04:38 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>> index 26e3e5ebf6..690876e43e 100644
>> --- a/hw/i2c/omap_i2c.c
>> +++ b/hw/i2c/omap_i2c.c
>> @@ -17,6 +17,7 @@
>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/hw.h"
>>  #include "hw/i2c/i2c.h"
>>  #include "hw/arm/omap.h"
>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
>>              }
>>              break;
>>          }
>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>> -                            __func__);
>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
> 
> Please keep the white spaces before the comment if you don't change
> anything else.

This is a <tab> and checkpatch complains...

I can use 4 spaces for this tab. I tried to align with other tab-aligned
comments I didn't modify, but the result is messier. Thus a simple space.

> 
>> +            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
>> +                          __func__);
>>              break;
>>          }
>> -        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
>> -            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
>> -                            __func__);
>> +        if ((value & (1 << 15)) && value & (1 << 8)) { /* XA */
> 
> dito.
> 
>> +            qemu_log_mask(LOG_UNIMP,
>> +                          "%s: 10-bit addressing mode not supported\n",
>> +                          __func__);
> 
> Apart from the nits, looks fine to me, so once you've fixed that:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
