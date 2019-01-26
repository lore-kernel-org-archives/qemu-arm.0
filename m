Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp897309wrt;
        Fri, 25 Jan 2019 16:36:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7BDJ3V50y0RKA8tSu55X+nEESA1aymVzQNFAhlchWx4Lmhh0fXJ+SAkua13nE7P4aBY+ie
X-Received: by 2002:a5d:5607:: with SMTP id l7mr13496615wrv.25.1548463014751;
        Fri, 25 Jan 2019 16:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548463014; cv=none;
        d=google.com; s=arc-20160816;
        b=dp8SLa0cF9gQ6L7VZYJRR+XjJLXfafjYULgLoXTtCBFWIIOhLBkglhoLwtXTrTYYTV
         EtbpdH9/UdaPtRkpFvQt0x6c27kh6Lt2CtPGnVLRN+JGF+URMBZgoQ7TTXDmG6g/EJrC
         I88VaJlgBC/1kvMKstmWd/OWMKKtsK3bx20yLRO19FuBuNGUrRL4l500tbqDJnhUGdpv
         Lm15wAwa6hjcvRU5eMQ6LbeqnUnaUCMFRC6jGiUV72T09GjLoqRmKRSiTTeY/Wdb0q7a
         CsJHUCOILuw2xriyPCNRlWeLK3URY9BcX4EyajBXjIARoLISgGPr9MEg1JqaJ7yVFa8h
         r5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Pt2u9zP04F093qif1kgAjwX4OBtDeacSjgmZAl/0Azw=;
        b=V7YcAJDovWgJQEz3iI2ufrGob6YobAZrjaJsj+38ECOFNkKEN/3ArgfO0MP3lwF/p4
         8b7YxJN3ajwm5KxUArTAT/4jR0+yb07f44sVMkth2+rTK/dDCw+2fxIJATJEwunHllnW
         wIBdOYU+h347zkz7dMh+zCSZVzF677rUvZUioX7isytDUOYg98i90FfwGZTPE9ydw0ql
         r09Zn6FgfykQxfSbNU2x4pIjgwHRKv+DC6kmsj9EcdVrtKyEexmaBRHc1qkaZQur4iOX
         M/6CxtQAK5wZ7f/4x/jF5uPijM2bOug4dpukkOOzwAv9tysOk8+FZAgTV/WjnC1jlARR
         XHlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=As76yZGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si75460818wrv.37.2019.01.25.16.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=As76yZGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBxt-0006Ed-SC
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBxj-0006EG-HL
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBxi-0002Q7-Pg
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:36:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36264)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBxi-0002Op-Iu
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:36:42 -0500
Received: by mail-pg1-x544.google.com with SMTP id n2so4873853pgm.3
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Pt2u9zP04F093qif1kgAjwX4OBtDeacSjgmZAl/0Azw=;
	b=As76yZGZ1V238XfdtT/xUUUngCt0/Lq2C0stD/N6iaDzmCztSo3s45f5Ogc9XBBM7H
	vf8NIipcoqtRJZVvHb+OddpjKEWRiD85oPOBy1QksB1CJDLyTRpAchB0QtQnds9VpuWg
	sBP6IS8BzHoWN4SZ9u9mJAxtzkEy8frlKSyYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Pt2u9zP04F093qif1kgAjwX4OBtDeacSjgmZAl/0Azw=;
	b=ue8m8LO0lAzkDU27eZA/rCqEjl5f15MwZPS5Ynduc8u6/4aXq2/GXb3+LNjAYWnKVH
	gE+1blto62A93CjMpyMhunflC2gxY4XKLZP4OGbeLfgZmxgnQ5VWVBO2bZiJ+Li3hGwJ
	RIcituHMtr9FdU+b2BbLnlxoXgJkwRwlsL2lMT6o7rnOuSApJacPGZTFOT3pCM1lCxlm
	QzSHmC0dMuAI8w1htj/R6rseRHV14QpEMr9XCxjPU+4uLkV0uiWd5eyHKkfZ2gGy37Ue
	BddP3b6Y/iX5lxlfzyUzdvauWqRvgkhAVLi0NuA6PGDS4cbtQ2DjhVfvzTZWzJNbZf1z
	3LYw==
X-Gm-Message-State: AJcUukd8Q+DMwx2+ieq9z5PYekLZ3e9sblpVTPzl7OcYIvFBvR0ZpTyx
	aSvxHqB/QW7URc7DW/04eVXaKA==
X-Received: by 2002:a62:1484:: with SMTP id 126mr12906218pfu.257.1548462999357;
	Fri, 25 Jan 2019 16:36:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157])
	by smtp.gmail.com with ESMTPSA id 7sm42002269pfm.8.2019.01.25.16.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:36:38 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <12ccda0a-75cf-47f5-dbd0-07eef85a189f@linaro.org>
Date: Fri, 25 Jan 2019 16:36:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/23] hw/arm/armsse: Add
 unimplemented-device stubs for MHUs
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
X-TUID: vo45R4yTcOXh

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has two Message Handling Units (MHUs), which sit behind
> the APB PPC0. Wire up some unimplemented-device stubs for these,
> since we don't yet implement a real model of this device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  3 +++
>  hw/arm/armsse.c         | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


