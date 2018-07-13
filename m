Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp543860wrq;
        Fri, 13 Jul 2018 03:56:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeaTq9TVSwbeh9wt4JspbZHHRHoC04BINubc1pCV5lj1sciRe5LaABBUyz6HmYM1uc74vbd
X-Received: by 2002:ac8:13c7:: with SMTP id i7-v6mr2614726qtj.134.1531479397601;
        Fri, 13 Jul 2018 03:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531479397; cv=none;
        d=google.com; s=arc-20160816;
        b=foEKhO35wFgsl3E0KPO+m4aXwBpcfN65O8O4s2lyz91BfDyiKPzeyZPDH83VBCbAdu
         goJICTbga32/UfVYH8wYZ++kes52zX8FZ9n+J4X2tVIDHtXph7vWhH3Sdy3/ac+N0gLL
         QF4VIgi0rSHUjnd2JeduZmIXgHOJ0cP6jLevYxC0RoR/YF0H+rnSP7Sv0Qpp3Car3qu6
         xuxOa9MK+sfUbyaPLlfkQDwjIgrp5p6FLw6zdV5GyV5j6j4E+0FNHtljLxJX0Ano83eC
         CqDUbOud6hE9CpHEMJxE3VgbN9saGYhiB2hxVZBgKda5rFg/FW6u91MqbuOe1DGX9m7L
         ZkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=hNkspN8y6Az5qmOb83P6sKtdMRdvU7PJ73Mw4JKjp8k=;
        b=x0eubvyd14zFt35u0Yvt0v6gG4MGSIab3kcSDlzMD5ENnkelgT5WMlz7BVwPIg4wi0
         ZLMYgcKRmmCOOEKj9A7v+pHapX61cyQw+jPfVQzXSokWp+pfZ/w9tMhmTNjOkREALh8A
         Qel4/peHqNFIK1dn5is8cJI62EHBa7UX01luYH6d5XGK4iFcZV+yME5pI8Q2sHs/3gXu
         3XMxpShPNhe/WgPyQqb+jw1osTTKAUb1ejFvscucth2OMeZDrW8Zi1qWc3sZsf8ksGWg
         v9NVyeYW24bEzwM7dpdZlGUr/o7VXgoJiK7QYLSi1HWsLBVf3MmiAcfVm2MYcy7LsySn
         fDLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AMVwFhO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8-v6si3031380qtc.160.2018.07.13.03.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 03:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AMVwFhO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdvkb-00014X-3X
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 06:56:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdvkQ-00014L-5m
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 06:56:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdvkN-0000fM-5v
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 06:56:26 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:34435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fdvkN-0000f2-0M
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 06:56:23 -0400
Received: by mail-io0-x241.google.com with SMTP id l7-v6so30971936ioj.1
	for <qemu-arm@nongnu.org>; Fri, 13 Jul 2018 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hNkspN8y6Az5qmOb83P6sKtdMRdvU7PJ73Mw4JKjp8k=;
	b=AMVwFhO+TgYGAHejr9y5mpCLnT+3jGrwaFt1yn+hy7iumiC9RO23EwsGHCSgTUWNjD
	crtqY2xtC/PoHdO933V1XStoaMKItreIH8LJBNf6PXwx0sRJX/0nLuja3VDbFes9VVa+
	vkQ6wT/JBvXv6CihzI7+SOC//H83ytYMfYW9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hNkspN8y6Az5qmOb83P6sKtdMRdvU7PJ73Mw4JKjp8k=;
	b=B/HnRZcFJgbfWGjGKbswmKjzo2U4XM27mzav9QeljB+ewjw6kkLPkWYUbCrg3TD0Md
	sENCv0GmEmw8M80J1Qd/a53gvTU7SNvrlEh6nddnvoa0gXgXD1/yuLuBCkg4JI655JKs
	LEnQrM25/SDhLgPTNPEVsyRmNr+cJEd9rXBJelWjRVAA0GwrSfl4eZJZwrJzwebUG1Us
	IDChsH0vDI5v/Je373ExJm/O9lxxSNgNncJeMpGKZcVTbO4pDCBS5N+tvtaA9xrlaqZH
	3WU6whgj7yM5ZAtqXVZ3IjvofT8c9mTD1HQYkKyO+dCo58mVTPhTJ4qEKT/hyFzKGr2f
	IrbA==
X-Gm-Message-State: APt69E04QH+1lryiOxqSfV6EWyqUtmJm+nfk6VTUsSk9cLebVKQASp5I
	OGXdgd6mwU+Cr9R6tYqd7Xx0mQ==
X-Received: by 2002:a6b:c693:: with SMTP id
	w141-v6mr30473757iof.79.1531479381901; 
	Fri, 13 Jul 2018 03:56:21 -0700 (PDT)
Received: from cloudburst.twiddle.net (mac5036d0.tmodns.net. [208.54.80.172])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm2291537ioa.14.2018.07.13.03.56.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 03:56:21 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <453b2e89-9fa5-6bbf-9fdb-32f144949dd1@linaro.org>
Date: Fri, 13 Jul 2018 05:56:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1531470464-21522-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/16] Fix crashes with
 introspection of ARM devices
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MdHEmrdWnxX2

On 07/13/2018 03:27 AM, Thomas Huth wrote:
> v2:
>  - Updated the first patch according to the review feedback from v1
>  - Added more patches with additional fixes
> 
> Thomas Huth (16):
>   qom/object: Add a new function object_initialize_child()
>   hw/core/sysbus: Add a function for creating and attaching an object
>   hw/arm/bcm2836: Fix crash with device_add bcm2837 on unsupported
>     machines
>   hw/arm/armv7: Fix crash when introspecting the "iotkit" device
>   hw/cpu/a15mpcore: Fix introspection problem with the a15mpcore_priv
>     device
>   hw/display/xlnx_dp: Move problematic code from instance_init to
>     realize
>   hw/arm/xlnx-zynqmp: Fix crash when introspecting the "xlnx,zynqmp"
>     device
>   hw/arm/msf2-soc: Fix introspection problem with the "msf2-soc" device
>   hw/cpu/a9mpcore: Fix introspection problems with the "a9mpcore_priv"
>     device
>   hw/arm/fsl-imx6: Fix introspection problems with the "fsl,imx6" device
>   hw/arm/fsl-imx7: Fix introspection problems with the "fsl,imx7" device
>   hw/arm/fsl-imx25: Fix introspection problem with the "fsl,imx25"
>     device
>   hw/arm/fsl-imx31: Fix introspection problem with the "fsl,imx31"
>     device
>   hw/cpu/arm11mpcore: Fix introspection problem with 'arm11mpcore_priv'
>   hw/*/realview: Fix introspection problem with 'realview_mpcore' &
>     'realview_gic'
>   hw/arm/allwinner-a10: Fix introspection problem with 'allwinner-a10'

That is a great cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
