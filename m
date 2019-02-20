Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4848738wrx;
        Wed, 20 Feb 2019 10:24:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY3AzKyZvCy7OjmS6YOLW/Uf3/yHHidF6oXieXIRv/E+HOY4PN1zbGeC3zB6BLzZVm/4aiR
X-Received: by 2002:a81:3d88:: with SMTP id k130mr27516068ywa.438.1550687095769;
        Wed, 20 Feb 2019 10:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550687095; cv=none;
        d=google.com; s=arc-20160816;
        b=Ca6u3J/C2eftfJwmx5Wt7kaib1vKEey4JjyAOF31qecCQ+J4Xqj3rhdc4YKw9Niuog
         gFBnWmnXdKSsZ5lEY04AEpZJhhe+LzzlwrWYr9DBvH4cGCO2FQQif6k968yPTgz+okKn
         1kC1KvTjvZLDIBBmPT8AYGjiRhfnjIjolMf1SOYmEzgsDijF80Mj2YUnUxWYyw5Va45W
         Jx49sd5PM3G3F0OGFmCjDIrf4BZwqa2mZgJhsfvgz1G7q4e5ej5x+lPKJJJT8MVTVMt2
         wpIaMNPtU7XiN3r9qVvgZmwudUAW109rE3qXFmyM3safFhIBZAOiMzzSTLBzLAChXqdF
         eK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=zE0jP6DpqEqAiSqsR8R+T7zhvvGvac7EqkRfu2OS+vo=;
        b=k4nrBP+QUl83/cG5O3qLett/ZBnIqLaB9jhrkGW9kGoT/wDRj4gHVFG3lcCJ3O7kLB
         0Bp69EN94fS4EA06kRYwIrUVjfKMZCZ58JHxlJdsoHcd2xaKPI939hKVY/ZIwYTmnQ/Z
         d72Hiabgq01S60Yed8cQVP5wsoi6IJNOZu73kVJ8kU9hWJD7Kd646bkk4acgp/BezCul
         TgniD0RseEmUL/v1R5lsAFzapvcUYp33UJv/DDNFcKVxIgRslIhn3IXmQ26F61H2EFtp
         Xfr+d/dZX7kW+MQE/b2rF1uCNBTnEih1JeNCLoJOQ22v/f0rkLt5oYVyWBWXnZUeNvDl
         CmHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uAZpCQJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x72si456406ywx.148.2019.02.20.10.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uAZpCQJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWYB-0000uP-6G
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:24:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWXu-0000iM-1d
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWXt-0000wc-B5
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:24:38 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33743)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWXr-0000so-6D
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:24:37 -0500
Received: by mail-pl1-x642.google.com with SMTP id y10so12655590plp.0
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zE0jP6DpqEqAiSqsR8R+T7zhvvGvac7EqkRfu2OS+vo=;
	b=uAZpCQJUoGFlnuofUwzBnRYqQpmDjjJMtqSIBWNkPSAo1r0s4a6kJDStG7MLRqE3/J
	JhuHibwNanKIQYxhmgOh2MdNrEgQSF9b0avoyJDHsRCS+VLbGujTQi5B+Woe32Wf59+d
	v5ulG5+/Fh+mUV4j2JtEiJqu9PoHLORAfTPpM3jVc4UCigLcXKDA6ZvFtB8CUa+44i9k
	oDb74KGaN989eT/IOXPC1VZk6RiB2Pu2awGihsM9ieEY8wgDOGgqiTy8QH8X1mbJPRsf
	onqYPNd0sAoB5u+3lb2hEYVwbgghngmc9Sht3Aci9QU0dsPYTeXNTATinZvrKWV1T73Z
	wHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zE0jP6DpqEqAiSqsR8R+T7zhvvGvac7EqkRfu2OS+vo=;
	b=qBdtho2fBu/YhUqVecfHESyQFBreERTLOxEGX+UY+rzqU3DW5wVQAv1TWyWweTWXc/
	STDp385qOFmIafSr0akdIo2cwcMCs6VX1yVxFevJjP7Wsehaw2itKXbd733zdo3tHAy/
	GDB07fBTLwC7rk4vFfn5UPGY/rZOVvV3JrIARW78DMt3KFliPZ/CkOFpEmkq689OSba1
	00uTIpsU12WXMGrh5hAo5L5JvZE3LchKWRWh6Luc8MEcZIjTDMNzF8zED+E2NiP9/8YX
	KQRsjk6tkV5TF16TozI/sR/g0trfa5yj3WZW6uf7OxzNgHNPuAWNftFIGHmkhV59wYxQ
	UupA==
X-Gm-Message-State: AHQUAubFj5ztLTbXcYc5TGapXDbhSrkiLjDhhJRj03q7Ct27WuSDj5sK
	fGTIfdLp69wFksvS9CengA5N5w==
X-Received: by 2002:a17:902:aa06:: with SMTP id
	be6mr17587299plb.57.1550687066726; 
	Wed, 20 Feb 2019 10:24:26 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	14sm29494142pgq.22.2019.02.20.10.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:24:25 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ad033d80-e4e9-718d-1e43-42827dbed99d@linaro.org>
Date: Wed, 20 Feb 2019 10:24:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/8] hw/arm/iotkit-sysctl: Add
 SSE-200 registers
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
X-TUID: brNUanjMtXWx

On 2/19/19 4:58 AM, Peter Maydell wrote:
> The SYSCTL block in the SSE-200 has some extra registers that
> are not present in the IoTKit version. Add these registers
> (as reads-as-written stubs), enabled by a new QOM property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-sysctl.h |  20 +++
>  hw/arm/armsse.c                 |   2 +
>  hw/misc/iotkit-sysctl.c         | 245 +++++++++++++++++++++++++++++++-
>  3 files changed, 262 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
