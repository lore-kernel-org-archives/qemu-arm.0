Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3467018wrt;
        Mon, 28 Jan 2019 08:30:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ9Ni3Zp7Fpx32NCEAvEDZ1jyGAGS5zzeaAqxy/Mh9wRMnQA5lYtIvr0zL/c4ee5tEUG4Zt
X-Received: by 2002:a05:6000:11c3:: with SMTP id i3mr18223568wrx.221.1548693002022;
        Mon, 28 Jan 2019 08:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693002; cv=none;
        d=google.com; s=arc-20160816;
        b=F7qXhqWN0btEW0cvKDS+ZIwYLKZXm66XAklJXHWILAa3UcA4I9FoQ2aRKFhujJlsOF
         67u4FFEzGWcsw2lHbvtN6kWwwUts+XlB8G6RJxxMz1mQOi98iHhtu62ZflJi7a+ht+lv
         mBtFALCHOXr2v2CJAJnbvEZ6+cCpDOzwsX169Ma6oENrjwrvv0SS86TzNhZbHdSOAamE
         ASH3/dMPSWAZ3PL8jgfRvEbV0isu02bifKSLNh6Rh6/sPKFjvxtkxk5LfdFIUYuw7aWM
         gLVG+I43u93kdkqX3Q0ukSLQwO5HQAiMDM2rNyYxk47H488LqoZJ+WY2vWjN65Pwl1BC
         9gHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=G7HqfhUxbSp90/WawZF/VO6GQka95BtZptBmsVDbIvA=;
        b=DESY618EVgql7Wnbk4ko/1HhohA3V+KCqMsOt/O0XmsWUKDcfvolITQn8JjvYVJl0j
         USNJCO+idowAxH0ZOr1lPSfPPAi+QGrMvcjbtdr8qmf/DewUcv9Ne3IIegAdZvChcpv3
         7FsV0FEF2tuyVGAtHMmuHURQyXfXLadhyHNWfDVkWwwZj1JFxLJBOkFt1Ba0YzUrt9Wd
         X71qCSSn+O2o+nRzRJBS9fxiBEBnZXbagZaoLw8QZb+m0pPNTxi9ro3YRZ/O4P/wofad
         1NyxiiPmTaCFkM7EUgqOaHZWQT0n8OMyf+Msd6BGLlsJjLZYSUvJLIEi+H0XimQ14WxF
         l24g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGJsPzxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si79836541wro.157.2019.01.28.08.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cGJsPzxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9nJ-0004I8-3e
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9kV-0001rr-HB
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9kR-0000fE-Js
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:27:01 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9kP-0000LO-Iq
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:26:59 -0500
Received: by mail-pg1-x543.google.com with SMTP id w7so7400299pgp.13
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G7HqfhUxbSp90/WawZF/VO6GQka95BtZptBmsVDbIvA=;
	b=cGJsPzxZx5QbAq7t7pfoVj9dLUHV9G42GF/wDuLZA+LSx3AgwD/B9jDDR1HWHCs/+K
	hw37hr38FWqw2uK2T0m4M4bBRtMEwGZZogfor//KzXnyKCCtbmFV+0QR+PbJcEEjjxgc
	WcNKTlGyiYsR4XNn0jUz7co7RBQ9dDYHP0c84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G7HqfhUxbSp90/WawZF/VO6GQka95BtZptBmsVDbIvA=;
	b=nzobv5UmOB25OLVa4O2xGtq97vlr7su+7UK3jAvURVy7tfmTUHRpecpLGPomNJ3CiQ
	wSYFrYoPKJjNvt309aBRWgB47KrGhHKg9aAPKAtJ1Gi8zNpvTEZuAU47MXW8kJyj3RXF
	fmDXCQueh5M5Oj3cmAneQ1uIfabC8K7l73tXuC0W4F9YNADj4C5ySC7Fk3NucR/jY8wt
	+NeqFT9YfY2NCjmOxK3CC9/bU2+Dx/U1lmtS35YM/mQzXbkAueZen7eqNhzgUkagJlh7
	P5hBXG+Pzks4vClCs+ztF9NkKgZ/fuZ7+VkIFuXzYi9EccAuOYYbrUFG/Xwr8vnd8QiV
	BO7A==
X-Gm-Message-State: AJcUukfcLZfecAiu3asCntbFXzwkld/+/TdU/4eyrbyZbGeZqyzQXrjY
	32s9JY90OgxDR03ruIJLNBUBEQ==
X-Received: by 2002:a62:931a:: with SMTP id b26mr23517511pfe.65.1548692809899; 
	Mon, 28 Jan 2019 08:26:49 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	s2sm61043714pfa.167.2019.01.28.08.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:26:49 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6e212532-c18e-6476-eb53-5eaeef8bcf0a@linaro.org>
Date: Mon, 28 Jan 2019 08:26:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/23] hw/misc/armsse-cpuid:
 Implement SSE-200 CPU_IDENTITY register block
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
X-TUID: v8O4UbShU3HM

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has a CPU_IDENTITY register block, which is a set of
> read-only registers. As well as the usual PID/CID registers, there
> is a single CPUID register which indicates whether the CPU is CPU 0
> or CPU 1. Implement a model of this register block.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/armsse-cpuid.h  |  41 ++++++++++
>  hw/misc/armsse-cpuid.c          | 134 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   4 +
>  6 files changed, 183 insertions(+)
>  create mode 100644 include/hw/misc/armsse-cpuid.h
>  create mode 100644 hw/misc/armsse-cpuid.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


