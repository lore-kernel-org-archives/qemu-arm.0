Received: by 10.223.197.9 with SMTP id q9csp146784wrf;
        Tue, 10 Oct 2017 19:26:36 -0700 (PDT)
X-Received: by 10.237.60.148 with SMTP id d20mr22059703qtf.118.1507688796202;
        Tue, 10 Oct 2017 19:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507688796; cv=none;
        d=google.com; s=arc-20160816;
        b=Crq3VIUmA7TMzCK5CeISJlGg9uZ6dQdLDTNRnQjwkU0MmLocPFFIgGhvvlMAxqisEf
         5Q0GPjyD/wRjc3ws4xt2mTgsvg9Bgc+Oin6TmlUglQAn25ouGZyjLKWd+nzyvjJcORc6
         +/ms2M+UkmxuuZBtWuFUHvgSGeI0roEawDdRV2a5WskJha28bCcyV3HLvjn2Eu56dyUA
         q684nxDBwpavofvMXTTEXWp7fV/wonIEwlyUVQBzi7UyQG3pNJleAQxG9mTzh/W0W883
         leMuYZdcdwaXN+yDOGMIW4r4hQmA/1dF5vYTo+mBM86sSr0dtP3FtsPbxIBXgKwONvoK
         sNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=4J0eGHL5AhaiJ0HdeusB4FbIWLs76w/nJXcg3yKFQh4=;
        b=FIn7gB5hcJofdLLqxCM1/Ktg3nvqWNUm+FdwaV3IKH4J33ZWRfkDGLMbI6vVZ35dTV
         HkuyNzOra/JIJR9Nqt4KL6gMPSMfg8ijH53FNFMUCAuS09UrwVmY5fh/cwRZw/wg+aUI
         fm+B1GiTmDL18Aj5XpFYnagWmS/9B+oo6fvnI36G9Lb7BCPZVdfPa4ldqkOYflnYCVwO
         MU6A79ByezvtJVcSvFV+YZB0o1INpKNGJcmsL91ehaR0E5M5ff/J/lPBwYtDhgNpgKng
         Yul0e/awioEluU1vLwa32HlodoMeOViJuUOhF7fiVk9szeDi/St9Vk7uwjXl+P8Nf62V
         fBdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwTKtfIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a102si4646094qka.352.2017.10.10.19.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 19:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwTKtfIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e26jB-0000U9-V3
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 22:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e26j0-0000TX-8B
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e26iv-0000pj-7W
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:26:22 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:46646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e26iv-0000p2-0m
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:26:17 -0400
Received: by mail-pf0-x229.google.com with SMTP id p87so367630pfj.3
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 19:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4J0eGHL5AhaiJ0HdeusB4FbIWLs76w/nJXcg3yKFQh4=;
	b=ZwTKtfILUCkzFdU7Bns8+Qwd2fDTWYrb7u+oZTM9ml/4Dx1drfNg+MWO3/+bXWJLzo
	yJSi0OL9Z4OVHbLbkrsEl3CM2+GbNqRih4F/HyWsk46Z0dUmSjuujqnhi6s/VtkbsX/o
	2eEvTZ0zVshwc7dB8KFae5XAIoY9hOLungpJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4J0eGHL5AhaiJ0HdeusB4FbIWLs76w/nJXcg3yKFQh4=;
	b=CylfDnrkutQIPHsqxuwqOgeWYQYktJu8h+JqGnOlSz8ACvbG6jZE68gg/K/jfwBV0s
	nj3ar/8OZNDtiqvrlLFPI31TsV9j5L+WrwrybRzttwZV7iIUbphti3aKNLAi+mqw/8kE
	9AHLkUYTMOr2gtT5Xij9A1lNkG2Dkos59GWLXECm/V5p/HgeKgDBsvUKaoIMTRATDN65
	QUf2y3RbVs2aE/C1Hm673sGQAJ59dCVVOqfEvrJAhVpyF/YvHgg4ujUsYiYqH0cokjkL
	Ui1QdBt9Xb/QIM6uxmS5g1Ki/QFt1tO6Pmq61bHli4sqfESmvdXoxpIxd+ft7IiM6B+6
	yZtg==
X-Gm-Message-State: AMCzsaUjlUjFDYymCmFMqSaoTXmvWIn3pIOvcDqF4eSOlAWG8ZGwouHG
	8fiXsLglX/IwNCE1L/aQZ4FVHQ==
X-Google-Smtp-Source: AOwi7QDtd7znL5SablEYyrQbuScCkEuuJNtHaY+Sv/x+Stsh3uAFLQj+tbmTAODkJJbKC5QqZy+wFA==
X-Received: by 10.84.238.203 with SMTP id l11mr13766010pln.194.1507688776001; 
	Tue, 10 Oct 2017 19:26:16 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	h1sm18063185pgp.37.2017.10.10.19.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 19:26:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aae6c2ea-a4ac-bf51-17c0-c49cc4151eab@linaro.org>
Date: Tue, 10 Oct 2017 19:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/9] target-arm: Simplify
 insn_crosses_page()
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EobUDxo/Jfl

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> Recent changes have left insn_crosses_page() more complicated
> than it needed to be:
>  * it's only called from thumb_tr_translate_insn() so we know
>    for certain that we're looking at a Thumb insn
>  * the caller's check for dc->pc >= dc->next_page_start - 3
>    means that dc->pc can't possibly be 4 aligned, so there's
>    no need to check that (the check was partly there to ensure
>    that we didn't treat an ARM insn as Thumb, I think)
>  * we now have thumb_insn_is_16bit() which lets us do a precise
>    check of the length of the next insn, rather than opencoding
>    an inaccurate check
> 
> Simplify it down to just loading the first half of the insn
> and calling thumb_insn_is_16bit() on it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
