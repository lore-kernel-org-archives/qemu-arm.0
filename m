Received: by 10.28.71.27 with SMTP id u27csp1399172wma;
        Fri, 23 Feb 2018 21:08:58 -0800 (PST)
X-Google-Smtp-Source: AG47ELvCuIUh5brMsyyPptqCDiEiBhMt88xWLjuswGO1v9i0Flv+D1LEUmiETqRiLNY88oI04Wld
X-Received: by 2002:a25:ba0b:: with SMTP id t11-v6mr2645530ybg.450.1519448938884;
        Fri, 23 Feb 2018 21:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519448938; cv=none;
        d=google.com; s=arc-20160816;
        b=1E+FSAK3DsGfdUJrl9bFOkk2NawecNhmir/h8Lo5NG/yAYANXAO38Fl8h6PcB8J0Yt
         3yrcBsx3xEfIVwHdpZ1sfdur3a/0Y4cApgWA6jP+T+JrB23gY7PKWRXoZ5CoeAzbp6Qo
         Juyq1WRGGW3dO7iRgnj3BsKl1wPQvo5M67DWdYTSTEZZ93XsRKdajOCvKMmuNjyTjOZm
         4sPrdmBYEMlhpHcXRx8r5kjBTpS+XJhpWg/X1oBaxPDP9WYwBnPouew7js5sOBYZtzTm
         pVfc7pOcAik8938C/gyryvfOXwAKiKvDiTips2fKqZy4GH5G4JwCfZLix2wr1QdY66wh
         +/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=3j3MLBNImcWQ5dsYZz8+iX1QxHbZhd6IqZr/izYPdv4=;
        b=xBoMtPY1kyEAh9hE1llhVAdim7aGVDkJBTl8J9qzB5Sem+d7dP/+jgpOC5eUpf9Nzm
         5yrZLp3OWkMTFKL/YUbHYFTgPX4fbkwHG3MBnUNMaymKyUBeRVFKLCGbbRAoVPiKMw6X
         XtfgVubxSksFDEm9iJLbh8XY+qZuzNzzDgMc9Vi7OeTIJPnx2AwqQON01O/dKXnv68i3
         4GGpfYhho1I6cU8wu6OLCEUS2/w7fJ9E8S4TpDBS1VZ3aOhvc1qTsFQ4cVgh1p+Paq58
         V+SJ1RQVYCtZ704ZTSNcgXT3X0c/52OZ3s3aIPBWrf2cHoct1SZfoC13EI2/ZLWxtNsq
         HMmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zd2g6fcO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o126si684923ywb.288.2018.02.23.21.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 21:08:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zd2g6fcO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epS4w-0005JP-AL
	for alex.bennee@linaro.org; Sat, 24 Feb 2018 00:08:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epS4k-0005JG-0m
	for qemu-arm@nongnu.org; Sat, 24 Feb 2018 00:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epS4f-0001xd-8s
	for qemu-arm@nongnu.org; Sat, 24 Feb 2018 00:08:45 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epS4f-0001xI-2E
	for qemu-arm@nongnu.org; Sat, 24 Feb 2018 00:08:41 -0500
Received: by mail-pl0-x242.google.com with SMTP id d4so6115468pll.5
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 21:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3j3MLBNImcWQ5dsYZz8+iX1QxHbZhd6IqZr/izYPdv4=;
	b=Zd2g6fcO4rEDQB8ifZhkPwoXC3YeOwpOgKGlFTz8kWQQa2LivEwWoh1xJ6ZKBcM4y4
	7XAgm0/POU4egJBEBuyxC9ZtNWx2HPSQUIwvYBYvgaug5BqZAZqp/vk8JTOKUeQVqNuz
	j2hzdift2GETvd+CKZyj1HqASNBVesD+MdknY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3j3MLBNImcWQ5dsYZz8+iX1QxHbZhd6IqZr/izYPdv4=;
	b=Ok38qqkmfM0UklazUCp9dNiP0vd+y4+owG4k5Y/288TKD44LOdFv1nJmtPH42obY0i
	+37w/8M5amAvxbh+MUJCoKRONb3RTOeKLzwsdra4YAeoyE3qf19uazMEe/Fm27xy41rz
	TiE/5tEMLxvEU1AGNul/WcBFRn2Xub54L3TJwEg79y6MmC/6ERCJZTutIram47v43plY
	MFI5pf0EBz8OkBU+XMXeBUoB/0y7qu60mRaFRbZrI5xsahzcw9i0ZR8sAWhYFgIBH+zT
	PNsLzaNJSk6cHUKtS+K9NKr+YF82Pyu6iuBVAciGDxRy7zABTQxMFR1+Rm0QT7NRXWyy
	vqfA==
X-Gm-Message-State: APf1xPB7ydMy6ZXEm4MIW0T5VyoqkHEFdQe8TyBqrJ3b2XAzori2nH1E
	KRvm5DLoDeky34+kM8gfSlq4zw==
X-Received: by 2002:a17:902:7786:: with SMTP id
	o6-v6mr3819726pll.2.1519448919934; 
	Fri, 23 Feb 2018 21:08:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	z79sm8582014pfa.139.2018.02.23.21.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 21:08:38 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfe24538-86a6-bf56-6907-9444037e42ee@linaro.org>
Date: Fri, 23 Feb 2018 21:08:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/19] hw/arm/armv7m: Honour
 CPU's address space for image loads
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
X-TUID: 3Gmm3wV291tO

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Instead of loading guest images to the system address space, use the
> CPU's address space.  This is important if we're trying to load the
> file to memory or via an alias memory region that is provided by an
> SoC object and thus not mapped into the system address space.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/armv7m.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
