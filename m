Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp214614wme;
        Thu, 17 May 2018 09:56:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrS6nlVb3UFXcf8szVbZE1zRokxDkB84rABkDVFBmWR94dXuCVKt7BmzkVUSrSA+VoItWPU
X-Received: by 2002:ac8:836:: with SMTP id u51-v6mr6123374qth.407.1526576204917;
        Thu, 17 May 2018 09:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526576204; cv=none;
        d=google.com; s=arc-20160816;
        b=rTW1sH7ZS1eMzzNmOS8vRmd87OEugKQTDZfWQFcUIUV/KCe21FZrOwxor9IX1MQgcm
         qY/AH7hEjZTGPPplnhz2x/PW6C1U1RbT7Dc+SqgnKggO/pchxRwboCOFKz+uyr06HLDc
         2lKmClePepM8l9DcYD13ELP9ggKw5GE9iZcJGrg+jGbtna3O3lpA0SrXL1W4bzLcCKiK
         eGjkmF5ByZgHxN+SiDoC17NvTB+CgTT3o4rFTQZv0n/z1WBPDqeJJfkH7nesZWwYa9Th
         OvfLOri+c+o0OXsk3zW2jI0AUKqo6p2dIY+ZfU+LNl4kwZ+NfHutbahE4E8weYCU5xOY
         GgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QhEg5AITdfL1cLRAB+cwU99JSq6BTpceRNzZXfMN514=;
        b=nK2P8F8+vWf6cxLyBoBg42qW8del78B8y8Kmkl5Rw2dNBg/u/Zvxi9EdiC1D/RsqrY
         N1EzXKz5b91+2npdg8zCNjVlG62AinuO3QuK1AvyE2OjtqEmeSTVwYjtfrJ23067AoKv
         ZEVw3ctM3NW1XeJKjzRLMtqZGUTp2YyUkCJU/Cw8WSwI+WuSF2B9UiqGnEEF0ci3yixG
         Z7cgWRenF0rzC2QW6MD4qYPBa0IBZsnnX7D4N8t+yD5MTEsVNpFBOgrpo8a88uS8ZxTC
         0Gnk3JNauuR1j+qlIIApLOCdq5Ucyjxxx64H2T4dGg8tblaO3EozZikfSY5YdY0RpVdZ
         Kr+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FGx+j5YD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20-v6si152742qvb.105.2018.05.17.09.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FGx+j5YD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJMCm-0001Dk-J7
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:56:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJMCb-0001Ch-E6
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJMCa-0000Nc-I5
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:56:29 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJMCa-0000NE-Cq
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:56:28 -0400
Received: by mail-ot0-x242.google.com with SMTP id i5-v6so5856416otf.1
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QhEg5AITdfL1cLRAB+cwU99JSq6BTpceRNzZXfMN514=;
	b=FGx+j5YDakghafACGxytjx0cmu0tRSajmdnRcn6KNnHRcX//TbOJfN2AHpEg6j9n7q
	JR649VjikHNYEfXKtw+pX5Jr9bdlwHxL136XRbNskrhCv5cdgzGcSvbAzNUoQHDOzsJ/
	VtpX03AjMpEgdKWBjwD1SFe8/DsCDXh5zT2rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QhEg5AITdfL1cLRAB+cwU99JSq6BTpceRNzZXfMN514=;
	b=cu8wwogAE77t7Z9E/CI03fly3+1UnY72LBG3b8PeE0tktrixti/t75X4h3ngc55qTz
	ZLAyJpAXk/hYaLCQ7caEhjxnoS6VkM+Er7Qyt87cy96C+Jr85MgQMfRUzCFh4rxXD1Aq
	30fnwc/WNtIOIXrKi44S9ikKyvUaBKj9ZXo6tOf3Fkwd0svDXrW1CaaNRUqbl6X4lkZr
	7GZNr4g6cFOucsywSk4bGAUl5vXfw4yRJho9qvPou0Cid+OEm1Z9j/YvaoqW1p7wh2qf
	eEjgq5IJJwNW2XwkzGSnwFQDqkCq5VmE8ZmYmovYSHyjiZRKZaX1Nq9WECie4il1HYxt
	dyuA==
X-Gm-Message-State: ALKqPwdD/jw+1GD4SDqq7nYWPdlfwD7DSs4OgyninHkDR8I6qHBWd7Ka
	BbV5TKw3vczUw/UEg0AliMxZmYkDX0KfcKM/20w8sQ==
X-Received: by 2002:a9d:2013:: with SMTP id
	n19-v6mr3945350ota.258.1526576187254; 
	Thu, 17 May 2018 09:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 09:56:06
	-0700 (PDT)
In-Reply-To: <f423b535-f3f7-a8ce-8821-8e16f0cbfd38@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-27-richard.henderson@linaro.org>
	<CAFEAcA-Erv++skS73s6_ZCWbo=G6xLaE69wukUKyX3-KyuV=oA@mail.gmail.com>
	<f423b535-f3f7-a8ce-8821-8e16f0cbfd38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 17:56:06 +0100
Message-ID: <CAFEAcA_eXv+-iNXSSM6mE17-fm1=v0RKC92e+NCfeX8DNxcV8A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3-a 26/27] target/arm: Extend vec_reg_offset
 to larger sizes
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
X-TUID: uZIpghNJaTwP

On 17 May 2018 at 17:51, Richard Henderson <richard.henderson@linaro.org> wrote:
> On 05/17/2018 08:57 AM, Peter Maydell wrote:
>> This looks right for element sizes up to 8, but I don't understand
>> how it handles 16 byte elements as the commit message says -- the
>> d[0] and d[1] are the wrong way round and don't form a single
>> 16-byte big-endian value, so they must need special casing somewhere
>> else ?
>
> You're right that it's not a proper int128 for host arithmetic.  Fortunately,
> the only operation we have on 128-bit values, at present, is move.
>
> How better might you word the commit message?

You could add in the comment in the function something like:
"For 32 byte elements, we return an offset of zero. The two halves will
not form a host int128 if the host is bigendian, since they're in
the wrong order. However the only 32 byte operation we have is a move,
so we can ignore this for the moment. More complicated 32 byte operations
would have to special case loading and storing from the zregs array."

thanks
-- PMM
