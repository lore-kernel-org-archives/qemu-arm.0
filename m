Received: by 10.28.4.212 with SMTP id 203csp2150143wme;
        Thu, 3 May 2018 10:19:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp5RHZWCycpIjB8OWTKsjYMBIAjR10EMHkqiMPLQlSHKVTRv7AGCE/cvhryij8AovNTqSPA
X-Received: by 2002:a0c:86ba:: with SMTP id 55-v6mr4388828qvf.234.1525367940720;
        Thu, 03 May 2018 10:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525367940; cv=none;
        d=google.com; s=arc-20160816;
        b=GZA5VjDtteMY2ZozkmJ9qo7cc9CstojZ0PtW/FpK4bDuxjK8Tn8xz6vfz6yH1nst/6
         yeWTbtpyGtSN1JjgDn/EmMMhkJfqVvMKwc4JHhHmFuxi7oCK+lnKkMHcaHB3ttz/cq9D
         SaQ1NShaE8VwnR2ap32J/zzsXX6eBPUtsvZ810OvQlQdWVL6cSN8rpHKweVWfyqjImRK
         umjfWsHsCqxs6UbTiXsln6GDzFpy/t02qO2/QyPNlHWo84i7WtJCsai7nv9abaOMNZoD
         AaMvXJgfV20xZpm4Xy3OIeE1VdVNdDGr/KwGU7hCSX0K3+sOgZCpLQXngnyzUCvKJd7l
         dMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TCXNtirEQxX48v8sG1ODbo9y3ln7oon9mpWePXmGCqw=;
        b=TT5N3FFrGo4wYpYMw61fDf/7mkU0kVVOhZoEKanJ8B4AAePNyPnK4PL+4/4AL1qCm9
         DyTzWLwoPv6GMo1RCGPYfBZ3zQikVj7jdQAJ5kmu6xmhAD9TQrpSp+nFIe2WBZodhBdP
         aqh5argUoO6XgEZkKOfDxhTWo+wDJ8vEjvC7XpvJ06XnDReLot5apRx6YJk6Um32sQNR
         HCXazPdJgihYwoZeHZ+mAUY3dIGeNKWqvq36z96YqNzKpp4z4hZIIaRI6RPwy58fvxdk
         OHMDV3sZmdAqcFvjZNzhe9nLQaQw86Qre1et6wOl98+MB22iHMxPYTah6p7G1nwOTsIP
         30TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DojwsM3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f39-v6si2909493qvd.52.2018.05.03.10.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DojwsM3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEHsh-0003DQ-Gu
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEHsX-0003DF-7A
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEHsU-0005Nt-AF
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:18:49 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:37451)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEHsU-0005NY-4I
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:18:46 -0400
Received: by mail-pg0-x232.google.com with SMTP id a13-v6so13595842pgu.4
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TCXNtirEQxX48v8sG1ODbo9y3ln7oon9mpWePXmGCqw=;
	b=DojwsM3veUiL6jdF0S2MbkfEBmLf+YnASoosggiu4o8SeFkVR6oFH5nZR7TCYmXEri
	u9b4MEg6HVh4GbxFDi29Ud84kb1GL1k8xP6nhknkwx1UBRSVLBot+GkMnz5nzz7P3qIp
	sn8Ct7jkFQEPHjqv6fuSTHAqPv6mXnSQ4Cvu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TCXNtirEQxX48v8sG1ODbo9y3ln7oon9mpWePXmGCqw=;
	b=aCmK8Fk2hT6xbttyAOPx/d3t+/uiAgoAcS8yG095HfYAnY9RL0WERSm5C1lyjupz1f
	z0UeZfzksPGK7JUZgnd0v1PwA9gEXn01mFhB3N1gJDDEdO5d0ifQUdIAXpVnmy7wp7LX
	rDfHbLesTBVispzv3fkDMTnI8oO8bx9DtxlF5QJ7BrvtQRjfAjSd98SY+I2LfsCJiY4S
	v3CgETwR165Qivmosm999eZ/Pk24zrLeDd+AvJDkb/b0n69INDksAtkCzifT33CqXEkK
	gbpM9DEyAPX44ptU4wEYiaUwzXps1SMwCYnikjzxK4sjhwGSw6Hc3sprqpNIqy+Csll1
	3KMQ==
X-Gm-Message-State: ALQs6tC1zXyLZOa/zxLlxiQcT91+zGn5bKDv6zmUf8RN69GowiN9k1vA
	osO+C2xw26+pvFcKdqlyawLkldtR4us=
X-Received: by 2002:a63:41c1:: with SMTP id
	o184-v6mr19846324pga.393.1525367924353; 
	Thu, 03 May 2018 10:18:44 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	x3sm36857695pff.87.2018.05.03.10.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 10:18:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-8-richard.henderson@linaro.org>
	<CAFEAcA9iEoMonBRZ8d1005q71bU6CyKEjorHb2towDNUYvmBaQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c916160c-4443-4f2d-d00e-f19c4b0f9ec9@linaro.org>
Date: Thu, 3 May 2018 10:18:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9iEoMonBRZ8d1005q71bU6CyKEjorHb2towDNUYvmBaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-arm] [PATCH 7/9] target/arm: Fill in disas_ldst_atomic
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
X-TUID: I5Qm5isYVbys

On 05/03/2018 07:14 AM, Peter Maydell wrote:
>> +    /* The tcg atomic primitives are all full barriers.  Therefore we
>> +     * can ignore the Acquire and Release bits of this instruction.
>> +     */
>> +    fn(cpu_reg(s, rt), tcg_rn, tcg_rs, get_mem_index(s),
>> +       s->be_data | size | MO_ALIGN);
> 
> Does this definitely do the arithmetic operation at the datatype
> size and not the _i64 size ? (It makes a difference for example
> with LDEORB if Rs has high bits set: the result should always
> have [31:8] zero.)

Yes.  Also recall that this returns the original data not the result of the
expression.


r~
