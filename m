Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp883879wrt;
        Fri, 25 Jan 2019 16:15:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5KkZ3bEEIq47AVDJrKe8+TOeZdFItd215MgZfMAE6ykTS7WFxe+Aw9FNxudTyzeSGf5IVH
X-Received: by 2002:a1c:dd04:: with SMTP id u4mr8543631wmg.84.1548461722370;
        Fri, 25 Jan 2019 16:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548461722; cv=none;
        d=google.com; s=arc-20160816;
        b=ir5f6AKLhGRwaYhkd78Kb/n6Q5S2/0Zy3InVkAPi/euGHAZYUti4LzPWP7M8uy6+/3
         BNJPtFlZCSqPeT+jbfWnTN14Q5jW0sDKz4mynP3dwYs0VH6YJAki4BWwSoPIBAlEe5GE
         5TQ1APBi5Z66Vv3qGqkYYEqvTsWATyY5GJOd3Q2miKgAjVhoUS0R3DxLrINwMHDftXLg
         xLLoCrEDQITT43zq2194jF4sU4Helcf0Y0oZe3ATPnYHk0lMBfIz64xPeovGGzjBS4u8
         5rbyHBxbX01x94tMknzCDvVkf+rRf6rQZm0Diz0kl4OgKaFZLtqYvP72sfIaVgiysdo0
         TDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Lx5tQwz2q/B+kkmnQyn/MHzhh5L+gduL+viqMsBwXZI=;
        b=yEwYhNOVOYbsLjBnYHt9O4ZTjUPjEHRLYu8WPdQaqn6nJi/Sncp9ZqsLFT/1G4laAF
         Bi3VZnpo1LKTiQl41v3bd0zaBWJqoRXwBV2hDElunWkhEY1jsCaNbOVvcrPKqNuuDOB2
         AhzV+fJUb2yutrb+Sd/VuYUZ2g7D2bu8UJIWLu4slosb1Yltw4AlAdvOfa12B9CgpJ+P
         ArjT+KZYdY6VN/SnzJ4mk1KFXDeOVo9sDJ+l5e6halhk467uWV4uuWGuOaQkJd6gwiQ8
         /QF6/vXdOKisCjzKa+LGnqU2sJT19/FIDZRplJUEHqqrfjipLwNaz7CxhPMukByHP2q0
         t+GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sg09UBnz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si47009467wmt.202.2019.01.25.16.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sg09UBnz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBd3-0000H5-6i
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:15:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBcu-0000Gm-Ez
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBcn-0002pL-Ui
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:15:07 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42567)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBcl-0002lW-VA
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:15:04 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y1so5267890plp.9
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Lx5tQwz2q/B+kkmnQyn/MHzhh5L+gduL+viqMsBwXZI=;
	b=Sg09UBnzs+nriBoeP1FlZ8o7QGOvCCpQ4wRGuPuWuoLNBEAvRJLslwIlKmqY0zpo0a
	Q5C7O9kwQfmYNumry/gUlckazHfCbBJNBb6gNCtv6mv9o6rVFXm/+KnOKpAg7vyZBJYy
	yKbndDBXdr9jkM3Ec3cxc7mdQqkSUkeZkLMB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Lx5tQwz2q/B+kkmnQyn/MHzhh5L+gduL+viqMsBwXZI=;
	b=bfeBFvky/ILJVhG8LzIpKXrgduTcjKhZDKbauC3LINqqLa87jxQfddhWU5smq7nO6Y
	m8fs3/rKUJ5ZhIZbYa+tKMxfOf3AMZBAVjHm3bwdUXzLFSfS8Qj5CrJfG7IN1eut7+xm
	dN0QtkAYwrtgD9t4atwLTFclrZJstaINRZ31FMyCi/seOMcgSAMQLiy0+PBI9abw0+vS
	zlf5o9VDEmAHEPWF1yuzjU63TLPAYbHvUcDDqLepp10dQTwJ9UixRBFJrfi2X5OQJyiS
	GyR6W9H7MxOANo7He6SiHWh8FWSdF10pmVlsKy7qcKtiJlSegbHqgTUpaNVk78pW8gcX
	EgDw==
X-Gm-Message-State: AJcUukesjs7EhKedYbFiz/jMB7oaZVdrZnRCmz2NGknUgQ0poHQib7Y9
	xjmQragzuRKc5nmq+i7jDMRRzw==
X-Received: by 2002:a17:902:2b8a:: with SMTP id
	l10mr12399939plb.70.1548461701250; 
	Fri, 25 Jan 2019 16:15:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	x27sm40802201pfe.178.2019.01.25.16.14.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:15:00 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ca02f794-4b31-1e2d-7276-b7ffea3904cc@linaro.org>
Date: Fri, 25 Jan 2019 16:14:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/23] hw/arm/armsse: Support
 dual-CPU configuration
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
X-TUID: XNOliC0oB/uB

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has two Cortex-M33 CPUs. These see the same view
> of memory, with the exception of the "private CPU region" which
> has per-CPU devices. Internal device interrupts for SSE-200
> devices are mostly wired up to both CPUs, with the exception of
> a few per-CPU devices. External GPIO inputs on the SSE-200
> device are provided for the second CPU's interrupts above 32,
> as is already the case for the first CPU.
> 
> Refactor the code to support creation of multiple CPUs.
> For the moment we leave all CPUs with the same view of
> memory: this will not work in the multiple-CPU case, but
> we will fix this in the following commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  21 +++-
>  hw/arm/armsse.c         | 206 ++++++++++++++++++++++++++++++++--------
>  2 files changed, 180 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
