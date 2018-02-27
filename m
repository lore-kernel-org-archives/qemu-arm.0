Received: by 10.28.71.27 with SMTP id u27csp5303634wma;
        Tue, 27 Feb 2018 13:54:55 -0800 (PST)
X-Google-Smtp-Source: AG47ELutrgNKy3eeVDynFmnQHGVwEmWuomyw1YyXM5VBb44996ynwH3ibpX4BaA8fqELvAvv685J
X-Received: by 2002:a25:2d5a:: with SMTP id s26-v6mr10816238ybe.83.1519768495465;
        Tue, 27 Feb 2018 13:54:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519768495; cv=none;
        d=google.com; s=arc-20160816;
        b=H5gQkS385zyC9hfwJbqZQOL1iS32g++UdoLG7ShPj7GVIJZ+C3BD9Bu/JNDxUTxBc3
         r/40iE6f08qOkUTH+6wMkzX3baupqdB8bJhe6F86aAdCH1RN/NNz6COidLryjSkoMUej
         bzAGwlVCpil70Xk9F2eVVwOuuB7TkwmwnOJTOHKAIiVrv1HiV4/OouPiy9j9DUN8Pa2P
         ON3Z8WRpocmxZ2/d5qP8JrZEcLbBkctKc7QATjLA+18ZMRs7Fw8GJl16Kd0Gu2FrkPzz
         xbCvl55Iwje8GQPUG2DKc3VK+4NbvxDvqUQdlLQD3F1W36CqnCmjihAYgHg4i7Pc2NmR
         8DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=++a9Uv/kqLAHisp1mZxiZ6HKUIyg+Rd0FQNOltASJW4=;
        b=WduUWUcrmfhVfRm4lxL9iV0nxfenFpz488C/zXUJSWmXPMnZw1lvJipcYDSY2RGgBy
         eQNkjW4lwgCF7WB4TZb2s7it58U8XnM4hGWFKcFRxMAyZhvINokgOQXuliEMsImAVjfV
         rCre4b9AbbmyviH3iBAbQazfiPTPlUz5z3gIHQ+bSq55F7XblS06JAP7XCue6M4SZaAM
         sIY9sH9FA2iJh+/eRMAMABTW1uNtBUzVpI7N4pGx1cm7+byaRI28Xpr7XZzI20vmBEJX
         IqM4Xh8y7mcTZ5CVqA8StM3MaizrKc86ytG3FofpMinS75F7ES4o8XCqts5lHsUu8SM7
         Qmhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvQoT1Eq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si23830ywb.498.2018.02.27.13.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 13:54:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZvQoT1Eq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqnD4-0005Hy-VK
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 16:54:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqnCq-0005HP-MA
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 16:54:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqnCn-0003ZD-MP
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 16:54:40 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:45837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqnCn-0003Yj-GH
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 16:54:37 -0500
Received: by mail-pg0-x244.google.com with SMTP id i133so125692pgc.12
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 13:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=++a9Uv/kqLAHisp1mZxiZ6HKUIyg+Rd0FQNOltASJW4=;
	b=ZvQoT1EqRsKimU6aEk7AJo5qX8E6Ka8vjZwPQofDOptOwwk0kO6EBVyoib/K8r+PYX
	ef1ApWrmUBKcRxCreDn0c6LIAMlXha3DgAw1VmGdzucDBg0wDTNTcr6wZutZVNYlnP4W
	LHAam7Zu6Ve7z7gWwJOwi97VLlBeMgCAgnVUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=++a9Uv/kqLAHisp1mZxiZ6HKUIyg+Rd0FQNOltASJW4=;
	b=hbxw+VWtwBBSQ9ShrmjKE5gLkrPpCWiE8yArg+zXXK9fGBRVLwp6udr/o893p7+3EP
	Ce6bTdU28uDA7XCJ8xu/cGW0hzSpZ8NSsz04+K/g25MUsYH+B6T+Z/YTqJZ2I0tWUh94
	i0gxIgnHHTJ/fYHQZV1pZUjvb9KYQD6S6KZDf7YjKWWgmjLJI6JxcGW6if0AUBe5CqtS
	oXCZq9Iv5dY5wpkCwp1yHsUs8rE5hGFWYUODGvZ6IvGTE9jOWb8fVx9ap6PXx/h1Pmjo
	aSs6yjEawhZj1oDn7f/VdIHg35I8OJNjsCOisQDqPgNlP4Yv4KXBYjNK6fY0+mpaRCJa
	7dwA==
X-Gm-Message-State: APf1xPAixIRxlcFGkfe9pRA2fGbpKUn4s0Okh79ZW76eBLxV5cHfl99N
	hB7Wg3y6OFaan/XO9yJUjdKQVw==
X-Received: by 10.99.179.14 with SMTP id i14mr5088278pgf.45.1519768476436;
	Tue, 27 Feb 2018 13:54:36 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	g80sm146745pfj.101.2018.02.27.13.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 13:54:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b67df9c-c88f-8e72-8a67-a74f7b518975@linaro.org>
Date: Tue, 27 Feb 2018 13:54:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-devel] [PATCH 16/19] hw/misc/iotkit-secctl: Add handling
 for PPCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qya6zU0G+yu

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> The IoTKit Security Controller includes various registers
> that expose to software the controls for the Peripheral
> Protection Controllers in the system. Implement these.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-secctl.h |  64 +++++++++-
>  hw/misc/iotkit-secctl.c         | 270 +++++++++++++++++++++++++++++++++++++---
>  2 files changed, 315 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

