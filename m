Received: by 10.28.173.206 with SMTP id w197csp1689855wme;
        Fri, 12 Jan 2018 02:54:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBouarnnTlJzwDCEQECxkjVb1GUPmHFQuBYNfdhzDrmfRw3Xdi7+7oLlzQ7XfQ38bxCo/nVrt
X-Received: by 10.129.87.6 with SMTP id l6mr23156850ywb.220.1515754490709;
        Fri, 12 Jan 2018 02:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515754490; cv=none;
        d=google.com; s=arc-20160816;
        b=R8Y8Atx8oThCn2EBNsi/hhLoKDOI0sREoyVXfwdk+fXB5SgreJVklhgbD6S+jGLaa/
         Ih7t78Snosfnz7oTMrtY1wzBNVBTjAnxXY65NN4SreQwbGf4WgXWvX20LpZRDvMnBUtE
         CiRW6a0NQ39Zq3ZAlMhEaUKUXLHViqHnTn4Ylyzr1FaiUxhQPwa2yiBoZ/HQhetQTk10
         RbIH+yQmxyzm7xTy3puWOQ9h1izTlmXP80uPzov1IJ9EgZPVh1lkLOTeMPHr0RZxVXZG
         K9dlF9Tl8C1PWK4l2jZg5Jwgy4P9yeecPuLM9kgcJVEQYZxD3tz8iHYqivXtykY1I/FB
         2QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e6iv/91emViMmYRoYuH6lYF0hS1cGNuXw/3HtRMEuZI=;
        b=qWzynv0WXyUfbQRoWeqYQjIi3KNhA9vjessquKMxrl2P8ujX/1obqtQed3fFwKT4uw
         gT023rhnVwQdgeV/1G21sIVZFjjaoYTLN9hv+JgxVza3vFoclr2iDePejOYLbvbqaNns
         npXBzflRGdDsp5Ll9FyXYRSM3yGpGr+KIOBteu0rJxcQtmRLIeKjNh+gOmEjTZKnn1CB
         woPkpHMLH2UhBfErqC+UjegKc8+7kwUmKH6Ayn4FfpLSxiNJs5M9mijMS6O8dZUfsh9I
         l7nnZMyhc4+zI6GCZFS89KvVTCPb+vfoomVYCIdebSpoDrZkeB4ywBpKbT6y3WGL6NJb
         /a/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJdOgNos;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10si1518172ybi.174.2018.01.12.02.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 02:54:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJdOgNos;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZwz4-0005kx-1l
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 05:54:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZwya-0005hq-GV
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 05:54:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZwyZ-0004FT-Pm
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 05:54:20 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:46221)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZwyZ-0004Eb-LU
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 05:54:19 -0500
Received: by mail-ot0-x233.google.com with SMTP id f6so4708768oti.13
	for <qemu-devel@nongnu.org>; Fri, 12 Jan 2018 02:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e6iv/91emViMmYRoYuH6lYF0hS1cGNuXw/3HtRMEuZI=;
	b=ZJdOgNosLqbzZlIB2HtyNxfEywd/JwDgzwTk/mOEUrLMBdxbSZsTAYOHwV+aAU4Wio
	xSUlLfESDFL+wSWLd3ruk2EC7r+AQQshywGRZcyWKncWxNlQIW8iEAooLnpnbABOx7rJ
	E4FK3tNZAVt6hjVcQC7iiUPQYu60pL+BRsXpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e6iv/91emViMmYRoYuH6lYF0hS1cGNuXw/3HtRMEuZI=;
	b=DCIknSzqBq1ow3SwDWlDFLTNzOZhMzus910dLj4D2uQbxNTYerpA1bS2gOy9zp+GoQ
	/pteWvE49zQPK8+9glBvFAISNvYIoLbD7au0q75RHefRv+FCEGumM9qJnWhBxz03r66F
	kZFWMT41JAHfydudGRMhm97TCkciCxyQ8LqOTQn7KINJ+osgMfNljbCq+rC2BSWx0Hyi
	o3LFYSQhmKSUg64+5N7viKHP9IkZ+iKbmlDOUKXsqUxYbuwdaTE0NTLQH6Z2iFk4l1L2
	rg797H5gi1cmKFajdwU11GnDtYvCpO2dF30RvjylruK8dOuJDFMPQDZfBofxwDR0frwD
	xC3A==
X-Gm-Message-State: AKwxytcBMEMmnM97nzJTPfdbtEpmUapWjhAIJEHldBSaknmKC+dGBhI7
	TNBrOjwBLjS3JFXooO2DioMDo8D70oJpH7JxxCsXxw==
X-Received: by 10.157.8.172 with SMTP id 41mr13883517otf.116.1515754458776;
	Fri, 12 Jan 2018 02:54:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 02:53:58 -0800 (PST)
In-Reply-To: <3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
	<CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
	<3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 10:53:58 +0000
Message-ID: <CAFEAcA8L4q83NZOg8P8QveOOfR+Y4RUEM_BdgOZ3pdBmDjsnEg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-devel] [PATCH 01/23] scripts: Add decodetree.py
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C6eC7zLyEt4s

On 11 January 2018 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/11/2018 10:06 AM, Peter Maydell wrote:
>> On 18 December 2017 at 17:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> To be used to decode ARM SVE, but could be used for any 32-bit RISC.
>>> It would need additional work to extend to insn sizes other than 32-bit.
>>
>> I guess we could make that extension without requiring all
>> existing pattern files to be updated, right?
>
> Sure.  I would expect that to be a command-line option for the script.

It occurs to me that we could just make it silently DTRT --
we want to check the bit count in patterns and so on to
detect typos, but it would be a weird typo that was wrong
by 8 bits, so as long as the patterns are all a multiple
of 8 bits long we could accept them (and handle them in
whatever way we find we need to handle mixed-length
instruction sets). So we might not even need a command
line option.

thanks
-- PMM
