Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3345713wrt;
        Sun, 14 Oct 2018 09:34:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61N2/akm0lXRypbYF+Y14WuGpiVHcALtDQM83aXxaCPYjuEXFD16WLnLqfBSKPCbvym5XsR
X-Received: by 2002:ac8:3397:: with SMTP id c23-v6mr13065520qtb.190.1539534865633;
        Sun, 14 Oct 2018 09:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539534865; cv=none;
        d=google.com; s=arc-20160816;
        b=t1ISsujzVnAXRHA8R6QfgPescyRtvjHXM/1h3+e7jVfZud1ljzeJqGnz8vEMhVJBD/
         HQt8vlIUB/mIUS/lhudpYdZXW44Mzyeb07zM0Ix9YPRCBe6WvyB35Tqh6e1LjgH5popg
         ANX4gsD4gT4gBjZXc/ddUlZBBx3AUC7UZJo5U08R+SFyART/QapdVbIDNSyPorh++Bu3
         fCBffQi6f8MNxVUhZjJsptyxqDCOhsWLoTEmFwc6jj4vRDKzPwWaSReGfLYt0h+/HBVl
         EaS2FTVgTNGWcZMVc6H82EIv4NkuAclWYOOjt7ro2shahSPSaHTOpJnJrjAl+AR9tu01
         qo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=jPtXXWHC27Ju4Xsd1t56R4TAS5KCeYlfRLGlDWiww0Y=;
        b=J+cjcHpZ7IcLOwH7e+ijn7Vph0zM2sqVGyRA1bazDngP0FMzgRME9xFO+qKAIAMbXZ
         vCFC1efUG+MXGG6xLBzudca0PX5ZEDzgxWzjCAhDN2HQN9b6Mwmg7GMzQeh8bpgyMTpr
         vsGFBKbKPBSj2YXWmjH3DKXdsbFFMMH3HyUIa+Y/qzE+TXqAM4yeNoJqxLiHU+evsKtI
         dDZRdpE7xYx4LzLakngLyvTDL6o1UwvuQq/TZCMs8YVm0LK0qIALI+8PtNmaZQhLFQYE
         wi4o6XBuLOgaQBcc7pmJUA9pi6jWYr+pfTVx+Vp9Jw8bRNZoeqpoAMpHv00dWTlV608K
         RMBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d/a0zmGt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si6481222qkg.75.2018.10.14.09.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Oct 2018 09:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="d/a0zmGt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBjLV-0005pq-5X
	for alex.bennee@linaro.org; Sun, 14 Oct 2018 12:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBjLI-0005oa-R3
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBjLF-0001X1-I5
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:34:12 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gBjLF-0001Wd-32
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:34:09 -0400
Received: by mail-pf1-x443.google.com with SMTP id c25-v6so8469223pfe.6
	for <qemu-arm@nongnu.org>; Sun, 14 Oct 2018 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jPtXXWHC27Ju4Xsd1t56R4TAS5KCeYlfRLGlDWiww0Y=;
	b=d/a0zmGtWSPfe1INULyjzS+5HysPPK5BPcwOim5bifyhqpaZfJqRpJrIa9BVOlLDK5
	AgmluLiKVv/flMin9nRV/uC6eZZmJdvTml4vlXvv8JSWnc8sBDqT+V4eFDYbgg7NTSGf
	WOWpf8zDRTNqqEadzMwOXG0DGZP9wn6TZLrew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jPtXXWHC27Ju4Xsd1t56R4TAS5KCeYlfRLGlDWiww0Y=;
	b=tt/1lfLquzTLln1f6cTmx/A842pDO4gaXm2k8uXWokClkMEWdBvl/1apy5oDEPAmlV
	CQace5SKbOGTUc12cuChLFaHyCSbu3/Ko/hn7qoAlrkU92NloS3cQOaul3mA7DfpoAtu
	1nZVUpnhNS16ZFyJArcw6B1bkI+cELYounp7TrYH9ZX6Ncqn1cQ5JwxRkPTJEdGup0z5
	/yicQotBN8/DYxTh0bqseyX3k/VUJbhqgZDN0K9ESrVe5ZrEl19XDh9feQbfZ3Zl5A+G
	lR3FEUgxxoT9Ck/mnc5IiLBPCCMkfT8y8oSRx+mGgpoeE1E325VuNeFP004q4XiGf5De
	/0QA==
X-Gm-Message-State: ABuFfoiTf52RY2Wsfttq41K+UxDoNwkOOrmZMnd5lCvQtLPOF0wyvfTu
	O9e9amN2RqJ/IiGaI2c6QcYBLw==
X-Received: by 2002:a62:48ce:: with SMTP id
	q75-v6mr14413089pfi.22.1539534847980; 
	Sun, 14 Oct 2018 09:34:07 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	l197-v6sm9621350pga.9.2018.10.14.09.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 09:34:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <83ef9f62-ccd5-f142-ea8d-ac5ca9904a60@linaro.org>
Date: Sun, 14 Oct 2018 09:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/10] target/arm: ISR_EL1 bits
 track virtual interrupts if IMO/FMO set
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
X-TUID: 8+qhC90TTYgO

On 10/12/18 7:42 AM, Peter Maydell wrote:
> The A/I/F bits in ISR_EL1 should track the virtual interrupt
> status, not the physical interrupt status, if the associated
> HCR_EL2.AMO/IMO/FMO bit is set. Implement this, rather than
> always showing the physical interrupt status.
> 
> We don't currently implement anything to do with external
> aborts, so this applies only to the I and F bits (though it
> ought to be possible for the outer guest to present a virtual
> external abort to the inner guest, even if QEMU doesn't
> emulate physical external aborts, so there is missing
> functionality in this area).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

