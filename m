Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp67939wme;
        Wed, 16 May 2018 13:01:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqzO/wc1M/zFHVLIGsMMSweG4jiIGV0hxL5ly00C8/hordTfwM4o9MJL8Y0HgKOW46Rub1Q
X-Received: by 2002:a37:d658:: with SMTP id t85-v6mr2415607qki.170.1526500908220;
        Wed, 16 May 2018 13:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526500908; cv=none;
        d=google.com; s=arc-20160816;
        b=O1Og06zeQjARZu/PDMfCpKPdlOpGnVMqzB4KdYvMsi8UrP1Lz9MZne9QEadgmlpmxD
         vr0U9GpyPABHxalk804T8/NLtH8s2YT6EliBe4xVMWcUL4p/prrBu+acIb/pWfz90ka3
         jFNd7KiXKVFNqaHkiPyy+VkL37/cSArCRiJm2Sqvg3jYzL/rYZTeJiUDVUQizQYdcFD7
         lYbTskVVxA4QZ2CXDspI7K5cjMaPHThfijwN91C0SOAIx692RhsY2JXyh9YinSFUyBY+
         2JtruYsEzY8APYUD0vug2H7zMoiE4Mi4KxU60+BU/RS8JBhsHypPf3a837xogbYdXDfd
         Yr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=FVKcighuR2fAg4/tcfJGTg6Wos3rPvPP81C076MDFn4=;
        b=owZ5g5Nc7S7d5s36VGES0duv5PIRENIFh8p1zy/Vubb+HxpPghmRjPoRgJoEN1rj3u
         sKn7rDV/4lxcunegMhF3NFACD2R7cvmePAD+/07YyrX68lNqf9UZLgY82jCgRzHP1U1r
         /7/stcideI6oEm6SV/HlnbsRkZyGUnHINwls9Hvef0KMMd+CbocSwGEuMrI/SB2PLw8K
         rIXcJrRlXJ4bTdl19G3ECLfj1NrNWBOQFZu1ELJxyFWOsbaQ3DnlmMCB1KDWCCStTU43
         bWDKWj/PlyhIt33ytaNFNhUnWdVQHxr244ue4+cr9Wo/zMD3bvH625TpFXKJ1uBmX+v8
         +bmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sJr/5552;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o35-v6si3312694qte.336.2018.05.16.13.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 13:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sJr/5552;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ2cN-0006sQ-Q9
	for alex.bennee@linaro.org; Wed, 16 May 2018 16:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fJ2cD-0006rK-LA
	for qemu-arm@nongnu.org; Wed, 16 May 2018 16:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fJ2c9-0002U6-Mn
	for qemu-arm@nongnu.org; Wed, 16 May 2018 16:01:37 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fJ2c9-0002Pq-Hb; Wed, 16 May 2018 16:01:33 -0400
Received: by mail-qk0-x243.google.com with SMTP id b39-v6so1736642qkb.5;
	Wed, 16 May 2018 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FVKcighuR2fAg4/tcfJGTg6Wos3rPvPP81C076MDFn4=;
	b=sJr/5552gUDVmx0gKf1T0YXUu+FIy8pBnGCOZo4axsSROWNrom2jt0qpMLTiwYdsQc
	9iDFNK17djO5iPSOfIXwv604Gl6c3fk1lFAinO+mLwNRutORZSWAEiVR8I7ceDuya5i/
	26FijiiL0A+xc1dJYppOv5Kqsnls9hXQGKmwZU25TjJ6Sv9iTpXeMa9Ls4mHl9DOTIP4
	5SZbCFtxTd4sZsfwcvqQTqRpXKuWkCs0dRvTHLSVNkygwNIVK5ltrBy+b1xDNei7Bqs2
	GegnphqJ31OxJrFBrmd6U5kec24vGWDR4ddfl3iCS+XysGQAEv8lf6CXC+J8Ewt7ax4F
	CHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FVKcighuR2fAg4/tcfJGTg6Wos3rPvPP81C076MDFn4=;
	b=E6K6KXWO6SwVIgP7RDfUsFgN/faqU7HV5um8NqYcPEeJEO2O/SmfJq3Lt5lz7BobRB
	YLWUKglDFjRmS+MNgqnwzZNKxz/SBBTuBMcXVYU4J4ZyRQ/LPXvxfoM8N09VMjig7Sfz
	kBflph9hq+nopwhib5P2iZcuEpPapgUPHon4M4T1GfcEQ5kl6BAft90HeIvf5xtvBy3U
	xhohwaAUfJI2rZs+IbdTcyi5OvSsv3AzEXjz83Ic0ioZcmRGNFq6jtbROUxfh2LgBGC2
	+Ha8I6Er8Hl442N+/FIMDwQCYfIeYt4d6dcLnQqavNIQgLqDoWLHlXQH0Q7TVMHGi/pw
	u3oA==
X-Gm-Message-State: ALKqPweAJSypfrHSPXkfBg83k4On+cHexpdPjc+lG9f2W9bZD7+g4krg
	N005fYAUSx10EdAWRDcK2o5saF7j
X-Received: by 2002:a37:5ac5:: with SMTP id
	o188-v6mr2291077qkb.295.1526500892581; 
	Wed, 16 May 2018 13:01:32 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	b12-v6sm2616438qtb.57.2018.05.16.13.01.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 13:01:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
	<1526493784-25328-3-git-send-email-eric.auger@redhat.com>
	<2c55370d-fa43-12a1-5baf-ec7cf824c0dc@amsat.org>
	<CAFEAcA-GxScM9StKESYAqJ2sbiSH+hWjJXvF7COjJPojs5J5QQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8324a612-8785-9db9-b0d4-ab943645a16d@amsat.org>
Date: Wed, 16 May 2018 17:01:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GxScM9StKESYAqJ2sbiSH+hWjJXvF7COjJPojs5J5QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/smmu-common: Fix coverity issue
 in get_block_pte_address
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Dnps03/vizu

On 05/16/2018 01:23 PM, Peter Maydell wrote:
> On 16 May 2018 at 16:16, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Eric,
>>
>> On 05/16/2018 03:03 PM, Eric Auger wrote:
>>> Coverity points out that this can overflow if n > 31,
>>> because it's only doing 32-bit arithmetic. Let's use 1ULL instead
>>> of 1. Also the formulae used to compute n can be replaced by
>>> the level_shift() macro.
>>
>> This level_shift() replacement doesn't seems that obvious to me, can you
>> split it in another patch?
>>
>>>
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  hw/arm/smmu-common.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 01c7be8..3c5f724 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -83,9 +83,9 @@ static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
>>>  static inline hwaddr get_block_pte_address(uint64_t pte, int level,
>>>                                             int granule_sz, uint64_t *bsz)
>>>  {
>>> -    int n = (granule_sz - 3) * (4 - level) + 3;
>>> +    int n = level_shift(level, granule_sz);
>>
>> Shouldn't this be level_shift(level + 1, granule_sz)?
> 
> No. The two expressions are equivalent, they're
> just arranged differently:
> 
>    level_shift(lvl, gsz)
>       == gsz + (3 - lvl) * (gsz - 3)
>       == gsz + (4 - lvl) * (gsz - 3) - (gsz - 3)
>       == gsz - gsz + (4 - lvl) * (gsz - 3) + 3
>       == (gsz - 3) * (4 - lvl) + 3

Argh I failed this middle school demonstrations...

Thanks Peter :)

So for the much cleaner level_shift() use:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
