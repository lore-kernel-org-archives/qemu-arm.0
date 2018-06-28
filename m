Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7588631wrq;
        Thu, 28 Jun 2018 08:58:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9U6Kz3bGPSPZWvOCoRACxXky42JuMBjxwXmRRcYoqS9wOn/QauOlfNji2CFfprLRv7CeI
X-Received: by 2002:a37:7644:: with SMTP id r65-v6mr9268765qkc.326.1530201518636;
        Thu, 28 Jun 2018 08:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530201518; cv=none;
        d=google.com; s=arc-20160816;
        b=kSiZhZrb5o9mVtnPy4D1h9LkRGXiVd3XlYhy5XGwp5EGF4l3Klu5CHuTFdpzO9oZV4
         MipDo41AYTc3/5WeCefvNMGX6X/HTc2jpKRnAcswqVCMLwvY5zDHjOcO3kAqIvx1ZErZ
         aSg2UQK9JZ1m4LnrbULqjATSCBRlOrRw3maNz2djORTny/9s9279TFesVPqDGdTH0Al6
         swa6W0cZWmpgtN/3U7Dp1iIf/e6p2RYp7cEiS/AsUiIProP73SQSmM2iDDvYNqwW1JZB
         eNoipGMRMDiNxvUy4Un9ByNaHt1J26UQnubXw9H/we7Ghhei6DNU5XuBHqo413VJP3fX
         E7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=8LEsrpxW1pGQ5bicC8ygQnYcdFb5hhgNjTe6kgcb2LQ=;
        b=rStVaiYnz2tqV3k9o3+pqaoXN85JtVwVdzty9ZgiCa8GaWQuLYpOdPB2s2Nz4yPs52
         lLoswF9nViXt68lNnsp02bCnpapwfrl/pD/whQfkrEwAJ3a5bTkxmavzkENMS/nMS73x
         k7UI8Bvs1H8/KxtK6DXhtNo2QsRdsiZgr00wwQeC7f7MWPEz7pygU9IoE2bhpcv5bqnC
         Yw7SmCu57GkFC4vfiL2icTOEEE1qhJXWE36FPQ+bOIIIq/+SdgsqjWH1llEX0bzDHnCR
         HWv5d0ay8Q/rJGt7zlncjE5cay4wWCMPmYHmG5V2kMJ1QWxkzKAa8ZmCSv2dN5+jv8ut
         lKTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZ85vP51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i35-v6si279881qvc.125.2018.06.28.08.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 08:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZ85vP51;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZJe-0000bZ-6u
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 11:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYZIS-0008Bk-GQ
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 11:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYZIN-0002wn-UQ
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 11:57:24 -0400
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:40422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYZIN-0002wG-OP
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 11:57:19 -0400
Received: by mail-pg0-x234.google.com with SMTP id w8-v6so2658286pgp.7
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8LEsrpxW1pGQ5bicC8ygQnYcdFb5hhgNjTe6kgcb2LQ=;
	b=aZ85vP513cTJOFNffR2HbkqMMLb8gDPSU1S0uicRYqT4g0xUO0yZNaZCXDIt9Hqfzh
	DILg1l04+nC81xrR+hzznDxcKdFwwqpm4LtehNSQTHZVObjUBGCPc5+EXbb9bXGz8lQP
	k2oAKYYMmG4LfaECzch+BVz1Ze8XXHFTCeIN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8LEsrpxW1pGQ5bicC8ygQnYcdFb5hhgNjTe6kgcb2LQ=;
	b=UXSLkhnsMRDdxQhusZ+9OFzMojW91TNcTxaH8ujLWsRHy8yLuRkqvJw06bYmYGoSD3
	wEvqPjDGclFy97fJE7V44cOWMWgYZ+uFFkdB8blWJt3yBolb6KjeHxti6ZC4T3nkYh9Z
	A508QLkbYfN8dCEDXchwNHsSUUHEVVs4SAdtcFmOXqLC24DRFbuogFz+humtdylADAvh
	IFtlzmv2Qe+I3/gdVWF1ipt6KRdEoUxcBdR+x4b7zxw1PYUGqZRv3v+mVdOfFlG7TNm8
	NjekHGJX3nzKVnaipGKpXPKvuwUx+5/wTjuPtf00Uemdvl+7fon6s4qlp9hvsFv9+fiu
	7rhw==
X-Gm-Message-State: APt69E1leiwHdsjkn1nJLoyzQmhn8Mf6Lc1NSzyKXPqNe3Z4DocbxQIB
	PWiAMAe+Ez70vXGHzzNY0dM1odNyo3Y=
X-Received: by 2002:a65:6616:: with SMTP id
	w22-v6mr9352677pgv.332.1530201438210; 
	Thu, 28 Jun 2018 08:57:18 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	v13-v6sm16243977pfa.131.2018.06.28.08.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 08:57:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-34-richard.henderson@linaro.org>
	<CAFEAcA_ZfQ1y0=sWBqLGSbd5qoBvhSthUy_udDi-aE5U66DLLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8c0706a5-6601-9945-9312-c3a0775c3d83@linaro.org>
Date: Thu, 28 Jun 2018 08:57:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZfQ1y0=sWBqLGSbd5qoBvhSthUy_udDi-aE5U66DLLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot
 product (indexed)
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
X-TUID: SPyF+rwlxSx6

On 06/28/2018 06:07 AM, Peter Maydell wrote:
>>  # SVE integer dot product (unpredicated)
>> -DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
>> +DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 ra=%reg_movprfx
> 
> Shouldn't this have been in a different patch ?

Dammit, you pointed this out last time and I missed it
when going back through all of the nits.

Do you want me to re-spin all or part of the patch set?


r~
