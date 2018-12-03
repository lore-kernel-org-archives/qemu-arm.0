Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7363603wrt;
        Mon, 3 Dec 2018 14:58:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/USw8s8GbhsCvQW95celor4uM05/6hHXno+NTupfySqGhrWBZkoxmmgBnvpS35DsaVWPK2N
X-Received: by 2002:a0c:f184:: with SMTP id m4mr17294810qvl.178.1543877926399;
        Mon, 03 Dec 2018 14:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543877926; cv=none;
        d=google.com; s=arc-20160816;
        b=UJOnUqqWxgvshK/ADcvlf9AZGASyYCpLRoxa3T9netn34PX5fHbeJLGeZptgwKAfDs
         1DZuNcOAnLemey+mxjuKIOq2RhVO4R31EDkM+VjWVNO8BRPlEpvONMatNHJkADJ7r+mT
         2FmpoD61ZBhD9ybhhHKWEh/3MhsEE2I5K4XCg0nmGa/ypQL1r6uXveN+omxWSZujUBIa
         oZhzp1TIZFNlsHi66edg8uFCSXTG2D8XIbo3b1uoz3k2D8Wy0OWpNLGq8xCEhg58R1UT
         DPdlG6IiCdKJ503nN8mHflQHmD8RN/lS3yKQ6O7HxPtpmlEh7M+6hmkYYs651Yk+hodK
         DfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FAVsf5BoxYtI/Wlfh1NbbhjOSY51ttLYaHAKy1mJJN8=;
        b=tZBa+oP1XyEnPDgp07qHLaET62tbd0Famhi95c4jifjZby8Inys9fMlFB+kWxa6K4l
         jZLW55uiaXZ6ky1cpNE5wHs0rmDE4EitpvNz8n/7K7px54dMvvqjN90reR4nfGWLv7YZ
         KYE6Aw+vocRntOImmzjVcR4PVISJ2JhFpwlllvSIZ33fsmlJkblxBZmSCtmZPGxMciWb
         U1aoaVwB5oXfsmQ/YjcEyAjoS48m0LoRVrr5c8FM0JJLFfuAROqntCTMf2dPDuY5Raku
         rAjSSX7Wk27HMNVqlEWgaUFWBPFwhChqHNUcX2h+DbKvOUO1Kd7B9lbe2Hy+HH/eSb9D
         7wGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUFpebEL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b91si1045569qkh.51.2018.12.03.14.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 14:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUFpebEL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTxAr-0000Of-Ub
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 17:58:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gTx9O-0006XJ-Eq
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:57:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gTx9J-0000o8-Ra
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:57:14 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gTx9J-0000lm-92
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 17:57:09 -0500
Received: by mail-oi1-x243.google.com with SMTP id h25so12582839oig.1
	for <qemu-arm@nongnu.org>; Mon, 03 Dec 2018 14:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FAVsf5BoxYtI/Wlfh1NbbhjOSY51ttLYaHAKy1mJJN8=;
	b=RUFpebELHX58qHTiH0QIIfom8WLRklMAXzwK0yHyjbGqbVyLEBJqoyMSy9QXJk5aJO
	xUeZKkdpBOZMKdepxI/lgTGVP7EEthwNSTHRyx7ihCiIpbypDAPzfBdSKwMVSegZsTdq
	kKd5xEwzVflDvY+nVLNDpZlvG8WUf7hGhYhR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FAVsf5BoxYtI/Wlfh1NbbhjOSY51ttLYaHAKy1mJJN8=;
	b=T1uXuHUCbU5vA9ZouwOt2s5JowG/1NC6Os8KWu8gXfl2LZqZ8mlOFnahEswFHN528a
	gjFyU/EDzr/Mt603F4UR77FAd7Nh3h+7evG0BjUdc5QLhIawiGYeUcQlvYx/AMdyd8Lx
	sFvLfb/wdFwWdokNHlNnuchkyhpDIqcPGcCDhpfUjHxRvx7Jtvia3NBjKSyoF2qvkdZs
	TZcwaT8pCE/Frt24aNGzL28VXOVFjJRVX5+XnnRgNq7RgKdYBiLkBAgU56BTwMBa7P8v
	ocLjqdm4XK6bkbn+Z7cncsfrowC5W91fQjgXwNeY8xEaRfjqsDyfPANI144+PhiyFw3b
	nFoQ==
X-Gm-Message-State: AA+aEWbc/1sCEh09suwr/kKnbrbX8cwji4xFRjksuXDxiuRaW9msWnAk
	Yd806mCcP8VlH/+wJlsAzdF7+A==
X-Received: by 2002:aca:5bc3:: with SMTP id
	p186mr10709946oib.130.1543877828127; 
	Mon, 03 Dec 2018 14:57:08 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	52sm27575046oti.30.2018.12.03.14.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 14:57:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
	<CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
	<20181203204452.GB5549@quinoa.localdomain>
	<CAFEAcA900U3amGOGRKGNu+-j9EDhdrZ1U1U5MtoW5BeTo74iOQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <05205391-27bf-c6be-bc71-648eee127c47@linaro.org>
Date: Mon, 3 Dec 2018 16:57:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA900U3amGOGRKGNu+-j9EDhdrZ1U1U5MtoW5BeTo74iOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8S+xl4fb0bs

On 12/3/18 4:19 PM, Peter Maydell wrote:
> On Mon, 3 Dec 2018 at 20:45, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>>
>> On Nov 30 16:10, Peter Maydell wrote:
>>> PMCEID2 and PMCEID3 are only defined from ARMv8.1; before that they
>>> are UNDEFINED. So these registers need to be only defined if a
>>> suitable feature bit or ID register field check passes.
>>
>> It looks like we don't currently support any ARMv8.1+ CPUs and don't
>> have an entry in the `arm_features` enum for it. I'll plan to add
>> ARM_FEATURE_V81 and make defining these registers depend on it, assuming
>> any future CPUs supporting it will use that, unless you feel I should do
>> something different.
> 
> I think that the idea going forward is to prefer an ID
> register check of some kind -- Richard ?

Yes.  It would appear that this feature should be controlled by
ID_DFR0.PerfMon.  So,

  if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4)

once the appropriate FIELDs are added to cpu.h.

Since this test is not used within translate*.c, there is no need to move
id_dfr* into ARMISARegisters.  Since these are only aliases, they do not affect
migration, and so do not (yet) need to be filled in by kvm.


r~
