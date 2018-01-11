Received: by 10.28.173.206 with SMTP id w197csp814817wme;
        Thu, 11 Jan 2018 09:57:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBotvQv5qes51Oivll3DwyUEPywCSmDqhnu0R/iO1bdzgU7Y579f5cmQ1lVK6H0nYmt8jy0Un
X-Received: by 10.37.59.82 with SMTP id i79mr21279977yba.524.1515693435949;
        Thu, 11 Jan 2018 09:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515693435; cv=none;
        d=google.com; s=arc-20160816;
        b=bWHsgAKzvNtR7XuRT+6PI9NHUuHv4ldwFz+kODmid/ZbkcDKKvW7utARgNMvMH1TS3
         WAzEHUSdGSz/E/nSIUS74Kj21cnVw/V+7GeSI2VDZPVWTi2odn3f+6slKIy7uAVdpxv/
         dGepLec+rAf1223crS1J6cvKtJJWAYo+nSKoCnNg8c+sigPcYFZ6qvPFHgaRzVfyJe/n
         hJtNK0qdfii+nlM5bI5xb3sH8VTH7FoszCUrnKqpuWL3wdxBD7ClIf1DB8rPdMvh+3PH
         WAuxVlgolrS4Fk1mZ/IZTrjahLzDYiMw+Io8Qk9iHXjWA3fjn86EtOP838hyKegGdaFx
         6ReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=z4OQYncgJt5uHrLCrvQefkJ5SWoBT7I8o6z6G5KE7JE=;
        b=QprNZHAvlZ9mXaRL6WLTrBwnId8rJVU0MHTxkRT94UzAk0Fg79SQo7H6RC4eSNz6pM
         Rn2tEDO2Ns9cEIN3pnNyR81tiAl/n7Nf0JPoPdDWjAPqaLqsMTDmnPnVk4ZMSriTWIeV
         Or9f8OZY6tfREwB84uwPvgyaau0aDSXEq8fIxcLuUV7dRa4WC1dgCZ/4IM3RMkUBIqKd
         kXAuJ43ZjRUTi7COctj08LFKDg7/2uPKMWamNtFO28EVkChWUCIZS1bgdRW88J/qDRbw
         fkmJr8aSJFhnUIDv4SHbRL3OxY67xEuq3p8WMmCdwve2A78bbnck3Dh9Fj/aY/dqs01W
         EsEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gFucJ91l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u185si4022612ywc.486.2018.01.11.09.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 09:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gFucJ91l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZh6J-0005UI-BV
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 12:57:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZh5s-0005QN-9w
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 12:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZh5r-0003xB-9W
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 12:56:48 -0500
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:46963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZh5r-0003vv-4K
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 12:56:47 -0500
Received: by mail-ot0-x234.google.com with SMTP id f6so2792821oti.13
	for <qemu-devel@nongnu.org>; Thu, 11 Jan 2018 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z4OQYncgJt5uHrLCrvQefkJ5SWoBT7I8o6z6G5KE7JE=;
	b=gFucJ91lkoU3XJFCStiB7ZbMxEZa7Iw00OEYzdtFdhWg9DAJ3/OQTCDMOz+8crPz6u
	TFa+zPrgaGNaDswEX8baeKOlUKwWHQgEBNmSk4shVbb8M2xtJRDrJdYyFpEMhKTm9J7a
	OpPO4AUi83++35fKyuLXtZqWNILqmN3v9vABk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z4OQYncgJt5uHrLCrvQefkJ5SWoBT7I8o6z6G5KE7JE=;
	b=RvrZGGUY/3hlCLVMm/t+IX6V3jIT/7am8Pwqq+KNdkxuFpUo+kwM89utozhm9EjQPH
	yDnCCWj693zEH+RZWvhvDUxr48MXLEDywa3+5o74pnHATHcV8br/0L70u8gh6PTlKCvG
	25GONc50m7kGDEPz5VmDJ9cVXVDWRF1sbeMQTRClRl6QjSuV2Dv1ik0xPApuFng8kKd1
	LnD+XoT8zmInsDMuCHxRNbjdKdfQFy/cXqtpR1wyqJqZ4yIkPJJ686+Z6e/fpXzwjVyB
	QSBqRtrnOOQe1W/Gon56F7Ef04rJQZkULljc1nDMwhvctj/hqElPfXor1JHqGtFCc6i9
	hMrQ==
X-Gm-Message-State: AKwxytcj3w4HDlIQq+tdWfXBZ/gITHbvRAJjfmhlvOrFz6e6UdxAsa3B
	OsTctzN2a61Z6t0avLaQPxoGhl557vBZItt/545BsQ==
X-Received: by 10.157.52.215 with SMTP id t23mr5204827otd.54.1515693406274;
	Thu, 11 Jan 2018 09:56:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 09:56:25 -0800 (PST)
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 17:56:25 +0000
Message-ID: <CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-devel] [RFC 00/23] target/arm: decode generator and
 initial sve patches
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
X-TUID: O38ral2sxBf2

On 18 December 2017 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The most important part here, for review, is the first patch.
>
> I add a code generator, writen in python, which takes an input file
> that describes the opcode bits and field bits of the instructions,
> and outputs a function that does all of the decoding.
>
> The subsequent patches begin to add SVE support and also demonstrate
> how I envision how both the decoder and the tcg host vector support
> are to be used.  Thus, review of the direction would be appreciated
> before there are another 100 patches along the same style.

This doesn't apply to master -- do you have an example of
what the generated code comes out like?

thanks
-- PMM
