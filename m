Received: by 10.223.172.38 with SMTP id v35csp1023745wrc;
        Wed, 20 Sep 2017 11:39:37 -0700 (PDT)
X-Received: by 10.233.237.77 with SMTP id c74mr8618743qkg.256.1505932777560;
        Wed, 20 Sep 2017 11:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505932777; cv=none;
        d=google.com; s=arc-20160816;
        b=jtUNvSnPgSWTPRI0Dt1xjYaXC3WMPUDZytl9zOCSuXOiIUjI/oWlnu0ATxZYv4dkph
         xezrTxsfZP8sI6H46rGebyxpmS4GWNG+jTlpIY6IbHmbaqQxL9ZTyGr2bU9+C28AFGF1
         oiDQK29KXZ6mHhUGEs3803POpQW37vyC12LvpYY2foHqpMzqdwM1ID/UFaED6KjwLFzF
         93//8gTttZEgSlD3ZEZWGfTNcoy1lgpuGyQ0/vSI9UJOndVPtmOzxo7luztWv24jZxk4
         O8uw6CR2OgxDuYgPp47sh9Q5mKkn2UWBHJfc+5HtU9RZc/doyMfoO3BFDBlUFGJPpJSi
         KBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ftqO8t4Gl5V5VFnYZeGeeAStooWIYtNmQvOmi4mVhag=;
        b=MiInfdmBeSM7/TmGvHeRPLYzpMN2fDkTz5kjC+NYTzaDgMO7Sc1YFkHgpEG4pbb9zj
         498Alu1h5ncncsNSVlYQtzKi1ILzgZpO/2BQKcJvl37FiWhVhHmsy+rtMFcOWrMBbKJU
         6CmYi7ApuM8xOdsHpFUbV+H9n+AlRCMddUz/6NGK01pZyoriyhoMpznocMmCjZ9k8WAe
         nom20HPr+ATZAy5Y1w8biKYRliOI0I7GTwrmMhbcss81I5o2ousepvbcZ9u4I2N3lGEn
         E5McfuW+HLWaeF9PgnWdRtSI0p2DLSyHm3ancr6D5bdMPicG8nT1lIurCvE1HVoQIb7w
         18aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B534JIZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35si2407477qtc.445.2017.09.20.11.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 11:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B534JIZP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dujuJ-0000Za-CO
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 14:39:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duju6-0000Z4-KS
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duju3-0005vW-IK
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:39:22 -0400
Received: from mail-io0-x22b.google.com ([2607:f8b0:4001:c06::22b]:53944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duju3-0005uD-DW
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 14:39:19 -0400
Received: by mail-io0-x22b.google.com with SMTP id q11so5622538ioe.10
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ftqO8t4Gl5V5VFnYZeGeeAStooWIYtNmQvOmi4mVhag=;
	b=B534JIZPfmLk6c2EHwTjYBemdhrq+jQPQH/OUIgRa7jGEuNZZUn+HMxEX7hDV52OR9
	f0OpYgYehfujthUqp5ihz7+RxdXiBcRHDbxrh0DOyzKMTK+voK1cfNf84wpVl2QfwTYi
	jUMEFq4e9/rY5ccH6owOIejMQqJiPborsvCrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ftqO8t4Gl5V5VFnYZeGeeAStooWIYtNmQvOmi4mVhag=;
	b=kvxzgTnHpqIylYADcgKl20qDCHX7n7guJKb7sHrvy5ZQUg/6pGu8y7im3ZF7rpGLAs
	0C3OT8NF3qbDb1us98RstQDmeOiiPr/iN0yhrHfbEg5OoGJpgeEgklE9RC1CrrgrEHjx
	01veWKZt7bPdPT908BqAyaWOxanyAYoDRFNOy3HKg6QmJrqzUDL9ggDOu/wo+HeT66x1
	S1yN9+zMF7x3u/dqhczgHOQUVfUA9nqVnLBFxlWTYRGNbA8ododMZcymcRog2UbIcx8m
	grFLJR1EzUFEQhfSPfT3+OK4QVRzjTXnhurw0CxcNaEYcr3260WmLh9wTaUlha/OAc/I
	aLhw==
X-Gm-Message-State: AHPjjUihJhjH5MENEdYbmNBeB54E/EtwT70gGyv7Tz3siR9GeSMnK9fV
	EREELEPZF6/MJfqmbd5tzacEqg==
X-Google-Smtp-Source: AOwi7QBhWkQQMP4bLHgPOy+vi6qh95m8Vw+4R6H5zFJR4UUl/3y+F/Yk0rmClsZMlK8w4HtbPjEJKQ==
X-Received: by 10.202.44.134 with SMTP id s128mr6460076ois.99.1505932758739;
	Wed, 20 Sep 2017 11:39:18 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	a194sm2002573oii.36.2017.09.20.11.39.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 11:39:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-20-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa76cece-46be-61ef-c806-ac4d632da5bc@linaro.org>
Date: Wed, 20 Sep 2017 13:39:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-20-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/19] nvic: Support banked
 exceptions in acknowledge and complete
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
X-TUID: zrXAvlmTUb9Y

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> Update armv7m_nvic_acknowledge_irq() and armv7m_nvic_complete_irq()
> to handle banked exceptions:
>  * acknowledge needs to use the correct vector, which may be
>    in sec_vectors[]
>  * acknowledge needs to return to its caller whether the
>    exception should be taken to secure or non-secure state
>  * complete needs its caller to tell it whether the exception
>    being completed is a secure one or not
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 15 +++++++++++++--
>  hw/intc/armv7m_nvic.c | 26 ++++++++++++++++++++------
>  target/arm/helper.c   |  8 +++++---
>  hw/intc/trace-events  |  4 ++--
>  4 files changed, 40 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
