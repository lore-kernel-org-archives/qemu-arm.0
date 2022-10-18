Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2972435ejn;
        Tue, 18 Oct 2022 01:25:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QW7N2jvBhLwqmj2/2TrDHkmh19OvxBVq3w6iwFPi+3lSPFwgVcpOp8G/aaobsCF/30Y9Q
X-Received: by 2002:a25:6e54:0:b0:6c2:645e:6d7b with SMTP id j81-20020a256e54000000b006c2645e6d7bmr1437376ybc.124.1666081556912;
        Tue, 18 Oct 2022 01:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666081556; cv=none;
        d=google.com; s=arc-20160816;
        b=qjT32H0YzW6V1sLDD+F3CHNfIZlZXeKQGnwB642Y1Cp3gAdC6ya3DAhPdZtCiLuq55
         IOKfd01ivzfBxY4OBz1arwKs7L4F3MlgvkHp1N8iK0GSB6qL4lXjVwRB1G49namXwMCx
         iMDkGvHyndrCG0jEwoGrhQxm6Eyfqh8VGCMD1fEHJxNdOGT6y6ZOlx8ZNeHu0MuD26Qa
         dYAgNStYbeC9Yk1nZMfPuxQS6V8LXbBFviL5f++vmnT0Nr6UmlPZMElkXdM4/lJE6uus
         now5M7C3DHMYfBJ0htGGEtjIUsBaHraUBnaDpB0u9vrYbOHCPvErbhxKa4w4eBRs6v0i
         5l3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature:sender
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=RZV2EaUyuf7LDviRdlZ1zghsWBgRjq3ZsAcy/wHuSkU=;
        b=0OpzCabU7bFE9/g2nhYVUWWqU0CA7WKKDWpGxPqOUrN0cSfy88cV8iaByiTxsQ0W92
         eHogIPuEyqUFRZ/35uRsoFcbHXRu+u7iqFQ6d8mM2YaIyHzF+xdk80hwLcRp8NbcTB/b
         bX22991Ce1TEVUrgk5+QIYInGSM67d3GjWwqlTsdeM2sSfl6buhvjXVxe8+NCasnTZQJ
         HeOT5teW+aM6s78FV7lgzoF45CgRs6nNEF+bcDVAIOd842W/LdwnHubFl/OkHdFdPo3Y
         uYdgnQlqU3QA8ZUB/OnFx0qatDQPwOPqzcYLy6+7iLOk8zUNRmzZI7ZZhLJV0VsJBxL9
         bTTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="3Km7LjD/";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id g11-20020a25200b000000b006c0f68b83fbsi8587757ybg.145.2022.10.18.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 01:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="3Km7LjD/";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.424788.672484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhuC-0004dA-Iu; Tue, 18 Oct 2022 08:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424788.672484; Tue, 18 Oct 2022 08:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okhuC-0004d3-GB; Tue, 18 Oct 2022 08:24:56 +0000
Received: by outflank-mailman (input) for mailman id 424788;
 Tue, 18 Oct 2022 08:24:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okhuA-0004cj-Qn
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 08:24:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okhu7-0004Wl-Aa; Tue, 18 Oct 2022 08:24:51 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okhu6-0006Sw-SW; Tue, 18 Oct 2022 08:24:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=RZV2EaUyuf7LDviRdlZ1zghsWBgRjq3ZsAcy/wHuSkU=; b=3Km7LjD/BOVMIq0yts/6nebgii
	slQfESAWAaNb0YGu5FfAHfeY++Wbav9WaOtjsB/8e8aog/HiWUbLZIbBkDYAAazGc8h9TI032O3fK
	2SKxbgaEPUgOlmKfCdeWfTU5NplIGHeRUiWa8oXIOliI2OBXvvW/LW48mUWuBQQkTwR0=;
Message-ID: <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
Date: Tue, 18 Oct 2022 09:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
In-Reply-To: <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: X43frDtyH4tz

Hi Stefano,

On 18/10/2022 02:26, Stefano Stabellini wrote:
> On Sun, 16 Oct 2022, Julien Grall wrote:
>> Hi,
>>
>> There seem to be some missing patches on xen-devel (including the cover
>> letter). Is that expected?
>>
>> On 15/10/2022 06:07, Vikram Garhwal wrote:
>>> Add a new machine xenpv which creates a IOREQ server to register/connect
>>> with
>>> Xen Hypervisor.
>>
>> I don't like the name 'xenpv' because it doesn't convey the fact that some of
>> the HW may be emulated rather than para-virtualized. In fact one may only want
>> to use for emulating devices.
>>
>> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen' to
>> select a Xen layout.
> 
> The benefit of 'xenpv' is that it doesn't require any changes to libxl.

I am quite surprised. Looking at the code, it seems to work more by 
chance than it is intentional as the code is gated by 
libxl__need_xenpv_qemu(). So it would not start if there were no 
emulated devices.

> It is even backward compatible so it could be used with an older version
> of Xen/libxl.
We don't really gain much here. IOREQ is a tech preview and anyone that 
wants to try it should really use the latest Xen.

> Backward compatibility aside, if we come up with a
> different name then we'll need changes to libxl and to manage those
> changes. For instance, if we use 'xen-arm' that would mean we would need
> to handle per-arch QEMU machine names.

Right, so the main argument here is for simplicity in libxl
Looking at how 'xenpv' is built, this is really expected to deal with PV 
backend rather than emulated device. I do expect some changes as we go 
along to be able to add emulated device.

Furthermore, libxl is not the only toolstack out. So I am not convinced 
this is a good argument to keep the name the same.

Cheers,

-- 
Julien Grall
