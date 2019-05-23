Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1724803wrg;
        Thu, 23 May 2019 06:26:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLPiXZ7eTPoHJ98vLscN38p0RDmfx2YZd0xFHzQ5BrZA/BOKmfohe6HNSBAigzLpPVOtUO
X-Received: by 2002:a50:9858:: with SMTP id h24mr49667523edb.147.1558617965302;
        Thu, 23 May 2019 06:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617965; cv=none;
        d=google.com; s=arc-20160816;
        b=AjR/42o+2oB8KrYvq1yAbFqlZO1VcWMTFuJwdrUk4P4WvOqk8Vf8Od/dv2XxzccXLu
         QZVii2AbAQOi3+M4OaN07P+6DP8PD+R0ovVVITQyThUaqRV/tetqbGaVFq5XKx/I9YC8
         1A2f4d4naC9Fgbgkeru7B9EWrcdAz+SgGJ+lh9wqQfFa/lHXHglBfw//lNF27BU0Jliy
         9Yxa6qirZBh/gpz3XBBU4KuW1QF12S7GTvKBOzhkLWDLb7Rlu8QK22V2Hz/m4dtE32Sy
         p5UmN7FMTOu1+4fgLbQ+aQXFAbrac5tsOxPtjMXo0CvCIHgXw3usSJS+OANo/CjicVOb
         n4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=6KS9d5eT0YUL9nz8APaV1sldA/n7utywrrWd4/ev3xY=;
        b=fkGykbK8pOUQfv6QsyYFzj+N+GDfYMs5fHre1zo7adnEhLQ+f3rRL4w3F52slukvp9
         GTtQC2KhfI4XfMPkoOyQrtoqGORy6WdyM4UtMVXb1VWS2EBwIMvLdNfjCDkyBoxIWein
         X0wAlfwzWp6i6SJu+oCbIorqwYGhWG2RRjMScxNw2h9pTFGA2LkQu9TA+XXu9D0mF1VS
         Wf4k819XAuHy4A5yRaeFDvLSPIgzSlnFA8fLUfRLCaX6d0j4fHlmexqSBorPcwCLoz6h
         RBpgQigSAnHaKBrfFocuvi94P04OwWt+bDy9TMfAStROUZ49gokXXhSHe+UC10p37xW3
         kbjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yydjUWk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si10038401ejc.177.2019.05.23.06.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yydjUWk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnjQ-0004b3-Ai
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:26:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTnaD-0005GZ-Ir
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTna9-0001xE-Q0
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:16:33 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:41410)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTna7-0001vP-Q8
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:16:29 -0400
Received: by mail-ua1-x943.google.com with SMTP id l14so2152033uah.8
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6KS9d5eT0YUL9nz8APaV1sldA/n7utywrrWd4/ev3xY=;
	b=yydjUWk7RE6UHu0YchjMy59fZJv9VG1WnbKXFq6LnFu/6FZzfa+PrkFgX1G9AH0NRp
	jNueNYOoDqY7KYqeHD9k3J13K2F3n7IDE5OJQMvwqS1yW0FMjhUlnj6saIGA01T4T5F5
	ZMt+aEyE8dI2f3DqlyaUbCmnW/FEHTbPRC32eMkjHwdi+ccHOtQXfQk2JZdgIep1QX6K
	oxbka8/f6EuX6T1waXXDRT8Qbn3z2zDFlHSAzOTjookm/D/VZuhlXCNltllmG5i/VASn
	qHfOZPUhcgfN2QOuftgMHIIuoIrs6plkCwFqcypwkd3w7x0bd4YVBZ4YyzhFaX4fXTel
	VfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6KS9d5eT0YUL9nz8APaV1sldA/n7utywrrWd4/ev3xY=;
	b=XLguxHu+xin13mYtSOWUbvSMWdk2keFCiHt94kJEnf4yFcqf2Qv4cXq7Yc+NAvf+xT
	3RotYLD1yAATLnk75MpzMKEJZ/I3WVzH9oVE1jU67tDq4xQvNxcvGMAA9pxl+TvSsHok
	yda9wrUnzJg82HlCEwpOtH9HBEZ2e8qx/9y7UdFrSlVWMKZkRWMur1agQ3208aO0SdkV
	KFeptPK+fVZgMSSzdlerlFbPGJBOmKrBPxD6v81LpmO0iQFkL0O4kR+1tfLUD6/BChbL
	ENgcIgCCfrfBDLJkH3HkvRBLYkBk8PaVYpyHyfhPmnAGQlQKJkC9NnsCkkOXETuvMWbX
	Nrwg==
X-Gm-Message-State: APjAAAVz8UP/HR+cKgSvBA2CKRYqlCgEz7i0gTZ/D2YZitbjz2xN723U
	c8MNeV0y+NWc6jyK7WBzkLO2B7OJRiA=
X-Received: by 2002:ab0:1849:: with SMTP id j9mr191283uag.75.1558617386118;
	Thu, 23 May 2019 06:16:26 -0700 (PDT)
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net.
	[173.130.215.183]) by smtp.gmail.com with ESMTPSA id
	o11sm13113027vkf.13.2019.05.23.06.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 06:16:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
	<CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
	<e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
	<CAFEAcA_1XuWqVu9gonn5_Y9x1V=UcWNHEXtwop2s0qyUbwiZpg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <13d9e22b-4ac5-fb87-622c-a99b5494d06c@linaro.org>
Date: Thu, 23 May 2019 09:16:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_1XuWqVu9gonn5_Y9x1V=UcWNHEXtwop2s0qyUbwiZpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
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
X-TUID: 0BfujS+t5h3n

On 5/23/19 9:08 AM, Peter Maydell wrote:
>> Because the three different instructions perform the same operation with
>> reshuffled register arguments.
> 
> Ah, so they do. Next question, how do I find out what the
> order of arguments in the above code means so I can compare
> it against the pseudocode expression we're implementing?

>>From tcg/README:

* bitsel_vec v0, v1, v2, v3

  Bitwise select, v0 = (v2 & v1) | (v3 & ~v1), across the entire vector.

The "selector" is second, the first input operand.


r~
