Received: by 10.28.173.206 with SMTP id w197csp4916436wme;
        Wed, 10 Jan 2018 05:43:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBosDoiPl1zWey96MoJQiZhKDZDgjAZGkx7XtwYeS0QqBAwyAI2yrJvYwdLlIMLsmVGFx1tuw
X-Received: by 10.37.124.199 with SMTP id x190mr16867865ybc.39.1515591818709;
        Wed, 10 Jan 2018 05:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515591818; cv=none;
        d=google.com; s=arc-20160816;
        b=Rkf8yGqzvJhkv/tBeglC62+z84xg9+LSCDLnrTBfSw4Al85ejQllb8KQcA+ILh2mJS
         kHckmSwXSbodDePjOxoV4Jcr5mHaj0c4uEDo0SOQfOy+2T7QlhluOtGYJTMJkJXnEQgY
         g6DPpzVzbD1Cr7ZGdVafVOCWnBl9PL3JMXdpBygcr+ZypHjSpCF05u7/LtMl/0CWTKkO
         d9yNYry4Ir74mQ+OEU9RJ+WQNWYuCis/ZbyVjumZoHObUXTgVoL7S27EuzugaIE7Y8dg
         /eGgdeO/p0H9GnmbC7LLLap0l7da/wyUtiImsnGS6fitBeZmOLk717nxbK0WEkoNwk0k
         shhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=d3e1TraUNFREQYzRlhX0vIhs5XIMyEqa8eC7dL10Qic=;
        b=myDoNaPcpot6uGNV1zmif0Jyb1VgsbyEmyNtZdzi3CgbCi00fR1mKnN5wmsBoItymj
         Ccd83nFmz3laI4ovZKINWYQuJytfMF+1fqxJ7i9hHsfihMCn1hoqedkQVSCZTSal4z4J
         7+WPuMYzFa77u/Z0RntdIA1t5LtnBuOvs52j8O+q6m0bN5IQrYPicdaeZzKGDsWOrFCa
         +jiXxG2EvbWtALDTaCtx3RNSUh8OqTqzMKvAw0Azk9NWO8h6p8jzzKdXfGmCm6nOD/C8
         FQ9n01wxwG/38bX2/bOXP7eg96e4dHvNe2GcLaj8mNUS1851lpNsYR6mi7pRuSmktrw7
         fx7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si335957ywi.641.2018.01.10.05.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Jan 2018 05:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZGfK-00085M-60
	for alex.bennee@linaro.org; Wed, 10 Jan 2018 08:43:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eZGfA-00084a-Um
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 08:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eZGfA-0000dW-1n
	for qemu-arm@nongnu.org; Wed, 10 Jan 2018 08:43:28 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eZGf4-0000YZ-JJ; Wed, 10 Jan 2018 08:43:22 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue002 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0M3JVg-1er4aP1wOG-00qw5J; Wed, 10 Jan 2018 14:42:49 +0100
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20180108231048.23966-1-laurent@vivier.eu>
	<20180108231048.23966-2-laurent@vivier.eu>
	<66de9088-f8ed-2be4-c71a-5d149c63587b@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <525f7d10-54c5-eca9-0b45-62771afe9c59@vivier.eu>
