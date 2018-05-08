Received: by 10.28.4.212 with SMTP id 203csp3999200wme;
        Tue, 8 May 2018 03:37:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZofQ/SVwIXT5wjOk35owOe+pJ1lrLOHaCJdJWJFnRq32+VQzt7GYU1wYwRY3M91mZxuJOXU
X-Received: by 10.55.0.129 with SMTP id t1mr33383338qkg.31.1525775878206;
        Tue, 08 May 2018 03:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525775878; cv=none;
        d=google.com; s=arc-20160816;
        b=Lr3szC/ryLBhns1Cch394fPMBq7x9TWH8Qq7C/9zUSpQKUKvnJgdPZNYhP1jj5Ho8O
         cfr7ksprJ6pw27I0GDgdLLk7K5cD8AYw1g6qnHEVa9LP6dgeUS0lAW+DPc+taV/o4tSA
         iJLAWKErie56UvtT/FpAQW2bOzrF+Aaw1bJMtc1ehMrwGbX7kUJkisxXVsNvUjvfsGI5
         fbIXPRHF3ULJj36+mRZPuo+bbjnD9CuOR6j8dd1qUBqyGDaK+wyMZaVAPSXJmRWSpSI0
         FBod1++aJn2Vp5AdUlG5MvsowTk6auzsn+4Azys8Fy1lIAKdvtcjJ3xlHNgVSnccOIGf
         7StQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=bL795vigzsuOW9LbMcZdY+wecVg1Gxf15dSzUMvYvvY=;
        b=gpOuz3rzwy77SMbiICyrWlpCH/iYULgK12lHMV1EC133wDWOGGnH9oKu4dLuzqI88y
         3+9WwWe7F74DiExv/33d4K0WVFj7m46TuAEth36+84GrY8FcySIirk5DvcFaEv6YWrhn
         RunTxKplI0obyL4/Y/nkq/ksLlpGzGbR3NSLets7tH5gXBXduajHN3IVHzRnv2a87JXR
         Mn3mG1fM49xSqm3f34lTjfwgynGEYz4KKzzG3oImeQEFd5T+mgUs12KDRAklQFvlf0Wt
         JDRDTJW3LAVJvSBXy+sFbS0X75UoLt6HLHJKhEL0jRVLSkJ66S8Bc4F3EoYkjs8ju/9F
         qdJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si1590057qkf.290.2018.05.08.03.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 03:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG00L-0002HW-LG
	for alex.bennee@linaro.org; Tue, 08 May 2018 06:37:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1fG007-0002Fa-Me
	for qemu-arm@nongnu.org; Tue, 08 May 2018 06:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1fG003-0000X2-R2
	for qemu-arm@nongnu.org; Tue, 08 May 2018 06:37:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56258 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1fG003-0000Wn-Lw; Tue, 08 May 2018 06:37:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EAF68DC4E;
	Tue,  8 May 2018 10:37:39 +0000 (UTC)
Received: from xz-mi (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BFC12017F00;
	Tue,  8 May 2018 10:37:36 +0000 (UTC)
Date: Tue, 8 May 2018 18:37:34 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180508103734.GB19024@xz-mi>
References: <20180427110137.19304-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180427110137.19304-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 08 May 2018 10:37:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 08 May 2018 10:37:39 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/iotkit.c: fix minor
 memory leak
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FiJrP7f0kaH/

On Fri, Apr 27, 2018 at 12:01:37PM +0100, Peter Maydell wrote:
> Coverity (CID1390573) spots that we forgot to free the
> gpioname strings in a loop in the iotkit realize function.
> Correct the error.
> 
> This isn't a significant leak, because this function
> only ever runs once.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I believe this even does not require ARM knowledges, so:

Reviewed-by: Peter Xu <peterx@redhat.com>

> ---
>  hw/arm/iotkit.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index c5f0a5b98a..234185e8f7 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -517,6 +517,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                                qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), i));
>          qdev_connect_gpio_out_named(DEVICE(ppc), "irq", 0,
>                                      qdev_get_gpio_in(devs, 0));
> +        g_free(gpioname);
>      }
>  
>      iotkit_forward_sec_resp_cfg(s);
> -- 
> 2.17.0
> 
> 

-- 
Peter Xu
