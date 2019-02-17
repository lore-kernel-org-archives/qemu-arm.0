Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1515396wrx;
        Sun, 17 Feb 2019 09:52:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY+UHb2EwAovv27mdTxYs+VQauvWsi5gXc27dWWqSZnXWNwND0O6tYdVuFAB9Ghbe1c+/oQ
X-Received: by 2002:a81:4c8:: with SMTP id 191mr15239493ywe.322.1550425935392;
        Sun, 17 Feb 2019 09:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550425935; cv=none;
        d=google.com; s=arc-20160816;
        b=inHfP/+TVL9rDBtj9gTxHbdWCvutF3LQpyjO1wSCmEgTjNgzOYurBNFJUTcgt5Dqde
         dPMceS4mINAI1rlirQPjuhsM6Fw2CkO2FbtAGMCKPqW2d+1s3EJUnvvF21j3Q1Fu3i5P
         hflGra2cPZsnw6lFeypm3cXjAvjySg7ssMKTD6wIW0qL2736SPK03DcZZSCiTAi8T6Je
         mD9NXewmA657hkuerDNS/t1XqhJRFIIMwXae3a/ssW4nlVkdhjK4d4LFHO82Q/DAnFuA
         eOOwLuElb0j4h7j/2pi6S3naCLS1yShvEV+Mm8dW0VwqJVnLkdvgAmuS1MIgyYAzuhTp
         2DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Z5vlBkm0Mt48ePOrL84AYEUy6iViJp2bI+si/fbEpI0=;
        b=oZTk0YYGx4lTbmNeBR5znMEsfoAX1CzUZLgNhcL/c9uBfJnwAoRxEKFtIa0nZ5TtPX
         2rat0m11kxEcO38kTFxQmNSWEHPNdip5AdpmryRV3EWi+Fj0d7Sc+mFwZkLzRbrtbWKe
         STFqPO6NpR/PX+ccoA1dJBJLHVT48iPJ3IPgjuuYmvnJWgFlX5KB3Mcy+EZSOohSqTPQ
         B82nYhgtoiCmuV3H/iTgHRXd9v35EotBVHdiLqNC4JgOJUQhZjsn1kxqSQeV54HdFuM7
         JxrM626ObEuQgA8ZpTLeDvlohVFkPC058+cTb3Uo6IN8ivC/d755e42AuO7wXTqrx1nn
         4TSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qn2lsZjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q65si6465970ywd.45.2019.02.17.09.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qn2lsZjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQbu-000466-Tt
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQbl-00045l-VB
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:52:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQbl-0005j3-8C
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:52:05 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQbk-0005hs-VO
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:52:05 -0500
Received: by mail-pg1-x542.google.com with SMTP id r11so7258486pgp.6
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Z5vlBkm0Mt48ePOrL84AYEUy6iViJp2bI+si/fbEpI0=;
	b=qn2lsZjAxzhNFqh7dPszUfliFAt3pR/lDTe0Y6QYfyumCNah7AM67gzg3hrsAK2Hxn
	DIHt2ynoQl/p1SPyCs5wZl+9eY6BRZNBeu2FSjkU+zu5490YeJpKI36DxVVf8Uc1/bVR
	cBs8WP1WnXvqcRTVhViagZJCMixf45Au2BKw42Znol8RZ76yXBGaZaxqoVBCClVPinlo
	x4/uqBWC/iiDPyCWqCjX6MbgQR6GYN/aVi8N0AqZ7S41HyMjY6uhRkHO76nN3g981Trs
	ZnYSG3wFmZl21kN4klXQtS0v13+OJgtkc05V4b1/KndJIrol9SsqvnfO/2MbSEvGrFWS
	kfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z5vlBkm0Mt48ePOrL84AYEUy6iViJp2bI+si/fbEpI0=;
	b=swXnTPONkF/qK0fShpgbtrkcDFuzIVuluNbS8MlBZv1HnWKDxLKGUbfxPkVclt+7aP
	7XqIoo6jWLaimBky9CgVVtPpV0fsiRsTH+8Pjr94mo8HeONfMylPlnjyDlE1yhI2Dnyy
	+foPu/Rb6vCQO2xpOMKm3yugMBjfQClfDMIqTiu8R9JgM/HimR1aJylbmh6T+ZtFD6TA
	vMJpWYoHOfGbOBbPaChSBq+20nBBwWIy+HSYEpT6/7Q0uqaF115KOm11t1VCA8gD3L32
	VOpbqXC0L8uEn0oCJhu9E1eCO2A6ltg+qZZ/qsHmFAlSkvZ+ZUUqTIwRTWJo3XOeVTb/
	7TJQ==
X-Gm-Message-State: AHQUAuZYWbslz+I5wnSCUp14fVyCt8/AAw8f5Zq0fQk/T1DVvRR8UeMH
	Y+KGrsXa55spHoD25w/D4ohgbQ==
X-Received: by 2002:a65:608d:: with SMTP id t13mr15333502pgu.129.1550425923857;
	Sun, 17 Feb 2019 09:52:03 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	o85sm23484386pfi.105.2019.02.17.09.52.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:52:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <778d340e-7b6f-8cb1-0ab8-37e19d1ff158@linaro.org>
Date: Sun, 17 Feb 2019 09:51:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/14] hw/misc/tz-ppc: Support
 having unused ports in the middle of the range
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
X-TUID: zJzl7gokPSvO

On 2/14/19 4:50 AM, Peter Maydell wrote:
> The Peripheral Protection Controller's handling of unused ports
> is that if there is nothing connected to the port's downstream
> then it does not create the sysbus MMIO region for the upstream
> end of the port. This results in odd behaviour when there is
> an unused port in the middle of the range: since sysbus MMIO
> regions are implicitly consecutively allocated, any used ports
> above the unused ones end up with sysbus MMIO region numbers
> that don't match the port number.
> 
> Avoid this numbering mismatch by creating dummy MMIO regions
> for the unused ports. This doesn't change anything for our
> existing boards, which don't have any gaps in the middle of
> the port ranges they use; but it will be needed for the Musca
> board.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/tz-ppc.h |  8 +++++++-
>  hw/misc/tz-ppc.c         | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

