Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4005412wrt;
        Fri, 30 Nov 2018 12:44:52 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WqtJLvUdl/D/35YhRrRwV/JqczZ5BA1QgyU4SKixb/k+8lQQzRXKr5uUktSlZKfX15hFRt
X-Received: by 2002:a0d:e203:: with SMTP id l3mr7233055ywe.242.1543610692085;
        Fri, 30 Nov 2018 12:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543610692; cv=none;
        d=google.com; s=arc-20160816;
        b=QycEkVjw93xcluaohyZ4MYwdjo4ILVcD39KU/sz27wSmPTwEIR1nR2JL6oyP/GIl3Q
         78ImmryAMuaKfW2qNqk7OxYF4QKmCHqS+y30FHdZ4Uj/Cz0/atxGAyw24lRYknD8N5Lo
         Hl+DbOSvWwZ1CE4UwbW/FElOJIW4RdMjZA46eFoUrBoADEDfGXXAmfh3soNlBZtI79Ew
         7ZseeirnwQfSIX6Z2fe0dl7SXochTVYv011Y32Aey5t7Orkk2dE818FOrMFzSpXbttLP
         rHK4Y9Znb/8Tv3K9U7riqsc9aaLcA01y0MDSk80vKJ2UfXknFH+PsvFRAickqn39O7nN
         twQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=sqEVVvKdZN8MC42QmUb1k4hHNGkPKCwrE4WEfWAbC+g=;
        b=buM1uaZXiSwyvb39deDTwIn9NNdZ+VgFN2jCCfUajAEvVlLXzLnDSAp8l9f3KI8T0V
         7rCwpmSdvSJVdHFa0UqHYWFovkqzrMZp0ufVjzExCNGreD2Gin0iaHQGdRi8Vawwhf2+
         /DyNRuvfzvVvVbfxhPffu0snYv0V5OWlA8FhWEoWM10y9cXE6Mps3wQ62oyOH8HsB9FR
         kYviWdrLaQF1z8VHNn8qrnGMWooFxyPKePHz5MHTl3aF9iWuJ2S6Hw10czB4WJhBr+JM
         YesSv9kl8KJi2JGnXnKwNaHiNy6MDsJFyF3v6aD/fM0uqPDzRQPbIgM0OgVhEkbfrCz4
         4LHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ijatuwIn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s203si3819099yws.274.2018.11.30.12.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 12:44:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ijatuwIn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSpec-0000by-W5
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 15:44:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSpdb-0000KJ-LN
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 15:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSpdW-0007h9-Df
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 15:43:47 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gSpdW-0007Y0-4D
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 15:43:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id e5so3354216plb.5
	for <qemu-devel@nongnu.org>; Fri, 30 Nov 2018 12:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sqEVVvKdZN8MC42QmUb1k4hHNGkPKCwrE4WEfWAbC+g=;
	b=ijatuwInj3y8vIdeUhW18bKrkN6Sj1dercdqpRUYYJkeqr4uuV581yZQ6KWtfa5fa7
	G4P8+BhxmWMuhbRemsg68CvvxGCQwi4nRDYKMy6bLxv7kNgVBOE3K0wIq5HBdbFzQmts
	f7qM39sljWQh7SFrj7w8o6NnhoSf/9MZEFMGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sqEVVvKdZN8MC42QmUb1k4hHNGkPKCwrE4WEfWAbC+g=;
	b=DY5FclxwdcAHSI9C6mcDZHyU/HZSuhKShBZuPLG6rwoaNxvI9Y5Txjhh5MlOoSZJ3/
	WEypoi0eUxqVPpHxgz50X89ASO4XcG5W3ajOQ2VXBHDg9TWHqFMYzV9po0HjbCHGQ+24
	cqJcQACsbCqHB5v2cBke3qp912+TFGQ76xA5tbOfBjS37KK+d0DVRgAESz9tgLIhTdtR
	2SuEiV1BNPGs/GpRxq6h8j96V/gGHUt7mGuTaDZ1gdPKIjH8fAjYBi9zlgQOCLBAU+U7
	wed21vLXUHLVZ0mme8yAzDgm3hAh9V39yIs+Cz3T0HNu5AUm27AiCyvrag26paYvLltM
	wh4A==
X-Gm-Message-State: AA+aEWYHc0SlQgtuLTv3GuoAvAAvo/6xJOXMfJ7J8YGb5khCZnFhuijd
	0YAMaKbypGKHr99KsWDcxbX7Vg==
X-Received: by 2002:a17:902:9a07:: with SMTP id
	v7mr6877398plp.247.1543610617731; 
	Fri, 30 Nov 2018 12:43:37 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	d69sm7794653pfg.168.2018.11.30.12.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 12:43:36 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-14-aaron@os.amperecomputing.com>
	<d6fde9c7-b72e-ae9d-817b-71c3d6369dbc@linaro.org>
	<20181130175629.GB24714@quinoa.localdomain>
	<fb2e45b2-463d-aefe-e3d7-f3027f662c12@linaro.org>
	<20181130195742.GC24714@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <65ffd1f3-2ebd-30bb-b777-c0995e5add54@linaro.org>
Date: Fri, 30 Nov 2018 12:43:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181130195742.GC24714@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::629
Subject: Re: [Qemu-devel] [PATCH v8 13/13] target/arm: Send interrupts on
 PMU counter overflow
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	SM-Aaron Lindsay <alindsay@os.amperecomputing.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TAe3Zw65aXzQ

On 11/30/18 11:57 AM, Aaron Lindsay wrote:
>> Eh?  But we've set overflow_mask based on PMCR.LC, so what you say here doesn't
>> make sense.
> 
> Sorry, I had an off-by-one-bit think-o I couldn't get past until I
> started typing a concrete example to explain myself. I'll change this
> line to be:
> 
> if (!(env->cp15.c9_pmcr & PMCRLC))
> 	new_pmccntr &= 0xffffffff;

Ah, much better.  Thanks.


r~
