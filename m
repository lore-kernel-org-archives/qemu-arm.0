Received: by 10.25.21.156 with SMTP id 28csp379559lfv;
        Fri, 19 Aug 2016 07:57:45 -0700 (PDT)
X-Received: by 10.237.53.157 with SMTP id c29mr9308879qte.75.1471618665023;
        Fri, 19 Aug 2016 07:57:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v91si2883740qte.122.2016.08.19.07.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 07:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1balEu-0007ZQ-Dg
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 10:57:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1balEm-0007WZ-SF
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 10:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1balEk-0007NO-N3
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 10:57:35 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1balEe-0007Ic-Bb; Fri, 19 Aug 2016 10:57:28 -0400
Received: by mail-qt0-x241.google.com with SMTP id q11so854573qtb.2;
	Fri, 19 Aug 2016 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=6ZL5C1mWF99IHJ+HYxFxtXuftYasFWFPQXhe6uVCFB4=;
	b=pFrzPusIWDfmxAphBwNzt4dsC2+qmFtXPqtkOtwBOov7GHMJOgDpjrg0J/06twky+H
	/Pzob2SOolGKYCFgc6QzXbh8N21S3bKYlrUPmU8iE0+/7kIAggHyWRyGhlo3ss1XxVzb
	qofiFej9S/INJBUu873WcUYlbIbI8SZr4nVdWzfYz6zmKFKpGIx/xXmGKqcvsQC9xMaD
	wKn1N/l/5237YSwqtkezAI70PNZtF9hg6F1BlEakgSL78Rv7U7W4QProKgWbVeJK/rY6
	djNHZPyCrCazCM7GS3wIAr3gF1VCNPlwu7IKgGxKMdXWtCi0i3urqsYIzh5TxxufmbRQ
	mMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=6ZL5C1mWF99IHJ+HYxFxtXuftYasFWFPQXhe6uVCFB4=;
	b=Q7dgiKL+6qrGlTpqIndYW6A944tZNGOT9+ef4wmwfB4WvXnMM5G1cPE+9mpCSPUE4m
	gizhsiO/BbJp77P1bBsSikAt2COcIRHalPFaM6E9yyP6BbW8sKKJHVo13d/TDL8VIch8
	U1TwzTPGx1wcge2CpKalJYxGeOrPcQGSsKaJIF6u+UP9SnvXT8449l1JWPKYAtzW6XEO
	mSBoa3/Kdkfc2NgEuo0Rwnho66AFXHyO6Tv43IiLEBtyU8M2M5mwP3BfJX1WVm9tB7r3
	jYxRfA4KOuIVAHF7c96NMC02oPbK0gNve8Wj2AGaCpx4pZ5M//iI2iMtVPTG8Q7s2NV/
	JqUQ==
X-Gm-Message-State: AEkoouvoedCb3Xy3bqfLnoJKy490Q0q3YmNrFUzb2Y+KBwu0xfppQi3LE5Awn8wXDwszlg==
X-Received: by 10.237.49.130 with SMTP id 2mr9546491qth.38.1471618647453;
	Fri, 19 Aug 2016 07:57:27 -0700 (PDT)
Received: from bigtime.twiddle.net ([172.56.12.37])
	by smtp.googlemail.com with ESMTPSA id
	m4sm4000784qkf.29.2016.08.19.07.57.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Aug 2016 07:57:26 -0700 (PDT)
To: Vijay Kilari <vijay.kilari@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
	<5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
	<CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
	<1d77e7f0-61b6-5533-f0b2-04eae0fed815@twiddle.net>
	<CAFEAcA9BL3u7WJnqFEVxwyW=D-FtUW7UdDxPhhgiFKObkuXibg@mail.gmail.com>
	<CALicx6svNmg9G1KDZX8AOW1nXd0bw5u1_JtGUoZA4Ft761VHfg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0f46688d-7016-9504-8adf-13fb7c3bfffe@twiddle.net>
Date: Fri, 19 Aug 2016 07:57:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6svNmg9G1KDZX8AOW1nXd0bw5u1_JtGUoZA4Ft761VHfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ogS+ZlDuV0G

On 08/19/2016 02:05 AM, Vijay Kilari wrote:
> On Thu, Aug 18, 2016 at 8:26 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 18 August 2016 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
>>> On 08/18/2016 07:14 AM, Peter Maydell wrote:
>>>> While we're on the subject, can somebody explain to me why we
>>>> use ifuncs at all? I couldn't work out why it would be better than
>>>> just using a straightforward function pointer -- when I tried single
>>>> stepping through things the ifunc approach still seemed to indirect
>>>> through some table or other so it wasn't actually resolving to
>>>> a direct function call anyway.
>>
>>> No reason, I suppose.
>>>
>>> It's particularly helpful for libraries, where we don't really want the
>>> overhead of the initialization when it's not used.
>>
>> Ah, I see.
>>
>>> But (1) we don't have many of these and (2) we really don't care *that* much
>>> about startup time.
>>>
>>> So a simple function pointer initialized by a constructor has the same
>>> effect.
>>
>
>  The cutils does not have any initialization function that can init
> function/constructor pointer
> for zero_check function.

static void __attribute__((constructor)) init_buffer_find_nonzero(void)
{
    ...
}

> Also creating separate function with most of repeated code for prefetch does
> not look good.

Why do you say that?

> So suggest to put check for prefetch outside the for loop and
> code for loop with and without prefetch

You're duplicating the inner loop either way, so that can't be your objection 
to creating a separate function.

> I profiled and found that a single check inside the loop is adding 100ms delay
> for 8GB RAM migration.

That's about what I expected.

> Also,  If you want to make prefetch common for all arm64 platforms,
> Then thunder cache line is 128 bytes so the prefetch is performed
> at 128 byte index. If the platform has 64 byte cache line, then this
> prefetch will fill only 64 byte line instead of 128 bytes required for the loop.

Yes, I had thought of that.

It would make sense to create two versions, that prefetch for and iterate over, 
cacheline sizes of 64 and 128 (I don't know of any other common sizes).

Preferably, we should then use sysconf(_SC_LEVEL1_DCACHE_LINESIZE) within the 
init function above to choose the appropriate version.

But I see that glibc doesn't currently implement that for aarch64, so we do 
want to have a fallback.  I know that the "official" cache line data isn't 
(easily) available to userspace, but a close proxy is the size described by 
dczid_el0.  That seems much better than groveling through a file under /sys.


r~
