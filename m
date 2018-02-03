Received: by 10.28.71.27 with SMTP id u27csp913115wma;
        Sat, 3 Feb 2018 13:39:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224QWNKSVqoMa+h2GbFwmHKO/AiGIIyH8iEGw043/f3emURTcKWhmnt6eaHBt7v061c/YblJ
X-Received: by 10.37.99.198 with SMTP id x189mr28344073ybb.232.1517693995740;
        Sat, 03 Feb 2018 13:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693995; cv=none;
        d=google.com; s=arc-20160816;
        b=hFQ2MwUQaKrEEZdNf9E1zGd/wwAaSuxTtU2ZPY08FGeAOwnEH4lDziQTBPv32+vKkq
         oaR2nnvuFyzR8xoHn9539448nFPTf7tv7PWzF+6s0d21HC1woqjhqxQPOiEGM913YWUP
         TdCzDzQWnIX5biSt68GcJpWVUEVoRQ0stPcSaaoFXs6hdUdP4ND3Vu4fxjA+rNtsaGAg
         72sGcmpdA6dQXibTYQeWodrAyZk09W7wp+XjJpYLPkoHl7Arhgb8f1fCRzNVJfTe4+3k
         AlMKZKfAY0deDRpdSXENOW8NPYoOcoZBd8OlGIMgcwrGI/wWOqKbpgVdv6ypGRiFtjJc
         6kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tS5dJKQdO6TPOMpS6Wut3Gl8NYVdlKPcFT0LfIECLdU=;
        b=fD87eRTsflXVdueHCM0uchXycKVTMEnfNju4wf6hT0e9eVb3QN5lxQB6hTdBxlqhd5
         KV6wXdv8oOoMzcgcbKqZBXvMYVdYf7z6PW/oZxfIv3GTa2e2jpayU0VWZFKPgfMoFem+
         AN580f9bduW9MOy5ZNor0b3Z+xBqh/HY+l7r5UIPVuohXPhVXVFvWGmq79Jjl95IFeMc
         gu52rUnZCaKXBv/2S7zLs73GzDSTa57bdrXjAEwN3VLdE0ZNJr4Z+JQumyel8drYKQv3
         yuMuoNFqSU5f2mOgzSZ3EyvQZRkxvEQC9hQ6BQ/kO0/KnBUxLjLOYoA7K738Ojy0aNe4
         V2Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2sPx2QT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8si960513ywl.346.2018.02.03.13.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2sPx2QT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5XP-0005en-6O
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:39:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5XF-0005e9-Hi
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:39:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5XC-0004je-Cy
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:39:45 -0500
Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d]:47051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei5XC-0004jM-67
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:39:42 -0500
Received: by mail-pf0-x22d.google.com with SMTP id z79so973897pff.13
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tS5dJKQdO6TPOMpS6Wut3Gl8NYVdlKPcFT0LfIECLdU=;
	b=T2sPx2QTWSSunx+Wrg7X/L6F9t60gwXagaWE4rnNtSMu7eXTQMkT/btTHjUqPnksyV
	uQ9BHApJvd8rFdMlpJNKmZifgjhtNopqJXvjs74gJA80xP9cx0RCFNStnUCF4/JLdyPu
	ZdUc6e2ByXmZZzK0gpDHKODAV+oSFpYLsn5EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tS5dJKQdO6TPOMpS6Wut3Gl8NYVdlKPcFT0LfIECLdU=;
	b=FyyNAfb9Lc45tzjvLUGDo+1XrfTzxzLo0lUDB2irx9lzqApqQJsLYfCAs/PUgqAedN
	eas4BhPaIIjqMf4MMDBCKrdOhExeuEI8ZDDycQccRH0ntHDYFuDmNLDAMW/RKrPIi2kw
	OTdStyrClcv4raV+zo85KuvSgxfOTsHw/Em1nzlSfFDN72pFe5cg6+JQRYN2Ji5rTSQQ
	8KMvN7TGvE5GNKPWbGYL18ybUYvFhB0YhYYShIZRcAc02oH2XxCxLP7jY99L+6b8A3WS
	TfbgqCIaR9uTWpcVqvtNOTTNZ2j+6vzyhjt2dg6Jc1dzSozHAuMWChLb4NL4fy+QsY28
	hCpA==
X-Gm-Message-State: AKwxytdIg8WV5TbAIjeKugoW/g9oJD2UqPcD5vzeFLFlfe+DsvSNtdZa
	6opGfNmzVK4oNI3cPf1E0czCDg==
X-Received: by 10.99.67.66 with SMTP id q63mr4933006pga.175.1517693981024;
	Sat, 03 Feb 2018 13:39:41 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	o9sm10135654pfk.80.2018.02.03.13.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:39:40 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
	<675ab9e3-80ec-97fc-5c01-ce28b2d2d4d1@linaro.org>
	<CAFEAcA9xBQO-o8wV0bR1qK1PG23xbAAWtd-JdXqS0ao9N+f3mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f56786e-e492-b260-344c-7050d6b4c07f@linaro.org>
Date: Sat, 3 Feb 2018 13:39:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xBQO-o8wV0bR1qK1PG23xbAAWtd-JdXqS0ao9N+f3mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] target/arm: Make v7M
 exception entry stack push check MPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FesQw0u3IRK1

On 02/03/2018 01:30 PM, Peter Maydell wrote:
> On 3 February 2018 at 21:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 01/30/2018 07:02 AM, Peter Maydell wrote:
>>> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
>>> +                      &attrs, &prot, &page_size, &fi, NULL)) {
>>
>> Given that you know you're going to call this at least 8 times in a row,
>> probably with all operations on the same page, it is worth querying the qemu
>> tlb first, and when that fails but the lookup succeeds, installing the result
>> into the tlb?
> 
> get_phys_addr and address_space_stl_le don't touch the TLB though?

No, get_phys_addr is the primitive that tlb_fill uses.

> We could in theory do a get_phys_addr() once per-page rather than
> doing it all 8 times though, yes.

After I sent that first message I thought perhaps interacting with the proper
TLB is too/overly complicated.  We'd get nearly the same results just having a
local 1-entry cache.  Something like

    pagecache = -1;
    stacked_ok =
        v7m_stack_write(cpu, frameptr, env->regs[0],
                        &pagecache, mmu_idx, false) &&
        v7m_stack_write(cpu, frameptr + 4, env->regs[1],
                        &pagecache, mmu_idx, false) &&
        ...


r~
