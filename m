Received: by 10.223.172.38 with SMTP id v35csp1253765wrc;
        Wed, 13 Sep 2017 09:36:55 -0700 (PDT)
X-Received: by 10.200.24.214 with SMTP id o22mr25980261qtk.123.1505320615361;
        Wed, 13 Sep 2017 09:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505320615; cv=none;
        d=google.com; s=arc-20160816;
        b=bNOGILdbWOQ7aWBsc+oBoRGctuP++YW0EHL5wWATA58C2Hz+xrBZ8meh9Go4asAL+4
         869jdaqfENfzSc3DhBq8iFFnqr+zN6lCfuovBqdKxT1sDzzLUWudfFjnTyjMFeDHuMuF
         ePWBgNOqLm2diAxbgKKCTsQrHXyyzBgd6ovZObtBmNYl2+SDgaSc/q04E2vgbUtAQA8j
         KFMbuexnerA1iD4POpvVXMTSzxoYhHBCJ9zd8jY7hE8nucQgVQNErErd7/gBESavY3bM
         AJbgbnTI8sLlcshWOlxk8W4CPMkH5VUFesyPfeBI/AdJ/a6MMjusnVhphCquxP9lR3SS
         9+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9DPa0VwBXqUnV9dmyLumWo0J0tcfjGmcBoZ4ig6NHCk=;
        b=fdWc0ekd5oyXLWKjKgMhfsIosBFlOaL6BzP/cpe32sOi5z5RvqoFooamnlni/Ss9EV
         OJK+7w9LAkF5P/j/IUKX3ebE/5TJ9Ofj784TDpPd0aunZ9HDmtk6yd3G6DQMQks8j+GC
         0ED8KzkUEivRuQ4pXjkfgXHO8DqB4eGUBfhmNt27CC2N8xjxGA4ixXqSXDXQNeWpFFo5
         qPYVyLEn54zu2NDDNi2osqsmC8t4K50HOzCkvMVdxrnrtRbE0pfct29MZ8elW9CsPlNI
         oqNgIHbOdYE307S9m6dOxKvMmzk3HesGvA0cHKxrKpeHPVIt/GvKEOPFJ/NhmLi1WdJI
         Febw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fO/yyhQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si2011483qkd.506.2017.09.13.09.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 09:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fO/yyhQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsAej-0007m3-2b
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 12:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsAeX-0007js-0N
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 12:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsAeT-0001HD-2Q
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 12:36:41 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:47473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsAeS-0001G7-Sd
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 12:36:37 -0400
Received: by mail-pg0-x22e.google.com with SMTP id d8so1345800pgt.4
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9DPa0VwBXqUnV9dmyLumWo0J0tcfjGmcBoZ4ig6NHCk=;
	b=fO/yyhQiWQdyHcd3r4TTp6u0FIU21ijOFy+2dS2I4jQ4iWu1UBljj392vetBYFcs9h
	eS4DyG/UIatjsSrrjINmLYaue5FWoqDKYVpnDmq1hdvYjo032/ZyFfltbbK8p8f4R7U2
	vDsxD+DcVfrliXsAfPXAnLJCCQukbg78JgnS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9DPa0VwBXqUnV9dmyLumWo0J0tcfjGmcBoZ4ig6NHCk=;
	b=VDVytv+uda+KoXiqXwnV02Kiv0dIY7xkjkUL2ZGgZro0evT0xWewSqz8FgYQ7dJbsQ
	P6iEM/mvTdM81rP+9yHZmgGvtSavOmqcRA6Ca8v33nc5QZ2FE0thWiQmJlwSkdpRAeVd
	q7rOvGlNO3SXZTv7TOd9J/GuAFoDrW3OHVP5PfJJMYehf/fH1NZzel1qtXWczQDUVUvR
	q3fK1YAVoHbNYfcepFBl+tDJvxGHrPzlLLwfOw6eSU82PAyoQDVJ4MK4dD+z5yh6tuOh
	O6f2WAJ/YcwvMGFTlU5FQMgA1gHf/kq3OEgRv4yK5NaGhVzX1n2Zo+vl+mp87Zqq8Z6V
	YkYA==
X-Gm-Message-State: AHPjjUhSkIcf75mtoj8EC1Rzc9TJXUMJ/DSoNCSuJIqJSGiOQvT1Co0J
	4xsZGC5SHC8BWZiT
X-Google-Smtp-Source: ADKCNb5X7/mH90+O7eGpvE+56wPJXFoTPujHHUfwA8pYYBQgsgwmJQRMJOxvkRPucCMLnlvXWMNSnQ==
X-Received: by 10.99.133.66 with SMTP id u63mr19143690pgd.426.1505320595777;
	Wed, 13 Sep 2017 09:36:35 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	e78sm23717620pfh.76.2017.09.13.09.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 09:36:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae8bab29-9341-26ac-bc4a-6f8140d42744@linaro.org>
Date: Wed, 13 Sep 2017 09:36:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/7] target/arm: Remove
 unnecessary '| 0xf0000000' from do_v7m_exception_exit()
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
X-TUID: J3tEa1QWIkmq

On 09/11/2017 06:52 AM, Peter Maydell wrote:
> In do_v7m_exception_exit(), there's no need to force the high 4
> bits of 'type' to 1 when calling v7m_exception_taken(), because
> we know that they're always 1 or we could not have got to this
> "handle return to magic exception return address" code. Remove
> the unnecessary ORs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

