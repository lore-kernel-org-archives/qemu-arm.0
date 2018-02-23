Received: by 10.28.71.27 with SMTP id u27csp854902wma;
        Fri, 23 Feb 2018 09:31:49 -0800 (PST)
X-Google-Smtp-Source: AH8x224AXmDXn3MzzzRv8OOurCMR3EKecvyUW2h6oZeTkarY7l2Nw6ePX95sVHZV64IiUrgIRSXx
X-Received: by 10.129.3.147 with SMTP id 141mr1606230ywd.303.1519407108957;
        Fri, 23 Feb 2018 09:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519407108; cv=none;
        d=google.com; s=arc-20160816;
        b=VyHv8VCUYQ7AiW7A9o4+hhtjoJ+DHIqMNuyQeTKSUaUjD/lLXU9nHVABN/+nQmEAbD
         ck8qEVUYQXdREyNwJv6ziQr7BAngAMQ6phgEdpcF2qYXn4uPdw4E805gXiPt6B7ZC9ju
         Py5RWvlyp84E7n35xfLK1SgYuKxXtsxO6qGTBcYWLgut8VsrOGnVvtM1hHuNUna/wvsG
         o6F4tFLGDUNQhKWQ0uVcWhIeimDwMwCw3IS6B5tfPbe53ddlygmQ464baJkXcQ1pFmFa
         sjaqn1bg4ggslqFYR6oYb52BhjU23S3wWlauMDb+6E9iWweB9bbvWBT8Sn3uYpbmwAME
         qfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=f28EuZ9TkzPcfro25sonkv+MIJxCD6rfFyyoJJRCAxc=;
        b=HBv2/Ywg8HO7t6AFWcfZ22E+ZyEE30KQM58gxxiGfabIGWFopxzknnuqa1hXCjcK5g
         W7suVaBDQfODVnsqlDEdxdJZg2r4/mjNJb9So/VkKouTOU3lthI2UPNmf1KV+rCatqwK
         gBHbFibvY8eyvwV+aqIIJPY8dJCU1aWIEYrmJ/HSEn7NqiUzZ9b2Zd0cowPVBRAfysOK
         PKob3+8tEsHO7cqIg0vA35F521p0+LPwDkJlzq0mVRvwhnLZG0735Lc/C9A1kUr36sKF
         ajbCjo2OndJa2MZe9UNgYpBdA4HkG0RTHsRe8JTkO1SdbuD1o2to+ebJQscdeK1ikj3w
         Om0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cgd0OO/4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11-v6si500611ybe.619.2018.02.23.09.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cgd0OO/4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epHCG-0004WU-D7
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:31:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHC3-0004UY-TB
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHBz-0002Rg-BF
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:35 -0500
Received: from mail-pl0-x22a.google.com ([2607:f8b0:400e:c01::22a]:45137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epHBz-0002QX-5A
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:31 -0500
Received: by mail-pl0-x22a.google.com with SMTP id v9-v6so3260900plp.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=f28EuZ9TkzPcfro25sonkv+MIJxCD6rfFyyoJJRCAxc=;
	b=Cgd0OO/4Da0uNiAq7LZ90WaJZas3Swmgm1WCJYC3XbhrO6NYG2MHmqzNdhgK9TRA0T
	9pQutl958uOPieNCLWVo1vF+AKvyd/fZWAZxoOqNGux39CeSrogO3lE26yVSkA8OPqHg
	0P8fHisX+wGpP7ax8bCd4Ezu/paBgILWX0Xaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=f28EuZ9TkzPcfro25sonkv+MIJxCD6rfFyyoJJRCAxc=;
	b=PpWLzN7m6BN6gdqj0146baoJ0vGKUb3U/+/AMFUohcYln43mKGI91D8vOLBoDnbi/I
	cjYcCZ954yJVzbEZsJEe7XUz724eC8CEQe/VgjRzzeZKXscA1ApmBiiBFAlvwRnm/mav
	a/qG2NMToXpmrENdKOIl7+yCULbtYOV41OZhbeTmDd51PZRTtBnshuvMkzt96q2N60uw
	JNIkmrSmeU8NfpbEpH98bPPYTHVvOI4oeyoBptQZ3T7+j1aifbcloFVrQiRIY6ntcA0A
	DjYffbz7JdULCMs2IXE7FEGkJJ0otXG1pMYsjNJqMlV1jIQEHh7F47CLWXWWUEKHokAn
	43iw==
X-Gm-Message-State: APf1xPCXvtJjQg2sW2K8QRK6joYP8eD47u1TSveZxwvtCE1keVIt0VGA
	9bCD69zrl4/WEN7MvcUNNAsxgAIyc10=
X-Received: by 2002:a17:902:6c41:: with SMTP id
	h1-v6mr2350516pln.25.1519407089872; 
	Fri, 23 Feb 2018 09:31:29 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	t85sm6742612pfg.159.2018.02.23.09.31.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 09:31:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-26-richard.henderson@linaro.org>
	<CAFEAcA9=_kCGqv8Ck6Ttg=wEotYdTj7VYcs_w09+3D=7k5pARA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87933402-2722-157a-9509-523123f336c6@linaro.org>
Date: Fri, 23 Feb 2018 09:31:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=_kCGqv8Ck6Ttg=wEotYdTj7VYcs_w09+3D=7k5pARA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 25/67] target/arm: Implement
 SVE Integer Wide Immediate - Predicated Group
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
X-TUID: I/NlvUyTg+39

On 02/23/2018 06:18 AM, Peter Maydell wrote:
>> +    mm = (mm & 0xff) * (-1ull / 0xff);
> 
> What is this expression doing? I guess from context that it's
> replicating the low 8 bits of mm across the 64-bit value,
> but this is too obscure to do without a comment or wrapping
> it in a helper function with a useful name, I think.

I do have a helper now -- dup_const.  I thought I'd converted all of the uses,
but clearly missed one/some.


r~