Date: Wed, 10 Jan 2018 14:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <66de9088-f8ed-2be4-c71a-5d149c63587b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:gYR1p9TObwdKpzBNn41/2ynT2N9WZyrseg1KkO81D68WC6CSl2x
	NLoe6k/Q5X8PPuTUCfAAsP8q+G4X7W9TD/33ZO1DBLW5xIS5M5Y5LwPKXtNsgP9EV6s7WcH
	mkLT6gHJh8GFcPG3WUBDJaP8j7es+nLbaNcG/x4WGtHtnGf1bWNvr0gR5yXG8IxPU0vhH73
	lxv7t45TFiDyCFGs1NLzA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ebVGRqDF6Zg=:ZtBHDSRWQmIPYq8AcN7Y/k
	vOv37HM4KVXFEqkF5QaAGdVgpX6OTfD1I25WV88W+gRqagg3CqgJIB/z3Y4YwemYLcWvOmMtl
	X/q1sAUapukgV2hKLxMXHHwF9on3M8ZLkDkMdk9hFBSqSXumwI4ZzOxtL8p5mRysBlh45R67x
	1uYIn3Y40/rPsM49O7ucZ22i9XxA3ZsR13Or/z9sXTr0dkHo5Sqrf8L5ewSuaA94EX0Ndff9m
	1F4BgIWCoPl0u1uLlEQUwyS053pvtgd0fGzNlKu7KzZWDfR/CWdigs6iygcnL/a4/85arE8Km
	fXsjCdpPlIOmXMdgWatD/c2VadeZ2v9I252UJcTVBr8jUTBcbWABmXk0GEBOuR95DC7trwsN6
	gyTdJqw4C8UONcaBrTv0l7i7g9NkaotO2mTldQ7vpEC3ZAFo3+wymQ5FNgLgV3SGnoSy66NB0
	hqhzbeMi8S15ua6Xp7EVSXULxCg2vYgywxrHnSi20aJnx0xBKLhetSpk8qdKbHKRsq4BjrUt5
	uDMrx4vXmxSjAQQWG4xp9VIF4g/56UjvdfmfNDLmSA5MAEcAn4f8Pl2kOYplprzRGf+BcXiMS
	L3sAM8lI0p7bgkcYzVirWKkQxdUnu8WgMfAZDXODmeqsLDBN4QD0DMZvxEzADCXZZjkCd9+hR
	A3voVD/SwgFzirCt31alRSTaLMiuAmBSKmmwDoSHNIacDnqE1dDE9oidt1CpqHxOuoCFuoJQN
	LQhr4z/k7bmGCiG/nW+byJpm0BAaJjDqqa+MRxFGZlfO7LUD0MUfPpUTu2o=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.133
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
	Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3PSrS2CS13X

Le 10/01/2018 à 09:43, David Hildenbrand a écrit :
> On 09.01.2018 00:10, Laurent Vivier wrote:
>> The MC68040 MMU provides the size of the access that
>> triggers the page fault.
>>
>> This size is set in the Special Status Word which
>> is written in the stack frame of the access fault
>> exception.
>>
>> So we need the size in m68k_cpu_unassigned_access() and
>> m68k_cpu_handle_mmu_fault().
>>
>> To be able to do that, this patch modifies the prototype of
>> handle_mmu_fault handler, tlb_fill() and probe_write().
>> do_unassigned_access() already includes a size parameter.
>>
>> This patch also updates handle_mmu_fault handlers and
>> tlb_fill() of all targets (only parameter, no code change).
>>
> 
> There are a couple of places where you use "1" (when no other size is
> available). e.g. in get_page_addr_code().
> 
> Wonder if that's the right thing to do - are there any architectures
> that e.g. always fetch at least 2 bytes in these conditions?
> 

It's a good question.

"1" is passed to probe_write() and tlb_fill() and handle_mmu_fault().
probe_write() calls tlb_fill(), and tlb_fill() calls machine
handle_mmu_fault handler.

As no existing handle_mmu_fault takes care of the access size, I think
passing 1 and ignoring it doesn't change the existing behavior.

probe_write() is used to check if a page is writable, and none of the
callers is guessing the write can cross a page boundary, so 1 is the
good value in this case.

get_page_addr_code() is the only user of tlb_fill() with 1. and callers
of get_page_addr_code() never guess the code address can run across a
page boundary. Some of them calls get_page_addr_code() a second time to
check this case. So I think using 1 is good solution, but perhaps the
code could be improved by adding the size parameter to get_page_addr_code().

My purpose was not to change the functions behavior, only to add the new
parameter. So using "1" when the size is not obvious is a good solution
to me.

Thank you for your comment!

Laurent
