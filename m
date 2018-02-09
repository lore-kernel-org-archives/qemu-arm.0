Received: by 10.28.71.27 with SMTP id u27csp1401877wma;
        Fri, 9 Feb 2018 13:13:41 -0800 (PST)
X-Google-Smtp-Source: AH8x225Fpq2LvtzuFy/pTggMDXNAiobwbcbGmKILImjXZsLHw2Qlb9xvfsrWI8kqzFPpHrcD6w6y
X-Received: by 10.37.9.82 with SMTP id u18mr2804517ybm.288.1518210821734;
        Fri, 09 Feb 2018 13:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518210821; cv=none;
        d=google.com; s=arc-20160816;
        b=IqhiX5BxycSPSvUGtV4PbiB8mAQMipcruexGkC7yTBwqNSsIO3OrNQBQj7Msqcan1L
         0vRJxZV6jdWbO4szFx3lCWMLrgkaGcbrkyN21xDe0FORdiWU8HEsZyROOfVRH8/j5D4y
         jaFhITk3vmWXcf/UcJ8FVlMPRmcOeXsDIhQDySXEdFyX/Pqh3G9OZNOLOV9bM5o8MyBX
         UOSxhS3MPjMDCj0qvVcZwUTrBE6t5XA+jl5xy1rf9y4EMzrkVS6/PKLesLQ1eQJon8Rs
         Ayj0zzxm5QP7RimSwE0D7wTvUBYG/QuH0Er0UQSWZX98mrC4UEFWCCHKREHDISoRLqlg
         ID9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=TPqfONMe/YNPASebYJny3qW7jnNYINr8hIvMBJ81Y0s=;
        b=ZUIW1xiiozXqxfn6wsmH/tv3LOBCB6IifyBr/s8yL+DINEQMNJ1Qh2dDadI+20wr/P
         3FJdhwVljHrzj6joV5E+1ql8e9nNjSDdbtNA5yor9kQKYHJCYM99IGDTlg/b8cv+ov4S
         nVZq1qAtl+prA4ya8AVsb+rTVcaA6hkPq7cswFpUJhMCUpn0YoT7vk7Qum1+PXWNfOGy
         jvJ7XFl5aAQn8yORUjF61F+OWQPs+K+QMSdAl+zXJ2fP/eo6s8JUPaZmQrSLOIE81h/5
         JUZMBrkWYXv0Sn88EMvhMeBzhTeyXI8BOca2ncjDW7PkT3WmrHvVRKdQHWrK63rB7IVa
         GfyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YcGMl6rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si561789ybk.629.2018.02.09.13.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 13:13:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YcGMl6rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFzJ-0006ZB-4V
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 16:13:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFz7-0006Xm-Fz
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:13:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFz6-0000Eu-Cj
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:13:29 -0500
Received: from mail-it0-x235.google.com ([2607:f8b0:4001:c0b::235]:35068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFz6-0000ER-7e
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:13:28 -0500
Received: by mail-it0-x235.google.com with SMTP id e1so12303641ita.0
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 13:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TPqfONMe/YNPASebYJny3qW7jnNYINr8hIvMBJ81Y0s=;
	b=YcGMl6rW7bmvK/UrBbN1bZ5QepAXg2qdG/Fjwi0Ky7fE3W8s/gHBk5ROuvHWspVs3h
	UgIe2QqJiPkWe3ON89vCy9i5/v16ANaHixeGo/IdbH/V2G53zEYppSRbs9uSDlTal32N
	3T/4o/kkQY13VDlwMITkX3e2v9XYmQZYKZpKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TPqfONMe/YNPASebYJny3qW7jnNYINr8hIvMBJ81Y0s=;
	b=V1m5suDVfIRuOzKIcmkhfl8Kn4IgBR1e4vIfqyOP9CcE109bOK2pZyOBSKINjrlYHl
	5b7EtidaWzEdcdQzBnN+CqFqvq9+IJYH8dSBgZK8ntgldwA/6zeqQPfUXfXrOps9hjgV
	KFF5t5X5juGA34hG9g3qYDNyVrr0/GTlpnFE9l39uzLcECWKIpsZidrV3FY63ZYlUPun
	XwrR+Net+ahUbLjav6PYBjx+f39NlGCSjBcGt5cXZHEOBGym6l7/5ltSdPdvV319cPjg
	bvA2fn8CEBW+qUo5V1WvUDnzZHmEva72p4cFIBeequHNVtn8LxGKaO9eePND+dTBj2Fr
	0o6Q==
X-Gm-Message-State: APf1xPDZza58lOLkzl1Ed5MODuuDmMIdHt9f8zbB+rSqRAr+2wKvNwrt
	phbzLU6ToE7e76b1PHmgiJqoOA==
X-Received: by 10.36.43.67 with SMTP id h64mr5038066ita.121.1518210807503;
	Fri, 09 Feb 2018 13:13:27 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	l63sm3966441ita.44.2018.02.09.13.13.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 13:13:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c4531a2-7e80-b808-011a-dc0c8db3a640@linaro.org>
Date: Fri, 9 Feb 2018 13:13:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/11] target/arm: Migrate
 v7m.other_sp
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
X-TUID: xM9CgNGouFr5

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> In commit abc24d86cc0364f we accidentally broke migration of
> the stack pointer value for the mode (process, handler) the CPU
> is not currently running as. (The commit correctly removed the
> no-longer-used v7m.current_sp flag from the VMState but also
> deleted the still very much in use v7m.other_sp SP value field.)
> 
> Add a subsection to migrate it again. (We don't need to care
> about trying to retain compatibility with pre-abc24d86cc0364f
> versions of QEMU, because that commit bumped the version_id
> and we've since bumped it again a couple of times.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

