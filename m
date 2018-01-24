Received: by 10.28.71.27 with SMTP id u27csp811004wma;
        Wed, 24 Jan 2018 08:25:33 -0800 (PST)
X-Google-Smtp-Source: AH8x226RtUj+xebihJydtsBbnnSN7PJtHU0H6hksLSav1djR71r8Sdkt/0miDZiGhm0s1SzF8maP
X-Received: by 10.13.226.194 with SMTP id l185mr5965467ywe.47.1516811133740;
        Wed, 24 Jan 2018 08:25:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516811133; cv=none;
        d=google.com; s=arc-20160816;
        b=BH4fVP912jBldNqoN9VBNGl29P1GxFopbsoh3UeplPvrifS8vE2LdiZKInXF3fBrug
         BNFo7iqyfK+T+y2RBfF+b4AUl41Z9vGpYxgDMcU3sCcK1fdAPZfgZITTGx19F5HFjobd
         ChepxQ3Gq4Go55bxInLzk7VE14aY6B6NosWKNutVBZ+0y72lA7ReO+2wxXoimE56DEqJ
         lR+Us16FHUoR7PEAdD2AbJpPZoeEYwrbzQjHzpSq/HsWpF4cgmpIquHNDA0MTGryR5la
         kGwCSZUAYm/KkGpzh+AQTOIsshHqUnvYL5yVbD4nhAPKD+QXuTUL0B5g7nUu6dHSbLTN
         rcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9CrJFEaQoskblqn25YCkGAelKIZrA+qQYUe278LIEhA=;
        b=cdwCr8ukv7FCndCyMKEzeFeVSdgxBNyA+/p8fFSY6VOCGiJJhGlBb2gJaNy2ie0hQt
         r1y6YjoUj41oHUamRE1GkP3HW7df9KTASIEO1fgXWKYZyXhLPLBPwX6x8e77gsQy4Byy
         LkZHbUzefjtLsCXTnMbYJ8qcQm1jaENdwNdFkuaBhP6eDaQp+VBTEm6Cu0/QnpnvXQD0
         i1k6PA0Oo8WaNjyYjo182bGR52RAf0H05PUPk9tYr+v+sEfOpnciDkd0TsWI4Ozqvze5
         0LsjQ6Cxiz6zyDfBajhKJQby2ogG9QgsRBl0x89vvp22+abci6+y87FYlqvCxEZrruPm
         iGPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IAUFMmtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g193si107944ywb.784.2018.01.24.08.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 08:25:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IAUFMmtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeNrh-00081x-5E
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 11:25:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeNrU-00081E-Az
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 11:25:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeNrP-0003HJ-Sm
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 11:25:20 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eeNrP-0003GH-Ne
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 11:25:15 -0500
Received: by mail-pg0-x244.google.com with SMTP id k68so3048496pga.3
	for <qemu-arm@nongnu.org>; Wed, 24 Jan 2018 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9CrJFEaQoskblqn25YCkGAelKIZrA+qQYUe278LIEhA=;
	b=IAUFMmtwmHx0RuNlZY9tyA/ixbRw7nThTGixOTh2jqh5NK+3DxymEhvDdaeff6SttB
	moZdjrrD14OZBvc7s5OEpQzKdy+Fqdjf9I0WRb/wPakBoTzwPYoM66JXAKjf9qxhuqhs
	YNkYLnStPvqqaWl8WRbm5Tg3nybShGEFT2q4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9CrJFEaQoskblqn25YCkGAelKIZrA+qQYUe278LIEhA=;
	b=SQlKpr573Zk0f7coHJmPPzm65ZoYEhDzho+m95fkhHmr0sRyQpmUfIjDtgxc/9qqCQ
	TYhAGb/MLMj08fH5XY1ArLQq0d2kyKPkrQnQgRF3pVmhWiX0xkzvaOuvKX7nVUIn1w49
	jNnq0PjdVdtVbCmYXaJwJ6H1iRKKajgfyEt50tAexmpnk1394FGIiKe0olYTiD+53ud0
	jatJNLG9U6a7CYSSs20rAMdpwN7dAZWOqLHdwV0qA+rrj8Uz034YOhLYwTHgOKaaNcr9
	vVstdgpIPW/KsfinpHjD2I8eiUMenfhj0DtlIy6JrCjuwQxiiN8VEQtXCJyjCFD/rS6u
	buDQ==
X-Gm-Message-State: AKwxytd/9M0vJwkVrW3mq795WPa/RmIscRjdS6lkP2by+t0bWjrsVO1v
	FDc00ld1lueJ4tzkScfjicJMHwYt8uE=
X-Received: by 10.98.57.142 with SMTP id u14mr13450629pfj.237.1516811114424;
	Wed, 24 Jan 2018 08:25:14 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	r30sm13512083pff.16.2018.01.24.08.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 08:25:13 -0800 (PST)
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	Laurent Vivier <laurent@vivier.eu>
References: <20180124101358.GA5028@bogon.m.sigxcpu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ae6f99b-02ab-9692-7246-5c9b2e97f3bf@linaro.org>
Date: Wed, 24 Jan 2018 08:25:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180124101358.GA5028@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th and
 7th syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cVarFvU98+XO

On 01/24/2018 02:13 AM, Guido Günther wrote:
> Unbreaks the testcase from
> 
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html
> 
> Thanks to Laurent Vivier for spotting the 7th one.
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
