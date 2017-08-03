Received: by 10.25.221.202 with SMTP id w71csp782520lfi;
        Thu, 3 Aug 2017 08:24:23 -0700 (PDT)
X-Received: by 10.55.150.133 with SMTP id y127mr3034458qkd.200.1501773863816;
        Thu, 03 Aug 2017 08:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501773863; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff23bC+kwmWYG6RgNtyfoC/FR2IO+6GxFYEz+EUzRhn4bjf4cjeltOL4eEQIWMcCz6
         NkH/KF3rAFJm0ZyGD7wPPpIVN2xTK7si4xuOECybIT6oHLjbc140hbsU8ICKnzlDzeBb
         6aEclF491nrUoh8bDF1xXh5vmngoYBogobmjdm/UkadoF0gRU/5LkidNsfPtq6ODvMmo
         ofLrhdGc5FR5aKKtWp7WW89Nwm3Xzh1osQMQG0tmSCqM3/9tEJ6ZGOJVFZak0Bqz/Ebk
         ky1exdnHR0nHWcJwJrN6ODTg8JdQOggVCZk5HmH2V8zKnGIGgIuasJBstBCbaMHUc5WL
         guVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=qRPVjyN+wcN6mr8C0GhPONlM0NM8dRkXv/0aM7mxvqA=;
        b=lAmc3AUSaGJ595hEtkbley9kTQQ7WMeo01FGWAe2f7kzwYIPCOHdzVxNdRSfuWRl2l
         ZJEDjbJi7kxCA2UDLhw1mt9sMGVOHZya3I/haVXr9Fb+mTD9S5VKi6KPaQcrWQjuNi7O
         OYo6o0tkI87fp8uD7R6ufiuhSGn/Ug655v9xI+DLagOTfII7VguXKriY/O0wxdFGMXzT
         y+duv1QPBdDUh5fLuLCYi+u+FFW+nPfOMC+5kQ9xZ7rU+tx4CX8OTlpvCnk0TUTDwOBP
         R4gcWlTa8hvCBoenIBG3sfSTAfhuqL9SF9MEr0ErzAGhqLDKs1drxBgL+S8ILmPVXF96
         855g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=fdykiQho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16si33160186qkk.171.2017.08.03.08.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=fdykiQho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddHz3-0000h3-9B
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddHyz-0000gQ-In
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddHyu-00080H-MJ
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:24:17 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddHyu-0007xk-FU; Thu, 03 Aug 2017 11:24:12 -0400
Received: by mail-lf0-x242.google.com with SMTP id 65so1177397lfa.0;
	Thu, 03 Aug 2017 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qRPVjyN+wcN6mr8C0GhPONlM0NM8dRkXv/0aM7mxvqA=;
	b=fdykiQho85X4VdPjwgMllD0pTb/bvHfCq1YlJWwnZ62BfKkbr7VD04jrWgKP4G7zp6
	yRhPtXdNzjOwdL1rvItgkYyVQ5C0RB4dBX5ZQ1t8jIxX+7axkuciMkMQ7yGTq7BHwZ1K
	nXj6iJexphgYbAXXjkAcHLJOiEPsitBYr8FecPEOfcVNjiyc6NaIV/hvoHyitbSzBrzK
	DQATsUbmb+X7EQj9pc8PWMQSl/fNbsfQzmEyZKCwYJy2lyeA8+MksVKiphQ7E1wwCRaU
	wQWdeb/Fy3+26lSE1O+k+CGKDAFRJsmaaZXl1Pzq/RX/IEnemtklKrKgyrw0qt3mugUE
	gtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qRPVjyN+wcN6mr8C0GhPONlM0NM8dRkXv/0aM7mxvqA=;
	b=gZaOTSWoLaLSPC73Xwrrsp2d4qhKnBCItgpvcouw8gVdCQ/tVyrddmYQogz8w4Rzpo
	Wkbytm0GduIDkI6NnB/bQbQ7r1CmfPQegZ4Yfuj5nzY1Hq/1tRhpRyDHOaKay+RDkJv3
	lI6j9bdbqDTfemOLIfyyOhgwJyNHspaTOasumn7mYiQ72DIWgy73ICdqdQRlK18CU8Tr
	Axj8OFF8jWmrjcZhAoFv8k0UUQoDhf7dLy9C4ha2g+Z4KzCtapbcZ9HCRkaF0azVkjTT
	qDi5DAMZbgDJOESao53HQDvjEK4Sok0nRTq0fuNrEz2g4NEblOdjMFS0lSP2x4OgK0kq
	rDSw==
X-Gm-Message-State: AIVw1122CZ1qsjw9QNHCygi2sNgzBviwK+IZKuAwkLdttJwsCMUBJ3AV
	mRy7Wt733AfbYQ==
X-Received: by 10.46.88.65 with SMTP id x1mr968208ljd.162.1501773850063;
	Thu, 03 Aug 2017 08:24:10 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id g41sm445234lji.94.2017.08.03.08.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:24:09 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:24:08 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803152408.GO4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 06/15] target/arm: Remove incorrect comment
 about MPU_CTRL
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
X-TUID: BUk0XgSvVI5s

On Wed, Aug 02, 2017 at 05:43:52PM +0100, Peter Maydell wrote:
> Remove the comment that claims that some MPU_CTRL bits are stored
> in sctlr_el[1]. This has never been true since MPU_CTRL was added
> in commit 29c483a50607 -- the comment is a leftover from
> Michael Davidsaver's original implementation, which I modified
> not to use sctlr_el[1]; I forgot to delete the comment then.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b39d64a..b64474c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -416,7 +416,7 @@ typedef struct CPUARMState {
>          uint32_t dfsr; /* Debug Fault Status Register */
>          uint32_t mmfar; /* MemManage Fault Address */
>          uint32_t bfar; /* BusFault Address */
> -        unsigned mpu_ctrl; /* MPU_CTRL (some bits kept in sctlr_el[1]) */
> +        unsigned mpu_ctrl; /* MPU_CTRL */
>          int exception;
>      } v7m;
>  
> -- 
> 2.7.4
> 
> 
