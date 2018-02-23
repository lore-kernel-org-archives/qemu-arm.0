Received: by 10.28.71.27 with SMTP id u27csp1048534wma;
        Fri, 23 Feb 2018 12:59:23 -0800 (PST)
X-Google-Smtp-Source: AG47ELuEzxQrZZbZEMF6f1YdK0s0r/RqlYNi2uC3DMN5U7HJNxksQmXW6y6GR6Sq/QMK6Vr3Ppgj
X-Received: by 2002:a25:2146:: with SMTP id h67-v6mr2095570ybh.412.1519419563815;
        Fri, 23 Feb 2018 12:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519419563; cv=none;
        d=google.com; s=arc-20160816;
        b=xWrRM8fon8kexNh3eCmSWOViBx7c66ZRPTCOW4CAf5x9mrMBShI+SvVh0+F2d5ls0+
         CPoXcnlPhA0FPBE6T5nz+YqQfegZv3mTDVjQep6gxWl+MJ1AG1y9/TTMw61WfCm7FcsD
         plxa5K+BxHYF6wuvrNIvCMFPnwnVafpYK6g8ROkHox/1/MillHyVx1QL2F6XUY05XduX
         5M4q/aOnsK9BZG/uGSPlQ7A3QGGd0aD+LgAz5o5j5Pz+/eY0d5IUXH2DDMemgmRTtLYp
         b8geWIWKBIr/N0oTKYcTcI57xL9/DGrQ+A3k48aIQI6whO3L5SSxe+zhVrToQ4lWW0rq
         9bhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7+791JpaEt7oldMSmyyq24Dosx6lnHpheqCLw0PvYWc=;
        b=eL1znepZMz4C4B1TnEDtYO5/zVGnblX/sTd+tYJPctzpYojFZipy4iWbpWjUha84gp
         mA96dPfNBlq1twBVUthg/fOUXLlU6i49fKbMCvnynVNTD2El0gDf875c/wCWwXz8Q4hp
         vzzksTsimo0yx22ygNMoIFpKUa9RGwATIqk1PeZ/Fp29VidAbdxGv6hrUyugd7D4CGb+
         jGkWyoHwE40y7G/Zv7hXkLZgMaCXEc1m2Ws4jhk4Tn7GmDnqaMp9Mo05u4nHWW8SPnZW
         C+3lN1JYBZMlD5Vtezs3P8QMavRjjU5zoZ+oMSV9ypJZZya9D7r/WnsvuGxtz4GCnN/g
         2pEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPDnni9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188-v6si544363ybb.488.2018.02.23.12.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 12:59:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPDnni9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epKR9-0002lG-Aq
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 15:59:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKR2-0002km-D9
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:59:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKQz-0007Ig-JJ
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:59:16 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:35249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epKQz-0007Hl-DU
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:59:13 -0500
Received: by mail-pg0-x244.google.com with SMTP id l131so3806795pga.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 12:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7+791JpaEt7oldMSmyyq24Dosx6lnHpheqCLw0PvYWc=;
	b=XPDnni9ttFe0E9mI1yjUXvAdbkhCXQY5yvrM6f3MxrwqOcoDwkhEvNujVDC7nIMECD
	UCAY0biLr4Qconmu7TuH2/GlsVdjkSJv2mHMbMgTO6NUQ/3zQNaG5Kg/vqJsIEy0rBc0
	KXGXQSdfcYAlu/Om9KN6o2AmuEqx6i47e6uoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7+791JpaEt7oldMSmyyq24Dosx6lnHpheqCLw0PvYWc=;
	b=Y9WcPw6IemfpG3rq5g+/mT7xeNn2OxPPqJ6tDKdLyRNko10kPVnFWZVcPkI2U5RCob
	8+8zx3bPNpyHGtL1s4ouPBOLvE3p/7tS2YVsFjdzgRrNWUiobK8dp07rg+WRcZEGKBiY
	SVxvcP7w1U4WZllgp3CtWZuImkSHsu1IisgzVrx/+AC5/Ix+fLC26ijJ4l6BKiwOCHzg
	sM3bvzxyu1vL4Fu4ue13q0JMGpZ//sbYBSwDRTQmuBBmxLvt6pcfnlTZlhpY1YvFpS7j
	96VwG6a20pWEYrJXsU2N2AwJlcoiInSc4JW6AwlAWEIE5ZIzOFxQqvyfSF8JdugxBrmE
	iXpw==
X-Gm-Message-State: APf1xPDoYCbhzYnxXNkdwSnmSviNrPW9puXTQJVNuq6VvWHKL5XYxEGL
	0wfu8e9seWOyv/AG/SGUKXH47JqB2AA=
X-Received: by 10.99.100.196 with SMTP id y187mr2422953pgb.362.1519419552027; 
	Fri, 23 Feb 2018 12:59:12 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	p123sm6127896pfb.6.2018.02.23.12.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 12:59:11 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-39-richard.henderson@linaro.org>
	<CAFEAcA8pcZL=zkjQBZjswznKdU6z4L7h5-So3Wwkwfpg++jPAQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30d86f9d-2fa9-dda2-4acc-7331b48b395c@linaro.org>
Date: Fri, 23 Feb 2018 12:59:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pcZL=zkjQBZjswznKdU6z4L7h5-So3Wwkwfpg++jPAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [PATCH v2 38/67] target/arm: Implement SVE Partition
 Break Group
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
X-TUID: 8V/ZDL3Hd5W9

On 02/23/2018 08:41 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    |  18 ++++
>>  target/arm/sve_helper.c    | 247 +++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/translate-sve.c |  96 ++++++++++++++++++
>>  target/arm/sve.decode      |  19 ++++
>>  4 files changed, 380 insertions(+)
> 
> 
>> +        b = g & n;            /* guard true, pred true*/
> 
> missing space before */
> 
>> +/* Given a computation function, compute a merging BRK.  */
>> +static void compute_brk_m(uint64_t *d, uint64_t *n, uint64_t *g,
>> +                          intptr_t oprsz, bool after)
> 
> Comment says "given a computation function" but the prototype
> doesn't take a function as parameter ?

Whoops, old comment.  FWIW, it did at one point.


r~
