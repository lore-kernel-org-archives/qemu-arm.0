Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp867237wrt;
        Fri, 25 Jan 2019 15:52:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZJdtB1HRHk/ZlHw8ofe+XTymBCGiMuscjhryZ0Sy6ipvW84KvO3TgdkmgXzUDFBvANoaA4
X-Received: by 2002:adf:ef88:: with SMTP id d8mr4261013wro.163.1548460342826;
        Fri, 25 Jan 2019 15:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548460342; cv=none;
        d=google.com; s=arc-20160816;
        b=RRc3zbuEbOEq7uFhjGWb0W6uTKOvkSdxpdHYMMFcDYORUOnejmxSWpGwI8KqI3GXQb
         CnmMhlQNsmJ+Mg8HOlikCGBP0uJ1DpWmqO1c8zekAV9A9Zr+2crBwi9ANUFRTlcoSQcR
         f0OniLV0s8qwJBxqApdSO8DulmWpYoEgnyixpKnQxcE9O80htX27a47ZD+3z6riqAIdT
         zTCbxdaKtL5RpO3UZXKxqHhuXs0YE/T5rPVo8TnNnpft5gD+SHkYoj4gL70SgfiEc6sM
         PQ1s5JS7EsYiGYMkWSo6EQHVU7YpSDHqLBsPisNFJgyojPTd8oGCBYtCxuze4JYzrd2N
         qzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=QLZONZySBWFQqPyOGuDxOOVjtflxoDjmDvbuNEH364I=;
        b=CPQTRyNVviNNiDt5LUsdFwU31qVHDpLIOOx1uSG1yeQuFhjfyKIo0Yi01BDd7vQEIa
         nrbGk9bCN3NI2cY5B8AhyNborm0sIBYyEzwtqXqrl+FAsYhvbOx0mZclVNC+64NOwQYK
         8JNREbHXfXLwx7aY6x7uSwygUU7JYEut1+4I0GeWYVoLPY4Th88p5yy50wsBm16zWDHf
         OPy6IrVYbmsTFoLox88Fhr7j0qVKj1twPod/nMBY8LPO1dnCqJTyAbd/DSGjHqAMfgrg
         YuOoUXo/TzhxESwygtaoMP/Saxm66gsKbe6DbiX8EJ1XybLRo/m+SrqP0DTCPQvNayzs
         HtSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GFuQ1nWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o191si15713240wme.57.2019.01.25.15.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:52:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GFuQ1nWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBGn-0001oo-Vi
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBGf-0001oc-7G
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBGd-0003M3-Tq
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:52:13 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBGd-0003DJ-FB
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:52:11 -0500
Received: by mail-pf1-x441.google.com with SMTP id c123so5469367pfb.0
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 15:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QLZONZySBWFQqPyOGuDxOOVjtflxoDjmDvbuNEH364I=;
	b=GFuQ1nWhdV5qYmZuoUirlnAEuPcRXJgUhNowKj7XQfEd1/UKbNqpMweoVumQv1N+HL
	kBn0Vojlm1oIi3N4OZqXXhnCb6mdNVOFags9lUcITSksaWreSuINqwPGoMRXq8X5smah
	lnpNVpq0/BXXwqGX5Oi6H82+yXPil7JXpmx0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QLZONZySBWFQqPyOGuDxOOVjtflxoDjmDvbuNEH364I=;
	b=kyeouJZUyWAAPczz3EueP2xymtC4z0d6K4O3oYyIRLHscLXhl52rEwgKC1G8IZpr9m
	X05k8v3u+aOefzXJV3tv9YdJODuRe/QyLV9xlsWwKKJm5vnQHaOkc//9VtOCgJkUK4OL
	Dv04FM/6W/ZpB6FA+t/RYlBBpZ8DUkfCArLhCjaekDKIWtZPMIWO64G3x/mYBt54of9J
	6fMmtDgfZGuAdFjFWDDcuIfPp+ImKj6rDOdGWEOFWbIpD+KmpcrAoTAl5qtTRFQWGRzd
	577O9GMNIyb/CiOwmxNhac232zrNikkVps8rSbejh0jxyHwr7+/3mqWPh2+gslKK+Mgf
	rRfw==
X-Gm-Message-State: AJcUukfVeCM+HPkux0rRYwUw14415+jwqhaXWu1Ec8Bd5ATLX9YAZn8I
	H70kmgqw8b6JMt6Vttt8j1OJig==
X-Received: by 2002:a62:c711:: with SMTP id w17mr13054772pfg.50.1548460322901; 
	Fri, 25 Jan 2019 15:52:02 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	y71sm50507709pfi.123.2019.01.25.15.52.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:52:02 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c6450b05-e2ed-2918-79b4-73492e8f2a72@linaro.org>
Date: Fri, 25 Jan 2019 15:52:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/23] hw/arm/iotkit: Refactor
 into abstract base class and subclass
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
X-TUID: 8hy+JyZ20wmg

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The Arm SSE-200 Subsystem for Embedded is a revised and
> extended version of the older IoTKit SoC. Prepare for
> adding a model of it by refactoring the IoTKit code into
> an abstract base class which contains the functionality,
> driven by a class data block specific to each subclass.
> (This is the same approach used by the existing bcm283x
> SoC family implementation.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h | 22 +++++++++++++++++-----
>  hw/arm/iotkit.c         | 34 +++++++++++++++++++++++++++++-----
>  2 files changed, 46 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



