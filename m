Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2001658wrq;
        Sat, 23 Jun 2018 08:26:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeIyN3oiGnXZfJqnc0aBCJ33iKzYr/+dk7Q/qFqiwHFsqVY3bL8rR33fMDg/QUEmz0XrRIP
X-Received: by 2002:a37:3b8e:: with SMTP id i136-v6mr5000474qka.172.1529767570535;
        Sat, 23 Jun 2018 08:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529767570; cv=none;
        d=google.com; s=arc-20160816;
        b=YZ9Oztzz6GVCWBB8Qs7jpSM93XCez7FSlm4782iyQucoHncXIRx493e6ztrwRT93AF
         yhuJ2mow33BAVYpU8/U4KD3kzUZvxN6sCbHXQDrHeZ3dY+x22HYF06jJyU1Ed/rqby1r
         KhkyDR+xciNfG+1JqygY7w3Fo7ErnMcFlimqyesCf2bQjBjpErVX3234Sw5xZ5HsUle5
         2YkaJEnWgqY6cjFl9zg/tJtY/sf1w3yWxpy7dIY/JZ+5kLsMQtZs20zdP0jSVqwlkeZq
         FytY0MCx2Ovrh9Pm10UPVq8CEZQmtOjwCmYsiedJDMUsYTwEBRQpOV42Fh58ZBTFE6RC
         5OIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tu9eIlrIq6V7V8kwvI4BbRgza076FaoaOPCtJUnzcGk=;
        b=gLp5TjIlp3wdNFo0d1IwhVkJaG3aE8edZclrRLLJkz+UWi2V+mFObGJwZyqpw9O527
         1obw+R77BKmDQhOm9h+8oAiXpJOEbemaQXoY/j2qjY+gh/a03H+4lE9BPD6xCPWvBHZT
         h+ZlwNLIJy3lzzQnMejNXJpm8NThJjgCNbg76vSo3JhJgkNAfLLpR5fVgtyiVgNZdonr
         MzQOEWFPuVoExFaTZbAc6nu3t3AxvVKK9aHmRIxVqu6HvRdeQm1uvHkgs+RThJdMlpm1
         3h53eye6gFXYwqyUwSFVJ4HBfKP7739hvSzQ18mqPv3E/tOEHgvzPnE12dDpCG1YBIoG
         CYKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+xoEEvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si2554380qvc.52.2018.06.23.08.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 08:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+xoEEvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWkQU-0008Bv-2Y
	for alex.bennee@linaro.org; Sat, 23 Jun 2018 11:26:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fWkQK-0008AY-4L
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 11:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fWkQH-0002KY-3k
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 11:26:00 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fWkQG-0002KA-Ux
	for qemu-arm@nongnu.org; Sat, 23 Jun 2018 11:25:57 -0400
Received: by mail-pf0-x244.google.com with SMTP id y5-v6so4539104pfn.4
	for <qemu-arm@nongnu.org>; Sat, 23 Jun 2018 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tu9eIlrIq6V7V8kwvI4BbRgza076FaoaOPCtJUnzcGk=;
	b=g+xoEEvnK4M+wzelRtP4cZ5oOiDBjmLCT4mn8S8Hd8Ee8xuurIHP84rlCYOKJb4ID7
	PUiKlHJwOFLdt1QqNLsUoOePPRVdavi4Q5Ko/rrwJOkdvceTYrV/EPwXA84SsKH1ZXbo
	3gjn+VRyUT4MDIx0eKKJMIKxeXg5WHsVln0nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tu9eIlrIq6V7V8kwvI4BbRgza076FaoaOPCtJUnzcGk=;
	b=NnLTy/fZNIK5y50gHiq5A0/o4D69otEjLMR+ytkUqD0GIwqiBlESOQVNyhu/7mzDcC
	d8Ak5PmamC2ZLufkSg40kr7I2v+lzbbzyxh4aw38YQs1x47xiZ+6/rRUFDKYVMXkKmLM
	oTLsJS8cXdQgMhL/1WaZUZtBd2w+tLprrIL5gpmzzTp6aalg63UEtl8Yf0amuv3sMiYI
	Ceu+9d8BRNpsa0I/IDBvSBS6/Bf6v20P4qCBrUCy2XjzXRCkdQHuaoBZ0+QdEJFP4tKl
	UHsf0/7PMlhAliLIvJ+CG8+omwxIlsNT8oVzQGrqrgFcJKJWeN8Pk/w6uHsvhKGPjjcU
	SkOw==
X-Gm-Message-State: APt69E0JuST9j4U4/SUe6eBvQ0d5Uzl9gKeooN69cBBAYihEZFHiVWKm
	ST9FjgO25fGUiJ8mgDTnfNBzQ+tYXwQ=
X-Received: by 2002:a62:c0cb:: with SMTP id
	g72-v6mr6233654pfk.226.1529767555439; 
	Sat, 23 Jun 2018 08:25:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	k69-v6sm18334116pgc.39.2018.06.23.08.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 08:25:54 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
	<20180622211244.GA11346@flamenco>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1319a0f0-0009-ebfc-dab4-eec196ba8ba5@linaro.org>
Date: Sat, 23 Jun 2018 08:25:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622211244.GA11346@flamenco>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [PATCH 0/2] linux-user: Change mmap_lock to rwlock
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWwFi2SZhtRn

On 06/22/2018 02:12 PM, Emilio G. Cota wrote:
> I'm curious to see how much perf could be gained. It seems that the hold
> times in SVE code for readers might not be very large, which
> then wouldn't let us amortize the atomic inc of the read lock
> (IOW, we might not see much of a difference compared to a regular
> mutex).

In theory, the uncontended case for rwlocks is the same as a mutex.

> Are you using any benchmark that shows any perf difference?

Not so far.  Glibc has some microbenchmarks for strings, which I will try next
week, but they are not multi-threaded.  Maybe just run 4 threads of those
benchmark?


r~
