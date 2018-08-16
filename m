Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2053773wru;
        Thu, 16 Aug 2018 09:36:18 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwUJXSgc1Wn/xY1yKS3bQs1H8/7z3YcPZ175fjfevkc/NlvJN/SEMXq3EQj46clEQ+7T6vk
X-Received: by 2002:a0c:ada8:: with SMTP id w37-v6mr27539067qvc.107.1534437378043;
        Thu, 16 Aug 2018 09:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534437378; cv=none;
        d=google.com; s=arc-20160816;
        b=r2FRO2NZidpHEoQEc+9dy/snabICohtpj6hNCpmvpuT5GziXl2fO8NR958KjCmQYV6
         5DYqpCiM8oLosqFn10yHXOOl12m0tPzhty/9WyZixO0PMCvDf2cJofDexr49JjGWnbMZ
         R5L836Q+3v557exmr6Ym+wWMrgIL4p7l3S/26Y7RVcCeTbVk5NLobgdrTooXTAkLnt/v
         PGsr7vd8LQVh6RZ3GIl/ITbn40rAQv6qwygrGrGKhaNoq6Ooclb7iyrZ69VZTHAm9zG+
         PJKAYX3RGBsb4o0y+5NRTZmQv9Vm0KaAL9kJ/7nMXt3QviFMFBEV6fNz9wZgoRu798kt
         DLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=OmRCjLvY4ewb3fhyAO9Bon388TnELpREdYLBODQYP+M=;
        b=AgWUZgs2TcKgShKM2APyQHVLA3Rfgj/eTjZrpaH2Z6TebkCQZbNrtwFm7x2zV+bTNk
         Fa9ad5O7X3pWTUFDBQiGOoVAIIqdrxAdCVXBBoQiN2f8WhalxT90mkkZSkdqfp1J89Fd
         Q5vPT6h/9aJ85ojnLcc86H52v8X2DK23rzYGo7suy1DqquiOs699KurjkQLdmshnnyPm
         8VdPB1y2QElzxRrv/AK8kvGvk/RLZwr8mnfdlOBoLbnn0JjOYp4LlLWjEVgfp9dlQ62X
         DZFIp5I785bZGCat0sllg6lrkRq6vE2In3MPaCZ86SahfLFanzfV0MkE1HRBbBE6Cfnf
         4iVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeGIn91w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v52-v6si10731720qvj.5.2018.08.16.09.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeGIn91w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLFx-0006dp-GZ
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fqKAX-00059F-2H
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fqKAP-0008CH-5d
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:26:34 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fqKAO-0008Ae-Fa
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:26:28 -0400
Received: by mail-pg1-x542.google.com with SMTP id k3-v6so2221019pgq.5
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 08:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OmRCjLvY4ewb3fhyAO9Bon388TnELpREdYLBODQYP+M=;
	b=YeGIn91wwS4z1LnwEmsBJpyCwm/mA4KeBhUl7tlZAfuP6Xi25N8nYaQvgGhfLnGU/A
	WEkPwowFRZwf2iNNe7zsrmOVWBotruRg9u/TxQpq8ikeB7RV4sA2zoEAWAXDjKTm0qQr
	Uq5rQZdBTuDZlcx1DzfJlDFRD/H2uiBXqkHmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OmRCjLvY4ewb3fhyAO9Bon388TnELpREdYLBODQYP+M=;
	b=pJS7hrAID8zTDFqWpFXzpYSeyu61ItqK8y3VaZGurRLrkH9/qg7P8K6o4nQLo7aGTK
	5J0czEa14TEgjJsc/bnNpQa3bh7nBtElpmDpHNpEx+K9SQ1KRLuB3GlL7EB9nlRjhdM8
	yxK6/ANp/bowQ2hhz7rTZdY0eCz/eZjcspoaq92v992E4FPlhIiQYeVhu42wQ+iIrqo5
	+afk159VbYreBFaIbU3cIf1CIMQYH0Yd6JWGZAVzolvY0+KQd+HPxNxA9xaoHdV7wRBy
	gIUiCF4FjAX3aYaU+sYULkVb/CR8DGAi6f7yoVV5tmwz4yp25YH/ltvx1hGjexLgM6xL
	SUgw==
X-Gm-Message-State: AOUpUlFlWpjTjRKlOQRRYk1pg4FFhZqSVEmjfWuMNzSkIJHp/sKOzkog
	89njxkOgHciQI7S0CqHHe9ytOg==
X-Received: by 2002:a62:f909:: with SMTP id
	o9-v6mr33069735pfh.141.1534433185092; 
	Thu, 16 Aug 2018 08:26:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	q7-v6sm7295746pfq.43.2018.08.16.08.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 08:26:24 -0700 (PDT)
To: Roman Kapl <rka@sysgo.com>
References: <20180816120533.6587-1-rka@sysgo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c7635af2-963f-6887-9042-7843655dc7a7@linaro.org>
Date: Thu, 16 Aug 2018 08:26:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180816120533.6587-1-rka@sysgo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target/arm: crash on
 conditional instr in it block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: djWiN4rz11+A

On 08/16/2018 05:05 AM, Roman Kapl wrote:
> If an instruction is conditional (like CBZ) and it is executed conditionally
> (using the ITx instruction), a jump to undefined label is generated.
> CBZ in IT block is an unpredictable behavior, and honouring the condition code
> is allowed by the spec in this case (constrained unpredictable, ARMv8, section
> K1.1.7).
> 
> Fix the 'skip on condtion' code to create a new label only if it does not
> already exist. Previously multiple labels were created, but only the last one of
> them was set.
> 
> Signed-off-by: Roman Kapl <rka@sysgo.com>
> ---
> v1 -> v2
>  Split arm_conditional_skip into arm_gen_condlabel and arm_skip_unless to
>  a) cover all usages
>  b) do not force callers to ^1 the condition
> 
>  Add note about CBZ in IT block to the commit message.
> 
>  target/arm/translate.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
