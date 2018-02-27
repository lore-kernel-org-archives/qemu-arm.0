Received: by 10.28.71.27 with SMTP id u27csp5231568wma;
        Tue, 27 Feb 2018 12:26:21 -0800 (PST)
X-Google-Smtp-Source: AG47ELsM/Q+vMokcWcTga52idjAJKRC5r/xKaT2+S8K13akQs3530xGDrnXVv0VR3YHWALCxgwrZ
X-Received: by 2002:a25:c4c6:: with SMTP id u189-v6mr10480902ybf.150.1519763181185;
        Tue, 27 Feb 2018 12:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519763181; cv=none;
        d=google.com; s=arc-20160816;
        b=EKzEXqzCIYobIYxQBbGU+B/ZquaV7lYXsxg+wTbIgu/5olGDCoczCOw9srJpoXmGKb
         X7rqNP4SdOnswI84RwerZFf/y4qKaVLFxXKFwcxwctkK7s0RWAeDf1WJrxEwcUU33tJM
         0Mn9AhiAXByY8F8zKBBqf890T6mBOqP4TAnTQIxOSN/jqg2ekAYibNdqJTS/G9ex7NlK
         DDFYnrUygnKHkSdzjfrX/XOleEVRTyFmfy41UG48Dq20rnlAZaDnPr7XS6EKfwNLWn/T
         l/EvzRNWyuD8AQptvanm1IKnJpPpgZdJlH/5ughpKu5xnwLafadh/qqEBKMXpw6ns2Ga
         9ScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=hu4qxCgiVirmYKSC8j+Q6dlJSYLSE8J4JcKjRjQrp5I=;
        b=a3nvPMs46Sdfl021cAZSlWmoJTjIw5u1T1P4+lxQ/WNff0pJMTj7s84XrD4yDCwLAJ
         bsMeuwzXP7fs17OIzn121H/FPzhJ4iLnqwz13ERHY6KCTjqQcC/fGE16e+fvSgzMxW+9
         tOzpqPVe3YV7OM10Ulw2rFiqilUtNcUBhjH8KktKJau64x5eQWKyPG1q4Ym9kUS7bXE5
         gVFXYtuaJU5ThPgcPEAKGB8U36yeM3n9RpHxnPBHfPQdlQM0D+MUlCl3dIaSVaIm/2fk
         OMudUahqUMCLW0C6Fuo5wz2ri0tec9Lkix21NAmF61pMD6SGJbw1flAibpB+Eu3uqnV3
         Rg0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M2amFpvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n13-v6si2106502ybh.539.2018.02.27.12.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:26:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M2amFpvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqlpM-0005DH-N2
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:26:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlpC-0005Bp-UL
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:26:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqlp9-0004CP-Lk
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:26:10 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42927)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqlp9-0004Bu-FO
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:26:07 -0500
Received: by mail-pl0-x241.google.com with SMTP id 93-v6so68337plc.9
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 12:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hu4qxCgiVirmYKSC8j+Q6dlJSYLSE8J4JcKjRjQrp5I=;
	b=M2amFpvFRoAYNWRwho/1Zv4dT446mkyrme51NP07hWBJ2/Dl61XxkRvHqjOsuDy1n+
	IWULa3SzUI9ANi4C3G6rVFeCUuGblZ6PSz8kC/J2l45lB/WlOmXqtzIsarGA9wzN4vdF
	JdIpT+dA/DgZbSGWPUbDTRf5MHW+4DLx4VmmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hu4qxCgiVirmYKSC8j+Q6dlJSYLSE8J4JcKjRjQrp5I=;
	b=KwcLvHs6iFkCfWvOPo9hGyeIO6PoArPVEFFZd86RfpOLJNoNo5T6RZQ6D/zsWvq2dX
	QqDxm/uW2mX+lSlFSM9w25RZfu7loarFidjXQPclqqAcwvPj6dve6Yw3SQrRAH/LJa4M
	lodX48nBG8gulJjyDGHPCvF8BR5RGmSM8i531CGWzhJxnp8Nm8mq7Tjvi9n7+QfGn8wr
	QOdL7lYawcfrV2/eTI/hf7ZGzq1v+137Vo8TzIrcLL1fEOR/gHPoV0dGHxrv4zq2x77j
	DuzA6rfgZ5PNV7PW4wTIjCHkUzVhP8KjxkRIN01FSAWFQu/+ULz7cE2hp23Rk1RuSRDz
	L/ow==
X-Gm-Message-State: APf1xPDuouZRkdeQgMzyLTnkGvZe9uRzU4d6iL25d47WcLXjz8o9fy4T
	Uv6iK/UaFa7+R1UkS1+bVIiGVuxeXXs=
X-Received: by 2002:a17:902:684a:: with SMTP id
	f10-v6mr15759120pln.129.1519763166252; 
	Tue, 27 Feb 2018 12:26:06 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id c7sm3892pfg.36.2018.02.27.12.26.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:26:05 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <994e9571-6cc7-7614-aefa-bc8fb1e16cd7@linaro.org>
Date: Tue, 27 Feb 2018 12:26:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/19] armv7m: Forward
 init-svtor property to CPU object
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
X-TUID: 6GcBUN9Gbm8Q

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Create an "init-svtor" property on the armv7m container
> object which we can forward to the CPU object.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h | 2 ++
>  hw/arm/armv7m.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

