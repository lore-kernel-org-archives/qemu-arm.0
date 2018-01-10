Received: by 10.28.173.206 with SMTP id w197csp5239340wme;
        Wed, 10 Jan 2018 10:48:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBotGdhF2JAlZQB9CSxBhxNMYwET4QrNyvSDMC0SadDdQeFnWyZwVAqZqViAMUrO1rD7BEdN0
X-Received: by 10.37.199.11 with SMTP id w11mr11881948ybe.285.1515610085605;
        Wed, 10 Jan 2018 10:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515610085; cv=none;
        d=google.com; s=arc-20160816;
        b=jWM01EQfFTJvKU9JyslQ85391DtIDPzniW+uM3uS8ahdLYqVmmeTKPtz5R99muM90j
         6dM0mtCpiKt2p1wWqbZ6R34pD+FGpqTJzkmJ2dGsLSw6ZVr9nsKDCIm8cY+BSDgSEzMS
         SUO6AfeZ2SwfhJJTghfFk91E8BHofMXQ8iMve+i7Rb4lioUjO32b8Rktdl2L2vJu/8+Z
         HjzxyX9D2Ezckzjmqdb3bx3zKeIi1z7DGWuV14DRd6Xzmtf58ZM9XB+Oqtw8/ytmO/1z
         w+M2LlSDnGrc0YkBLFv2WS9UL9QBVGB1DsC8DvDGq8C2GAGv5sdcQ9kFiHHMt+C3ud7P
         1R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=yBTWZUcJ1GjJOZES43meFH92gwC95U0m9Q7wM4OUG6c=;
        b=fYMyg3Skn/wxfKLdQDfoFd6kdTpcESkMAexWVCgTBZy7Hfy+z4U2kjYSABPwv/uwLs
         osPWOKCUS1eN7ErwhXcp5UV8zxrmBn5xRG1WUB81Mk8JP4/+ZqYJx24vhpTaeGHPuqIp
         ZVunPxlbB95kYjhbDhHseTJ6gUP4cee1QN6KpC5HT0xPbMtZBrp5cIKvBAK83pTpST6B
         EXJXY2UfAzQ5q06KN1gc+L9uO2KCcYLUymPMU1rSC/zVviov6azO8sMqIA/kVp1WDmNg
         BUeO/JMnw3RO85MqYK3yZtk2wbgNro1rMjRtJjuY7oXa4g2uufsq05au8DebRVHNYZVw
         N3Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OlnqBRhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17si3698036ywk.157.2018.01.10.10.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 10:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OlnqBRhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZLPx-00033s-1R
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 13:48:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZLPa-0002v9-P7
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 13:47:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZLPV-0000p8-Bx
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 13:47:40 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:37825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZLPU-0000oJ-VQ
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 13:47:37 -0500
Received: by mail-it0-x242.google.com with SMTP id d137so585305itc.2
	for <qemu-arm@nongnu.org>; Wed, 10 Jan 2018 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yBTWZUcJ1GjJOZES43meFH92gwC95U0m9Q7wM4OUG6c=;
	b=OlnqBRhmAYIyoE52mU3TjHy5LhXxs4fm1Vz3J2d85Mc2c4fMS7dRvYyb9bKVrMxz1l
	OL7sP+O0JpkAY45vArXXhrQ4Jz5G9Vmnh1UsCF/asVcdpFUBlxOuThUEs2SADzw/eSXC
	6aosT2dPijQLNSY+R70y0r0n/5PndDaTEdg3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yBTWZUcJ1GjJOZES43meFH92gwC95U0m9Q7wM4OUG6c=;
	b=rTupRHac1uZlUY4xI1EHV7BzIg7Rc7dpEzbZqYy998b7Sjz+yQyVQSX3L3RHzDJh/L
	B1l4U8eVv2WngKu4mZO8GeEOUsk2mQIbLTp6FHuEiZdj3XMjrQx3DbM96OUWxowc5tYQ
	YTFu52ILJt+6jjjxkwAxGIDJ+jsY+Wz+9z01oi7aFh/AYOB2u7mPvwc8n6NsYevL+QKx
	W4NcFgfrIrAXdXX4STp5MWTFHODrtll47atTuqdMqV8IDLBV7YWeVV1Wu6LuEDbOVuz7
	GZpiKqhn2Z8B5yWpq5jxtzv9GXFXuV61QhHEZzUOubMWSf/JU+oDZU7PHUjdOiT9H8cA
	QskA==
