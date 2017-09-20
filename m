Received: by 10.223.172.38 with SMTP id v35csp971370wrc;
        Wed, 20 Sep 2017 10:43:31 -0700 (PDT)
X-Received: by 10.55.43.226 with SMTP id r95mr8402820qkr.0.1505929411823;
        Wed, 20 Sep 2017 10:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505929411; cv=none;
        d=google.com; s=arc-20160816;
        b=fWPy7/K7lJE8YSSnIhp8YMsRfgqktBa1BayYSYA3xNEPoRmeZbqzNk/BjwPRBgroLd
         CxPHLnY3u9Cr2PT5UXHUAGmMxXNf9DxZ4Wp49u1Fo2nQLy3aJUl6cbXkNY2b4tq6yAHS
         Gj1Xh4a24Q677rBb2TJObkXAhqOlbKck/uPF+yg+Rh0XV7e/NfOmPHpefkttd7H8TCSq
         TkGZVjIlJFrCZpT/kr8rBAryVREKBSkonq1hVoarM4GAGO+5WlizQeM1OuEGizr9ReTS
         6BewRtBScBFONpbyL/LY7Pr5EyZ6OIhUzgBYUakHnQs744Cpuu0AupB/k+ZUw/ZWt79Y
         1tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=YzrACmhzv5TPJfb7T/MIOtgDagA2VBR65Nl3tjLdc14=;
        b=Wej9YEFXJpZJAW3g+VVwnPbnaLuFtFzi2+0OB7G69wRE+fDOuTnYSTEoJs+dthNU29
         AG13LPGXo8ESe3Bl4AWaDBaiE93tsHTScbpGz374QLb2I9fzatABzvJYKeRFE29e5XeD
         eJf+mZCaAbYX66vxnDAAnjUYNQjA9F71n73aJdq/zZH5aNwzE57fev8vDwQUJyHgI2IC
         nK5DumAAtZxLl7mWDpJr9ylKjTpFCkxjYBS7+3HDPdLic/Ol2wPuwntqS0nPePtuHpmc
         P1rqXVSVgJ0iquWAdTX1DHmr9eYt2WHPwmwY4mQGCXv5vtmy1CtscxZ9y/jiprjgHY/Q
         i0pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kw8G6aqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o28si2259087qtk.83.2017.09.20.10.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 10:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kw8G6aqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duj21-0002bn-IC
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 13:43:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duj1s-0002ba-Vb
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duj1o-0002D0-4M
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:43:21 -0400
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236]:48485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duj1n-0002Cj-UW
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:43:16 -0400
Received: by mail-io0-x236.google.com with SMTP id n69so5315444ioi.5
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YzrACmhzv5TPJfb7T/MIOtgDagA2VBR65Nl3tjLdc14=;
	b=Kw8G6aqIoG5DCy4Uc6sQZIzIB9iFCOV0VZxEYP/OChPkxd3z9vtq+Hr1qwsmcuiopA
	+l1coDz0vh+phQKn1i+U7q2zdnUfnozNYLBJE6ezlKncFRiTvUN1WMCJtENZJyj8mLrd
	TnUF2cvvX5H7Wy7pjNNe6G6BA2Bx2jaddGd9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YzrACmhzv5TPJfb7T/MIOtgDagA2VBR65Nl3tjLdc14=;
	b=IRXd1AEqLucY0WyShPGGdZzuly+J5rQrvnsoXbSFPYlIitgMfHbmtoM8wbilsthJ47
	cvKFKMc0r2b6WusTMM7F7ZxFNMECvjQMyZp29/epJCNP7nXzYyiySrGeuWmVHelqE5yy
	MQtikqWeK5hu332rQz2bvDU2W/BllYz+poRxFIAtriRl8P2FEPGGfFz3RMAJhhsLgW42
	ziCwzON2ekqIRZajcntYqjRHtBczjGnUYc5012W4SQUGdYrg6q5i8emo0XnprzD8mkon
	c1cm1qOU+lTnHkSekqvW1be7ibBA8AIM893QUR2o9GqpeW3TfnBTLtlg1pkuQN5j++kr
	5fCQ==
X-Gm-Message-State: AHPjjUjmp4zjPMRqrDhrGiRNYkEecl9teaAG54LnhZDbhl8Hs4Ik82gQ
	yG6aLkX7Bi/9jdm4+q7PiI44pw==
X-Google-Smtp-Source: AOwi7QCgIOoIx1iC5QVlviGWnBT6lV4Mxh8SZHlyN8NfnobuLu8sOI8ntH503I7pmM3k8zyTU3Y0jA==
X-Received: by 10.202.239.138 with SMTP id n132mr6517875oih.301.1505929395130; 
	Wed, 20 Sep 2017 10:43:15 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	x14sm1822784oif.41.2017.09.20.10.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 10:43:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-18-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4721f0f-5018-7fe2-3751-588b35db5bec@linaro.org>
Date: Wed, 20 Sep 2017 12:43:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-18-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/19] nvic: Make ICSR banked
 for v8M
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
X-TUID: vMSGmMo4TtPi

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> The ICSR NVIC register is banked for v8M. This doesn't
> require any new state, but it does mean that some bits
> are controlled by BFHNFNMINS and some bits must work
> with the correct banked exception. There is also a new
> in v8M PENDNMICLR bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 45 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

