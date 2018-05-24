Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1894187wre;
        Thu, 24 May 2018 06:59:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIyYlDm2bNcaYnQj1kSxZ/N0xNn5cHKA2hg/lKT5IoHhNUocK50C4lcLStM9blJmFYUnTGB
X-Received: by 2002:a37:8484:: with SMTP id g126-v6mr6878561qkd.273.1527170385589;
        Thu, 24 May 2018 06:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527170385; cv=none;
        d=google.com; s=arc-20160816;
        b=WgrLz/lzQL5uPAYP2H8eszKOiYdAHcWAlwi0ekt22dLWOLg2WUFvWYWcqCot7LgERo
         qesxD4o+3IsAdaBpigqnQtZhv/je+7FviTtdZSaHRf11tzwHgZKT7FYdTybkjvx9669U
         RnpN+S5jQta/z18blWqw/CN8u8NoAaqZX2f+dpg14joj0ywtAJmzlCkZVd6Vqltl+VTL
         hCQQ3slCA6DLOVf880mn/rxNG9TufQxBUCyfgIlZdYQ7pyWEkms7pQdhFsAHz1Z2I9Jf
         kZC3AkUVfYMGMPrg9LfcfzfSO7eIxp+kq7B8OU9gjJR/1QuXQJVxosfhK4bDvraCOHV5
         zPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=lo324QGhyMwWfsxWjVujk1fgKkWdWAaMHtrN+6POIGk=;
        b=X8mDd7PDDMuXV/APtGwjOYKr0CjrelOmtiS9S2qhxxOi4+OEi6zb6O3K3n6ldYRkQl
         A4JwK1LM2AHeuBKzc1LkvRl/w7/vlRyTvAsBrv9VC2O/aZjkLnwsTvBmULBbXbG0pw55
         9nttPDPsuMZyhk2GBQ53VHy7tRioOTRGTO8hkOfqSFISv8cFHu7WQkz/t1HWHuBFxNCo
         z6dstv+jc4H3cZRCZT4sx2P+oqqCD++cURX31iSF0a+HWMdxUR6vvqXaSWOx8XGC29yg
         EfgWlDYD3EGCo3KDNG/s1tUpf5PcG6fOKIHL2NdIzQSeDS73K0orOZxzusmnjiCcJWIa
         qXSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y55-v6si3334331qtc.117.2018.05.24.06.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLqmP-0005IN-46
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:59:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLqmE-0005En-3S
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLqm8-0005yR-JS
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:59:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50452 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLqm8-0005y7-EA; Thu, 24 May 2018 09:59:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C52BE7D83A;
	Thu, 24 May 2018 13:59:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E55DE2026DEF;
	Thu, 24 May 2018 13:59:26 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
Date: Thu, 24 May 2018 15:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 24 May 2018 13:59:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 24 May 2018 13:59:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm:
 kvm_dist_get/put: skip the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScH8JbJU8zGD

Hi,

On 05/24/2018 03:14 PM, Peter Maydell wrote:
> On 24 May 2018 at 10:04, Auger Eric <eric.auger@redhat.com> wrote:
>> Now I am unclear about the semantics of the s->gicd_ipriority & friends.
>> With that change, is it supposed to contain only the states of SPIs or
>> contain the RAZ states of PPI/SGIs + states of SPIs. The array is
>> dimensionned to contain states for PPI/SGI+SPIs, right? In other words,
>> shouldn't we also shift field?
> 
> The semantics of the gicd_ipriority and other data structures are
> set by the TCG GIC implementation, and include blank space at
> the start where the PPI/SGI bits would live. See this comment
> from arm_gicv3_common.h:
> 
>  * Each bitmap contains a bit for each interrupt. Although there is
>  * space for the PPIs and SGIs, those bits (the first 32) are never
>  * used as that state lives in the redistributor. The unused bits are
>  * provided purely so that interrupt X's state is always in bit X; this
>  * avoids bugs where we forget to subtract GIC_INTERNAL from an
>  * interrupt number.

If I understand Shannon's code correctly, the space for PPIs/SGIs is
currently overwritten by SPI state, hence my comment. If we stick to the
current semantics, can't we just add the last missing 32 SPI states and
we don't need the subsection?

Thanks

Eric
> 
> thanks
> -- PMM
> 
