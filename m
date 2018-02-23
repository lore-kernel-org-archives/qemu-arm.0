Received: by 10.28.71.27 with SMTP id u27csp849125wma;
        Fri, 23 Feb 2018 09:26:08 -0800 (PST)
X-Google-Smtp-Source: AG47ELtHyVIo267z1Pewxe/efrJXJ18IJ6xJt2nS6eUcej3tZySTTwSwj26J/mCsHgTQjpcr6Wr+
X-Received: by 2002:a25:acc8:: with SMTP id x8-v6mr1713689ybd.442.1519406768466;
        Fri, 23 Feb 2018 09:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519406768; cv=none;
        d=google.com; s=arc-20160816;
        b=fx3qVTfMFcvSs2wkpQgVsmL3R/8CZKgiwc/QI+jpLGIrrO6e+mlPwvLuewhUXvPet/
         mXqyP48FlDqHpGB57L4u1itsDBKSXhmonhyGdXxQeHrhHhAvcc9mj7fjYwFQhD6joEiE
         yaQNDKX3Rdt1zNzgmgS5bznceiihvTA9RG+nKMphXDkET1S+2EaYAEZZEnw9Pby81aMS
         4neMs+tte/ytRLaLcaP79K6Z0TT/9YM2SJinFS5aU0YzuB6ceZ5Bky4jbT0S6oTAo3AY
         1Ai2PldrQZpCkIAq9ycC4IK/kM7NBzcCLe9bHHiC0z1S7QeiDisSnA7IX/9KDTtkVteC
         sBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=+ETqFEGVd5ukBs3ZjezVt9m3oahT0MifM9DKlan/r3s=;
        b=qIRussQLB01bsPGDJktEPpjFwA87D8w1qBcG6frmLVm2QmTgfeChMDzsv6WacKSZFV
         sF2IG/zMCSXyd+lFSCYpQAm5YskoRG5Ng5uSB0DZadkfLFoZk48Rml5lVq+aT4tc1SmS
         jL3nbP1z6M1OwOVJ19dQBFmLj3Ba+b/+aKitPOYjmXuMJt7ylOZvmYZrBu75HCX9N1+K
         0LmcrcBCV6g6/aoKN0hvosxbKOf8G5pY4zmZIJUdEInjzCQ3awbKKXr7GmDzNxGRFNR8
         FNrHYnosw841471FSM+6Ye0CLUb5hhOfUbkjxYnslKk/ZDd85r0Z9gDRBvgmH2nbO1Nn
         17Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jeOw3qAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s191-v6si483465ybs.796.2018.02.23.09.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jeOw3qAT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epH6l-0000JJ-TN
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:26:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epH6P-000095-Ig
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epH6M-0003br-Qr
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:45 -0500
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:45284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epH6M-0003aQ-M1
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:25:42 -0500
Received: by mail-pf0-x235.google.com with SMTP id j24so3774690pff.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+ETqFEGVd5ukBs3ZjezVt9m3oahT0MifM9DKlan/r3s=;
	b=jeOw3qATt61VevSogvt7SuibgNtV+F8l3FZ65Xe5tjGpDOMwVS4eYXFD66qXSU/1nZ
	hPBTsz9wsDncbsZyindLu74lNa1TPkVO8ZFO2iphw1xMUH7N9YVJpetlo4NOTJcNm/Ha
	zj1duiDok66g9LropLKe0W9sn330kDoQdkFSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+ETqFEGVd5ukBs3ZjezVt9m3oahT0MifM9DKlan/r3s=;
	b=i3cyMl3Qdn9krEru6pJQPv1MMwj3ZxsVyMp5VdPTBcn45GctbNd68j7u7uv/4qRiYr
	IcYs8bPoG+r2lDLA1cpAgbU8B9nEsEiZJ4lpsoPqrAvQO2Oy2dEd/J12vTNexUxQw4li
	u7EzrTNpwDbonouPBMAFCmoOHhEoWzXsETREs40nSm8VSvtkO8fBVGEnbIq+ey/N+u+u
	fHXPdis9Zaxx8ot8B/ybwYns6WTSAlvD2MiRG+w61857Czi6a/KuAOYhFdXyy48XdHSf
	a5tREvhoJAFFATLSm4/ZGiIA4FvHmbW85BlDKM0D/bnabx9AMIUrkgHGeCqTi5pGFaUV
	m6Hg==
X-Gm-Message-State: APf1xPBqrSETMT1aAVtp/pKfaZn/XmGHgVhQPtPYSgao2BSY6118eKi9
	8GB0ZURSKE8JZADcmbD6jwTLy0U5xc4=
X-Received: by 10.99.110.133 with SMTP id j127mr2017145pgc.79.1519406741162;
	Fri, 23 Feb 2018 09:25:41 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	g67sm5142176pgc.60.2018.02.23.09.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 09:25:40 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-15-richard.henderson@linaro.org>
	<CAFEAcA9wa32T_vjH2NVxnsW3jzDw6nwPjMXuAdaBfrAXfCdHEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d778b0e0-fafb-5e39-76e5-054722210c62@linaro.org>
Date: Fri, 23 Feb 2018 09:25:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9wa32T_vjH2NVxnsW3jzDw6nwPjMXuAdaBfrAXfCdHEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 14/67] target/arm: Implement
 SVE Integer Arithmetic - Unary Predicated Group
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
X-TUID: LN7RNwcsh35e

On 02/23/2018 05:08 AM, Peter Maydell wrote:
>> +# SVE unary bit operations (predicated)
>> +# Note esz != 0 for FABS and FNEG.
>> +CLS            00000100 .. 011 000 101 ... ..... .....         @rd_pg_rn
>> +CLZ            00000100 .. 011 001 101 ... ..... .....         @rd_pg_rn
>> +CNT_zpz                00000100 .. 011 010 101 ... ..... .....         @rd_pg_rn
>> +CNOT           00000100 .. 011 011 101 ... ..... .....         @rd_pg_rn
>> +NOT_zpz                00000100 .. 011 110 101 ... ..... .....         @rd_pg_rn
>> +FABS           00000100 .. 011 100 101 ... ..... .....         @rd_pg_rn
>> +FNEG           00000100 .. 011 101 101 ... ..... .....         @rd_pg_rn
> 
> Indentation seems to be a bit skew for the _zpz lines.

There are tabs in here.  I know they're not allowed for C, but this isn't.


r~
