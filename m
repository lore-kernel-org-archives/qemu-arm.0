Received: by 10.223.197.9 with SMTP id q9csp861123wrf;
        Thu, 5 Oct 2017 12:01:10 -0700 (PDT)
X-Received: by 10.55.192.204 with SMTP id v73mr1181812qkv.117.1507230070846;
        Thu, 05 Oct 2017 12:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507230070; cv=none;
        d=google.com; s=arc-20160816;
        b=COS7UlW6FBDWAxvmNdlsun4RVjceMDuRam/PN3nbH5+tbEY5UpYTY/h4mCrbMQLMrs
         /eM2AEJLdAM+/fIEIUGFh3C9b5bSuCtWGdqr3GPR1v5HclDXh663wG3W0BEFRJTFamsf
         OPD/mXufwO8XGEogiciMVHfFXlAZGI5l/x1559FuRm7ifcPepflfzSnOdPEpa+p8vjsy
         UtvsmYh7ezs/eghXVOij1hWaS1tx57vP13wnBD2vqafwRiFfnxziK+Ar0soTy+CuVmKm
         /F3K0zTN4j3eHNWmhluv9UlDc+apiWXrof4K3jfGApZda/OZY0/Rna6pkMYaJy4cwlwV
         IV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=v5TT78f5ymwqfXdlR3WUCnVJ6xU2Ew0I2dH4zjum4d0=;
        b=EfibOPsOQF0Wm2ADBJb/1rhdZsi6FfhdQMD7O83GEPdJMaE55XlZPstGYOGcynhkSP
         PqGUr1rVXkhombQkahZB83VFlCV3MLKJMKJGVhEocELtabs5yqYxpzyOuwZ2Khk4QTjl
         GWOFWYzgzYsAGz23kWB5PvFaVK1UML8hpG5kBf77dEwbkAbzq6QKK6kHEyjfEZDwbeoJ
         R/8GXwLUCpFW4IM8JqfKeazPOsk+aTwQjUqk/o/ud/T2IvV6DdVAfXBpq1rw/91hm37O
         8mwyFKt6uYydHEnqdcaXeCkNKNXtpioApP+dtXEK7PqnwICo/DLt8cqus3aATY9v48jm
         2SCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJfbAJlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si6972421qkc.462.2017.10.05.12.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 12:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJfbAJlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BOQ-0006S5-Dg
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 15:01:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BOD-0006Mb-2h
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BO7-0000GA-C1
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:00:57 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:50991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0BO7-0000Fk-7x
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:00:51 -0400
Received: by mail-qt0-x22b.google.com with SMTP id f15so27320529qtf.7
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 12:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=v5TT78f5ymwqfXdlR3WUCnVJ6xU2Ew0I2dH4zjum4d0=;
	b=gJfbAJlGtUhGEz/p9bBykM7Lck2HmLCtW+s3Zjm1JM0r1pEu/P5gOaWiF5f/OCaaN7
	L0MYqnyZGsqy8B2C3auivdcpQ5Le10ezXfPxWRBf9tjoXrrtY8rd+8X/QVmdUQ2srhx3
	A5s4YTxXg1ka+qIcly0OhxQ/IHwSKwsxeKFo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=v5TT78f5ymwqfXdlR3WUCnVJ6xU2Ew0I2dH4zjum4d0=;
	b=gEhKeDXA0HPqQZ6VqSYt6aOXJFtcz91EXXBA/BCn8JtmNowRwjO/x+bPHpI7qGu5iB
	Q92hkZBCq73iOezmV6N/0lL1XZsauDFYy8fAl8o1iQ96zOT5IeCz3rSP77JxKz1qa3wb
	NyltDePq7rcnK3DpJo5KsBE58Uxcm6M7nO4tlOAxxf0zukZVTh0qv83QzhMg1qT68l2W
	V0+vAj/ntu58uB6ttUEhFAR9G6LnEHY6WAWltuId0zki02AOmMlDrLDmeuP+jd4ivGRH
	jknNp5TS0RIeCp/gdi26Vse8/CWxVZMSijGAugcalPQ+Yr+A8FGeZSKlMy0j10JkmHMP
	nh+g==
X-Gm-Message-State: AMCzsaW/FG+k4xtzg8uLJSG81MycbDoIOaP2vRNzTSUvy71dvKdaILow
	dBrt2xbXQv0OcoDw0qpg+8KL7Q==
X-Google-Smtp-Source: AOwi7QCCx5xhC8Q6XNmiV1xDJ6YZrV2PchrMFvssHUrQ7p1kpFNmLTrco3x5ejrazymfyREobu+3qQ==
X-Received: by 10.37.175.204 with SMTP id d12mr7352656ybj.46.1507230050539;
	Thu, 05 Oct 2017 12:00:50 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	m12sm8469996ywh.41.2017.10.05.12.00.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 12:00:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-20-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cc6a4e4-184b-6452-f9f2-d52c92b21350@linaro.org>
Date: Thu, 5 Oct 2017 15:00:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-20-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/20] target/arm: Implement
 secure function return
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PijEbpTcD1nx

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> Secure function return happens when a non-secure function has been
> called using BLXNS and so has a particular magic LR value (either
> 0xfefffffe or 0xfeffffff). The function return via BX behaves
> specially when the new PC value is this magic value, in the same
> way that exception returns are handled.
> 
> Adjust our BX excret guards so that they recognize the function
> return magic number as well, and perform the function-return
> unstacking in do_v7m_exception_exit().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h |   7 +++
>  target/arm/helper.c    | 115 +++++++++++++++++++++++++++++++++++++++++++++----
>  target/arm/translate.c |  14 +++++-
>  3 files changed, 126 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
