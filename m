Received: by 10.25.0.6 with SMTP id 6csp472232lfa;
        Fri, 12 May 2017 16:51:10 -0700 (PDT)
X-Received: by 10.237.60.77 with SMTP id u13mr6104295qte.18.1494633070671;
        Fri, 12 May 2017 16:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494633070; cv=none;
        d=google.com; s=arc-20160816;
        b=GBaQ/GaseBX9qibkPvs2GRW6Mb7a/E4vAln0EeR3KfeOXs4xPP/PVplUwfdsCljzI8
         m07Bw9FOG5zn4Rf/DjWzOvzgurZqCLyMZih9RiD0vcix1/5F7dbha/2t660WsRbcAwog
         DkMb6TZHqhT9pgrgr2wW7MzH2UO+uf720IdTFZEmknocy8Tkj+cHdVKlICf9pgrGx/iP
         beU7MEstkEjWVdV9brzvlYDuqObGDqK6S14AerZoztQ0m99kARCNkkz4Vm3BCMNBY3rA
         WD0g/ZhkPDMmfxNMhsld9ql9xkdauV/FL901ydsRPguQMvP3NDb2BXref12famSwE+1A
         5TIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=r3+ZYTg9dgodJHEWz2cXFGS6Vo47X08BKn3Onvl2r2E=;
        b=LzMnmnMpTZu2a9wXw7lleyythlzwREEO8anyG5US3BG79WyV1NMPksxF1JCHnJ9S9N
         VEx3pJKpZ2bCLy4DI4X17i4RVFVoYKp4wwIBz1Or8Yd6aptZCsJdCixYLfTz9LK2kHC+
         ALfdeV/n5GnHZE8n64//0BV/9BNn5OoHLtFftio6QEJWfLau/ALagKObntpmy5IJed8R
         A1CRcCbTahHlx4UagDIRsdHGMLRtlP/MpjDFSQMliUtTttO/P1N5dPUjNmqTdJSW7U22
         r1nOpgzQ3m1kg56v/MQ8YjdaaX6z7GOSy+LParzyxy+2iUa9f5bPgnlYEg8952UMHiM6
         285g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19si4645303qts.284.2017.05.12.16.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 16:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9KKy-0001x2-1q
	for alex.bennee@linaro.org; Fri, 12 May 2017 19:51:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9KKr-0001v5-EX
	for qemu-arm@nongnu.org; Fri, 12 May 2017 19:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9KKn-0004ib-GJ
	for qemu-arm@nongnu.org; Fri, 12 May 2017 19:51:01 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:34046)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9KKn-0004hv-5w; Fri, 12 May 2017 19:50:57 -0400
Received: by mail-qt0-x232.google.com with SMTP id l7so17810948qte.1;
	Fri, 12 May 2017 16:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=r3+ZYTg9dgodJHEWz2cXFGS6Vo47X08BKn3Onvl2r2E=;
	b=NdL59/nAhkhfj6XxOE2jmXlkz/eSa/Fa9z7pNOK/cQIRt2vXqR1ArjvBH9r4gFLYi/
	uiqSqnPkWF2MHqRR0+wST35bdmOD1G6wjBJUqik4RKH6v1eiJyc/ti3vwxj6JtiQ6Jgs
	QwNOI4ZxboU49LZAjuU0v0QRxx4jmXcz8cyF4Z33dpNYDnNZIOtigseqsD2E2+v06yjz
	OAeCfkSP+Fts2EhLJ5rWuRPHTWUqmkuArYVL5izTHEG1unj+Xm1iRzJIs0EmLww1iGQS
	QbLkOICJbtL/PR2EDnJ6uIyeo7sFwp0sNjdkh1xZuu1/fvz70SbpSHpfD2Ggna4CV/aD
	58iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=r3+ZYTg9dgodJHEWz2cXFGS6Vo47X08BKn3Onvl2r2E=;
	b=ICwfxVziv+5hoFxU/Ss8L0jiog9GkLJT5UOBXp8HYNkQKOcZZQ6yFQasSind6GqSWp
	rwdaae56r5HLUABe1z32i1pW3fzPZ/BKTJapTR3eWV1LasYBwlyswJtafT5hXsqnzNvv
	OVU2SUWA43SgsEeQ3M8wXcV1qrOFHsrte8yy0uC85hby9BzduDNgoXMk4NzAiGfe+OS/
	ePq6u1f1SE6pwE61rGjYuRfOsntehhw4LSa/+ly4BEkgHYLtuSGXbajetHy0cfBHTIy1
	8fF/vjlFw7MB6yd0hRViCMv+NfwQFUyoVr17gjih+kdd0H7bKsAaxKDWH0MvOp8JgXWF
	vt9g==
X-Gm-Message-State: AODbwcAsnMg1SH4QvFlVbrOk/sZSMRu+a2pPHoBY4JSV3CcbgkVvOC12
	KyCpfQSTzqikNg==
X-Received: by 10.200.38.132 with SMTP id 4mr5953411qto.99.1494633056587;
	Fri, 12 May 2017 16:50:56 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	k86sm3518924qkh.12.2017.05.12.16.50.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 16:50:56 -0700 (PDT)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20170512033543.6789-1-f4bug@amsat.org>
	<20170512033543.6789-3-f4bug@amsat.org>
	<f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e897850a-a1af-e11e-158b-de428dc6726b@amsat.org>
Date: Fri, 12 May 2017 20:50:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRMpdrkneSJp

On 05/12/2017 01:50 PM, Richard Henderson wrote:
> On 05/11/2017 08:35 PM, Philippe Mathieu-Daudé wrote:
>> -    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
>> -    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
>> +    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 0xffff);
>
> So your new script didn't work then?  This should be "..., 16, 16);".

Yeah this is wrong :(

I hope I got it in the last patchset (v4).

Thank for the review,

Phil.
