Received: by 10.25.221.202 with SMTP id w71csp1130314lfi;
        Thu, 3 Aug 2017 13:40:17 -0700 (PDT)
X-Received: by 10.200.50.242 with SMTP id a47mr105651qtb.91.1501792817376;
        Thu, 03 Aug 2017 13:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501792817; cv=none;
        d=google.com; s=arc-20160816;
        b=gxDlQT6Ynz7fiVVQ+DxcqGYOVSdAf1ohXG178HJXFYvF2p1QywwKjfVYa/6gLSxMfP
         nUcYSHxI8ml4iIPne3lUlq5qLiKo9rvzHijnVNpw566nJFQVcBWdMD+vXLRW70GvxHCH
         nnbleYV3iZnCwg9CKis1iYUcHA6u8C6kr300OMwJmOg7HNhzOjQ0ms3gQH8aJ1vrkkYu
         oCFa+P+r9ICR5at9UaTCCOXkxQ5EdnjXWMEY82YbbOUm0XMrGQx/tHsAUTgdlgdFgYTv
         yD+qaTnpKNXWN9W3DcmAa93DrrVzEBKwYYCntmc9kGMTtpFwVUAu8zgbZ9BYMo7mQlKT
         ZGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=MlCfXOfsXZy8M+dj6JePXXybU/Z1rfXgXmiwd/ExM2o=;
        b=rwqEgeGSAti7KliKPMKcVXNZgmt2Y86OwWkY5ziU8EAhj1winb62ymgp91Ze5xcyvV
         862FZdON33HCciqF5WSMVkyVtttHd9OCVe42BHrSu7mrD04Yb1in6i2Xu78qyxSByKPO
         cV4HA9YZoj4BoWse640QX5dhSDikDdgEbLF0giG5N/7z5pRLPjyIpzKFpI6fd/OhIWHZ
         YV5zsrVVOKKuQ0Cv8e3+4w/d0/Br5SiREm7ZRObB2bUJVj0UoChj+HmCsHtiFVjmpnJk
         xAtXNtROefqnfMeqfuoDuQr6rh/ZBcEdj+7ngcXqirZqq9iF8UUgw4ZnQ9S1CneRd9kx
         AeiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=rlnC6RNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k190si32047493qkc.164.2017.08.03.13.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=rlnC6RNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddMuk-0004Ug-Qw
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:40:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddMuf-0004RF-CT
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddMuc-0002KN-Hz
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:40:09 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddMuc-0002Hm-92; Thu, 03 Aug 2017 16:40:06 -0400
Received: by mail-lf0-x242.google.com with SMTP id 65so1689792lfa.0;
	Thu, 03 Aug 2017 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MlCfXOfsXZy8M+dj6JePXXybU/Z1rfXgXmiwd/ExM2o=;
	b=rlnC6RNxiXWj3aCEJZAYBkZmTTSB4ugxIY0ujnmuxovYm3xnfGE3Cho+kB7h1LDHc3
	A2frwoRMQtTDKvJw9fl8QCeBdFQnc00/5syliSesE0QaZ2pM3c8SJU9K86h/KmqnkyQv
	klqY2IVGJxKVQrwiPx2X+8jRccL05HH2C4pxmvRRw2xjCESz7uJo5f8Uxk/EDbFVgkvY
	aldNvnYxgHC+3nLmFjEs6bdaIWFKth2yKvrHK7wg4DpMVLUkFu44lY8W3arlVgtEmVdJ
	pbTqZYSaHmYIugo5lVRP+1A1m2IdbxJAGwo++k8FWKrVHouXubOyzx6KT1vzOrtD2D6j
	CyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MlCfXOfsXZy8M+dj6JePXXybU/Z1rfXgXmiwd/ExM2o=;
	b=NYS47u1oK60H1KXZdq7gna0gG532VZWd3SMCFmGNJVY2bl5AzTyVxja4xgss9zkadv
	vyNp5ghU0xTQ7+tkm4JXADijW+MlN8C2wfcv8yasRyiWjallae9K0eDBctmhs8iPV3dw
	om3wJ+qFLwWZHZUftrhaVsRmRC+ujX+sHPDJWTQEJMHHCPKTJPOunLyq9Fn+UV7lr8ng
	0PHSUSO+rzj47k/Z0Gq3jJ8vsdUqZT1ryay5P44qtGl+Ryh/lK4A/DTh9MrIT5PbZrn+
	MS3JVe1b7TUKRdm864VVTYkezsqC4/VbbDjr2hQHzTpVV9yTSRN9CzoBL14A82IT67bT
	3xjQ==
X-Gm-Message-State: AHYfb5iJGJ7rf8E8m4a5z9sfLwgVZypJ9msOMsknj9jI4P5j0I5aawoA
	6WJDy9GCiEZ1qw==
X-Received: by 10.25.201.216 with SMTP id z207mr19143lff.206.1501792803172;
	Thu, 03 Aug 2017 13:40:03 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	k70sm2231468lfe.73.2017.08.03.13.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 13:40:02 -0700 (PDT)
Date: Thu, 3 Aug 2017 22:40:01 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20170803204001.GX4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
	<3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] target/arm: Don't trap
 WFI/WFE for M profile
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M0qssn4qXUBG

On Thu, Aug 03, 2017 at 01:28:28PM -0700, Richard Henderson wrote:
> On 08/02/2017 09:43 AM, Peter Maydell wrote:
> > M profile cores can never trap on WFI or WFE instructions. Check for
> > M profile in check_wfx_trap() to ensure this.
> > 
> > The existing code will do the right thing for v7M cores because
> > the hcr_el2 and scr_el3 registers will be all-zeroes and so we
> > won't attempt to trap, but when we start setting ARM_FEATURE_V8
> > for v8M cores the v8A handling of SCTLR.nTWE and .nTWI will not
> > give the right results.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/op_helper.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> While looking at this, I think there's an error in helper_wfi.  The early exit
> for cpu_has_work should happen after the exception check.

I don't have the spec at hand but IIRC the trap should only happen
if the processor would have entered the low-power state (i.e if
there's no work).

A comment in the code would probably be good...

Cheers,
Edgar 