X-Gm-Message-State: AKGB3mKYdMG1jUa/0St+8UoWnCDdkO8JRjRMS7OTwQV8b1ksuOvsxhwq
	q0mEQbaUTBU5cwvrXZ2o+T8g6w==
X-Received: by 10.36.54.139 with SMTP id l133mr19873559itl.0.1515610056069;
	Wed, 10 Jan 2018 10:47:36 -0800 (PST)
Received: from cloudburst.twiddle.net (184-217-167-164.pools.spcsdns.net.
	[184.217.167.164])
	by smtp.gmail.com with ESMTPSA id p3sm9961700itc.39.2018.01.10.10.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jan 2018 10:47:35 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>, 
	qemu-devel@nongnu.org
References: <20180108231048.23966-1-laurent@vivier.eu>
	<20180108231048.23966-2-laurent@vivier.eu>
	<66de9088-f8ed-2be4-c71a-5d149c63587b@redhat.com>
	<525f7d10-54c5-eca9-0b45-62771afe9c59@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82d8d79b-d0c3-6d13-9717-7dd6c0b63691@linaro.org>
Date: Wed, 10 Jan 2018 10:47:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <525f7d10-54c5-eca9-0b45-62771afe9c59@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-arm] [qemu-s390x] [PATCH 1/6] accel/tcg: add size
 paremeter in tlb_fill()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Chris Wulff <crwulff@gmail.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rBxFoRV8c5aV

On 01/10/2018 05:42 AM, Laurent Vivier wrote:
> Le 10/01/2018 à 09:43, David Hildenbrand a écrit :
>> On 09.01.2018 00:10, Laurent Vivier wrote:
>>> The MC68040 MMU provides the size of the access that
>>> triggers the page fault.
>>>
>>> This size is set in the Special Status Word which
>>> is written in the stack frame of the access fault
>>> exception.
>>>
>>> So we need the size in m68k_cpu_unassigned_access() and
>>> m68k_cpu_handle_mmu_fault().
>>>
>>> To be able to do that, this patch modifies the prototype of
>>> handle_mmu_fault handler, tlb_fill() and probe_write().
>>> do_unassigned_access() already includes a size parameter.
>>>
>>> This patch also updates handle_mmu_fault handlers and
>>> tlb_fill() of all targets (only parameter, no code change).
>>>
>>
>> There are a couple of places where you use "1" (when no other size is
>> available). e.g. in get_page_addr_code().
>>
>> Wonder if that's the right thing to do - are there any architectures
>> that e.g. always fetch at least 2 bytes in these conditions?
>>
> 
> It's a good question.
> 
> "1" is passed to probe_write() and tlb_fill() and handle_mmu_fault().
> probe_write() calls tlb_fill(), and tlb_fill() calls machine
> handle_mmu_fault handler.
> 
> As no existing handle_mmu_fault takes care of the access size, I think
> passing 1 and ignoring it doesn't change the existing behavior.
> 
> probe_write() is used to check if a page is writable, and none of the
> callers is guessing the write can cross a page boundary, so 1 is the
> good value in this case.
> 
> get_page_addr_code() is the only user of tlb_fill() with 1. and callers
> of get_page_addr_code() never guess the code address can run across a
> page boundary. Some of them calls get_page_addr_code() a second time to
> check this case. So I think using 1 is good solution, but perhaps the
> code could be improved by adding the size parameter to get_page_addr_code().
> 
> My purpose was not to change the functions behavior, only to add the new
> parameter. So using "1" when the size is not obvious is a good solution
> to me.

I guess I don't really have a problem with "1".

I do wonder if "0" might be a better value for "I don't know", because it is
not mistakable with a real access of 1 byte.


r~
