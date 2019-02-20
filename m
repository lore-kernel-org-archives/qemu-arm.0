Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4871520wrx;
        Wed, 20 Feb 2019 10:52:52 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZxu8QA/CqUl1dDQI4cLWOJb0StMd/nrpI4y1zMlv3ywoGa4jqn2DwYqIXSy4gyRYUOJGdn
X-Received: by 2002:a0d:e1d3:: with SMTP id k202mr28989862ywe.198.1550688772177;
        Wed, 20 Feb 2019 10:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550688772; cv=none;
        d=google.com; s=arc-20160816;
        b=SBstTadHJq1EvBMN5uTuzSbmbFBelDfKkYE4dt92vauVN5yGFGPlc25m9xT0krMU1N
         TfOw1iHclfuebNV8TaKfkV4tVgEAEhMkmKJZZp4wHD7NANW8D6ctxvadh/yD7Ysmx70J
         4XDS3/G4M/kMLVjmlomw8pyTjiO1+PpSEecmE7qw23F3z8ac145G5PrIYf215PvmMaLy
         vy3xwPu6PXnrPInBfGXsIZik+viS08dfPNJwoQXoMhTDJMYLP5435Xw0qVRDjW7Jd9V4
         2MezqPgP+ExUXGOvJhG8/FkIxyb/Vg6nxa1+kiRH1m8gZEdwKgWhr4YU7dpnJiwXr+RF
         L8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=BycEsM0yG/hzbYKnXjciySo8Oi80Ql4LrCqx5bk/jw4=;
        b=KCyfnHIfep0jge/ApLvJm3HvhfWrbN8PCuNXXlSsg3sdH2O6EyKky/sIIELN4ON8pK
         wKdFmXO07woABJAXxrlregaHbWQp5KE8TO3bW+KvbqU7j06bhZA9LKwHn+aQpNOmpvhr
         Ux69j/h3tc+mrUQt63wyuFfG5XLc7pYu8hR2lZo9yQsM37TXJinWE3+eemzA//R7s4Ox
         8U6paW8lRZoQ2vUfAar5EF5EyzUvF6FWLxjg6UBW62yU3RDbkmjIS+M3sOJ626p7NRaw
         O01HL7Obz5tv0l1Qh225HrHDFeWg/bzmv6xer4GR2cvG7CNfIyS4IQDTCF07o/UuqswH
         huiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hTd7kFP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si6484894ybq.158.2019.02.20.10.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hTd7kFP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWzD-0004tk-KV
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWuh-0000qm-RH
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWfU-0004JT-9U
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:32:30 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWfS-0004HG-9I
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:32:28 -0500
Received: by mail-pl1-x644.google.com with SMTP id d15so5501970plr.1
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BycEsM0yG/hzbYKnXjciySo8Oi80Ql4LrCqx5bk/jw4=;
	b=hTd7kFP7f0mcRItYrKvayQtpn8Xg+9+QBA6fLUSEtDQOl5ku+0eSrDGWqKvvskVp5m
	fER1LDlnquuVjaA+lfJOwzKUM4YSpTiQfuHPw7OEy0GoKxNaZ0iPbfyVl4ksOVvvPVkA
	wzsC1zAql5ZjI/HVC37l28wTa/IhkyqZXElkfaslMkUtzJUeN3T7XR/wPtV9UaC5zHR0
	Qjq/LLoAHNcyywqWKpkyb9/uB7smY+OfyA870bxhP7QLtKRUgyLuL2x3bF9hJoP5jR+P
	/KfW25YISqxZNVj6exXdSfzAv+o4ZBZ2LD7q7qtA8ZsYnl4hdJMOG0EuStEffoV+hmd2
	rQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BycEsM0yG/hzbYKnXjciySo8Oi80Ql4LrCqx5bk/jw4=;
	b=VmtzCio4vD/4O6i6e/2TH1yl42x/U0545VidLJg0SFfRIoMypHViR5VwrzojDrGFRb
	X15/VyTaI9QUXOtxGXWeo3gFEvz7V9teHVyhjNg9whC76Ev4Glfhw8KSHwBGtOXuOhEw
	7FBi7h19Ub41/nOWC1Gl5LUBfv2ESfVmz0noB6mxOm/FCBv8ucvjm/Fw1uP/IxbvwSYr
	m6yEebGzhkpYiZqT6mpkmDpjS//EjkMnQ4+JgxVjErlBJgClbAXQ+jj3zKwUHoBiLem1
	Dy3QHnwW6S7XD1mgncDnBLM5WG7u3/m6PrIa5FEq8le68VGi9DmbAXwr6nMDATlto8/o
	cj0g==
X-Gm-Message-State: AHQUAuZrLKfqp0bHUeyYmQLG6K4UsJIr44EReh41JeuD71Q8GUa1BtE3
	KoCrrXnp2rEh5pe0Y2nbVh3ukQ==
X-Received: by 2002:a17:902:6681:: with SMTP id
	e1mr37534206plk.98.1550687541087; 
	Wed, 20 Feb 2019 10:32:21 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	z127sm32799324pfb.80.2019.02.20.10.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:32:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f3372d40-ba23-2060-cffa-18e63955a654@linaro.org>
Date: Wed, 20 Feb 2019 10:32:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/8] hw/arm/armsse: Unify
 init-svtor and cpuwait handling
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
X-TUID: EFSU5XULajGh

On 2/19/19 4:58 AM, Peter Maydell wrote:
> At the moment the handling of init-svtor and cpuwait initial
> values is split between armsse.c and iotkit-sysctl.c:
> the code in armsse.c sets the initial state of the CPU
> object by setting the init-svtor and start-powered-off
> properties, but the iotkit-sysctl.c code has its own
> code setting the reset values of its registers (which are
> then used when updating the CPU when the guest makes
> runtime changes).
> 
> Clean this up by making the armsse.c code set properties on the
> iotkit-sysctl object to define the initial values of the
> registers, so they always match the initial CPU state,
> and update the comments in armsse.c accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-sysctl.h |  3 ++
>  hw/arm/armsse.c                 | 49 +++++++++++++++++++++------------
>  hw/misc/iotkit-sysctl.c         | 20 ++++++--------
>  3 files changed, 42 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
