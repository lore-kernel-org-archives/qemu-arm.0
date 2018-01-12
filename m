Received: by 10.28.173.206 with SMTP id w197csp2190045wme;
        Fri, 12 Jan 2018 10:52:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBovscCRvy2MiLR+NxMQTzpJHUe+e0gQo+ezGlaeYkAGiwLyU7w9evlpYt1NiFXgANHgjP4I9
X-Received: by 10.129.161.16 with SMTP id y16mr18001831ywg.2.1515783170745;
        Fri, 12 Jan 2018 10:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515783170; cv=none;
        d=google.com; s=arc-20160816;
        b=SGh5WtoCwLUOYGQGfqDKQetnkbgpFWNv015FKhP/WJGbpAR9l4Walo5/QiweTM+NqF
         aSr5RcYvuTMz2TTziIJw51Cvgrww60E2z46+mbi2S5YhUmm9lsvULnNKWpPKqGVzw9Qn
         spfsl6Zcsk+GFMkFHi3l8AYii4dDWDyn0a5l2BNWKL3mDH7ArfslOmSNd5YetJ3DDk8z
         DtOmt97/lD46EZnVE6VfUbYQp3m6JVh3ypzpDyo5mFhbWNm+9DdHgLnypR+d1978hZOY
         NuNjZdBaZ2ZzfL+w/icEs+pOh5cElV+b5a++PFYaJ2+Rs5b/Txnx8898og6seK8WyUQK
         9hPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=zeXPr6D4EHo6BmQ684C2E4LRTEtqNiZ8vlc82N5vMWM=;
        b=X7GYhDHCxXjAbeR3W3QTluSilVOAkeKGhRyWSoAG9m1RfAjqdqTOxBJ6G7+CSJuh04
         b1jYdClBSu2JQWL44RsDfxcTEUBn+GX5FP0z9Bz2GVgGp9xadsdmLN+p7iT3UyGOcYW3
         S81e1y7hc8S49T2s618DAQoW0ircS3drcDI9wdS0pC+oH52qSje/WskSlO5rwlmg6nJm
         DGf5b6FflbQhEnTcc5tDsPb38xBzAFz/ZLtBM8FNq53Fu+AvVCELOiOiEt3M9+tWbUVO
         4lc6w79u+N+vwXv4Ysi8vm9b7A2W1rBVcHmat/9QB/IUbWgmpQ/NLoowJ6zTWNg6gAJo
         BXqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k3mmC3/s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u191si3194901ywu.304.2018.01.12.10.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k3mmC3/s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4Re-0003fl-5F
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:52:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4PT-0001pd-BH
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:50:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4PP-0004a7-0B
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:50:35 -0500
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:42415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ea4PO-0004Zf-K6
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:50:30 -0500
Received: by mail-pg0-x22c.google.com with SMTP id q67so5104307pga.9
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zeXPr6D4EHo6BmQ684C2E4LRTEtqNiZ8vlc82N5vMWM=;
	b=k3mmC3/st/vvR6zVCQvHuDqEg/HsVKyPIq4gtLdW0aieQ/BhmaasOznhc3gNXySUsa
	256DhXExmlnzm5ERiEKaGBtfr9tiaSiauEzOef9mw2AsaWSerbBnRljMUHIgRaTLKQW8
	7I+WapOdrNOLdeLdsaiGyLKM70Z9nZL6ZSQg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zeXPr6D4EHo6BmQ684C2E4LRTEtqNiZ8vlc82N5vMWM=;
	b=FXVEMsOm0UuRPFmfPUucJxDcohs3x0KPVGhTIh/XCeAAULDZ2Afd3+m5/HgEB+Adrp
	x32aNyUlkSCeUQONk5YVOkjNVk+bpUxmZ2hUKfo6xFEScmTZkNoa9eDGjiYNQZcwzQA5
	4+fgopwFBYlGFoX5/sDFcnCMPWU5VOLUL4Rne3SGkAQw/lo8wbyCdEQmNBIYk9+X062P
	jMeIVAwrr0FXJM3Tw371cuAshX1yJ6+6ulKYYpDVepTOl217ZAYnDnkDkdO1/E/s9Xj1
	F644SE7QzVaPzbyEnwx/JDQIg9JBOXlR6DutntutcnFJVn8lXGyczbraugsMma8CctB3
	pu3A==
X-Gm-Message-State: AKwxytd6bFBVbaNHFhjT42Vv8AHGz1Jjk/QNGakvFsZN8N448DQ932p4
	1vkJKr5Dlsgj2FvRMdWK8M80l2bCG04=
X-Received: by 10.84.178.37 with SMTP id y34mr4107457plb.399.1515783029290;
	Fri, 12 Jan 2018 10:50:29 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
	by smtp.gmail.com with ESMTPSA id
	r84sm11200766pfk.92.2018.01.12.10.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 10:50:28 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-8-richard.henderson@linaro.org>
	<CAFEAcA-kbZRaGoERUG7iZGsO3hswC=ityDWf4n2fwXsSwO7jCw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dbbbf33-c60e-7e37-1335-86bfe0144947@linaro.org>
Date: Fri, 12 Jan 2018 10:50:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-kbZRaGoERUG7iZGsO3hswC=ityDWf4n2fwXsSwO7jCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: Re: [Qemu-arm] [PATCH 7/9] target/arm: Expand vector registers for
 SVE
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95agIgdGup/t

On 01/12/2018 10:38 AM, Peter Maydell wrote:
>> -        long ofs = offsetof(CPUARMState, vfp.regs[reg >> 1]);
>> +        long r = offsetof(CPUARMState, vfp.zregs[reg >> 2].d[(reg >> 1) & 1]);
>>          if (reg & 1) {
>> -            ofs += offsetof(CPU_DoubleU, l.upper);
>> +            return r + offsetof(CPU_DoubleU, l.upper);
>>          } else {
>> -            ofs += offsetof(CPU_DoubleU, l.lower);
>> +            return r + offsetof(CPU_DoubleU, l.lower);
>>          }
>> -        return ofs;
> ...I see we're tweaking the logic on this code again. I was
> expecting that the changes in the previous patch would have turned
> out to be in support of just having to do a one-line change in this
> one, but apparently not ?
> 

I don't know why I changed my mind about where the return would go.  It should
have just been the one line change...

r~
